Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41BCD5BD0
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 09:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1124017C;
	Tue, 26 May 2026 09:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBidVRPmOwT1; Tue, 26 May 2026 09:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83BC840462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779788345;
	bh=lUbttdSz/AaNOol+RDyr6ZDBx69UG2ZIeEWcyFSa8K0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=The32EJUS5lcc8iKdXZdToDKQ3kWNX1w3g4au8oRcxBI1nsN1gDT5h7+yd196DyXE
	 8PVe9NxUMyraGSaAm0c+e1gomZa0f8KGg1b4IvMI0ZtMihB1DQn3aZM5+HzSpx7Fzj
	 q6b4IrLuYCC4Ks61XfQ+62ryjY7YhtJbJ6L136Jq1M1/pI0VtZmk/LQSCXz+NI9AnT
	 V0BfKkFe8L/7fHl1lz4SrDLdZuEjqIfQsfCpgcyfXIF8pIIAnLxvGAEGVlGZ8xsTgK
	 hzAlx1JSPuiK1pLpugWaBe116H0Ub4wj8zx7Gy0QjQ7CGpSu/Zmgrlpv0ZOilfTzDr
	 fxHXB+mY43U6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BC840462;
	Tue, 26 May 2026 09:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C134297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 09:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 498F68223F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 09:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bi6Cr7HfBd5a for <buildroot@buildroot.org>;
 Tue, 26 May 2026 09:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38B9081D46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B9081D46
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38B9081D46
 for <buildroot@buildroot.org>; Tue, 26 May 2026 09:39:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45e7c636e74so5459621f8f.0
 for <buildroot@buildroot.org>; Tue, 26 May 2026 02:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779788341; x=1780393141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mLVUuQZtaUHzf2O+xkNNn97H7eILzpZcR0pyVzgvG0=;
 b=UHbh4emXKlMokmpeCUVhMmAXc42A7Pl2ZNlUImm8HhcrYy8py3hH3IRFAPFfzZIiDV
 uV5mBsSWmFd0jmHPLQkbeAzvM0xeGh9kNtteJL0MBAOS6U//HovThR5/PuoNYlMv0rZS
 c+rVPQkls/jD+Wv7t1OgARyK6i0MQ6pY0nqqATC+LI+qDRu69TGprXg1w5D5qxcAHefj
 nSaRlL9kvW8Vv03t92FOhTFyOTg8nvwSD8EW1QToNOsDmVJ/NFi3NdrklyRW8Ru6mqL0
 abdUpfilSC61PdCcA45r7sV5oK0zP/6gC+qp6Rta0PwFep1N0HjVJuaX886WE0XjraCo
 IhBg==
X-Gm-Message-State: AOJu0YxbtY50AlOW6tmMwsoyi9afXffvwIxN3WfYJwXcGJXencgstTCH
 QYYCuovK+Gw0rSfxgnrbXPWuXpckbXaGrwlqNgCg0u29Mk2I2Oerjet+voOS
X-Gm-Gg: Acq92OFIuQq0CRiQ/zlGJCVB3vPF/s/u/DXrTzKdA6NN+VcKnM2GTNKLA2S6lWmjF76
 6ynThqrzUu8lImhPyq3gD+kJv+6ZDDNGU4KcbwoxFIPjW4Jzme91hFqpkai1yaxbNrXsR0q2d+A
 qmPkL+ed7lDI6tT3wIH2k3YmCOLzrAuJbF4LX/vaxexMjMCl5h49QzG9z1LEIMPAGyQw7d3ypKC
 hj3euOMkGBH7MN6kZWATJuDmcdZpoCz5bX9mU4q2Xvl40qUlRPQGSr9DdKb2mQ+1AxIoLXL6Nhz
 io2WfkH8Qs51TbakUZEJYY/35efJ6r7GwbWpn8Me/66mNv/JY2QnfNTzk1dGkglYxAFppJLAW6g
 wyY9xoPMuvO+qCvfJYIilorTbP7mrU2z8DH91yyCs44BpkhgqFlmqoCcCDbsWaLdvsp6Dq4rxu+
 GdLLFpqry5l25qVPcdRoVBmKp0Q78ajX60htAl1g==
X-Received: by 2002:a05:6000:25fd:b0:45b:d5d7:1f59 with SMTP id
 ffacd0b85a97d-45eb38a64f8mr27772795f8f.24.1779788341008; 
 Tue, 26 May 2026 02:39:01 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9f598sm34761125f8f.6.2026.05.26.02.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:39:00 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 26 May 2026 11:38:33 +0200
Message-ID: <20260526093857.252944-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779788341; x=1780393141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7mLVUuQZtaUHzf2O+xkNNn97H7eILzpZcR0pyVzgvG0=;
 b=CXM3pOeqq5oY1X3rYalbJDdWRYuWEBvjdqwJTUmdYKIJ3TbXsoMLuixsR3ViC7XtPE
 rl6Zwoys0OW5Lj979SbKvL87NylJysYkCxdII75TqVNQ5iLwz6dQwvHYIXpRTTXFi8CH
 rvtGEaZoToUNiMZt54iR3UpZaYyJ7BL/WmjQcDgiFyavb9NZux7sOVSlWINmGC5vnk+A
 TGwyAKgNBrPm/kQ+h7UUHFn3s0zC8x3nuS0p5YLHPihpFD+/oS6AyCa8qBGC3m9GTsRM
 IsMYQ08aeVGKUG5E53Z4O3TfZa+92VjVGUScivrU0XaT7CgTPq6h0menkDgOAL37r1nA
 j70w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CXM3pOeq
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.56.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/Canop/broot/blob/v1.56.3/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 56168b5a38..22ac57111a 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  dde0da41fe9ee0f03c7f2895134360a4d2e003ed1ebc726c7394009dd9ad0f07  broot-1.56.2-cargo5.tar.gz
+sha256  ea3d5136b390c8536b9a53e81c4dcffea2b33fb7816ed779f23b7fef01d57191  broot-1.56.3-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index dfd9629d12..9e0ccfd4be 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.2
+BROOT_VERSION = 1.56.3
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
