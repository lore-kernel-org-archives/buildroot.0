Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A02CA5FCE
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 11:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B34812ED;
	Thu,  1 Oct 2026 11:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9O6bDGU8Rp68; Thu,  1 Oct 2026 11:34:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ACD0812EF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790854486;
	b=eceA0R4zG4OWdWIU6CsEpgBWOWSv0WLpT9grc52I439lP7aT4VyMoV8h3QYdtX+JcROk
	 WdGazEDpXmWfavyR9i6ZA37/+37hLDPO9hkkwSL8oxsubctUBH/NGzCFU3yRL4tb+WfI7
	 Z7mZKclju2tGxHk6VgxcXfSNN8dbco2dv8FEv6LhXvk578PmnrwZl7eRDOo8cZw9vsgYT
	 B4OSdEEjV1UKtWf0J5pFtRNkXPyfi8EVi599gIj3LxgQgQnaZ/BD1C5EX6pBnBCgs+WoD
	 LHigtnwS0/AqU3bCkPoslsl64LgNSbZh1irwfldSPxyuFqT/R314LQXZPlPX6T+6bng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790854486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N3qHho3gmi/ynBVml4RKP0CHSVcpHnMBU6p+y2uoTJs=;
	b=KN6AWxxpmC9Kz52nsJAUluhyw4R6Dh+KE0vZV+7oKnRJsKWXHslcdMnI4h7PpBQW/tgW
	 ynrNKNU/MmQWHeeHkJzJgwiu8iK3UaEOOHYcWzCcZWbm1O3casuh1jbKCOQtZWaypTWJW
	 MLEAbyJR6XPm+9C15GBZ00iAYEUcsGBCNTzFXkZUiD3ZhvQUj3S+JO8D2LVpT3GGW3GBo
	 cVq7rEKVJTbcO/hezLmmalRt+FW1Ifj0Vsbzs5rzLJX/GG5hsTN0Gfy/s3GHnib4dQezn
	 ZgV63NtgS7Cc9Elq7IxlKlogAImoBL1t41WuRkkr28N2nHejn0MC5CQhB10/5mPsv5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790854486;
	bh=N3qHho3gmi/ynBVml4RKP0CHSVcpHnMBU6p+y2uoTJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Au+UV3IjMgXougqNfX1NF7l9WzyRgKSq/0mkpXm9ISD7LhMCnJEQWpnydWS94Q0J7
	 lLfuoOza5q2zp75ICiFELZIcEgGxIbtkyyPe/Z2rEpzpFYfCg81OsRSR0mdtHinOte
	 DsaMnHr3B0f5Kdt6NS4WXoKMYl0j0cOlYk4SaidjCxCTG5r/4J2SfPFZjU1WTx6+dN
	 kh00VP65QWfiPHG4/PAU/mHIo8S2f5l9PtBMCKvog+Carw+FvzXaRRyCjjkex/vw+f
	 8lO3in++Z4Z+aNaxkFLe7BzkTCs5nZ3YIxgPALlqJvv0VR9UpRlIzj0y8TiYy/zNK2
	 RJ237bIcbmmrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ACD0812EF;
	Thu,  1 Oct 2026 11:34:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EF134E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 11:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 628C740D62
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 11:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMS9TdBm4Whk for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 11:34:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2501540CC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790854483;
 b=gpXubNp0RLBgs86W+q6WrYYxA8ZeHj0bZYYPktig0YUC+unZn5lzxy2mvSsml/pEUP3W
 bZyEla6uT3cc1pl4REQIggr8nqMSuMSP5QHAb9e5bmyRmyGcdeBnnQ64NppgnN9ct/Aj5
 9C6abuit3p5e4BZkjYoGgeDSe6x2I1kFhdIEz61KgcMgDKTK5Wybgj7TVwz/1sL+WtYRA
 3JvNCMPMLMtL16pGP45TaKfQPXjTSC4vRUCgyNs9B+VcErcJGq8+OUhufoWHAp/j4bDfH
 d4ec5a85jhJ+urJ8pxOU538Lga4MVnazFPNoat/7O7vEpB9Bed4FvLzk6qg46Sjfc2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790854483;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=87Lwx3qed659lqUnWAtczgPybG54/iwz2vAkQ5LggBw=;
 b=VDOxprlpGYi0CN/cm8MvCSYo/wDAdOd66ihWgnc7XFtY3BBtgfhM//idI6H1TTAhx7Jb
 rj1eNIXRLJseQs4pTjkgvPHM31v2e9MhvPnJK45GJP/2f35tMOb/qVlXcrY0nw5a1ucD1
 FpZJg6MciM0qzbbcWGVnUo8eSZFlgeXbqL5ZSGWFfAYkj531JG2aGuSmeXnBmNzUYqzRV
 OfXxzlipL59qLmiIFNc8actryhyFbkoNppQVlGS45Ewdx1cnk9jxfARd4HnlJQN0rG6CQ
 b3rzLakVf3ii1hqPpKa3iXy+nNpifPjIx8d+98QCj3Cv9+sJCV9/HYMEUyVbti7D9yw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="h/rxEqa6"; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::d;
 helo=mail-ej2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0d.google.com (mail-ej2-x0d.google.com
 [IPv6:2a00:1450:4864:34::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2501540CC4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 11:34:42 +0000 (UTC)
Received: by mail-ej2-x0d.google.com with SMTP id
 a640c23a62f3a-c2e0b486d91so314228866b.2
 for <buildroot@buildroot.org>; Thu, 01 Oct 2026 04:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790854480; x=1791459280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=87Lwx3qed659lqUnWAtczgPybG54/iwz2vAkQ5LggBw=;
 b=qY7zBzL8dgftW2wd3gEuw3i5MDhpYURtvzT9tFRkMEt6qMQmC7ut4z76u+rg4y8FRY
 KgXioOERluxdz5boUsQd+beSNDjc7UYIreQEw+18CBYKA40ohQztMnk+FeK+zu8V9wyU
 GpYcrMNz9NOkUysHzzO0dOGx/JWQBBFtkNUIiBI+5uhLEbnbfGGBSKzM3i7SKhip5Uwx
 HF4uOy+VmGhbp7ZHjQbkYPyDZAudxREuaz0OXVa9W8iYO53NU68a6o+69jF8tvvZxuRP
 St512IpbyNoj0v75ipSYjqAR9tO+8ldcnGDnf6FCSkSRfvWZVyAhz09yBqgnA1v2VTUG
 OTUQ==
X-Gm-Message-State: AFuF++kM1J0AOKO3+iOlqrpTkZjuMHwEGI05rQH04Rfa1l7gy/lq+d8I
 REmCsWOehSZiGaVYyLSpVZ0GNbU1GPi3FDGLy7Lb0SnVgWov0xuSineT4e4LZQ==
X-Gm-Gg: AYBFou1d8q/amGlJN5dW/RHW9a5gxW+25RsEiZGEzX1U0fd4yL//uFFqGUgWr0ifagk
 oHVY3prbSnHwLC4NJtS0+VkeCW4N6CEefoFNApAp6e8mxPt/rSgw32NPiHQ3LI2RBf/arlLrfiv
 d4yjmgfp7+mfR0BBKUOO3ypCEiH0+pu6BIOPPZn6SVDSF5CaO7sb6m6hAoGAGMrFc22dT4/ePnl
 7H5bEa5U6r07RkGoe9CFLdxPpE57E0DDbvsFpHhcy53X/vD0stNnKjSmZo05hgFYUEAgCPadkRq
 oVuFF98LXhqRn1+CO6E5/MZLQiwd2a9kMhHWW8qYycwsf/ywBfJI9bl2h6nLKi+T/9KgF5A50sw
 nk5sAm48adJ6brmUM5yuc5T0B6LCjT6aB7ZCVWt9xGdYv3s9nA6o7Lb6Okvr6YpU6e6GorRVYcE
 Cc8IpVj9TgtLdL7UpI60SMPjudwjPnjQYfnnc33yfE5XpjEw/JRNDWuBeZR8HQzDdji/zuSpo+m
 VgBE4rJUEAtt9dR5RoxVLCqnTqwHqdZ1Ilw7RoxfTWzdn01boFdZOPWU0gFTtxB
X-Received: by 2002:a17:907:7faa:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c2e3f49ed14mr102160866b.1.1790854480151; 
 Thu, 01 Oct 2026 04:34:40 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e31dd955bsm138142766b.70.2026.10.01.04.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 04:34:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 13:34:39 +0200
Message-Id: <20261001113439.597461-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/igh-ethercat: bump to 1.6.13
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release replaces strncpy() with strscpy() in kernel space, which
fixes the build with Linux >= 7.2, where strncpy() is no longer
available to kernel code.

From NEWS.md:

- Made the macb (Cadence GEM) EtherCAT RX path allocation-free to
  avoid receive latency spikes under host memory pressure.
- Included macb in the device driver table and fixed a
  `CONFIG_MACB_USE_HWSTAMP` build issue.
- Use `strscpy` instead of the deprecated `strncpy` in kernel space,
  with a fallback for Linux < 4.2.
- Added a test build for kernel 6.18.
- Improved `ecrt_slave_config_dc()` documentation.
- Adopted the CPPlint configuration of stable-1.7, fixed CPPlint
  complaints and added exceptions for device drivers.
- Use an own pre-commit container with cache in CI.

Fixes: https://autobuild.buildroot.org/results/5c48b38fba102c38630e546eeea05cf206eb9e53/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 23c28ccc24..930fbb0610 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  1fd0c5746980de42b4c1d476d4bd20f5525a9b3fe6e6ff50032bc565c82dc85c  igh-ethercat-1.6.12.tar.gz
+sha256  cdf508cd0357f649657d44b1779b1ed9c993615f187761190575ec775a432a93  igh-ethercat-1.6.13.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 8876b59f30..feba1738eb 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.6.12
+IGH_ETHERCAT_VERSION = 1.6.13
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
