Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F6FE73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2738940A54;
	Mon,  2 Feb 2026 11:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kfX0YfCF7WC; Mon,  2 Feb 2026 11:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3656140A84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770031179;
	bh=xC5jSxAaNPmXXnBarJFakf+99uWrt24kTmtj5S+H0YA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=frJ4tkYq453X4FNDBCn5bC/+WNZcqnp1W84/OHxzPh/FacUrAHaE9JvWynbc7SaMA
	 hjg60Hnya2+G9N2bxfc9g3pUWR9IySwddRHFY8R0nZErrv0jo7zlLxKpSZuzdM+VRX
	 xp5tzCk4sOLn6VBjlKu7S5Ohh2wqJzHRzAFXFRfGh0Za6MLLCvn0QzbP4WtEYWrkjk
	 1Nwc4dgnkyD+DI+2AMFwRPQQrpEX+7vBMuLb9msAB0qrUhA+hhdz5IG1EJa6BjtMt7
	 l8BgLS9kcCeGicN4GI9yboqgo4RDwmYsZRcVUNCZtKfPUJTZ2an64c9iCHdVUwc6Kl
	 ZFyScNDVX+PTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3656140A84;
	Mon,  2 Feb 2026 11:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 821A71E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6837840A84
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7bSfn3xI5SL for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F8B340A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F8B340A54
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F8B340A54
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:19:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa9so2925941f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770031175; x=1770635975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UViC3/ASnPPETF+o4mRNhs0v8yQCUUEsghyFoh78Fxc=;
 b=HpNMfAdNq550evzzE1WtyBumxBovy3gAchU2aYg+2iES9zbAyyWAyoQLL4ngIHXcgK
 zcxYwZc/kexNNXPytiJbDGS0I0WrnjDAOIdhDc+/A6GFtVdiXTdSLaAmbmQTfnUX/J+C
 5hUtzIM2XPVfF/MOE4VKThd9p2RdNqIxY5lZltNdgDUVurqlJ9nPMg/CYJDD5nXoSWBe
 bmONRBnyi48Zhmv84rZbxYIqfeSNOd4XY7qXaGdfkDbMJ8Q7OexhgULSY9QEyMXDz+Yq
 Uwl6P3HexokseCBcD9Di1zbASlHsMT9KtyM7bKt9iJY0QdApPZ1WyiyaAlmpIWByS8XB
 1IFg==
X-Gm-Message-State: AOJu0YyblAyyD9yiYZXttQSbrh/JOotUjdBvEP6OhufMg0FO/QG83ZAt
 x2RpiQkXXzDhywPMCPddGM/szvbpUxbSbqG4HsNTzKk0xgAkKNNv2D+yaGmdGBOsCN874Fw4KVo
 ri2CQ/io=
X-Gm-Gg: AZuq6aK4Frpjo1v0zxIznMzIkPGdNQbGP4Qwg/yAcsbtI1aUj3WyX0i3rWluy++yLEq
 IfWGG07chCCy3gqRE/3t1qcbk6vqk6tChZGSn8vcx5RQg0mJOoQWhFVgdNN8L5kYpevJ+Kt1CBc
 HeSxIZkPLJt39OmP0WyXayHTr46h7XtQ9Jn9N49g5R/qkLMZbwpE2XJXdttdQl9Q5CAHCZVYV6m
 iRaEX9UFmP4R6RlR+6FdwwuHzA0pZCC+VoMFVWadmm4WYbj5GisTS4olLnt+fQSXFXetKUv7b/e
 R3hrUGKOGFkh4kHf3OkVf8g4iK6MTKf2EGeY9taRgbwSCB9ikqFhes8K1crlZsp0gmZMOl5h4l5
 X12MufLerlXAcspHKmcqZnwu7TDbeSe7OkZEObNy1/d1CdK/JX0s86PJKD6j2aDZqgvLzWs01Pi
 B5av0TEmcX463W62/BTD1bReGY0VVK27swND8iH95fbeWg4M5p
X-Received: by 2002:a05:6000:2012:b0:432:8537:85ca with SMTP id
 ffacd0b85a97d-435f3aadb35mr15395931f8f.50.1770031174877; 
 Mon, 02 Feb 2026 03:19:34 -0800 (PST)
Received: from P-NTS-Evian (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e46cesm43274368f8f.7.2026.02.02.03.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:19:34 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon,  2 Feb 2026 12:19:27 +0100
Message-ID: <20260202111927.136104-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770031175; x=1770635975; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UViC3/ASnPPETF+o4mRNhs0v8yQCUUEsghyFoh78Fxc=;
 b=btwHvetg3+Gt+pxC5Sk3jzevGZCIwvwemGY6otPclSRd+1MCL/y+f3x7SGFvP9JnYl
 6DeWuXPB7WfHwxUZPEQPxsgfXAmYlVUrtn+uKflb81gjsEABrMeyHIgalGMcLCf972QP
 bS2QlRlBM1I9G8P9pG30vialIo9og5g6viYfE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=btwHvetg
Subject: [Buildroot] [PATCH] package/avocado: bump version to 113.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our avocado version is old and requires fixes introduced in 112.0 to
support python 3.14 [1].

[1] https://github.com/avocado-framework/avocado/commit/c1de44fabc047f149d6a9f742adecd8ed5cf939d

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797019

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/avocado/avocado.hash | 2 +-
 package/avocado/avocado.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avocado/avocado.hash b/package/avocado/avocado.hash
index 117d708611..1801ad290b 100644
--- a/package/avocado/avocado.hash
+++ b/package/avocado/avocado.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bec1bfab821030f04306a93d2b2061a4a28db538873702f746d5bc050d92685b  avocado-98.0.tar.gz
+sha256  a916c90b43e67d4593feef121f820d3fd8c93c2aca2dbd2d8865f83a622d3487  avocado-113.0.tar.gz
 sha256  680ce56e9c4043826f0f1420935d2453ea3ddacd1582cb6f1cef26c1077fcc93  LICENSE
diff --git a/package/avocado/avocado.mk b/package/avocado/avocado.mk
index b308a37b37..1fda9d14aa 100644
--- a/package/avocado/avocado.mk
+++ b/package/avocado/avocado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVOCADO_VERSION = 98.0
+AVOCADO_VERSION = 113.0
 AVOCADO_SITE = $(call github,avocado-framework,avocado,$(AVOCADO_VERSION))
 AVOCADO_SETUP_TYPE = setuptools
 AVOCADO_LICENSE = GPL-2.0
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
