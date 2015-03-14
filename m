From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Mar 2015 18:01:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/zmqpp: Blacklist Blackfin ADI
	toolchains
In-Reply-To: <1426352489-19916-1-git-send-email-romain.naour@openwide.fr>
References: <1426352489-19916-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1426352489-19916-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/zmqpp/Config.in | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.9.3
