Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B628C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 09:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FB74032B;
	Thu, 12 Jan 2023 09:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FB74032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9nLPYsJKaIc; Thu, 12 Jan 2023 09:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F6E340323;
	Thu, 12 Jan 2023 09:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6E340323
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 797F51BF3DB
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 09:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61F5E40184
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 09:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F5E40184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39y5GP-4NbKE for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 09:47:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E8A400D6
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89E8A400D6
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 09:47:41 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id pa22so9002766qkn.9
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 01:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTISwTVq8FN88+sb04EVMvjM9+//Ys3svvjIA/qieGE=;
 b=TRDpOAK3M+agokvEovmrZIXgYv5bJHw9k1aQX8rrb6I7rJV5XK99USIpqBH2uM+GnX
 Ck3bi4NFixaKfsA67tPNjv+lD8polwtY48huAtjUpniDp/4cwOddBqEq4UPQv+ervMF+
 XmFbGCjb75TbxAYoyLPcIlebmeGLYjQQ8irI6goD2AeFtvyyLzzttU+dgZataGC+DhvX
 KBJJFczr7qLxm1lxpqIrkITIxaaE5YpUVfg0/HWGSc7Sdfu/QsQeOlgxDnZ4paqg8yRx
 eC21q3wQLzpUGXg9E/f57W4Bqsqls4MOpYJUpRGFEPJT15A7/KUXZbOMLWqyl6dPvNAX
 VkRQ==
X-Gm-Message-State: AFqh2koKpaZCtoewD8PIyOzc41ehzygCz4vM8e/YS1WXMdBrBfO4o09c
 /dFZeFfGpdvirK6ToRESEXZOJ2+/D9oPYRJ0TOPj3HQGbSY=
X-Google-Smtp-Source: AMrXdXs5R+bAoK7VLbLV+5TRKNdxuuVYueYw8NtC8sMvcIlvCkSSf8ntE3XVWtAuMw1hTW/NyScLOkm3sCV8ZL3/nWw=
X-Received: by 2002:a05:620a:81b:b0:705:ab02:d960 with SMTP id
 s27-20020a05620a081b00b00705ab02d960mr746361qks.539.1673516860166; Thu, 12
 Jan 2023 01:47:40 -0800 (PST)
MIME-Version: 1.0
References: <CADYdroM5e4W64FXRMK9QUGXrcBOLBRUiyursiPW7mjP6bs9KdQ@mail.gmail.com>
 <CADvTj4qpHEZ+2Wmr+3e85x0YMeMfN3FPjhZ9BSqYHs3K9rYk6Q@mail.gmail.com>
In-Reply-To: <CADvTj4qpHEZ+2Wmr+3e85x0YMeMfN3FPjhZ9BSqYHs3K9rYk6Q@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 12 Jan 2023 10:47:29 +0100
Message-ID: <CADYdroM_3pdsFH5w7cAhdGVD2jOt-Y5QOtkyASJuG-f4YiYqGg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sTISwTVq8FN88+sb04EVMvjM9+//Ys3svvjIA/qieGE=;
 b=qxqMat4JtxTcE+jdhIe1VSrdjyi8pPizMF/wZakY7rHYgcEHXp98w4vz0JGyB48KQw
 lxUlrDeWmeZrcGW63QlB7vw1iwVnaI8b8VgNZP+W24YBqVMw6a1c27z1qZuP3ckV1wNG
 yVMTe/xo2bLb/Fwro2kFIeXzsyLB5LJugM3Mp3s/RFwcG0jzPdUdLs7jKX4jm1pavDxU
 n6fTrzbQeKN6e1Rwv3KoHlLv2/71hhfiv2L1CTPTP2uSmAE7MhwogNyGCyoNbGjiq5Uc
 LIlzvYI7J0NNQGEYTo+7Y0X2TCbcucRF1nAFumlBxG0o990RGM+FltMJ+3jVvI6KTxMg
 gQHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qxqMat4J
Subject: Re: [Buildroot] [PATCH v2 1/2] package/cmake: disable ccache for
 host-cmake
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Do., 12. Jan. 2023 um 01:30 Uhr schrieb James Hilliard
<james.hilliard1@gmail.com>:
>
> On Wed, Jan 11, 2023 at 2:36 PM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Hi,
> >
> > Wouldnt a way simpler method be to just prepare a wrapper in $(HOST_DIR)/bin/ccache ?
>
> Seems more complex to me than just forcing noccache in the opts.

Its simpler because it wont affect multiple packages now or whenever
ccache's dependencies change.

>
> >
> > #!/bin/sh
> > exec "$@"
> >
> > (Or a bit more sophisticated: try finding and using a system installed ccache first)
> >
> > When host-ccache is installed, the wrapper will be replaced.
>
> There may be compatibility issues between buildroot's ccache and a host
> ccache so I don't think we want to use a system ccache normally.

There schouldn't be, at most you will not find hits between them [1].

Regards, Norbert

[1] - https://github.com/ccache/ccache/discussions/923
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
