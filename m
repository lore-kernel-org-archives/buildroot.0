Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B96FD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E318131C;
	Sun, 28 Dec 2025 22:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu8Il6NgzYE7; Sun, 28 Dec 2025 22:04:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B0881363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959459;
	bh=BGbd2EVN3XNMWD3FmSSD8N1fRhr1Uxt9svL+CwSPu/Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nyu62AV/E8ooJE26I0ar3aCVzK0YB2pCT9mcT5i1fvwjY5MaT/ID3kVKlnVXUt0Kw
	 eR268XTVI6j9xxButyWoDUiGAYyDNnFkWsweND9pY/o7WYp2zVFhBnGj9LaLtFfRW1
	 6FT3bDeA7sF3sKVE2UV3VIL+eJFe4NzTkArm/4AC3YNOw9sCpNbVy2vNxjPA/xfkap
	 AmPJX0MXsXpPcajjr9eVYd7eddaQjFzlp4BqBvSw5dXH+NJlJUSV2qE37Nl82mYE1T
	 vnvzudHlCOJfD1q5eqbd2E1reWyY3AvyBvj0KinYcVZfIzJtCgR2GzQxKUcjsfkMGV
	 MIJNL8bQNiNdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B0881363;
	Sun, 28 Dec 2025 22:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 417F61E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2298A4054D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzCUBYwgT1as for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46A684054C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46A684054C
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46A684054C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:04:17 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7cdd651c884so2142097a34.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766959456; x=1767564256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GH6/EtQ1uVGo6ItUk/eytWda7V7VFvtU29vzud6AP8=;
 b=n9Qszd1WJFuZQG/dufnEQlQ9Mia9DFWbGElvRWdPLY2luNvGUPe5vaf+HAGaQLCVGS
 qVjuGrI8FhM2aLX3Bv/rRFgVLMrTG0glZw/7lRoD0Amng33nfT+GjmqUcO0FITnMJKF3
 Um3rhoPPWpw6lIxdmww1JGaL0o8XuKLURTNhXgW56mLY7iu4xFK54QNxTJcJmEeLsryK
 6a59Jyhz7SbwJ+aEozaoKMS/P3zyrastzRjAycVhpiPC1lctQVSVZ6BQWi1SyvmqHzVI
 bWyul9hoJaxGU+8Md5dauh6vv6FQz1afx7yUGHg5aumZxG3bJ9ZVGyGieOJ/9pJJIweR
 Fb4w==
X-Gm-Message-State: AOJu0YyCq2f/KHHdD7GF9nuoBu2B5hIRaCjgpIdOEuVlRfWXcUJHLcTA
 1uRPw84D1AbHy92yeKszo1gxN3DvIKkKLEKIN3Oh/LdaYjBtvKbxDKsrlkX8XkA7Zfg=
X-Gm-Gg: AY/fxX5dNHW7/pTY30x4og0Xk3IlqTyUVgBZEZAKzD+xzwsbK83vGSO8z43drDGj2Di
 t61LSauqGcUAYBht3cJyKD5XMCTsQTh1qsOKntXUp58hFrtsQM3/YmcV0ydo+pmpwWiDn9d1biM
 AcCtp0Bc1AepmHAgcf23IhRYSeRqkGs0qWoON4hqlw9UkngLRkFEpvj+7h+ZJqL/6HjbZzTNZz+
 iymVAL+ijACAn2er5TpDxK1FTh5QrIaHtxE6W8QKAUkUCUn/0EmR5REKRE1IoMs+/WvJQwBXmK0
 TaYdlbj72KBubQXoskjCN2KxH+dS5bZBjo8luSBIPLtnPVr/kALCigu4v4X/EE0zyvFAvr6nA8i
 31Tt1G3AoSLERYtLw0zMc1UQz3sRvi2jpw12mKuKr52fVY8UkH8oRmqeoiwgbYuccCdk6X9BgUa
 wcL12STjY565GB+HMWxaxRHPo+Vy2H+Bbq0ar6aMRGZYu44CBx+AgPJ3U9HCBjqk13mC7FEgerA
 5Gsgkkc33rsToMonJTttaHzZuYnr6Djaq8zb6f8ZmJAszzNN8mMSNw=
X-Google-Smtp-Source: AGHT+IGjxrHyjIUS78GQ0OUwsRons3dVmVxQlMgSXWXUrfv7F29dCfsX7MpLVVAr45Al7A2+Yhclbw==
X-Received: by 2002:a05:6830:6e12:b0:7c7:ad8:68b3 with SMTP id
 46e09a7af769-7cc592a5296mr16801026a34.14.1766959455868; 
 Sun, 28 Dec 2025 14:04:15 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab620b8sm17695174fac.14.2025.12.28.14.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 14:04:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:04:07 -0700
Message-ID: <20251228220408.2722820-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766959456; x=1767564256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2GH6/EtQ1uVGo6ItUk/eytWda7V7VFvtU29vzud6AP8=;
 b=isA9/NRk5t4gj7Nw5Vvbyux/8BSul6a7aspQCKC5d6e4orwJWFog4qRgj/KcHp8lVU
 YKZLMlAWcHN4m5Fl/+vY+37sp60YyoRiNLMrBKpcE5ZsgVURg76GMkJMHBnN7cotyC0x
 4njlXID/TP461pP9U0Xz2X+rTz5CGDYr0WmRsQWF/sOgJaPtT5H8Ivg2M6dCxrd/ov6h
 WYt23H3K2Uhl9spcWdXYgLxyfM0C7I1bnRJrmTpXre3yJkp72PJcjvCog7oi0pOV/xwc
 WFPFhXqPS9q3IUTyUnm8uFNBKy68M3rHnD06V6P0U93TtA1f3kbkMl0iiw6Bf34ijm/l
 h40w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=isA9/NRk
Subject: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to version
 1.28.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index bb19d63561..b6fb2b6d3e 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  6ffb3087c9b6a9ffbfc1bb394f7ed1a8  hatchling-1.27.0.tar.gz
-sha256  971c296d9819abb3811112fc52c7a9751c8d381898f36533bb16f9791e941fd6  hatchling-1.27.0.tar.gz
+md5  0d40370d4684147d6e3d1e3800298bd0  hatchling-1.28.0.tar.gz
+sha256  4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde75bf41a21ab004c8  hatchling-1.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 57fd34530b..a5a29aa20b 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.27.0
+PYTHON_HATCHLING_VERSION = 1.28.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/8f/8a/cc1debe3514da292094f1c3a700e4ca25442489731ef7c0814358816bb03
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/0b/8e/e480359492affde4119a131da729dd26da742c2c9b604dff74836e47eef9
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
