From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 16 Sep 2019 01:57:43 +0300
Subject: [Buildroot] [PATCH v2 1/1] support/dependencies/dependencies.sh:
 check for JSON:PP Perl module
In-Reply-To: <20190915130113.53523-1-aperez@igalia.com>
Message-ID: <20190915225743.88337-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71/

The JSON::PP Perl module is used at build time by the webkitgtk
and wpewebkit packages.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

---
v1 -> v2:
- Intead of making the package depend on host-perl, check for the module
  in the dependencies.sh script to avoid making the build slower. The
  module has been in core Perl since 2013.

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3a170cbda6..3f18985435 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -270,6 +270,10 @@ if grep -q ^BR2_PACKAGE_WHOIS=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules autodie"
 fi
 
+if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
+    required_perl_modules="${required_perl_modules} JSON::PP"
+fi
+
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
-- 
2.23.0
