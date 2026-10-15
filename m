Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A69CCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00B860AD1;
	Thu, 15 Oct 2026 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUDyUNg-BhSJ; Thu, 15 Oct 2026 21:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2CCC60ACE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101145;
	b=AZhgG/aCamnERpPg848eOI/3NLvpRD+aL2vHi/hYWobKPXRA2F5B2BU1NOX7ia7tBpju
	 vArFe+fgvsEQOuwolrLU7J4BFUhpStJeFFegcC6XjySMcIhcyMzMJXuzRxHOa3lf8kDK6
	 cySQxchvj1eicBxYu2gGuYXHyexY1tdSSjsfZcgBdOanZYw4dip+/qYPT/oJiB7vVcp55
	 ok+slFKIZQMMeS/GGYaQiKoKja5+8bef4RirW4/o7r7O4Ds4YRp76mTzEBD0C3MNfoPXP
	 Vz3ft5dJ8sQuelq0GtzjUw9ZY8/pLwBuqiZUVwUxQUkygsS/pFRrLbi2/2YYNnVF1eQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hShSjZQ00fVB3fBws8qevfXyzH0kKaRlxyqzgSsJfxE=;
	b=Z+Kicb57ILb2aiaVw+e8uPTLzgjR+PwDAPxUePeB03LjgziOgxlvSYpK6hS7XKsa70dz
	 eOTGQBtShoFm357d9DVOrYYbfZVwIcG4rGDy3hsBJRq4lVgm4kpDSWld6VsgcVDoknpZN
	 yFnFWl6t6LFo0T8LN3ZCM1KxkrwxsTtjCgWuEpOfN36upHPzNglw842DHsUOmsEjxejuX
	 4b94reTiX++btPGBp3MQvum6oMzzoEDdTGVlJT+uMam6nhDgiCKbJacbYEnukbpHsf6bV
	 hpCumEn4r8Vvwm/GSlBplk+rJWalNzokpRsA+2ZMYLlrixs1y3oNEA/W1QIHpy11p2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKxXYSIR;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101145;
	bh=hShSjZQ00fVB3fBws8qevfXyzH0kKaRlxyqzgSsJfxE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=X5I2pxpR7YJDJaynwChoyzf6QuIvY6+4q9FSzIOlLo85LdBEJmaHWZJo1iQ9oTw3k
	 5tw+7ghd+rLEM01MCl6Qd9lkbk6X3I265Gatdv59Wq0V3UrJ8jV3q8KCN902kMnYof
	 tCWtFy0KWzymGW+PDvLX6A+fmdKh6PqVvU8lQOAfHpdWPbS7o73IBQxYreqwf87L1e
	 Irr4OZAWOU+fCI+CKbMCXu5cxazOSut5e/+9VDiyI7SFk5kG9ZyjFniGQhBMXH1q22
	 Gps+NUxq+yDyqMxiH5W5eUfJOq8KG/g8BGOyDwP31dz3kSm4mHayB0Tjd5U8LaQacG
	 Owt/LhVPoi3MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2CCC60ACE;
	Thu, 15 Oct 2026 21:52:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72857332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61F9660A97
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzuHlHdqaZrQ for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6568A607D3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101141;
 b=C4sDQPpuyIDrIjDlSGiPV/K3MwOVvfQ0Qg2ARzYXGvmjvo/Vcc2MGtl4xHp4tDeKqMDx
 FTeaceHcQOvpzEQ08GnjMxHP87eGGiMCBWB95TEosZh97DZGMowUYlCm9obQ/jwWFpnK+
 RpEJOtkUKgefwzPvBgFMd5yEzQuQKGwv1vdQylSn6PwBBTAknscpp6jLOvUYz6n2qumrT
 0Yc9yFfGCzsTfz6Sjir/sSqZoITBAUvYNJXtQt2jsz18ESnW98FCqO1YCF1gBaNDdLaI/
 DV8SYbQI7XfyD+3eu1gwrJ1t4jLCJT2sclGqozV71MNJGd4nH7akb2eJg6ZkWR7sjZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101141;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/ksuw1QlB7Jl3hC7vsLIlWPfH8G+RzAAD+rX7lO8YNY=;
 b=YFcVa6kc4rBcBb9Exoic0MT74BgxaXYqGW+ImUvFnVGhiaitjPF8ZlihfhwipGKjoUxq
 QS9j4PThakLHGQaqF85AOot3aiHP2DYJEgFooUuCDmSS3Jd9oNpRgiZRPWqgEFW4aSog3
 eY4guKsJT96yNBVhr08xCNsgx3Pdrxj+iv3UYzWBEjRkINoPumVJm3bkKcMdp/TOY2c7W
 kXQu2UtLZXwt3aeDgGtedJTCu3wzsDlIPD0XGa93R7zjdK12LqBXGVqWsUYxFmTesC7Q5
 58Kv9ytnPZm9/rGHFvQktNu3UpfzKNICndL2JfA8qkgofN1F/XY57/cUvTTqx3j1tIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YKxXYSIR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YKxXYSIR
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6568A607D3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:20 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-82395ae2ea8so2048535a34.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101140; x=1792705940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ksuw1QlB7Jl3hC7vsLIlWPfH8G+RzAAD+rX7lO8YNY=;
 b=YKxXYSIRmKlCpKoOeQB2bKe19xlLWOLZWs0XMcREmP6Beu9d4zwCukwJjm7lt5xFPV
 bmkFA2utlReo2xJeCbd4LIgCUwM2udbFpZ227MjtPOIgbtKeD6kMq7QMjs2kUYVRsQu9
 ZHcQUCDoGFaK4c78jPf7IlXoUtAhOqVLcfngKA03ooFedoC96RO6LWSl7uOg2abH+6Yi
 rIdlVDMkN6XIHt59i2I9IV/fcK4jUkE3Vg+z3Ujtmbjp0ZHzLVUKlLBo/uz/US1nbc9H
 Ej/d76A6nDQDBLxUE8lcN7snikQ/AitT7sWRhcaq8OkpdzDe9XKen+tZSs+v4SjhQqLh
 qU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101140; x=1792705940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ksuw1QlB7Jl3hC7vsLIlWPfH8G+RzAAD+rX7lO8YNY=;
 b=cNT1hPhUEzf8Eoed9fc6UeUsFYq/598Sju3KfE6TDpbViLOe0F5I+eRypwBI4+mmm4
 WypokHcb0gycWpjAggZ0mFx2LnF+ylwCw+VtHNhNjkw8DeAk6psg1P5HFYJxl/prnNzo
 efys0Qf11c/EVRiUQ/fjIeaECwUTMoPGiq6Ue+MPXriG3wEzRZwkWqMUcG37ZCFyCFBm
 rIeMB1JI/RB16qSJ3aLp14evYoT/VEd9ex0v4Ppj1Gimwos7UcJWFA3907PYkaMhFsZ0
 6ALeApqeYv30ApuPuAPregZpT5mZV+3KAR75SRx79z0enWw0dHq0rnUhqLDIxz837oyO
 qMpg==
