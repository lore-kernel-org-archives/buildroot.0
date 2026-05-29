Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D720CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7096842382;
	Fri, 29 May 2026 08:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKMvaWG9pXzT; Fri, 29 May 2026 08:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98BB24238E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043449;
	bh=c3KgarL58QhvhqT41sESBH+CzAVMiAKrIHsPVmI7Bow=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MARnk+1Ccw+IgZ7EA8pUFGujVGU3cQ7Od4S5/dXao0lHqrJOTf63lw3bJG1v7eajf
	 nu3tMYh7qRc5YuEu9gHzLSUA9/q/SCcvauYmfCXmkv3H3qeBLG888ssTNf7PPF+qI0
	 EoG6HCl4bIRYOr6GWc/Z9vXLwZELGTG6gZh9X1R77uEETeFEZOeNOnJK0rvTbUfKPL
	 Dn5JHgAidKLfSSZNFib6e62QPEqmfmc8idIjUul7DfNZwESj5R9uk4P2p2S6DMOPIi
	 DUGe1mJgk6tVa5EPfxyfg/QqfOzpExPW2rgcIYDWWXstAt/kdu0/GHeDXf2x2G1p//
	 ny9OKToT+o1mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98BB24238E;
	Fri, 29 May 2026 08:30:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2108A28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D952F615BA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7DDcaCknNT8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B70FF615AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70FF615AB
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B70FF615AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49041e84237so61255765e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043434; x=1780648234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EgEwhUWo/XsY1CXopb8J4WfUq/+Cj8NXQjDNx6zF65Q=;
 b=coetobUmpCPEAh0S3a2SUAq9QpebXgabr1iqkqXZ/kg0ihK44cjj29mwlaShBROEj4
 uFzhPufcgnobsOELWYY1Oe/t4VanNnwvV7X0d6nVLWVAbM9LQv99mATUXJKMnC5XuDRq
 7J64/Imzwzriwm8iO8ZjO/G5TO/aGVl8Jaco9+WiQECTl9HiJ7p5xHiCW8YyIKSA93KF
 1CSaPleRKWsipkjCDRfuclveSdmsxpzJRs2jht9kd6zbqsvef0t/VDaOLAkpvKpEznOG
 FkK8201yzH89Xu2yeS+2k+UldGZ9Xs4Xj97Rh6h7oxCokfgpgDzzZHzjyFOgSwhtO3/x
 CMWA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/UMiM0SqZfSd/0ffe1SLz7x4PRc2wc9hqPvCwSU6AleHqN8qPBoOLHyr6gN+vFZt8QYpCY/W2yIpg=@buildroot.org
X-Gm-Message-State: AOJu0YxGuu0QdmSOqmi0ObiroZfszUdQ+7bBylpMCGoBXDXfBdUGduza
 VRBq4xCDmIG52cdcKiJ+GjVzdkTE+OpETc4usHodYbxsNj+xHqIuYrn9YX1MO+eVZ+E=
X-Gm-Gg: Acq92OEUf1PkUJ82meDMlLT7vTE4esQpUIUTy5FLacHEorCFiOCoQKaM+qKmxUay6XW
 QQnCW5iG5f/Kw67eTdHXJ1oYHS75MzZyJjAYelzcbio/LNwxRcJCFNY1+MRZ9q1RN+uNpyVM/aV
 yi7RDfdfXq4QaB3fz3mHPTw0t1NVgL9tZ7KAyUkX6J2W3XrVt4hE4l2uKNYMLWiSYeo0TuGX2Cy
 vbuj/uiAKFR0QHrU/l4i+lM+wdpXFSjqB91eqHKVsGA402kLLXh3GOsfLLW8D2SdfQ5k86UkIx8
 /Q362IyvNwPyxtGCP93FyxcRLL/HqXMI9n4oPc8uUNJnrxOMAACt1Nbaq2LkvoJkKAilhKbxBKU
 lDlnqzdo6vG96ZH4jz/XfznQTcIH2Ot0kh9qgEae2bXqoV//STFoWt3LyPTRgQ/SoUUw5D9+NIe
 CnoH70LJJoDST+t6e7w1INF+2yWvSKehu4mrPHiAlPti/wkxbzjoTUsetk4Q==
X-Received: by 2002:a05:600c:4e55:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-4909c8558abmr21710535e9.16.1780043433852; 
 Fri, 29 May 2026 01:30:33 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d5f2347sm24538435e9.0.2026.05.29.01.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:33 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:33 +0200
Message-ID: <20260529083033.59986-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519205106.1059607-1-bernd@kuhls.net>
References: <20260519205106.1059607-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043434; x=1780648234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgEwhUWo/XsY1CXopb8J4WfUq/+Cj8NXQjDNx6zF65Q=;
 b=QY2hZjAoEsUB/CkKDoshAF+BCfnd1vd3YWQ+27Vov/ykJ02tDSGFF+DIG7WMlYUgTs
 lK4mXYQny+e8m4OzQ3Bm18S+2aB78MI6oshBOIp2fQRgaHb+bzREiABPEl54SmYTyFle
 sReXzWWTMmPNcV2RCmV27uk4gfYtjMsXX0AF9gjZzEqnaXa6ZtD8EVQJ7RWF9G1eIM1M
 pe9j0rOZ8/n3Q+gvy3lomtBSQGf3n2UgzMfeWWmE3gwu94MQWbhzlqzxB0K6tpSVyvjM
 zes+adx9hs9mPqivnoiSKwV5phoorn6YYL7JUG29DYvJqkL88pnOG59Voz35BzptXBxn
 mi7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QY2hZjAo
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: security bump
 version to 1.6.42
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
> https://github.com/memcached/memcached/wiki/ReleaseNotes1642
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/memcached/memcached.hash | 6 +++---
>  package/memcached/memcached.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
> index fc6ad5eb88..f241723111 100644
> --- a/package/memcached/memcached.hash
> +++ b/package/memcached/memcached.hash
> @@ -1,6 +1,6 @@
> -# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
> -sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
> +# From http://www.memcached.org/files/memcached-1.6.42.tar.gz.sha1
> +sha1  de453f58745238c70091fe243549c406aabdc3c5  memcached-1.6.42.tar.gz
>  
>  # Locally computed
> -sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
> +sha256  50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7  memcached-1.6.42.tar.gz
>  sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index d3ec9d36d7..a164e82a51 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MEMCACHED_VERSION = 1.6.40
> +MEMCACHED_VERSION = 1.6.42
>  MEMCACHED_SITE = http://www.memcached.org/files
>  MEMCACHED_DEPENDENCIES = libevent
>  MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
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
