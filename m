Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D259EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8AB849AE;
	Fri, 13 Feb 2026 19:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmOCo0jwDOvy; Fri, 13 Feb 2026 19:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB39C84998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011622;
	bh=NRQQ+pEDyvwBV97kjl76eocFCHi5kcOGTye5Iayq3aY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O3bAfDLGNCZ0Zm6slMnlt+XSa+J/CXxiiTX9GzRSSaHaGP2A0NUH8QlqeB7EEbTm5
	 Wl7QD3wCE0lLmD+51b63P4YgbakuwmOV0gEJupd1kgCVxPkqsguySSpaa5M1qvcfU8
	 0JT88J8RIqlZX/pgQVeXfAHfypV7IErmC8jrPFropTYQcrs47WUGPHWEwrw7a9+Omk
	 N3MpwwJb+zhT7HDVvoZPq2FBLWxqnqvJSqCCf5/q9hrrqupGjHMqw+zNqShGrfTfQm
	 N8jdIQcWAoJamVEoni6UZ+DxaY/7NKGUWpg8ewvKRNl8JtTPWNPMvRcVKCfvcVUKOR
	 eROUEQGvF0Zlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB39C84998;
	Fri, 13 Feb 2026 19:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6313CEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E05A412CF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMnTc2rd1iGu for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6806C40407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6806C40407
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6806C40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so14408115e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011465; x=1771616265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ojOKMOD7GdJz0eI5hnBJfSqa0myQn7trfBcbjdXij5A=;
 b=lS8NBTY+lAjLNDA7dbxXZpog/Jr2N+6QmRp6shiNPaDKob+RX97o7vIhkxbV4ZajmQ
 MHoDQMXr5cZxAQNMuwTkB69kk9UZUu5IUI4SX4P5HTIkKrd5/iIF/TKYYburFg0lPwTp
 NB8CFBnl0jVeEqlObJBK4O4Vwlay8e3mHOc/KnNrDE5wtDaWTq45UVDMyrdWLzo8y2Eq
 Iy6CwM5FRzDbPfPK2Z3DiKD5DL/Nq7E4D4kFxSuyuVrNrt5kXLWIhZ3DPtvZwZipHKso
 8KcUIQAjs39oLUaBsI1VEOt6p7g1hhYjnXngyZ/X8JVj7BeEtnKPjaAWYbcNCvRR1izr
 qC/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSLv6/G0J9OhLYfvzNvb2izyAgA5J+Hgv1a59cD9NnK7Gu6Eq7JHEB609gvpaWJpZ07bHe7xL9aC8=@buildroot.org
X-Gm-Message-State: AOJu0YxN7NTwIAwUbzZVMwkisscerkiIKRtZDky7CxkE7hk9eve9JaDE
 Z1Zjbstq00VH/XoLtv9Jk5lTYOEc0WRILczwS9wDgPXF3OkbekjEIMZHlb3R1Q/FCpM=
X-Gm-Gg: AZuq6aKPm5jSS7LDSMPRJlO0+clh6wOh8NuRIt8D7cg3RekHjiDM4mF15ujeDse59QN
 nEZJEWUmzilkgS53iVBgRkGLOVEFJrySaX1p5T7H4EX9TvVzCoDg7Gq1W9dD+AHG5qbeAt7o49B
 d/T4SVpu7lmDmjkiB7BLT1O41WRAaimzIZTSUOsZ7Xi8mJXgyLsPUIjZLiLRzKKvgedly6qX0+b
 2JYz31oxsn20w4m0PlCzGVMI5e9OTpOOHPC3wdj4AWdopugtPs+bhGRJo4m4gNXV/LQ1YgAV8kM
 mg3H0RDdBjwRvC3GWCzAT2oTAcpo7EcTfiCyrcDFlvIN20kPAFD2ll/4XIOQwaLvskRhckK35Ob
 A53eyBjDFgNXidIcrnw+2PolXJMKwO1GBsVTRSjlDDbnYoBtBeOBL1VgN7SFogreAEbA5OHjfar
 3I0GLcBJoRsrAPkdo=
X-Received: by 2002:a05:600c:8b2f:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-483739ff865mr43143095e9.4.1771011465333; 
 Fri, 13 Feb 2026 11:37:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a02a79sm54608585e9.3.2026.02.13.11.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:45 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:44 +0100
Message-ID: <20260213193744.40515-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118114734.955796-1-bernd@kuhls.net>
References: <20260118114734.955796-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011465; x=1771616265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojOKMOD7GdJz0eI5hnBJfSqa0myQn7trfBcbjdXij5A=;
 b=HfnCwE5oXBbWkCb6BQ56H2qx20HtCU3V8YrTQHT5biIYvXOy1McBpUkEYNUj24YiFc
 kXXsdCeEr1B7rsir+Iq7pMmEZYW3A/jaLLtWIHMHKxoXeb+gs8s/z16RrMqWpKDS2A3K
 7n0CDKIig+ikfFW7JOlilz9WZJUI7oO8J7ao0tt4NNqUibEmxA3rY1Ntq0NKWwo2LIYM
 QKaVpLKKT3Fp0h2zo1G4tGKNmEW+WM1X6TLbql4t7dyDTqlknvnlN2kcwJ1/wy3AuGeR
 5SVaELzEXxv14ehF1GbeLu3hpIkh0rHwHvVIgzRRRng/hqYIgJq+6FxFQzqNWXjJofeK
 Lwhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HfnCwE5o
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: set socket-dir to /run
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
> Buildroot commit 4769724ee2bebd671f6a9372fb8922a8c22c5079 bumped the
> package from 4.9.1 to 5.0.0 which includes a major rewrite of the
> configure script
> https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.4.9.1
> https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.5.0.0
> 
> Upstream commit
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=78a961188f7da528c7cefcc63e07f35f04e69a93
> added an option to configure the socket directory which defaults to
> $HOME/.screen causing problems with read-only rootfs:
> 
>  # screen
>  Cannot access /root/.screen: No such file or directory
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/issues/123
> 
> Updated project URL to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/screen/Config.in | 2 +-
>  package/screen/screen.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/screen/Config.in b/package/screen/Config.in
> index 81a9bbe4c3..453950bff2 100644
> --- a/package/screen/Config.in
> +++ b/package/screen/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_SCREEN
>  	  ISO 2022 standards (e.g., insert/delete line and support for
>  	  multiple character sets).
>  
> -	  http://www.gnu.org/software/screen/
> +	  https://www.gnu.org/software/screen/
>  
>  comment "screen needs a toolchain w/ wchar, gcc >= 8"
>  	depends on BR2_USE_MMU
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 74453faff8..c7411ab6ca 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -13,7 +13,7 @@ SCREEN_SELINUX_MODULES = screen
>  SCREEN_DEPENDENCIES = ncurses
>  SCREEN_AUTORECONF = YES
>  SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
> -SCREEN_CONF_OPTS = --enable-colors256
> +SCREEN_CONF_OPTS = --enable-colors256 --enable-socket-dir=/run
>  SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  
>  ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
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
