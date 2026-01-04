Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4573C2A070
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 22:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 675CE80E13;
	Sun,  4 Jan 2026 22:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HcXjLmuPicu; Sun,  4 Jan 2026 22:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7873580D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767564150;
	bh=fjqFzXYWpcft1PILzEBcKoOZGwMptjldIhAwSL0VQS4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L/Cp7WgqrpgF2s7woU7sNxGPC/ZeQs0Fu6Tg8Ol2aamNAciNrsmPAUeZ9rff901SQ
	 S+RiAzEKKFgsZpNfzFRe82cxiSJYF0jISOw6sijPGAjjmTMAybocYvlezXyGoyp7k0
	 Rs6IjXmvW07U7VqWjnOMzomeaHUfXoCvChUJRikcFtx6FHd6afAWRGq4TXTQ/neP0V
	 VzIWLJNfYXYW48CMNEdrpQwpp7OuIB8ltIOw5xRsQPi4C9KOgYDdpwnS1mcNBRD/eE
	 6z0+4pw/U+D9Nf6Tx8T+W0Bs+Uw8iQU3P7DpkJ286+Ynyrp5gX8i6UQarKIlZRgp3e
	 JAEB97JWaYxNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7873580D5C;
	Sun,  4 Jan 2026 22:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1112DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7597880727
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 22:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfMk4Ndt_Gtj for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 22:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F24580D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F24580D5C
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F24580D5C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 22:02:26 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id cWB4vofUN3pJ0cWB5vvYOy; Sun, 04 Jan 2026 23:02:23 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  4 Jan 2026 23:02:21 +0100
Message-ID: <20260104220221.39077-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGd2QaqsOSaJp6rIZ3tp/AJCYQ0H0G8OLgOyv7Jv+fshr5xf8Y1OzN/k171TLiRzeuY9EZNk0gOW14TSt5PJ3ol9feqXyDgEJ/8PO8vdhNE56sCapDJ+
 tS146xAP/nIwh3RPf/s7hkr3Lrc7Bynh2I3wItWXF/mvPbB/1GXipnfFuX7eVsaZheGHlF4N0rc50KLBp9X+ve3xKj7Hw3lGDUQ6kGEzqKzSkVXAjoz66SDl
 HJBvViBVbgm5oPTGcUzwDyd4YHCO3Z2sHF19qGvW5P4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767564143; bh=DmT4Tt6pFOSBYFd+kz4ctcxKC0gFchexlF5R3Hu/k6M=;
 h=From:To:Subject:Date:MIME-Version;
 b=E974u2r95uP6PlL25bP/f/bvI5od1MTdNfSkGmIsD2t10b4YmJnGl3XXzUDdtIdTF
 gt9XaEOAuiJFP6gcbdGIVQ97TSQ9U1WMvqvIyQSGD7IjJ5joebo111hY6PGB0CYRJz
 RYvGleEtj5T8h8itZ+CIuKHp9Z+j2+7ledjo8btxzDikfr+TmhyoDSJEa/JmnJdMHo
 taWwgsNyZrXzArslDbUIhsmvbOVxgrK+Jhu8elN+k0guypf52VH9AtufKgi1KOOAJ3
 xgg64VlwUred+cTMSYZ27vxFxj37vRmgtyaPXRPWAskYKerQcOb0zOmmhbXJW/fwSW
 m+05coWFpbVXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=E974u2r9
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure with powerpc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Not all Linux defconfigs have CONFIG_INET enabled and this results in:
  LD [M]  88XXau.o
  MODPOST Module.symvers
ERROR: modpost: "register_inetaddr_notifier" [88XXau.ko] undefined!
ERROR: modpost: "unregister_inetaddr_notifier" [88XXau.ko] undefined!

So let's add CONFIG_INET to LINUX_CONFIG_FIXUPS.

Fixes:
https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 1308508e00..7981a382b1 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -25,6 +25,7 @@ RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 
 define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
