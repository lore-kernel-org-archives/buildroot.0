Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42EECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 03:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7609B81185;
	Sat,  3 Oct 2026 03:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSNbQFuW6GCy; Sat,  3 Oct 2026 03:40:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9215E81118
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790998812;
	b=d7Ojs4q1rNU0AkKSenaW2CzHcfyW7/wqzjzAxtg2OAMscy9jwSskX6oULDTKDORVGDuo
	 2q+05bZ46p/+Ma9SGb4/ZrjMVyNmVtS6Fk7zY6gl5Ge13/ng8F1PUUXyUC5qD1milQDCu
	 460bmHfXK3nJpfSboQFEEvwSBBWdl8BLVZme5tlDQUHJUD5vNJKakPW4+fUemHGtQbfL5
	 9AJk1i859k4Q/bI41Aq2eJzlnyK6HNOZJfbgoGh3FK+lXswEaEVGkVotMy5haS5/LOtHK
	 b0FUKUC7k3RqMmO1mJQSzESjrwyI83i91m2lJg04ht/fC9w5kfT1ipabVWF3mSqE7Dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790998812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=On7nqp+sQ1yBQQhyunFy+ArItkFE87DPvyH/QKbW894=;
	b=JPTV9EqeKmkbiIMb+w275Bgscc6d2h+VvYjkScLjGLidFTFTFF4AP70MsXDUHtCrGA+v
	 N0hOCircTBFQATJDKGGcRmtnxgEbP00wN+eEMywgQ2gWyVzSBbKNdlHeXdZcs5Mb8EOee
	 DJc1rojS9oHrogSO35egggyNKrAgMmQKwD/F0OkLLF/n9GcXCOBmrm/b4ZU3fz8YsYTwX
	 gIdQRDF7jNrODp3FOQFMwYLazk5AJyVroaEKnW34WN/2mR5/GtLMO7j+KPs704VIM9Vek
	 vmtTT0e6j23wkzb/gZcRuOW7ttTKId6er1AbO5m616pFFZgeJ+NcnsHRDIsFEWon68Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790998812;
	bh=On7nqp+sQ1yBQQhyunFy+ArItkFE87DPvyH/QKbW894=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=f1v9NSbBnCh+XfY7bVtfQ3ZbYk+BDEyB2rBhvkUeE4cDRpWN0Wfaw2B9HUuo6fIcW
	 AGuFHavSWeIRLWwtmZGwOuQZJjjnxdPHfLW3NxnF+ucKUTkDNWDLs/MMCcgDQjMkWS
	 Dnj3PDXvTVGgtUSRw1lgg2UKr1p7ykT615D2hBAwwLiMaChV/DIOoXRKTG99AHoe2p
	 XViXzoapS8+PVWRQefVDPs8i0yuPKGdP9DAKjtoEL9MytmJIEhQ/T2jG3z7Z5mlEns
	 vWb0i53K151o7Fbyiu9knnIWPqK8JMzmarWoE5rPfOS82q2t3rH6nAISQb6ZrGiG6h
	 dScxi+Y+AQgHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9215E81118;
	Sat,  3 Oct 2026 03:40:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0BA432F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C9240D1C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRUt1HqwbSDH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 03:40:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A73F340CA6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790998807;
 b=IlxZunvTFaf80TVzrcGegkSI3AlwOrywkA9Vo4hv/p03QRmvvZor6d17JcGs3V3MvhyR
 hdNaqVituypJnr/aKg/rGA2bS+B/s8IhnEExwm1kz0Mg/7PwmUzMGfpDgQPVMQFWlUNLB
 PH9WegRfzHrHoVyw46gsNaWLDim4r/IhFsQSqjn4JXJAGXyPesJDUoYnzF+SbuJhMyB54
 HMT1f7iWEc0F7Gs5F3LSexBQhpa89hcAHGVnrMJLPdxo0/FN7UTQXg8iESg/SiWyKhoEr
 to2Hlvyw5MNRlI7OcMUt5OdeHADF/oztz5bpMdu4T0/fHJ6iGysfn/sRa8HcAIiMnRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790998807;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=HxwxnjvKaIOW+lYuHn1t8NrcUL9RDWesIq4ciut5hkOFxo7PPSsQUi3epTEPGh88bXEG
 p37ADQ7n4IKLIB9KLwpC2h1G8h67WRSLM3/yi0HE/DKHca85dNvr7B96XeEhBy57QRw4m
 XDm+MSiwna4iehVg3hbARazmen3TeI+8HlAk3OWgqP4kTnVXdVsdFXI80Z4c+zI35SjoL
 Y2Ehg4IuENbMgkkRa/DMBlZp5VGJn+sebcmT9adSJmRjUBe3RFXvqw7NivxvQD8jznhKN
 XUkGS2i52lU8FGxE1uTyDeFSaV4OKcgC6IgDt7CPNtbawGprZQWphe1xV4LpIBYf5sw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X80+88iy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X80+88iy
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A73F340CA6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:07 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6c1983dfaffso327352eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 20:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790998806; x=1791603606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=X80+88iyPpA1loqVbi8nqZZ8Kbr1dfi/ENMGzpLWbsLjGn9jhO0N3XF+Iu/Cqev63U
 Jn8QNS71nttRPvYTyWhUzK+0Uf1Ha+raamxTDoqoisR2TwoM8DyZXwakcMVdjFAUYAUX
 TTP4Q3ktabs9CUpuOACOFyHBynPWqbC4wPwZhzxPC0SjU3oFT1bla+bu5hq2Rke1tZiC
 C6k5oogbTK3foXHjSRZ3AgokDNvteruSHfcfJD0xo669skX//eT7kXAuhwmlJg4a1juB
 1yYM8FtnZPTW25RjI4uPM+mTAoFUaKQ8ZrU7vCZBbQKrW2rahDbFaWjwfTdDGlAXOhvL
 rwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790998806; x=1791603606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t/EqybullRSGHYdS7B+ys8QuRylCzzVJ2pDCFky7eGY=;
 b=ODS0+5NAyE0cqMjWuLmQhHoAnmSuvyLPEoAxDoOcksKNHESDrXrT/TwKc9s7iQNnns
 zi24YBoehyc1R3hOfHjmvtFiUquOEmRyQYYrKLS5QNc69apmPWWVTdzaVzmnWKGk2FEP
 bRyWFSd/mUyWAlOwB8nLgiXerIbdQsFu3JgWaEmS7KuOGlVmgAKKm1Put1E0ylITOpQ9
 ud93ta+2e/71wSf/5wc0sLw093sOR7+UIxi9TjmMkzOkx4wrSpjEY6ty6+iYg32I6gJo
 HOWme1FHVDYPZ/NGoGss07J1EXYqLo91lF4e/lc5VB9Q20OjsLuFsqjmibksU8ujmBSQ
 fl3g==
