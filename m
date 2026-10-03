Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD6CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDD880F7A;
	Sat,  3 Oct 2026 23:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY1QrN_Kr7_7; Sat,  3 Oct 2026 23:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A5E3080F6B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070420;
	b=HLTGwXkUnv6kjESyl3Bo4FuTFsj90Ymdpav1ULNZEWr88t4r8trazgntsL4251p0523X
	 D7ZSeJVhMqTrGuMerEWj5jVbH+yOpe52Npmsych4gRKmLOt9H+DGjdtdTuVWI/rOR+BY2
	 1Ceqpw6sZMiJXvStGWcUKjqkskZDGIxJgbhDzaTSNZHC5cvI7JXVaZBLmHswq/2EmO/os
	 X7Ssq+S8LK/jmx6B/gjO4uMELjLQkIHpBrtjWAdODMw3ls2P2eu6IiGUtG0dv4GSSH5CJ
	 B2WByqVOuiiBLLTYbuIVT0V/nsrEjGrL/a0QFAaUJGXhHrQaw7M7m1wcM5lHVexeYtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Bprlf0mYbuZj4G+w9yFo4S97dCtR38w3KKJCxANsdwU=;
	b=N0T1IfO6GmY7KD9yqlzZg8Cs3NG8KGKVqhPbDrslIShCLEGuroouGt89d3t9zl2cJbum
	 IPFHW4NQWlO5+gdP5T8Pgqb7268BMQJmE7D5y3qdDRfwanxueU4itNyj1N37NDh86Ch6h
	 q6PCd61uKhepBikGjE8E1XCqsQJuMdzVw1cZV24K/vVDe7c/5sQBBGmL9M/YHxRsrarZZ
	 uFh11AVwq7kL/hpCqQGUXDrHwlsbONxIYu43DESmj9l25JqG+2k2U/uGAdRu+CDVKQprf
	 9J9qPhgP1umrm2O+a2CoxMsrUMKob7qd+ud9thnWNI7N1bKXbuJnd0C1BdpDIgNBGww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070420;
	bh=Bprlf0mYbuZj4G+w9yFo4S97dCtR38w3KKJCxANsdwU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hfNyYzhzcjnBnNbCSTnDeefpg2IA2bSZXMbHQ08nDGSPJs25HX/DsnBDqm+f6CXm0
	 9ppY5mvnt6YPTmEQGlH2mDR/V8UUZUb+AyA6yMMaP7p4liVXM4rWvBxY/wWIzTqN79
	 UyKqFvHBX2m8ahainX+OnLQt9gnv0hdxJrjwYzH3E+9+2zASm1EKjEqZ42eKRTwlRf
	 kRdIpSVQdZUDvcbnuWlXxaiAc5lNAYqJUlz8Jf9kRdrJ/Bf9vF1VccIh1GhSOjhDap
	 BnUN2uyi7XbEzG6+sF8TqVT8AikxQGSgivzFZmiYXnyUwrMhSJzouexDMdKnWPdFGk
	 CRSkBOBj+HgiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E3080F6B;
	Sat,  3 Oct 2026 23:33:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D765435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23C1740718
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTSv_wGpT3BJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4333B40704
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070418;
 b=a6jQzdpYjFwvlqVhNc2P9PGiT5CJbDj12CnVH2f0B5wi2BlzQSW7ZNtYGVgEvt8lKWJb
 QdwDWtQJC8ffgbDahaqMzlj9R3nEIEN7AdKxpwwh213QEoHjQ+dnD9K27Zh4JH5EkEUdF
 MnFkxLcmE1+L4dhTajaxw82EOFV12otvEC0I+GeFENiHqTpcG4gTru8LWXKYHbFc6yuto
 AScY4Iwju4yl0Qjz+ry3Ixe661ucfEdLuPz8JZgcEc8r1RkJy1B5k5b8yIyPPyScCwMiy
 ee8Z+feGboJ4WFNGXCCZPcjLcP3AiqoeRhg0WkjhD2Tw4m4L5hjmnk19FvW+SXzJrAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070418;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FYpUzZbVQatZPWK73WIQE497vUiAkAqrq2nhzN6rgbE=;
 b=WFaL4pOyrmPpH/GZCtP9Vn8tJCgi4bQuRDDh9QZHUA2/04CQxLGA11GX9XY1dl5h4jl8
 E3oyL2vLTOrNGjjVythimK+iZ5QvH0fpE7w/Ct9IYngY/XaqW2geNQwKy/OXvWZSEqUMW
 VJdjBWi5i8BbuC18+kfRDyarTK6N+t3zfoao1TsJaIMTvH6rzhpHXhWhnX0PcLMK5gfGQ
 8nFrpocx066lz9YbI6C/4TX9/9/kvKdXHo8QAJwJ2gL2XdjFcwW3xMDzDztUvJjb+qugG
 zuHk+BoZZqI7pt0ScLBeeAOZrJ5zuAn3vJkMBezM00PFLPL2JLdkTyKfv7ljrCD8zkw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QCuMzjr5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:32::e;
 helo=mail-oi2-x0e.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QCuMzjr5
