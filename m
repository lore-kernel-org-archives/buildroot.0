From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:26:24 +0100
Subject: [Buildroot] [git commit] package/ncurses: don't attempt calling
 ldconfig in host-ncurses
Message-ID: <20201221091743.AEA8F8812E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=389f48fe90cc8ed77a76a245d3e3ec1fa965df64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-ncurses install step attempts to run ldconfig, causing a permission
failure:

cd /buildroot/output/host/lib && (ln -s -f libncurses.so.6.0 libncurses.so.6; ln -s -f libncurses.so.6 libncurses.so; )
test -z "" && /sbin/ldconfig
/sbin/ldconfig: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
make[3]: [/buildroot/output/host/lib/libncurses.so.6.0] Error 1 (ignored)

The error is non-fatal and ignored, but confusing.

The ncurses makefiles already avoid calling ldconfig when DESTDIR is set
(target case) but for host-ncurses DESTDIR is empty and the output/host path
is passed via --prefix.

Pass an empty ac_cv_path_LDCONFIG to the configure step, so than ldconfig is
not called.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index f4e4784a3c..4d8dcecc3a 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -187,6 +187,9 @@ define HOST_NCURSES_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/progs tic
 endef
 
+HOST_NCURSES_CONF_ENV = \
+	ac_cv_path_LDCONFIG=""
+
 HOST_NCURSES_CONF_OPTS = \
 	--with-shared \
 	--without-gpm \
