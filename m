Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F87CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03674068C;
	Thu, 15 Oct 2026 21:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGmIXcsKd4U5; Thu, 15 Oct 2026 21:52:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BDF9F406E0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101140;
	b=S/KCs9CIgOmSKJb96H3yaxbgQzg8mDHS5dUze3Sr3ijZq7KDfqsr7zg037tHoE+RBpFT
	 CZwuKJH4LbpNfU2/iputDw2KPa2pa17Xprg9jrYNRKv2HxaSQfHJfjlOElWRcNePkm+4r
	 y9ByzaZ8LZhulSUJZCL9aQpQlWeCHWAVgnJJS+QykOtJsDgKiAJhIR71aaJKIpTOg3udm
	 6FIMPFNInNN1IvjDdpCUpV4Twi1qrK1fWrOUkTMuhjbpl58oRXPsgQ9U6iD5LgBNK9840
	 /LSqalBijUasbb7oAsH4lZjifxzbp/xIarpZlWo9RWJh2Pq1NTmQS8xXyN2akDNCRDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zbBCNoTm55xxNU9calf4EIN0nvK9JYT5ZUnsf8pP46k=;
	b=Sfw5CyLVQRF/6l/mBA/Jffs0M4pTy3unzKb12n4pk5oJ3hg7cI9qg2C1FZ8yJrW6aaYl
	 g5DzxxW0UyLn2EHIZCncCXgtcacvDRWxMabR4hxg+XfTzaXql7j1aKwNUYjBjZN1OK3O6
	 5/YIsOvWvhz/SCS1CQ+BkOgoYNcmxkwrvAn45iYnzwXOXDG9nzRFSyHNQiYK6OoQ/Zv99
	 QkoivIF7anu/jDulQ0DV+T89201e+YPj7n0rWLC3s2f6S71+Oi5pdpqNGzHAdcWR856kU
	 X7jsL45Sm0fCDVRrUno9rSMxV38iE6ylhZlGrQlECH2lbdvRidbnnw/7Sz0u2wqMMTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101140;
	bh=zbBCNoTm55xxNU9calf4EIN0nvK9JYT5ZUnsf8pP46k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CJta2HjHtdyfZY4aNCjMCI0+DisRNe4ka+pfZIDPmfr6fxx2mkvEEMec21vwRskwu
	 gq0NqVwEmsBwvYfseb6eU46Ww7NIEBSJUTURS8UnyS7F4L8Lh5CcSy4yTNkjPuzSN9
	 k49AI1nZUYl3Ki46BnGl4Onm2cu4GEgctxaSVASgMeY9ui+8CYMHHyIiy833Hs50wM
	 qzPGPGNznbc3GR4RGokeo1Pl5Dn9oiXD6CQ7M2KqfObaExJYAcNp6LnD5Y8G5TBpMk
	 f6zxBItQpzhHXXC4aqgN7A5io1jab2xofJKLv7SaFsfcyRcZXKpOywFD2raqUk53er
	 Nuwf418H4uyjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF9F406E0;
	Thu, 15 Oct 2026 21:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89582332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F6638121D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbhO696LoNF2 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8177E8121B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101137;
 b=QbUTLYPU773VtbIpd0K8T3cwC+4t92c1Fqgw47YiGP7yt/PYuAurWPL9uc8M8RGVDqMe
 PE2eiWTAI2eSkrU8acr6bOUxyy7InuFkUjq1xqG8OxArdtS/A7xV0W9YAH1li2lmDezHV
 H2ORYRRTZNCh5SqXbYQkL9h7Pcb8SICinDrwliXTomhPTVWZDqmHqjBKlDeuA5MMFM5sl
 4b1qUFk6ykeCOP8auXg6jwlZ2ovruAy6KLGjPvNEOuFOYYykx+EuHM1+zlDsgZ6UjECGr
 Td0lVQLp1l4pb5Pl30EaBY9Ni6TSydYwDzV9d8tOx1XnQNxprZcgVgoboSrcat8INNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Luu8VB0noS0AslCK1lbeWK6upN0s6QGHOfvEwwpG01Q=;
 b=gleb21yYGW9mjfQ3uC3nX8v5UdIQUfGYn4ki5+6g5u5Vl5ppICuty+TL0N+lUOLD6CmZ
 Ft2VKVwaswWMHXwEtIG9mkaZpUI1kYv9ERdQ8RceStOTJkJw1dvVcgOALNFIR08RREoE2
 a3sTRxAOMmoN+T6PCLC1sAo1ZTCfWRuiSyZY1evmjA/udNve5ZiNJilJFQz6q8vY6cQFy
 uHQ2WbIr355zQCA6Yu2gPVPTDIBTc9sRDAaWVVgD55lVpXq8nsRUQc82CU7nGmt9ypdjK
 YHynjNBJvLy68X4HXe1KDGv4izxbE1kiXSQi5op1L146WlmFYouwZmcPHtKFYiX9sdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cWEwLhoJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cWEwLhoJ
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8177E8121B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:17 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4b28d9537bcso337069b6e.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101136; x=1792705936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Luu8VB0noS0AslCK1lbeWK6upN0s6QGHOfvEwwpG01Q=;
 b=cWEwLhoJvrnwau7L0SdFDn/RqjMkQxxpsauAF4hO7azbQ1e3BskA+Ps+5SloxZ49Sp
 11y3ZE1NcfvvhZxIjKzkAbpApD0Atjf/UIuc0Etzr6ESC09qxIhBxu1tpB/gDmCMwjlU
 lrwZRcVYPhlZPaGt75Vezci/KnvH6qv3/rMtvjUTNvBoGr3UBHDL8O5QBek/Ra01395x
 J7FfV4RwvW3PPSXN3V7Ujx37QFI702MD0i7p3rB4VPEDHq2mTxpuNO9+YzkmfBdAC5/L
 c7Pje33PGLAXzsUgHacctufv+YKOclujWk5gmdqcpIyMFMhdPdilJtOy4IKl1oTVSEhP
 MVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101136; x=1792705936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Luu8VB0noS0AslCK1lbeWK6upN0s6QGHOfvEwwpG01Q=;
 b=Wem+XOo83MCDmQjf2zE0CryvQN1b65a+J9OKhN2G6YCzjbr3OLAJ28vbLHxrGAoxnh
 5oSQPHC38SLep6D2mfdkMcCtp1WEsBD+4oh80/4Kek21KBkzcKrXg77vmyyS7v8AINXX
 0pmnvkDkmYYxKkLzkCTP1PMmy8zB+q63NP3vOU7qt+jrm7n/bOtu6gFKZsJd0LkdpPAp
 5qWAj8T5gkt8h5YsB91zrzHwAPrTMzsyjPhDEdzHVobspq/ghL4fYE3zB1yz6dOAFxBS
 nUglquY5lJekzClf4TST/h/VzkSAHr3S/d/mEOznkd7uVhqS0ra89Gl1s/acCkrsTI4t
 WJeQ==
