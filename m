Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECF6C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C871C600B6;
	Sun, 14 Jul 2024 13:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEDjCLn3MFUX; Sun, 14 Jul 2024 13:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E0C60606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E0C60606;
	Sun, 14 Jul 2024 13:13:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCD391BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5D6960606
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhG-BbkVE28j for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CEDB600B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEDB600B6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CEDB600B6
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:13:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so21692005e9.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 06:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720962806; x=1721567606;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hXnLZsH3Wo306fYkK7iSvPfmY0fKPCNCV8OtQZ+moGg=;
 b=Aubbv8oZHJXey0PPNQJQg6RWOA5byceyoHoUDbhQrTqhgc8pkfVCtBFgh5INi8d2QY
 11Pas14Wl2p2TQ7o2EYLCUNw/K0WCrkMYfbrAtX1o8bss6Y9H/Ti1dH8CK4t4eXV6BNc
 c4cHo7K4AjmZJ4br5yRWzBgsQS7foReBdrMM87O6e9EahZNp94s7JaFtcx/pvz2m2z0Q
 kiSm3Q3Mlo03iZNqsPT+t1AYAOXWHujHuY2uuAd6LaOH8ZjY8F+++tMaI6GJ436KGbei
 l8G77nglLkd56lRJF7UxAinPol08x7Re6kp+eg3035HbJ7MBfTZwoNOMVGoAq14tWZaz
 bBeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA4FsKX2kgOOl5HfjstcvcwwVy9LXbkcsTJG0T2wrazcAHrvEgn0gylVLR7MSkDMFFW/XqAbzMYl4O2SSJbfaOmTt179GdpA==
X-Gm-Message-State: AOJu0YzP1dWZIji8mODeRY2Drv9881cMKhhkOUigbaPGmjDKH6UYIj2w
 yEl4lWMSjo0Z23mCu/5FcCOUV4YsWoBDnUnC3YNDGfPebUjOlkRmYxW06f2C+I92bUGoJVih4um
 aObs=
X-Google-Smtp-Source: AGHT+IHlziSVmAwAznhXpMYGcycIuzCfvzBixdoN475qDEDPwc2Q8zQX/jGhYPE5n2gTV4hFSmByYw==
X-Received: by 2002:a7b:ce8b:0:b0:426:5216:3247 with SMTP id
 5b1f17b1804b1-426707cc9femr103899045e9.6.1720962805597; 
 Sun, 14 Jul 2024 06:13:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77a55sm51467655e9.10.2024.07.14.06.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 06:13:25 -0700 (PDT)
Message-ID: <19631b3f-55ee-4075-8571-84b1d9b1e293@mind.be>
Date: Sun, 14 Jul 2024 15:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Pesce <luca.pesce@vimar.com>, buildroot@buildroot.org
References: <1670323283-5697-1-git-send-email-luca.pesce@vimar.com>
 <1670323283-5697-2-git-send-email-luca.pesce@vimar.com>
Content-Language: en-GB
In-Reply-To: <1670323283-5697-2-git-send-email-luca.pesce@vimar.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720962806; x=1721567606; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hXnLZsH3Wo306fYkK7iSvPfmY0fKPCNCV8OtQZ+moGg=;
 b=gBYOlWoOsd8cmv433EnXJppPdfH4aaMc7QC/qvMJJajE0rvweHFPQQUYnI9Mjsl2Pp
 49Xg0P1qtaJP/VZoiPSxQESKc69bErsorwBG/wyVdNyLuQId6gkbW1dqQw/CKlSCJ/cL
 6ISGni/eiYV0pq1VRdb63Y+ZNxxqTsQWZ0f3tteQznrDoisdXJdKtGvPNsT4Zhk7Gf/W
 7z+qjfyZgJbqRCx/mkUTb+lp2EnkpkC9yL+uO1dpOylgPSOSoBah1KwOL9WnZFGRGHbU
 Lsu3fsTFex08O3bsjmIS2CDN1/Wd70Rx48ukJe2XZShWr6h8kew9n1i+wlhgKsUmng24
 mz9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gBYOlWoO
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: restore user's
 original umask for the whole download process
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Luca,

  Sorry for the extremely long turnaround time for this. Messing with umasks is 
something that nobody really wants to think about because it entails all kinds 
of corner cases... In the end, though, it took me just a little more than half 
an hour to get this merged.

