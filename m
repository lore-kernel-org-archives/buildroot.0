Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30965C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B671400D1;
	Tue, 11 Jan 2022 19:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bL9sEASwh-OB; Tue, 11 Jan 2022 19:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FBE408E2;
	Tue, 11 Jan 2022 19:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89FA81BF57C
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7879183E27
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4phTEu-hHnUM for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 19:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C91083E23
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641930794;
 bh=93uGy0oT+36GHCQBCbaszgEZoJuVDEXx3QjArqR3PIk=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=GqBP9v2vkBA8Z2C40WdOoA2pcsH+UF/m6thqrY4KWzrSVFBBKd1GCxTZV26pUuAsf
 AV0hrX6k9LJr13DE3h8KwL681s917qvgUA/FROqP5bKXUxSVFfpra9Rm+9R+Z+Th0j
 TWoF5gUSVV6bYb8kLjKciw1Fjik75nU5kEerhtrs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.151]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N95iH-1mJw6v28SV-0164Jj for <buildroot@buildroot.org>; Tue, 11 Jan 2022
 20:53:14 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 20:53:14 +0100
Message-Id: <20220111195314.25173-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ya6sECvSIKgSEZF2ajAi9gR0v+YYG+/sw0nK8QxhEKNOjheAmXE
 6F2WBZnhboQpr56pHp1r3bmWQ3loTuTtISwss0fF4d/vEec/eS2XKSo0F3VqSn5MACT9+q6
 pD98rWuzTdc0EEDd8DVCAq5rvOxTNmqVi04GvkEmyVVAMEkoOW8z3B9Xq6rA3vxNdB7D3AX
 lnZHOmuMmEsUwCaUk18nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aHPrgl96jzw=:6c25uVfojidI2+B/CoUD1T
 +rekUWWlXCEWMGjgY7aUMqpsIV69w2BQS1mBeJf/wxAOjZdxZt2dzcUg50zKnW2TOcE0M/lB9
 XHD2N364TSkZdsI5aIgS0R9sTu5vguHumRnGxQXWVjP3JqNY6RaGYm3O3IL7hlsGIxHVmK1RI
 JQLMsRYzzlJn6MiEN+SB0l8tPURIJgrnZ2Fq/joxZuCVrUzeMC2jXvIfTy+vnBIAt+k1qaPYm
 EpnJjgsstGJ9dlpzPiLUVLPSJms5wtRynlOqsTu+JRDmP6kUJAOeJGwICj5ESBI6IHa3uA/pL
 1r/ce4QlniFKW+2M0J8GEHoGyP2pXAg7ZiNikfZcHf1rtxGnlQek5RlDPpaow3XQSvSVEVc7q
 wG/440TJ3rKzUfQMnGC1VB5xKUzj/A5DebH5V/IQqQUQQOkO1xzTQ1sD2YyCID0ommT8Y2TGm
 2LzT7S39f2qdMjMm0TJwHzXd8VK63Ki1a1MOejqON4eE92z9RlHQ+tQ69BGFZudADZTlgZumQ
 Y1H1Vc4wx9fVt2p53ItZ9oJ3XhUiGKKD0BqTvlztlS756X9tRJua0fi2nT7dhORVEQsI2DsFZ
 mqZm7WKO3rqgKyfRVf3LXow/xSIs8s2DKPZZxLMgf+JMXYSkdvnLUxPhcTy3Y28m4jKKQ0TUf
 34hhLyk7hsmo7fnz/++pE2qAjLlpeFxzF7Q1FfWAYCHRs46sqRoV7OuFTNDyeqVTknQDITOIq
 ZPNmk2ydj7T5vceI/Go6uzR7CzehI4mVc5581Buw+cWuD9gIVfKOYeZjdceXiaNfcuEhf8il/
 x4jy96xc1FNElViJWt/WeXADDo+/sC2dtm4//rpAnsJgU6+5IMQ0DNPizmKn6S8N3fDo0kJ1d
 IoyI34Hax5YOv0p+iXnKo15IgppunZvSt9ELn7OrH3uke4SVRARo6DwVmJn8J6yPzo47S182N
 s46ObxTegdNpzB2kupgfcYV6lFyRJVa2lfGIS9YRSn7ulGWa5rqsT31surK64DjmcWyKI187B
 38Lfu0YHTaPqmEsyruFQlAs90jrjCVIE81tCqmq7AE5vUKtOsB1zst+stl6c4jDmee0knJ6SG
 IqtgVErZ+CrHQw=
Subject: [Buildroot] [PATCH v1] package/dhcp: change download URL to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change download URL to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dhcp/dhcp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 1edb3c5e99..18765a3639 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DHCP_VERSION = 4.4.2-P1
-DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
+DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
