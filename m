From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 10:15:45 -0300
Subject: [Buildroot] [PATCH] bash: fix static build
Message-ID: <1376313345-5992-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The static build needs some trickery, so make it happen. Fixes:
http://autobuild.buildroot.net/results/2b12868f8297a96d7abf7fcf526ca5eace73d66d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bash/bash.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d51e203..efd2334 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -16,6 +16,11 @@ BASH_CONF_ENV +=                       \
    bash_cv_func_sigsetjmp=present      \
    bash_cv_printf_a_format=yes
 
+# The static build needs some trickery
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+BASH_CONF_OPT += --enable-static-link --without-bash-malloc
+endif
+
 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BASH_DEPENDENCIES += busybox
-- 
1.8.1.5
