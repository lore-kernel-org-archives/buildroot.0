Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0183CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F7282B93;
	Mon, 20 Feb 2023 23:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F7282B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uB8XpEnTpB-s; Mon, 20 Feb 2023 23:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A9782C8F;
	Mon, 20 Feb 2023 23:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A9782C8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD1E1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73C0B41732
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C0B41732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qz3EraS8TJFZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C085E4172F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C085E4172F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE2D886495; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 22:53:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9fba87b8d708caa51ac674a56b9f2a50ed5fdc36
X-Git-Newrev: 006ea057e98afddd7d2b92e118ebefa8bdeb9a6d
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.BE2D886495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkgconf: disable
 ccache for host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=006ea057e98afddd7d2b92e118ebefa8bdeb9a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We need to disable ccache when building host-pkgconf as the upcoming
ccache update depends on host-pkgconf indirectly due to host-cmake
depending on host-pkgconf which will be required due to host-ccache
migrating from autotools to cmake package infrastructure.

Note: host-pkgconf does not need _AUTORECONF = YES, so it doesnot depend
on any of host-gettext, host-automake, host-autoconf, or host-libtool.
If it ever nees to in the future, then those should also be made to
build without ccache.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: add note]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkgconf/pkgconf.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 5d65f69c10..e9587fae6b 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,6 +11,11 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 PKGCONF_CPE_ID_VENDOR = pkgconf
 
+# We are a ccache dependency, so we can't use ccache
+HOST_PKGCONF_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
