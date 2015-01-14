From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:48:13 +0100
Subject: [Buildroot] [PATCHv2] docs/manual: add FAQ entry about speeding up
	the build process
Message-ID: <1421272093-29974-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a very frequently asked question, so let's add a FAQ entry
about it, that we can progressively extend with more advices for our
users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes since v1:

 - Take into account the feedback from Yann, provided in
   http://patchwork.ozlabs.org/patch/397717/. The only place where I
   tend to disagree a bit is on having the download folder on the
   network. It does have an impact, albeit small. So I've changed the
   phrasing to insist on *not* doing an NFS build, and suggesting to
   also have a local download directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/faq-troubleshooting.txt | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index b30b4ac..e24fe9c 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -205,3 +205,37 @@ On this matter, the Buildroot developers make this position statement:
    upgrades by upgrading the entire root filesystem image at once,
    the image deployed to the embedded system is guaranteed to really
    be the one that has been tested and validated.
+
+[[faq-speeding-up-build]]
+=== How to speed-up the build process?
+
+Since Buildroot often involves doing full rebuilds of the entire
+system that can be quite long, we provide below a number of tips to
+help reduce the build time:
+
+ * Use a pre-built external toolchain instead of the default Buildroot
+   internal toolchain. By using a pre-built Linaro toolchain (on ARM)
+   or a Sourcery CodeBench toolchain (for ARM, x86, x86-64, MIPS,
+   etc.), you will save the build time of the toolchain at each
+   complete rebuild, approximately 15 to 20 minutes. Note that
+   temporarily using an external toolchain does not prevent you to
+   switch back to an internal toolchain (that may provide a higher
+   level of customization) once the rest of your system is working;
+
+ * Use the +ccache+ compiler cache (see: xref:ccache[]);
+
+ * Learn about rebuilding only the few packages you actually care
+   about (see xref:rebuild-pkg[]), but beware that sometimes full
+   rebuilds are anyway necessary (see xref:full-rebuild[]);
+
+ * Make sure you are not using a virtual machine for the Linux system
+   used to run Buildroot. Most of the virtual machine technologies are
+   known to cause a significant performance impact on I/O, which is
+   really important for building source code;
+
+ * Make sure that you're using only local files: do not attempt to do
+   a build over NFS, which significantly slows down the build. Having
+   the Buildroot download folder available locally also helps a bit.
+
+ * Buy, or convince your boss to new hardware. SSDs and lots of RAM
+   are key to speeding up the builds.
-- 
2.1.0
