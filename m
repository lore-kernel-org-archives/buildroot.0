Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC78C79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14CEA60C1E;
	Sat,  5 Sep 2026 08:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OUJyf3E6jPa; Sat,  5 Sep 2026 08:12:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 530EC60C1A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595956;
	b=KL2gz8x1uqfgYLdEmWVEnOmj/ekpgLqFwG1OO9rxJgkj6F2TuHwH+s4bCBzk7p7DFeP/
	 GZxflQFcAurzA10DACoT2xfkShTVmmFcBJmWE46j1GM03zEwn7p9WeH0qL4A9ORi3jmEf
	 cCekCdkUhOF1Mn+dFx1UFiApJHlwc1mJaLDwO6AY8mJ5Siszyo7UcWDeF/UMO1yRJgvoB
	 TMj3FH/aXiZN8WQgDKm8PuUrg7nTRqA8NplwA8G1BMbib/sfsoeSfmtzgfgO+f3f8EORC
	 WCe9xFRrEFFUSEDE6Lki60t2g1lJaAwkdNvL5xtAQpHBM6KXNWlFPBW5QbBLzrJIlIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=6XWtSOxlNJkuJhooukQYD5TbGHtljSqKkh5w41n1aX8=;
	b=HxV6PyO3Rc3MfPquKHpU8pwljQL+AOh2XEZgPC+mE0iHQVqFPaDhuMsH296qQ5vxTmGT
	 bvWnWGucwW78MxpZeOVOQqmoig4XjnDq9v1+juQ+o+MvyCHPFqSP3a14Hm33y1zeYTOY2
	 Y5ADbAsLFzympQNXnPk5VusUvnKReICKkn6SvwJOr0oHxLBSgjxUBdir9r+86G9MalH9k
	 JR+aOV3KolgrwsBOODgbFvS/rghLfSFlfWIurA9t5K8hPYG/bRqEschhQJvAu5NS1XDCW
	 FYUAkJ/J0S/FMOybbjfwEPLoXce5jXL/qCJztTxm1o6c5wjLLW0vCuG8jTC9+xoYv+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595956;
	bh=6XWtSOxlNJkuJhooukQYD5TbGHtljSqKkh5w41n1aX8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQk+O3gpEtlSGoucLUKuRGFdlSXWSkeNHjDKBwWUWGiGPO0Q5bswbU74HCgiH1k91
	 glBZV+TQkaI2ztA6s92wCsx7RUs7kW34HgWYmBiV7AYZiN3Oi8pRncsbEbs2DB03pL
	 H7TWsOF8b6Q6t+hskqTs+NbgEH7rysjNCvhC32hewLqZ9NBvNhVBbV/+TXT8WkoHmd
	 ssOk5U3lTYR/Yz2tBDPGNPSTxiK/7WSpDmNSRRx0R8w5/PQ4fC5wkwURTVRBWcWl0/
	 G1j5Zztu6Zgnm3YupbUd5LY/PfQXtORNEGPa9vWs/3pD1u5ldCzFJQiPzFjzykZClo
	 UNBlzpiM8qYAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530EC60C1A;
	Sat,  5 Sep 2026 08:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D4639CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 729BF8112F
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rVqg_RPsU8r for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 55B1A81175
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595950;
 b=ZgI5oorfm9cfk3g3cXmRCqa2n1NypcNj7+V0zG/P0C2ujDW8+5EboM4fFOikWwxRr0iQ
 Mx1/cXeKnBksedexjQxfQXUwYNM/Mczk/UYIFaIMZJjnwExmyNcHinWnbjjKPZ5z6ASKy
 gpn0iJ/A7/Ht9smfPKvwV6mokB0/fO41z4e5ZywNK2SuDNyEifd+vYSwvJmAIDoon0a1o
 r6KhIPGLiMLk4J4ZHdqniEC6hVOSJtRpgRY0Ge5MeD7F+4dFENFZdL+eyaQzSNMAL6PmJ
 vHSVW+cI9pnOgPb8HVt63t55Q9S2AaU8D8x1liz6TYlBF1fOJa0jxQ3+BqzXfkVHkJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595950;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=hES1zT7i7yekWEeoG7lQ2o4cQDD8pSCZxO4+Yokyz5A=;
 b=qXtM5zHPrOvdHalXtlTbHYOrLqs21KIpwTl4QC7EihALRv8yWH7sh2EakCwqvdcLjYi0
 jHy3sSoegm+iWALpdL6qYnLkHh3m2z52JlOBKfUIJ1ckkzjExr9xhZlXHlv7z6LFxT0yU
 TxiMxlYzRJLL1Y5pAqEtp3HlSV48Z9PFit2HsY263G6Lp3Zo1Cscp/Ur+blPoTXdr9/io
 t59L63zlQERMOXZY8Hd6lFpeds0rG38eitGn4Aumc8CPYyfDkalr5F9fXQ/n/VK3Jup5K
 MQP2BkoQVOPFMGtbqfJSphLLxZj4hGoCKlkXhtpi84GNkZn2lczml2ctpCitmcAC27g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PgUnFHTT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PgUnFHTT
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55B1A81175
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-495437bb891so12676425e9.1
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595948; x=1789200748; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hES1zT7i7yekWEeoG7lQ2o4cQDD8pSCZxO4+Yokyz5A=;
 b=PgUnFHTTGiaoGjE7ifQRRyQpBPQvMKRnkCk5Xr26f7D4+SAYirmktUSRsjrQqdrWZI
 6cqX8CkhQIHVHLgc4ywZ/I6T9WNqEtaWL8IgADlFVMdredELFiLASfIH9U0TM/dmXX8j
 SFNt0do1ZvqmlV8krsB8xtFAzvJyEuwHZVCkGjy+I8AYqj3YwGwOBUELeXiT3tmsu1Fa
 Z7PttVu4fIinz2uZqKxOLkcatj7ym5shIQjkjvDno6yDZrsimgBLyDvW67t2lKviqp9w
 lniyLWQCpeGjvgE18oxtrtH+RIScZlNHbj1sK36sHe+tLs3v5cyizytS0LsfsicuFNWZ
 GJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595948; x=1789200748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hES1zT7i7yekWEeoG7lQ2o4cQDD8pSCZxO4+Yokyz5A=;
 b=XmDrSXl5ZpnytAt78EtZXBDaxUMdsjM4C+KDZzIsT1D11cZziMW+WxM1Y6VA6adV9g
 1GqtaouN+Bw6nLTOTpwSTTxY4xxSgUuk/nhU0C3IKlCKtSKCf+9y+PpiXdzEn0mpzD0W
 FpTLLztpM7B8uNz4spVRZNnioWBRIqrLbqjiUWj453eDtmGItpT69O0fwxOUKTjj864u
 Iu0PVBq7h95aqcNvpwJncG1FljILTx3wSTx1LTYir39cpWouhvKwEnpt9MjUUuTJgHsf
 S7nVddWNp94xxA8JRmrdPAucs+hrX11JWfptN1CvpcndCsfqhq84nAORHN+oSAIWMHAf
 DVPA==