Received: from mail-oi2-x0e.google.com (mail-oi2-x0e.google.com
 [IPv6:2607:f8b0:4864:32::e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4333B40704
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:33:37 +0000 (UTC)
Received: by mail-oi2-x0e.google.com with SMTP id
 5614622812f47-4e47db1adb8so197939b6e.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070417; x=1791675217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FYpUzZbVQatZPWK73WIQE497vUiAkAqrq2nhzN6rgbE=;
 b=QCuMzjr5jgcm6GtKNTjfdJp6GN4SIVSQg74N7FGKtOE0065WILD/DQSAqL4mvivQ8G
 rWQbNFrkpWOgD2QBIDIF6R7l+O+2cleK1zcjEF59WpQj5tThnTSxptYZ0o8n9aosYBR+
 skzrfDO3JxVaPaOo8ngXqAk8+re9Tzsg4aIbKIarKt8e93J39UeiOzp8TTF1A6/KQ7cL
 AdG6dPSoMZhNkN0sd8yAD6dDmw6UImChF4KKA+V7cWA710fdmLHgA+6N7zZKf6vhAxx9
 +FYDAyfO1YfwqxszAT6+Gm97P2cEO6pY/pMU3HpRL54rblb1EnrkFsRlyk6LaCkq7/Oe
 ww0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070417; x=1791675217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FYpUzZbVQatZPWK73WIQE497vUiAkAqrq2nhzN6rgbE=;
 b=bY5XpSEIBox3JiPQpy0YYrhx+86X/S3+kOH0qe4X7W63/0kk+WuTWJEmbPCQjxoHE9
 VsYojHHV6FAojuB3w+RM1l7EKDv/P2wzZungExAlSTEhxuSVZwCqUB4USr/91iTdS45w
 t9Mnl76DjOvMqC2ToxvEmeCflX+mucD83nmy2QNlyHx+n7fLoSUzWtJbdf82kLWXaWUY
 NuNKa1dSnMfFnreNHvkt3JMnDvvlJ64XOd7tGp8CXRw6CU8hvGP+JNoNH8F59Bb0gts1
 ZvoQX7vesTH5rsWj/2Etop868ulmVJ1mI3k2Vv544Fri3M3csr4KotLGPr0pnipyWwS1
 KMeQ==
X-Gm-Message-State: AFuF++ljAE6DbbS2eINn0wRph6GTCUmzMyUIhJy8R4xFuuyvQ6bsrlCv
 doxT0UrOEQbxYTvgPgH2XMVSf7eF5I3woaRnjx8wyH8fxm/7S/F0Wy0rbopcMg==
X-Gm-Gg: AYBFou2nEuTreWZy5ASpUA4zr/GuJFiO4bFZPRulzmqFtwtgTHXMUNfViz++d+h6IBT
 Et0Nm0xZo+WnYMEOSYx7H4AbA2dITPVvX28qd29YRJ+3FwUeaoSM8w09eNchp/nbY+0fxXc2BOC
 An/+CCWlj/xsebyIiNMaAlmypTq46bxG4nXUv9yZjDhy1KUJbhAD/+4tgW0SaQujAzq79VsJASs
 PoP0i9M966LXtoOLCrCVGB36UJLZxnM8t4WeHxQw7V5OwzgCJQqCobtW3Nuq1oLSKgvL30BzB/s
 DVSzKWdq0G1loH9yy4spxgRivsEGyjvPbYhAeIXDwH5xjS3sL8TheuEf25SW6L4yXvMHfnG4a3j
 +BNXJkJVsfmxJvoRz7oTeWa9xceWbiQuP270QtSyocA5WumEOedsQM1IEDxO4XAh92AGZH6UoYD
 YfqHMn+bpCsALerT7m5CWD3pLmaQcTlbTg6JH4iV9dKuuEAiWguuLPveOySNGWx70gy5lAkeDpS
 zPRngkk6HVZcnafCLxYE3IyBBJJtm2Nzn1dKWOx5480a31ZdkcCBCKxKkjBc/2ldvUNps6WRdJ9
 sDzGZuIkT3MC/QhkRLSpIP9QaQ2ATtb7pUKrGk9ARcg2qhaAUXQVOJidjW8echXrtUvZ7b/cLKC
 BF54uAIo4HbZnGQXBvqq70IL7IwFr1xEJr75j7rMktg==
X-Received: by 2002:a05:6808:67c2:b0:4d6:9293:9bc3 with SMTP id
 5614622812f47-4f52a572fc0mr6383954b6e.61.1791070416984; 
 Sat, 03 Oct 2026 16:33:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm6254317b6e.18.2026.10.03.16.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:33:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:33:33 -0600
Message-ID: <20261003233333.754602-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003233333.754602-1-james.hilliard1@gmail.com>
References: <20261003233333.754602-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-socketio: bump to version
 5.17.0
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
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 11c6557077..4d08c01e50 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  2020f7a9aa9fc74786ff2bdc8b48a68f  python_socketio-5.16.0.tar.gz
-sha256  f79403c7f1ba8b84460aa8fe4c671414c8145b21a501b46b676f3740286356fd  python_socketio-5.16.0.tar.gz
+md5  dc6b5c68686cf88a4919e83fc0896719  python_socketio-5.17.0.tar.gz
+sha256  c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2078b344beacf95a0  python_socketio-5.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 2c6b581c1e..a3a47e43d5 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.16.0
+PYTHON_SOCKETIO_VERSION = 5.17.0
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b8/55/5d8af5884283b58e4405580bcd84af1d898c457173c708736e065f10ca4a
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b9/04/8647675c93b5e74a3daa41a2a03930bac0cbdcfcf307900f0441ae6550ba
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
