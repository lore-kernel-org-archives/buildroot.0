Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D46C44501
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 10:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755B340C6A;
	Thu,  9 Jul 2026 10:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnMBuYAQWvgi; Thu,  9 Jul 2026 10:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9955140D86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783593670;
	bh=vmqCwztlYbVA0dbRj1czEMRL0U3lk7K5nNGUCwnsMi8=;
	h=In-Reply-To:References:From:Cc:To:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qumb1aaKDm33b9uzFjH7lxjjnOKf9OlrEgvqXTqDKpIW17HMix+IX5CnNjbqYV6v3
	 Xy9j0qS9x2Ee9did6zBlTJsvYjy4tB3z2rEy+jxI0EEM+PJ9rkosMXHb/BdI/88P87
	 JuFyynTR8D6yCAu3iOvTF2Ok5cV3TBSkIuXmi4SwoxCXgMAF3NYn0mYj5a531QKeab
	 egamSfBkT+O+GSmB8iJK9FbyUhLkPT9aglWEh3hvw4Jqqak/p9nUM+pcQ/Ss8m3eq8
	 G4d4RtGbqQlZm7goRttlBv6ZLjW2ZQiO41XdTTem2wN3OaSi/+gETM7Tyy3NHbsrl4
	 nMqnRchL7HhaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9955140D86;
	Thu,  9 Jul 2026 10:41:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73086315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61FDA40C6A
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAabb4cXB0Sk for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 10:41:08 +0000 (UTC)
X-Greylist: delayed 814 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Jul 2026 10:41:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EC0A40D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC0A40D86
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com;
 envelope-from=kieran.bingham@ideasonboard.com; receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC0A40D86
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:41:08 +0000 (UTC)
Received: from monstersaurus.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 964B9289;
 Thu,  9 Jul 2026 12:40:15 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20260709102624.GB547298@killaraus.ideasonboard.com>
References: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
 <178359239867.2174993.2668122399182615183@ping.linuxembedded.co.uk>
 <20260709102624.GB547298@killaraus.ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 libcamera-devel@lists.libcamera.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 09 Jul 2026 11:41:03 +0100
Message-ID: <178359366398.2174993.4108783229272661869@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1783593615;
 bh=RtR9/vmb1FqMuaoMJSKxXAWXiRnWkf9hgnbtLTziCRk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gZZncygGzP7KMF9Lmlgf//8rRiYalz3CmT90y3wevTKUAghkMGgoxVnzTa5GjZ1M0
 kNOWUD7bN3TKKzQi0SMvEnJJ0N2NZ1QjtH0NBXRi6M+MqBeUXeSOgn0bynJ158+Rt0
 y3e5AB2lW/zo9mojVrBpCVH929xm+1bAmYPDN/7k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=gZZncygG
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Laurent Pinchart (2026-07-09 11:26:24)
> On Thu, Jul 09, 2026 at 11:19:58AM +0100, Kieran Bingham wrote:
> > Quoting Laurent Pinchart (2026-07-08 23:35:32)
> > > libcamera has moved for a while now to gitlab.freedesktop.org. The
> > > mirror on git.linuxtv.org is still active, but it isn't the canonical
> > > repository and has less bandwidth than freedesktop.org. Switch the
> > > libcamera source URL to gitlab.freedesktop.org.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  package/libcamera/libcamera.mk | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > index 945207888bab..ba7510daf8e1 100644
> > > --- a/package/libcamera/libcamera.mk
> > > +++ b/package/libcamera/libcamera.mk
> > > @@ -4,7 +4,7 @@
> > >  #
> > >  ################################################################################
> > >  
> > > -LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> > > +LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git/
> > 
> > Why the trailing slash?
> > 
> > Though I've just checked and :
> >  git clone https://gitlab.freedesktop.org/camera/libcamera.git/
> > 
> > works as expected,
> > 
> > Viewing the webpage, drops the .git but cloneing without .git reports
> > the following:
> > 
> > kbingham@Monstersaurus:/tmp$ git clone https://gitlab.freedesktop.org/camera/libcamera
> > Cloning into 'libcamera'...
> > warning: redirecting to https://gitlab.freedesktop.org/camera/libcamera.git/
> > 
> > Which has the trailing slash so :
> 
> That's exactly why I added a trailing slash :-)

The web interface does however report this as the URL:

 https://gitlab.freedesktop.org/camera/libcamera.git

without the slash, and cloning that doesn't redirect to one /with/ a
slash.

Personally I wouldn't add it - but it's harmless either way.

--
Kieran

> 
> > Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > >  LIBCAMERA_VERSION = v0.7.1
> > >  LIBCAMERA_SITE_METHOD = git
> > >  LIBCAMERA_DEPENDENCIES = \
> > > 
> > > base-commit: 6854ee9aa3826d5036a7d3cc19056d43c0452320
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
