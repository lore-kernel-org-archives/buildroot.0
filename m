From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Apr 2016 23:38:30 +0200
Subject: [Buildroot] [PATCH v8 13/14] support/scripts/check-host-leaks: add
	option to classify leaks
In-Reply-To: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1460929111-15615-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v7->v8:
- new patch. Move this feature in its own change-set as it seems a bit
  controversial.
- make leaks classification optional
---
 support/scripts/check-host-leaks | 59 ++++++++++++++++++++++++++++++++++++++--
 support/scripts/shell/readelf.sh |  1 -
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/support/scripts/check-host-leaks b/support/scripts/check-host-leaks
index 9f363af..bd92493 100755
--- a/support/scripts/check-host-leaks
+++ b/support/scripts/check-host-leaks
@@ -45,6 +45,12 @@ Options:
                 Can be set more than once.
                 An excluded path must be an absolute canonical path.
 
+        --classify-leaks
+                Enables leak classification. Categories are defined according to
+                the matched files' type or ELF kinds.
+                For ELF files, the sections containing the leaks will displayed.
+                Enabling this option substantially increases the execution time
+                of the script.
 
 EOF
   return ${ret}
@@ -56,9 +62,51 @@ source.load_module log
 source.load_module utils
 source.load_module sdk
 
+classify_leak() {
+    local f="${1}" regexp="${2}"
+    local leak
+    if test -h "${f}" ; then leak="symlink"
+    elif readelf.is_elf "${f}" ; then
+        if readelf.is_elf_executable "${f}" ; then leak="ELF/exe"
+        elif readelf.is_elf_shared_object "${f}" ; then leak="ELF/*.so"
+        elif readelf.is_elf_static_library "${f}" ; then leak="ELF/*.a"
+        elif readelf.is_elf_object "${f}" ; then
+            case "${f}" in
+                *.ko) leak="ELF/*.ko" ;;
+                *) leak="ELF/*.o" ;;
+            esac
+        else leak="ELF/?"
+        fi
+        local section
+        local sections=()
+        for section in $(readelf.list_sections "${f}") ; do
+            if readelf.string_section "${f}" "${section}" |
+                    grep -qaE "${regexp}" ; then
+                if ! utils.list_has ${section} ${sections[@]} ; then
+                    sections+=( "${section}" )
+                fi
+            fi
+        done
+        leak="${leak} [${sections[*]}]"
+    else
+        case "${f}" in
+            *-config) leak="*-config script" ;;
+            *.la) leak="*.la" ;;
+            *.pc) leak="*.pc" ;;
+            *.py) leak="*.py" ;;
+            *.pyc|*.pyo) leak="*.py[co]" ;;
+        esac
+    fi
+    if test -z "${leak}" ; then
+        leak="? [$(file -z "${f}" | sed -e 's/.*: //')]"
+    fi
+    printf "${leak}"
+}
+
+
 main() {
     local root_dir
-    local class_leaks
+    local classify_leaks
     local excluded=()
     local leak_paths=()
     while test ${#} -gt 0 ; do
@@ -67,6 +115,8 @@ main() {
                 ;;
             --exclude)   shift ; excluded+=( "${1}" )
                 ;;
+            --classify-leaks) classify_leaks=y
+                ;;
             -h|--help)
                 usage
                 exit 0
@@ -119,7 +169,12 @@ main() {
     grep -raEl "${re_leaks}" . |
         sed -re "${re_excl} ; s:^\.:${root_dir}:" |
         while read f ; do
-            printf "%s\n" "${f}"
+            if test -n "${classify_leaks}" ; then
+                local leak="$(classify_leak "${f}" "${regexp}")"
+                printf "%-70s : %-120s\n" "${leak}" "${f}"
+            else
+                printf "%s\n" "${f}"
+            fi
         done | sort
     popd >/dev/null
 }
diff --git a/support/scripts/shell/readelf.sh b/support/scripts/shell/readelf.sh
index 87599bb..acb522f 100644
--- a/support/scripts/shell/readelf.sh
+++ b/support/scripts/shell/readelf.sh
@@ -54,7 +54,6 @@ source.declare_module readelf
 # environment:
 #   READELF: readelf program path
 readelf._match_elf_regexp() {
-    log._trace_func
     local regexp="${1}" file="${2}"
     LC_ALL=C ${READELF} -h "${file}" 2>/dev/null | grep -qE "${regexp}"
 }
-- 
2.8.0
