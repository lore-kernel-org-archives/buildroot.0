Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406361098797
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1749841E77;
	Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSC8hsTZml10; Fri, 20 Mar 2026 15:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D42D41E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022107;
	bh=qGWDiXdYl2phzusQ8Bw820ikU7GekdR+5aVypuuWj/8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Okn61L+MGLb35MEer3qeXz2ce9fA7yGqPo9WfmDB1TDzrPHUn5ILlhceORZVicqmp
	 rlCMyvU+QqpGJJzlQ+sPBiz+gFt/pJNWBq6TCMLDfvEsYsliOMoLlcXMS2aO0B3Ijc
	 m58ozyTc6frUTYfx7y1+tQRbY5j9Xb68h3F2ccG4r8MkK5vO4LQS7LFC28FOXePyQd
	 4tybMrdOPhke7JBScLxwWoa3GWp5chuCRCSkEWxzjNswGPzrYxKVuTtvN77RNbuS+M
	 t/cQwQmsPj4DDOTq2fabAjXpZG5Q7HK7QXug3dGvRZdk9Bj5+fzWn6/n8vxhUbovkN
	 2M7futubf7cBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D42D41E81;
	Fri, 20 Mar 2026 15:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC7725C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DD0D61B71
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9fbPn8a9QiU for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 345D761B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 345D761B7D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 345D761B7D
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-485410a0a8aso6284245e9.2
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022102; x=1774626902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G1UaeGA0IHeGkNqZ2vhVF97OgSp0rMesrpRAXR7yaRo=;
 b=Xx+gjpZK+KsCoKOOBkEF2qvLjjfCvr1lyyaGJ43wMUqD9/O97ldVJcfv8Iqnj3/9b6
 uYKq9+iOV6LRJ7d56BfL8I/hacOwkizZg2Wi3hlNUCcKP1xEnfbHpihWOmouo5nTz5CG
 WqlE54Jxy1bSCLF/29rNfiiXFvhjR7qS5z5QcrR1V4fdhwVQ4BCcfBFV72yuExSUqRJw
 EuqaKO9YWmdnnu0Rsy/zA/4vK8HHpw8dm7HURwSzilgX10lU/jyTENDOWwhxGYo3MRF5
 R+dRs73zUeyQmPyCkmMXqj4wdKKhPMTbVsaXND2v6f1FDPVoiOO2n4dMSWvUf7DFyKK4
 l8SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmM58685dcs2+2/fia2Xk7yomhp3as3L7hZPea33i7QeLRgeFQe7TEa2hMqvxMJ1ntEzpfhpvkpMg=@buildroot.org
X-Gm-Message-State: AOJu0YylPjsdWWyIVBCgAvIS2w48th53SCrzWkObJ2wUIBPNMXTRGU1f
 2Oeen5pqR3H3ZDASwVeOx7xU6fGiWG99c+F9RfeVRavAJxQYweg3yTWSEt/pnk0OjsNZ5rT3prG
 /a6NumIs=
X-Gm-Gg: ATEYQzyJ5bv/DIdsbmzn/npDh+j3auKODT5DVWwoZbAZ4TM+LfTxMmNtIm5S3WVF5SX
 GlwD/bQWI9K2/TPZDpU/URUv5K5/D4OCyHE7c9Q43B49+2C2jaXccyDi63WpfJ7o+PPVrLCC7of
 SETXDhHI+IgaU0fu0cJiKneIxY7LqvhFC/a4wfVr0RY22Ji/D+rEAhgk35zVxayQubp9/CNZAR8
 9y07dUP1nRi8v7/NIXfqQpSEVE0IZs+j1LpsP4X5S+7xVLiu3q2TEvTmPIFI9/KvCFAIdpBQaSU
 WET585qA1nE6Nsig+qA2cZ7HzrKnsMTiUCOduqynKrHrnc4FPJAifYGR2tOcW2mGjqny0JNgR0Q
 bYmsxK/Q9497+p9pT+gQ3WGIKO2aa8pyi7b+9ASTrp5d7AFgHwYyaiUH+w8jF0WQBK4dtQOnifJ
 l3UglPlPK18NRYy950
X-Received: by 2002:a05:600c:c16e:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-486fedb9497mr49722335e9.8.1774022102005; 
 Fri, 20 Mar 2026 08:55:02 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe7d6c54sm172411175e9.4.2026.03.20.08.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:01 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:01 +0100
