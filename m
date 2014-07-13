From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 15:03:23 +0200
Subject: [Buildroot] [PATCH 3/4 v3] package/perl-net-ssleay: not available
	for static link
In-Reply-To: <cover.1405256442.git.yann.morin.1998@free.fr>
References: <cover.1405256442.git.yann.morin.1998@free.fr>
Message-ID: <0702a5f595a23123bf3d0152a591105ea849d938.1405256442.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perl extensions are loaded at runtime with dlopen(), so it does not
make sense to even build extensions that are written in C.

perl-net-ssleay is (partly) written in C, so it is not available when
doing a static build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/perl-net-ssleay/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index bc219b0..7cc5157 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Perl extension for using OpenSSL
 
 	  https://metacpan.org/release/Net-SSLeay
+
+comment "perl-net-ssleay needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.9.1
