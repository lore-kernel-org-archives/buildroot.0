From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 11 Mar 2019 07:48:20 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain: -fstack-protector-strong can be
 back-ported
In-Reply-To: <cover.1552286891.git.yann.morin@orange.com>
References: <cover.1552286891.git.yann.morin@orange.com>
Message-ID: <4519_1552286905_5C8604B9_4519_133_1_69387d93-20ac-4b2a-a445-5390c1f030a9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, use of -fstack-protector-strong is only available for gcc
starting with 4.9, on the assumption that it appeared with that version.

Although this is true, it happens that quite a few vendors will have
back-ported -fstack-protector-strong to older gcc versions (at least 4.8
seen in the wild).

Remove the guard against gcc>=4.9, and expand the help text.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

---
Notes:

We could have changed the guard to something like:
    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_EXTERNAL

However, the latest gcc we support in the internal toolchain *is*
gcc-4.9, so the condition would have always been true. Hence, we just
drop the condition.
---
 Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 757ad1ca40..d5a0460f98 100644
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
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
