From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Mar 2020 21:21:11 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/xen: explicitly
 disable checkpolicy logic
Message-ID: <20200305200937.8CB0081090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7f4ab8fae0537d31e8046f0abcbb1c21a4d6a2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/14af2dc3219847a92c6ec2db14ba387159b61fde

The Xen build system builds and embeds a default XSM FLASK (Flux Advanced
Security Kernel) security policy if it detects SELinux checkpolicy on the
build machine.

If enabled, a gen-policy.py python script is used to convert the binary
FLASK policy to a C array initialization list to embed it in the Xen binary.
Depending on the python version and locale available on the host, this fails
with byte values outside the 0..255 range:

policy.c:7:10: error: unsigned conversion from 'int' to 'unsigned char' changes value from '56575' to '255' [-Werror=overflow]
  0xdc8c, 0xdcff, 0x7c, 0xdcf9, 0x08, 0x00, 0x00, 0x00, 0x58, 0x65, 0x6e, 0x46, 0x6c,

To fix this and ensure a consistent build, pass XEN_HAS_CHECKPOLICY=n to
disable the checkpolicy detection.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b60f3e2ae6416c4179b7f6a4028d7f61c6d50526)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index bd8a39f639..92629a3d86 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -26,6 +26,7 @@ XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	HOST_EXTRACFLAGS="-Wno-error" \
+	XEN_HAS_CHECKPOLICY=n \
 	$(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
