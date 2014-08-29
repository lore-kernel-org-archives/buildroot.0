From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 09:15:42 +0200
Subject: [Buildroot] [git commit] ruby: requires shared library
Message-ID: <20140829071721.CD5239D587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b773698820996352274962899790788fc2b3eb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No matter what you do, the Ruby build system wants to use shared
libraries for the encoding modules. Therefore, this commit disallows
the selection of Ruby in BR2_PREFER_STATIC_LIB situations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
