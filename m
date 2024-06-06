Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E84C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177758105B;
	Thu,  6 Jun 2024 09:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzAbjKa5-w6v; Thu,  6 Jun 2024 09:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 175DC81462
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175DC81462;
	Thu,  6 Jun 2024 09:27:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63F6F1BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5009241871
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBWIfPGlmwB4 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BEF541866
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BEF541866
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BEF541866
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:26:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CA84F13F8C8;
 Thu,  6 Jun 2024 11:26:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 11:26:52 +0200
Date: Thu, 6 Jun 2024 11:26:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGA3CijvG5WPvYh@landeda>
References: <20240605233503.23516-1-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605233503.23516-1-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717666016;
 bh=4LZlPkp4vi2MQBgFdwmXHYAKl4s7ybydT0IliwEzGK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qqo/oruugujkhKMCAUkCaW91kjY1yQUMqVnkoUgUXFbAhfqBn99cMuE4TGqgcF1yH
 bsO2X4EyYtSddEzCWxsVcyYe7bMbZ1tLEiGe2vF/1WIQW/6/GqILYsotIysC6mHfFG
 JZpyNUN/DnWYmfV5HiLDub4t+Ru90InvNCTQa84TuDZ8fIOoykuB2mcqqv6YG0vd5E
 4gehFCrt6UwnE1TVFTEdbsa3oR8p6Nist3YkldaVzPaOl9x21Q6k1ETRxq4wx2nEtD
 OMJKJGEjNbrTiRm2/rlIzts1irJjq8hcoFAApw1hSJpLlluhAJFNrLDMkTBBFx/9SQ
 9Pww3T85EN7Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qqo/oruu
Subject: Re: [Buildroot] [PATCH v7 0/3] swtpm and libtpms host packages
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

Jarkko, All,

On 2024-06-06 02:35 +0300, Jarkko Sakkinen spake thusly:
> Add swtpm and libtpms host packages.
> 
> Jarkko Sakkinen (3):
>   package/json-glib: add host build
>   package/libtpms: add host package
>   package/swtpm: add host package

Series applied to next, thanks. I'll further reply to the last patch.

Regards,
Yann E. MORIN.

>  DEVELOPERS                     |  2 ++
>  package/Config.in.host         |  1 +
>  package/json-glib/json-glib.mk |  6 ++++++
>  package/libtpms/libtpms.hash   |  2 ++
>  package/libtpms/libtpms.mk     | 18 ++++++++++++++++++
>  package/swtpm/Config.in.host   | 11 +++++++++++
>  package/swtpm/swtpm.hash       |  2 ++
>  package/swtpm/swtpm.mk         | 23 +++++++++++++++++++++++
>  8 files changed, 65 insertions(+)
>  create mode 100644 package/libtpms/libtpms.hash
>  create mode 100644 package/libtpms/libtpms.mk
>  create mode 100644 package/swtpm/Config.in.host
>  create mode 100644 package/swtpm/swtpm.hash
>  create mode 100644 package/swtpm/swtpm.mk
> 
> --
> 2.45.1
> 
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
