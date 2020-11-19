From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:49 +0100
Subject: [Buildroot] [PATCH next 04/12]
 support/download/post-process-helpers: add helper function for post process
 scripts
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

download post process scripts will often need to unpack the source
code tarball, do some operation, and then repack it. In order to help
with this, post-process-helpers provide an unpack() function and a
repack() function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/post-process-helpers | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 support/download/post-process-helpers

diff --git a/support/download/post-process-helpers b/support/download/post-process-helpers
new file mode 100644
index 0000000000..bed8df2577
--- /dev/null
+++ b/support/download/post-process-helpers
@@ -0,0 +1,30 @@
+
+unpack() {
+        dest="$1"
+        tarball="$2"
+
+        mkdir ${dest}
+        tar -C ${dest} --strip-components=1 -xf ${tarball}
+}
+
+repack() {
+        src="$1"
+        tarball="$2"
+
+        # Generate the archive, sort with the C locale so that it is reproducible.
+        find "$(basename ${src})" -not -type d -print0 >files.list
+        LC_ALL=C sort -z <files.list >files.list.sorted
+
+        # let's use a fixed hardcoded date to be reproducible
+        date="2020-02-06 01:02:03 +0000"
+
+        # Create GNU-format tarballs, since that's the format of the tarballs on
+        # sources.buildroot.org and used in the *.hash files
+        tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
+            --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
+        gzip -6 -n <new.tar >new.tar.gz
+        mv "${tarball}" "${tarball}".old
+        mv new.tar.gz "${tarball}"
+        rm "${tarball}".old
+        rm -rf ${src}
+}
-- 
2.28.0
