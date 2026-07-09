Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCBCC44507
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAAF8821E6;
	Thu,  9 Jul 2026 13:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-UE-pjJZEBj; Thu,  9 Jul 2026 13:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D528217C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783603053;
	bh=bzCipUkB/XjCh3t1//YKQNfEHneDDyW/MMbWXoZ5AbE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mf+jUF/EGLFIdWxVmM0t4hG34E4+ZA86Aip04mlD9iC1W5v50UMnn4aBISyVZx7QU
	 FfzHNTWLK+eQlC2WzYyl8xJ7rjEVVcgQ0Dt+EESnODiimoZp0rItMML9VrE4XTjz4B
	 7995/7cB68yu9/2nXwlC0/mTOySaW8lFVL9JUMN05tBs49vkNTJ83t06YmcezsRXeg
	 ZARrTpkNmY3by3OJci8KhA0JapMBHXAcjtqzG+RfKRfCUG4ij5/VGoRRPm/RBmuSBm
	 fDRMypBxWpxf1T5bAOoa8OJhWS3DsaQnNAy1ma7c7ItEPdqmN+TGniMWyMI4WASZ2K
	 ps4J239PA6fiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D528217C;
	Thu,  9 Jul 2026 13:17:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06769320
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC8D260FC1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJVX-yBEEUAO for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 13:17:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C142860FC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C142860FC0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C142860FC0
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so5025875e9.0
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 06:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783603048; x=1784207848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vRVGEV+8vxf+q6PAAtwObNQcmneR0zvNHB+cUowR37M=;
 b=AAdEGuNiiBiiV3s/dF5uG3VlHBEomDI5AXMNUWo3+OGQ8FP7f49IUvNGzMfStGExrB
 7ImaQ2/SGmor/1fmxN3zpl0fTn5U6bdhU/DOikcyNAASptxunQAYpoMsukmJMTS1012k
 tKMCdaG7+SRrVaI6YzRoW8x5BUVhDXDJlj3ndU8qDnOcLEkHwdFjxe1Nanv17zes77/S
 FLc9NMtdjQKw9x9kQhdl4fV8xQFQPqaP0INnc/ofzztx+bSgegkvHJLxYA/ciD/fNuB0
 NGMh6qKn1TeX9Bhbd6E2GG4Tan6Rz+PscC+jbquMeXt89wFB0ZvI3PszdRRHbehJzizd
 F6tg==
X-Gm-Message-State: AOJu0YwfXDuh6GaN6ilM6+fXFHeuTQZPhGIkzGWsf/TzEMDVbxxBLDM8
 g5dCOhm/+8QydxyEG3GoQfGzN9dRRlhteQ/f24bWlWKyTuCm4FLKQ8nTouLgyGimwO2POtJSF8t
 wWqFTyDg=
X-Gm-Gg: AfdE7cmcOTkFd08enBYIkR66F3e0YT3UDLORLpDWztaH5G/RJ9nyPsbiVHlT9LorjQ6
 ySi4F0gl+bkYNxkDsN3+HnWwEfhWl08niwHBXiZyzdfakSYbaaqlfLY88oEmm1CPnWaCSAypRgp
 Ow/lBwKLIJhH7J+EnZFsSMGuSrEn3hAha6Ln2yK9IaW6s6aTLrnkaj0U2CugJwwz+51A80ay6C5
 5LHY5a43z3wosbYCrVAh4dlHjwZGx81jxa1pUzgZ3HbavQo8ekLrwtbfYn7zSaL30pyVLkTjFFW
 0iax9Ajic9JKqWAheYqh4TAjpVR7sFugIqPGyxvBfpadAJ1BjlHGGmdo75t5MLgKRRPUVNC6BQS
 bmZtBrJZcV8TQyvvBtPVBips6R13/Ddh4KTwsgrgM1Mdn9yOIlTLw5Mrr7DdAo9L7AlOUwdk9Mb
 7OhXDm9fsGAxlQ1Sb1w+cLqSpQZqVyT6nAC7x9qjp6/ogev3TP0spF2S90a7Ryf0KoJG6l/AHGT
 RFOUs85VhFdH14Zj0fxb7D9JFGDYVVGzFiystY5bp3Z
X-Received: by 2002:a05:600c:e558:10b0:493:e57e:7aa5 with SMTP id
 5b1f17b1804b1-493e68c6e63mr47203315e9.22.1783603047698; 
 Thu, 09 Jul 2026 06:17:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6cccfdsm61486195e9.1.2026.07.09.06.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 06:17:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  9 Jul 2026 15:17:18 +0200
Message-ID: <20260709131720.1250301-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
References: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783603048; x=1784207848;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vRVGEV+8vxf+q6PAAtwObNQcmneR0zvNHB+cUowR37M=;
 b=lKCESSf6rayHrRqE1vtkVOdyxjbQQ5CbPlrCkHI5V6g7uup66b13RiatmZwKbuO4G0
 k3irWeKD2N53a3M+XgEIieLUiamz7emkUTAMuZCA6LhLa5TzzEqd8u4D2rCL3ZsEx65x
 um8PSdgOh++LPvyTIyjUQUSbYB+Fu6aIsB8MI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lKCESSf6
Subject: [Buildroot] [PATCH v2 2/3] package/gnutls: allow enabling
 host-p11-kit support
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

Add a new BR2_PACKAGE_HOST_GNUTLS_P11_KIT option to enable the
host-p11-kit dependency while preserving backward compatibility by
keeping p11-kit support disabled by default.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
 - Explicitly enable p11-kit in case BR2_PACKAGE_HOST_GNUTLS_P11_KIT
   is enabled.

 package/gnutls/Config.in | 3 +++
 package/gnutls/gnutls.mk | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 59af32bf1efb..93f2287bf80d 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -39,3 +39,6 @@ endif
 
 comment "gnutls needs a toolchain w/ wchar, dynamic library"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_HOST_GNUTLS_P11_KIT
+	bool
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6411a7d62115..5d6360bd76d5 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -64,10 +64,16 @@ HOST_GNUTLS_CONF_OPTS = \
 	--disable-openssl-compatibility \
 	--without-brotli \
 	--without-idn \
-	--without-p11-kit \
 	--without-zlib \
 	--without-zstd
 
+ifeq ($(BR2_PACKAGE_HOST_GNUTLS_P11_KIT),y)
+HOST_GNUTLS_DEPENDENCIES += host-p11-kit
+HOST_GNUTLS_CONF_OPTS += --with-p11-kit
+else
+HOST_GNUTLS_CONF_OPTS += --without-p11-kit
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
