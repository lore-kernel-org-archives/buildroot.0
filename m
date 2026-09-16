Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C51FC982C3
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202DE60824;
	Wed, 16 Sep 2026 12:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyIszElyUzyT; Wed, 16 Sep 2026 12:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4557460806
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789563185;
	b=CfRSJe7/xiH+BzaygCr5YT64LxjgcgYHv6nHhRRf+9a57ElYdv6YRlsJo8XnqpEsKhMz
	 W4KDxkqwv+faYgGtvC4EiLOM8cusIjHGPGl1mTfaCf+p85jS6W2hMmEpvo1I42Ag/QmTb
	 UZMaHD82gPLDaWDK7plUR2phB/Bkb7NKJKstHUm3qNod4Gz7Xv09CPlrIKZTElpBZ6yyn
	 2KstxoLEc+tOVtX23R4LRTpIsCuYt3op1+NmO3kIQSOmj3jNlCtJgG2dAP7cVWTvT9HCh
	 SGNSHYSn++tTEO5WiyQ9vKxmnbU5kowetjTK4Tuc8d1phhi9YlwpVbON8eXif0LopDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789563185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+bhjDFhGAMHIKPMiV/XI24whH0oOq/5RoxnHIBNdgO8=;
	b=q5x9iQnAzZnKyIf0EnJALKngUjstFchI+s6IMafZgOYBiNHjgmBemkt2T+XCZeEsfyMT
	 Tq5X9u+8eFL6VBDMar8jmqVbeS886wc2r28MaOLtwERMZBJuhwSzJN7Fhg3rJ5+U4MT2A
	 ClT0PD4Ay7RdB7flbN82x+OwUkLF4LT5HjPpeZ/d33zIk5nvVAAEm7DCynBhQRLwhzJ/d
	 rBtvkbeyTG/b35pjW1ux6JXHi/TMXSdw+mMHco9lO8jz32xeGq2HUiJ2N3nKicoYH/jN/
	 hCF26F5NtEVjdBNOl6klRB8g2Wpqtq1UciXPauTfHYtX75F+Gf/Qon/eOolSAEOm/ng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789563185;
	bh=+bhjDFhGAMHIKPMiV/XI24whH0oOq/5RoxnHIBNdgO8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=TCMQwTOMqw8Ga8Z1QiUJZ0p4OA4icrO7mw7Ww8UtL13bZEfDX2SUldg1lC8NyDddQ
	 u5sBs8GXtp45pY9CmzzY5w6XduqWeYevjmIriOnw1TSWei7/kPqY2NPzv1Hw0O+Eha
	 4Hn2S8uphgoEZxcVm/5a7v2OOxClRpca66hJNIpXM0KoWaChoPqa45mmNOCr+z61NN
	 tM9Ya2hvVoCaioH6AV7JQ5EDM9ZJ4ssRa8BM2bgfml0X5O6Vvy5jS1c1MP99gHGKRH
	 JqFu/KK3ynkHxHWXAd2ke7Sf/ePGO7Xdwjt5X5FtI26F7ihbsrASKI2CkPCFFI/nRQ
	 hq3/AkexRK4fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4557460806;
	Wed, 16 Sep 2026 12:53:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2841824D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2627840721
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Id7GHvjjhcL for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E20444054F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789563182;
 b=IwvkHCdbRiebGJpn7rqYCOBCVllErru2+hUZNyt+4unfUVXQgkwUZiFmLKP0ry++iHDr
 Gx/zEE5bOsK55TjqElhsxVJJOEwRNuweIyJWkm/OC/+VSpUsQNDSyFB48vEFTGSMn95Ej
 DSysm58oa7xdjQ9rQ/bkcG1G2u5RlziXKUzmj1v3OB/Y+ZSEbE+LhanFMe2mPrqMOLk1i
 3/GVcIqFpWB4GZL0nNgDFxSnH9jD42ws2/YWU2WqofHom1Wnp99fFyQPL1BtU/KyMBhkJ
 G/ygVA1KX2wrQU5/HWEzwZMCzPDdb6OVN4DoL+yAI6NI5bFgZtp1sfcwLvhd9pnXPug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789563182;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=gdQwY8HwuC6N8ofkG/2mMO99AZ3LCeM5l1SoYKC8/F8=;
 b=jzT30e1eIOQoMp5op8ibeE06ENxmsPafZM5uEJtloalcLe/dG814ItHeA1SlzD0VFcrC
 f35sxErLlEZj/flN1msTS/MRTNauDkZiA8bmOcqei2PQ+Mrslp3X3zTr9cg2XodakXmRO
 wxwxAO48QrDSBOzUzR2lueArKHu6+Q1flwzNp1TSv223cW8NiQp3CcS8mAAOqFs3pHYP9
 a2lCQ5f3DURlEDyOBCfbHBfqjyVXnQYIOIrOuYh4a8vHDEQuisIh0tF1B80JaOHgZQEuJ
 Up9nDlIRtLG9SJa5EPTRa53FXdopyI+w1Hyj+crmsi+VrR+R1+8VDSATe00f3pMa5mw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jxazovVU; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E20444054F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1xDXEm0QOm-00WwgY; Wed, 16
 Sep 2026 14:52:56 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 14:52:35 +0200
Message-ID: <20260916125236.2759304-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125236.2759304-1-fiona.klute@gmx.de>
References: <20260916125236.2759304-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:T40gvRb19txcVOdvQ4FJK+yBtozHWDOegM9rF1xDbk+tXx0KZbs
 jvyFFbnuNu7Nbikj5iW9i9R7l2g+OZAhg90NryFPKWcEk170O9SOtRaJUBiRRdh2mkpoPfh
 zTTPwe8ELtzh4i/QZLhQNDejfRdM5nNlIzUDKnXtqLbGHyBYMDr3TXXVJvfNm7kRxHhtNVy
 d2MofldaC69SxRCQ3EAyg==
UI-OutboundReport: notjunk:1;M01:P0:AxM+oKVAc5c=;hGVlukB+ZzrNqV/RQ5okDig5hlz
 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
Subject: [Buildroot] [PATCH 4/5] package/parted: select
 BR2_PACKAGE_HOST_UTIL_LINUX for host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_PARTED_DEPENDENCIES already contains host-util-linux, select its
config option to avoid confusion.

Dependency was added to package/parted in
749b2589ea63cbdcf180d019441a05dcaef4ebe9,
package/util-linux/Config.in.host with the BR2_PACKAGE_HOST_UTIL_LINUX
option was added later in ebeb21d0296df1e4dfe43cdec478043f44aa1916.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/parted/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/parted/Config.in.host b/package/parted/Config.in.host
index f5d7acc2a2..167a7ec8d5 100644
--- a/package/parted/Config.in.host
+++ b/package/parted/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_PARTED
 	bool "host parted"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  parted, the GNU partition resizing program
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
