From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:38:25 +0100
Subject: [Buildroot] [git commit] package/zmqpp: Blacklist Blackfin ADI
	toolchains
Message-ID: <20150315133918.A812A8081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ecd241db1319f61efb3862bb3e25f00d254dc4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zmqpp recommand at least a c++ compiler g++ >= 4.7
[1] for c++11 support and won't be backward compatible
whith older compliler for the next release (4.x)
due to harcoded -std=c++11 flag [2]

Blackfin ADI toolchains use a g++ 4.3 which use an
experimental c++11 support (c++0x) has not enough c++11
support to build zmqpp.

Fixes:
http://autobuild.buildroot.net/results/4c3/4c34ce881e3eab47994cc893898cbc9129ce67b5/

And many more.

[1] https://github.com/zeromq/zmqpp
[2] https://github.com/zeromq/zmqpp/commit/f078fe9a5a775aff5c74dedbdc869f8158ddf123

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 88973db..881877a 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_ZMQPP
 	bool "zmqpp"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # c++0x support
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # c++0x support
 	depends on BR2_INSTALL_LIBSTDCPP
