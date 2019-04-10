From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 12:01:27 +0200
Subject: [Buildroot] [git commit] package/gettext-tiny: drop dependency of
 host-variant on libiconv
Message-ID: <20190410095737.1FAEC8E1D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63af60fae344f5784929af229caf9a4d46baa23a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant of gettext-tiny incorrectly has a dependency on the
target libiconv. Not only this is wrong (a host package cannot use a
target library), but it also causes a circular dependencies:
host-gettext-tiny is needed as part of the toolchain build in some
configurations, and all target packages depend on the toolchain being
available.

For host packages, we assume that iconv functionnality is provided by
the host system, so there is no host-libiconv package.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Reviewed-by: Alexey Brodkin <abrokdin@synopsys.com>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 4fa014e8dd..87e90bcc70 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -49,10 +49,6 @@ define HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 endef
 HOST_GETTEXT_TINY_POST_PATCH_HOOKS += HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 
-ifeq ($(BR2_ENABLE_LOCALE),)
-HOST_GETTEXT_TINY_DEPENDENCIES = libiconv
-endif
-
 define HOST_GETTEXT_TINY_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
