From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 17:17:59 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181226183422.76c6ff6c@windsurf.home>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181226183422.76c6ff6c@windsurf.home>
Message-ID: <20181227171759.0118ff77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 18:34:22 +0100, Thomas Petazzoni wrote:

> So, without per-package directory, we fall in case (2) above.
> 
> With per-package directory, we fall in case (4) above, and therefore
> the RPATH is discarded.
> 
> At this point, I am not sure at which level and how the issue should be
> fixed. Needs some thought. Input/ideas welcome.

So for now, the way I fixed this is by rewriting the RPATH in fix-rpath
so that they don't point to per-package host directories. It is a bit
annoying that we end up rewriting RPATHs twice, but it is the easiest /
most straightforward solution to be able to move forward with the whole
per-package directory stuff.

Here is what I have locally:

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index fa138ca15a..67bf1eb1b3 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -127,14 +127,24 @@ main() {
 
     while read file ; do
         # check if it's an ELF file
-        if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
-            # make files writable if necessary
-            changed=$(chmod -c u+w "${file}")
-            # call patchelf to sanitize the rpath
-            ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
-            # restore the original permission
-            test "${changed}" != "" && chmod u-w "${file}"
+        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
+        if test $? -ne 0 ; then
+            continue
         fi
+
+        # make files writable if necessary
+        changed=$(chmod -c u+w "${file}")
+
+        # rewrite the per-package rpaths
+        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]*/host@${HOST_DIR}@")
+        if test "${rpath}" != "${changed_rpath}" ; then
+            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
+        fi
+
+        # call patchelf to sanitize the rpath
+        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+        # restore the original permission
+        test "${changed}" != "" && chmod u-w "${file}"
     done < <(find "${rootdir}" ${find_args[@]})
 
     # Restore patched patchelf utility

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