On 06/12/2022 11:41, Luca Pesce via buildroot wrote:
> Root makefile imposes 'umask 0022', and this may be more restrictive than the
> user's original umask - which could have provisions set to share files/dirs
> with other users.
> As an example, the imposed value makes the per-package download directories not
> writeable for the group, but just for the owner - the user that issued the first
> build that populated the per-package dl dir for the first time (say user A).
> Thus, if a BR package changes its version (e.g. for buildroot update), and
> another user (say user B, in the same group of A) starts a build, BR fails the
> creation of package-xxx.tar.gz inside the dl dir, because user B has no write
> permissions on that path. Furthermore, in the case of the git backend, this
> makes the git cache not updatable by a different user. This is disruptive for a
> host used by many users, all belonging to a certain group.
> 
> So, to allow sharing of a rw BR2_DL_DIR location among users, we save the
> original umask value (but only if it is more permissive than our REQ_UMASK,
> which is our minimum working requirement) and restore it during the download
> process.
> 
> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>

  Applied to master, thanks, with the following changes:
      - CURR_UMASK -> CUR_UMASK.
      - BR2_ORIG_UMASK -> BR_ORIG_UMASK.
      - Don't check if the umask is more permissive, apply it regardless. If
        the user explicitly doesn't want to make their DL_DIR readable by
        others, that's fine.
      - Don't export BR_ORIG_UMASK.
      - Only set BR_ORIG_UMASK if it we recurse, and only set umask if
        BR_ORIG_UMASK is set.
      - Add DOWNLOAD_SET_UMASK to simplify the latter.

  I hope it helps you!

  Regards,
  Arnout

> ---
>   Makefile                | 17 ++++++++++++++++-
>   package/pkg-download.mk |  6 ++++--
>   2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 88f90cd..ec45589 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -68,21 +68,31 @@ endif
>   CANONICAL_CURDIR = $(realpath $(CURDIR))
>   
>   REQ_UMASK = 0022
> +CURR_UMASK = $(shell umask)
>   
>   # Make sure O= is passed (with its absolute canonical path) everywhere the
>   # toplevel makefile is called back.
>   EXTRAMAKEARGS := O=$(CANONICAL_O)
>   
>   # Check Buildroot execution pre-requisites here.
> -ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
> +ifneq ($(CURR_UMASK):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
>   .PHONY: _all $(MAKECMDGOALS)
>   
> +# Save the user's original umask (but only if it is more permissive than or
> +# equal to REQ_UMASK, which is our minimum working requirement)
> +ifeq ($(shell printf "%04o" "$$(( $(CURR_UMASK) | $(REQ_UMASK) ))"),$(REQ_UMASK))
> +BR2_ORIG_UMASK := $(CURR_UMASK)
> +else
> +BR2_ORIG_UMASK := $(REQ_UMASK)
> +endif
> +
>   $(MAKECMDGOALS): _all
>   	@:
>   
>   _all:
>   	@umask $(REQ_UMASK) && \
>   		$(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
> +			BR2_ORIG_UMASK=$(BR2_ORIG_UMASK) \
>   			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
>   
>   else # umask / $(CURDIR) / $(O)
> @@ -91,6 +101,11 @@ else # umask / $(CURDIR) / $(O)
>   all:
>   .PHONY: all
>   
> +# Export the user's original umask: we may need it later to honour user's file
> +# creation permissions when creating non-target files/dirs (e.g. during the
> +# execution of dl-wrapper script)
> +export BR2_ORIG_UMASK := $(or $(BR2_ORIG_UMASK),$(CURR_UMASK))
> +
>   # Set and export the version string
>   export BR2_VERSION := 2023.02-git
>   # Actual time the release is cut (for reproducible builds)
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 0718f21..eb2a242 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -107,9 +107,11 @@ endif
>   #
>   ################################################################################
>   
> +# Restore the user's original umask during the whole download, in case he has
> +# provisions set to share the download directory with his group (or others).
>   define DOWNLOAD
> -	$(Q)mkdir -p $($(2)_DL_DIR)
> -	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
> +	$(Q)umask $(BR2_ORIG_UMASK); mkdir -p $($(2)_DL_DIR)
> +	$(Q)umask $(BR2_ORIG_UMASK); $(EXTRA_ENV) $($(2)_DL_ENV) \
>   		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
>   		-c '$($(2)_DL_VERSION)' \
>   		-d '$($(2)_DL_DIR)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
