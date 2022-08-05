Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE339C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 06:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DF8F40B99;
	Fri,  5 Aug 2022 06:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF8F40B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLMqF3orr06V; Fri,  5 Aug 2022 06:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69899408E0;
	Fri,  5 Aug 2022 06:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69899408E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2731BF418
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 06:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0368941D50
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 06:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0368941D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drEugzyDxHde for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 06:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 447A941D4B
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 447A941D4B
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 06:21:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j1so2142313wrw.1
 for <buildroot@buildroot.org>; Thu, 04 Aug 2022 23:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rjxxVhreETXOtCCuoS3S/2D23PyXV3EeAMXmIYm+mbg=;
 b=op/LeicW+2TACZxq2Rirka5DN5j8IZsvkq6ExJzrbAolaSch9QhUBHQuLGwTx2CM6A
 ZYx3+sjahXGuSD517ZDjlpI5h4nSM3czD+PKRboAU1utExkHOgKpCMN6ZMT3KwCv5oJo
 OBCq9Tm3kNz4ajcTK1j5TnSCGEnKncC/fsaeszhITFmMAVU2KDKqT6lZK4oqg8oEbZx2
 A4rCu2b+6YrGgB72slFyUNbAC4VubIdsYElWsRXaDrz0usb28UoxmpFIlyV4L8Ex1vt0
 f93QNdDHZur0apkX9NA6/QL2T38UtjcayzplxtHkNvX3/8SdmRHxOwB2aELt4F9WPv2H
 ltGg==
X-Gm-Message-State: ACgBeo0DNTt5tZgovnmPMvUUh+ipreQCV8MTSIWlLhLA2gf3V/oqCWDk
 24FgtmiN9HmnYKCxKTcSSIrxfeBqFFpbjG3C+I0=
X-Google-Smtp-Source: AA6agR5tj8qTX6M/gOkgTAaNWsLGcXUpk2HknB1zM5ZM3oGemZ1rt2auoG+ES4IKKTyLVneFrgHn26uGssJ6tgrnGFc=
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr3239679wry.549.1659680499125; Thu, 04
 Aug 2022 23:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220802013359.96843-1-christian@paral.in>
In-Reply-To: <20220802013359.96843-1-christian@paral.in>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Aug 2022 06:21:26 +0000
Message-ID: <CACPK8XcLM6wZymBELyAhFb-Zpn2XBAC0iuigC1fN=gHF6QjR+Q@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rjxxVhreETXOtCCuoS3S/2D23PyXV3EeAMXmIYm+mbg=;
 b=la6FAUtvparKVIM75uNT4UUPqVMt7pWNr1/5N25spS1UmZgdzjdh/iVz91pwH82/kd
 dKVNL/k9Gw/R2nTpM7fFrhbZ5wiqFaiijT0ZJ9CgH7NCBOUhvv7hZYWqp/EgO47alRcu
 lGGANeeYcoQWC/UY0l2DHgu7fExM3JfGdFgfM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=la6FAUtv
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to 1.18.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2 Aug 2022 at 01:38, Christian Stewart via buildroot
<buildroot@buildroot.org> wrote:
>
> go1.18.4 includes security fixes to the compress/gzip, encoding/gob,
> encoding/xml, go/parser, io/fs, net/http, and path/filepath packages, as well as
> bug fixes to the compiler, the go command, the linker, the runtime, and the
> runtime/metrics package.
>
> go1.18.5 includes security fixes to the encoding/gob and math/big packages, as
> well as bug fixes to the compiler, the go command, the runtime, and the testing
> package.
>
> https://go.dev/doc/devel/release#go1.18.minor
>
> Signed-off-by: Christian Stewart <christian@paral.in>

This includes the fixes for go on ppc64le that I posted here:

https://patchwork.ozlabs.org/project/buildroot/patch/20220511114003.162006-2-joel@jms.id.au/

This patch was never merged, but it can be dropped now.

> ---
>  package/go/go.hash | 4 ++--
>  package/go/go.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 45af1fc06f..2a0f02abfd 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
> -# From https://golang.org/dl/
> -sha256  0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d  go1.18.3.src.tar.gz
> +# From https://go.dev/dl
> +sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 172bf16b6f..16602e590b 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GO_VERSION = 1.18.3
> +GO_VERSION = 1.18.5
>  GO_SITE = https://storage.googleapis.com/golang
>  GO_SOURCE = go$(GO_VERSION).src.tar.gz
>
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
