Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E613CD98D8
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A36E83A63;
	Sun, 14 Jun 2026 15:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCoJuJ0iF6pP; Sun, 14 Jun 2026 15:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512DD83A64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452431;
	bh=X14D1gsi5X0N2FzuQqoW5l//nEurGOpZwTneIei4uzY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJC5KZBVYpSTQGEMOSfSYcNWJDS3RP2rLXA4LSXRn0PxTS8ycEpUw4b+Tf++Gj94S
	 Fs1qjNRniRHScaTTtTmehuHebVA04NH8O73n0DyAar2xrXOv1gM0WH0rc5iTdvf5mI
	 S33sVlXnG3KxABvgnusFDQetomEbE+4oI6Ds6p6HJ7hvxJhm57q1k4Fs5es4xJHXAm
	 nKIK8ygCJDXuEGpdq0ch1StXNWW8MGKr+WxwT6a16WQ6GQgpexCFSqmW7/2XfdmvW5
	 KXJn7w1/hIhNuO4WYvu3VhaWXmROGTK27Ajj0103pvTYxc7tMaqEeLMTWck9GFOMZm
	 tOHUxMFTTyMwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512DD83A64;
	Sun, 14 Jun 2026 15:53:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D137DE
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B30C41045
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UI7EEQp74VPK for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:53:47 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02516407C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02516407C7
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02516407C7
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5aa5f11deb2so2780450e87.3
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452424; x=1782057224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j2rANytQjvarDjdoqSfXUVIS+NsiEYtl/y+4aPJQAeE=;
 b=crvrAzgfTkomenerPPwsALvbIG/5qa3/0A8arRcpFKyk6zJLHj4o4bgYL6MzAWkFLh
 wQHv73T+i6vrIajNYpSbDNrb5GIim55VTm3DRPLLhfVQBkoSkMUzj8AlGmysNP75qpWh
 EegrRlBo7BTXn6+FxzresF0q6PjigXIiM7zETP/HdL+st4JaB7mKe89AFiMGRIFGP8gQ
 5wkSaXFL2tXAervSdXNuVIR4lCFXwKa/3TRmSQxq6kXs49diZGRmsZgiT1qgyFnbFDMA
 G+RXKewmipvUgM/4SDWylVKfrZX9GKcoFqPrHGrtLMlXQFrHAxwdMVuSSEGHFB1iCGhX
 VurQ==
X-Gm-Message-State: AOJu0Yzp5NF7YTMoLWcZRFgni4Y16KXLdx3AnvZtdEkfvgBQXnUGrolv
 WeAi0Zd0BdgD9t5Iou4uZg77xxl6jfWR00hSCy6OmtGumiNtXw2YZL5LQfgA32EmTC517hMOQ4R
 06fGoreWncA==
X-Gm-Gg: Acq92OE2j5yxSlhBJc+U49RgNrTHmxuC7stHwxgPjJSDT7GwpDEnj91M6QXV0gPFI9c
 ov0JSMoMHi4vfVspE4Ir0807txSA0YJ8tiV7tJ/uxduAYEA54Alohjm/gJppztE695A5mnaXt4N
 YzPtU+HR5Dqdr7WOm91kafAWC9xQbAsZBCHJ9ElI2NWEf7LQD/i2+44sut+rGqJfRhKHmLfBzoJ
 Iobj6F/cNUAhpJaMhJ1qUcVp5eB0ghgjctDbo2ssLrmxGIyKnbmiUTX/DeMn2C4fzmuhalWJ9lj
 hyb6/aZw05j6TLKx2+G0NelpQ6xmZTb4shr7n3ogoLPTbVGTfJpm2oLKoi8mKTf5dHkDfau3uy8
 NxbSBr0trN8sJSMC6qZxMSyBj4jVpZny/SoQCdpZ6pDGj/wGYbdltEHlUvi7uT1wCuc4nbzcEzc
 zK1kbLm4eLleibgzQOBFuBCAIXVF1Kq1+y5HkGOFXpREnYd1drC3Aqrw==
X-Received: by 2002:a05:6512:10d3:b0:5aa:753c:d8b6 with SMTP id
 2adb3069b0e04-5ad2dab3c37mr3210061e87.0.1781452424490; 
 Sun, 14 Jun 2026 08:53:44 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39929c29b0bsm19490181fa.2.2026.06.14.08.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:42 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Sun, 14 Jun 2026 17:53:22 +0200
Message-ID: <20260614155328.304282-3-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452424; x=1782057224;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2rANytQjvarDjdoqSfXUVIS+NsiEYtl/y+4aPJQAeE=;
 b=nvhUZzAmgPWIV970lFZkMW2R8mio28y9SmjWbchD79UzQMjBJTvhJX9RdXrp481KTt
 VwMMk342aPWc0McsvkzszwRRvSbCY5zknCrmhai3UHCvMw329d4cWPngnMY1PDL6JG7e
 yDWZz+U0u8TwJmq4NC6fo/0RfMKtm15v93hCBMHjHWFKVtFvxkMXtTP6xc5v2Zy6hg6n
 /ebXyCetdnwOQ78VdnBhI1SeP4gZFJ0aI7OGebYPpJPSbULhHeHCYWKQIJc6d8TQWZqD
 9zvq4OqymV8vZSHaRxq3bGXm5CNKeC7kkaCBYGogjUCryb/0zxyDQSF24pSLSn3CHn1s
 MX9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=nvhUZzAm
Subject: [Buildroot] [PATCH v2 2/8] package/libest: Drop java support
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

The package doesn't compile when Java is enabled.

It has been broken since commit 3c66f65a6a54 ("package/libopenssl: bump
version to 3.0.9") from 2023, and was left unfixed by commit 8dc7445056d1
("package/libest: Add support for openssl v3") from 2024, which added a
patch to support OpenSSL 3.0+ with libest.

No one has complained yet, so remove the support as it's clearly unused.

Note that upstream has not made a single commit, nor responded to tickets
or reviewed pull requests since 2022. [1]

Link: https://github.com/cisco/libest [1]
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - Add an explicit note about upstream

RFC: upstream has not made a single commit, responded to any tickets nor
reviewed any pull requests since 2022. Should we drop the package instead?
---
 package/libest/libest.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index 9f3168767d..16cf40b203 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -21,6 +21,7 @@ LIBEST_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
 	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
 	--disable-examples \
+	--disable-jni \
 	--without-libcoap-dir \
 	--with-system-libsafec
 
@@ -35,15 +36,6 @@ else
 LIBEST_CONF_OPTS += --disable-client-only
 endif
 
-ifeq ($(BR2_PACKAGE_OPENJDK),y)
-LIBEST_MAKE_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
-LIBEST_CONF_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
-LIBEST_CONF_OPTS += --enable-jni
-LIBEST_DEPENDENCIES += openjdk
-else
-LIBEST_CONF_OPTS += --disable-jni
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
 LIBEST_DEPENDENCIES += libcurl
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
