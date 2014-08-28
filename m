From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 00:17:37 +0200
Subject: [Buildroot] [PATCH 1/3] ruby: requires shared library
In-Reply-To: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1409264259-13058-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not matter what you do, the Ruby build system wants to use shared
libraries for the encoding modules. Therefore, this commit disallows
the selection of Ruby in BR2_PREFER_STATIC_LIB situations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index 0de756b..2191204 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_RUBY
 	bool "ruby"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Object Oriented Scripting Language.
 
 	  http://www.ruby-lang.org/
 
-comment "ruby needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "ruby needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
2.0.0
