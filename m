Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C9FC4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA7F40B2E;
	Fri, 17 Jul 2026 15:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efee40YVCrIm; Fri, 17 Jul 2026 15:47:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D8840B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303251;
	bh=rYBcnF7jFf+DugBFkSHjt5zPlAt1h3Sjg9x1Rew0eZ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gep8qfueEbYYBAxPgyYz5RCekcbqHN7SfzidIJ/rFmQAE7dMdGlF2I3uolSRTOWyI
	 is3FJFfbDGyIjAgbHAIymbnHsMHSsE1kpbRCUbKu8En1kNdbKIdlU6HlvNeOgC3HdB
	 9nwH6xDmMdXpcYeaSQIRi0163uqSSS75uTPnC7Hc6bX16xg0JzCJ3J9qWkiOZpOKJt
	 pW40wGUurn1ZARMYB7WEURzw13eq53R3ezWiOr2Pe9DtYEtnxZXeX3QFsa9HmSz70l
	 xKKyIAAjNqJlTHqfEy6KIWz6xTt6rphEVTHOPy5Sa6hdHk+cnwDl3cKLtVxOdy/t2D
	 25IMbW5v28DIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D8840B5C;
	Fri, 17 Jul 2026 15:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C664936E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B832160AC6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwq_UEjA3rUq for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7094F60732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7094F60732
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7094F60732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso17588045e9.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303247; x=1784908047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/9RfYtYBMrcGA+aVuNM96b5tB/bPbS+i8szU2p00cSQ=;
 b=R6UCFr6/E6fa3arTovRHoZBvY41JzeF8PGO+2z/XrMAenLrHmP6SkXG5kymTpqOvRA
 qG//9x+2pQWAf7iHesLcQUa8Bq8cbCjP1IGfwcIYZNy2eoiUFTVw9cyN+Gki4t/6TTPz
 KnwOVORF0BhU9JuwI3HOCFshhICB3cvkf9NkNGeMTSzwu2mMV+YO2QIubBlFVKRX3tkp
 0J8r7+iYLOVjZu9n9d/hcElCoNZlJ+teIB26qibeWCS7hEPpB/sXThIrQ4zGq7bjRvUB
 VnIjqTQ7j3tQBqQb7g7NXgkJJOVVqdZPumicQqWDI77jyK7jZxSYDtKITw+k4r+BPO/j
 sOog==
X-Forwarded-Encrypted: i=1;
 AHgh+RpnxuVBoKmyxUVOjWZSej3B68RXhjI7lOeZcwwq6x1dpFBCgJIx76mR0Xp49EgYTstg8Pu5VBq8n+c=@buildroot.org
X-Gm-Message-State: AOJu0YzNpjs7a8IXNGgbpeFiXw+vCM8xcgtumblFa0wHC7OAtETj+nqP
 PtuZsI1G1rRTrBG8BJ8iwjvXFj0tpgBhBYVNFOjF8a18AddOVeX2nbYwBZqrBbMDq+A4WNYEl/s
 ViJKk
X-Gm-Gg: AfdE7cnttiLO7tjhjwjQy9Ho20OU+SJwgR5GYAg8wkXfpHfweA63x/cAyI2WFhffGMw
 1tR79dydh8+bNzYUfV/cRTZdqc3KSD8vIZgOBzD5vcr/W/oU0LAczwO8xDRLKj9vvvjLgI4pIdB
 yG50AftB2qUKFLTBYqLSYVDdN+fHmXVbFfpoxRECjQ/yD+rMeMGWQD5IlbWaab4dCjDuQ6n0NUo
 +1H1KJxnGRFCFX4RqX4s6keTU2G//Z6ssYf4yQr5ja0jmNJjky3hBqPKWsMXDgCqWvftXFjZwVY
 eWplNE0nFjuaKSpRQ4tODv7XftOXILKQkJ/D8UKQBcxvG2buumE2ic4IwWlAkG+wR5sfgibNm3m
 leCzGXpbVIHINc4+mttpx0jD24TeS35XC2aHWIDxW/NvlVNc8PoSL2xDrYCvFl1oM3NM5+wbFXu
 Fg9J4TSA==
X-Received: by 2002:a05:600c:b8d:b0:493:a613:56b2 with SMTP id
 5b1f17b1804b1-4954a3d0d5fmr40262485e9.8.1784303247294; 
 Fri, 17 Jul 2026 08:47:27 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549a359a6sm60375895e9.1.2026.07.17.08.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:26 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:25 +0200
