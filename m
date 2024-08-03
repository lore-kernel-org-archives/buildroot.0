Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161B0C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4981811C0;
	Sat,  3 Aug 2024 20:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsFdiAjYu1j5; Sat,  3 Aug 2024 20:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E279811B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E279811B8;
	Sat,  3 Aug 2024 20:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6B0D1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 927C84027C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azv7XoW_OZYf for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2B41401ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B41401ED
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2B41401ED
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:57:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E385B240002;
 Sat,  3 Aug 2024 20:57:37 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:57:36 +0200
To: James Knight <james.d.knight@live.com>
Message-ID: <20240803225736.568fb63c@windsurf>
In-Reply-To: <CYYP221MB1140ACF0E0092617169683ECA0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
References: <CYYP221MB1140ACF0E0092617169683ECA0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722718658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVRdSFIoMa+3icFQPjqWCwccCrx2XjJ9mKC8HN3wnwM=;
 b=lgxPwU/CYFfOiUm+mILx+7zpowuk2hwUfNLVKn2gqwgl+ZlPhGx+sDkLgZSrXv1Bym/hI5
 pqcgADnP3uAnfxs390hd8RV/BGhv6v23V1xCYf8j6bLIkcR1VwRJft51Fbe0cg64AR55kx
 rgoG4MsOD6JfAW5ksxnsAFByIIxtWKJTeKl4wQOK4QQp/mJ6/Byz9FNmxGBnLq4arKz9+Q
 PK6fCeoxlFdePcplCYYU9lumCSfabH99Griso+SJ/vRk9GkSpRA+DOLtesz7i2X59c2k07
 a/Mz6+QiHpuTkaAMZBkK2vDoedVW7i6E6yEIiJeyk1Ehm9bQ92tOJs+CccdsCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lgxPwU/C
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/pkg-generic.mk: introduce
 pre/post target finalize hooks
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat,  3 Aug 2024 13:38:32 -0400
James Knight <james.d.knight@live.com> wrote:

> Provides the ability for packages to register hooks in the finalization
> process before and after Buildroot performs its own final target
> changes. The pre-hook (`LIBFOO_TARGET_PRE_FINALIZE_HOOKS`) operates in
> the same manner as `LIBFOO_TARGET_FINALIZE_HOOKS` did before. The newly
> added post-hook (`LIBFOO_TARGET_POST_FINALIZE_HOOKS`) allows packages
> to perform target modifications after Buildroot applies changes such as
> rootfs overlay updates.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> The following is a proposal for adding support for post-finalize hooks
> into the Buildroot framework. Been playing with using external package
> definitions to perform some post-build tweaks to some board
> configurations. While post-build scripts are a great way to perform any
> late-stage target manipulation, it would be nice to be able to define
> packages and register them into the menu system to make it easier to
> re-use shared tweaks across multiple board configuration (versus trying
> to add/stack post-build script paths into each configuration).
> 
> While `LIBFOO_TARGET_FINALIZE_HOOKS` worked for most cases, this occurs
> before Buildroot performs additional finalization changes (e.g. merged
> usr/). It would be nice to allow packages to perform their own
> finalization changes after Buildroot does the bulk of it's own
> finalization, but before post-build scripts are invoked.
> 
> If this change is considered, it appears the `luarocks.mk` package would
> also need to be updated (in addition to manual changes).

Thanks for proposing this. Obviously it raises a number of
questions/comments:

- My initial though was "but pre/post hooks only make sense when they
  are around a well-defined step, like download, extract, build, etc.,
  the target-finalize step is much more loosely defined". But in the
  end, perhaps we can consider target-finalize like a step.

- If we were to have PRE_FINALIZE_HOOKS and POST_FINALIZE_HOOKS, we
  should drop the TARGET_FINALIZE_HOOKS from all packages, otherwise
  the semantic is really unclear.

- Could give a specific example of something that cannot be using the
  existing TARGET_FINALIZE_HOOKS? I'm not talking about a theoretical
  example like "a user may want to...", but a really specific practical
  example you've encountered.

- Also, do we have some evidence that what we're doing as
  TARGET_FINALIZE_HOOKS today cannot be done at the point of the
  POST_FINALIZE_HOOKS that you are adding today?

Basically, I would like some really compelling evidence that we need
both hook points.

Thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
