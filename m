Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA48C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D2341750;
	Tue,  8 Aug 2023 20:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D2341750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5Rh6UOkghxn; Tue,  8 Aug 2023 19:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0211B41741;
	Tue,  8 Aug 2023 19:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0211B41741
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A45E1BF25F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 037D782033
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037D782033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8Bh377hImIW for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:59:43 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 662AB82032
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662AB82032
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-687ca37628eso1569404b3a.1
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 12:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691524782; x=1692129582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=IqZ/0LFSmkSMfVC1+zb3fAAaBYjBTW5aaqhNGzXhbxsdZZCRQWktwMY+FnmA8Ll4eI
 Nz7dlMTm/u/1moZtVaHTDyFW6LwlnNUFo300VnlYCakNrDKNbXnyzkrNaM05SgCtfglf
 BF/zctLlnNNO5K7y51Ln+o/Zy19m3kWjy928ZiroOqsPQ/96P41Q/lFKtXQ2mqNZkpJd
 JmciuH5dVPruDWshJe1lkDeac70UMD+XyBfiL2XlIHamulomxWKGydI8RMfOz+vyCdT+
 IFQasuzJHeCaqtXsmjFoSsnqEGR0M6F2i3T8Ubiljo4WQ8Fqln8OM1ROQun1rpskDcMK
 PQLw==
X-Gm-Message-State: AOJu0YwO7gmnAhcfHzvOYUmlGm37Xr2Y/P9+gMF+AecOTl0GZL22P1SJ
 WQKo6PcOMZTOk68TCuXyKEv+SefELbJy6hRCJLoG8g==
X-Google-Smtp-Source: AGHT+IFXTZ7tYzICx6YpcIf3O3Nc9xneZsZLx0h/SBAbZxRnkvUM920tRDCas6yETzSj8vui2lQtlw==
X-Received: by 2002:a05:6a20:1008:b0:13f:77a0:7b4a with SMTP id
 gs8-20020a056a20100800b0013f77a07b4amr510579pzc.46.1691524782395; 
 Tue, 08 Aug 2023 12:59:42 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([174.27.153.162])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aa78686000000b0067a50223e3bsm8483958pfo.111.2023.08.08.12.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 12:59:41 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 13:59:36 -0600
Message-ID: <20230808195938.454382-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808195938.454382-1-adam.duskett@amarulasolutions.com>
References: <20230808195938.454382-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691524782; x=1692129582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=CGMxrA2GdPU5H3e0qswDJL8tSZuCeGQU+LjXWwlZpqoXUkmGFW2la0vEBW/I2szkGf
 Pry49wjjUJbjly9otBj3JopoYVATTXZa4QWr31onqa+cIUu3fKNtVhjd0fEDEiBnEgGz
 iBRumAj8M+MlkmtVsUgOlxqbaPzNX9YLtH2eI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CGMxrA2G
Subject: [Buildroot] [PATCH 1/3] package/python-httplib2: add host variant
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
