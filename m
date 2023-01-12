Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77232C46467
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 00:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA01360B3C;
	Thu, 12 Jan 2023 00:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA01360B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7UWwsfcD-aG; Thu, 12 Jan 2023 00:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E0260AD6;
	Thu, 12 Jan 2023 00:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E0260AD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A33991BF3AD
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 00:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76023416EA
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 00:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76023416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rpVBfNkifet for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 00:30:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DA3416D8
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37DA3416D8
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 00:30:42 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-142b72a728fso17326647fac.9
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 16:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tRe+d4zHgoq6GTf9s9zJdBFVrZiC+BqPK4b5cnuJuuE=;
 b=bauN6K04F2jQG708EnZMRIDXx1rEcjUfFVYm8T19O1dcSprTGOuhHaQBwEZmEmg6K5
 z7I2WGz+xuZ2acfrQFTzXWLTv2IZBgxakfn7j2b0Fnwu/b1wEYOPymNT+V56onEbcUVF
 DNP4fmu/fzgda9N8yHkGE1+a7QIIkbKACamQvfs0Vf5BZXJ3jMrTu99d4XsvOj11JZhw
 DXQ+j1dwwm2MWgNow7oPn2c3V2fQkBvwVdznGdOfjikguPB7WoD2vveCwZsd0qmDacg6
 AAFkS40Vpbr+CueRp2uFb0L0zQ8UYgjnWsIbC7PWMGHaYcgJILihFQMlxv25XJ0i4x0e
 jNPw==
X-Gm-Message-State: AFqh2kqS8+2yCM3p8lNKG0Eq2/6+eTfnowT8e3pFiTHWAkixddzeLb31
 oM9Kk63AHernAEB/ASltF4OWFm/6Wylmh+c3x2Q=
X-Google-Smtp-Source: AMrXdXsypNEA+bhyH+Vndru856ORWMPPJVNMksqbtQjNQ/jg+MgvjTRbdBZDuGVn3Ihij8ZzQAzqjoH7TNU4yw6nXtQ=
X-Received: by 2002:a05:6870:8304:b0:144:9744:2be3 with SMTP id
 p4-20020a056870830400b0014497442be3mr3740740oae.93.1673483441048; Wed, 11 Jan
 2023 16:30:41 -0800 (PST)
MIME-Version: 1.0
References: <CADYdroM5e4W64FXRMK9QUGXrcBOLBRUiyursiPW7mjP6bs9KdQ@mail.gmail.com>
In-Reply-To: <CADYdroM5e4W64FXRMK9QUGXrcBOLBRUiyursiPW7mjP6bs9KdQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Jan 2023 17:30:29 -0700
Message-ID: <CADvTj4qpHEZ+2Wmr+3e85x0YMeMfN3FPjhZ9BSqYHs3K9rYk6Q@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tRe+d4zHgoq6GTf9s9zJdBFVrZiC+BqPK4b5cnuJuuE=;
 b=ho0l6SRCBTfyGMy5k+dqHvZFF84jLMRT8eWqJJBHEYrX7IEyZMMib1Dmv5bLURPJiR
 3gDYP5V6BHoEOKHCdlTIv4mdlDaBvJmeZPKkkG1RDJ3arjsU3MTBuYPIB/ZW8KxV6nvD
 rrjUdLBvY3d1LYh9rwUFgY13PHSs0fCKnEh9MnjehDUbr/9LQLTaDrbFZ4/5ntX7D1ZI
 Hvl4XocYmwjOhuRXkKdbimPoYKepZQb97Y9OVe4h12IpSgtILMzESTXl4Blhmy3KB7hU
 SVN2sz8xQlxhvd/z/mrENXo2/cOsuvbcpl6ju4bU+yAeH3o0tRoW6LELGgRXOXcnltxW
 4Jwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ho0l6SRC
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

On Wed, Jan 11, 2023 at 2:36 PM Norbert Lange <nolange79@gmail.com> wrote:
>
> Hi,
>
> Wouldnt a way simpler method be to just prepare a wrapper in $(HOST_DIR)/bin/ccache ?

Seems more complex to me than just forcing noccache in the opts.

>
> #!/bin/sh
> exec "$@"
>
> (Or a bit more sophisticated: try finding and using a system installed ccache first)
>
> When host-ccache is installed, the wrapper will be replaced.

There may be compatibility issues between buildroot's ccache and a host
ccache so I don't think we want to use a system ccache normally.

>
> Regards, Norbert
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
