Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9EEC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 16:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A7C81DA0;
	Fri, 17 May 2024 16:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBJxYaDynjPz; Fri, 17 May 2024 16:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B1F081E63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1F081E63;
	Fri, 17 May 2024 16:26:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEE5F1BF2B1
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC06B40A75
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjP75lcb17oH for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 16:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B993B40A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B993B40A53
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B993B40A53
 for <buildroot@buildroot.org>; Fri, 17 May 2024 16:26:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6593661A47;
 Fri, 17 May 2024 16:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F5CC2BD10;
 Fri, 17 May 2024 16:26:23 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 17 May 2024 19:26:21 +0300
Message-Id: <D1C26IZLPV1K.LQZATW5DOF82@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: aerc 0.17.0
References: <20240517132039.7124-1-jarkko@kernel.org>
 <20240517132039.7124-3-jarkko@kernel.org> <Zkdd9AYOR-flnKmX@landeda>
In-Reply-To: <Zkdd9AYOR-flnKmX@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715963184;
 bh=4PXhWkR1XfVtCTStnooh0RRQn9/9+eLZcoBWtNCSR94=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=Xu60uqtZwxZ6oGwTW+Bzu1vCO9YUvfnc4K0uH/aaMoRD7JtDzc4xA3tRcXEmaQKQF
 D1DWvRmAmyt9QSUZeiK+pPt2X6Kr7XcigvLX2GNa0b17nio9jUagzSIREr+w/v2NDe
 /xhIge8+/UysGcC21HhzSg0xQ4Z8OROKimUh8Z7B7WCWWW2j0HT217VlWFSdmVah8F
 QDJi91QkgVRYLYurTt13fo196qkFTTA4PG8BP6QiFaBwTu0PCjK0FNftrPjtrwVhaX
 jcxSqh6lWhqniqjmhFt9rraq/sN0yD2row8Rc3hRIfPsqvrJIb932I0t/6pzSE8Wo4
 hpdZyL3vXqsUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Xu60uqtZ
Subject: Re: [Buildroot] [PATCH 2/4] package/json-glib: add host build
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri May 17, 2024 at 4:39 PM EEST, Yann E. MORIN wrote:
> Jarkko, All,
>
> Thanks for these patches; please find comments below.
>
> On 2024-05-17 16:20 +0300, Jarkko Sakkinen spake thusly:
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> >  package/json-glib/json-glib.mk | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> > index cd53f24cee..ffdc76f2c1 100644
> > --- a/package/json-glib/json-glib.mk
> > +++ b/package/json-glib/json-glib.mk
> > @@ -18,19 +18,31 @@ JSON_GLIB_DEPENDENCIES = \
> >  	host-pkgconf \
> >  	libglib2
> >  
> > +HOST_JSON_GLIB_DEPENDENCIES = \
> > +	$(HOST_NLS_DEPENDENCIES) \
> > +	host-pkgconf \
> > +	host-libglib2
> > +
> >  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> >  JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
> >  JSON_GLIB_DEPENDENCIES += gobject-introspection
> > +HOST_JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
>
> BR2_PACKAGE_GOBJECT_INTROSPECTION (the condition for this block) is a
> target setting, so it semantically does not make sense to protect the
> host variant with that condition.
>
> Usually, for host variants, we do not have conditional compilation of
> features; either the feature is needed to run on the host, in which case
> we always enable it, or it is not needed, in which case we always
> disable it.
>
> The only case where we would have such an option for such a feature,
> is when the feature needs a lot of dependencies, or time-consuming
> dependencies (e.g. needs LLVM!). GOI is probably a good reasong to
> add such an option, *iff* introspection is needed on the host, which I
> doubt is.
>
> > +HOST_JSON_GLIB_DEPENDENCIES += gobject-introspection
>
> Here, you instruct a host variant to depend on a target variant, which
> is usually not what you intended. And indeed, I believe here you'd need
> a dependency on host-gobject-introspection. I guess it worked ion your
> case, because gobject-introspection has a dependency on
> host-gobject-introspection, so that pulled it in for you. Still, this is
> probably not correct.
>
> So, my proposal would be to always disable GOI unconditionally in the
> host variant, unless there are cases where it is required, in which case
> we always enable it.
>
> Unless there is actually a reason that the host variant has the same
> feature set as the target variant, in which case it should be explained
> in the commit log.
>
> >  else
> >  JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
> > +HOST_JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
> >  endif
> >  
> >  ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> >  JSON_GLIB_CONF_OPTS += -Dnls=enabled
> > +HOST_JSON_GLIB_CONF_OPTS += -Dnls=enabled
> >  else
> >  JSON_GLIB_CONF_OPTS += -Dnls=disabled
> > +HOST_JSON_GLIB_CONF_OPTS += -Dnls=disabled
> >  endif
>
> Ditto: the BR2_SYSTEM_ENABLE_NLS option drives NLS support for the
> target, not for the host. For the host, we assume it is never needed,
> and it is already forcefully disabled in the autotools-package infra:
>     https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-autotools.mk#L196
>
> >  JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> > +HOST_JSON_GLIB_LDFLAGS = $(HOST_LDFLAGS) $(HOST_NLS_LIBS)
>
> HOST_NLS_LIBS is never defined anywhere, so this is basically a noop.
> ;-)

Thanks for the feedback.

I have already patch in my tree to address this, which I will later on
squash to the patch under the review:

https://gitlab.com/jarkkojs/buildroot/-/commits/swtpm

> Regards,
> Yann E. MORIN.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
