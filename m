Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1651C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7AF60FD0;
	Sun,  5 Mar 2023 18:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7AF60FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUi6HTwqZ7bF; Sun,  5 Mar 2023 18:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE6A60FB7;
	Sun,  5 Mar 2023 18:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE6A60FB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B20F71BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF68409FC
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF68409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2DtZqYzlDdI for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D1B409FA
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D1B409FA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 802B2867D8; Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:35:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3b2ef030263d275d1bfcdf7db41a5faa93339ca
X-Git-Newrev: 091655d9ad3a3b3f05be4216b5936b644a596267
X-Patchwork-Hint: ignore
Message-Id: <20230305183743.802B2867D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: add pcre2 optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=091655d9ad3a3b3f05be4216b5936b644a596267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pcre2 is an optional dependency since version 1.3.8 and
https://github.com/proftpd/proftpd/commit/e63cf016f574890c4096d587b8b1f55d87ac05d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d3b6308185..398155222d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -31,6 +31,13 @@ ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+PROFTPD_CONF_OPTS += --enable-pcre2
+PROFTPD_DEPENDENCIES += pcre2
+else
+PROFTPD_CONF_OPTS += --disable-pcre2
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
 PROFTPD_CONF_OPTS += --enable-cap
 PROFTPD_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
