Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E639DC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F58C80D75;
	Mon, 22 Jul 2024 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnC2wXWclNKm; Mon, 22 Jul 2024 14:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7769A80DB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7769A80DB4;
	Mon, 22 Jul 2024 14:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30F2D1BF286
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 14:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA5440183
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 14:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCS8HzznuTSY for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 14:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.71.1.222;
 helo=relay-b02.edpnet.be; envelope-from=dev.kurt@vandijck-laurijssen.be;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B10340182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B10340182
Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B10340182
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 14:43:10 +0000 (UTC)
X-ASG-Debug-ID: 1721659383-214fdf6fa83aac660001-rUBnyj
Received: from srv21.vandijck-laurijssen.be (77.109.96.193.adsl.dyn.edpnet.net
 [77.109.96.193]) by relay-b02.edpnet.be with ESMTP id fWsW4AypWpVsTL7j;
 Mon, 22 Jul 2024 16:43:03 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Apparent-Source-IP: 77.109.96.193
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be
 [IPv6:fd01::1a1d:eaff:fe02:d339])
 by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 889C85DD677;
 Mon, 22 Jul 2024 16:43:03 +0200 (CEST)
Date: Mon, 22 Jul 2024 16:43:02 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zp5v9gKSn5zhtqS1@x1.vandijck-laurijssen.be>
X-ASG-Orig-Subj: Re: [Buildroot] [PATCH] bcusdk: fix build without libxml
References: <20240612093118.22195-1-dev.kurt@vandijck-laurijssen.be>
 <20240711193311.12331db0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711193311.12331db0@windsurf>
X-Barracuda-Connect: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Start-Time: 1721659383
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 3327
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.127974
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=vandijck-laurijssen.be; s=default; t=1721659383;
 bh=NRXVsQIbegNw0yErdxbimCVy6mpbSD/RVDnGcjTBOcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqYMXEcCa0MwmpDDHW+OhDpkIaLu7TItk2VYIk42XG0P+duFt//bXB9sVoqIIyEdr
 B3gFA/glQB9f3VfRaEHpKO5ZqFyZi9hvB1bkNwnK+TelZy3XwWAGRHLewIKecW4Vf9
 5lVOXTKqqcSpHAg5uw/Uh7BMjURXWCOt7XNywy7MYUpZXynQeFAuu13bFMpq2vugx7
 X5KlKfAoBiJKXW1xYPYNqYqnGxSvPuqx/Z0UKeYjsmtML6aeWaaFAbxHDTnvH0wWUq
 MbQg7JDEOzQu0Z9zaqzajgxdM+lZVuVcffL4UpLbuTioP8sh1NSTi+2CYcXBPb7b69
 yyHNcCVGhWxqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=vandijck-laurijssen.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be
 header.a=rsa-sha256 header.s=default header.b=iqYMXEcC
Subject: Re: [Buildroot] [PATCH] bcusdk: fix build without libxml
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
From: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Reply-To: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey Thomas,

I'll try to address all the build failures.
Unfortunately not very fast.

Regards,
Kurt

On do, 11 jul 2024 19:33:11 +0200, Thomas Petazzoni wrote:
> Hello Kurt,
> 
> On Wed, 12 Jun 2024 11:30:57 +0200
> Kurt Van Dijck via buildroot <buildroot@buildroot.org> wrote:
> 
> > bcusdk is configured without libxml.
> > This commit removes the autotools libxml dependency.
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> 
> Thanks for your patch. However, could you clarify which build failure
> it is fixing? Which Buildroot configuration is broken, which error
> message?
> 
> I don't seem to see any build failure related to this in our
> autobuilders... but there are other build failures related to bcusdk:
> 
>   http://autobuild.buildroot.net/?reason=bcusdk%
> 
> Some more comments below.
> 
> > ---
> >  package/bcusdk/0003-remove-xml-autoconf.patch | 11 +++++++++++
> >  package/bcusdk/bcusdk.mk                      |  2 ++
> >  2 files changed, 13 insertions(+)
> >  create mode 100644 package/bcusdk/0003-remove-xml-autoconf.patch
> > 
> > diff --git a/package/bcusdk/0003-remove-xml-autoconf.patch b/package/bcusdk/0003-remove-xml-autoconf.patch
> > new file mode 100644
> > index 0000000000..33ce45fe12
> > --- /dev/null
> > +++ b/package/bcusdk/0003-remove-xml-autoconf.patch
> 
> We need this patch to be generated with "git format-patch", and to have
> a proper commit message + your Signed-off-by line. I encourage you to
> look at the two other patches in package/bcusdk/ to see the format that
> is expected.
> 
> Also, we expect the patch to be submitted upstream, and the patch to
> carry an Upstream: tag that references the upstream pull request (or
> patch posted to a mailing list).
> 
> > @@ -0,0 +1,11 @@
> > +--- a/configure.in	2024-06-12 11:20:16.800828493 +0200
> > ++++ b/configure.in	2024-06-12 11:18:19.275693151 +0200
> > +@@ -81,7 +81,7 @@
> > + 
> > + if test x$onlyeibd = xfalse ; then
> > + 
> > +-AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
> > ++#AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
> 
> Don't comment code, remove it entirely. But you need to clarify in the
> commit message why it is not needed.
> 
> > + AC_PATH_PROG(TAS,[m68hc05-as],,[$PATH:$bindir:$prefix/bin])
> > + AC_PATH_PROG(TLD,[m68hc05-ld],,[$PATH:$bindir:$prefix/bin])
> > + AC_PATH_PROG(TAR,[m68hc05-ar],,[$PATH:$bindir:$prefix/bin])
> > diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
> > index f14b23c7cc..c572df725d 100644
> > --- a/package/bcusdk/bcusdk.mk
> > +++ b/package/bcusdk/bcusdk.mk
> > @@ -23,6 +23,8 @@ BCUSDK_CONF_OPTS = \
> >  
> >  BCUSDK_DEPENDENCIES = libpthsem
> >  
> > +BCUSDK_AUTORECONF=YES
> 
> We need a comment above that explains why autoreconf is needed. Usually
> just the patch file name is enough. And we need spaces around the =
> sign.
> 
> Could you rework your patch according to those suggestions, and post a
> new iteration?
> 
> And of course, ideally if you could fix the other build failure(s)
> occurring with bcusdk, it would be awesome.
> 
> Thanks a lot!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
