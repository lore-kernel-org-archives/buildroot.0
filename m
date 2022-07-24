Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22568C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 22:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F85883EDF;
	Sun, 24 Jul 2022 22:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F85883EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wj-rGrJJzmqg; Sun, 24 Jul 2022 22:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82B183ED8;
	Sun, 24 Jul 2022 22:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82B183ED8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 221B61BF424
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 22:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF1C6400CC
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 22:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1C6400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcSpGen7fkM1 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 22:56:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17DE1400BB
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17DE1400BB
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 22:55:59 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fy29so17439740ejc.12
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nG0vgL2Bjdc423kZw2bpSmXiw/l9cYZkEZ8IdOzDoto=;
 b=PU1Bc7/eIgbiFvWoHTTJlZC+t26PcnC6a5YI2/ETCMw6WDWQv3zs7fdVGXrhuKZ9l/
 08UFzVFpk64pagIn/eNV9/FuZGVHPXGxQlx8MjPXZZ6yGFvfGDAyrj5LQwpwbosHDF5E
 Q9Lye4Gm/zP+4Hhwk+0IJio43hQt74TcMSiW77EGmVDQZeHPOdwIsjFb17ePhx5mYfRz
 K0W5xIZUyJTnaat6GkBehRS+pYzVY0jYBSe9ojXMm5buvu/+2G/y9/C0vUrrhwudqiSK
 u31Yb8LGrRO7RQD6vpZvUGAzjddXAXn0ENUmJF0rbCOx4WhMP0y9PK6ol8F8GxszjyTw
 TFHQ==
X-Gm-Message-State: AJIora9IHQM+WCQ2mQZ+fMYfdFOJtin84nkOKM6dAmUtjQ9860JSkzyJ
 RP4I/9UxGTZHuNgkiGtArHG3fCAuZCL9WQ==
X-Google-Smtp-Source: AGRyM1tjFUJbU4kLhC8gQ5jQY4VZGOueBH+tqFhqdynb0vZpSnxrBcoLVb6gsMXg83Wgr4ExoQSJoA==
X-Received: by 2002:a17:907:7290:b0:72b:3799:624c with SMTP id
 dt16-20020a170907729000b0072b3799624cmr7839711ejc.108.1658703357720; 
 Sun, 24 Jul 2022 15:55:57 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 g8-20020a170906538800b0072af930cf97sm4619859ejo.115.2022.07.24.15.55.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 15:55:57 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id j22so17551407ejs.2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:55:56 -0700 (PDT)
X-Received: by 2002:a17:907:b590:b0:72f:90ba:bef0 with SMTP id
 qx16-20020a170907b59000b0072f90babef0mr7767511ejc.333.1658703356410; Sun, 24
 Jul 2022 15:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210622024337.3009417-1-christian@paral.in>
 <20210721224913.3d600ccc@windsurf>
In-Reply-To: <20210721224913.3d600ccc@windsurf>
Date: Sun, 24 Jul 2022 15:55:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rYtDKeyjTNa7csjqG9R8Xxo6m504WwCty3AMqdmT5HrA@mail.gmail.com>
Message-ID: <CA+h8R2rYtDKeyjTNa7csjqG9R8Xxo6m504WwCty3AMqdmT5HrA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nG0vgL2Bjdc423kZw2bpSmXiw/l9cYZkEZ8IdOzDoto=;
 b=KQiyfyLmUlfV3ACuzEhdWj09zFEIEDob7k1fGQWO9WRY/7+DAVCn5qUSUTUJFVlVo3
 uDm+k00su83GvPmn871YHhwKp9jBBUtB0QKRkAoAKnA/iHL7TXpLJ3FbpkIsaO4WC/H4
 1ubIKoa8ovYTk0fbaGHeQdg7ZdVOoZ6z2Ld9HDeoWKNG0+qyseb8MkKdS96nIMyCCKUM
 Q1+93pCdY/8LfiE4wVeRFZtqVjV29zrufwq8tEAr0RyOULqVbOYjtV074BE9on1aMKzQ
 z+lFLCZ9VWdfNzPw2FS75SOAX4EgPSeeIELY1AzIIaSRASgyUa/IH94S1YoUd1iB4r/1
 yUmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=KQiyfyLm
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

I have implemented your suggestions below & sent as a V2.

On Wed, Jul 21, 2021 at 1:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Normally, the way we do things is that packages express their
> dependency on a particular system tool by selecting a hidden boolean.
> For example packages that need java on the host will select
> BR2_NEEDS_HOST_JAVA, and in support/dependencies/dependencies.sh, if
> BR2_NEEDS_HOST_JAVA=y, we check if java is installed.
>
> The other model that we have is for optional host tools, where we can
> use the system-provided one or fallback to building our own if not.
> That's for example what support/dependencies/check-host-lzip.{mk,sh} is
> doing.
>
> check-host-lzip.mk calls suitable-host-package, which itself calls the
> check-host-lzip.sh script to verify if lzip is installed. If there is
> no suitable lzip available on the host, then check-host-lzip.mk defines
> BR2_LZIP_HOST_DEPENDENCY to host-lzip, so that packages who need the wo
> lzip utility can depend on $(BR2_LZIP_HOST_DEPENDENCY). It will be
> empty if the system has a lzip program, or it will be set to host-lzip
> if Buildroot needs to build its own.
>
> Another feature for the lzip situation is that we can force Buildroot
> to build the host packages even if the tool is found on the machine,
> using BR2_FORCE_HOST_BUILD=y.
>
> The thing is that your host-go-bootstrap situation does not exactly fit
> these situations.
>
> I think the easiest would be to do like we do for Java, but only select
> BR2_NEEDS_HOST_GO if we're on a host architecture that doesn't support
> building host-go-bootstrap.
>
> If we go this route, then it should look like this:
>
>  * Top-level Config.in defines BR2_NEEDS_HOST_GO as an hidden boolean
>
>  * support/dependencies/dependencies.sh should test if a functional Go
>    compiler is available on the machine if BR2_NEEDS_HOST_GO is
>    defined, and if not bail out with a hard error
>
>  * BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS and
>    BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS should loose their "depends
>    on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS" and instead have
>    something like:
>
>         select BR2_NEEDS_HOST_GO if !BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
>
>  * go.mk should be modified to not use host-go-bootstrap if
>    !BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS. I don't think
>    host-go-bootstrap should be modified like you did however, the
>    changes should be contained into package/go/go.mk.

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
