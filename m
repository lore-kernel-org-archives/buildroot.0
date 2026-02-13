Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794EFEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4596B614A3;
	Fri, 13 Feb 2026 19:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub40rl6u5QTn; Fri, 13 Feb 2026 19:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB59D61478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011693;
	bh=rtfA4WoNV33WGR6uU+Qs/+bTkhVPUvP78wonOIVC/NA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kME/UlWT9yyxTxsCHZ1njBEmIEgm3vJNMR6Im6SYse3paZ/Qd9FA1AN+32cBH3TQQ
	 U+iIySYaFYeBxs2X7pjtMiHj7fAsFlOu5PyqKPHZYCCq5rxqErSSJXw2rodMWu/vKg
	 CCwhDXDouHA0Ps01Fjp8Ky8OUvjeTSyFU7nXIZjUuP4ikGMiei3TgeiLgeyPvQdGXE
	 HzKP/416NWgvGbAQTsXcri5aC/jHq149osazQGxqOAzEyzD3JJZ1Xp4YrKKSkJeQYN
	 CeK7No4WkF2mSl6ZSiTD7ik38b9H4xWCGEa2s4JkIeCglAF/ZlumC1cVcKdaN2cu3X
	 cd6wHGyiBlNgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB59D61478;
	Fri, 13 Feb 2026 19:41:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 197F769
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C2E4026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hAeU44zKyme for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B693F40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B693F40055
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B693F40055
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso10334945e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011681; x=1771616481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NsIcx8/U5uvNVNS3fQWR9nwEuBhv9v8SVMb2d7t7eDY=;
 b=NC4/2AQ53ZEzSaA5hJ/jXzxD3ycIsqYLoJk+oGZns7m2xQzUmdBhm8an2rvqNLiuJJ
 DViM+K5l3jEz8V53zBzOo7tpr7sZmKLJqUqIW6XAswttQUZQFyLgkkS+HY0r1RDo1BDt
 h+8hroi883frlh/MR2av6WFGdAdGG6BqhBR7p8LXwPQUoFUrALhdgG5o+0pCWExazC0+
 Pallyfgye294fxOa8s74kUsjnCvoWYPkwmJJGhC+VCb0d7Q6V7vE9rletjdpS6G1aDAi
 lBqGK5Xjsg/GhesCKA4dwItyc7dvu1fSmECJJs6RYAi9tWoX45UZLL5hFfgmhV4i8W7+
 upCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAbjfTDNtfJyejA5Bd9GqaMlUxMp3TOg9wXUOAgjm7vnLz42KxO93Tj4rVWsv63vCsJVXjLSpu7q8=@buildroot.org
X-Gm-Message-State: AOJu0YwNX0oYF6Uvlqw7q/zam7HvCqA3jwqgJ+PiLxb1f8fwxzUjksuc
 IVQwxSOwA9e+HDRyzrLDS50NK49hT2h3c5EEUglen+gMqUBSjWuws49OO+gG8glO0ye/sGfV5S6
 YOo+v
X-Gm-Gg: AZuq6aJy2d1Hnbhl6Yfxw2bCy4NV9AZ1fWNO9uRvFHVrMOIpLFcNbRP/gVglQRTMG+a
 09cHEG22FLuQ4mh+SGhzreBZPHWWsI3qYGShzQ+gzvb0rgLwBD5aJfaYjGec/yP/L2ABMO+OXOx
 89e8Mj0pqD7Z/Xb8uh4VKlnrYRDRd08JvykcKn33AgqCQntXBBMf5b+1XVVwpDqDlXVHc644A3P
 uXXHAIaM+iS34Jk6ToQUeszC7gp/hnc6zGRkWMiRMn9TXTW2YCpB583bYPYEzer23hTRHvL2iGa
 AvkWg2gvrpUyma8+hLiLiMzz9ZXSNs3NQZi6rHhd+UKbYlRN7DWVHi3GzGtxnMfTlNkR9SEa0Fe
 +qo8G4k51QTXCsMngexEseF/uxzINHgN0RM7hZUsz+e+HMfjn5+LZmQysRpV3XwCBBC1nl7wQEP
 LzajEHOQAMnPaWYvQ=
X-Received: by 2002:a05:600c:1907:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-48373a7a0eamr50003585e9.36.1771011680743; 
 Fri, 13 Feb 2026 11:41:20 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm312686675e9.6.2026.02.13.11.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:20 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:19 +0100
Message-ID: <20260213194120.49344-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260207170754.4022536-1-peter@korsgaard.com>
References: <20260207170754.4022536-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011681; x=1771616481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NsIcx8/U5uvNVNS3fQWR9nwEuBhv9v8SVMb2d7t7eDY=;
 b=TtPkRqrnstRwg4IbjINrdIpMWQ1GzHBrkKHQW/UTqPIuoS9z+1U79A4Twx12RghmrL
 g9wnrWdoAu1wBW0GQsSjlfdFpGLszKVV1jkz9vthDBMn072E+Ad0V06SOavUT429Hr/o
 4pwsghWWTHp5aJX64so52nTVbNGCu2Fu1gTFi8LdBVS1DlaK45ZyykELtqHg+KISeiD4
 9zYcZv6n8HWjx9tcIKC5jcG3hv1hef8iKtAShwvTu/jeKQkU6ssHn93dBmLN/ScxXd/S
 sVNVXzM3pKdbn4Gd99PhJ9KiP4HJgfxijQDL/mjgoVoqw4Ll1Ynlk/tqrqT/TDARLPCp
 2zdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TtPkRqrn
Subject: Re: [Buildroot] [PATCH] package/swig: swig-wrapper.in: handle
 symlinks
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
> Fixes https://autobuild.buildroot.net/results/e656684298b0462f8044667e7384c64d6508f22f/
> 
> Use realpath when constructing the path to the real swig so the wrapper
> works even if it is called through a symlink (E.G. the swig<version>
> symlinks).
> 
> Reported-by: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/swig/swig-wrapper.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
> index 61c885fc90..e6cf2df134 100644
> --- a/package/swig/swig-wrapper.in
> +++ b/package/swig/swig-wrapper.in
> @@ -5,4 +5,4 @@ if [ -z "${SWIG_LIB}" ]; then
>      export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
>  fi
>  
> -exec "${0}.br_real" "$@"
> +exec "$(realpath "${0}").br_real" "$@"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
