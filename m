From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 15:10:05 +0100
Subject: [Buildroot] [PATCH v2] package/iptables: nfsynproxy not available
	on musl
Message-ID: <1453644605-3705-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

utils/nfsynproxy.c needs several TCP_* constants which are not yet
provided by musl, they were added Jan 17, 2016 to musl:
http://git.musl-libc.org/cgit/musl/commit/?id=53f41fb568ae43034c9876cc9bd3961fd6d13671

Until we support a musl version containing the constants we disable
the option for building nfsynproxy on musl.

Fixes
http://autobuild.buildroot.net/results/8ee/8ee299d8697bf488ba94f60785e81f274b2128fd/
http://autobuild.buildroot.net/results/f1a/f1ab3fe59d0dd7dd7b9a7bc6bc10a0019f0fa567/
http://autobuild.buildroot.net/results/4f9/4f904a2913984201ad0bffb63664019c73e0eb77/
http://autobuild.buildroot.net/results/65c/65c7d47fdc0f55fb8deb77e34063320e2af337ee/
http://autobuild.buildroot.net/results/aaa/aaaa1fc92b6a885d223681f40c5df7a962ee1fce/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added commit about future toolchain requirements (Baruch)

 package/iptables/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index ae7a634..c7b69a8 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -9,6 +9,10 @@ if BR2_PACKAGE_IPTABLES
 
 config BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY
 	bool "bpfc and nfsynproxy"
+	# this dependency can be removed when using a musl version
+	# containing this commit:
+	# http://git.musl-libc.org/cgit/musl/commit/?id=53f41fb568ae43034c9876cc9bd3961fd6d13671
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Build bpf compiler and nfsynproxy configuration tool.
-- 
2.7.0.rc3
