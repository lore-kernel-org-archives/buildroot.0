From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 18 Oct 2013 22:31:35 +0200
Subject: [Buildroot] [PATCH 11/12] manual: faq-troubleshooting.txt: add tips
	to avoid toolchain build
In-Reply-To: <cover.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
Message-ID: <e1f536fd5fd9c6139450832eba41887e6c7f717b.1382127504.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new FAQ entry explains how speed-up the build time by avoiding to
build the toolchain (only useful when using the internal Buildroot
toolchain backend); especially how to use a toolchain built by Buildroot
as an external one.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/faq-troubleshooting.txt | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 4e0612b..e86f73c 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -111,3 +111,70 @@ directory as the new root, will most likely fail.
 If you want to run the target filesystem inside a chroot, or as an NFS
 root, then use the tarball image generated in +images/+ and extract it
 as root.
+
+[[faq-how-to-avoid-rebuild-buildroot-toochain]]
+How to avoid rebuilding toolchain after +make clean+?
+-----------------------------------------------------
+
+Buildroot only builds the toolchain from sources when using the
+internal Buildroot toolchain backend.
+When the external toolchain backend is used, Buildroot just used it
+and populate the sysroot and the target tree by copying files from
+the toolchain.
+
+So, the easiest way to avoid rebuilding the toolchain is feeding a
+prebuilt one to the external toolchain backend.
+
+If you want to build and use your own toolchain, we recommend to use
+http://crosstool-ng.org[Crosstool-NG] to do so. Then just feed it as
+the prebuilt toolchain to the Buildroot's external toolchain backend.
+
+Otherwise, to avoid rebuilding the toolchain after executing +make
+clean+ (when using the internal Buildroot toolchain backend), you can
+build the toolchain in one location, then use this prebuilt toolchain.
+To do so, you can build the toolchain in some place, then use this
+prebuilt toolchain as an external toolchain in another Buildroot
+configuration. This section gives step-by-step instructions about how
+to do that:
+
+1. Configure the toolchain using the internal Buildroot toolchain
+   backend to meet your needs:
++
+---------------------------------------
+make O=/path/to/somewhere menuconfig
+---------------------------------------
++
+1. Build the toolchain:
++
+---------------------------------------
+make O=/path/to/somewhere toolchain
+---------------------------------------
++
+1. Configure target configuration using the prebuilt toolchain as an
+   'external toolchain':
++
+---------------------------------------
+make O=/path/to/somewhere_else menuconfig
+---------------------------------------
++
+In the 'Toolchain' menu, set:
++
+* 'Toolchain type': +External toolchain+ (+BR2_TOOLCHAIN_EXTERNAL+)
+* 'Toolchain': +Custom toolchain+ (+BR2_TOOLCHAIN_EXTERNAL_CUSTOM+)
+* 'Toolchain origin': +Pre-installed toolchain+
+  (+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED+)
+* 'Toolchain path': +/path/to/somewhere/host/usr+
+  (+BR2_TOOLCHAIN_EXTERNAL_PATH+)
+* and set the external toolchain properties according to the ones set
+  for the prebuilt toolchain.
++
+1. Build the target binaries:
++
+---------------------------------------
+make O=/path/to/somewhere_else
+---------------------------------------
+
+Note that toolchains built using the internal Buildroot toolchain
+backend are *not* relocatable, so if you plan to use these toolchains
+on different machines, you will *have to* install it in the same
+location (i.e.: in +/path/to/somewhere+) on every machine.
-- 
1.8.4.1
