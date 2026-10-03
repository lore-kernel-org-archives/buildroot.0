Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78166CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4587940F37;
	Sat,  3 Oct 2026 07:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZrMcH97AV0R; Sat,  3 Oct 2026 07:13:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 64FAD40F34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011582;
	b=VxdSixpI5gFiUnng2TYvyEegwIA1WrDkRmnhv2jWDpbkwEc19DJ8kFSdsAggLehWAvSD
	 /KiAHPJ+ASDcmap6ee8FfTRvnE9QcdlN+kI5PK9X44aKb+GrJDcTmoJK3Y5AHTQhHxg3J
	 zC6aRNmxrRfjFIHQGaK4Sg6RNC2w9E3GWNngJ5NM5WZScERC0b8LsJm1NHA4F1r7HFwpv
	 bfyiSW08h0gO21rCP7uhqaNFpdnd91K/FKmfjJZ/Zx2N+RW4D8NopZSL9KdKWkxyaKbdS
	 oRYBsxY7eny3za1jYcvvbz9IXIP0m+utIv3Q9fVSEuiI9rSS12N4ynQsX6F3vLs7gkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011582;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hz2iCTcCtYwCA38NzCtQHE+YorBkpfrlEgxO4ngTHVQ=;
	b=cClT1KEa7Irm/IlgpFfEZQ6FK9h+eITZyZV3iOsL1za3TddUvipay6mRFKOY1UR4M4EB
	 lsczZ+6YvZcze3nJH0ruqAqpCnfZYyy74G7i4pLPWs4G5sIUQndGfbSWWN0MChXBzRfsy
	 jAUUoS61Q3FxGYuxclKr+KkFKrSFnJhcUOmnMjy5h47FjWRbnSeALVvhKjRF4uM8J2Et2
	 L57slCLmr5/Zci/q+v4esWr/fxr7UBKjjN0AZiJiiDZqSk31F0ooycfvMnYNgiNy7fbFa
	 sPcW74OgIVNXSaL+mNxUsAJ/u1mtlfXBdtXWCt2QpPd5qBrmiwiwhXve1VybA28buUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011582;
	bh=Hz2iCTcCtYwCA38NzCtQHE+YorBkpfrlEgxO4ngTHVQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lEUhIZryYDNKkNNHqcYrv0oAgssvxjdnNxiAdf0nWcd8H3R5Rb/VCV8rxtK4p5tQJ
	 PoyYu0ZDDOj0jYhR3iQqKNKh0khS9nOmTVqf2rkwzPbWDKnKO981J0KLOT6WcNWRpW
	 zbMbNOTvOfSEK2OAKCdRhMRvDFIlLWNpwwbZLI1eZHFKPlvP1qqLw8UH4NiWvAQm8o
	 YwX/Ul0ewkRrW58TU+fzHQqdtM+ui0+jUX8r3/vesZbYnmBq15n1ds23djqw3nJahA
	 DwJstUmGGIrdlh6k33ShLPMY7rdWLMPu7z6MGV9Ug31CKiVP1x1aqaJ4zicjGxWmCY
	 Q7kJYZ6Vu+N1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FAD40F34;
	Sat,  3 Oct 2026 07:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F012A34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1AE160643
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWF9HStXqt5K for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:13:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E82866062C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011580;
 b=i6q8+w7wwU6Ox8EZGnTRet/isIjiIN/GdcZXGkYQaONBa2wBT9tPHRgOcw2CqtB+IjD1
 LsxBLFsZk8Xx+PdduoISska5cu5UkzJOSzLhUJoLpU/n8rVXCbQWZz8B2f7x5lo/J8JdH
 IVkABtNbU3wirUHPFe6FS90P3vDSyg3SwZSQG0fa4WQj1ZuXhwxCkC/i1G+l5dnzDC1BF
 XNxKJ/HyhnXwCfowJjmPaRm5y493m01JqS1cQ8GRgoYKGYsW0WsOZGaQqpzVtNL3QaKkl
 McVes0kA2pNLMUvhrwfSYlQQ8KpEjGuCgLvYfwJ13IuS2MTWNIeqV1WSqKf1E6+vIEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011580;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=X2LVkLiW2EqfOL78DmGvlEr07pmmBNbvJnve9Gqp8ME=;
 b=dqYTuiiROxBqJePa8DFz1Z+m4Zjtw8IakqoNn57d3RhfX6Pl22EYLNovQZfTElMchn8b
 EWzo8Pq3cI3DMw3GLNGwXkbTox0hMH0CcV+iLOL5Ptc9/UXf6iN2n3u38NSQEL0xlatS/
 jhwe/Xf2Fewt2Q42bsBgu814PO2TB8QKbF/mTfC7VJJTdbE4xfgDQd3Thoo2z8bEx0bqs
 EBk1KA8T+V8daqB7qsws1xhPe/R0spdWkHzltk0w3JzSeXZZgAJ18RPjFUxgMSjmjKInc
 ZHKcUQybSnL2jZiHllYygwH1lgi6iEJbeh+myUEzAs4W0dEKEQx/dLvS++2GxfshHiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hpw8hhyd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hpw8hhyd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E82866062C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010932;
 bh=X2LVkLiW2EqfOL78DmGvlEr07pmmBNbvJnve9Gqp8ME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hpw8hhyd/82vNCGZYJi1l7pFLme2eKOr5e00e9B8Cjrh9lNJCB6KmBDG/nxbww4Gh
 XJE05g7cQmF/ngE3s/pmYOKzyyid1U8zeR+TuvaFXICzf3BcQ6y3AEBhEp7JkxW97L
 AGv89UzxKEvTf1Q5EqkrdIhTJ0xD7c11Q4wCrxPs5rWALYJp3galz+K0NKJfSAhuor
 t9efvPmkrpo6gNWcIWKIIZSMioM5qHI05ZQ1RQ11U6WQYayG9lfy//Z4bp0WkwKnV2
 TrdrA3r9N9MImjO9Npde2hV2v7qLSk5IDmIa/KLvz1xHhOCtXoWZQ72knTGViwysxT
 +H/7ot4mBA9dA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 eC2AYb105E/PhHbGsd4x8ZYB+33DqrTg8bP6y3LW7C3cieGwerEbm6SSWEhEtMGHX4AQc8BZOVt
 F/uEwR7SCFS7lWwvFDp3t7wKk2bbLVDfxBafq/tAl0uCphANInx9HZwd802ItJDECxoHdI/XEHj
 FJgSPYV2N8V+d4mjZzzVLyx6ceR8hjeDY3aQt5JO2BDZ1V9PIumucm0J/fA4o9CbKsf7U4pS6/6
 gEkGQ9zuoINoXGXxda1gHTjFw7vJD8zTsMRmjB7cbY0qrojWSseF1Y8QQGw9kvjoy+dxbqZ82dD
 C1fP1ChAvhy9/4k5/k0COi5WZWD0o6P+Uyj0FqrOQaK4NWItnRbgJrCsgzMO0MW7k6o9Bfwx0n1
 WwIcft5fWTGXO10GajAiNp8m4k1Fwb9X3xD5kbrEIlDn54rJqkJrotGESY2T7nALafHejxS/YTm
 7SIiDZUkZ7UDEOU23sM0Cl3KEqbQz/RVyFClsG6F9rjuYz/7D5DMWYvRh0s4gz3GRsIRdR1uIOu
 zfE5oEF2IjvE+TsUSjCGhwEROddQinh8oDyYdMCnPV8x/d6hqXIidvWN/QYJ/NqBb9GJAGO61UE
 LAPWrN5u9kvVNOQeDdloI/skwRCF543TbnieJfxT4e4sQ+0AI5WkZyLr5jyJ7Iy/
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F0EAA4C5441;
 Sat,  3 Oct 2026 09:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-1MxI;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:05 +0200
Message-ID: <20261003070128.1295458-93-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 093/114] package/python-traitlets: bump version
 to 5.16.1
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-traitlets/python-traitlets.hash | 4 ++--
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 56fc569436..215eb344c9 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  f6e6529cca4cbe3299e3f07ce24d3fdc  traitlets-5.14.3.tar.gz
-sha256  9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7  traitlets-5.14.3.tar.gz
+md5  bbf948ab08b87c41b51e3aeefbf7d110  traitlets-5.16.1.tar.gz
+sha256  ed900c2b631aa3a112811139fa97b8d2c3bad5e989656bba4b7e52c7852c18c1  traitlets-5.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f51727d9063b54856773cb51388bdb79f2936ee4a1b692ef553d8c4201311ab  LICENSE
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index f0f99e3dfb..b40b23a5ff 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.14.3
+PYTHON_TRAITLETS_VERSION = 5.16.1
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/2c/2e/a7fbfe268c8a3b32546930c0297c101d65a4a14c304ad5790a9f478f0e4e
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = LICENSE
 PYTHON_TRAITLETS_SETUP_TYPE = hatch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
