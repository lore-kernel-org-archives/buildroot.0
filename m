Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5894DE94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B1B6082C;
	Tue, 30 Dec 2025 08:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cDE3zxklFCr; Tue, 30 Dec 2025 08:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46EAF6085A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082787;
	bh=FH0y67M5EOk3m7m14QrFKJ64kvY3ecUV6DZ1HYCKt1g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Iex8a96v7UbEl1wNUnIYPDxVz1Q6RdwOsjE4aaab4T3wL+tRHGCUn4jEXb/E5F9VR
	 zDWZy6WvNOw/lNAPsKnrfcGcqO4IhkzQdXHFrGeQUrOglVoJCATUcYDnc7FdHDePoJ
	 7sgGKnScUu32qEA38IruyQLlVEMgwhBWWFKqWGgcjrqobc5S+PGbrmbluADfKNWN75
	 U0UNFpJl0P3K4u8P46vg5f/DA7qv/IZn9MVBXHDSJgCKi46QVYx0UK/1PpyiAtI33d
	 Gw1B+Jh8QKwskKb+yYKeAcXuMwlW2OwvrYs3ABSPDsvooi/OeBkDQ2Wbq0EiLq9k1d
	 869O5oekw+/OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EAF6085A;
	Tue, 30 Dec 2025 08:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 188F3D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AAF781301
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndwcwwp71vCY for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A986812C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A986812C6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A986812C6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so5436901f8f.2
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082780; x=1767687580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yQu0m0SakSJk70StsiL/ZdP2969DMnQADX0uPdxYfog=;
 b=hajtlcYwl55ijzstMYI4DyuCcYADNXCE1eXLhE3T3lp5UdHhEKYNcRZTnRhI1I/Dhy
 IhQHxPy7ubrDumcm4vzF1ghAY2A50p7psu576rl9E/OmmxtDC+IBSmqArhJYAxocnW84
 rCDuIr0mw7TyxxZrD5jYQTkameorr1r1/WQzDwquSdzXLp41bYlSVRtPAReyUQPKTCaX
 r6cOIgCCVgGL660zcwV10mxu5umaJIsb8oISsfDd2iwKHgQEXG9TA/pC8rNbtNIWI4yC
 Qc6/6kTrWIEkjBptxoUgCUL8jfozanQvQ8XfuwOlfBX3VNTB4iMEjXdKsFPFOusImTES
 MP3g==
X-Gm-Message-State: AOJu0YzK5yQfDkosfHBOuYUm2jy+MzeZL5sU1PLGXwGdqOd9Gzt/CZcg
 Q1d/yFqCaKAwP98R4mgr1g9bGdrLSKqrpNTMhU69ukaE7zErfqL36CUbxpZs8U8Zp+rVac16Xpb
 VLXJWygY=
X-Gm-Gg: AY/fxX4TBnSAdxrYi7fu8D/601evt5aUdWJPWB4yOPh+eLw/Y0GgpFKlDJdeggBeyow
 ePHy6AJGszrPzhEi2v174PNlolpo+MCrskzc9Y63mFA0OZ89dqMq4qAKBjgDWTY03ygwiipnmUI
 MshEWFzYAHjWHKXEYxewex10AS/9jkY7j9LLupbSH5inRzxFhe3vLhE6UJdsYCWYUsfmVBHthmQ
 2WsxgmQABcWbnVbF6Z8b1BavAoFBQHOliV5noVkctUKwq95391BItIL2gwr8WdIqNzdfMGucJSg
 w06VAy7gJz/XS6lcqX8+2YZA/tV7XN0s3buP4P9Xff+Km1Yr0iTQhSX+EhMXaQzpWWeT8NghFV5
 3h8jm+AvYJB7YdzlB6d8zCbvNstnE3A8Tjn73IhojVUF7XMXn0G8xfrtpl16IsIR/hPr9LV/bB5
 z4/Kk=
X-Google-Smtp-Source: AGHT+IEufMCBOouWk4M1q5Fjx9p7i6DU22VuXpb0uqabUkMsVzbXpGb0+miINhG7HlVPCWt3fK9mhQ==
X-Received: by 2002:a05:6000:2c03:b0:42f:bbc6:edc1 with SMTP id
 ffacd0b85a97d-4324e4c1230mr36713160f8f.1.1767082779987; 
 Tue, 30 Dec 2025 00:19:39 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:38 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:15 +0100
Message-ID: <20251230081917.18676-14-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082780; x=1767687580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQu0m0SakSJk70StsiL/ZdP2969DMnQADX0uPdxYfog=;
 b=DO503MPwLuu9vRTbkXdtcdQ07zybJBLtz8zIx0dL5mK68xlyC975vDjCiaLGFM26dL
 aTJf2NyfS6E8tqfqxtmg4CtA1tTKlCHLK0lEtWnnm3MPk30km4mSoLR+n4z4V/Ti/FzT
 RNw3Vc5yKCBwA5LAantiuBnR4SzZou/0X9Io3XueTV7Tkux6vo69suuVuu/b2s8M4PFU
 6BhuRTIlYgOBJuPU5fER7QpJbEXjKF5rQAUtbC7CMmsmwuLcz02MrCQvJTKSMev4u9KG
 KSnJyM/AEzTPzDcJuCPGxEH5UyWNAvLBn9Yu0cmiYGJBRh4VpC/sTajiN/a3OqMGPMGl
 eRBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DO503MPw
Subject: [Buildroot] [PATCH v2 13/15] package/freerdp: remove stale
 IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The NVD DB is now correctly tracking the vulnerability starting version
3.0 (see [1]). The IGNORE_CVES entry introduced in [2] is then no longer
needed.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4478
[2] f741e8f6e6 package/freerdp: ignore CVE-2025-4478

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 391b9a4675..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,10 +13,6 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
-# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
-# the affected code is new with 3.x, was not there on 2.x
-FREERDP_IGNORE_CVES += CVE-2025-4478
-
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
