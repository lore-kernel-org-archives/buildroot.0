Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C57EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 11:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B89C81AF6;
	Mon,  3 Jan 2022 11:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkF2K5dFjKab; Mon,  3 Jan 2022 11:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 547EF81A39;
	Mon,  3 Jan 2022 11:29:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D67D1BF341
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 11:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E92404F9
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 11:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6fwnCsQjkM7 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 11:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BDEB40103
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 11:29:24 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id g80so54311154ybf.0
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 03:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+dQ7KP0LjgvibWKnC9IoAxbTo1ueMIo56+kcrM5bV2o=;
 b=Y+Y7MGAIQriv6dGRE3EsdzUH0YDZY/2XICbMJhgNp8EWnseWnf6scxkTASvTHSFGUI
 EEeppvnVjOPpluCzBnaCGRjII5BTicPluWXkXT3+bVb89pZz7/BQedKcGndSH4VUg9fr
 VyrYWoKXKAs0AcI4ZTU34og+NRVpfYNnQBAGiiUlsQlCq7gz1JawH9UpF/vwH9YjtNVE
 Hb0TdwvP81CuMOPy9aN1afKWfPpfHvfGftPYxA7kxtU0WUCHDL7xqhOX7+ht5iJJ2Q3U
 19Zo8bwnhucvvE4arqny0wZAtk1fbvePKeltEkkDQ0j47mlx7k+JKv4cSGrwbLkB00h2
 o49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+dQ7KP0LjgvibWKnC9IoAxbTo1ueMIo56+kcrM5bV2o=;
 b=PQ3EcnIW/xYdXXfA6On1Sb3oreFhpHrAtcinfPUahQHo4BeEfW5krSYDAlZq3sgCJw
 ZMpZdtuz8XVL6rsWMBR/5+N3qeg6cyLJwqypeQ375JWOVq1XDlGDJvT9HLEsFf+NtZU1
 ZzmX4IA4Xi3Gbo+OxFCdliobVvWG91qJX2sCJG90Vz9gPvg8e5R228OGaqV9VZIjPYqg
 I+jImrQJGjLbx2ydMYmFvvabYFzewDQVOIpzUXFD52z73wDmiNpo1DyKkCQmP745Zduv
 mJyPU1g8LfXXgm24SX1E5yxn5pt2mjIFZXEz3sf9F3ws85hRu1DBR1W28QDXxZTyVKXT
 bvWg==
X-Gm-Message-State: AOAM530S2LK+fd79UtTDplooZUmjbZANi8kQyEUxqJTWZwmXMSwiVphf
 tjttVtAHW0NDwzLMDF422G+64sLjS/2oWcFH13iwpthQ5sA=
X-Google-Smtp-Source: ABdhPJw/kN7Fb9ORI7Lc2zLsrUDP0dcf9AUsCL2yxTSLHKCQgBEw1sNBUbmvE6i1sZ+aRjkh/47JIOPeFgDXZukNaLE=
X-Received: by 2002:a25:aacd:: with SMTP id t71mr38001619ybi.542.1641209363202; 
 Mon, 03 Jan 2022 03:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20211214125510.13654-1-andreynech@gmail.com>
 <20211230214722.GJ3390456@scaer>
In-Reply-To: <20211230214722.GJ3390456@scaer>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 3 Jan 2022 12:29:11 +0100
Message-ID: <CAOiXNkAh6ZQhbkX=d1Z3LaGFTZ0LP=wCwvutuCSCdyExy4LFdA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/: remove -E flag from
 patch call
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

>> -E flag instructs patch to remove empty files. However, in some cases
>> empty files are essential. If they are missing, build could be broken
>> or other bad things can happen.
>
> Do you have an example of a publicly accessible package that has this
> issue?

No I have not. In my case this is not a mainlined driver for the touch
controller provided by the display manufacturer.

> So we have an antagonist situation: some patches will want to rem ove
> files, and some patches will want to not remove files. We can't satisfy
> both, obviously.
>
> So, unfortunately, it is not possible to apply your patch.

I understand your concern. So it sounds like a need for configurability
here.

> Unless someone comes up with a better idea...

Not sure if it is a good idea, but maybe the problem could be solved using
series files? Currently, there is already -p1 parameter which could be
specified in the series files. Brief look at the relevant part of the
apply-patches.sh reveals that it is ignored :-) but it could be changed.
After that, the script can walk through patch directories where patches with
+++ /dev/null are found, generate or update series files to use the -E flag
together with -p1. This solution would not break existing packages and
provide flexibility for the new packages where developers can decide whether
to add -E (or maybe some other flags) to patch invocation using series
files.

What do you think about it?

Best regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
