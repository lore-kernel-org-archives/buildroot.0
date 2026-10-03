Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A7ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B90F440D6D;
	Sat,  3 Oct 2026 07:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoHT-1Sh2KcD; Sat,  3 Oct 2026 07:06:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E6BFB40D7E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011198;
	b=Sq6XqDAJkOl0Xreq7E+y4yWdFd9zy17DYg+Pq0jOYnl6CGT2EzbA9vgjo/dfiMNVYlHp
	 vgy5ZER/THTGJBIZxUlqjYodB/pW7i5Qzp8xOrcMDEDRY2MQIKTB47VaBi7jprTYrV5vZ
	 IRTgdOivqXGX9W8SghbOyrFn97PGijP6Ovj8/fHNJgKv00tcmIA7VuAMdAvprdoqzQAO5
	 CWZ4hNUASZIySwNXgUHZ5jgJOIiN3X2SRhbLmmmCFU8crGkXrQL8mDih11QBH0aSdivSe
	 ngffv2WR9UFewOnlsIuHBVaR+iCTD90Umk8H1EB4GP5vLRv9dujXQX/Xfe/qCDaWoqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cnZYBFo6Ov9RTd/3Shq8wgR2ooqT7krdF6ijdImvt/A=;
	b=K4ZtmIrzek8XBmbAd4XS7uOJCSF1a5tP55Mju/gWNO2cGuzAJ+gNgyOMj2u73AurF2uy
	 FIBjDiuqwKsxPlJiCO/hxI0sGk6fRuQ3C3rOxAWt+lKKBt0Z5xS3Jdf1wu3fVCPiXOVE5
	 eEoJX+dgG00NNqP86irETEenTLrDcLWiVOCoT4cHYKDSDotmyvHOVP1BA8hiGzJfvKxFY
	 twD4+tkZn+o3nSSCfP9Gn5C/hlzc349Q/irJnUVnTKA8K5zjFTjZ5bVKWAOJXVmEo9wvo
	 VuGcuSEjFLIrl+gBgN+IeAAbsiygcZc2a2G0tsCp9KOVuPxaM4JOEFrCy1VYgj6tQfQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011198;
	bh=cnZYBFo6Ov9RTd/3Shq8wgR2ooqT7krdF6ijdImvt/A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tIDBO62KN80323IlQVN7rlYLirqvgA2b/Xe8GmXnsMMNExfLYi7axNkU/zJATqm/p
	 iWSmXFSRcQc9CpwUIx2qtGyBmMAZONbX66oJlOhdsF2EySMSn4E1c/J89t+Ek5/XOM
	 zzMlo1drgINhQ4XEIBIyN5/U/TV5fA414zUKmiaUtBc+fMxZbht5pt41PjfSl7XOjk
	 pFS0DdaeXtACipd4Pof/3Nx6KTdkVlo9VDOBjLxWvM8tuTlW2oqmxOF2bQtneZ+OMC
	 GC/KKMXXU9Wc14+/BmV5EowTMgs26Nm4G6dbPgrllvrjMr6T8RUlWgC5IqLKxeTSPE
	 Y6nFRFBvpTKkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6BFB40D7E;
	Sat,  3 Oct 2026 07:06:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF717263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E908400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbiT2ydBVxMi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3A6E340050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011194;
 b=clYoCCSRC4UA+ioFrdRf40qyO8n0w7aHArC0O0wAShxa2O6MlOB8TefZ9Ub0/JIaxkww
 BXEgUv9U6DE+l9edyIbHcZWEWn21VMz3yOc2wBO4jYv3+gY2xGDoSVqjZJNvOORqzyxkt
 J9iN824dVwKj2K1T6ehwaMf06vK7LTzU1HLxstu2Zj/GzeaecQcF5YLOqzr/44Xg0vQH5
 hwJoyJf3rjB5QjR1eDckHN8qVWtpK90/XAjWsCqOxgN+uGu9gNKb0E+TjYHDDmXlDiJhz
 72PvA8MOoQOgTydBdYAbVxDG7j8EHIyXxAZosptkHjOOyVUcNiEhn37mawGBLUagefQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011194;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gg0gLRZHEwRusmTFX6qL0GI/AjqPfy9EStHnbDw6Rak=;
 b=pHHx8pLxRdF44GG7Bfk53JWbw2657aq7DD5dLtxGkOVTMXg9nJCc6ETlMGiPWRxbQkKz
 Tyv75TJqsUjYHXCh2tJvPInSEqKBdko7njZuoS38dIsHfnF7KWthshiye0S5wqbkhE3ks
 fquPsRa4nZ5NjuDaX2S9OApuwcVPYPcq3qbHO3ag7HXu2BI4BaBm1anQ9gr1/ILCfC8Q7
 TUg5drEax1gvxuGl7YvDkVFSka2rYj17IgcL1FKlhhTE66TBHYnRdYFYiwp+j5DS/GF2K
 ZQPEMHSM/zqkSpSwZ7Cvz8siDT5bUiIIswWZYcijJZq/5MR5CGExr6Zz2h6VYdA5y5Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GkAaNqHH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GkAaNqHH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A6E340050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010926;
 bh=gg0gLRZHEwRusmTFX6qL0GI/AjqPfy9EStHnbDw6Rak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GkAaNqHHLNIDLbhYF5HEJ7vPJydMks5UL1QlBZDms9xrALFfrJRIuvDwOSCGgNpZN
 BiFvWWUpihPvQ/cPPh7P381gZ+G/lUbe2ovtXIDoMvQFobqxpSmSbC0RTpVT3KZk2b
 aKN7sd26JtlsUAc9b+DQvSAFJX9frH79T4aK8lYIqrSSXt89kLUu9E1zfp/H64190S
 5LS/jpWPzCuR0vFG5bjLHwpebFwA4akZMt8NzPh3YojwbTIsvBl4F4JwPAAOU4w6JF
 xq51duLJj6M5DTHgXX07X1w1CaNSXrhoy2aU75B26OIR6GveUZftEQv6kveL6bZV5p
 kPKEflOQhHrQQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 bR/daX1m5dejLgl/lnN5DQGhiMBu5XePo+ekyAW8E2y5betA8L74yD1I3K7WDDFNsdI6pSKdPNc
 eOQeXGzffSH0qKK+ptIuuaHnEw1zeED7IEja7kXkXZB0lFlMloOx60RVE5c972ZKu6W1hE4Jlmq
 LAlgJCQz6ITJeaenkdja4vm8Mivb+Th4nc4zLy5AYA/UX659y7JBEmMK+kH7TF1oF5cRsp1y2fH
 nFsp+9LPY9N/P1mvxefD5wLAxHy47Ipr8eUnayKEq2iqzoXlUFlpSvPTwWSseufiMnBydNqYNyB
 2LyxvHwdJ10BAvkddZ28XtTfsi1jDaYnlWlRsjO3cpLKSNARPYklsdlgoFIxKpR1TQPQw7oKfSk
 cUK3r/efZWXOoqe/qU6RUHzEzcW0Rp7VsLaQUE6e3Hsr0BeRLv7CXi+2jaSmKP2TzfFmC3fpaAG
 LVlH/9ivtLNtoCaexMlqAhoWbNFfcX9p8wIEGzrJDlGvgo9D8ZKdyot22fO266ZBSJ7BZ3rG5Q7
 Q8hRxzE+ooZpAemDcFmzy+c+CCVuxr5IjmnYYaPwLv7GpHijBiRXIr6Vho6J1v2pD2EpVMei4G7
 xnEDy7jj2X+B5eHsTPGPxEjWrprt+oSTAFQK9eikJe0wDVDvI8bu8HH4Bvwqgxe4
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47D8AA4C5421;
 Sat,  3 Oct 2026 09:02:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-3uRN;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:34 +0200
Message-ID: <20261003070128.1295458-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 062/114] package/python-pylibfdt: bump version
 to 1.7.2.post2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 80459b3e28..3b6d1b40ed 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pylibfdt/json
-md5  206a0504f3d0f5895c00f572bc367e54  pylibfdt-1.7.2.post1.tar.gz
-sha256  08ec69755f7565dc25e4e640e0315795888d4caeb7f146de4e05bf12b03c94c8  pylibfdt-1.7.2.post1.tar.gz
+md5  d0b611ad5fe4efa6e6259e79a573381e  pylibfdt-1.7.2.post2.tar.gz
+sha256  b23d03d10ab62ad1f4e7eedde0eb8a7a8872cc08d2a5c2bba7b48bb6fd3c69f4  pylibfdt-1.7.2.post2.tar.gz
 # Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 483ac773c4..6aa83668f9 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.2.post1
+PYTHON_PYLIBFDT_VERSION = 1.7.2.post2
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/a2/b8/ef881f0e76af7727ca9c5e27a121db69667c69e4e91eceaafe97f3666a6c
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/0e/98/a25a6311bae8ccbdd56b3e581405c68ab49c57a1127a7c21b3da3847d4ab
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
