From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 12:24:29 +0100
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/libnetfilter_conntrack: add libmnl to Libs.Private
Message-ID: <20201114111142.44855814D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b9e00b382e21152551c22c83eece561e711976d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This will fix a static build failure with dnsmasq on latest
libnetfilter_conntrack

Fixes:
 - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Baruch Siach <baruch@tkos.co.il>
[Peter: adjust upstream status as pointed out by Baruch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 083dbf4cca7fd032ad07f3bde97422134b4e0b86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...r_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch b/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
new file mode 100644
index 0000000000..0b373d9261
--- /dev/null
+++ b/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
@@ -0,0 +1,38 @@
+From 93bbd7e56cefc8488a61892b3bf5df63a175d20d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Apr 2020 14:05:15 +0200
+Subject: [PATCH] libnetfilter_conntrack.pc.in: add LIBMNL_LIBS to Libs.Private
+
+Since version 1.0.8 and commit
+c1c0f16c1fedb46547c2e104beeaaeac5933b214, libnetfilter_conntrack depends
+on libmnl so add it to Libs.Private.
+
+Otherwise, applications such as dnsmasq will fail to link on:
+
+/home/buildroot/autobuild/instance-0/output-1/host/bin/arm-linux-gcc -Wl,-elf2flt -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnetfilter_conntrack -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnfnetlink
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in function `nfct_fill_hdr.constprop.4':
+api.c:(.text+0x34): undefined reference to `mnl_nlmsg_put_header'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: commit e94172f09e4d]
+---
+ libnetfilter_conntrack.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libnetfilter_conntrack.pc.in b/libnetfilter_conntrack.pc.in
+index 857f993..fbd7132 100644
+--- a/libnetfilter_conntrack.pc.in
++++ b/libnetfilter_conntrack.pc.in
+@@ -12,5 +12,5 @@ Version: @VERSION@
+ Requires: libnfnetlink
+ Conflicts:
+ Libs: -L${libdir} -lnetfilter_conntrack
+-Libs.private: @LIBNFNETLINK_LIBS@
++Libs.private: @LIBNFNETLINK_LIBS@ @LIBMNL_LIBS@
+ Cflags: -I${includedir}
+-- 
+2.25.1
+
