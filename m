From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:42:37 +0200
Subject: [Buildroot] [git commit] package/pkg-download: quiet the dl-wrapper
 call
Message-ID: <20180820203522.761FC8E015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfde78f48cde50bd4a8d0b0746dba3507b91c485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download wrapper call is currently always being displayed, even
without V=1, which is a bit annoying. It shows something like this:

thomas at windsurf:~/projets/buildroot (master)$ make tslib-source
>>> tslib 1.16 Downloading
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin" BR2_DL_DIR=/home/thomas/dl BUILD_DIR=/home/thomas/projets/buildroot/output/build O=/home/thomas/projets/buildroot/output flock /home/thomas/dl/tslib/ support/download/dl-wrapper -c '1.16' -d '/home/thomas/dl/tslib' -D '/home/thomas/dl' -f 'tslib-1.16.tar.xz' -H 'package/tslib//tslib.hash' -n 'tslib-1.16' -N 'tslib' -o '/home/thomas/dl/tslib/tslib-1.16.tar.xz'  -u https+https://github.com/kergoth/tslib/releases/download/1.16 -u http\|urlencode+http://sources.buildroot.net/tslib -u http\|urlencode+http://sources.buildroot.net  --

Let's silence this dl-wrapper call by prepending with $(Q).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2ca6ccf44d..bf93b9a08e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -92,7 +92,7 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
