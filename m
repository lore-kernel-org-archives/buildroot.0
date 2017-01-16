From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:19:56 +0100
Subject: [Buildroot] [git commit] package/nodejs: disable icu support for
	host build
Message-ID: <20170116124620.E72937FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24d90db52a74dfb818e113acb34750338242823a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1d6/1d6bbef2cb0c8c2e00b6d7511814ff9ddb2e3073/
http://autobuild.buildroot.net/results/4c7/4c7fc92a42405e25f41394fa44f5bdc27a4538c4/

Apperently if both icu and nodejs are enabled during the nodejs host build
the nodejs buildsystem gets confused by the icu version installed by
Buildroot (icu 58.2) and the one bundled with the nodejs source tree(icu
57), which ends up in linking-time errors as:

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

[Peter: add autobuilder references]
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
