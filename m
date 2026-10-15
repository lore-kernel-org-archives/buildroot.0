Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9438ECC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F23660AB6;
	Thu, 15 Oct 2026 21:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCxG7ib2SEYm; Thu, 15 Oct 2026 21:52:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52DFE60ADC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101149;
	b=rGpsKx8LrHGyEz25+L5PbWpQKpNTyAHZSXhmEdoQ/Cg2NLeRIzwnSd2K5+s+wUBgW5Bp
	 IF7Njxz8Qo+NKsZW95GL4X8tSZ2pYiMyRez4Pq50Lhc87bxzolc0qUW1V7DXYwzyUe3LK
	 6lQK5lHO2emCFgL4eaemrgNemNkInsFvCRqWbc2qBMv/1uK7T/9nseUcKi09S+2SOAse/
	 KOzBMXlGrVB/9S1B86W6NxC6GZ8Dt831tStaX39NhMa1n56cPIOnZiC/2QBTUPuzPD+8X
	 lnSmUTwN5tDNCCB3I9tTxw2T+dSafErS8Yxocd7i2dOA1eoIg/Q9MfTOjpBfFeVIp7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rn/0eP3vdaaEWslm63nN0fkVUCvAxSQd2tqHbBYcmFs=;
	b=lfD/J2uTzjkziaYWfrUE3quIObgKL9KOSExLu/scBuXr1W+w5eUky/xwnnDfdPIRMqML
	 4/RtSoBKJ9SAUT8quwqEUH+ppXvhjiVUBxy5KXkYBQ6iEyZLn9MkftIyVu3G4WGALXW1B
	 3rZimrLhiPOE39cEStHQh2JZcYteR944AfhW1wPX8nZ89IWea8GBSKY4Aqti9sKyb2Q3n
	 5RLL5/i7BKWqGB3hbn1DBS+6o0qvYx0ae0XHm3FK7+x5LKjsZnO1uzglRiDdGrXZKcVvd
	 w1nDL48e778amiN71hTS4AKV+lZsf7ZCAtDl3Ki9p9Z9GS9TS5BIyQLLSFTmvWOTwPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGLV1Il1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101149;
	bh=Rn/0eP3vdaaEWslm63nN0fkVUCvAxSQd2tqHbBYcmFs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GuABWJi18Jwyv5BN5kvAcveCbJGkqEOp+NK3xgXCvJrbWo1VWfoiMaahrFXYybpj0
	 13/Jtvp7VgTq5HN6WuHMDlxxG/M1xrtFIRD31T6gKp9QZbuv2T71YYbnNfHMtKb+vG
	 DIKFNRdWywcfWcnwA7VkuGxYJwocmA8FOsHtP7ElvkpRkjNMvqPMThGH4u7ERLNsXz
	 98UlKz4zKCjLyyPfKiQPEfT778gvbEVfEfPhC9trvKZrLzrRUC/L2WiuF/QtmSeygq
	 EjcLXPdW8Qi6QqwsCsHdy9pgOaqcgXlXRmYBczBXqS4uSXOfpt/654q4tjhquRDwMW
	 wQayqmPrDEFJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DFE60ADC;
	Thu, 15 Oct 2026 21:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07C1DE52
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26EA60ADB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVuStyOSPtZB for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 04E7160AD6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101147;
 b=sFkgibO/0STt+nt4qb1GPTwLI91QJEIuM075SG1ur6FbGB0DqgSlkOu7yQB0VHd/2LNw
 12PsBC2srxxNr5oFFmEpego7T3Pi+0JOH8kc0990/YPwd9IcjmwMM0jCPEq5cYuKFfcPC
 P5lgZSfp0w6mDfIDSIVTumQ6pLq2hsxb5GMAm4MgA0erMPSzNP8jO27u3T0tXIg0QcP1Q
 hjy/CxsDMmOBa9liePwEydF9fGiNMTP2ZsuBLyLMfPwaHBg2/jaltfq+/tcya0c+0oJm1
 JmQtf1sQtuqFNg8793gSsyST5HOtqDRiqZCewexXE21ByWgifaWA6GnFtf8CCfzQOXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101147;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6w2FuWt3xvu8VNjxXO83jEfLT1d9/vTcc083ECVTqSU=;
 b=B1eOCWffLzxZvxzbBoWWka0UQBzjpzEMO4wMkLlRaFHJfgOToXhR95S2RvFZwYsUSwzf
 LOPD9METOh2B1O7rY7o7ItCYSMm+f4lCwGa8muXKyeRJF8PdFoomUlEw/umTgp3q1qKJg
 id8PiQXytaaC4nc+P//7Ed2mDHNICqz/q3qgv9i0H/gvpQYZU3+HaiylS/XLKKiNlgjW6
 wfnXgWFGkKY3+NlwRJwT4tUdemCxG9Xuwig8n66C6DMsqavKGupubxyh+5g/fX8yO16rZ
 Y0XuxJ23VHXMeIC6ZUa9yQW2G+c2RnK8VI4OE6U2DUIvAx2PAhqPCyd28DhKNGbjacg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RGLV1Il1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RGLV1Il1
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04E7160AD6
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:26 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-823545ce223so1933336a34.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101145; x=1792705945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6w2FuWt3xvu8VNjxXO83jEfLT1d9/vTcc083ECVTqSU=;
 b=RGLV1Il1efkpiHfTyl1TMTvT9l/IMDzucU5ezq8PJmqouIsxJ9M5KKavsgsjtEVvKv
 ywxEs24i9OrokM0O0oOi991E+OHV1jQe0jpxkw1+43MgT6hWVCTtvPG47sHrSz2c1Bgg
 zH1cdW+xOnax6ACumC7OyKuN7ksQrkm3vXa7sD0Zh90rghdKb5iFw0ujvMZNHBNUNB4Y
 AkYP5SXxYfzpqhl022f/Yn9urZhLG1dDi+86B3ep1C+y4FVilZCJ1k0BlNvA1qyPmhx3
 bLfO7aP3xo/dDKD+H2r90NBEtS8TiMT1+LeiVUJrVMcWVcZXwWdOtbRG6w0sAWdSh6uc
 1sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101145; x=1792705945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6w2FuWt3xvu8VNjxXO83jEfLT1d9/vTcc083ECVTqSU=;
 b=TnSKG5Uz1M06hIxxTYoQsho1mllN8v1Huv/dS3hp8DjWbe85khpXGcm8N3bW6HjqUi
 2wpOg1vEV6Vp/VXbgV97XAfSEh/MqyBHICCKMCyIW6e9Uc5K1tFMmL/2WBcctOwdzZY7
 sG57TY2w8u0FqulwMnOdKz4/AD9Xqf9fdq2NDWGbYFzhNs2GSGpYRQgbu8f0bEZB8AN2
 WslWyt8MhmdoBmu+dmoCK2SX6jmUdiLaWWMwzUACYrS4YgFAgTovcUkym8vxSEx+xKdo
 RGKlTfB9xIaXfvUWnAEPtp3ZvMTPVJqDtCbaJdgdFlE0RQ6OQLAw8bwqbXQyFwgpQ8KY
 7PfQ==
