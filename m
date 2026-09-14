Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182ADC88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C22840608;
	Mon, 14 Sep 2026 08:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqZ5kuCmHnfG; Mon, 14 Sep 2026 08:58:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A306C405ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789376317;
	b=Q131XAWvczhGQfi4DkFnwf9V25UTiPhHFnhGckR1wer38n4U/KUP0syRSmYHOprHjaKh
	 Y7k6cs5Ctr2GQTgT5Yg+fkNG6/Wbg91GZbtbZLFm/Rz1sZeXeBiNtnB5GP6XMOZJSr/x4
	 6j3eyE2TY3QG5x8ZBM9S+AHJ/tys6Z19o/TgK79V6thoAAdNo/Mn4o70D45J1WF52HFyb
	 RV4IWSrXlI+vuDtK27Hz55rXtgp8IxSaAxWmgciBd8/yirsgDPI7iq50i9PsD7fC/Whln
	 b3Uj/uF8mdUR0jGoe67lQTxX6WTL3SElnIXpSbJCNNWFO8jneQ17XYL3qZjD7Txlv5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789376317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=x0V1PUuafmi6V/eubNluaxfeCgS/ZeMlKxCCCsm4/Sw=;
	b=Mt1JSvLVvdnoYsF93EBjv5uPDsUFLmRcJRQxhPx0f4WdC9jA/AvtKux0970d/O8/4ef/
	 KP30KI3Iz+DptEvSFMtMsFImAe67Rbsl4BXr97tPJgCkCFW4vqnMTrTwPNVe23HBpRXUP
	 Fi/uAuksxV3C3I8iZE+U2LvLKFnnevCsQVCyML9oHWvEkaUmjLt48hS96AfSR2U4aPDwm
	 9anX49ehJPOWbJzA7lN8ujB45VqmkmbTRecm7q5mxDY2TL4a8KoLWq+Y73T6fMfzchLYe
	 JlqMUBxRQFmV3JeMIxCP1VmEDGzKl9pZkhDfynwLa+pUEUnxoY2Y6ZLMdh0Iwc1Oi0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789376317;
	bh=x0V1PUuafmi6V/eubNluaxfeCgS/ZeMlKxCCCsm4/Sw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTDT3jJkMVikKOUtqBZlzRiud3UlzHn0tZf2PfK2L0AcEghAcA4cN+c4mOHUcS2fR
	 MyYuxhV+QnVBkotlCIFyz4znzLvr4fMptwQoc/9s9lVVm091TUFw+Vt7wVjX8ejBfw
	 6wKN6NKRfj8NlxIevko3QWOHvhAdcyl2wjs+p3XYiV5aHN4KU1Bm0UlIg2O5fNWdkl
	 IoqNR9EPeku6AZt1URrr4aXGWgGa+EXfXVBfhxug34nCrsg5DNDVFZSyJmnnFjP28c
	 lagDw1QFo1aZvZwyGVBWvfBi7BvueMH5ZVFkoGtozAZ1dpKgocVbtwN3COi/k7bKY6
	 O0YrjbWlVjb3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A306C405ED;
	Mon, 14 Sep 2026 08:58:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75D13362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B0D40119
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjRJ8FgTisb9 for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2DE9A4007C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789376315;
 b=BmoBCfo6z9v25/FBmPOX+mj+eWNGqiKjLvAlx42y0p2pjCwpeUYIvQW34XJ6DZTpfvTj
 Ilv5A4ssSBM9XQu1lVXt2xQo+Cwp3SbfiC/PNA/tFnoAGWKH/9+wEfswhQYhNWEgYuKJV
 FF+uvvFnb3KTBYmTbhJVnYtczr5vqKIZIF1MnqqMmn217CLw49y/4mE27HtU2Bs+AWzdH
 FVbsNWnHxG6LaFLaxxyRf6L4v+12277ABrA6/4SS9V21cTZa9c9qvEUeVykhgLZ8FLMOd
 Zgb3LATV/Jq34FfzN8prRGRSAKIiaCb2pham7vuT7o0T0RhUlW4TS157ww7jTJKbkug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789376315;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=cs1Aclhe03yTTOhZLgiolLtUIiePeeGXEWEulmUOGjY=;
 b=KcDJPhOAMEXt7dOBqY04PzdoSsd3jUi8PGDvk5JcCrTtoyWEqDmCM1SaQds70CZ0grWa
 zLzOLmpeCsopJRlE4QNVq2mJwspo1hnqRfAZS9aLgtl5jLDFbcnlqRgzfKGc4Je9DyikU
 9K3SycKALoxQne0+Nf8fIOrkwj2S+4uxpT6BP4Y3AtHBqBNARyMLh9kKLUhjqNUQHS1tU
 XUZZ6rhSBCTDpuoT1u+me6AsaJziiCVxZ3JsfqMi48hOXt0kr5J/PmhhyxmTOExrMxl+S
 CuCF9rH4xsnYUU0O/FbucXHw8RPV+kJ/Jc50vQ0sTB4vFyLsrZdB/Mfm2xR0hnGIo5A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OyJAj45O; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OyJAj45O
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE9A4007C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:58:34 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a60591ae52so3215116a12.0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789376313; x=1789981113; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cs1Aclhe03yTTOhZLgiolLtUIiePeeGXEWEulmUOGjY=;
 b=OyJAj45Oc9g3POsTXzYXhjy0t6qs9/coedsua2WStAurJxMDk8jwciJbsJFdPI6Stk
 yhi+tdsqG89KhahEQoatp44OqFgsvjZD905SB65PkmQnZuA2k+5kdlLc37jWNjbbYKjn
 sXIz3n/wAT+H5/PVOvNn37tl8Z0HTM3XNRxBpawk7lmNBoD9Swsw94t51zLOHsQ6K7Yq
 09EoxyAv44f8bzQfYYhRseFwaP4Xt3RMJXYTPa68gD1i/VtbTlZrqH+ieVIb5jxxOjm2
 nZjIykeoxrze8xqACquYANylN4fVKZ6ds+0sA+w4UKGsxUwd/2E9nc5eYKzRTy/Z3YUI
 lVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789376313; x=1789981113;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cs1Aclhe03yTTOhZLgiolLtUIiePeeGXEWEulmUOGjY=;
 b=KhhXiWqL4z3LX/i0PdmjDW/EtensufvXO9Zo0eLBvaCcNbOtWvTChthTpsXGpKwLX6
 j28DhKK9LFPsLN6MeFhDx9L7CN+lN25/zVvYVC9SEGE3jsf5VqNV4m7R5AeF3fJjAgb7
 AyE9rmnvIrQLMM2aQzMncL+rzAuZZcJLMyAIjb4SfXKTzt6G4gXVOmmjEqybhmbAGY9M
 vlWStbmHcdHKtIsbf5DoIAyTOyr9s69fikDqeJegdLQ039BWU2RlwjPRycok+JmY0T61
 gUwTYsGh6aBKnAkG6FTfgyBAOwFAV9yD2FLx3/k5GDdsLSY/meF9nIDK6bLmV6KD9mlO
 IkAQ==
