Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A74C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:35:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44A6860F5D
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44A6860F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E618484056;
	Wed,  6 Oct 2021 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SUWHLJU6gkA; Wed,  6 Oct 2021 20:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FC184035;
	Wed,  6 Oct 2021 20:35:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 821671BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F15784026
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT7P3z-fQQem for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9FD283DE2
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:35:23 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so204680ote.8
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abCbVnT/60wD69opA+vq2Ed1ZqFVFkobby947rCXOvA=;
 b=Iptu+n4rYwl6LDshUf9aBcNm0XJzRpVUabQAQOzDgU4QD0gkZip6uwC4AenX1p3V4t
 EXL8rH0TxgxjT0HHtKTbL70p/LdRSQKZD/8S+AVPaP0W3nldJSZahapVBJBxX5x4ClUQ
 sGWCc7yLY+KdaJv3cu61bf46A6JKXrwu0T7wXqT5qpDwDgQly/wFxMRIYKkhqSDsEbmM
 OWnOohCVUn51H446pPr3Zj0JdCQZG9Ikq9xIEYsfnGiWE+B6GUcDiHvds6wDiCAx11Ed
 +HuDaJ8MclDBPxNjEH75U1FzuwgxTw4gSxFeBMLapJWT+ToFDv+vxdAlrNF03UDi/8ZH
 is1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abCbVnT/60wD69opA+vq2Ed1ZqFVFkobby947rCXOvA=;
 b=GDuiYteAuMtYXn2Y200sFwrrabLCNNqT4SBmNGwb+X8qs4brsDM3jBkbWzI5//IU+T
 FM2UXsTpkCYB9GBTEOHtYnEZMGY631gO/SRvAbvXWARNJohsKe2ts+Me26NbITtfkcgu
 TnP2au7PgQ9a5Z14QoBIK5teZderAYZkzRGcUDIRZW7b1/JDBa8U2dzwCwwrVacZpbmv
 FqFf8L9Zxn8uqxqRomtTvGnYNhG94GfJ9GATdRn/+GtlKND6wZw9RViM4OER3WEaI5W7
 XUONhL5TVDy/gj6/PWuG77NPpQVdpW8ic7p4vcPPuXmXjDeXQFkafOmQFz2TBXpxyj28
 3B+w==
X-Gm-Message-State: AOAM533EgDzx/fuXvr2lCnGJ+bCzDkECFPnhwqYI9uYdiViYE1GM5OEG
 hXCJsuQu1LwyfR6YV29pxhY7rOONx/2HwqwY/7/09hzMf7k=
X-Google-Smtp-Source: ABdhPJyyYQhsqKiwdV2SqlUUU3Uzi8ErzHpvSmBTZCi3eNC0bdTqbeAEFVp25ZB2SY34WjLiUegcxKUr+GuxAlMj+M8=
X-Received: by 2002:a9d:63c7:: with SMTP id e7mr318361otl.30.1633552522884;
 Wed, 06 Oct 2021 13:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211006162044.2500210-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20211006162044.2500210-1-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Oct 2021 14:35:11 -0600
Message-ID: <CADvTj4pkKw2XH8G-f82HcXjFdSm2-sduxuzXZ8vPTiCfCDk6hA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 6, 2021 at 10:21 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
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
>  - http://autobuild.buildroot.org/results/ce974281acdd6729327f2083b24f62485f9b1e1a
>  - http://autobuild.buildroot.org/results/23dd993be4dcd7937d48eef4521690bf30123979
>  - http://autobuild.buildroot.org/results/bcf489ccd41197b57b39312b369921467f295431
>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pkg-autotools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index daa688dab6..7720d6ffe7 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -100,7 +100,7 @@ endef
>  #
>  define AUTORECONF_HOOK
>         @$(call MESSAGE,"Autoreconfiguring")
> -       $(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
> +       $(Q)cd $($(PKG)_SRCDIR) && GTKDOCIZE="true" $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
>  endef
>
>  ################################################################################
> --
> 2.33.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
