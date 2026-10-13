Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C7CCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0444260681;
	Tue, 13 Oct 2026 21:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_dFiMaNMHL4; Tue, 13 Oct 2026 21:49:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 038B360888
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928163;
	b=NUQhzl52+73/282U4ZwfJhfq3DYuuRUFb79lk3YJcRfcHDHizjpg+9BuYP5p6l9mjPji
	 Bl4Y62/vMG/Xld9UqEohtCK3Pt789hBe/EvGPnd3sq9ECeGxE+OM9Esq3fMaSob88FK09
	 k96cjQD2IyWM1uJpW434+iBl1HcR5O7BreoMlXqZj1UYkTAGel3b9eiUBe0UH7Pn2sXci
	 YziAAYSExjjzYWawTpP+p2ZPDsUIrVztMxKCiM7zFbhhl+dN9skT8C5NqgIOX4hzLR0rY
	 9wd2YyJWu/L68vtLq0+c+UfS4GrCSgp9z/iBm8RAIoLMncDuYtXP8/9ZdGtBQQa+T2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2HNQP/jI9286SgAaSOaE1+sAcJQ5DcuWh/DMYYsjJSs=;
	b=JMHriLf46NU2cW3zm7q0DPosVtOXPb/IMbJGBeFXYWUs6zDA0GVzKFCchdCnBMou/tv0
	 PL9ZUkKBx2Rv90x6oHndWLl4ZB5l/zZezIFZzYYEYj0+ZVDS98SPjC7vY11KYmXdRlimY
	 cGXm/R1z9+JKPIbIa7kdQOhC+4a2o+qwthdPGcXcRdwcN/pSlhmjXnLqZ1X5+x7s5u1Q9
	 ycGYSzYps6lgLsr5CKtlxZRvVqHeox+epMZTXAQE5LwEcdq9CWgz8DNdr4fKGmXVm0g0t
	 GLDb5k1WhfncvwJ6OE8sA2k7DDwhMH/3CA8lhRP3fwEKs9dTpNhMwZl94r+uE34yX5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928163;
	bh=2HNQP/jI9286SgAaSOaE1+sAcJQ5DcuWh/DMYYsjJSs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EIwc087NUCkjQVmZitRJjNVA8jyVgR8EULyUSHMvGUqpLzgOHpflzHr6e9Dg1/TWx
	 IFaFs0PteHtKb8g8VjQupxC/hpR8MCQJhWd0XUy/m+nwlg58rvY4c3azJDPS7yj74T
	 sbQBSw8klQffucYFFUzwMIyG+sve1Wy3B5Ssk2YufCqhipPaOhzfkMwtFhfbuTuxKh
	 39cWwnrnMRYYEwoAc6sqtLtSgaStCeDalG6kXHSlXeQyqzWb2Rm5NOUmqKKL31iX22
	 AEMspG855IKILR4BUlQvsFtxZIzGbZn+eQjhUba/6hkWpubJUPS5VQ0Ci2e76GX/EA
	 cvtjrOr814xtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 038B360888;
	Tue, 13 Oct 2026 21:49:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB92B235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D163A80AD0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCNROvghLh2H for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:49:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D0CA080A50
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928160;
 b=VBflEDviayNDW4rM2yFL3yUdLXMt2WME9s7751nDzZP4WxwbLRWR1Kam8uZznAQEBxMW
 lfrcpoGKPsVVwqY4TyLLK6ula5GqneMlkVP8nr1BDQyGPVnY1PYarW0xIq3UGSf69xpJo
 fhnOuxufn2QTEJzSgFAO3NyHEnMeMaT6kM1K7vMHIqns4WDvBsQNla9qrUKeeAjTx57v1
 lCfg+/s0dyZ2Yts5pRj1VqzQrHXfikOT7OdW/mBtTe3KwKW1vAJwc04a++X66KXpoWyH3
 +3bDIicN9xMuu/Q/GYu/o6zfpdZ2j9Ujm0Tl++0hsoyVUAMvEXhO5Z+O7Asbr/n3bGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928160;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GL/whzjW1DcWB/WW805ROyul1ErCMQ2WZl36VH8mekg=;
 b=niNH7+18pEbSBKANP0n9mffXQ/N3RJ3xObbnB0s6mU5AYiZiIZN2xir5HqPBRREtHywn
 OoMm1+rJ73mfpBCHoqRxoNK/8r/gbUlhTZx6C8/FAUURo+yMPM8m72ibptRSsdeXEg6gr
 uBYdYDHhDpm2J4OCxgfl3+iscB5gRMXGBb5rUOs0GCqe0U8QMK2g+er+G+RvYE7fLn7wu
 JoNbImdW3a3psTmtIv4otFwhBBUOr9B200cRH2DFkKLB90WPy4PgShvG4S2BJ9ckaav2u
 b/eAKcxLRdtSIcTKM5rZGOTbFH8jgbKE6+AHeLyYGy7X6v1joVjyrknrNxYzsQ1Vcrg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ARWKmgek; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ARWKmgek
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0CA080A50
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:49:19 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-8266c388b67so2942541a34.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791928158; x=1792532958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GL/whzjW1DcWB/WW805ROyul1ErCMQ2WZl36VH8mekg=;
 b=ARWKmgekgYfj5IXhYU7JX+/+UixLc6gfFCwCuwLmTYCCAAR7ZN7UNlx4ze6zpZOKa3
 AeeoGQ56U2/4PSita/qLx1iX6A++G1hFMfoqoNzKoZLnGuW8IgoCRdW4p9u4sD5veV+P
 VmQfuw7fI9CT4HxXTmGRYznkMo8nRxl3eCjThMsNGuaW2qbVaL7iFCXSIjiJB2J8x1kb
 cO+q2Tdrx0ZdJ67XpcJdzJQiF9NVjyv1TQagDiKZnuDyWrVz9ehhrE5XSg6WNoMByMyN
 7UJJWtaCv70SRIoNjX5G1ubbnAomGTT3IRlVHroxzz0RzhKY379n7JrEUbE9q9glZcqz
 413Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791928158; x=1792532958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GL/whzjW1DcWB/WW805ROyul1ErCMQ2WZl36VH8mekg=;
 b=tbXT56S5XF39QZxWjDwfZ1VinSe9yXwRtfFAEQ5QnddA/5KjIaFNgT1Hze1arLR5Uu
 7VYb7cVapQ/MfWByAnlyT0dst1mZ56t6X+kQ63TvM3VmaiKN+fBkwACeVZmDCd7c+uDh
 tqoZkm3ljUdxM3I+h0TZpl9wjWGFxUba2zmqtB5cJ3jOEGTe9FSwrc/OleTNk5KY3n6p
 6slo+98WlZjkpgRKV7YXd1GUiGE3esD8Fh7UVSgq6R3Wn5Hb42oiHw98ziNGncga5odA
 6dgb6fMwDT+b9dLCGmdMRShkjBhwIbPzbMRPEEaqE0zK7Zet0NMTPC5pxUdP1rnS5+Jx
 b6JA==
