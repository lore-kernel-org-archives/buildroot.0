Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC5FFD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F34607FA;
	Thu, 26 Feb 2026 20:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7l2U88yl3SA; Thu, 26 Feb 2026 20:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04BA607F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138842;
	bh=cQ5BXaqOKhl1qUzHgysHRD3Z04BOFEQBtFvuVMzA56A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=swnVgQ0PeK6K7bz7zZgzSwAVUIPI+wdVJgW2YjZC4s5B+ee31UkSAWaEfZX+8G82j
	 uA05ZDo+EvOltrLSOLMlYjR3ZCkgJnd39oI3hSTsQBo/2me/R1qh9vo61CwA4dS2iP
	 MwTsckrtuirF9ylpBx0Us0s4QwgUaAScdnoM3GeVW2M4HFq66mzXuC1lmf1xNQwyD2
	 +NugjxG2esplnVnhAhN0GEotPGCGh7NmbkyTzHa1I0QGQSb0Fm0lu5zRCQR3BepmyB
	 veA5iyVNU5R8BbZOyLuZ3WPSW7IuAO4JUYSGjBJ0/9KD9S3iqGdRMNZIB4pcG4vA1A
	 +KRKuz34peOIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04BA607F8;
	Thu, 26 Feb 2026 20:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC9C1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1AA64060F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Z7mFzr0mJMG for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94132405F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94132405F7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94132405F7
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-436356740e6so1342643f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138832; x=1772743632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FvmfyXKJoQilxcuUUejsWMonPmuDe/jDMmMVbqG99Hs=;
 b=L8KSZXp2HeTqgwQiiIUA6hFRtHp1UTxbkzeygpbMcdNuRvnV4bZzN65LD7Tg/r82Gp
 b9DZjlV+3q3r20MlZaabJV9AO7JAO6VMlgKyhVG3f/DFHB1ZVhlCHbq5OZS+HIDAAstK
 UQv9LeUznct/rgBmLZrgJhM6W2uTBwzD/u65UpFGP8qLlvgQiRx4naeo7B45r3Pg0fHS
 2OmMmY0nktjzuEEzKFH0XPw0vqLm7ZbjNhtrgc1R4kSkFriY8m/P3dnOwiPYr/n1l80E
 I8J9cdytr2CUb7bjAAEQsQqTCwnCfSZKQQWoYHh1AyBoOknufwpyuoF/BzG+VaVdv3ip
 0WTg==
X-Gm-Message-State: AOJu0YxXUzjHknVgIzUqe3+zGIHeuvBjtloKBECdDPYZnCnVk4xfiFby
 eot0sfUKL0whkDQWLDPdBoqWFZeQR6GlbxqXt3xaYH6W72l91JbQpUq/p2dYkWq1ZAZUyUhSoOO
 npL3R
X-Gm-Gg: ATEYQzw0DsluAn0HQhOqAa3tOwIbCwhIkLWwS/SJxAQ6Hv7uQ25Zn4QA3E8XY/TPY/9
 BFm4+l06bOMJJCYqq+evxU5ARfL75GFJjGTIc9pgwl6uax4S7V49YVRFKksvUDIHkTlOm7jIc/0
 dr8SNlmp+cjmxYZ4OCoUHqBgFHLYDGl1T4173KPCpw4f8VBaFXCzL/6LQQ80sUzS2ZGPVYnTCKF
 kbr8sBwoZN1AqtQ9CASJpKAsBTQUTs4XVYrRyZUmmMpse9RAgyaq/UPCauDySaJxibXTM7VruzL
 23pd1CHaLOY1w/Hcy/3YIHevgzrPv7WDmvcV10HKBPlp+KpEFyrzNOntNOjsh+S5+epW21/6Jcx
 DGvEG6ThLPSDhNwmeZCobrNQpOiMF0ZmJ6IavpC6QxI5MHO4QmghZtwRkLtMco3l55wF61k2qSn
 mC7Rk8TXkyCmccgPQ=
X-Received: by 2002:a5d:5c89:0:b0:439:94da:1a97 with SMTP id
 ffacd0b85a97d-4399de1c6b3mr372116f8f.33.1772138831610; 
 Thu, 26 Feb 2026 12:47:11 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c76b40esm1555122f8f.36.2026.02.26.12.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:11 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:10 +0100
Message-ID: <20260226204710.253996-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260222204607.292238-1-thomas.perale@mind.be>
References: <20260222204607.292238-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138832; x=1772743632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvmfyXKJoQilxcuUUejsWMonPmuDe/jDMmMVbqG99Hs=;
 b=KDkB2H7XvOnBuMphSdL6Tnof/k+DZlhJM91D3i/VM700lY2hC+iOq9qJh8JnoRgxky
 +KJ8QJz/6fodq+yPw28ML8WeEYsQ9tl3P5yiJml/+i9dtold2e7Ecs6DG7AlYoXZbnjN
 u28wL8vp5BB3hd6ck3kByti1CNu/qoIz0SWKY0WfkQHRA4mfS3az6eXfAdE7YLKfbwmF
 GiT4I2TI57e6D8F3w6nAWmj5gYQiwSkjI0OIah7bB4V7oUIC9qnwyDYwvrjuHj31N/k+
 ytRvx5CUxwVHoV36VtdyC1iUkgSYnJOZogcvGFnu5EiHR7p31ZVd+Zuoup7wCxKEkb8S
 vhyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KDkB2H7X
Subject: Re: [Buildroot] [PATCH] package/c-ares: security bump to v1.34.6
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
> For more information about the release, see:
>   - https://github.com/c-ares/c-ares/releases/tag/v1.34.6
> 
> Fixes the following vulnerability:
> 
> - CVE-2025-62408:
>     c-ares is an asynchronous resolver library. Versions 1.32.3 through
>     1.34.5  terminate a query after maximum attempts when using
>     read_answer() and process_answer(), which can cause a Denial of
>     Service. This issue is fixed in version 1.34.6.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-62408
>   - https://github.com/c-ares/c-ares/commit/714bf5675c541bd1e668a8db8e67ce012651e618
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/c-ares/c-ares.hash | 2 +-
>  package/c-ares/c-ares.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index 1c28d91e97..7bf4163e55 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346  c-ares-1.34.5.tar.gz
> +sha256  912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5  c-ares-1.34.6.tar.gz
>  
>  # Hash for license file
>  sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 090147d0e9..1653b16c28 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -C_ARES_VERSION = 1.34.5
> +C_ARES_VERSION = 1.34.6
>  C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
>  C_ARES_INSTALL_STAGING = YES
>  C_ARES_CONF_OPTS = --with-random=/dev/urandom
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
