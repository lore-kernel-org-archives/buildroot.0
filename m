Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65037C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261E6845EB;
	Fri, 12 Jul 2024 08:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCtDf5kwxDkY; Fri, 12 Jul 2024 08:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F151B845DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F151B845DE;
	Fri, 12 Jul 2024 08:42:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1731BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C545845D6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIa2LTHdaV_o for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D6F2845DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6F2845DE
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D6F2845DE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:42:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee9505cd37so16009481fa.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 01:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720773727; x=1721378527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yhgaRodQqiXbbNHpeF/D14FkLVB9bSJWI3PElGiAHkI=;
 b=EnoDin8n1mCKOzhR8VfjE+royseWg9ADVtX2XTIVfqaxSXwm+N/ymNHHDylZAupiPW
 XumsV2oGHCvSQ19K703LgEj9m+//0fIGAg8+KzYvUKpEqqx0CtnfrfNI2qThP/+/2qrW
 +ydookTp1ck7nI8pNAeqkxVESVAPMQh3XwMiTp1BfYUp6cSfUFWeq7yqk119OnL92GSl
 BIafSSGGZ/O6rPUztc89tKg6g+QDVWTDd9TsULt7fDwl98va2R9EliYHREt/CY8SBbd1
 E4MrSbs4iu5eUZBgxJaC/a1PK8FpXPoeAniznaEnY5h4kl2Irxyo3e7JS2QtjtvJ0GoM
 IvnQ==
X-Gm-Message-State: AOJu0YyhzoxuA4KS5IIL3F3FEbhCVljf1Ee+kbCBaRwdHgdgUcAu6aE/
 d1js7KXufPIg6CDfBZ+vgI1Jbid58TrzHRgyezcHFW7DvxFkgQCr63Bno0UkoWIRAm1gtSwqt37
 EbcI2VE7pF8lumeTd41loGUR8bos=
X-Google-Smtp-Source: AGHT+IFj8aMzrE58jcE8Hs/NMxOn3DzHzLPpv7bR6/NyH8HS1E48SuASDUWVUBKZvOTsyJgskhZkr3dJSKXYHxb9FjI=
X-Received: by 2002:a2e:7c18:0:b0:2ee:8777:f868 with SMTP id
 38308e7fff4ca-2eeb31895f5mr67145271fa.35.1720773726487; Fri, 12 Jul 2024
 01:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
 <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
In-Reply-To: <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 12 Jul 2024 10:41:54 +0200
Message-ID: <CAEyMn7b56+h3GfDYCPTyLqAp7GO5LUd4=80tw=z3NR9+cWZVsQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720773727; x=1721378527; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yhgaRodQqiXbbNHpeF/D14FkLVB9bSJWI3PElGiAHkI=;
 b=Q8x6i3zuUu+xmgQcxdHTQ6swGJ7U+gNhSyJH5+Z6KZX/X6XgP1LFH3Ozx5zvIzwHEv
 HmvkCPpNLC2AolhR+Ty8jNHHTCAxNtiGFuD5dOX6PmRIpFr2YClvBa5W5/43CEifRpgB
 HQ5OVX2IxdLhox0bQFwk0o+7fyLqWgQGV2HCIp4ZwsQeP6IQmj876zYcsuP+P1malf9I
 XLmApyZqvUt/yv/m+VQXRZBfVI4IXJJW8fcQGZ6QwuECsNjBX1pKWPowESC+sFQcXxpJ
 8Ot4wYelKWzAsAWD0TkyRRkh7pwZTRGGGZDei27SFhCMDtn8rnmxJak+L7Br/xasE67Z
 reoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8x6i3zu
Subject: Re: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Fr., 12. Juli 2024 um 10:38 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>   Hi Heiko,
>
> On 04/07/2024 14:34, Heiko Thiery wrote:
> > This package is used and required for ccache update.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >
> > v2:
> >      - on change
> >
> > v3:
> >      - fix BLAKE3_LICENSE_FILES and corresponding hash values
> >
> >
> >   DEVELOPERS                 |  1 +
> >   package/blake3/blake3.hash |  3 +++
> >   package/blake3/blake3.mk   | 20 ++++++++++++++++++++
> >   3 files changed, 24 insertions(+)
> >   create mode 100644 package/blake3/blake3.hash
> >   create mode 100644 package/blake3/blake3.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 90d1a111ab..46fe3cd2e1 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1359,6 +1359,7 @@ F:      configs/kontron_bl_imx8mm_defconfig
> >   F:  configs/kontron_smarc_sal28_defconfig
> >   F:  configs/kontron_pitx_imx8m_defconfig
> >   F:  package/altera-stapl/
> > +F:   package/blake3/
> >   F:  package/ipmitool/
> >   F:  package/libnetconf2/
> >   F:  package/libyang/
> > diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
> > new file mode 100644
> > index 0000000000..2a00d19b02
> > --- /dev/null
> > +++ b/package/blake3/blake3.hash
> > @@ -0,0 +1,3 @@
> > +# sha256 computed locally
> > +sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
> > +sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
> > diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
> > new file mode 100644
> > index 0000000000..76e4e32e7a
> > --- /dev/null
> > +++ b/package/blake3/blake3.mk
> > @@ -0,0 +1,20 @@
> > +################################################################################
> > +#
> > +# blake3
> > +#
> > +################################################################################
> > +
> > +BLAKE3_VERSION = 1.5.1
> > +BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
>
>   Why do you put the refs/tags here? It was necessary in one or two packages
> because of a conflict with a branch name, but I don't think that's the case
> here. I admit that there's a certain elegance to making it explicit that we want
> a tag, but then we really should be doing that everywhere...
>
>
> > +BLAKE3_SUBDIR = c
> > +BLAKE3_LICENSE = Apache-2.0, CC0-1.0
> > +BLAKE3_LICENSE_FILES = LICENSE
> > +
> > +# We may be a ccache dependency, so we can't use ccache; reset the
> > +# options set by the cmake infra.
> > +HOST_BLAKE3_CONF_OPTS += \
> > +     -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
>
>   Why is this needed? And is it even a good idea? In pkg-cmake, this is defined
> as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any
> ccache. In fact, this changes it from "as" to "gcc" which I expect is not
> correct at all...
>
>   Since you said you could respin this weekend, I will mark as Changes
> Requested, but it's possible that your respin only has some commit message
> changes of course.

ok, I will recheck the things you mentioned and come back with
info/respin at the weekend.

Thanks
--
Heiko

>
>   Regards,
>   Arnout
>
> > +     -UCMAKE_C_COMPILER_LAUNCHER \
> > +     -UCMAKE_CXX_COMPILER_LAUNCHER
> > +
> > +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
