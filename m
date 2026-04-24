Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928CFFED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6787784DEB;
	Fri, 24 Apr 2026 16:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91JDZLXdKMXb; Fri, 24 Apr 2026 16:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C64C84E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048025;
	bh=U+5PGb+fpzWWXLFj9CYvfsaN/GlNTLsEGHdlbID0Q04=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EPtYTBGvDdfWXY25p43hZxk3CH9S9Rv5TRLXJP/u3Bu1TSXcdEf10Y55iragGSl7J
	 WEmXMtHltizFDV3H/WpeCJ7WZIe/sArV0mwAbqGSXBUk5MH8/wJn633yvYMTz5o8Y5
	 uIrKcIKszjuBhWAO2UeW2i3SB6oPbVyCm5ETDZpZRo33pYP73mRTHjqZMfyelrsmjP
	 V9drifv3ntOhmZd6xAKmzXMaK3E3KbVG2PpBO6DEsLenMqseYuf8D1ZHNHd1t2JIBV
	 1ckkKc7W5wbdH17wn4NDmSja4XCuOYmj5Bz+5T3PQujHUq0mwyNtPGRWIWnYCM78qQ
	 pCIuKMEgAqNVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C64C84E18;
	Fri, 24 Apr 2026 16:27:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CE3C194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2E094295A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKs_1UH2lu6R for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD0AB4295E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD0AB4295E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD0AB4295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so5545666f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048021; x=1777652821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bBUnITh4kYb78dviRSk+4eVLTv0Z5BQ4GTIzEMHNvRs=;
 b=qCP46NHIf/gM8BkjXN8JZxouRwQK11pIv5/k3sKTGVQ5mh+L3kY/ZlzS0sZrjXOHjO
 Q028/hjFzUhdm2OLcqAva4JXGAI8ns/DoBn2k+HJ10FE9qecSmsovG58DM6APituAfSz
 lodn5EqDOVI+0ehQhze55w8jBfqjUGpmwI1KaEjE2tkPWhMm8XZWS7vL+5rKci8EQuDh
 pNTev91tPQlcQgxZmf+E1JwaeObsxiL4k/odahrTsJn+wKkwOrwcprJu+VEdYyOPWJ5y
 2HOwTH4uaTTHjvIJY870rW9aGQZYwIVKc8zbIIGyDfqCVg8psi6oHEDgHwsmBBKTM6Dh
 pCfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8cMv9BoJUR4Z4Z9ySTbNwGfMCeW0NQPJ4lPQeBR5DWNyLf93JDHLEEKfmXF+CHu8eb+hOYOtThYcQ=@buildroot.org
X-Gm-Message-State: AOJu0YyynuI9d37curGNE07F0GkBX2VHRDYUBD+w5mz76sP8Gr9jODId
 t3HAKGwZGh2bY/5YvJgW1h2DYmTyLUQ8QDbPfbLxhO0UBYqLBTvfeTXhVNnrEimIrIWuL8Gz2mY
 7zvQI
X-Gm-Gg: AeBDiesFP07pt1QWhj+0AqJjnHAtQ22svUxSj8x3QHtoHVZJ261b0cyaU6jZNMjogHd
 jGRgPFzpFsE9NQd+tz+wNWRhqKtXiXioclr/Pd0Kuayvy/W9gW8kLcawSlp1zbDOndm4kdqP7wz
 0/7Bw4mNU0AZ+n2Iey9kYDG17W6xBhkY9l7JcwK1ee9Zy1/QLs1f4KASD6rtb/+VAi/8FZ758TD
 YMGR2NRdd3SAYjouXPmqebHmZVmWoASdRYWPlXXzWtGCeHivgn/mqQ8lKCdpr2qawgOC1nLrD0W
 2A9SB6N9hCAOaubY0Ve3ki/f41WOGXppjfxIaJBwBcbaWoNyrT0NxAi5aPm5RpY5aoaY0kLwMhj
 XIsr3PYzsdS6eCoe/FQbDiCilsaaVU65+3+jl7FlmXVrbORr58DdCisRi3uN8oy6PpvXz3/BPsp
 qZ0i1ntCv8hYebqmEFyHdrlnt1lmYN0nNwZ24S
