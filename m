Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6BEEEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719BB402E8;
	Thu,  1 Jan 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZ310T8juZMt; Thu,  1 Jan 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E239A4021C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280269;
	bh=F2mTnDlg5TXUk/RJGBFgpy6D5Xg2bK/NWEfeFtGxuWE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RoxS5QL32LonTEV00fwcj3YymDCtv3Pt5zP5ehwDzP7F4jjG9QjsC0AqN2rOfY40r
	 ic6BRxNIUWSzKkgRfMEQ0iOq0ebPKOkBvXmBW8RjwY2RT/O52/tjLnuU0xR4ae84Kr
	 L2gpXEac4qZxS97xxcbn7WLk6xHSw/Ags7Rnp2qkbJ2OxvvIoMI6UAN3sTlZQWe7vH
	 UZq5TvTL8PjKk/KbDOU13mkVQi31m5TQEe8pt2xJu0d6mah1OvmULdLW15rhP42pS6
	 tN0EoIzmoOveClH9JiD6D5SpsZG2YdxLpKyfnq3bbDeuDp0/VMxp35SHZvIADJo8bj
	 H/7WJz+QZvNvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E239A4021C;
	Thu,  1 Jan 2026 15:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9B8F19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF4080978
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkXmWUHB6sl6 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2B288096F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B288096F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2B288096F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:11:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 242F04E41ED9;
 Thu,  1 Jan 2026 15:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED888606B6;
 Thu,  1 Jan 2026 15:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A978113B0628; Thu,  1 Jan 2026 16:11:03 +0100 (CET)
Date: Thu, 1 Jan 2026 16:11:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Message-ID: <20260101161102.5e396956@windsurf>
In-Reply-To: <20251115164828.1519438-4-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
 <20251115164828.1519438-4-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767280264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZwPrlg2sqfY7jacxShUtRDUMUZVlTiJpNjy7Xww/Ojc=;
 b=QND1K1UDUq+67TfSFVPUk66VY95TgwqiE5CmmHhqgVGj29pdb0zzjUWOIfwQQzw3FFBgMD
 0ZYfSakutEq86wrsAZ2p5cXTjlD0SmIKwjJVdG3qPm0QmdrnXATkMkO2yXKl1G9rQl0+fA
 rz+vGaJkV7lxT04wdwhN7KrONtBrKF5SUyY60FvmI8Ngzywj3S3+Mi1Fi4mlQU6gzuaSIz
 weodTxIkAD890Dqj9tzwKgkwL7zqrtMWUVZXnRD53cGVGhqJ1ul2SQ9mPwJY3nPTPAKyRe
 /vyI3iUW8+XeDy2551zmr28of3IYoxOPMmTLQLELHvA66qiairqXvwLoH2HnVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QND1K1UD
Subject: Re: [Buildroot] [PATCH 4/4] package/lttng-libust: bump to version
 2.14.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Nov 2025 17:48:27 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Devin Steffler <devin.buildroot@gmail.com>
> 
> This is the third of three patches relating to lttng-modules 2.13.10 not compiling with buildroot.
> 
> Since I am submitting a patch to bump lttng-modules to 2.13.17 and lttng-libust is a tightly related package,
> I am also submitting this patch to bump lttng-libust to 2.13.8 (the latest version at this time).
> 
> The chanagelog for lttng-libust 2.14.0 can be found here:
> https://git.lttng.org/?p=lttng-ust.git;a=blob;f=ChangeLog;h=1ddf7956cd80674f8bb0cec4b9362a9b1bf943b4;hb=refs/heads/stable-2.14
> 
> Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> [Bernd:
>  - bumped to 2.14.0, updated link to changelog
>  - rebased patch 0001 due to upstream commit:
>    https://git.lttng.org/?p=lttng-ust.git;a=commitdiff;h=464c475658ae29039b3b9e769b5b02195688a94a
>  - updated license files and hashes due to upstream commit:
>    https://git.lttng.org/?p=lttng-ust.git;a=commit;h=e03d7c66c57bf268b87296566a5160039f35ccfb
>  - added dependency to host-python-setuptools due to upstream commit:
>    https://git.lttng.org/?p=lttng-ust.git;a=commitdiff;h=cb80e2fb106d56b4a0ae9c0480a368572f4d0d35]
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-configure.ac-add-disable-tests.patch      | 10 ++++++----
>  package/lttng-libust/lttng-libust.hash             | 14 +++++++-------
>  package/lttng-libust/lttng-libust.mk               | 11 ++++++++---
>  3 files changed, 21 insertions(+), 14 deletions(-)

Applied with a reworded commit log (and line wrapped to 80 columns).
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
