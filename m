Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2394C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 10:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A98740E6D;
	Thu,  9 Jul 2026 10:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDq27_oXOJYM; Thu,  9 Jul 2026 10:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E3040E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783592791;
	bh=IcndNSbD/eGpurWWULeiuN6tL3V6MLgZcberiqRs36w=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RZ8e12Fmz4OqrJDNi9AUTp+1rJt3IO5GFksK5UzWyF5wYwx06QTCV0u4O60V9zteE
	 0jZLNTYhGWwdak/PZUxbv9tEczq3+MzpBesEFO41SxpKsM2eEoQOYxhWEjW3YxIyWM
	 W/uk6g5qwrUlxmKlQLvlSBjVtwKVMBkXws4e5l8a9QnomB6oyWnZDGUfSP7GKlZaa9
	 xGuF5nBAY2GHD5qlSoPfk8+oRKDlT9XGma4L5Ne1Frx2xGUUIw1z07RSk5J/gg4ZGf
	 SdLiPzE0ZAKrkOXEcTliO70ZfjEPLFdR6g9APfIV5Kx/S3K1sacEuZDi4jqAHfJscz
	 A3xbkPvCnvMUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5E3040E8F;
	Thu,  9 Jul 2026 10:26:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD02C315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C9660D58
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJZMjj1ojMYR for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 10:26:28 +0000 (UTC)
X-Greylist: delayed 43725 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Jul 2026 10:26:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE4FC60DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE4FC60DF1
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE4FC60DF1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:26:28 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0125593;
 Thu,  9 Jul 2026 12:25:35 +0200 (CEST)
Date: Thu, 9 Jul 2026 13:26:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 libcamera-devel@lists.libcamera.org
Message-ID: <20260709102624.GB547298@killaraus.ideasonboard.com>
References: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
 <178359239867.2174993.2668122399182615183@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178359239867.2174993.2668122399182615183@ping.linuxembedded.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1783592735;
 bh=+3Eha0gQQPwjLKilCL9v5JdnhQ7KweZ1Tuv0rvsai78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ul/KJVHCIChQ3hp60jfXRu4hci2r82gYxp53JdogwlPUsoCKdTZtRdNvXSaDJ4VbY
 gz/xziR+e/9TzQo5gGVB26wOPDiThkb80/LYKZpfqTXOO2350NVBJ/Z/v1GDcwbh7y
 9ioiqk/2Yn4PxC2tKR3atgZcd2QN+N7w2slx9ElI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=Ul/KJVHC
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

On Thu, Jul 09, 2026 at 11:19:58AM +0100, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2026-07-08 23:35:32)
> > libcamera has moved for a while now to gitlab.freedesktop.org. The
> > mirror on git.linuxtv.org is still active, but it isn't the canonical
> > repository and has less bandwidth than freedesktop.org. Switch the
> > libcamera source URL to gitlab.freedesktop.org.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  package/libcamera/libcamera.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > index 945207888bab..ba7510daf8e1 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> > +LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git/
> 
> Why the trailing slash?
> 
> Though I've just checked and :
>  git clone https://gitlab.freedesktop.org/camera/libcamera.git/
> 
> works as expected,
> 
> Viewing the webpage, drops the .git but cloneing without .git reports
> the following:
> 
> kbingham@Monstersaurus:/tmp$ git clone https://gitlab.freedesktop.org/camera/libcamera
> Cloning into 'libcamera'...
> warning: redirecting to https://gitlab.freedesktop.org/camera/libcamera.git/
> 
> Which has the trailing slash so :

That's exactly why I added a trailing slash :-)

> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> >  LIBCAMERA_VERSION = v0.7.1
> >  LIBCAMERA_SITE_METHOD = git
> >  LIBCAMERA_DEPENDENCIES = \
> > 
> > base-commit: 6854ee9aa3826d5036a7d3cc19056d43c0452320

-- 
Regards,

Laurent Pinchart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