X-Received: by 2002:a05:6000:410f:b0:43f:e978:148f with SMTP id
 ffacd0b85a97d-43fe97814abmr28015358f8f.25.1777048020879; 
 Fri, 24 Apr 2026 09:27:00 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm62910841f8f.35.2026.04.24.09.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:00 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:00 +0200
Message-ID: <20260424162700.161325-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414132055.3263118-1-buildroot@bubu1.eu>
References: <20260414132055.3263118-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048021; x=1777652821; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBUnITh4kYb78dviRSk+4eVLTv0Z5BQ4GTIzEMHNvRs=;
 b=ShJxhnmOnbt/kOjUyWva4BF2sTNVVypHVusjhYpi7xNF/uTe+MfJLJdRpNqd/nUJi7
 F+hAOwB2ARnwFyJwTzRwEFECh3I2M5e5trFOvoFbdTd9409RR5+oOFlM/tDmK+AwLobW
 ZNmM0XmPUljywHkIUe1PA5aAfeoenY7jyJUNrPQk43Zuc/Ck9gjRF+Lsg1FPk5DgE4Wy
 wnKT/CuFGTalX9vNzbTA7049izfoan+VhBpridGwAxNYI2DbHQjckbGAC92sm+eIehtd
 BrTIOzQK3HZ2d8fHUqqqxSoqMSTPdQh+b34zratCZeY7MGufT/av4NNqhcABzOvJ5mVr
 hBeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ShJxhnmO
Subject: Re: [Buildroot] [PATCH 1/2] package/bat: remove no longer needed
 patch for gcc15 compat
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The bat 0.26.0 already depends on a newer version of the onig_sys crate,
> so the problem that patch is fixing was no already no longer present.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2026.02.x. Thanks

> ---
>  ...ig-by-regex-fancy-in-minimal-applica.patch | 47 -------------------
>  1 file changed, 47 deletions(-)
>  delete mode 100644 package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
> 
> diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
> deleted file mode 100644
> index de6a3fc70c..0000000000
> --- a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 9b6727df25e45222b3863dbe5f5bc58237b68ab9 Mon Sep 17 00:00:00 2001
> -From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> -Date: Tue, 2 Sep 2025 14:02:11 +0200
> -Subject: [PATCH] Replace regex-onig by regex-fancy in minimal-application
> -
> -The default "application" feature enables "minimal-application", which
> -in turn pulls in the "regex-onig" feature of syntect. This brings in the
> -onig crate (version 6.4.0) and its dependency onig_sys, which fail to
> -build with GCC 15 due to C23 keyword conflicts.
> -
> -It is not possible to simply update the onig crate from bat itself,
> -since its version is pinned indirectly by syntect. To avoid this
> -dependency and fix the build, replace "regex-onig" with "regex-fancy" in
> -"minimal-application". This makes bat use the pure-Rust fancy-regex
> -engine instead of Oniguruma, removing the need for onig_sys and allowing
> -the package to build with GCC 15.
> -
> -There is an an ongoing discussion about removing Oniguruma from bat
> -since Oniguruma has been declared archived:
> -
> -see https://github.com/sharkdp/bat/issues/3285
> -
> -The Upstream project for now is refusing to use fancy-regex as default.
> -
> -Upstream: not submitted
> -
> -Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ----
> - Cargo.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Cargo.toml b/Cargo.toml
> -index 80d19321..93a07a1d 100644
> ---- a/Cargo.toml
> -+++ b/Cargo.toml
> -@@ -29,7 +29,7 @@ minimal-application = [
> -     "clap",
> -     "etcetera",
> -     "paging",
> --    "regex-onig",
> -+    "regex-fancy",
> -     "wild",
> - ]
> - git = ["git2"] # Support indicating git modifications
> --- 
> -2.43.0
> -
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
