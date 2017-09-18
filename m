From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Sep 2017 21:30:27 +0300
Subject: [Buildroot] [PATCH] bash: fix static build
Message-ID: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building bash statically, configure does not initialize the
SHOBJ_STATUS variable. The SHOBJ_STATUS make variable in
examples/loadables/Makefile.in must resolve to either 'supported' or
'unsupported'. Otherwise, the install-$(SHOBJ_STATUS) target does not
exist.

This leads to the following build failure:

make[2]: Entering directory '.../output/build/bash-4.4/examples/loadables'
make[2]: *** No rule to make target 'install-', needed by 'install'.  Stop.
make[2]: Leaving directory '.../output/build/bash-4.4/examples/loadables'
Makefile:793: recipe for target 'install' failed

with the following defconfig:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_BASH=y

Set SHOBJ_STATUS in the configure environment as a workaround.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
For some reason the autobuilders never caught this issue since the 4.4
version bump last November (commit cde22e1fd340).
---
 package/bash/bash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 32c87a659e16..dd7c26fc1258 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -25,6 +25,7 @@ BASH_CONF_ENV += \
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link
+BASH_CONF_ENV += SHOBJ_STATUS=unsupported
 # bash wants to redefine the getenv() function. To check whether this is
 # possible, AC_TRY_RUN is used which is not possible in
 # cross-compilation.
-- 
2.14.1
