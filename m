From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Dec 2014 17:29:55 +0200
Subject: [Buildroot] [PATCH] dhcpcd: blacklist Sourcery PowerPC toolchains
Message-ID: <4baeea60ab360e4c92976a3599c4b1cba5ff5bfb.1419953394.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linux/socket.h header in these toolchains is broken as described in commit
f5866484ffe (libnftnl: exclude for CS PPC toolchains).

Fixes:
http://autobuild.buildroot.net/results/d92/d92e7f2af0e64bc40f7b5c9ea081471de98bf8e8/
http://autobuild.buildroot.net/results/e97/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
http://autobuild.buildroot.net/results/ca3/ca32c4de8b645c96cedb80b6270a792e9601ad84/

and some more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dhcpcd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index ca0ad751ffcb..f2ca0998f8d1 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_DHCPCD
 	bool "dhcpcd"
 	# No support for AI_ADDRCONFIG
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
+	# bad headers, no sa_family_t in linux/socket.h
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	help
 	  An RFC2131 compliant DHCP client
 
-- 
2.1.4
