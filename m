Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3FCC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A034F405D3;
	Thu,  7 Aug 2025 18:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O27O-UiOFt9y; Thu,  7 Aug 2025 18:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADFC4063E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADFC4063E;
	Thu,  7 Aug 2025 18:25:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EBD110A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E90F3400E3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cI5YIWUWb9DK for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A42D400E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A42D400E9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A42D400E9
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459e7ea3ebeso5745725e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591108; x=1755195908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8eAlndIydMp5FmBhXwcP4FTZb+1D9dllvjYI0U7DS0=;
 b=LaNQ+8DmGNrXBS9d66MsimJvQ3ReNaM/1f0ZKyYrKzNSBQHhZdfJ0ldNAaB7z+oYqO
 Yp6DOei1n6A5ZsI09l2TwWmt7eKQC8Lkw3lpPcq6A3zfGhgpTD8abzak9UfySBE4zKVb
 vo1IHW7RHP5m2qJc0K9DeCzE38FqGWMTQaErypaCMq1g8aMMqykNrm4/aGTfEL2hq+ki
 nbkl0YkXLJSwdJ/ne088N+C9GyvxRHjh/zCnZlgoHMPcZz0QjtzANyZXCKtEDJMMtQUh
 FJM7xT9PecnWsWwNxDe10Xbvqjlg5/nbY7BA8b1GQiW1Mlgz0eclpYVQ3+aaaa0EsXky
 C8QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlitT4LaG6VyGH6MM4vBS46L3aXzkWJkOsEZsRdcPUpxPAmTZ1VE6+IzI/PxbZMilJ8cw1GXt5jrI=@buildroot.org
X-Gm-Message-State: AOJu0YziE6QFMoiQf9ZBVH+49pAke0ccKUi8CA2NMzV833hV1NjVg0g7
 SEFA2Scv6VEd91APdFe2HUajSSouJILaLdYGv/gqzbz9T5PwDxnJlxwh6qNHMfZv5Jg=
X-Gm-Gg: ASbGncs9DXruwkEq5vubCMfWPZWlOdgu9K3ZvNzZNUfDmPDjLJPSzNHlyyAKq0OYILN
 Wm9YpUW/5zx3tzfFN7R7O7Fh792SmrvhHudfZfiM4ZCZNzuJc4P4YaEgglD0OuC859qmOl3DaDL
 7xe3zZxHZNY7O18Vv4FDk8nITXtx0Guw80F+cCeY+YCEJwkF0RLmuC9tEZV5uGlzPHhMqZqKqDy
 wy6LZJkm4m2gvKHmR31v9LIYtNPxOhXEsga+NptBla11Lr2ZT/fQGb2NuCyxrBC/mH8eN9+0hhd
 +E0TMOOyfn5USSSX6a+gJ6sVVB1COiVs1q+kUtOni7JDcRceYc0krgnwsNwnCGoVSAD8M/YjgU3
 u6u9ucFvChRj3eg==
X-Google-Smtp-Source: AGHT+IEC1zSoaLq4JaOSpJESNzGmuaNxdccv5Sy1blpc5me1qRUM7MetbYcFqfIMWxtgLC/vS8RC9g==
X-Received: by 2002:a05:600c:5494:b0:459:d6a6:77c with SMTP id
 5b1f17b1804b1-459e7136b2dmr63049615e9.33.1754591108153; 
 Thu, 07 Aug 2025 11:25:08 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c475067sm27382390f8f.58.2025.08.07.11.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:07 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:07 +0200
Message-ID: <20250807182507.726715-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <bbfc150698b24344d1fd604015a74666d8c7e955.1752524763.git.yann.morin.1998@free.fr>
References: <bbfc150698b24344d1fd604015a74666d8c7e955.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591108; x=1755195908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8eAlndIydMp5FmBhXwcP4FTZb+1D9dllvjYI0U7DS0=;
 b=fQCSFKTYL0pdNS263tIH5vYx5ur8D4MAoDq9r0dCWqmizgaWSPa9YfbKMylREunS2w
 6LE/Hc/KrzAYmnCi+6anZHOY2g73s8rIXCjXjgiJb3MnKA+ukTU8DvO2asXYnfMmlSeV
 sEHfRNqPozIrSOko14HUkiD4hJ9ohAUM5AdmTKTGKGHH7HVJy2UuHtbaCTMsQuOP21P/
 xnD45xYYJQVkawFwl9GV20tLtTS1wsEv2cyXpeW9gIc2fOA0DiRCg1tVMtWhmFZm6Gds
 rXLRPF/dEReFFSnTnDRocOWstpvGwvYZIzC/JW4pLx0ezs/L3KXLyUTtOAvBk/LxH2ts
 CckQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fQCSFKTY
Subject: Re: [Buildroot] [PATCH 11/13] package/podman: bump to version 5.5.2
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
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to 2025.05.x. Thanks

> ---
>  package/podman/podman.hash | 2 +-
>  package/podman/podman.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/podman/podman.hash b/package/podman/podman.hash
> index 734042df95..b5802dd305 100644
> --- a/package/podman/podman.hash
> +++ b/package/podman/podman.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  6c31845cbbc54a0b65c4afba224048c002b40e863c4ba7ca19355a8d333b3d19  podman-v5.4.1-git4-go2.tar.gz
> +sha256  a2cd66e33e1cabe34d11543c3fa68f9ebe7fcadbde578231d28745aa0f48a21d  podman-v5.5.2-git4-go2.tar.gz
>  sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> index 27d9a84712..fc9a989bf0 100644
> --- a/package/podman/podman.mk
> +++ b/package/podman/podman.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PODMAN_VERSION = v5.4.1
> +PODMAN_VERSION = v5.5.2
>  PODMAN_SITE = https://github.com/containers/podman
>  PODMAN_SITE_METHOD = git
>  
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
