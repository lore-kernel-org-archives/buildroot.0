Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D8C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E93612CE;
	Thu,  9 May 2024 20:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRMcWwFQnafX; Thu,  9 May 2024 20:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D055612DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D055612DC;
	Thu,  9 May 2024 20:37:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 343F41BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E506612DC
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXWhvmwjDBve for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 011C7612CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011C7612CE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 011C7612CE
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:37:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 720E813F89C;
 Thu,  9 May 2024 22:37:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 May 2024 22:37:27 +0200
Date: Thu, 9 May 2024 22:37:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zj00B8A-pgDg5rvn@landeda>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-3-roy.kollen.svendsen@akersolutions.com>
 <20240509164507.4682bee8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509164507.4682bee8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715287055;
 bh=rG/lB4Qe6lqdeVQ8sA/IRc5CeGdm20tUSds/r04QW/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SX4Nixhxc7+1dkLOfE4Uhj0rGgcTZO+eBaNeIeaycdEuvRsApRkaYJUbBB0Ku3y5s
 8KgHfGspVlH2mOsPqf5Wwbl8n94g33au78N5HRLYQ56pW78A2UPUkrIhoygBuqEuhO
 wrHDl8R/j58q1J40WJi93lv7EQeSZi5etZIQCy79uz5c49yQKyxftywgvfDoCrVUcu
 D8WaF/wQLMvtZfGShJc8LFO36mQZtptnOgJXHi2zaMdcK3bYTYDrXt6Cb0McLIC8Ia
 EJVb6GrfpJ770YI4xd9KKRKlaEDBydIfavEvVwt0jtQtnSi84udHFU4XOsFDeAEmfn
 9IdfUr27Dy3Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SX4Nixhx
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Romain Naour <romain.naour@smile.fr>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Roy, All,

On 2024-05-09 16:45 +0200, Thomas Petazzoni via buildroot spake thusly:
[--SNIP--]
> > diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> > index 3b15d40c83..5b598aa938 100644
> > --- a/package/qt6/qt6base/Config.in
> > +++ b/package/qt6/qt6base/Config.in
> > @@ -1,3 +1,6 @@
> > +config BR2_PACKAGE_HOST_QT6BASE_GUI
> > +	bool
> My question to other maintainers: do we want this blind option that
> allows to enable GUI support in the *host* qt6base to be present in the
> Config.in file (normally reserved for options for the target package),
> or do we want a simple Config.in.host, which even if it doesn't have a
> visible option for host-qt6base would carry this blind option allowing
> to enable GUI support in host-qt6base ?

We have a few other host packages that have a no-prompt boolean option,
like dracut, eudev, patchelf, systemd.

The converse is non-existent; we only have ARCH_SUPPORTS for a few host
packages for languages:

    $ git grep -E 'config BR2_PACKAGE_HOST_' -- '*/Config.in'
    package/erlang/Config.in:config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
    package/mono/Config.in:config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
    package/openjdk/Config.in:config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
    package/protobuf/Config.in:config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS

So, yes, I'd rather have BR2_PACKAGE_HOST_QT6BASE_GUI in its own
Config.in.host.

Also, it is a bit weird that this is an option for a host package
without a kconfig symbol for the host package itself...

Also, adding the support for GUI in host qt6base should be in its own
patch, separate from the one introducing qt6shadertools.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
