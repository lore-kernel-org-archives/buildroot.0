Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18F9C9832A
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 20:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576C040A29;
	Sat, 26 Sep 2026 20:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPklFKVtUPZ8; Sat, 26 Sep 2026 20:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7768240A56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790452860;
	b=btADcmMUc8zCBFukUPEOjJI+RR8Z8dvdtBRzqvJuN3ABBb5WQ6Kem8DqJFyoIoliHfxA
	 DNsVaUGlGlpdPm9OnbiesB2pbNH21St8YeDmLRc+ams1nYgfFytzvYyNqTc3DWdjWT9FE
	 PmO58TyED2EA8BjdFG0XFH+/eLLM7Z7WCbAv/lvWb3HORLKGJW4YA7CtDRUhy+8Qi2vsW
	 hMcA+lkHjaN8kKhorp4YdVyX05UL/FPDy1DOFMXUGS3osD9b91O+8tCItfT867lCsC8Zu
	 p+FNY+haFGt1WIZLBdmHAbIBxsZ4mUUq6upQ50eZDXZqupmcLlWJwxuR9dvdFEQQn1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790452860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CmRR3kbbAcHwhNESz/zXv18+rUWdQhOqc5aSjrrUdmo=;
	b=Feoea2eva1HHVorDS5/FzEPVDAqAFBdGTll8uaohC/q15xnKoF9OB9gC2MlgQSrhTNHa
	 4k49ffdoZZ9Kia/zTNYu0i3sMwTZNQrlO5lscIKSzfKwhtwB5defOdobXheKlZ+iMfX0p
	 YjC5+adaFB4R5HCeB+jiRC6Agq2mW6N72+sT/pljaGBpoVdHXdaMqV+8QXLgW5v7wtobC
	 huuNwTSYSTNSB8oRnNTy971L+hdGyoQhuBo8EcSEcj3UIKEd5EqBKyM1HSyzlTix4RYnJ
	 3Czp6o0SaZeM6vG+M7n2n3P2J+cEpzftVqnAK1ct4jYJ44gNbVoslXIjafZO4zjnOyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790452860;
	bh=CmRR3kbbAcHwhNESz/zXv18+rUWdQhOqc5aSjrrUdmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=T/ALn1XozUzVmq3vX3SjoWotqh9A85B6F+KMJPlwfJKgu4eGDLWvda5jQSAL/rMlx
	 ATxcsnML+5Yy9mgJX9CI4Acpu6iWsLuBj8D4wMwevSGALtubigzzpH3ZuZ1rAV5Smz
	 rMlkgq2tsX12F/96a7a58P5ZEzZQL4idB8qUGugiM6GHWBXm8VzhWdq6OFu58YBib5
	 45SZdih+aD0CPExNiY4S3NG2Nm/sS7wtvL+/E4BO7xTvrM7FoSEmcy9XXm86vdDBne
	 azXU9gAd6ImbkC1Ry1fm17jgfp6oXRU/ebF8p6scmmJ0lAI47Cl05UZZDz22KTeYYF
	 jCDjJcE3WxG5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7768240A56;
	Sat, 26 Sep 2026 20:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81C832B6
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 736CF40083
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viIYWoNQ0Jhn for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 20:00:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 29A1240022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790452858;
 b=ms36Lp7RiTAEZDym6qFfZ0ALQ7Owqx91POZntLw4XuCqNbz3/XUph8EMN4CZKoKRB5Ey
 2CcOJ6LOYV/nhxcrEPcoqORGCYMoN9Z6CNTc7Sbp8TP7utka7FLLPOf1Dr4mW2smNGuLu
 KT5Qgj9PFAl1+mLSo/P5oQyA5LztbPLEpW4t6k617LuZjRQmpK0IM6GaKaaULD+CKEjVq
 hX68VhoDLyFS2RsedYdHsaK/ba2P3aDzIcPHKun/zIjzZahb5gcUfGxX02H6WKU2bY+a6
 H55GieZsU4EjEdNxB2s6z3/Z9K0OAQLS9iRG33gMIjdgNxiLZDLj4nfO2THS/GAjNVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790452858;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=AhhuKGy9rPFrn4KMi5xJ9e8He6qmF59O9gMvSu0TXm4=;
 b=nwqqIa/KvKzBv0QRfUKMhuqpfPc30gxoo+n9tSYnre5h044tuy6eRjz5IK3LgbvvcCx3
 /mXBA4q8J+/pVa+eBk9vqSXyxXKhGges7NvPxDi0wx5Frub2oPRyasoONso9ikCc6TddE
 0sBcUJh0hGhWzCXeKJ6vrJvWNC1hy+Zm1G4M+i+MQDcdJOA6nKJGjE5i4bS+p9XBu3iwU
 hxqUzuCMO+T9jMjgssxV3YcZo2MS1fdvftdZVEUdlouVMx1NU/+dltvRWrvI1LaJ3nf1F
 YsKJ9Eq4p+L6Jg961rZHcMn77VaTqVjYN8IMKCgziWzKENeSKJonfUnp/pd8WLEewng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=AQYqN1zv; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29A1240022
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:00:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1xPlVQ3UnP-00K2tm; Sat, 26
 Sep 2026 22:00:55 +0200
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 22:00:53 +0200
Message-ID: <20260926200053.2093649-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:lwtLvbsoZYUA8eEqjbGRMCOiBFlGo0niK6DOp+PDo14rIxkG2sn
 DHFN0DWI6c6r7TflCRlWIsyJL1uPjaHmjsSG52A+I8JReFb7L88B8YDG5iDCl3/vH01iKMa
 /J+thiWJ1AlJ9dG1LpBKPkqbVS30BUq0rxToLKEeFN0Uqobxzv75OsVefr0NHuSEzpxdYAh
 U0BnW4O1B1WtdWN0vlsHA==
UI-OutboundReport: notjunk:1;M01:P0:wDRoD91ol7I=;lznuy/lxBXpkIl92VTJRUkc+0j0
 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
 +0/K
Subject: [Buildroot] [PATCH v1] package/dhcpcd: bump version to 10.5.2
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: John Stile <johns@msli.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 10.5.2 (for details see [1], [2])

https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.5.2
https://github.com/NetworkConfiguration/dhcpcd/releases

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index a5d80b135d..508189a8d8 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.4
-sha256  6721e606609226dbf4d864a78802a9e96beec0ee034a1bd84138b3e037bba7d9  dhcpcd-10.2.4.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.5.2
+sha256  3e476657fdb6eeb38b277da3a48d0ac0113ecce5858ebdcddff2b629faed52b4  dhcpcd-10.5.2.tar.xz
 # Locally calculated
 sha256  3aeab006b01c1573b42d4440d7edad0adfe61ad05848ca82e02e745424a2b4fa  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5504914003..4400c684a6 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.2.4
+DHCPCD_VERSION = 10.5.2
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
