From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 18:09:55 +0200
Subject: [Buildroot] [git commit] package/uftrace: fix build on i386
Message-ID: <20210424154303.CBD7B813CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e15bebd0837a943f98e4dda18cf0c86d259ecbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --arch value on i386 must be "i386", and not i486, i586 or i686,
so let's have a special case for BR2_i386, and use $(BR2_ARCH) for the
other supported CPU architectures.

Fixes:

  http://autobuild.buildroot.net/results/01a28789bcec9af66137cbce5a8fda2d606de99f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uftrace/uftrace.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index f42bbbddaa..7c9b9b1992 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -15,6 +15,12 @@ UFTRACE_CONFIGURE_OPTS = \
 	--without-libncurses \
 	--without-capstone
 
+ifeq ($(BR2_i386),y)
+UFTRACE_ARCH = i386
+else
+UFTRACE_ARCH = $(BR2_ARCH)
+endif
+
 # Only --without-<foo> options are supported.
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 UFTRACE_DEPENDENCIES += elfutils
@@ -37,7 +43,7 @@ define UFTRACE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(UFTRACE_LDFLAGS)" \
 		./configure \
-		--arch=$(BR2_ARCH) \
+		--arch=$(UFTRACE_ARCH) \
 		--prefix=/usr \
 		$(UFTRACE_CONFIGURE_OPTS) \
 		-o $(@D)/.config)
