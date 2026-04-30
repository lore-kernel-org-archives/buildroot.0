Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40216FF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 09:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77018432D;
	Thu, 30 Apr 2026 09:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkFa453C9t0M; Thu, 30 Apr 2026 09:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4827B8128E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777539618;
	bh=AyHVHcF6nQyU5ChFiCOTku3WX9FAC9OIHWXJpLy+Uqk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lk1okmGYJgPmpEYZ5inK4Y2AAJ8xNmGZ4wjbzwKfzy+n2ikFbayWsDl6vZ6GG4MIU
	 VXCVX+eEjUs3Xsfo4aBdlcn35Ug3wwiJOGKxY3QBTxOF3RAtyOxLkPVMB1Fv/TcXrA
	 Wip2KR959huervc3cCsDHQ7O6vFGdbyiaOyHBJe+88Lj92i4f5Y0yhlAfFAo6mIWao
	 abiHhFrYNIEVBv26toh/Ih8/deyOe5YA1dGjSY7CX1eGnoPo0OzJAtKOyyYLvr1iD/
	 g6579UpCAft/rLziVZRUhKMMnl3mZGXwCvk4IkGDo9AICvEKLRMTk4R47SxYAa3IzN
	 GLBzcODZCLfgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4827B8128E;
	Thu, 30 Apr 2026 09:00:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D8E18F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 09:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39AD40AD8
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 09:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lzbu6e99RUAi for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 09:00:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 264FD40AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264FD40AC5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 264FD40AC5
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 09:00:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso5512585e9.1
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 02:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777539613; x=1778144413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Typ/RJQnxmKBQJ4O9NjPIFi+xHlN/OT9C3Un/Z4TM3U=;
 b=jZ+lAP9Q582Hcw6GRcaq2tQx5WF2zcrbJ9K1DxVpXoYi8XdRakqcjyjLnGMFggrGF+
 s2zpmhkXnWNcs3im/U4u0prk/8z8BcBvJ5taVkUPZoAh9So1JTgO4rG6k3yTTY9wrwhO
 TC2Gef3H+aIDbab+eXu3yDLc4yo+RPnoVeSbjkhEk9CBbt01651g42cykZf7WQdSXAO6
 C6oa9BmDPfwKSJZkE707/o8zRN4LWbDMO1b5Ume5dmovTPOdqTE+hTnDAakDb2I/53Dx
 UkzH8y/7OlHhY0LzjwYNuGwXQXeBxRlBIp8WANRPfFQGuUwDgaKyQo93Zqrz9lfcn4FH
 0h6w==
X-Gm-Message-State: AOJu0YyGy7s1+iA7IAduM9aiNmofv1tgbfZsEb8r3CKpaNLQdXVoyP2P
 yA40z8J+XmmqWsuKsmxE3uNobAKJiSrLEGGReorokXuEgTVbIARXYgUa2WurnL4tHWzVGodMrVi
 gb1BwdKs=
X-Gm-Gg: AeBDiesVEn6gmADsRMU97J4VVXEmS+IIy9MO1DnjVwYe6ohjFgURdqcK/r9xtI1roRY
 zRkoM/DL96/pe1tGlqDl9fpLC5akN2HQ9ou+mA0OwQaSesbv9qiwB2SBrt4QAVtsC2QVynBmfz5
 8v0Ws7z9Mfh6nJBNWwmlJIq6h9WItKoVohMygRhTGlhhGPOPHGx094eo3KjsiLtcK/HjetRXEY2
 XgCMmTMNYXZQ40g4P/NetkbEseltpf3LP+Dn1MlONASXWvkXVYPuIreb2CNfLCPfFUl6P4sLM5r
 tqJZ4vTyr+GSdn7T6Lp5YbIipKUAqQLPn509gnBlOjWGw42iXhjIc4JTRQ0nPKKFUANeM0QymlS
 j5ZhHZGOBFvxTkXVggXQ7ZImIPAulO4hP6FdMOsV7r/jcZJ0HqYIFK070RgxKpNriE2n91kl/02
 bvRMN6AVYm+Q/O9H3n58lU4SdG+CFIPZXFEEECHmFyN5UO
X-Received: by 2002:a05:600c:a409:b0:48a:53ea:13eb with SMTP id
 5b1f17b1804b1-48a83d66d44mr26619665e9.5.1777539612431; 
 Thu, 30 Apr 2026 02:00:12 -0700 (PDT)
Received: from dragon.home ([109.137.238.219])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a820c71c8sm85618555e9.4.2026.04.30.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:00:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	thomas.perale@mind.be
Date: Thu, 30 Apr 2026 11:00:01 +0200
Message-ID: <20260430090001.339335-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777539613; x=1778144413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Typ/RJQnxmKBQJ4O9NjPIFi+xHlN/OT9C3Un/Z4TM3U=;
 b=U0+cxKYjsfgJU0dr5WoQ5BvT2OlKqYAnKNAUtB1rOIO7KHiY48wuMcYTmIe0XSAlfO
 teVTmOWmcQYLctTnB4LVQoYW26NzGhWgawwxCODFz8N3oqwKF5cS9TyPaRoKVNxjheZL
 u9M/DfcqylG9i9gKweCLhfRkGN4qPvZZ/hrIS50G2qM8/k1RvMshMGcjw3wHEw8DJsP9
 M7/sJT5P/gP/NO4ZNIWU2be2WakEEqs27h8SNEubk+al3NDSSMb1/iMQ4lzlagieAeWd
 K24IyrRqYVzAOyhnmd4h8I79waDHB+Njfdek97lKA7l+QsnNEaIjD6WtxN0A7GHSAIAp
 WCkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=U0+cxKYj
Subject: [Buildroot] [PATCH for 2025.02.x] package/openvpn: security bump to
 v2.6.20
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://github.com/OpenVPN/openvpn/blob/v2.6.20/Changes.rst

This fixes 2 security issues:
- CVE-2026-40215:
    race condition in TLS handshake that could lead to leaking of packet
    data from a previous handshake under specific circumstances
- CVE-2026-35058:
    server ASSERT() on receiving a suitably malformed packet with a valid
    tls-crypt-v2 key

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 0123babe4b..957537dde6 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4  openvpn-2.6.16.tar.gz
+sha256  952ecee5b911a5353c0a6d40af62a7076c6dea1481ef204ce6d3f10481531315  openvpn-2.6.20.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 0175c51d63..a117f6ee8c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.16
+OPENVPN_VERSION = 2.6.20
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
