Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24F0C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 16:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4A0831F2;
	Wed,  5 Feb 2025 16:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0t8iPDx0Yoj7; Wed,  5 Feb 2025 16:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB6E8399E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB6E8399E;
	Wed,  5 Feb 2025 16:59:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F6E112F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FDD5831F2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbhvD7ps-aWM for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 16:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0719D8399E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0719D8399E
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0719D8399E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:59:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so7651666b.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 08:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738774746; x=1739379546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGB3wp5tCgzAja0K9YsUCWLX3zv3hkMUmxxTmmx9vEg=;
 b=mVF06zbnqCXeU5byGpP9cejiylYxQD1TR9H+9AYseCSlsdRhWeU+C9pOSlm6kIcG96
 gRustJSioQO00JRQUrThoyT+y+MdxvoXXrerZ6FSVMXUqbPiw8ckZVJHZ8+kSGVwAdVD
 S84mKHQsJRfKq4loCsQe5BCnoQLmdFU3+HZl9Di1jYrsOMGWp8IiDgXhBklH82vTT7BY
 mLY038sezQ7T0w+PgBFYJbwE3URfAP16BepU7bvh/UkpTHmwCq+DigDkmIfHy2Kds6EC
 tRc7yVUOPiw0Y69NeT/5SDDPN6iPOU/m5PMq42SLsSgu1DftZ9MuQYpe3IQ23vobrf49
 TDeQ==
X-Gm-Message-State: AOJu0Yym63ozRJpMy7lxJvx3zoex0Shr/bg3k0FQKXz9JParc1Oc0kux
 TWi+8seEH8AsSg20Iruothg8S+uK+S9AvWtbAe8YuXq020tZ+vrsNe5kwLnWwIRg/HFnf6EhPHo
 GiV+S4ldxTHJjQ8EvqhDTb4HuBMz577m5dury
X-Gm-Gg: ASbGncuNUbth68eMh8RlwiX350+yLyJvdpNfthLyIeqSe+df5O7QmzijEB1isOY6UYl
 aG+IOZ5QU4xi5otqQk3tAusLv0icTmuEi9Xz/OYFoNuwvn0T1iCB2OiBK5ixAwxYrJxlKU9E=
X-Google-Smtp-Source: AGHT+IGTd+96kv+urcC8WXV3jHOMaw3Ki8btNWl5tDoWj9TLQ/c4PCK7c22ZK2FWwOfetlManhAxU2fIZULExgej524=
X-Received: by 2002:a17:907:d14:b0:ab6:d400:354b with SMTP id
 a640c23a62f3a-ab75e379d79mr376949666b.53.1738774745797; Wed, 05 Feb 2025
 08:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20250127215356.3175741-1-mmayer@broadcom.com>
 <20250128220920.535ecc14@windsurf>
In-Reply-To: <20250128220920.535ecc14@windsurf>
Date: Wed, 5 Feb 2025 08:58:53 -0800
X-Gm-Features: AWEUYZlHlaGvGDsbph1pQHf5X8LjCX1EqD0I8S2VnHH63nPcaiIdL1D6_MIFg7g
Message-ID: <CAGt4E5sXA0fiKwYyRummys2Mi+p1sQDG9RQzJNM7g5zSBJcyCQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Markus Mayer via buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1738774746; x=1739379546; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aGB3wp5tCgzAja0K9YsUCWLX3zv3hkMUmxxTmmx9vEg=;
 b=BsHxR6WP9Enw0oaNHUjuoqt8w4EPIbcxu7WNw67bSHSUiDQQitPq8juy77LXCHpASz
 TcnIayIDaG6XXlF8q6kHl8akdTvr6XGQ31M77jsedw786LZFhc5uBmdM3FF1HlxyOKJV
 nyUKzG0o7yhrUu/QnqIk5kiJktEnbouExuZnM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=BsHxR6WP
Subject: Re: [Buildroot] [PATCH] support/scripts/apply-patches.sh: introduce
 envvar BR_PATCH_ARGS
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Re-sending, because I just realized the original response (sent on
January 29) didn't go to the mailing list. That was not intentional.

Here goes...

On Tue, 28 Jan 2025 at 13:09, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Markus,
>
> On Mon, 27 Jan 2025 13:53:54 -0800
> Markus Mayer via buildroot <buildroot@buildroot.org> wrote:
>
> > Introduce the environment variable BR_PATCH_ARGS as a means for the
> > caller to pass additional arguments to the patch(1) command. These
> > arguments can be new arguments not originally used -- or they can
> > override one of the default arguments.
> >
> > In addition, provide a mechanism to add patch parameters on a
> > per-package basis using the <PACKAGENAME>_PATCH_ARGS makefile variable,
> > for example "PROCPS_NG_PATCH_ARGS". This allows individual packages to
> > specify extra arguments or override defaults while not affecting any
> > other part of the build environment.
>
> Thanks for the proposed patch. Do you have some details on the actual
> (not theoretical) use-case(s) ?
>
> Thanks a lot!

When we are building our root file systems, we sometimes have to
bundle older versions of certain packages or we want to apply patches
that are being reviewed upstream without having been accepted and we
want to use the same patch for different versions of a package, say
procps-ng or xfsprogs. Under such circumstances, life becomes a lot
easier if you can tell "patch" to use more fuzz when applying a patch
as it'll apply over a wider range of versions while allowing you to
only track a single patch file.

So I can say
    PROCPS_NG_PATCH_ARGS = -F2
and then it'll use "-F2" while applying these patches, but it is
limited to procps-ng and won't cause any side-effects elsewhere.

This is a fairly specific application of this feature that others may
not need quite in this manner, but it can be used in a very generic
way to address different issues. I figured a facility like this might
be helpful to other users as well for this reason.

It can also come in handy for Buildroot as a whole if a version
upgrade or the introduction of a new patch for one of the existing
packages were to suddenly require more fine-tuned parameters for
applying patches.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
