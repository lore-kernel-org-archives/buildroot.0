Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A0CC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 12:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F22C843F5;
	Sun,  5 Jun 2022 12:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSsEFCLE2ysK; Sun,  5 Jun 2022 12:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB277843EF;
	Sun,  5 Jun 2022 12:48:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A84F1BF311
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 12:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 293AC843EF
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 12:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qQmPCfX5tRR for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 12:48:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4378E843EE
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 12:48:07 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se24.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nxpfn-000CqU-M4; Sun, 05 Jun 2022 07:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RHvI6IFLO7jubznnf3IFacYE683KUKhOMhMPkHv/bIw=; b=bNVrXQaoOR36P39dVJhf2+zhtT
 js/l0prb2My4sFE6PKUQ95Ln6oi4+IryNc2zF0cSq7x6zDJcjaoFZuw+xrBSsvn6fjayluxZd3RXb
 daki93obpAquADYoGuEPIh2Z05QGBb8VML5tAzNp3Nzu/iVR7Em22fQ3eJw79nWCvyUFt6PCO8NLQ
 RgtOF9TjCSRgWf5OHFGRIC1j4kmm2z4filM15Ubj4BT6K+9Hz5GTwjU+0qzGOsNU+shbI115NQfI9
 aVWUdo4nv6XMWKR0oNk3BFCYEBa7r+YNUo/5RmAzkGMcNSM5nRYSuHAjepf23MNoM7kzb6s5WeAyN
 RB7obE8Q==;
Received: from [95.111.54.43] (port=46482 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nxpfk-000250-09; Sun, 05 Jun 2022 12:48:00 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Sun,  5 Jun 2022 15:47:49 +0300
Message-Id: <20220605124749.719103-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+6w/CN/sGM9f0p8F13GlVdPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEwgh
 S/AeyjcqEXQjvQBWnHaB5w7VMSgzYws8V2vqkQ88v9pI3x+KowyxF2mXKbTf61Gavff7/jlq6fkm
 O4krnmuxC+60g1OCli94ELJwhE2kub8D9WD6xfbADJ1zA9HBaqd0cuPgMEJQbrlCqWEDfjMlo2gF
 qV79OAY7fXoo/nPZ4o5sCtqcRuHYPoBR/xk7W5k+48LH88N7MxgR80QOpNPjizWiueKsu95pjKjE
 ZivLcvKBc5WQ80hTGTAhCSql9y6IkaMv3Z4p4HmrwR+KNrmceXZNG0EUbELA0uv9YhdOn9qh6YJL
 goIgpooGHNCWjcyd7yQQWL3CF2XL3W4+3422Z/tWtoggnTxct1hogZAWXPgQW/lHmBQYTwGUOuQt
 neLwejJoep85cxiiuAjU3Rbb9o3fo72bmQvDKfo81/tuNGzNK57qt3T9bZrIrb0avJ7PU4uldRLy
 m7Y+p+3nH61no0OLT1J6F/uPV57T7EU3BpiC/gvH9D2a5ajKP8dQZrSJjzN5e8VFlEjmqR4rzvUX
 Ku1VbgppFJRGoXLED7mH6r3C2Qgzc+xROZfGnoE3614HqV8NrjpIfAVmkZmE2qRJ7laYEbvuQrJ+
 TKp9BDpkOMyeV7249X2e1GQHGQCkcclGgiviJiOUFQh00akkcKtmAJ1M62784OylUJfDmQxrEJhS
 dHbPMCc2t7rrP3FjdozzdPOPWdKjATtJ0dirmaogUfEKkGgR6X8JQY9+1ZSkQif5NiaPmZ+LPXFi
 VmtBqlP6+VrkY2+6/x1wn2vYqPGD2pb7TJVA/QLYgNSBeEiWUQWD8ZUl6W6GbLVSRWNFEvfMpnhx
 SILwE2lXJYqUIF7k1yqD7JMJmjvC17jZ2ygxHHASJNUmoOHSoqgqxfHmWbxnBMuG5KUNd2YoA3i6
 jZ70GRAiJJgA0pWCx6W5Scflg+Fazkpch+34xBFBwu8BiYOl2rdDiSdgFm4f9pMpvOAGmiCBLL73
 OB7NgJfiQgVvXnDbCojG2e3Yg/V9Nu52s9vTCZZbfz0JmsQszuRWhyD10tfqoGlbdTkTLaWCAXLa
 sZx/CEDhpdDivWEKLGL1FRbQAHAsi0HaQ0P56BAwXro=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix missing CA bundle when
 wolfssl is SSL/TLS provider
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
Cc: Dimitar Tomov <dimi@tpm.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Without CA bundle curl can not verify the remote peer and work with https.
This is fixed by adding a config option pointing to the default location
for CA bundle in buildroot. Alternatives like OpenSSL and MbedTLS use the
same path, however the wolfSSL build options for libcurl did not include
this path until now.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/libcurl/libcurl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 15943f7512..11f1e4de59 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -77,6 +77,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
 LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
+LIBCURL_CONF_OPTS += --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
 LIBCURL_DEPENDENCIES += wolfssl
 else
 LIBCURL_CONF_OPTS += --without-wolfssl
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
