Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF642C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:53:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1986023F
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D1986023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE8060805;
	Tue, 12 Oct 2021 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaoWEH1swboN; Tue, 12 Oct 2021 20:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 796436081D;
	Tue, 12 Oct 2021 20:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5255B1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E27240784
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fVS52cCMGjj for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:53:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13B0540775
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:53:06 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g8so1203375edt.7
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nd1SIRf8zshESe+H8orBATWo/n0PSCuJpHYc8h2YrmA=;
 b=S+24KASS2fd1VSUvMRDimx2zyHoQ9YvAwbplhWKkIVEOxCEiFW+XVsx24rxzY+kLCc
 YuIy+aP3g+j0Gwcrj1x780ZEvj6QjUUeQlVVgEac02gbZqJGIEhrqLOwYIivh+hJsz7n
 Ei22cDVA1qpKi2hUBpYzTi+3423XxHVBGEik/b9Ef/O4chbcaaBzqxOGDT2Y+9w0ZlK3
 DA5jOd4329qc3E73hvMmVksD+NQX7xRB386DR9gKQ+S2+VO7ySCSYDOxQnghI3EWRbyL
 3aLq3XjSB2nlPRI5m1kp06GxQU1Gdxn4gvTl6w2iTOcBQXHczWpmDgVnQJ7h9nrdENaD
 K9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nd1SIRf8zshESe+H8orBATWo/n0PSCuJpHYc8h2YrmA=;
 b=nSmrelvL6YaLXhQbcPOTlA+xZXJolySoCJjnpU2DEZ5exHZC34EGibs4mv8yajc0Yv
 nFicIjEirtZqjpgrsRrKDXd4VZbgl3EaQymEjxleqAtjLDFnZzN36KeC3JLqXmRUYcRl
 /qsxTpT3eCrm5oMxssCgd6mpPGB/kWK2fDGdwqLiFOaGUVoFBN8LEhbHSDrsXdw+xJx0
 ewSzqENI/OTrmdSdtiUM74C4x8iIsZLVxztJAnW8IbT032RBFmQiZcSRZRmRC5YpwXEQ
 PEQZc7GjkTziEITDfq7SiOFFfnWZkw5lRvUQTuZ2STVkwUfOdgu/i1JJd9RUaYYdwypC
 StFg==
X-Gm-Message-State: AOAM531hlz2C0w3zfpTQEbwUbAx37Rky065ghp5tgQNcHHLiOpfs3N3l
 Z42qGfgX78kF4VZYN+P5MlEwtg==
X-Google-Smtp-Source: ABdhPJyGjZqQ2a5HAF0jQutbZ5mgNw0Gx+UxAcoy/yvivatkGW3arxzoc7oHWwF4QOOw0NsO0RwxUg==
X-Received: by 2002:a17:906:b311:: with SMTP id
 n17mr33655547ejz.571.1634071985089; 
 Tue, 12 Oct 2021 13:53:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c17sm6355940edu.11.2021.10.12.13.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:53:04 -0700 (PDT)
Message-ID: <0496e3c2-8b55-c900-ab47-841268e783ab@mind.be>
Date: Tue, 12 Oct 2021 22:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006162044.2500210-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006162044.2500210-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-autotools: fix autoreconf
 with autoconf >= 2.70
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 18:20, Fabrice Fontaine wrote:
> The following build failure is raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
> http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=dd880a0a6de5602cdd40b770ed6b083b34aa0768:
> 
> Can't exec "gtkdocize": No such file or directory at /home/buildroot/autobuild/instance-1/output-1/host/share/autoconf/Autom4te/FileUtils.pm line 293.
> autoreconf: error: gtkdocize failed with exit status: 2
> 
> This failure is raised because autoreconf runs gtkdocize if configure.ac
> contains GTK_DOC_CHECK, so set GTKDOCIZE to true in pkg-autotools to fix
> this issue for all affected packages (i.e. host-libgtk3, libtasn1,
> raptor, etc.). Indeed, gtk-doc is already forcefully disabled in
> pkg-autotools through --disable-gtk-doc configure flag.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ce974281acdd6729327f2083b24f62485f9b1e1a
>   - http://autobuild.buildroot.org/results/23dd993be4dcd7937d48eef4521690bf30123979
>   - http://autobuild.buildroot.org/results/bcf489ccd41197b57b39312b369921467f295431
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  I have instead applied [1], which puts it in AUTORECONF itself. I think that's 
a more appropriate place since it also has AUTPOINT=/bin/true already.

  Regards,
  Arnout

> ---
>   package/pkg-autotools.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index daa688dab6..7720d6ffe7 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -100,7 +100,7 @@ endef
>   #
>   define AUTORECONF_HOOK
>   	@$(call MESSAGE,"Autoreconfiguring")
> -	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
> +	$(Q)cd $($(PKG)_SRCDIR) && GTKDOCIZE="true" $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
>   endef
>   
>   ################################################################################
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
