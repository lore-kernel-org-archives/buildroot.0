From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 15:00:02 +0200
Subject: [Buildroot] [git commit] package/iptraf-ng: Needs -D_GNU_SOURCE to
	fix musl build
Message-ID: <20160524130024.4B10E81E92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00680faa00f56c16686b1671f6fbf3c1a1530f63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compiling iptraf-ng using musl is broken:

src/ipfrag.c:193:52: error: 'struct tcphdr' has no member named 'source'
    ftmp->s_port = ntohs(((struct tcphdr *) tpacket)->source);

Musl guards these fields in the netinet/tcp.h header file with
_GNU_SOURCE, for details see https://dev.openwrt.org/ticket/19889

Patch ported from
http://git.alpinelinux.org/cgit/aports/tree/main/iptraf-ng/APKBUILD#n28

Fixes
http://autobuild.buildroot.net/results/4ce/4cedd4dbaafca76e839f45cc0a4bb8c2c181920d/
http://autobuild.buildroot.net/results/72b/72b019ce5bb52b8b87d92cce675708f7b9f8a96e/
http://autobuild.buildroot.net/results/f67/f67f1c2a627a6d535dd5c00e2ee131b5c5a99a0a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: one assignment only for IPTRAF_NG_CONF_ENV.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptraf-ng/iptraf-ng.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index 7313873..ea64e1d 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -10,6 +10,8 @@ IPTRAF_NG_LICENSE = GPLv2+
 IPTRAF_NG_LICENSE_FILES = LICENSE
 IPTRAF_NG_DEPENDENCIES = ncurses
 
-IPTRAF_NG_MAKE_ENV = NCURSES_LDFLAGS="-lpanel -lncurses"
+IPTRAF_NG_MAKE_ENV = \
+	NCURSES_LDFLAGS="-lpanel -lncurses" \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 $(eval $(autotools-package))
