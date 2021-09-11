Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D79CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C1D6113A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3C1D6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75E841586;
	Sat, 11 Sep 2021 14:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLxc6esSVtrM; Sat, 11 Sep 2021 14:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E802841578;
	Sat, 11 Sep 2021 14:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3CF31BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A4283E80
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKjqKDIvCU0F for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:53:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82B92834F6
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:53:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id h9so10574498ejs.4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3wntBoO5JOrcuDHgqfYkWT+1pve6wRv6/XolpByLOlM=;
 b=AkVuh3oBtx6tDhrUMGBJo009J3sMxB/SdE1Rhnz7U5bgA4udhRw/czTxzt8q2DflIl
 lIoNwaqdzw9TITgwC56c5I+hwYR+Le9ghzZtS0MGjv3TuHEmdkWpqLLryCs2l9YvuPyI
 jFnXKlORhZCGovl06oo6lxii7LzD1DTh0gAGmu4KSZ91QO1yIBwAL3eA+VMhp3dHhHmw
 Jt6rVbs9ERtzWb6R1STZ/bMuR9EHcZWq6PI466fCW+hrpy2EEsruRzSKeSd6wINpWPum
 jEPs3tGVUK68rIlYdwEMecqJD6tns8QIwtfJPIkE5r3QErGqktFVIKTjfiIpstHihiT4
 WDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3wntBoO5JOrcuDHgqfYkWT+1pve6wRv6/XolpByLOlM=;
 b=kXtAyaUABBXmYrrTZYbxtCuWGNqlDvG3l+anYgl3xXSa0SyuOfB/Saxo4xd/ftKmGB
 eDi8PxWJe6FLGNbiGcUhs2MtZA1W0Up/c3F2kFn7A18+3a1Up6kbU3NrrKodUGBH6WuD
 QQ/kachER1VFdR/wxUoy1p+GJAXmdqVASHMeF6MNaWISxyxKlmBOb5xRSxolRqTXoikC
 eqHmMJBEfFU5/nPd0iCWuqlB2n7PvzsoaXH5gWVIfSUi3Va/Xc/1g6+81G0u2/y5vpRp
 g9t81aulG/ZxGgWLTmdEZt5HKugOXgyWPeU2h/yeth6tnUavql7ET3wUlQhogF0gLGp/
 2Ptw==
X-Gm-Message-State: AOAM530TulMhHHOI+6yv1zxh8r3ZsNyrRIkiNnf2ZcAQ2TQG1k4jpYlg
 bAorBztTm8xrxvcHxKF9POtXXA==
X-Google-Smtp-Source: ABdhPJwITAXZ/wdXPp2ZS9e8UdEbSyOwHv/dlN5GeCH5Cg97kx+LZ+my35IH/4fipKQTnfZ0R/eHvw==
X-Received: by 2002:a17:906:1316:: with SMTP id
 w22mr3112913ejb.101.1631372030755; 
 Sat, 11 Sep 2021 07:53:50 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm1043375edf.85.2021.09.11.07.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:53:50 -0700 (PDT)
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210902154359.226148-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4e092084-19bf-a226-501c-8c4a1ed36bcd@mind.be>
Date: Sat, 11 Sep 2021 16:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902154359.226148-1-bernd.kuhls@t-online.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/mc: security bump version to
 4.8.27
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 17:43, Bernd Kuhls wrote:
> Removed patch which was backported from upstream and is now included in
> this release.
> 
> Changelog: https://midnight-commander.org/wiki/NEWS-4.8.27
> 
> Fixes CVE-2021-36370:
> https://mail.gnome.org/archives/mc/2021-August/msg00010.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...FTBFS-against-NCurses-on-OS-X-10-9-5.patch | 32 -------------------
>  package/mc/mc.hash                            |  4 +--
>  package/mc/mc.mk                              |  2 +-
>  3 files changed, 3 insertions(+), 35 deletions(-)
>  delete mode 100644 package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
> 
> diff --git a/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch b/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
> deleted file mode 100644
> index 6dfae52af5..0000000000
> --- a/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ba62dd32add2767d6d13f9abb82f43304418740f Mon Sep 17 00:00:00 2001
> -From: Andrew Borodin <aborodin@vmail.ru>
> -Date: Sun, 24 Jan 2021 14:19:22 +0300
> -Subject: [PATCH] Ticket #4181: FTBFS against NCurses on OS X 10.9.5.
> -
> -lib/tty/tty-ncurses.h: define _XOPEN_SOURCE_EXTENDED to use cchar_t,
> -getcchar(), setcchar().
> -
> -Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
> -[Retrieved from:
> -https://github.com/MidnightCommander/mc/commit/ba62dd32add2767d6d13f9abb82f43304418740f]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - lib/tty/tty-ncurses.h | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
> -index 9962c7c413..d75df9533a 100644
> ---- a/lib/tty/tty-ncurses.h
> -+++ b/lib/tty/tty-ncurses.h
> -@@ -2,6 +2,11 @@
> - #ifndef MC__TTY_NCURSES_H
> - #define MC__TTY_NCURSES_H
> - 
> -+/* for cchar_t, getcchar(), setcchar() */
> -+#ifndef _XOPEN_SOURCE_EXTENDED
> -+#define _XOPEN_SOURCE_EXTENDED
> -+#endif
> -+
> - #ifdef USE_NCURSES
> - #ifdef HAVE_NCURSES_CURSES_H
> - #include <ncurses/curses.h>
> diff --git a/package/mc/mc.hash b/package/mc/mc.hash
> index 63fbfa3213..6400f64b99 100644
> --- a/package/mc/mc.hash
> +++ b/package/mc/mc.hash
> @@ -1,4 +1,4 @@
> -# Hash from http://ftp.midnight-commander.org/mc-4.8.26.sha256
> -sha256  c6deadc50595f2d9a22dc6c299a9f28b393e358346ebf6ca444a8469dc166c27  mc-4.8.26.tar.xz
> +# Hash from http://ftp.midnight-commander.org/mc-4.8.27.sha256
> +sha256  31be59225ffa9920816e9a8b3be0ab225a16d19e4faf46890f25bdffa02a4ff4  mc-4.8.27.tar.xz
>  # sha256 locally computed:
>  sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
> diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> index 50dc50f65e..678d687bcf 100644
> --- a/package/mc/mc.mk
> +++ b/package/mc/mc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MC_VERSION = 4.8.26
> +MC_VERSION = 4.8.27
>  MC_SOURCE = mc-$(MC_VERSION).tar.xz
>  MC_SITE = http://ftp.midnight-commander.org
>  MC_LICENSE = GPL-3.0+
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