X-Gm-Message-State: AFuF++n6NJOGjDDrJoT+x0tsOaK372w6lzw/tGQxF0ngPA/rGRb/WyOx
 e7tEtj2nAOKljDQ6cQ4BIi1PCXpg1QgEEVLRkXEk0nmvNtTawdrAazMGQ6z/vA==
X-Gm-Gg: AYBFou10WuxlyfueQ12rgHhpGK2lj3QJH7rrK7gEH/r77V7CxqgOXnqvaLd1V3wPjL6
 4VruxAYXieL44wZrZp/clhqXjaMiWHT9sdL7KhtNgQpp4Hinsb0gb9FTgDDvZNCPp6yMI7Jp4jS
 hOuEZfDrO5mxB31xqRoZgwTRGxKpHkJpScImlwro7tU/D/8XvPY14tYJyIw71WjzT//VHx5TgfV
 fLbFh27v+8hhOR8ZdhHvagc8yoHuYhpAoJqzU+V4qL7ZLwovqxrqVaFhWhGA5dA/E6QScSvHyS8
 lMAgwraZjDzTxHv9CrDnI5/W/ddQRbshtNEo2TTjggjDpBYLQ2ck9+oUu6CC7nLA5Nh8xTI8Ep2
 03cG14JpJ/ZvHtKVBeQMGLWyvn55hiHatYqbrNwEgOJTLqd10t/TbJ32ZtagAxOpQnILMD8ehXy
 M4OLnBkH5xzn+0Ye0oh/thYvHmjkWMF6kDbD8mzPH3MICNPfjS+lrzg+Lz+TfjV1JLgr5ITVDbh
 6reeVXa/wRHS/2cv94=
X-Received: by 2002:a05:600c:5397:b0:49c:e37e:4389 with SMTP id
 5b1f17b1804b1-49cf82cba17mr97102435e9.4.1788595947720; 
 Sat, 05 Sep 2026 01:12:27 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:27 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:13 +0200
Message-ID: <20260904185921.587878-5-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/12] package/lua-std-debug: bump to version
 1.1.0
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

diff LICENSE.md: update copyright years
    -Copyright (C) 2002-2018 `std._debug` authors
    +Copyright (C) 2002-2026 `std._debug` authors

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-std-debug/lua-std-debug.hash | 6 +++---
 package/lua-std-debug/lua-std-debug.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-std-debug/lua-std-debug.hash b/package/lua-std-debug/lua-std-debug.hash
index 8e4bc69f2..c948df620 100644
--- a/package/lua-std-debug/lua-std-debug.hash
+++ b/package/lua-std-debug/lua-std-debug.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
-sha256  034abdbbe9a13899c813509776d1e04af81bc58c2982b704c8b3663549504a31  _debug-1.0.1/LICENSE.md
+# computed by luarocks/buildroot
+sha256  7f767897257e7d25b6af5b45a53acb56b34181d452f831d48634db20a091f15d  std._debug-1.1.0-1.src.rock
+sha256  6f8eceed4659fdc39ceef192458a72a05281e429b6028aed7408f26a9d6c1aa8  _debug-1.1.0/LICENSE.md
diff --git a/package/lua-std-debug/lua-std-debug.mk b/package/lua-std-debug/lua-std-debug.mk
index e044d6cb4..55ed6d20e 100644
--- a/package/lua-std-debug/lua-std-debug.mk
+++ b/package/lua-std-debug/lua-std-debug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_STD_DEBUG_VERSION_UPSTREAM = 1.0.1
+LUA_STD_DEBUG_VERSION_UPSTREAM = 1.1.0
 LUA_STD_DEBUG_VERSION = $(LUA_STD_DEBUG_VERSION_UPSTREAM)-1
 LUA_STD_DEBUG_NAME_UPSTREAM = std._debug
 LUA_STD_DEBUG_SUBDIR = _debug-$(LUA_STD_DEBUG_VERSION_UPSTREAM)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