X-Gm-Message-State: AFuF++mr3rcBcT3ThddrZHktfKjpT6j9xS2osYVY3szgQ0l/zqp0Amam
 R/Vc1z8liJ220st4Xq2aoTaKaaH1pQ4KUDYOv1muG4T9UJtrDWh/AFHRlb4nyQ==
X-Gm-Gg: AYBFou29UonqE0CtCeNRd38R5T3bTbREYSN3iYaM9mQWmV+oRh4CvvO0JskS5Yhb1T8
 pVfNG8XrZXBBXFJR+oJtN6d7pwj9rhAdpntmD38S9lhJsjFO0hyVNf1CrjTyKXhFsPZhtLiFHXd
 dZY4r7s2bu04k95+iogsPMeFkkrQvIRPYR7M3tZa8siZcCroRUjjR/JX8IOjeF+W8yMAVhGmrwd
 svGCItDBYOfYCUbSEk92bMKXEW6KbvRXP0VI/Ylwao7P6dEdH2sRee36hRMU8R2qzDbr/GFT+8Q
 acIh8thfhmkwNMborRttxrHbXqxrh2WlizmkgoD6EZzRbJTnOPchlyRpmv7s/nKRhWg7qIyGChM
 e4+AqOoA+UDTA7oky7tw1j280ct/2uADDYu5DVV//Xt3QTcXXtWmx6xqKdoImTJp5WNRx1zJFt9
 rlju+lq0HbYXNYelYHKQOdaJqEhtCb5F59zludtZ3RwuVAVuFfresjwexKIMjmYbzy++rDYuKKP
 lHnZR7i4jGxG7lUHIslnMBvsWVonxHshNfiPhLoTjc4w0xP
X-Received: by 2002:a05:6402:428a:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-6a9f625e94cmr2170140a12.10.1789376312642; 
 Mon, 14 Sep 2026 01:58:32 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9b59149dcsm3963547a12.13.2026.09.14.01.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 01:58:32 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Sep 2026 10:58:28 +0200
Message-ID: <20260914085828.3291832-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/mdnsd: bump to version 1.2
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

 - Add support for running as an uprivileged user
 - Fix undefined behavior when caching malformed records

Release notes: https://github.com/troglobit/mdnsd/releases/tag/v1.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mdnsd/mdnsd.hash | 2 +-
 package/mdnsd/mdnsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
index 024dc87cc1..e8c35b26ec 100644
--- a/package/mdnsd/mdnsd.hash
+++ b/package/mdnsd/mdnsd.hash
@@ -1,5 +1,5 @@
 # Upstream sha256 from GitHub
-sha256  b3f242415b2f29c510e709c862126ecab09d77e8dc1eecf1aefef879bce29003  mdnsd-1.1.tar.gz
+sha256  8f65b60c4e050f251db069bdde63c2eebcad7303f7a4638ef1a7cb423b8fb4c8  mdnsd-1.2.tar.gz
 
 # Locally computed
 sha256  89a722240ac1fdc0366696eaa5469968397ae274a0003e09a88d0686eeb3cd3e  LICENSE
diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
index ca443f6211..08fd1b569a 100644
--- a/package/mdnsd/mdnsd.mk
+++ b/package/mdnsd/mdnsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDNSD_VERSION = 1.1
+MDNSD_VERSION = 1.2
 MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
 MDNSD_LICENSE = BSD-3-Clause
 MDNSD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
