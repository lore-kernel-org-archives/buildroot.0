From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 22:48:14 +0100
Subject: [Buildroot] [PATCH v2 2/3] test-pkg: test a subset of toolchains by
 default, add -a and -n options
In-Reply-To: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

During the latest Buildroot Developers meeting, we discussed that
test-pkg would perhaps be more widely used if it tested a smaller
subset of toolchains. Indeed, it currently tests 47 toolchains, which
takes very long to build. Several of the toolchain configurations are
quite similar, and it is perhaps not necessary for contributors to
test them all before submitting a package.

Therefore, this commit changes the test-pkg script to only test a
subset of the toolchain configurations by default. The N first
configurations of the CSV files are tested, where N is hard-coded in
the script. The CSV file has therefore been re-organized to have the
first N toolchains be the most important ones.

A -a/--all option is added to test with all toolchains, while a
-n/--number option is added to test with the first N toolchains, N
being passed on the command line.

Note that the list of toolchains (built in the "toolchains" shell
variable) is no longer sorted. Indeed, when the first N toolchains are
tested, we want them to be tested in the same order as they are listed
in the CSV file, as we are careful to order them in an interesting
order. We only sort when all toolchains are tested.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
- Keep alphabetic sorting in the definition of the 'o' variable that
  contains the list of short options. Suggested by Yann E. Morin. 'h'
  for help remains a special case and therefore remains at the first
  position.
- Keep alphabetic sorting when handling options. Here as well, --help
  remains first, as it already was. Suggested by Yann E. Morin.
- Use spaces and not tabs for indentation. Suggested by Yann E. Morin.
---
 utils/test-pkg | 56 +++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index cd7b9dad7b..2e069b6005 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -5,28 +5,37 @@ TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_dir toolchain
+    local cfg dir pkg random toolchains_dir toolchain all number mode
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
 
-    o='hc:d:p:r:t:'
+    o='hac:d:n:p:r:t:'
     O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
     random=0
+    all=0
+    number=0
+    mode=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
             help; exit 0
             ;;
+        (-a|--all)
+            all=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
         (-d|--build-dir)
             dir="${2}"; shift 2
             ;;
+        (-n|--number)
+            number="${2}"; shift 2
+            ;;
         (-p|--package)
             pkg="${2}"; shift 2
             ;;
@@ -51,15 +60,37 @@ main() {
         dir="${HOME}/br-test-pkg"
     fi
 
+    if [ ${random} -gt 0 ]; then
+        mode=$((mode+1))
+    fi
+
+    if [ ${number} -gt 0 ]; then
+        mode=$((mode+1))
+    fi
+
+    if [ ${all} -eq 1 ]; then
+        mode=$((mode+1))
+    fi
+
+    # Default mode is to test the N first toolchains, which have been
+    # chosen to be a good selection of toolchains.
+    if [ ${mode} -eq 0 ] ; then
+        number=7
+    elif [ ${mode} -gt 1 ] ; then
+        printf "error: --all, --number and --random are mutually exclusive\n" >&2; exit 1
+    fi
+
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
     toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
-                   else
-                      cat
-                   fi |sort
+                  elif [ ${number} -gt 0 ]; then \
+                      head -n ${number}
+                  else
+                      sort
+                  fi
                  )
                )
 
@@ -154,6 +185,10 @@ toolchain config fragment and the required host architecture, separated by a
 comma. The config fragments should contain only the toolchain and architecture
 settings.
 
+By default, a useful subset of toolchains is tested. If needed, all
+toolchains can be tested (-a), an arbitrary number of toolchains (-n
+in order, -r for random).
+
 Options:
 
     -h, --help
@@ -170,9 +205,16 @@ Options:
         Test-build the package PKG, by running 'make PKG'; if not specified,
         just runs 'make'.
 
+    -a, --all
+        Test all toolchains, instead of the default subset defined by
+        Buildroot developers.
+
+    -n N, --number N
+        Test N toolchains, in the order defined in the toolchain CSV
+        file.
+
     -r N, --random N
-        Limit the tests to the N randomly selected toolchains, instead of
-        building with all toolchains.
+        Limit the tests to the N randomly selected toolchains.
 
     -t CSVFILE, --toolchains-csv CSVFILE
         CSV file containing the paths to config fragments of toolchains to
-- 
2.14.3
