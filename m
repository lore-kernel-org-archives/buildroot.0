From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 11 Nov 2015 19:01:17 +0100
Subject: [Buildroot] [PATCH] package/ebtables: disable for musl toolchains
Message-ID: <1447264877-30261-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ebtabes fail to build with a musl based toolchain due to several errors.
Most of them has been fixed by [1] and [2] but it's not enought because
useful_functions.c fail to build due to mixed usespace and kernel headers
usage [3].

In file included from [...]/sysroot/usr/include/netinet/ether.h:8:0,
                 from useful_functions.c:28:
[...]/sysroot/usr/include/netinet/if_ether.h:96:8: error: redefinition of ?struct ethhdr?
 struct ethhdr {
        ^
In file included from include/linux/netfilter_bridge.h:8:0,
                 from include/linux/netfilter_bridge/ebtables.h:17,
                 from include/ebtables_u.h:27,
                 from useful_functions.c:25:
include/linux/if_ether.h:119:8: note: originally defined here
 struct ethhdr {
        ^
Makefile:78: recipe for target 'useful_functions.o' failed

Fixes:
http://autobuild.buildroot.net/results/75c/75cc79ae2a2d05ad27198f1b745c8bef37c3a87d/build-end.log

[1] http://git.netfilter.org/ebtables/commit/?id=f8079671326e9fd079391d24911a9a8a77f1d6fd
[2] http://git.netfilter.org/ebtables/commit/?id=4488ba7aa2bb612a624c68957f464fc0ee786e05
[3] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_am_i_getting_.22error:_redefinition_of_struct_ethhdr.2Ftcphdr.2Fetc.22_.3F

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ebtables/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 3f7566a..fa123b1 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # mixes userspace and kernel headers
 	depends on BR2_USE_MMU # fork()
 	help
 	  Ethernet bridge frame table administration
 
 	  http://ebtables.netfilter.org/
+
+comment "ebtables needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_USE_MMU
-- 
2.4.3
