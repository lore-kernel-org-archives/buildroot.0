Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD127CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674B161C88;
	Thu, 21 Aug 2025 19:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yC6YzrTQfws; Thu, 21 Aug 2025 19:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37EFA61C70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37EFA61C70;
	Thu, 21 Aug 2025 19:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 289031C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A307846D1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy_EYf9vCrDi for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16DD18472E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16DD18472E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16DD18472E
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b05ac1eso8297825e9.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804067; x=1756408867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSw9shTkO10ZZZ3blV8XR7MSK/LIVwcuEEC28UeQR5E=;
 b=iZZYmcjQy01WVPBeeSzCApMNjwUlwYadvRJm1YvZktBo5pZmDV3IgqNn+htYapT1xf
 6S0G/A7beTlRlPlRUo1wYe6cIbU5BZ61rglZe/1tmilVWGiIP2ZuGJCIJYBBNiWUzefn
 rKzvuoiciHxgGKW6yTjBLsdr9BF/l+1z4vBuhnqODvdtlLn2qR+LxSFpVikHGLZruXG8
 2O/8n4HgQxLqWEbaQ0Qfq2xKAn2MpclQTH+RDv3PoaQxul9JDQY8t767i6FUFDHTsHqr
 yxCs9A4Uv6W9fMmIRXbtsSy5+WVpky/zJHD25xDC3NHD+tJkjVVHqY7zcBWUEyp/iDb4
 GBcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPwoEU2Wtc/kzSokREWTm9aKhES15bLP+3v77GSLDgQ0iDQ8CspqO2ceUvEBpIgx164kup/bn0J8w=@buildroot.org
X-Gm-Message-State: AOJu0YxAuDzwrXGuzpAwD32lywlilvrKbFhbT85SlOhwhyCeWv3yaq5m
 rj8/JvsqDBIqKjnD7WgUKnZybOxLa3p8d/H1TszWMlrxrRgKHNA368p/9+qp2Zsq6YLg78F1UmQ
 AL9Q7980=
X-Gm-Gg: ASbGncuJrzukubUlle3YXtUsbT6oJshFfgcMPVsv0tTX2/QVboivloGvgQ5B+HkQf0R
 CR0dqfq6GOV87qY4vtExx3DPs4UXfbFGlKwZPY9dbYz0yc971j81oyioDdmPUMAN/rGp4/qPQ73
 emadTPw19PIXVAXNfIn5xe5e2SLZdTrj5SpkOvBd1ymtDyXWP4Y0vdEUECu42z73JkXXR3Bk0Ga
 SIpSSLTCZ8omJzsDYxWzfHcmIymZ+lkg6ORreJzC2o8FWDE9qknOd4lEnsX/78yIiynI4UMEP0x
 lQDlhKA8OPkyCJLk+H5SNHIanjOqjLf9S/rr2YssCcZBh9ExxsJ+czJQ++3XlG8p3feCGBrKhjQ
 8bdHAgMYK5rAdMQ==
X-Google-Smtp-Source: AGHT+IGRJW3oawj0nOf6bVulrZraDBmwi6YnDAoY5e1ccvg/83KhUa4PCTGK8lEvbOhmRwjZRJQhqw==
X-Received: by 2002:a05:600c:5250:b0:43d:563:6fef with SMTP id
 5b1f17b1804b1-45b517cca3emr1821905e9.21.1755804067000; 
 Thu, 21 Aug 2025 12:21:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c3a8980ed5sm7127184f8f.16.2025.08.21.12.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:06 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:06 +0200
Message-ID: <20250821192106.24166-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201355.6232-1-fl@n621.de>
References: <20250813201355.6232-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804067; x=1756408867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSw9shTkO10ZZZ3blV8XR7MSK/LIVwcuEEC28UeQR5E=;
 b=K2Z0uWi+q2MR3JQLfttByAqgdczP+U1HKWX+vwVIIy1j9AzEeHkrERgYG1IvvK1yGc
 5SXvBFA+QRsBEvDemau/7oVDvJDSPQEGsbmiG7xZnuvV+sd3TFK8BmpwEyZaq/AI1fxg
 PCqgeT4zMkGiNtBK+RoF66TI1wtYeGece5WDUgQqDbiA95qa5C/bVBn94sqwYih9ZeBN
 hZs7ACgn1zNTQzxr6QsmNZSIcl759pVQAR59JWHH7E1aIBgUs7QP11+D0sYXNhQvTrmO
 zeY7YdW0eQeq882ZUO3PrJXUq23yG6+PCSlzb/OUrQGQFE5gTkZTRTEhIBWaJFszYnJK
 OJqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K2Z0uWi+
Subject: Re: [Buildroot] [PATCH 1/1] package/start-stop-daemon: fix build
 issues with musl and GCC 14
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
> Unlike glibc and uClibc, musl doesn't play tricks with transparent
> unions for the second argument to bind() to accept the various sockaddr
> variants, but rather just defines it as "struct sockaddr*". As GCC 14 no
> longer allows arbitrary implicit pointer casts, this results in a build
> error. Import the upstream patch that adds the cast.
> 
> Fixes: https://autobuild.buildroot.org/results/00b/00b42a35a80c2deb61f2cd40aedd231597bbb290
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...t-sockaddr_un-to-struct-sockaddr-on-.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
> 
> diff --git a/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch b/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
> new file mode 100644
> index 0000000000..c093b49e2e
> --- /dev/null
> +++ b/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
> @@ -0,0 +1,31 @@
> +From 209ffbbf7c8fcf49d9296c969feb7a41aece6525 Mon Sep 17 00:00:00 2001
> +From: Guillem Jover <guillem@debian.org>
> +Date: Tue, 6 Dec 2022 18:37:08 +0100
> +Subject: [PATCH] s-s-d: Cast struct sockaddr_un to struct sockaddr on bind()
> + call
> +
> +Changelog: internal
> +Warned-by: gcc -Wincompatible-pointer-types on musl-libc
> +
> +Upstream: https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=209ffbbf7c8fcf49d9296c969feb7a41aece6525
> +Signed-off-by: Florian Larysch <fl@n621.de>
> +---
> + utils/start-stop-daemon.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/utils/start-stop-daemon.c b/utils/start-stop-daemon.c
> +index 6863151c1..a15c0493f 100644
> +--- a/utils/start-stop-daemon.c
> ++++ b/utils/start-stop-daemon.c
> +@@ -632,7 +632,7 @@ create_notify_socket(void)
> + 	su.sun_family = AF_UNIX;
> + 	strncpy(su.sun_path, sockname, sizeof(su.sun_path) - 1);
> + 
> +-	rc = bind(fd, &su, sizeof(su));
> ++	rc = bind(fd, (struct sockaddr *)&su, sizeof(su));
> + 	if (rc < 0)
> + 		fatale("cannot bind to notification socket");
> + 
> +-- 
> +2.50.1
> +
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
