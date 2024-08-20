Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6B3C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB2B640474;
	Tue, 20 Aug 2024 21:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynK08OmP1ie5; Tue, 20 Aug 2024 21:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7754540B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7754540B38;
	Tue, 20 Aug 2024 21:32:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCBCF1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C1E40B38
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hz48SGSZ2BWG for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 538A140474
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 538A140474
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 538A140474
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:32:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE1921BF204;
 Tue, 20 Aug 2024 21:32:51 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:32:50 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240820233250.3293444a@windsurf>
In-Reply-To: <ZsUKCVcZheIlzo00@landeda>
References: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de> <ZsUKCVcZheIlzo00@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iyiz+tuZgRWP4l1Tdl+ZSRrkKLsBTvtAgffIGpkdyZI=;
 b=Bzj5QJ2BfnRUyMq73XyV0yPvfk6KHyDCNUM3vpWY3zYepzEbBcnaqWECLQGiPYlIw2upuf
 Ki+BKO9O+Ef+JtKlYn53UjeAvQXaKdzRIftcM2f4+adNYlpq15YW2k3ycO+8AuesHHJ9Qb
 tqm0AtM43BcSiJEMtHqtFqAh5xLAMjH2nT4X9iJn2eR940mh6Sr45viS1TRr3YrCNObYWn
 EQ4+krc27OSfHynHZptg+CQ6FMe8PqZ8hLFsd5a4am9R1mdopT/or7waOvCKtBw95o+P8E
 XB0GdrxjEUwhG17qFQF0os65O8FZuPssjVB6vpZl1kcOztJzVJb9DHrojTwIFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bzj5QJ2B
Subject: Re: [Buildroot] [PATCH] package/docker-engine: fix runtime problem
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 23:26:33 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2024-08-20 17:44 +0200, Waldemar Brodkorb spake thusly:
> > When starting a container you get:
> > # docker run nginx
> > docker0: port 1(veth7743781) entered blocking state
> > docker0: port 1(veth7743781) entered disabled state
> > veth7743781: entered allmulticast mode
> > veth7743781: entered promiscuous mode
> > docker0: port 1(veth7743781) entered disabled state
> > veth7743781 (unregistering): left allmulticast mode
> > veth7743781 (unregistering): left promiscuous mode
> > docker0: port 1(veth7743781) entered disabled state
> > docker: Error response from daemon: failed to create task for
> > container: failed to create shim task: OCI runtime create failed:
> > error opening file `/proc/self/uid_map`: No such file or directory: unknown.
> > 
> > Add the missing kernel module to allow starting containers.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/docker-engine/docker-engine.mk | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> > index 268b851520..baec32d79d 100644
> > --- a/package/docker-engine/docker-engine.mk
> > +++ b/package/docker-engine/docker-engine.mk
> > @@ -106,6 +106,7 @@ define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
> >  	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
> >  	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
> >  	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
> > +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)  
> 
> As far as I can see, this is an optional feature, and is not strictly
> required:
> 
>     https://github.com/moby/moby/blob/master/contrib/check-config.sh#L235
> 
> So I don't think we should forecfully enable it.

On the other hand, Waldemar is encountering the issue while doing a
simple "docker run <container>", which seems to be like the most basic
thing you would want to do with docker. So if CONFIG_USER_NS is needed
for something as basic as starting up a container, I believe it's not
really an optional feature?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
