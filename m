From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 21:42:34 +0100
Subject: [Buildroot] [git commit] package/collectd: fix build without
	libgcrypt
Message-ID: <20141215204605.0762880431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72695bbfc442c640b40e873bc772c8f067235fee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case the libgcrypt development files are present on the host system,
collectd's ./configure will mistakenly try to use them and will call the
host system's libgcrypt-config, thus leading it to use path to the host
system includes and libraries.

Fix that in two ways:
  - explicitly disable libgcrypt support when libgcrypt is not enabled;
  - pass the complete path to libgcrypt-config when libgcrypt is enabled.

However, collectd's configure.ac is utterly broken. The code in
configure.ac has special code to check for libgcrypt-config, and use
whatever is provided via --with-libgcrypt=/path/to/libgcrypt-config. But
that is promptly forgotten because they then call the AM_PATH_LIBGCRYPT
macro, that just does it all again from scratch, and does not use the
value previously found.

Instead, we set LIBGCRYPT_CONFIG in the environment and point it to our
own libgcrypt-config.

Should fix numerous build issues:
    http://autobuild.buildroot.net/results/ad4/ad408aef5fb92fe9e031c7dbaf6999776b40ace4/
    http://autobuild.buildroot.net/results/967/96735bfa91bcf2e3dff89f69c0a12ed406e9efb9/
    ...
    http://autobuild.buildroot.net/results/3bd/3bdd9bdffb1d55414787d38fc2656d7a3391a957/
    ...

(the first two are with the paranoid wrapper, the third one was before
the paranoid wrapper.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 4647bd5..dce2b23 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -134,6 +134,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 	COLLECTD_DEPENDENCIES += libgcrypt
 	COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
+	COLLECTD_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+else
+	COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
 
 # released software should not break on minor warnings
