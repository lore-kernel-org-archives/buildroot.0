Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF55C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 12:10:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB8660FED
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 12:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BB8660FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=carnegierobotics.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43ED9400C6;
	Tue, 31 Aug 2021 12:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxdGU7tbnoiT; Tue, 31 Aug 2021 12:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7534E4019A;
	Tue, 31 Aug 2021 12:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC1281BF25B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 12:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9DD280E42
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 12:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=carnegierobotics.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JNZLgYuIMlx for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 12:10:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD71080CE5
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 12:10:34 +0000 (UTC)
Received: from localhost (013.lax.mailroute.net [127.0.0.1])
 by 013.lax.mailroute.net (Postfix) with ESMTP id 4GzQxk2l0Lz2lHjT;
 Tue, 31 Aug 2021 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1630411833; x=1633003834;
 bh=GDIXrm6/AWtEjpX+qMqiY4hdG9lk9tVYUhbKxJR8GGw=; b=wLu9PwG6qX47
 tTic1oDoOcpyFhHyI+l4992hilONnrOPQ0InAtgNGDt0EBElNEU++vwvs1GzElbV
 dhstRJCh21Tcg6st0PbxZUb2tDAdrDsjicb+IDY2HYBrJDVnnMoATV7DlgCXL/v2
 3onBbbSTcnwtnh6wPxUS274Q0UleCFsvOzAyzJkaHF9rEhMLFEvIfcUGxRyFO4aZ
 huThBJx5CSvpA0AGf3TL56KzLjRaCZYhSnwvGLARtBEQtekZi7JB2VX+W4pYcxKZ
 zN2LmC/aYX26ekb8ZpBIDB7A/PtFrXXzd9QkK2WWTl6aau5mVFEPFX33M+My6VBY
 HPjccBimoQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([199.89.1.16])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id Fo-DwK-uLD0P; Tue, 31 Aug 2021 12:10:33 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 013.lax.mailroute.net (Postfix) with ESMTPS id 4GzQxh5t7cz2lHfR;
 Tue, 31 Aug 2021 12:10:32 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Tue, 31 Aug 2021 08:10:31 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c]) by
 CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c%7]) with mapi id
 15.02.0858.015; Tue, 31 Aug 2021 08:10:31 -0400
From: Woody Douglass <wdouglass@carnegierobotics.com>
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: allow cmake
 packages to have a configurable install prefix
Thread-Index: AQHXndftA46igh3hz0CD2SfLXFIKQauMz/uAgAD5xoA=
Date: Tue, 31 Aug 2021 12:10:31 +0000
Message-ID: <979670814b205e133e6029bed4018b9c55b213ec.camel@carnegierobotics.com>
References: <291e9206b766be40d6d9c49cc8d2ef388ca8f5d2.camel@carnegierobotics.com>
 <20210830231633.6bbdcda9@windsurf>
In-Reply-To: <20210830231633.6bbdcda9@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [172.30.0.99]
Content-ID: <67FC757096B246498988DE0E32238CC2@crl.local>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: allow cmake
 packages to have a configurable install prefix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "s.martin49@gmail.com" <s.martin49@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

That may be true, i'll experiment

Thanks,
Woody

On Mon, 2021-08-30 at 23:16 +0200, Thomas Petazzoni wrote:
> Hello Woody,
> 
> On Mon, 30 Aug 2021 19:47:56 +0000
> Woody Douglass <wdouglass@carnegierobotics.com> wrote:
> 
> > I like to organize binaries on my system so that proprietary stuff
> > is put under the /opt tree. this patch allows for that.
> > 
> > Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> 
> Can't you just pass:
> 
> <pkg>_CONF_OPTS = -DCMAKE_INSTALL_PREFIX=/opt
> 
> in your own package ?
> 
> <pkg>_CONF_OPTS is used as follows:
> 
>         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>                 -
> DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cma
> ke" \
>                 -DCMAKE_INSTALL_PREFIX="/usr" \
>                 -DCMAKE_COLOR_MAKEFILE=OFF \
>                 -DBUILD_DOC=OFF \
>                 -DBUILD_DOCS=OFF \
>                 -DBUILD_EXAMPLE=OFF \
>                 -DBUILD_EXAMPLES=OFF \
>                 -DBUILD_TEST=OFF \
>                 -DBUILD_TESTS=OFF \
>                 -DBUILD_TESTING=OFF \
>                 -DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON)
> \
>                 $$(CMAKE_QUIET) \
>                 $$($$(PKG)_CONF_OPTS) \
> 
> Since it appears *after* -DCMAKE_INSTALL_PREFIX="/usr" I assume your
> own -DCMAKE_INSTALL_PREFIX=/opt would take precedence.
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
