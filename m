From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:51:00 +0200
Subject: [Buildroot] [git commit] package/iptraf-ng: really add _GNU_SOURCE
	in CFLAGS
Message-ID: <20160528135107.D8BC880AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb384c24fd1b8604560dfeb6add7e698aab1e2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When iptraf-ng is build with musl, it needs _GNU_SOURCE in CFLAGS to define
the content of "struct tcphdr".

iptraf-ng.mk try to add _GNU_SOURCE in CFLAGS but it's not taken into account.

Add it using IPTRAF_NG_CONF_ENV instead of IPTRAF_NG_MAKE_ENV.

Fixes:
http://autobuild.buildroot.net/results/a1b/a1b18f2e3d075d349c19536a7c5553f24b75a323

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptraf-ng/iptraf-ng.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index ea64e1d..a36c708 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -11,7 +11,9 @@ IPTRAF_NG_LICENSE_FILES = LICENSE
 IPTRAF_NG_DEPENDENCIES = ncurses
 
 IPTRAF_NG_MAKE_ENV = \
-	NCURSES_LDFLAGS="-lpanel -lncurses" \
+	NCURSES_LDFLAGS="-lpanel -lncurses"
+
+IPTRAF_NG_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 $(eval $(autotools-package))
