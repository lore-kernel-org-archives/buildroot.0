Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5FCD0416
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA66407BD;
	Mon,  5 Jan 2026 21:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2zeOE058ZY9; Mon,  5 Jan 2026 21:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B95D0406D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767650294;
	bh=yslnVHIyu5T5e3Ov/dALrFfGnGer6gSVFoNRUSSKX3w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=psgzS2HPIfG/IPZgKLT8PPPQNs89SBccVIVOruA49z3BgM0LaULhrAjL8XXFOM8Al
	 Fpy2WH5SReeocEa8TV9L5D6r8eeuzDMJLki/gfwvKmnBE8LtlXcs37+DSvu7O7VCDJ
	 UXulIbv/pkJFRumSKkQZSL3wCh5xIg4mqa/96gn6q9ldBLjU8vnUVG2Oa63pv4oYeu
	 50EI+v7FqKU0gsoExDUe4AiCoyXfaDH0sjS6wDi4l1zlNHi9cJqasE3fOuhSikNp56
	 76P/iaiQFXWIho20s6L98A3xbs7jBJG4RTkaHg/Kc9U4wb3ztv4gCxzz60MoaqWROp
	 bBiWboRXjGJrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B95D0406D8;
	Mon,  5 Jan 2026 21:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 725BF96F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5805460692
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1HdBohiLEVQ for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 21:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C07A60666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C07A60666
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C07A60666
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:58:12 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-455af5758fdso273460b6e.1
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 13:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767650291; x=1768255091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bysgmn22t/NUX6jwQDRqL8JrU+tZMpP5gQE/wxMLWM=;
 b=YM8u6Icq4hMUrVQKf+GMUxjdgFF62urCj2bRYLx0fvIA0TCzA0r/CuXfAAVwCq7gK7
 yCxUihGFinHkVF432I+vTrMoWsD546L8UfnTbGu6zt7jdWHKLybid1aReevGDPXzI9RQ
 cki3cs21U1w7lyezq619AXjl+uaIjETn83cMP8ZXxmrRUKVsU26tb1ZA1C/2uLox2pA9
 wDVsMv97A/klAyIiXCKW0a+caKpdl9fi5kKPwHdYhcm3ml4g4mMubdETc3IHzXXbZu9D
 xWq27KbPUQQyN4KRpzRKIg9AvIIFpa9Q8XHvmYp/xX8s8K7aEcrupYpje5B7lXawHw+l
 evBw==
X-Gm-Message-State: AOJu0YzNboxnk6VY1WLB5/N9HpB/IQsDc/oGcWqYehvhuSLrmuMQTZs0
 MfaidY0xhwCtx1DVgAjtSIB7v4+sfUdztc5vS4fSL1ya1oiP3niQLxcz1b/9SMOk
X-Gm-Gg: AY/fxX4s72hd6TkMpOREZJBGbdlqBjGg/VKr/0WR+tA6kHoQ7tro1YG0pvjNG9V9s0V
 159yo3x2d4tTG0BWX+05oMIYBy18K6I6qW0CneBgZZ2+9CuFzUzvkUwj3EFECnaugQf2RdKXJiK
 QGLzirpczJPMPd0/z/9Fj6y8F4bg1fn8efU8Ah4nXqACp7MUEl8Df/++OoYMvU9uWzQwL0rRN8H
 moR9dHC0TkB/kYNlY49vxZYKGB0+uMYFYQnxc7JDPVOSvVlD5K3ayMLDEL06cL7oBozKhQ0iQGv
 vClNHhq40GlpioRIKSfOBBoTS0r6FtQ2HAdhRMq1YdSZjJmBA+9qsGa42bFLxSD3gewYPRe6s4L
 QFugGXzsmpJfnsXFbdXed+I9xoO4m3yX8Gp9gOYnzpJBpzK9jIONJyRj9Ndy7mvuocIHQlK1cDA
 nNJdqfjoacHBHt80AK/e0SsAx/ZvNKS1jLFbHfM6EEzYOXJFHjhBCYrLPvCEOKtApuvSTH3ByKp
 Lh1LxbK6J70bSDrUQcIdGi3cJCfRc3u2UyH8wAXYWMS1Jx+MYc2drpxuKAf
X-Google-Smtp-Source: AGHT+IEbzHgQUoMeDNh8DbmAsXGKjV3BUwPcQO6SnWLv7SXKihJku2mhcpt3irgddrKBrwCa+hUBHw==
X-Received: by 2002:a05:6808:10d3:b0:450:f45e:f4a9 with SMTP id
 5614622812f47-45a5b033833mr593716b6e.19.1767650290981; 
 Mon, 05 Jan 2026 13:58:10 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (97-118-158-110.hlrn.qwest.net.
 [97.118.158.110]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-45a5e2b74e0sm82256b6e.16.2026.01.05.13.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 13:58:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 14:58:07 -0700
Message-ID: <20260105215807.1898190-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767650291; x=1768255091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3bysgmn22t/NUX6jwQDRqL8JrU+tZMpP5gQE/wxMLWM=;
 b=SadeMz1OQ9+AhP0EcG+BUzato9EMywjatskPzK2PEUr5r4gq7GrXNh86UKSiLtcbZV
 pOURAZAEvfu46zfF41u441ZHODmgNqr5/d8/qBTjd9j73pBJvOJqDnEFJ+44H/Nzt61t
 2AFS/zDD+V7YXU5v0kAJfQChAJRKNq21pU8TM+J72wsZjeLx9lRJ/FOKfSXhiUPiThP7
 1O0SzKOuV3PMMscP5kwsBs866xBcbbR4m4tl1w6WDJJ8FR8x42rxA60pdAygACvc3pru
 IQ5fK5zlrFmPGXYQ59OWEKm5OlpaCXE9JeEKTEs1iYQp0Zk/GRHr+4/xoc/UqERy9+H8
 XOYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SadeMz1O
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.11.2
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index b530d93b49..a92307d53b 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  d50215b4a1ed4261f6de56413a954c14dfbc7f3481f176fe64ee078dd6a9a052  python-maturin-1.10.2-cargo4.tar.gz
+sha256  f4d2f9955b1b1d1ca71558ce969b65345056ef8db643cea33bc4aa124fb248df  python-maturin-1.11.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index e4d91a6545..dba5e8bbce 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.10.2
+PYTHON_MATURIN_VERSION = 1.11.2
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/02/44/c593afce7d418ae6016b955c978055232359ad28c707a9ac6643fc60512d
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/2f/1c/00b48c6b93a5b3795ec96165a60dbafd3c5094aae281ba56812a8cad4fc7
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
