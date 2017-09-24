From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:22:13 +0200
Subject: [Buildroot] [git commit] bash: fix static build
Message-ID: <20170924132001.7A34D80F8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a2af11cba83ef176672609dd7321712fa7f6a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Note that this doesn't terminate the build so it's not detected as an
error by the autobuilders.

Set SHOBJ_STATUS in the configure environment as a workaround.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bash/bash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 32c87a6..dd7c26f 100644
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
