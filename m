Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8176CCD1BC
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 14:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF681617A1;
	Thu, 23 Oct 2025 14:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP1g5D51evBY; Thu, 23 Oct 2025 14:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEAE6178D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DEAE6178D;
	Thu, 23 Oct 2025 14:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 858CE70A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 768F96178D
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugi6CiGhtk_s for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 14:05:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5E73616FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E73616FF
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5E73616FF
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so199437366b.3
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 07:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228340; x=1761833140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AnTjmYmdDZJaHzGOKs1PTMWCv83hbqru8CtmxQXy7K0=;
 b=JpWo5tohef+Nn+BHBNcFl9umCzSWnfa4ta/ZxOPymjclSn9dgQfJoSFSFINmCQY8lG
 8VP1TRX1mlRsq1xTzm6b9NE69K6DEVl613eE7ubTRYt3Rsp2tH9okZJWlsusIKPlu8TC
 cEOAup9tl+GhuRtQMpqF1ElV6xNeN15ZIHwojVTXGq5aDjx8OEJK5xBF59Fbog2qgn/b
 eGUgrJPcuscPPqvQEZu0aeaiMGeXL70zokosUGFqX27dVWpr5jqKJXkaU8UKjJVpJLr2
 Wut/nsDA6L64fMzA0Rer2u+G8xQ3JDBVKtATnEqwCyrxbgAtdh+bhPXogrhmLnA+8HAk
 o2PA==
X-Gm-Message-State: AOJu0YwL3QD9Wp27xPiVB8g5U4vgo3CNxXIRxxhrAn11d+aBrQOK/vXF
 1OFLE/QOhDIPnYxiPI1MmBg0Ga76LMUCneRrvO5HATr8AYbud2l0/RVddqEnuaEok6y5akEkxpz
 ygFgDR9o=
X-Gm-Gg: ASbGncti3N80fca7bG+0ejxBEBlfCAhZpEESxc0J50IIsTkH7T7JxLvFsE5A85A59ZU
 giT1F2y/M5vaxVLRC2tnmPdR88xbA64VPI1sxVfXRnKergciH/aVdQ9ue8/VHJ5FsAJw36eJo3J
 vFsoAlT6A9ClOC+GMiY+TpTeuG2wFCrgUKI+HhU+L/QhFw9kLbhA8JIiqKcDd0iqEg+RBbRtecn
 jQ77jqwB1My0A6KtI9cHogtqtt5MrY/BJHGrmiSKchm0W+6Kquy/KeLf4G5mP/Dsq5aBoJ3VJyw
 mn6pzwwHh6GyPLaReo23bBDYud3ipr2FF7O5+kD3Ymdem3XnWUHbmrjEyIBemJVU/4dTYXdDmwk
 vgskyROX2gIn/smxdKjofeDMB5HsY8gRrJF5SFtNzxvxHTLPE2r6tF1F3Gb1iCbl+bqde8pN7aS
 1wmyuJTsxgH7ZBWqx40XmdLOeJ
X-Google-Smtp-Source: AGHT+IEqzBeb81SHqF4mQOQpjlwRsBm1IpStbrdJIPPwGXV0zZuURcfpbW6+hPNCXd7Iaz2ESXK2nA==
X-Received: by 2002:a17:907:3ccb:b0:b50:52a4:8f9a with SMTP id
 a640c23a62f3a-b64764e1c37mr2809380966b.45.1761228339625; 
 Thu, 23 Oct 2025 07:05:39 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51317e97sm222834966b.35.2025.10.23.07.05.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 07:05:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 16:05:26 +0200
Message-ID: <20251023140527.544948-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-1-titouan.christophe@mind.be>
References: <20251023140527.544948-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761228340; x=1761833140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AnTjmYmdDZJaHzGOKs1PTMWCv83hbqru8CtmxQXy7K0=;
 b=NK022Q2LsnRSulYFtzylDi2hWhyBXfbWOZBvWAmLhJ7kYYozoed4ks5cLLO0OIi8lt
 oU3LVFc+nFyZfrzfxoYj6JWHWdSYN+jwRvsmmS8L6ML4SfNjDuktOUBcAAngPE7TJ0+a
 NinNgf6nyTV2MBA0R6qV7FBrJLTpS86yCv3RJzbnJoh1ugTY+GJ15XRTqfja0EF4HM8l
 fG/+VR+mqzT+3csfONBOD6XwxHVgNPXEF1a/e2huRctwJFDRnG6+YICpDZf/m/WLy075
 WaFDxxrAWVeNTbRW8uoRoJ6sTCYj+kwCi86AAG4GLVPYOu+DgSBRIBGpgAv2U7cI+wZD
 +2LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NK022Q2L
Subject: [Buildroot] [PATCH 3/4] package/openvmtools: ignore CVE-2021-31693
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openvmtools/openvmtools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 0f5c86fe6d..58876c877a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -13,6 +13,10 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
 OPENVMTOOLS_CPE_ID_VENDOR = vmware
 OPENVMTOOLS_CPE_ID_PRODUCT = tools
 
+# This CVE affects a Wordpress plugin. VMware information,
+# previously connected to this CVE ID because of a typo, is at CVE-2022-31693
+OPENVMTOOLS_IGNORE_CVES += CVE-2021-31693
+
 # 0013-Properly-check-authorization-on-incoming-guestOps-re.patch
 OPENVMTOOLS_IGNORE_CVES += CVE-2022-31676
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
