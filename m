Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550C0C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 045E6606F8;
	Fri, 10 Jul 2026 16:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBfX3eqvgGXU; Fri, 10 Jul 2026 16:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28922607C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783702264;
	bh=USBWB4MhpIJj6AP/nAYsA6PbB+FETgDlEGI3av/CCsk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fZMlvDLyNPWpiz4i6omeiN3MjnNam+hzSN0TJ4wX40LXA+/aysj36E3LzAHPCuF1L
	 3hZ1whtY8t9JvoCcPDZcMNXPUQAlRBJe7Iny7RvKUoMW2HCBcX9Xbl6VQWS40PV2hj
	 gXlFMHLdCeCd06nV/qmWYb7qbqq2Zy+E9HV+0a/qcAa9OtFaHilnVETSC1rrOxrPd2
	 fzQaikKHwSGhiYsdiQJHyenOAPC8NuXtHDZCz0oEam/xNnhw/qVDcWA9al6UNx0kkT
	 YyRHiTYz9fGKEICib27z/9eI4725JbUxaz4Cz0Bxkjn+0jPTlKA0eF1Qw6YBOaauYJ
	 6YuGS3G+7/XUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28922607C7;
	Fri, 10 Jul 2026 16:51:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 932CC320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84C4E607C7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNH-J824fN0f for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 068EA606F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068EA606F8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 068EA606F8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:51:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9BE80B00573;
 Fri, 10 Jul 2026 18:50:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:50:55 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:50:55 +0200
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 libcamera-devel@lists.libcamera.org
In-Reply-To: <20260709132313.GA1007225@killaraus.ideasonboard.com>
References: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
 <178359239867.2174993.2668122399182615183@ping.linuxembedded.co.uk>
 <20260709102624.GB547298@killaraus.ideasonboard.com>
 <178359366398.2174993.4108783229272661869@ping.linuxembedded.co.uk>
 <20260709132313.GA1007225@killaraus.ideasonboard.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <ab26ffc6635e829f0026b2fe4688e325@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783702260;
 bh=sdTsKsOeJ6dThYhkPEzKq+dlSyR0LLYmJHotU74DOtM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NcZRthMS9Cq3HWflsLQZs2S96cgbEM9UopyeRnNPD4zA5BdtStsF1YO0FgiZxvWaV
 VyJfdqtCrdS6rhZLrodgK5xFKnIy9WjGTlAWpDY75peAqro3/E8hi0opopFZfBVOUv
 +cvwijLBfVMuw4Y1O/KV1qeJBu3DPxgaO7bT4KZXV6KMO0EVVVd0qeC6APs0+m1tdG
 USz90OPV2C4Z3P/QTB0qgqbeFa6byOEmCTcAQnJg+OUK0za6ps7cFlB6I80/6DUvkP
 gi03cdnwGsu9pLBNnuBc73kpkyYUyqF9fX6gJwQ8L8x180uuOC8+/wGZRLNSZtaAg4
 7hV6Y+eYZchnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NcZRthMS
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: update source URL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Laurent, Kieran,

On 09/07/2026 15:23, Laurent Pinchart wrote:
> On Thu, Jul 09, 2026 at 11:41:03AM +0100, Kieran Bingham wrote:
>> Quoting Laurent Pinchart (2026-07-09 11:26:24)
>> > On Thu, Jul 09, 2026 at 11:19:58AM +0100, Kieran Bingham wrote:
>> > > Quoting Laurent Pinchart (2026-07-08 23:35:32)
>> > > > libcamera has moved for a while now to gitlab.freedesktop.org. The
>> > > > mirror on git.linuxtv.org is still active, but it isn't the canonical
>> > > > repository and has less bandwidth than freedesktop.org. Switch the
>> > > > libcamera source URL to gitlab.freedesktop.org.
>> > > >
>> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > > > ---
>> > > >  package/libcamera/libcamera.mk | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>> > > > index 945207888bab..ba7510daf8e1 100644
>> > > > --- a/package/libcamera/libcamera.mk
>> > > > +++ b/package/libcamera/libcamera.mk
>> > > > @@ -4,7 +4,7 @@
>> > > >  #
>> > > >  ################################################################################
>> > > >
>> > > > -LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
>> > > > +LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git/
>> > >
>> > > Why the trailing slash?
>> > >
>> > > Though I've just checked and :
>> > >  git clone https://gitlab.freedesktop.org/camera/libcamera.git/
>> > >
>> > > works as expected,
>> > >
>> > > Viewing the webpage, drops the .git but cloneing without .git reports
>> > > the following:
>> > >
>> > > kbingham@Monstersaurus:/tmp$ git clone https://gitlab.freedesktop.org/camera/libcamera
>> > > Cloning into 'libcamera'...
>> > > warning: redirecting to https://gitlab.freedesktop.org/camera/libcamera.git/
>> > >
>> > > Which has the trailing slash so :
>> >
>> > That's exactly why I added a trailing slash :-)
>> 
>> The web interface does however report this as the URL:
>> 
>>  https://gitlab.freedesktop.org/camera/libcamera.git
>> 
>> without the slash, and cloning that doesn't redirect to one /with/ a
>> slash.
>> 
>> Personally I wouldn't add it - but it's harmless either way.
> 
> I'm fine dropping it. Can this be done when applying the patch ? I can
> send a v2 otherwise.

I removed the trailing slash and applied to master, thanks.

We usually don't put those in Buildroot. Also, it will remain
consistent with other packages using gitlab.freedesktop.org
(piglit, waffle).

>> > > Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> > >
>> > > >  LIBCAMERA_VERSION = v0.7.1
>> > > >  LIBCAMERA_SITE_METHOD = git
>> > > >  LIBCAMERA_DEPENDENCIES = \
>> > > >
>> > > > base-commit: 6854ee9aa3826d5036a7d3cc19056d43c0452320
> 
> --
> Regards,
> 
> Laurent Pinchart

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