Message-ID: <20260717154725.191764-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
References: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303247; x=1784908047; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/9RfYtYBMrcGA+aVuNM96b5tB/bPbS+i8szU2p00cSQ=;
 b=eEzj4+kYUxDt93FcuYUQoZHcK9myfpyrOEgfd4CsFkicAuVL0a40N40/ssAaumMV+v
 aFZ0EhbZ6XlyrjmSyZrBd8K3ZwAJvot7nCHxqfdb44d4spxKo5/A5TFWeuDQijv2G5bf
 rP+wuMoWS4jn4uAenHVEsg5QucjumQsl72cX7ooOG+17wL4SefK0VbyoYGbrLvEav7dq
 A50FyTRqQwVCW2psfHvSwhmGHKuqyxQJ+Gq5pukc0ZkVVUSvc4Pp8HAVS3lc5Ba4wp/0
 TCaRj6k1egNy6ant52URliK3ZKfimf17QnDS2VcMezQtK3RmvakykN9G9qnHBCW/z+ZH
 ZzXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eEzj4+kY
Subject: Re: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
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
> The Debian 12 Bookworm snapshot we use, 20250203, uses the new deb822
> format [0] for source list files; it carries a source list file that
> points to the current repository, not to the snapshot.
> 
> Even though we do inject an old-style source list that points to the
> snaphot repository, the packages in the current repository are more
> recent than the one in the snapshot, so when we install our packages,
> they get retrieved mostly from the current repository rather than from
> the snapshot. The image is not reproducible.
> 
> Switch to using the new deb822-style source list file.
> 
> Note: we do not need to carry the "Latest just before" trick: the
> snapshot repository will use the most recent actual snapshot before the
> requested dated, so we can just use the date of the image we use (stuck
> at midnight because we don't have better).
> 
> Since the snapshot repository can be really slow, while at the same time
> the remote http server not dropping connections, it can take a very long
> while to build the image; add a timeout so that stale connections are
> detected and re-attemped early-ish (the timeout applies to both the
> connect and the actual download, so it should be large enough to
> accomodate slowish network connections).
> 
> Fixes: c95d5b8e1eb9 (support/docker: move to current bookworm (Debian
> 12) snapshot)
> 
> [0] https://manpages.debian.org/trixie/apt/sources.list.5.en.html#DEB822-STYLE_FORMAT
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/docker/Dockerfile       | 11 +++++++----
>  support/docker/apt-sources.list |  4 ----
>  support/docker/debian.sources   | 13 +++++++++++++
>  3 files changed, 20 insertions(+), 8 deletions(-)
>  delete mode 100644 support/docker/apt-sources.list
>  create mode 100644 support/docker/debian.sources
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index e7677ac6a9..687eee8110 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -24,7 +24,7 @@ ARG TAR_VERSION="1.35"
>  ENV DEBIAN_FRONTEND=noninteractive
>  
>  # This repository can be a bit slow at times. Don't panic...
> -COPY apt-sources.list /etc/apt/sources.list
> +COPY debian.sources /etc/apt/sources.list.d/debian.sources
>  
>  # Install 32bit variant on x86_64 image.
>  RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
> @@ -32,15 +32,18 @@ RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
>  fi
>  
>  # The container has no package lists, so need to update first
> -RUN apt-get -o APT::Retries=3 update -y
> +RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
> +        update -y
>  
>  RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
> -    apt-get -o APT::Retries=3 install -y --no-install-recommends \
> +    apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
> +        install -y --no-install-recommends \
>          g++-multilib \
>          libc6:i386; \
>  fi
>  
> -RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
> +RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
> +        install -y --no-install-recommends \
>          bc \
>          build-essential \
>          bzr \
> diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
> deleted file mode 100644
> index d6fbf85270..0000000000
> --- a/support/docker/apt-sources.list
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Latest just before 20250218211000Z:
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250218T144938Z/ bookworm-security main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm-updates main
> diff --git a/support/docker/debian.sources b/support/docker/debian.sources
> new file mode 100644
> index 0000000000..36e1eeb3e7
> --- /dev/null
> +++ b/support/docker/debian.sources
> @@ -0,0 +1,13 @@
> +Types: deb
> +URIs: http://snapshot.debian.org/archive/debian/20250203T000000Z
> +Suites: bookworm bookworm-updates
> +Components: main
> +Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
> +Check-Valid-Until: no
> +
> +Types: deb
> +URIs: http://snapshot.debian.org/archive/debian-security/20250203T000000Z
> +Suites: bookworm-security
> +Components: main
> +Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
> +Check-Valid-Until: no
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
