Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DA8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF64C61053
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF64C61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C1EB60F32;
	Wed,  6 Oct 2021 19:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPk2SoFGhT37; Wed,  6 Oct 2021 19:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C2060F30;
	Wed,  6 Oct 2021 19:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 130F31BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 001BB40912
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEepKyLpRjTh for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:56:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C921408CB
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:56:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a11c:d3e8:9e5:2853])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 23D27780304;
 Wed,  6 Oct 2021 21:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633550188;
 bh=9fHhHsbyMNh134GYt3rwI8VX0JuQ4qPHgbEYmfG/APw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lAooTNdRWjgIGk6fKYFJx1JdRXj/eU5nBsDHFKLs9YuZCgloHc2A1wBu628rUo8sf
 DTus4ZJaOGcb+UKqJdMU2d9iAYcCHsy+tJJQrl9T944D8oxvfjYy6x56D+mELRWib2
 mysExFmTzcoG0Ihtu4VnaEuJYCjRDm62xUUBGHY8HnJ2FXOQu/P7PepP9OV/Pr3zg5
 IAWgh4eoW0w3wTudxTXAWl67kFKx/mneOpL0ivSSqf8qLuXvEtYn5zwIEl5M3qmiyF
 1xZAEPei8ebT+n0MToJ/RV9Pp0UCXvpABp5NyHvWy3i4tjw2CZA6RI75k0m37pTmkE
 rUPuGo3DI/HCg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 06 Oct 2021 21:56:23 +0200
Date: Wed, 6 Oct 2021 21:56:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20211006195623.GF2081069@scaer>
References: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py:
 prevent the commands from wrapping
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

Edgar, All,

On 2021-10-05 19:17 +0200, Edgar Bonet spake thusly:
> Traditional VT-10x terminals (and their emulators) have a "magic

I've added a reference to https://vt100.net/docs/vt100-ug/chapter3.html,
and...

> margins" feature that enables the last character position to be updated
> without scrolling the screen: whenever a character is printed on the
> last column, the cursor stays over the character, instead of moving to
> the next line.
> 
> The Busybox shell, ash, attempts to defeat this feature by printing
> CF,LF right after echoing a character to the last column.[1] This

... I fixed s/CF/CR/ here, then applied to master, thanks.

Regards,
Yann E. MORIN.

> doesn't play well with emulator.py. The run() method of the Emulator
> class captures the output of the emulated system and assumes the first
> line it reads is the echo of the command, and all subsequent lines are
> the command's output. If the line made by the command + shell prompt is
> longer than 80 characters, then it is echoed as two or more lines, and
> all but the first one are mistaken for the command's output.
> 
> We fix this by telling the emulated system that we are using an
> ultra-wide terminal with 29999 columns. Larger values would be ignored
> and replaced by the default, namely 80 columns.[2]
> 
> [1] https://git.busybox.net/busybox/tree/libbb/lineedit.c?h=1_34_0#n412
> [2] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_34_0#n258
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Co-authored-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/testing/infra/emulator.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> Note that I tested that the command
> 
>     stty columns 29999
> 
> does fix the wrapping behavior on an actual board, while using a serial
> connection. I did not test the script emulator.py, as I am unfamiliar
> with the testing infrastructure. Would someone volunteer to do that
> test?
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index 0a77eb80fc..f1f5eac3a8 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -100,6 +100,8 @@ class Emulator(object):
>          if index != 0:
>              raise SystemError("Cannot login")
>          self.run("dmesg -n 1")
> +        # Prevent the shell from wrapping the commands at 80 columns.
> +        self.run("stty columns 29999")
>  
>      # Run the given 'cmd' with a 'timeout' on the target
>      # return a tuple (output, exit_code)
> -- 
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
