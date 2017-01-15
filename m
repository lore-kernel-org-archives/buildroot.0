From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 15 Jan 2017 03:54:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: disable icu support for
	host build
Message-ID: <1484448867-29347-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Apperently if both icu and nodejs enabled during the nodejs host build the
nodejs buildsystem gets confused by the icu version installed by Buildroot
(icu 58.2) and the one bundled with the nodejs source tree(icu 57),
which ends up in linking-time errors as:

"""
undefined reference to
`icu_58::NumberFormat::format(icu_58::StringPiece,
icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
const'
"""
(note the icu_58 in the symbol name while the bundled icu version is 57)

 This patch disables the (not used) i18n support in the nodejs host build
config in order to fix the issue. The issue doesn't affect the target build of
nodejs.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/nodejs/nodejs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 43b6169..82a012a 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -63,6 +63,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--without-dtrace \
 		--without-etw \
 		--shared-zlib \
+		--with-intl=none \
 	)
 endef
 
-- 
2.7.4