X-Gm-Message-State: AFq9FYJdXAT6nqcEF15sWBP9W5a1so3XhbzYtFV/wW03sDxT9Of8jbUe
 /cKhHhxDJ1Yvj5KqoTPpzQvDIunxQXzUgqAjlA2cLmY8V33dBLAZtYvbPSCxYg==
X-Gm-Gg: AYBFou1hM1rgIUNEG2VKQDbvs+80Sj/j7vOtef8C8xsTRluTTGg9RYjG3aEoD0hXwHz
 211rbYSd9n21LAEdiV1KKyEgP4FHj3VPn6XjskoqTzSZOp9IqKbVFGo/xE9vHTb1kiMEMiTRkRN
 Ob1rac2v1KlCB/6fowKa63dgeUdIcblxYFVKLWaYRsVeOCFK7XU7Ly8jT1Jl4QJu03S27lvv3Z4
 yuBUY7PM8X1fgJTXOUlO4QdJp9JwUNcbb5QF+masPHRZyaspWuqsHrb7Fs77PzmGHIIYbodmn2l
 J+f84JGFA8nzafYXYWsaAllAaTnawPzy2UlShwdbp/INmgZHMBiZsCzH0jtE9lk9cH0T5auCJkh
 LnE18ex5+kFK48rbVoPLK3zZiH2gEaZUVXOXGqKm2y1YwN3/n905zi2/B1m6T87bH+xsXZ0/0FI
 OTDIFVNUHwdgpFnalbQxGR6+gTFo0UyIhmcm0yYe3WV89RC6mUabnubQRBFsu9e/9GaUfjvWP2Z
 I06eWZJAdYB29r0ifL29eM72rEb0FrVG9nFIb0Vafpl+B2/wRu/T81wrHHC5yu4xXzrmq9goLDJ
 MEwJu/C29D3DUnd5EavwfKT6BDj4CpIp4SDrYZFi2cm/GnUrKrcPwSHTW7wd//xJpgJW6IuwZao
 NhxHDHbvIqMdKhnsnjIVYI4+eAjgB3vxAVAnrh0DZm9U=
X-Received: by 2002:a05:6808:3203:b0:4f4:fc4e:77e9 with SMTP id
 5614622812f47-50c56dee3a7mr19423817b6e.42.1792101145244; 
 Thu, 15 Oct 2026 14:52:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:44 -0600
Message-ID: <20261015215210.3426895-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-hiredis: bump to version 3.5.0
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
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 786c9d206a..f58478b6a0 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  af5fa7a3efd797b3cf705a347eb54a20  hiredis-3.4.2.tar.gz
-sha256  9a566dc70e9dd84be3550babc56a8e109bb65cafcac635aea027fa425196a7d7  hiredis-3.4.2.tar.gz
+md5  35a8f576be9d497fabedf4ef16939029  hiredis-3.5.0.tar.gz
+sha256  c227592cc56b7df247abe4755c26723965be68972be2149fa441ac33d82131ba  hiredis-3.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index bf6d8edcf7..3550179ef6 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.4.2
+PYTHON_HIREDIS_VERSION = 3.5.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/38/da/41b341ebed1eb6f1074112936af98bb52880724737887ae9bade9d7ce107
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/b4/72/64065841e93c3b8b507d7889d7de371e5f397b5efd60f18c2d82d5bd3636
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