X-Gm-Message-State: AFuF++lJmfSWOv9uUWOQUDW/OzHjL5CXP5mTlQCbdTp6061PsKVt3x3P
 pmPTzZIClXFm2dVtDouzkkKZFSUvdpUCwH7VfCudrPn7eCYK2YDc32q9wIEigQ==
X-Gm-Gg: AYBFou3WEBBBicOp6p2ueEbk0NEoIB+gAGpFhdjqkmKhVjqrwSBcxGdexyOf2RrZU5+
 UOnkRZpTCk+gHZ9z3NOB478q/RQHVQ9Cm3C5VbluNWqRw6B66V9LbdpQp61gehmCgV6Nm065Rs0
 R9VEbFF93CwrB5kMkI2vAvsqupzEiCfK7lY2vYXyCGQD35JTQiDfxnApVFEP2a2738G3xc2ebqc
 dBgk80WQ82rSnP15WwyuTZ3Yf+Ls6obYWyXsWtzfK0v63rTjqvvEMd51MVpl8ooNs2FGf/sFG/c
 XfOWNFqhvox7KZjn+0mN+ZoXFUcLJoozUCEfcFFMIXuujRqEZicWk3JUhY2UjKiA3V4GsQaocq6
 LkyD/2ywAoTZiuD7zZv6m2oCZW+x9vXbI9YHDRpbB2VT8DiKUsy3XEo6nzCIcs5KF2iTQp6/1/1
 cLXKBbOW+4fxDASuw2RBj2ivMekvOLDwY659TtJpx3UVnrPwTtBsDPMSWcnJ2LaGlrmhcTpU/le
 Qe+Ie2aKeB0ITXbcBB7iBKkGrcJ+Iir7AmS+3vxIbBSyu1pfPhXFrc6WR/hAi8AD/zSsF2T9CaY
 FF5reDbJMq7HkzxphXzaZcZTcsuoIqOJ1msFamraS3cZjwoYUpuNmWwU8eiZy2Heo4oto434+1t
 x7VB69Qws3GPJujuptNPmUmsrxggSYstCijJuHTOVUg==
X-Received: by 2002:a05:6820:1787:b0:6d7:4142:8b8c with SMTP id
 006d021491bc7-6e09ef4827dmr1062843eaf.64.1790998806334; 
 Fri, 02 Oct 2026 20:40:06 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3afab7adsm4203344eaf.10.2026.10.02.20.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 20:40:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 21:39:52 -0600
Message-ID: <20261003033954.462113-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-setuptools: bump to version
 84.0.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..51e7fc67e4 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  c6919a4b0862ca30604559e163a6cce9  setuptools-84.0.0.tar.gz
+sha256  f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73  setuptools-84.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..5c5a41531c 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 84.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/6d/44/f5da03a8ef95d369145c5bb53050e7877c9f3d312e128605fd9504829143
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
