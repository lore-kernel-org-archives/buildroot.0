Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DBC6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02DD360FB1;
	Sun,  5 Mar 2023 18:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02DD360FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRErCCwkPC0b; Sun,  5 Mar 2023 18:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513E060FA8;
	Sun,  5 Mar 2023 18:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 513E060FA8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB7D1BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C9A60FA8
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C9A60FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1WxPexmza78 for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89DC160E66
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89DC160E66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 714E5867D7; Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:33:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90e1a64cb0abff65bc2a3e8ba811c732d820a910
X-Git-Newrev: b3b2ef030263d275d1bfcdf7db41a5faa93339ca
X-Patchwork-Hint: ignore
Message-Id: <20230305183743.714E5867D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: add libidn2 optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3b2ef030263d275d1bfcdf7db41a5faa93339ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libidn2 is an optional dependency which is enabled by default since
version 1.3.8 and
https://github.com/proftpd/proftpd/commit/5f61ac028e0930e7de9ea2a00864ccb6dc048f64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8e7d108c9e..d3b6308185 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -27,6 +27,10 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+PROFTPD_DEPENDENCIES += libidn2
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
 PROFTPD_CONF_OPTS += --enable-cap
 PROFTPD_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
