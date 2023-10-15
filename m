Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915DCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66F681DFC;
	Sun, 15 Oct 2023 20:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66F681DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L33AAPX3PtnZ; Sun, 15 Oct 2023 20:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4A381DEB;
	Sun, 15 Oct 2023 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4A381DEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CCD31BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A61A402D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A61A402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSh7Ty53hJ5k for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:27:36 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6597401ED
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6597401ED
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-991c786369cso612942766b.1
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697401654; x=1698006454;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmTP1ybRhg27Ib9dSFSKWEOfmuubkW/06RuL2+F+eWg=;
 b=TnHABvy8gcZFQJbY/ERncTjRp2F4Wp9GGL/VgZ3E0y8ZxyR5EPOba4XH2UMuZBELz0
 AIDNL67EUVqwgPOXSdjZHQAjVq9+BY3XuQdjNppg9WY+e61xR4hoKJBtGVpDHQrjfcBS
 C3q+hxgzkQETgZ1b0bDnI200uJjL5rw5Ubkv+R+gsCkaS+ndmdyLbnNY76lw4Ze1keKi
 5t5TvmcexHaj6WRP7O9rW7OXDnadFZNJOGzFTH7NuZpcctJxOc3rxCpKDQT6eqMmnUa+
 Be3XN7zYtdcJmksNOVTRVCGJT+Y+BGDa6gNaVzpQ9KybE4P+TuGYuQAB9De+iD+jjzQ5
 E6GQ==
X-Gm-Message-State: AOJu0YxL33l53fWmHMfxUcb5MEMXZPdlBe553t3vZDKRbAmW94zulT2C
 mXB2G+QyeNAu0BuS7uYsqdogzA==
X-Google-Smtp-Source: AGHT+IFpucGHyZlSgQf9DXYWvAVKDDGdDJl4Q71I6ybsRlqrl7GCZIac/D5xml4dDBX1/BC1m4Q9Gg==
X-Received: by 2002:a17:907:7f1e:b0:9c3:f42f:9474 with SMTP id
 qf30-20020a1709077f1e00b009c3f42f9474mr1017089ejc.55.1697401653723; 
 Sun, 15 Oct 2023 13:27:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906670b00b009ae3d711fd9sm2701824ejp.69.2023.10.15.13.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:27:33 -0700 (PDT)
Message-ID: <f4ba7350-6ae5-e22b-90a6-ed0364d42052@mind.be>
Date: Sun, 15 Oct 2023 22:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20231014222541.891768-1-yann.morin.1998@free.fr>
In-Reply-To: <20231014222541.891768-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697401654; x=1698006454; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xmTP1ybRhg27Ib9dSFSKWEOfmuubkW/06RuL2+F+eWg=;
 b=Y0Q9hrIMFSZL9GDdMv2Dif4w+4s6KFAaxQTztD5pSQeja6HBjCi26u1FRqC/cNZePz
 YoOCN2pOZIS+DCxxYEnw4A3Dkk5v5D4AJ0ELvG63yckLKNRzl3ba8hwWZUmO5rO9LDsJ
 bKF/aWz/ZvFOdnzKOgc1r/AcSsaN0h4XfPcrMM0Rpsh3bOFaU7Zq3DF1hD86o+aciDEd
 XcD7laVDEAP07baNyrjvyU5caTd59RenJIegUtmK4bt+YooybZM2FZ1uPnTaVcsZdmcw
 vOPhSFJl1ijkG75/bIHN0bfHZBClP8xe04RaV/ibhdcwTeYbh7TbggDUnTc8O2uff95R
 NBpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y0Q9hrIM
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: drop support for
 arch-specific patches
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 00:25, Yann E. MORIN wrote:
> The last architecture-specific patch we had was removed 2015-02-14 with
> commit 9863553fe8fa (packages: all salute the passing of avr32), where
> we eventually got rid of the avr32-specific patch for fbv.
> 
> Since then, we've only had common patches (that apply systematically),
> of conditional patches, that are applied in an ad-hoc manner with
> post-patch hooks. Currently, we even only have one such patch (for
> Linux).
> 
> Since we do not advertise that possibility in the manual, and since we
> do not want to have such patches, drop the support for it.
> 
> This has the potential for breaking existing br2-external trees, but
> there is a workaround for those: they can provide a pre-patch ook that
> copies the ecessary per-arch patches if needed. We document this in the
> manual.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/migrating.adoc | 23 +++++++++++++++++++++++
>   package/pkg-generic.mk     |  4 ++--
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
> index 2667aeab96..21277f947b 100644
> --- a/docs/manual/migrating.adoc
> +++ b/docs/manual/migrating.adoc
> @@ -100,3 +100,26 @@ change implies that:
>     to be updated appropriately;
>   * the archive version suffix has been updated to +-br3+, so the hash
>     files must be updated appropriately.
> +
> +Before Buildroot 2023.11, it was possible (but undocumented and unused)
> +to apply architecture-specific patches, by prefixing the patch filename
> +with the architecture, e.g. `0001-some-changes.patch.arm` and such a
> +patch would only be applied for that architecture. With Buildroot 2023.11,
> +this is no longer supported, and such patches are now longer applied at
> +all.
> +
> +If you still need per-architecture patches, then you may provide a
> +xref:hooks[pre-patch hook] that copies the patches applicable to the
> +configured architecture, e.g.:
> +
> +----
> +define LIBFOO_ARCH_PATCHES
> +    $(foreach p,$(wildcard $(LIBFOO_PKGDIR)/*.patch.$(ARCH)), \
> +        cp -f $(p) $(patsubst %.$(ARCH),%,$(p))
> +    )
> +endef
> +LIBFOO_PRE_PATCH_HOOKS += LIBFOO_ARCH_PATCHES
> +----
> +
> +Note that no package in Buildroot has architecture-specific patches, and
> +that such patches will most probably not be accepted.
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6e944dd6b7..face2dc6d9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -252,9 +252,9 @@ $(BUILD_DIR)/%/.stamp_patched:
>   	for D in $(PATCH_BASE_DIRS); do \
>   	  if test -d $${D}; then \
>   	    if test -d $${D}/$($(PKG)_VERSION); then \
> -	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
> +	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch || exit 1; \
>   	    else \
> -	      $(APPLY_PATCHES) $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
> +	      $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
>   	    fi; \
>   	  fi; \
>   	done; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
