From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Sep 2014 00:35:58 +0200
Subject: [Buildroot] [git commit] package/pkg-autotools: don't use
	config.site when cross-compiling
Message-ID: <20140914223857.7CA639D65E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8d4fe376cf65cc4e41423804869a79c2570f674
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On fedora 20 64bits host, the file /usr/share/config.site contains
a fix for installing libraries into /lib/lib64 on 64bits systems
that redefine libdir in the generated Makefile

For safety and avoid the bug #7262 [1], disable loading this file
when running the configure script for the target and the host.

Note: configure scripts generated with autoconf < 2.65 will source
the /dev/null and print this line:
"configure: loading site script /dev/null"

[1]: https://bugs.busybox.net/show_bug.cgi?id=7262

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 83299cf..4404f15 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -126,6 +126,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
+	CONFIG_SITE=/dev/null \
 	./configure \
 		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
@@ -160,6 +161,7 @@ define $(2)_CONFIGURE_CMDS
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
                 $$($$(PKG)_CONF_ENV) \
+		CONFIG_SITE=/dev/null \
 		./configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
