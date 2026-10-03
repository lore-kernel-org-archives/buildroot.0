Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B3CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3873A606E8;
	Sat,  3 Oct 2026 21:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7wPgjc9lGog; Sat,  3 Oct 2026 21:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E7A4760E41
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061728;
	b=bjx17IhdEDBdXxVchlWN7m8o7w5im777gkko+4Mn3S3chCq4MCmb5rKan7GWeEw8bhOP
	 G+9FOVydvZwYpLQkdC4r6Wh2EtHXu3ai5LgurdACI6OPH3kAgJXqKqwfsWi+1XnTG/CPH
	 nn2s2mN38JqjH07zDkcVS6s0sh1JjXmoO7ItAyMLZBELYMWaNTDNg8YxdM+c1H5uRJXg3
	 IZrj/VBPljFp6h7QK0mvZqx7PgoGTd30P4aAqg+a1FFq9UJu5IvPSTTYMbEL6nys9Revt
	 CCZ3QVFPTYD8u1EIEz9TXS8aIskkPkPkHNfXAfG4FrJvEGoEZryTn2gfLacn98dn56A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ll7maPRYhOK+HLUtibAhPkBA382/uH3ukyffKTF95MU=;
	b=Qi2oNVGR9Vs0yBmTiejHYt3QdcJIDTZ/7ZNnImN1xF9OmAePESDQWQQuYyBbJM5KQGSg
	 lf82KnlLXufhlwN23Nr6+UAW4xbjJgfbS7y20VtJQB724hBokz4sBnkGD/9tRUijI1eEq
	 pONEJYVYaEN8q6Ag1Hfbt1u5GFRX6506+kIAAGPgdFi4jdrP0sh2HlkmsecE6OWj+pAYl
	 f8M3HIuhVrcnOcg6AzH9OtRFxiL9k8cJSw1+YLQ2R0Qa0lv+O4++7JdvGS+wDQTlZZvA3
	 /uIEhPzX3wsqxBYsZFxRddgyTTsW4YNNGbYWtwZ/T5b0/O2mLwiH2sRahr4XQ0bDV0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061728;
	bh=Ll7maPRYhOK+HLUtibAhPkBA382/uH3ukyffKTF95MU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=f9qU6lmXHHMHbIjy6Jf243fHBiPFIUqj6MK9l7R5ht/ryC5P9EMBkgON1K4Zk/SIO
	 yhJt40jR3cZ1hFerN380e990qiNCeLEShH+my/pdhZ/5x94xEeuhV3nGE3I9AESKLI
	 /CwhAxGabs3mt6okfPYKPVJLloTorKbwW3k4XT7RYN9jye4qTMKQRCYvhw8j+0L62q
	 9KTF5eRmpSGIzkBM8twYxuGOfHqBdtVDlSn+YIiFWQIe+wLUw4DzhlTWtRlHiLN28l
	 15IS8CQt8Fd9SwwXDQ2VXVJw7JIZvtFKPFWFoeY3mEGbJFEfw6crft8v5nomfrWjmr
	 kKyFr2FaBBYDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A4760E41;
	Sat,  3 Oct 2026 21:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0132E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29B65813BD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_ZVBbRy-3W9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7DDE88143C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061725;
 b=HjRSbpx3MnpN/2jwohhBmwLKEAKKNqWpFgf7kFq5fAak3H4pE0AEfv0YSbir4qd9m9hA
 xIm2GaBlo3N0pkkjzLq59aYyN4dwSuxT/dp9Hf6Tr6Y5WNLLus03jWXMvrH5SIdbeDJAG
 jd7w573DXCtBiB5ZG6SXLB4EbVpc8GmvBTHZfCPB0q/qF5W0xdW0AsFR8qERsYPux9tNA
 EwXhSJwCRgMO29zESI1fzae5THuldH1k4PX2QmvK7YunH+4Fv+mBrTu+yEqMbrQsvFIC+
 OwSDoYCb/YgvfLl1R9hCBdtSl/geRi+UgwZK9bWr7IOgQ+CYVjd74g2WLifoy3V5VGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061725;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=r+3F6MJTffpGaKSBeqecMa6yTkW2hjVyQTZ2j+GFFIs=;
 b=qAUSgMsqGa0utQugCLcthaEJd2QdizG5iFAOG5qzIDDL0ftvZLjWwCXp6oPo5eeHaQ1s
 bzkNbLu9FYt7GSIyWZZQgvzapmX62bgzbesw+d+mIcFDNZ9nFl5J9EMC6vyrnHqRTD/2M
 D6JgWqdwXOTuU760xG/nibLsCYXcVYWBB4ekCSeY4hzDqL2FxQ8oyvLk5u9PM2PM+xITc
 sAYoCGa6s9TQiohzQz+FrpSsBGzL5geUG/+F4hUCH+xWaMtTpJ5mXEIQgP7oyuuEBMcbZ
 6URg9dZQRhEKKmxrLEeYuXbnvJ2sRRAMbuAHyiMNliqllqTRKOYJ3bkJc90Il47hKMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ruyZAQSH; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ruyZAQSH
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DDE88143C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:45 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-81ba09a5d23so879869a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061724; x=1791666524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=r+3F6MJTffpGaKSBeqecMa6yTkW2hjVyQTZ2j+GFFIs=;
 b=ruyZAQSH+J/htM4PmUB63NWz1oCNON2NPUp4Q2eMJKZFSnlDNpBBCEPe5l+MozoAt7
 XxXERUutHxyFXtCzAqYuJS6G90Fp55AyjxITU9h2MyLXDcO0yK+OZSbWMnva0q9l1BdH
 oG2sJN5fxGY68YD4iOX6Zk5vSkuXIvaPUm25xsjRPyRr4iVU9Q8mDbUiuQg2CY/5+l8b
 wjO5KMJO2gb2eQq3FhDIHAX9d1N7wsCMWiuub1ZHJlzC2WFqSFLKg/81Og81YvS6/sba
 S0Rz938YgYeCxzj9ywMHPRNaYbU1Wx5t+QRQmcTQOOMcFhUhqruaoR5WZsYKAddrYT/6
 9dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061724; x=1791666524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r+3F6MJTffpGaKSBeqecMa6yTkW2hjVyQTZ2j+GFFIs=;
 b=qxj+bzSackLWFIUCbnPqx++ASbiM8pVwgUkw1iVLkBqZN0XS46kRphqG/19aQEt9Q3
 kBS0djZEmBHLAyNqGaxkg7El3GaN+D+pfW6NgA27h/4EA0B7EZ8N548MmfnzT7Hh8GO6
 sBtBnYrrN4Op1YF04WHDgt5Edbg8tkptG4wi5M88TX6n+ZwtKcTGMxhSTWArl2cwWxS5
 VIpi+8/mnylLiULcsMy7XWOEw5Ov6Px+jox81lZwni+byQ6v/4f5nUrtScOL/UcjgjE2
 nqnIp26ezmtmeNEqj60/C3JFRCz7U14nU2rFxS+KRHZvCDDWk0SImlqO9THDmBbadKaH
 WlvA==
