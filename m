From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 22 Feb 2019 00:15:01 +0100
Subject: [Buildroot] [git commit] package/proftpd: prevent openssl pthread
 detection
Message-ID: <20190221231318.DF8AE8A695@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51bb23652fbb5597d10cf2dc49948f9405c5619b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The proftpd configure script doesn't use pkg-config to detect openssl
libraries. Instead, it just adds -lcrypto. Since openssl may be linked
with pthread, it tries to detect that by calling 'openssl version -f',
which gives the arguments with which openssl was compiled.

Since the openssl executable used is either host-openssl or the system
installed openssl, the output of 'openssl version -f' is useless in
Buildroot context. If the target toolchain doesn't have threads support,
it will wrongly pick up -pthread from host-openssl.

Fortunately there is a simple workaround: --without-openssl-cmdline says
that there is no openssl executable and skips the test, so -pthread is
not added. It turns out -pthread is never needed, even in static linking
cases, because openssl/libressl puts the thread support in a separate
object file that only gets linked in if the program actually uses
threads (which proftpd doesn't).

Fixes:
http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Rewrite commit log, after additional analysis and testing]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/proftpd/proftpd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 592c069ad3..67d8eb8c6f 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -22,7 +22,8 @@ PROFTPD_CONF_OPTS = \
 	--disable-dso \
 	--enable-sendfile \
 	--enable-shadow \
-	--with-gnu-ld
+	--with-gnu-ld \
+	--without-openssl-cmdline
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_MODULES += mod_rewrite