X-Gm-Message-State: AFq9FYIYetzCP6/EgJ4/Fsr9qAkqlMLBZCvPdFprCTvD7CgDS4eBh2yB
 xK4BAjyfunPebcrWD3oghKoHcz53TC0uaMTEdGfO3yyY4+3lblCwFZK6fVq3IAG9
X-Gm-Gg: AYBFou0OYOUjSbDhC1KvxuYso4oau5OOWd/By1LdUEXsWbCKKfxSjJv6wfKpb4ahjE4
 wABnKCqoBzxkv3beWyiJD9XsG0khLLsR1n60kTGNdMHGKE68FIyZOZvMW6abFqWWl1Dm7pVCBrk
 nFgxsnnaONPGK8X1W4YQq8areUHScV5ckIZeWCoH51DSNMLBBp7P2r/4Bl+qpkVWHZeUl2n/Lpd
 HwIMg6kwMVyiQvdacV7hiKVu0QH3n5fgldfHHjkYIzgD+/Mon1xnddM6WOBtEKXLtOQejByW7W2
 KAsG6JAytvEEWQPD2jX8jXM08Ft78CYJ3ag9hclV2jfvsBxaZkKXPzezkp76kZIzEVchM/7nKTO
 4xP6J2/Q/AePgPp+OR9ugjGh2UqatLwMoEqEwnvLC3QgMblPTTjxT7RAfPfG4KdIaO1LA2vjzrg
 JlfOsovQT9KDTcohUGmzeVlrgBAae3MDoYs2CdVJVFlWfOmR7Tf1xOSsjUOrCz2M00m57ELOpIM
 CkbE+ipAEZS0N6SR3oVHwSJSHfBcxn369ygPyl+cuL53Dpcra13YvYpMICmT8ZxONUl+kreqO9g
 hngF4SPAWt+cwqmlJQHimeyb8/45q75C4lXwv8fbNWxiq23mgGCpj6WA2CFtTirVKy7Oj+DID7p
 KuE5BI19FeD9c02NZlNyu4ipKuBE1ritIr3RSkW2onQ==
X-Received: by 2002:a05:6830:3685:b0:7f8:4ebe:2854 with SMTP id
 46e09a7af769-83090e218aamr13301070a34.4.1791928158294; 
 Tue, 13 Oct 2026 14:49:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8367ada5b6fsm7002094a34.21.2026.10.13.14.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:49:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:49:15 -0600
Message-ID: <20261013214915.2459704-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013214915.2459704-1-james.hilliard1@gmail.com>
References: <20261013214915.2459704-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-boto3: bump to version
 1.43.113
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Requires python-botocore >= 1.43.113.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 13a242c8da..12f77899f3 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  f1eec360124da94c8bb9b36f66bdfde1  boto3-1.43.108.tar.gz
-sha256  03341f089158368acf83e921aca98b706095322ca52bc4c039a616940aa5ad41  boto3-1.43.108.tar.gz
+md5  052f3beb0b2ca69b57ed0f597256fedf  boto3-1.43.113.tar.gz
+sha256  5a3e7750325c22fab0957c41a500fe2f95a936c2bbcf5c18f58472ba5ffbb792  boto3-1.43.113.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 97b263d8d5..918d47c26e 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.108
+PYTHON_BOTO3_VERSION = 1.43.113
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/48/59/fb93b6ebd9ad43eb9a58c7a6da51a0fe24ab0c04bc4d534a0bfc5eba7f59
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/d4/d5/3d303c78f5677520f9d3eacaca3d7f9a3dd3388f0ac2b9d357d0e2c0807c
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
