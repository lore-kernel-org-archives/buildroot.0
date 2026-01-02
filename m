Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D25FA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B87CD80B38;
	Fri,  2 Jan 2026 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTLorBL95IsR; Fri,  2 Jan 2026 21:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F71480AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767388559;
	bh=ZTdUyvABsxszU72Pv0EGs86DkMr3TNjntYWxgzDWGVc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FCdeEfbOwnnCMubT80UiMKdW0Tj3Oq9b9uDzNqqg0m9FE68uI6fhWaj+z88G8NU1e
	 wXSr5jiGFu86ccdl62DDq461Xkr+IEx0CSRQ9Fuuu9cygSZDNLOl3P8GOs41UzCL2B
	 HeJDGRW0dc2lMveS7Usqfd0tKb+smc2iIH+efEUx2xG5Dawh3I62HxKYThiRYcExMH
	 dFc3a3WZlnWwKxf/EtMsJ7j7OH87MYuwuumj+5i2O0LZE6DnAIBpKRF1MdNYGa4OzA
	 tF5eD67aqKdJHtXgcvMCTQjoJxEY4H3QS55ijdzo7p4Z6iHD14JCdthB7nhcgWVBBZ
	 7StdiLEqWD3jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F71480AA8;
	Fri,  2 Jan 2026 21:15:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65E9F440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6413F40393
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AV7bbyo88CtT for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8571C4037F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8571C4037F
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8571C4037F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:15:56 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-65d1bff2abaso6635284eaf.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 13:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767388555; x=1767993355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYpm9j3QDiOgq1c92u6NDql4nmDZF5dArj9oyZYutT4=;
 b=n/OzxeKFYQReyriMVpMKgUcnRE69thoWvH/wCOrN/VRtrXQKVNCRz9/akFF4jPufuV
 Bd89WswtqsYEQzooHsH2wV4ZJ/GFzG3llkiz2mbXqOt1fegS+Rx1Eiwqy7Cm+10HRkie
 SN53FvQW2o9gg2Wx6ZPmQYAH6RXfR5xVErM1IHja6sefq8eLNLf6ppjw30njhhOKPgyp
 mXj3ctmmOVkv1x8p2brkuEMqeUem6YuxoJ2Ar/qSJ08V3zo4kuVkYNHedyKIZNmgJ7Dx
 YZaHXmSEZwx+Vqf2Ev324hyZPVmYygcCvZoQ8mr7ZSCpRDgkpKZPmX3Ya8uPTp8VEEOh
 UgRw==
X-Gm-Message-State: AOJu0YyNJXvAmVC18tIVRDJC4qg+7MenpDVFgKRm6+UjXlQYXf70LhDy
 k7q6ByZk67tbluW9dVTNOEtStysmRTu1Ax8tJvEeR3V7FIRLRERXeJ9bM9ovXNPwO+Q=
X-Gm-Gg: AY/fxX4qsXW0dkkBwVYYd0RE84kQ7jWg/+9dOjz5FSmIP6lHQguStAPjy4TuRsco8/K
 ieWDTWxk4Bktn1+jmXVSB+/TPrkAkBkPwfPEh3bYflbMUhJUbxJtiPILNzSup6nvnFOP0aOvUWN
 +S8a7ib+F5MYd7brIhsMIjPRwtfd36GSfbM0h8TLc2A7LH0D8UM/aWEDbBb07IaY8nyiAWSoYAI
 fU2HDzGNke4WnmZeF4Ba0wjPNwsZLHwVnFzAficqKIIkTt0yN0i9laKPlYNn93UtM4NaxlSqF3M
 PTPMHONTq0iJc+01zpRmwezzIYb7g7BAXeEwMSG6q5oSMguhO6QKxZSKJcCKPAIYOyi7ZcGPFU1
 ATtOXExt/Wz69Ooxzpey6ZtOz96r47DNSCX5oE8WvI3K7xv/LFg6goF5odEiHGxYysosamnxpNf
 W7qe00nzg5T7QVB3okvJ8cp27cFnIRpwypRFdQgB56zMnsE0ygDAmz/AxUMjvNCGgShxPhB1lyj
 hC9u0Su+UD1BeWIzqezEtijz3lKUofZvC0F+P1w8YuVjDF5uU52Cvc=
X-Google-Smtp-Source: AGHT+IFn4izRqsWoV3QoOXDRtaCuuQiBEHxwc2Yvfthy0SjYKxe+lRkIYlW1f5+7sqOIsEbvSdn68g==
X-Received: by 2002:a4a:ba13:0:b0:659:9a49:8ec1 with SMTP id
 006d021491bc7-65d0eb9372dmr14207934eaf.69.1767388555165; 
 Fri, 02 Jan 2026 13:15:55 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f69b9b0sm24783570eaf.11.2026.01.02.13.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 13:15:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 14:15:51 -0700
Message-ID: <20260102211551.65873-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767388555; x=1767993355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FYpm9j3QDiOgq1c92u6NDql4nmDZF5dArj9oyZYutT4=;
 b=BidSXYsjSd7h7SyaAElyDm1FMC+R3MyY/NFsU74bordQ9O02v1ioU2/miAu+acvl80
 npwFyzl/wJFdFgcDR76+ccbdQ8D/sBOZrPRRHHBKCCwNFT3lm1nwaCMH5hkOeOnHmNoA
 qhlF57z3hyGM6KsEkGdE1ArJpk3SCQFfCTEwH9Y+7jLdnw8/i5w6i+sYelU4yfl1k9a7
 bcYdKGHfdIF9rLo0eeZZgZzaW5UBNkkDP8S7uTEendbj4SfDC9wJKB+q0v+FTRpDP34j
 18wyXrvwcrHUYm2paYw1Iu1oKqt8Xxqo/I9uVHdMW9EgsZzs7t4zkG9oPAyUkaOat2MU
 oZag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BidSXYsj
Subject: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.22.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 3a3af3cd26..b0f32e2d13 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  ad5a6114cb148cd3e400e34e6826408e  magic_wormhole-0.21.1.tar.gz
-sha256  b6d35972a19b4baa44e022518317b4e0ad26709fa019196f67ca0d127672a367  magic_wormhole-0.21.1.tar.gz
+md5  e57bac643bbc691e94919be496813a4c  magic_wormhole-0.22.0.tar.gz
+sha256  52a3ae2f0c56d0d4cd52188e50f10d2fe14bfd46e287dd50b72e7f7e851434ac  magic_wormhole-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 67091352d0..11d4a8867e 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.21.1
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.22.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d1/c6/0ed9e0dca81eb5d0bcfc72690613bf26a13b95a9edb95fc35cebbfff8fba
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813891da57999cf953e9c553193c900ff363c4cdfdd48a74f65536a883
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