X-Gm-Message-State: AFq9FYJawyRncZXIlZ3Uui5TO/6VBCr+ljFzLjNovSNmplre4J+UO3mv
 MTz9p+dhR7ZSYchZWiBKVvWsn3HAsmD/OxaHxmS1UQrr6RfEVQYPtmmZYXEOYg==
X-Gm-Gg: AYBFou37UpC8eZGhZKW0hejezgbA17V3wDm0nw/6Hgqq6yjYo1KAqxobDYvuSD+dsyt
 Zdas0hokspNPLFKbn63EccY6VHqG6wc0ZCjvix9obbs+rBYBmMgAmqsMb6gZi8wNnxUwzV8XZkw
 SUHIycCEQOmGdNGIWZh2SQ94o1zldJ38/j0hTAPN+reO6GrB45sxqig5eajZBE97wKx6sOUAxjs
 6sGzYdT+wqZVDOAQBydKxst44eyBlIXKPfZX74q6yd5HPp+w9+9orBVzvweFNzGAH692FP1PdnY
 MLcCByZHArM3GueJPVi9kvIpSsZ9i88vphS2capMDt8926gS+WsseGFwBX9smq2YKYJ14tpZM6M
 bhf29q8nmeoGK0VZ2HaPVMuhM9As7KJCJeephV8hlPsGkC8wCbHLat3a+NLxmmSNTTKyaEMioL4
 I90+p548xGQvQKHmrzKEMlXThA2wdFpLYvMb2stG4bPHj4z0Hkl90fVwXrOURjHlEzhns/8AZQp
 AK11a6eLbjWJqdsKUNth5DZsjf68/jFrJBqVED+puDzLn+sxuHfWXR5ftqTZce80B5rvvxAUMkZ
 llxZVvXYCP2q+2MRqxYrfKrLOVI/yt/Lm2KJt4Ais6VRiRmG6KT8OC5W7aDUBcJFIw4p63XNuhc
 2nQJ4VTW1jBi86AROxNP4nKHpQLvGaw+DCP4wVNWXm44=
X-Received: by 2002:a05:6808:1303:b0:4d6:9222:99f7 with SMTP id
 5614622812f47-50c59e37adcmr17127269b6e.55.1792101139712; 
 Thu, 15 Oct 2026 14:52:19 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:41 -0600
Message-ID: <20261015215210.3426895-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-filelock: bump to version 4.2.0
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
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 80be2af490..d4d1d652ca 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  1cd0ee2e9db394c77d013ce31435c200  filelock-4.1.1.tar.gz
-sha256  7ba0927482c5a814b0a7f391d029ccdb8010f576f0a74c0dcde1811e8bc4c1b6  filelock-4.1.1.tar.gz
+md5  888c3cddadef907007cfc425640cddf5  filelock-4.2.0.tar.gz
+sha256  7a60906c75227cf04d0c273afadc8219400f11aeb13cc69591d4f6cdc6c8036e  filelock-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 376ab42dee..7c9494f8c3 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.1.1
+PYTHON_FILELOCK_VERSION = 4.2.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/c8/1d457d9150ff948f2ce6ada7715e0eeebbe5d3b58a45271a1e222474bcd3
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/f4/a9/1af41b37c3279712b22cdc63aac78a52432202b6fe1f9666a2a3d2831fb4
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
