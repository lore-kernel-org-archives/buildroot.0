From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:36:31 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/linknx: add
 optional dependency to libcurl again
Message-ID: <20171227094030.1504780FB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3bb17d82ea8f881e856ff63b7cedbf5c9192723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

https://git.buildroot.net/buildroot/commit/package/linknx?id=e1c9a2349006e657e76dff35706a774376921fb7
made libcurl a hard dependency to fix autoreconf.

https://git.buildroot.net/buildroot/commit/package/linknx?id=b56083099f113817edc6811e2cdd820df1c80450
removed autoreconf but did not re-add libcurl as optional dependency by
mistakenly assuming that libcurl is needed only for autoreconf.

Tested using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_LINKNX=y

Configure log of linknx without this patch

checking for curl-config... /usr/bin/curl-config
checking for the version of libcurl... 7.52.1
checking for libcurl >= version 7.14.0... yes
checking whether libcurl is usable... no

and with this patch

checking for curl-config... /home/buildroot/br4/output/host/i586-buildroot-linux-uclibc/sysroot/usr/bin/curl-config
checking for the version of libcurl... 7.57.0
checking for libcurl >= version 7.14.0... yes
checking whether libcurl is usable... yes
checking for curl_free... yes

Inspired by the fli4l project
https://web.nettworks.org/repo/changelog/fli4l?cs=49347

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 22c8b9fce95740c2d34d533110f6c2c6cfd77203)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linknx/linknx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index fcef475..7965ce4 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -18,6 +18,13 @@ LINKNX_CONF_OPTS = \
 LINKNX_DEPENDENCIES = libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
+LINKNX_DEPENDENCIES += libcurl
+else
+LINKNX_CONF_OPTS += --without-libcurl
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 LINKNX_DEPENDENCIES += mysql
