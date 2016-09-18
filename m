From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 18 Sep 2016 22:11:41 +1200
Subject: [Buildroot] [PATCH] util-linux: add -lcurses to LDFLAGS when static
	linking
Message-ID: <20160918101141.20574-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking statically with -lreadline we also need to specify
-lcurses.

Fixes:
  http://autobuild.buildroot.net/results/70e0a273e699c73c6b2ab2a19c8f7ebb1ddee6cde
  http://autobuild.buildroot.net/results/6a7faf8adbffd9437c0117b9f0e89684c24dad23

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
I think this should address the following build failures although I've only
confirmed the two quoted above.

  http://autobuild.buildroot.net/results/0c79588166e1900c18161e1d67a38e6ee2461112
  http://autobuild.buildroot.net/results/66fcd3dc6909bd00d6cb97e7b713e1e2e91c2697
  http://autobuild.buildroot.net/results/d31ea8d374fa4b14b8d8d55e537801c7fc1e5992
  http://autobuild.buildroot.net/results/9d4d9b74fb021fcbbc2a63ccc8cbe170ded7ae24
  http://autobuild.buildroot.net/results/e4f9e0549ddfca65d746cd7ac681cd463e86f6b7
  http://autobuild.buildroot.net/results/5f6b19e5fbb138b81092004ab8da057b84817025

I'm not sure that this is the "right" fix but it seems to do the trick. I also
tried using LIBS instead of LDFLAGS which got the configure step to pass but
didn't propagate to the final link.

 package/util-linux/util-linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 82230bc..d32e30d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -148,6 +148,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 UTIL_LINUX_CONF_OPTS += --with-readline
+UTIL_LINUX_CONF_ENV += $(if $(BR2_STATIC_LIBS),ac_cv_lib_readline_readline=yes)
+UTIL_LINUX_CONF_ENV += $(if $(BR2_STATIC_LIBS),LDFLAGS="-lcurses")
 UTIL_LINUX_DEPENDENCIES += readline
 else
 UTIL_LINUX_CONF_OPTS += --without-readline
-- 
2.9.2.518.ged577c6.dirty
