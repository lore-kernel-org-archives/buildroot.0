From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 23:13:44 +0100
Subject: [Buildroot] [git commit] polarssl: add fix for CVE-2015-1182
Message-ID: <20150126221359.D21808044E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d663af559e3c66603fb8cb3a0b029c40d29bc57a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2015-1182 - Remote attack using crafted certificates.
Also rename patches to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...o-test-suite.patch => 0001-no-test-suite.patch} |    0
 ...e-standard-CMake-flag-to-drive-the-share.patch} |    0
 package/polarssl/0003-fix-CVE-2015-1182.patch      |   19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/polarssl/polarssl-0001-no-test-suite.patch b/package/polarssl/0001-no-test-suite.patch
similarity index 100%
rename from package/polarssl/polarssl-0001-no-test-suite.patch
rename to package/polarssl/0001-no-test-suite.patch
diff --git a/package/polarssl/polarssl-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
similarity index 100%
rename from package/polarssl/polarssl-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
rename to package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
diff --git a/package/polarssl/0003-fix-CVE-2015-1182.patch b/package/polarssl/0003-fix-CVE-2015-1182.patch
new file mode 100644
index 0000000..9309c9d
--- /dev/null
+++ b/package/polarssl/0003-fix-CVE-2015-1182.patch
@@ -0,0 +1,19 @@
+Fix CVE-2015-1182 - Remote attack using crafted certificates.
+Patch status: from upstream see:
+https://polarssl.org/tech-updates/security-advisories/polarssl-security-advisory-2014-04
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/library/asn1parse.c b/library/asn1parse.c
+index a3a2b56..e2117bf 100644
+--- a/library/asn1parse.c
++++ b/library/asn1parse.c
+@@ -278,6 +278,8 @@ int asn1_get_sequence_of( unsigned char **p,
+             if( cur->next == NULL )
+                 return( POLARSSL_ERR_ASN1_MALLOC_FAILED );
+
++            memset( cur->next, 0, sizeof( asn1_sequence ) );
++
+             cur = cur->next;
+         }
+     }
