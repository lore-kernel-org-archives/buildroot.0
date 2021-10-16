Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E0BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:00:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513BA6115C
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 513BA6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1E9607AA;
	Sat, 16 Oct 2021 21:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bJQ3iPwe6JZ; Sat, 16 Oct 2021 21:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4744960705;
	Sat, 16 Oct 2021 21:00:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51EAD1BF3AD
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EB9B82798
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuGtuXZ570f5 for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:00:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4266A826EF
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:00:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso583587wmc.3
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 14:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kbt1xWIDwmUE6Tz9on3IRquHxIQhNpass659ARaccV8=;
 b=C0/F0DE1zldOmwqJhUfohCX3GEfLFRIXs+yEZ9JRQJBmNZRac6giDqmYzGsn5bgs82
 JC3rAB418yOAb/Z+NX6vgRMnSokANaQBKuzPTTvxDfMwJbY07xgcfjGTOBQ5APOk9yKL
 ipVy6eFw9XjCiEeITV3A9u5YM0KAlBXQRX0LfyTrcL1lk0pCIuCuxv5NRx0kjPWidX+D
 BpA603g3iirDFU9uJci1S78KhXH+ihsISgyjA8+MzV9P09znr+PzuVOlegPWUk0v35fO
 kImg308IUCZ63pfQJ1AfUXwP66VFJLQNReJTLJKnx0AvqLRgKQ4Li+X3KtbO88pEQMqQ
 DIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kbt1xWIDwmUE6Tz9on3IRquHxIQhNpass659ARaccV8=;
 b=mGo5q2kOS4dpAOiN2wwakmFoceAh2C/vyjN0DqfPJ4RclpTQthY67xnCNwW4n8Lack
 Ds46fO9xqA2Osm2a/+hw7LtQDgEeEjFf0eiCqRKzM+hm5PyK/ZCNTJVoVN0AfhVrScHH
 LN/Fv0dR+pscpmqukZnhXdQcfPzgqAj3Anu2+fD/Kr0feCt0jqMn1qO87fTUXuL5lp7f
 fGqR3ZAtXkigHtCExUyX+1ejfsXv3aSet8enuYazx4/lymSYFSnSrKHTQY7j3lrsVHth
 fwiUsAQTaR8+a5nV3UP5H05EQZiGhEix1TfC5JEjYwaxDBYLEslLjL3vDF2GlqSsDIUn
 PKHg==
X-Gm-Message-State: AOAM53331qR5Yo+L3sbMxlUJurmUxbG3KV6XH7oyn74m55f2OQbJJaaU
 2XBF+NiFS5hFtCRDcX3pzu34BWKpcjk=
X-Google-Smtp-Source: ABdhPJyJpiwaU10tRVuW2eP+fggu9Zg+bwJEFGpAUxewZCn8s7fva5AOHYhFc7VF6IsZ0w2HEeiEOw==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr34262961wmj.1.1634418035084; 
 Sat, 16 Oct 2021 14:00:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id h8sm9361734wrm.27.2021.10.16.14.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 14:00:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 22:59:14 +0200
Message-Id: <20211016205914.400173-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/strongswan: fix build without
 eap-sim
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build of eap-sim-file or eap-simaka-reauth fails without eap-sim since
commit 89f20c1c3f9d667ec0a40bcfe17db94ff098e6c0:

make[6]: *** No rule to make target '../../../../src/libsimaka/libsimaka.la', needed by 'libstrongswan-eap-sim-file.la'.  Stop.

make[6]: *** No rule to make target '../../../../src/libsimaka/libsimaka.la', needed by 'libstrongswan-eap-simaka-reauth.la'.  Stop.

So select eap-sim or eap-aka if needed to enable build of simaka library

Fixes:
 - http://autobuild.buildroot.org/results/0c550721c20946e5b9d07951a9698b88e9c53e7f
 - http://autobuild.buildroot.org/results/354a022f789067edfe7ebd464991d1695a697a7a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 4f02efb79d..23334470fd 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -86,11 +86,13 @@ config BR2_PACKAGE_STRONGSWAN_EAP_SIM
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
 	bool "Enable EAP-SIM file backend"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_AKA
 	bool "Enable EAP-AKA"
@@ -100,18 +102,25 @@ config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
 	bool "Enable EAP-AKA 3GPP2 algorithms"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
 	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL
 	bool "Enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM
 	bool "Enable EAP-SIM/AKA pseudonym storage"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH
 	bool "Enable EAP-SIM/AKA reauthentication data storage"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY
 	bool "Enable EAP-Identity"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