X-Gm-Message-State: AFuF++mMQqNMPju25rHrDMIQCOHxHvHt/LFM4G6jpozFCnQIBd9xjlqO
 COg+tV0uu3jh62zDgVLRmgcQvLq0Q6wMYyVSTkuyTDsCoapgOVDIZjrolOe3fQ==
X-Gm-Gg: AYBFou3wVxlatk8wPlmZi9MvuORNIAvquWlCumpp5PnN66lTZBGtyGeHwg3d6oGHU1t
 sTOsvqOSP0Lonfpa8ACtisOjxT6IUpJMXYRf4mMcDEuhOzJW/8EHBuP5K5AVXPayszv6L3rpBU2
 rE1qvu5YJ1YWimMBYDNsCiJr40ZavfhBt/6angxS1S8Ime/W5tup5GB9OJPivcz5NecxprL3AOy
 SvYTqi2tPqkaXi7VsBEwCXpJi40BTsHEelT1mGHvIkw/ZP7tRfbb3uem+YOFUUrdwXp2msIc89D
 Ndt13P/Io77h9DJqIxB5QyTMvvFugELgNAsOpNLrwEWaD7xlffoYxjRMnfkIjqRP/0U0K6ebiNj
 BLq1i6yzdWqYGMiYv1FBhxnHPSFpoIWRpTkljaSpHyL3KriwzRj8EUnJNFwUZ/BGozVhizFBT19
 DPSh+WRzmPEp5mIMex+u91VJ1/0Bj+A6DsjI4cmNAuCFYMv/IqmIDvyFMnjuVHhdP1wGqoeSI0B
 buk2EV0OX3/wS5bqSLRtiY2qxEyi3K8Xl7Nzd2uIhTmHjNmCsVLYqlRcnJKfKRIOXLuBSavNmYg
 r+z1BvQaxiydeIM5MJqqDysp1SwYTel/AE2Ei///ARC9sWM8eUYyRUQtopEzGWSguiypJqSBljF
 XnrpiJruC0mmvb9zM3DKpYLAdxbE0ZmZqOepvtJddmg==
X-Received: by 2002:a05:6830:67c5:b0:823:e626:27c1 with SMTP id
 46e09a7af769-823fc440a00mr4070693a34.10.1791061724273; 
 Sat, 03 Oct 2026 14:08:44 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:55 -0600
Message-ID: <20261003210833.735937-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-googleapis-common-protos:
 bump to version 1.75.5
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
 .../python-googleapis-common-protos.hash                      | 4 ++--
 .../python-googleapis-common-protos.mk                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index e25d4cba33..aaf12f78e0 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  e67910a98d106e703ba34483626c4538  googleapis_common_protos-1.75.4.tar.gz
-sha256  4587babdc82a8d7e5a3d4f5a6697e064bf44a598b4d08341c212b68185eadbcd  googleapis_common_protos-1.75.4.tar.gz
+md5  d1bdd06d44f08c8f3cfd5722ab5363a6  googleapis_common_protos-1.75.5.tar.gz
+sha256  c7a866fc34ed29a3b10af627a4b9b1dc2433313ca6e959f0ae4feb132047ed72  googleapis_common_protos-1.75.5.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index baa2b5cfe7..e21c5df3ef 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.4
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.5
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/4b/13/f83676de1dce4f8106bcba91725b3f3f4baf6ca1977685102b008b8e0097
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/8d/2b/6ce81972d5c8cab9705fddce3153be63222d9e12fd96f8baba5038a744dd
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
