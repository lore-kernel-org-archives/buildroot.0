From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 23:19:36 +0200
Subject: [Buildroot] [git commit] toolchain: -fstack-protector-strong can be
 back-ported
Message-ID: <20190803211932.2B68E83EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51db8974f72bcefa912a5fea547311df1c1657ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, use of -fstack-protector-strong is only available for gcc
starting with 4.9, on the assumption that it appeared with that version.

Although this is true, it happens that quite a few vendors will have
back-ported -fstack-protector-strong to older gcc versions (at least 4.8
seen in the wild).

Remove the guard against gcc>=4.9, and expand the help text.

Note: we could have changed the guard to something like:
    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_EXTERNAL_CUSTOM

However, the latest gcc we support in the internal toolchain now *is*
gcc-4.9, and similarly all external toolchains except Sourcery ARM are
4.9 or higher. So except for the Sourcery toolchain, the condition would
have always been true. For that one toolchain, we can allow it to hit
the SSP check, and just drop the condition entirely.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index c611bb7dec..80f4eda705 100644
--- a/Config.in
+++ b/Config.in
@@ -746,14 +746,14 @@ config BR2_SSP_REGULAR
 
 config BR2_SSP_STRONG
 	bool "-fstack-protector-strong"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Like -fstack-protector but includes additional functions to be
 	  protected - those that have local array definitions, or have
 	  references to local frame addresses.
 
-comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	  -fstack-protector-strong officially appeared in gcc 4.9, but
+	  some vendors have backported -fstack-protector-strong to older
+	  versions of gcc.
 
 config BR2_SSP_ALL
 	bool "-fstack-protector-all"
