Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98FACA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 14:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D74540613;
	Mon, 28 Sep 2026 14:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV7P-tTcuEvt; Mon, 28 Sep 2026 14:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5838F40621
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790606467;
	b=LikJN22kDOD1bWa5C/fbefEgIbOfM/SXZpnxik2IO4NXE8roigswaq3wDRtbnKSjYaO8
	 p+ernQborO0eE+l2fxGoE3kyxARXZ7hwlz+fQ6XPcBrpXEattbmJkDuEQQGsg0g4RVxhU
	 G20iU7GsyArGUzhi/3Q0sp8PmlKES5PdDSFFJHCJWTPhMv2iQuxZNwqnHhnzqeVzSuMyh
	 Dp45XWH0zIg93luY+WXY16UGyKcs22tfYdi1wn/nPTVZDkLGkWgwg5VvTIAIymb3pHYHZ
	 qS1qzrGfp2mlcg/nYmPRfU33V8ab7CuZGDm6kTSMyJIRysvGlNq4LGhU6hIw2kIVemA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790606467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bAvg3RW38N5VZSbO6QisAZYKsoqT2HSRc4+wwp8Xnk8=;
	b=YUxSPIDfpWEfx2CP7agXd00vEV6Bfa4bXfefOXdjlgxAOP0QKrceQbqPYq2UcUrnDe7E
	 +7fRJFGvP+tams6HSzNxbfr9Y0bTKBga7GFiiJSDsRL/xk/rwJiGTNdr09hNo/fuDIJ50
	 DHwc1B8PinoVKzMkkuWJy4dGD8cpH/tUuSZ20SxLRWiSHgqQpWrG1RQzMwvHg+Ao1V+HN
	 KBvfIuV+HFkPlZ4ZzNdSxuvKg2BTj6TmK/2LG+hKeabOZxEO7DUMGGz5XVszE9/tQyuS/
	 WN4G0KtoJ4s/UzELEHCF/bPEAvOYAPnZE644J56/sPwzbTYDiRS96DW7KkcvRpOx+3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790606467;
	bh=bAvg3RW38N5VZSbO6QisAZYKsoqT2HSRc4+wwp8Xnk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s/0wstZsGciPYz059nJuBwlF+IuzPnbXkxVIKsvOM+KlvPIgl6Uu95Dv4IjJGoDm+
	 Ak8zSvSxJxvXB/U+H3TdwlTV1zmAm6cHGWYltgHzMZAnN4RPKKLA3or303j0pKq5gq
	 nxlpYwYF1zTs2S8prKd5A7zwWRcumvq1A9NKdL9DSJNYJyskY+GqBIUzGL+UhU05BS
	 FKbEV5wF3WZRjJWGLpDA7ME4L4V7rEF2j2zhWIj0sRdavfE6r4iwxWg1iuvv651Gv4
	 rssq0dbZxYECdur7DyY+nx3xeUQNqh9B9lAk6Z2LwdZ10nO5M583WoOcTTfb3NRA0m
	 4r3NeqA3tXrgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5838F40621;
	Mon, 28 Sep 2026 14:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F57361
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 14:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5527940613
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 14:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48CN6fG1zlJY for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 14:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3D24840621
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790606465;
 b=bwvMwEgPppm1Ad9R/2bsaULmzsHNgXiYavOhcYG0ZaKJ/URWLx0L5W+9amJ805BjVEAG
 HRQzMZUcKfUCBBPdHx1FD2fVQnpmZ+X3+/mn1nxN8aljbZq+BS3+OPvp5hnfsSHCF2X9L
 siZiwLZpYSHA0DACUdwHaQUKA4ahMKofAq7EoGNWMSXNLcre3emiTYkFGYC5om4Pt6qcR
 8MwB7P2XANLmPoYgSpTlN6XkBXElyOHYOmqRM9tnL2EI0gGhes+1LGvBc+1expTA7TxH+
 +yAGXYJwFA2yY09hzdzdvswGzCfgjABjPv/bpFb7eBMUuyPMfFmQuSNWnep2We56hqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790606465;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=d+NYUObgN/wDo7eVIijSbGDq4jQgP5Lrw6hvE3EMh0k=;
 b=HElCFZH8HS3fcqZ4vsJHhi8QFY3W/rOE4TnwJz9ZvFHstlcbgiXCrIdEbuU/JncN7GNv
 FS3uVZ5gkUIX12xsxpvOlt5+Wdm2lUWctenEzMwEjHsf+3/OjYdV/KHeCv7LQKbVY+KaB
 OwwQzTUdOIKIPnQ6Yt9gj3+FBoWneGd2C9ulonR7RWBcSA+RTteHPCxFQ9YIh3d/FBqDV
 oPGObEnR4giObQsEQAiWGWmtn0DCgISXZp3SuwBkcJt1hoC/vYWH6+tKw3KIB3yHdNczf
 T/agNuTDzcaLLhHFrrwMFH2l7RyCaXSqZ2Yx4mOO7Xm6FEg0G4qpomtU6zS8PbvZm3w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=YVXg111C; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::d;
 helo=mail-ed2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0d.google.com (mail-ed2-x0d.google.com
 [IPv6:2a00:1450:4864:33::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D24840621
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 14:41:04 +0000 (UTC)
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6ab06778bdfso2436565a12.1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790606463; x=1791211263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d+NYUObgN/wDo7eVIijSbGDq4jQgP5Lrw6hvE3EMh0k=;
 b=Luz9JhM1bw1f8uXM+Q5S4KfsNWnctk6bD/Y4uHFKxykvTqY40GpQHD8h2HPEcyVLMY
 IaEV0NRAAWwUW5hvKEegUTJkaWay9fTF5x0BzWlTiT0w+qPLNOJnoHexry7EviunvxUN
 KAx1uDwcK0qULIcOJLfaOZs8xB/fKx0oaD1E9tqOS62WeEA3atj0ULhA+gAHLHO02qA3
 2SlQOo4Zb/gJOS0QEZBI5oLIoN7R+1NEs3+sEvcytupvqGu+gcCeLRWUUPX6QoVMS4n0
 bSTmgTqv7e6pNKJkCYi6Iki4FzFrn4rDh45je47cpU6rphHluhKZ6YsIHun52pMrELDd
 1mzg==
X-Gm-Message-State: AFq9FYJllPzjo9VpoatLaJ+3VD0aydUduqm9HfE5AC6j+Gxo1Bq7UNG2
 uWdbLVs3Efn4Gx6NwOJcJ2D/Bc4N3TTieMWo9FnXq9yW/rWbqb98jGnm3cELGg==
X-Gm-Gg: AYBFou2Rgvk/f9HhbhZrZyqDU1V0H/wnesqVx5eSCoUs2zA+c9bPkUT2ss2hDbjNnnK
 XXZOjoqGDeefBSYNyTTapFlej+FqRnrOpc7XP2gz7U6E5EAx9fdRmGDkN4wNEtKxKM3BEYk2uzo
 sIr2WqMjZlk8M6IpTjtU0oj9qAW0XtX8b8H38I6BtaYBaRHQ8pY1M7Hybb0WQiSMnqWgYFU2uwJ
 GhjV5fJ2eEJCsQsrYkPUg/4zXs4yI5ltztMLm9d4VpYsJ2gSIHRDDmHQ2Gkzec+XSyKXWku4kS3
 uCnu6EePC7GhMtGAscF9l7eD/n4Z2VcoZQPL5GLvghP9y0RReLjZy6J7cLULsc8JJmIzR/4eWLs
 WfXeOwI3lLtO6kBaFoBYb7YjddA2ehGVOxUYXBo8PdpKJAcMQ+ozqSsUxPZYoy8qOxtn7iTgvve
 S+Qmi/cjJaJcNur0mL1XGj9GFVfvnAVL3Ua0sGThQMPn0tUbGdehIkUljbLdaLARaRUmCwDsU4e
 iQ/EUvi6wO4Ue8bL6cTS99h9LNZtDTUZsslv8rP1AaaL8s=
X-Received: by 2002:a05:6402:43c9:b0:6ab:eb3e:ef5a with SMTP id
 4fb4d7f45d1cf-6abeb3ef73dmr4011982a12.37.1790606462329; 
 Mon, 28 Sep 2026 07:41:02 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aae5dd7dc5sm4386526a12.21.2026.09.28.07.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 07:41:01 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 16:40:57 +0200
Message-Id: <20260928144057.2235445-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lpac: bump version to 2.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Release notes:
https://github.com/estkme-group/lpac/releases/tag/v2.3.0

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/lpac/lpac.hash | 2 +-
 package/lpac/lpac.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lpac/lpac.hash b/package/lpac/lpac.hash
index bf93ef245f..1b2b136bb0 100644
--- a/package/lpac/lpac.hash
+++ b/package/lpac/lpac.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3d87080a625b10430eebb82f89e2d24e16a84a8435a9c40b3718fd88c82028ba  lpac-2.2.1.tar.gz
+sha256  661dffbd1e9e5732dab4a0bb0a9837d4906c8c66bd748bda262fe3e8d3e420f6  lpac-2.3.0.tar.gz
 sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  src/LICENSE
 sha256  b673293d21e887eaa9b971696b33f0f9141839900c65c83e560afa469d291ba6  euicc/LICENSE
 sha256  163766832b15cc9c90d593216360c67af579b8b36932b297fca2aeb61544de2f  cjson/LICENSE
diff --git a/package/lpac/lpac.mk b/package/lpac/lpac.mk
index 36cd4d591d..50b7175ab0 100644
--- a/package/lpac/lpac.mk
+++ b/package/lpac/lpac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPAC_VERSION = 2.2.1
+LPAC_VERSION = 2.3.0
 LPAC_SITE = $(call github,estkme-group,lpac,v$(LPAC_VERSION))
 LPAC_LICENSE = LGPL-2.1+ (library), AGPL-3.0 (programs), MIT (cjson)
 LPAC_LICENSE_FILES = src/LICENSE euicc/LICENSE cjson/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