Message-ID: <20260320155501.176423-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3bf503a96d4ef1a70f0f95b6c6872129143d5fa1.1770155657.git.yann.morin.1998@free.fr>
References: <3bf503a96d4ef1a70f0f95b6c6872129143d5fa1.1770155657.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022102; x=1774626902; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G1UaeGA0IHeGkNqZ2vhVF97OgSp0rMesrpRAXR7yaRo=;
 b=ZDPZIGPqOsAXDj9zFlqSXVD124HhLM8ZH2RYUTLjhowVHPWQ860wehw6hzCIAKNJ/o
 /M34lOrmRTg2YrK5qb+euX6fTjOvkXVUcD2mnycgCSUDk5DiJp3sNKEM35S3V0rXZnAY
 tVQVFbaVFj8eLSNcKhqmVIzfpgCy+bIG1bzsy3NrFvGKH7Zt2USEstVRcBZ203OA2aYr
 WoHcPIHkH3jHPHt+JJsDdG1e1l2ocfttgiYE00T4RdSYn/MYNeg2S9c+B8T4BEmWxX/r
 wV92SjwQ4Vr8Kel6UWmfiUjB3z8vXYyoT5tl0m640Lk9JakZZ3X5rZWErGrEpJDdOjB+
 GCCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZDPZIGPq
Subject: Re: [Buildroot] [PATCH 3/3 v4] docs/manual: use space-separated
 list for BR2_EXTERNAL
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
> Specifying a list of br2-external trees is poorly documented, and the
> only example uses a colon to separate the br2-external paths.
> 
> Adding the support for colon-separated list is the biggest mistake that
> was made when introducing support for multiple br2-external [0]. Indeed,
> both space and colon can be used to separate entries in the list, and it
> is also possible to mix the two. However, internally, the list is stored
> as a space-separated list, and all the code will split on spaces.
> 
> Besides, all other lists in Buildroot are a space-separated:
>     BR2_ROOTFS_DEVICE_TABLE
>     BR2_ROOTFS_STATIC_DEVICE_TABLE
>     BR2_TARGET_TZ_ZONELIST
>     BR2_ROOTFS_USERS_TABLES
>     BR2_ROOTFS_OVERLAY
>     BR2_ROOTFS_PRE_BUILD_SCRIPT
>     BR2_ROOTFS_POST_BUILD_SCRIPT
>     BR2_ROOTFS_POST_FAKEROOT_SCRIPT
>     BR2_ROOTFS_POST_IMAGE_SCRIPT
>     ...
> 
> So, using colons is odd.
> 
> The fact that BR2_EXTERNAL is pqssed on the command line rather than
> being a Kconfig item is not a reason enough to justify that it be
> colon-separated.
> 
> Change the documentation to only mention using a space-separated list.
> 
> Of course, for backward compatibility, we keep the code as-is to accept
> a colon-separated list, but we just do not advertise it.
> 
> Note that keeping the split on colons means that colons are not accepted
> in pathnames of br2-external trees; in practice, this is not a new
> restriction, or one that could lift as usign colons in Makefiles are
> problematic anyway.
> 
> [0] in 20cd49738781 core: add support for multiple br2-external trees
> 
> Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Reported-by: Brandon Maier <Brandon.Maier@collins.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Note: support/scripts/br2-external has shellcheck issues; this commit
> does not try to address those on purpose, as it only adds a comment.
> 
> ---
> Changes v3 -> v4:
>   - add an extract of all other list variables from [1]
>   - sumarise and include Arnout's comments from [2]
>   - fix typo
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240904205354.504964-1-yann.morin.1998@free.fr/#3375145
> [2] https://patchwork.ozlabs.org/project/buildroot/patch/20240904205354.504964-1-yann.morin.1998@free.fr/#3375416
> 
> Changes v2 -> v3:
>   - add comment in support/scripts/br2-external  (Fiona)
> 
> Changes v1 -> v2:
>   - fix typoes
> ---
>  docs/manual/customize-outside-br.adoc | 5 +++--
>  support/scripts/br2-external          | 3 +++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
> index 78065489d4..8a76f3a998 100644
> --- a/docs/manual/customize-outside-br.adoc
> +++ b/docs/manual/customize-outside-br.adoc
> @@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
>  buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
>  ----
>  
> -We can also use multiple br2-external trees:
> +We can also use multiple br2-external trees, by specifying a space-separated
> +list of paths to use:
>  
>  ----
> -buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
> +buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
>  ----
>  
>  Or disable the usage of any br2-external tree:
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 474feaded7..641f8e18ae 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -34,6 +34,9 @@ main() {
>          error "Cannot create output directory '%s'\n" "${outputdir}"
>      fi
>  
> +    # Historically, BR2_EXTERNAL could also be colon-separated, so for
> +    # backward compatibility, keep splitting on colons (in addition to
> +    # spaces).
>      # shellcheck disable=SC2068  # We do want to split on spaces
>      do_validate "${outputdir}" ${@//:/ }
>      do_mk "${outputdir}"
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
