Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192ACCEF152
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 11:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB91240AD8;
	Tue,  8 Oct 2024 11:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmCR3bkEpQpY; Tue,  8 Oct 2024 11:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713E540AC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 713E540AC9;
	Tue,  8 Oct 2024 11:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A86791BF3EB
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 11:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96C6780F80
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 11:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk8X9ptWWGa8 for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 11:40:17 +0000 (UTC)
X-Greylist: delayed 374 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Oct 2024 11:40:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1DD580F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DD580F7C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1DD580F7C
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 11:40:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E44103D6;
 Tue,  8 Oct 2024 13:32:23 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <Zp9WhgqZZdj_etR-@gmail.com>
References: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
 <172164155656.2376022.12341161125478720243@ping.linuxembedded.co.uk>
 <Zp9WhgqZZdj_etR-@gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: buildroot@buildroot.org
Date: Tue, 08 Oct 2024 12:33:57 +0100
Message-ID: <172838723775.532453.9517032522765059116@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1728387144;
 bh=aQssly3c3ccAqFr5hLGYaYftfaQHVw0SOqZ8eMqtJYY=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=h3JIDf0nBStOVVV5h+KAHn8jPqhCUVvF2Kh5Hs5zoe17j8nrmFQJJ4k13c5beE9Sb
 sJU9faKa1ZmLBya+XCjSveyIU0BaabCSedyDrhT7AQEHF0Um/uxwyISCu0o6vZwkDB
 ZOWtyY9qRJlRYvC0SPDjdxYfLfjdmmp+NcTF9O5M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=h3JIDf0n
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: Enable python bindings
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Quoting Marcus Folkesson (2024-07-23 08:06:46)
> Hi Kieran,
> 
> On Mon, Jul 22, 2024 at 10:45:56AM +0100, Kieran Bingham wrote:
> > Hi Marcus,
> > 
> > Quoting Kieran Bingham (2024-06-20 14:49:59)
> > > Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
> > > pybind11"), merged before libcamera v0.1.0, libcamera has no longer
> > > relied on an external subproject branch of pybind to build the python
> > > bindings.
> > > 
> > > Provide a new package option to allow enabling the python bindings on
> > > libcamera when python3 is available in the buildroot configuration.
> > > Enabling the python bindings will select and bring in pybind as a
> > > dependency.
> > 
> > Sorry for not adding you to Cc on the first send.
> > Could you review or test this patch for me please?
> 
> No worries!
> 
> > 
> > --
> > Regards
> > 
> > Kieran
> > 
> > > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > ---
> > >  package/libcamera/Config.in    | 7 +++++++
> > >  package/libcamera/libcamera.mk | 8 +++++++-
> > >  2 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> > > index e84b8d342eea..4699e382c760 100644
> > > --- a/package/libcamera/Config.in
> > > +++ b/package/libcamera/Config.in
> > > @@ -24,6 +24,13 @@ menuconfig BR2_PACKAGE_LIBCAMERA
> > >  
> > >  if BR2_PACKAGE_LIBCAMERA
> > >  
> > > +config BR2_PACKAGE_LIBCAMERA_PYTHON
> > > +       bool "python bindings"
> > > +       depends on BR2_PACKAGE_PYTHON3
> > > +       select BR2_PACKAGE_PYTHON_PYBIND
> > > +       help
> > > +         Enable libcamera python bindings
> > > +
> > >  config BR2_PACKAGE_LIBCAMERA_V4L2
> > >         bool "libcamera v4l2 compatibility layer"
> > >         help
> > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > index dfcd340b75a0..100934a97d6f 100644
> > > --- a/package/libcamera/libcamera.mk
> > > +++ b/package/libcamera/libcamera.mk
> > > @@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS = \
> > >         -Dandroid=disabled \
> > >         -Ddocumentation=disabled \
> > >         -Dtest=false \
> > > -       -Dpycamera=disabled \
> > >         -Dwerror=false
> > >  LIBCAMERA_INSTALL_STAGING = YES
> > >  LIBCAMERA_LICENSE = \
> > > @@ -45,6 +44,13 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
> > >  LIBCAMERA_CXXFLAGS = -faligned-new
> > >  endif
> > >  
> > > +ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
> > > +LIBCAMERA_DEPENDENCIES += python3 python-pybind
> > > +LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
> > > +else
> > > +LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
> > > +endif
> > > +
> > >  ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
> > >  LIBCAMERA_CONF_OPTS += -Dv4l2=true
> > >  else
> > > -- 
> > > 2.34.1
> > >
> 
> LGTM.
> I've currently no hardware available to test it, but at least it
> seems to build as it should.
> 
> Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Could this patch be collected please? It enables Python bindings for
libcamera, and we now have visualisation tools (camshark) which uses
them.

Camshark does not need to be packaged in buildroot, it's just a
tool to run on the host directly.

--
Kieran
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
