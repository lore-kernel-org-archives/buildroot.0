Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45732CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 091FC60DB2;
	Sat,  3 Oct 2026 07:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufy7pPv3x8TB; Sat,  3 Oct 2026 07:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1937C60DA2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012187;
	b=nAPuxIAan5Hwk0dkTSy1BjkzUvhU978gy5durqE2EJP3rbhpf6l/RbIfJ6wfLEXnAhK5
	 jVLPClA25Z6gCSHp86Mj3zZCWWIFuTOmD95PyS/Yu6RGHQqm/kBRzKaNqyPX7Q1R6263h
	 IjtWSVw4K1hq9N0n3JryqKJzwCpKaKSOwMnzCcGjzCyKh8GTEdW+8YAFBTZu2eJOp41xD
	 bJ6DHvl7yfw+rO8uCKpjfx54U1vGuXL5tTkm8YJvNabxKqXScBQOF5WlDjchto1iILa9m
	 yVAwWHDQSfjasXSXr9PV4W0pJjOptJxVtfmPay+2QpxxPm4qDoeURAmQcK1LWjHHDag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OfvnDv/p/ZHSE6V67Q67MUDTkNOfcB061VGpmT/vNzU=;
	b=UvS91U45wBSPIlhB37TPEkaGUNrWaKLdqSOyMcbNUQCwbRVJ93FsuESOuMPZSf2cefNv
	 /XGB37CDmHWU5UB4g/NJNnkQGTTtDFriayTYmzX4GC7D3a8+6BWXFehV/0jA/wY5gm+ev
	 5tCJ7y+Qjg6WuDF2uppXMPwyRUo+l9vmsOpQCP7mooxECAGD8a0tTmpVs9nDEkRTzqcSE
	 wKd2D6p6hs5LHY8aySEFJvxRsdT4PkWoNDVemHTKA5lEoMuxehsyJEaWP0j5myfeidwRF
	 s5fOA6hNxPIvPoYWBwEDwtsTB52Wpao+0q1E2OvzVhU4n5tDDvK5wLKQ55lbxx/yVjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lq4OsV6O;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012187;
	bh=OfvnDv/p/ZHSE6V67Q67MUDTkNOfcB061VGpmT/vNzU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o+EW7clZKkT7JseDT+ZOlOyE7VapoI6MO39/ADiqYq1ooYFKUsZ4heHQro/WGjXUn
	 NFdomv0UPPC5zUd58hVjUGEuHW1V/JYDOYKTa3ipuZt4Z9/tfWKTmo4w1gtj7w+Imv
	 fX+bqYRZSK8PaD5DE+WR82FuetimJkb5XIjQTia0CiqPGJi/k0G68z6FQabY+H70pO
	 Kge6zAFMVLHiGsTMkGJBkEQKRxtWTbbA0c/MURh3lYz7zBV0giLzDNfo311HOtcoeQ
	 Q0gzBlYOrMLyryzbU/lNozBD7+/BowhbCNKceMZ1nyJ3ItWoYYzadBDSbCygEcNixJ
	 OZLVuySDFvBIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1937C60DA2;
	Sat,  3 Oct 2026 07:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3528B34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26CD660D96
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWGqJLJKGAWc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3665D6065A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012184;
 b=J9eY14YxI3DJuaABHBvt0CGr84Ouw9U1fm6ADmyHx6M/VUBv72kwbpHKsyJEFBCyq6kK
 92RuiQm6+PMzdRR9eCQuVkIJ1IcEDMxqlmULznGq//gtBD3SG6VDwFVd3DRV7hGGqCgXw
 lknuZ8BOuXPAaYfG1w7OHVz5IqfgLD4NcG7/pwJm+l7XTF6wkgMfk0MFCkSQJWOfiwiT4
 cXabGKo2Vh3CIJ7NvKee2MVpgNK3yfCqHwy+7hXIZuw+V87FuLvPF0Z5+x8/B/GDlyydq
 7xZV2kutvvYv+oTq6P1ke/JDo4JNKmfk2aIrk7ZBUZKjWmBigfZpbGGqMmbRaTHHfYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012184;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+vilh5e85WQGFtbnh91G651cNl6VVzSPuaQvQww3vR4=;
 b=D3uJnLNTY3ZrmuFtRxcgb/1txf98cM3RyeaK/y3Y8y6rbDWAe6liW0EYzyOAwN6nH/1Z
 dh2In4hPz2m2wKb1bEv/gtYoSBizEwncuKUlK1gtULs+GgOihN6v0u7QQLPQCejlGss7n
 s3K/t8aebN69YQrqoMEUm7QKt8jY2ojt+DlXUbK81uaM9C9Anoj247VkekB94x3U8HkZE
 SYeowaYVxfTIN3oGpZk6vyEfRj5P9k+DnMdj6O9t7v4CQj2do5u4O6GONZZQ4YsyNgg8S
 38fvhFpZzyj6reHPseQi28yOkwa8cOC/1T9QsMcifotkRFsvTZ6RIm0fFgYA2oMjAVA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lq4OsV6O; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lq4OsV6O
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3665D6065A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010941;
 bh=+vilh5e85WQGFtbnh91G651cNl6VVzSPuaQvQww3vR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lq4OsV6O6JXOYYgsjAtBKP41cpcqTbQpiBJrA/EJFIISf6+rTDp3ilqDeBXACHcp3
 CVa7ajF1qoQ32G2t8u564Y44OXjuZb1vFyljmO7KhXab3x55XCqez1++u1cPj0c7mz
 hXKtdTYH7dVTe04akcRSMgtheQjY+6v/AhCfbK/nY8F/JerKczQU8UQVINK9fhBKoV
 jfoMOjWws9tQe7QAhQazKrnohr5NBBC0kEDKLDbGZJlvHIY6Jx7gNgpSm/b/lijbs0
 DhEh3yK0TZF4Yl9qZeh67c9G3oeBbaT3mgU3FBHNqkP9aqdxvl6NQzWviq2fO+LMeb
 mR8tNUPgAw41Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 5uqWti+h1uVIzIk1m0sI5kzzkylME1kBKZ4+GO6LXbihmlJYQoCVgq/IeSZCZqBaoclGJd3LZnf
 cc0gXlasDoj/17jJwjzXePMGdITmFkzFjQjlj9HL25/odpWrvgJnrh+XSmF5Y9aEVpHVF1CFit1
 q4zmi3wUabc7bH/21GDPPKtAI9yn9f++4YSIKJG2nb+Bn1Gto9qjr7RVgZdohaWwc2gDSo+yRnL
 3ZNW0vYMyaGhcEH3837RMaaqAUOihryfcED5xmDHgxwHCiPKXjiV4/92ekIAVD+M6Lg6AdrgCgo
 orMFVIUfhyasK1spVAhVV26cu+QpkDi7N01xOA3lHQO5bCRUe10IT4Ro+WhS03ajuEcf8+cTkZU
 EFHAutBDkWPNv8ihZ0w3uILYoJeZIgXw42K+TeV4ZCz2IUG3cbakav6atK0Vi3hqpKjtyq9WnT4
 diTbl1wVkotoYkrC3TfVACiIPNu734eGfhHVfYNn2+rvdGOmRALMMBv+69uer9zeGhMcOmcYvbp
 +bhXmDTM9+Gs0mu2v0UOlbZztwvO5201upEoJMUDTWWg+qX26rzB1FTDov80t7qqYkCRXfJpsrr
 opMLcSGnL6QJxeOLrm0FR0S3wrxVYZWsJ3L9ObI6Cx5Zd4ri7wae/3Af/bXzZ1UW
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D33ABA4C551D;
 Sat,  3 Oct 2026 09:02:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-1VJi;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:14 +0200
Message-ID: <20261003070128.1295458-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 042/114] package/python-matplotlib-inline: bump
 version to 0.2.2
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
 .../python-matplotlib-inline/python-matplotlib-inline.hash    | 4 ++--
 package/python-matplotlib-inline/python-matplotlib-inline.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
index 6370d2ce87..bd86592bf8 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.hash
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
-md5  25b1b460ee846df0d4d5d92dc8e6664c  matplotlib_inline-0.2.1.tar.gz
-sha256  e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe  matplotlib_inline-0.2.1.tar.gz
+md5  20174d6e66b812e9e26ea1ed6bc0201c  matplotlib_inline-0.2.2.tar.gz
+sha256  72f3fe8fce36b70d4a5b612f899090cd0401deddc4ea90e1572b9f4bfb058c79  matplotlib_inline-0.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
index 54c4a18661..0fe043cd71 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.mk
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.1
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.2
 PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib_inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
-PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/c7/74/97e72a36efd4ae2bccb3463284300f8953f199b5ffbc04cbbb0ec78f74b1
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/bd/c0/9f7c9a46090390368a4d7bcb76bb87a4a36c421e4c0792cdb53486ffac7a
 PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = flit
 PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
 PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