X-Gm-Message-State: AFq9FYKcqv20MHkbTsHhmy1FaCQpoMKJfxtZA3GFW7Vp5snyRnn75uAM
 al96+iPM1u6IU5me/E7MMZTeiR+dZ7SjAc0Q7WJW300L9IpU2Vz8wq4wv4Ek6Q==
X-Gm-Gg: AYBFou07PJp1Pi8ArTqy5Gs/r/ZRABWvH98iuag8QddKIr2Wu0kgRxk0nqn0r6bG8Lx
 eFfGo0FvpCnfwIASfQMRhZLEnqeHAfazilvYmcL6AG/rfufKZhji6HyO2z833poBXkRmWj33Lnk
 JVwsNtvhyc+6IjJkTmLZLIPEUAMaq7ELD3FOORr1pNRcUP0A9Pm3RNSoINwEPldxwttY2WgNaW5
 3a0y8Kv7vVN4Af5iI4rlu/4DnCM0BMU/HaoD9/Xlpz/Fc78Z4btmCjrizUUv8hFKEXQZKzWvBsi
 xmgKoklYvWyyPDZp2ZGaJf9whDO5wAG6ZJMuKn/ZrOyURA1xAccAVW6ouCUzLwnIAwvvMZVShRb
 C50M+Ppz606FX0etXw2/MMpoBMfG7qEp8yniGYt+wdxlJ7CyJ0YFZ0HniKL0LaVRnjIK9KfRZE0
 59hIVa6D0gfKoeLfNCsGIim0M1uX59BcKeJ5Nk22WDGosOH7jha4c3RWGDPJDK138kYH3L8GWTs
 UbsmXMCdfd+CqrDNla75DJSTeGzId5bJc9nDEKBV1On2emszLA9YkNY7mH0FIlxreQAfDyWSshl
 DVP34WpvUEisVKO9jIKX3v5GMVBbpVQzG7CN01wZL5nuQIHtWgF8Eo4IdVKdpNl2Q2QJJTVKFfj
 Cc9LMUGTG1Ckm181qWMk+yCxJw5lEX1Spypspavxoa54=
X-Received: by 2002:a05:6808:c3f3:b0:52b:d800:e1cc with SMTP id
 5614622812f47-536ff691afemr982326b6e.30.1792101136152; 
 Thu, 15 Oct 2026 14:52:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:39 -0600
Message-ID: <20261015215210.3426895-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-entrypoints: bump to version
 0.4.2
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
 package/python-entrypoints/python-entrypoints.hash | 4 ++--
 package/python-entrypoints/python-entrypoints.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-entrypoints/python-entrypoints.hash b/package/python-entrypoints/python-entrypoints.hash
index a8deb85614..55161f1a50 100644
--- a/package/python-entrypoints/python-entrypoints.hash
+++ b/package/python-entrypoints/python-entrypoints.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/entrypoints/json
-md5  3acd8b72119a8fb1eac7030c24ac6b49  entrypoints-0.4.tar.gz
-sha256  b706eddaa9218a19ebcd67b56818f05bb27589b1ca9e8d797b74affad4ccacd4  entrypoints-0.4.tar.gz
+md5  593a00e93cb72f8cf5ab88358e550ada  entrypoints-0.4.2.tar.gz
+sha256  3bebd9a2cd05e08b123be74c277b36de4a38e899dba6a84ac9962ebe0c22ece6  entrypoints-0.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
diff --git a/package/python-entrypoints/python-entrypoints.mk b/package/python-entrypoints/python-entrypoints.mk
index 287b83605d..ac0e0072fb 100644
--- a/package/python-entrypoints/python-entrypoints.mk
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENTRYPOINTS_VERSION = 0.4
+PYTHON_ENTRYPOINTS_VERSION = 0.4.2
 PYTHON_ENTRYPOINTS_SOURCE = entrypoints-$(PYTHON_ENTRYPOINTS_VERSION).tar.gz
-PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/ea/8d/a7121ffe5f402dc015277d2d31eb82d2187334503a011c18f2e78ecbb9b2
+PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/9a/6d/8f96c1eb3aa1b448a718866e88e0201145a35e80ffcee3b1b88543d3e740
 PYTHON_ENTRYPOINTS_SETUP_TYPE = flit
 PYTHON_ENTRYPOINTS_LICENSE = MIT
 PYTHON_ENTRYPOINTS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
