Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F239C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB8C81099;
	Sat,  5 Sep 2026 14:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gT6qjJC97qPs; Sat,  5 Sep 2026 14:17:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 70DA481068
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788617850;
	b=HX8IcixIcDdGAjAlSp2CqeGivYwfrddMAUcFN/kqnJbW5JNQphe+PItGjTyLYjLRsHWn
	 igHWSBQt4IQUa2sHmvjeN6xCTypcv/a+MDGkZTKYR/C4qwJOnuNAV0YSN53zm+nvyR/jK
	 yTVT96Dm2fwKY0QcFXkwu53I+CogLxNWfer4YCgW7sAoY9HmHpN2+KSnNLXsbBLlqsCUK
	 eGYQP2JuQ0A6O4uz7NdFgtUgp7KumGYnJUGnICEOtPkrWeih2PB3axdLmenxX5sZReHCG
	 npOw0MK6Rfl7p1TC8CWxZx9xNXsid/TktEisd8flP9ppmnos7TArWNXB6AVGgkBnFYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788617850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t95OisFBgA1IQhVFfqCzQB88A0yjhJxKxq12C2uoSdc=;
	b=f+EfwX4WObVY0P3uuJHFs12+j/DVMDkI8dS+tFvGf6RQ23F6nE0x4vLSf2reFWihx+Zn
	 dYpnWqPdEva6Ahmul4up7Y2ulClFztpskAEDnkpG2M1Ufq2i3Ct/VPjHDs41S+W7o+hkN
	 yxOOQ29vzM3yhABK696TZL46uDVue7AuEFZwrPHUuNEG9XGpyiteZO/3jG4/wWNzJJ4xU
	 AQ8I+XLVJ0NAlqwjbAmdM6ydWEQ1EiS63TLlq+P+jFsK0tTSu3Ip0AR7u+HumQK0xo1qb
	 TqlNrBAvLNf2VTWtxxwGWmajUycQRcCMFkQ10OvCJsoQG1HvLLS7xwMidjarYlJb1Cw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788617850;
	bh=t95OisFBgA1IQhVFfqCzQB88A0yjhJxKxq12C2uoSdc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DwD6UYdC8q3WvXUz/iQcndJZVBX/1uvUeyk0P03wX6c227sLDB1cGSl13O51wIowq
	 7iRvCN2WPLIqzVsz27cY0dAOvEyNZuw/ljj4xEfLiwsxurodZ13MFE7Ys95xvrRgss
	 HO+0RQKXvh94RpwFN6swoZ9VTOnuR19UCpJLd5PBf0SKJAPK05phXncjOfaKsCacB+
	 wghg6rKdkmYbWpHWj6wU2FAqmqbVX9hoLlIjTdPCg6iSC5Dw8txdlFswG/SBQ0joro
	 Tn6FvhOGi7vvnUTKDah0vqbS4sAWssQj5RuOGz4HRlcRAws1mhaM76iicLVnEwhUGM
	 hn2ShvLtkJrpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DA481068;
	Sat,  5 Sep 2026 14:17:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B77949D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61BC340051
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-dC-uT_eWR4 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:17:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8E47F4004C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788617847;
 b=WmI5YuAdwMWVw5F97ot8Jsx0L0OR2MjwoFfqkMHPjPhGKF6uC7pVDnh5Z4hM3YSSWG7n
 HkRFi9C8XrWp2JL4zKpoRquCg+AQP9H1H25if0z7UkxGTNLVDB1baZZwXZaBFhI34uYTb
 I2iSAlg11lRHF/pC7QUblZ7U9sa9jzsVdBtwz6m0hQeWKaVoP2QzTWcNDZmflNrmhVq1r
 kS83c2skscIcBX/82kiO8Z9+atRVJ0Ttuy0OqgxxA6CGU6OdSLDw188knl1g31YgbeGM0
 h58s5YtGUG08KqWoiCm+0iLyHKzks01AUmHAYcLb3FVyN5jZsqBXvFd+MVckmJkxgvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788617847;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Ti579x3m20LYcEKeCobykTNkpZukW6D3FbUwsddFCb8=;
 b=FIy/icaytjxgyecly3Va9oegCrqHcykpMozw+70Tr0dzJjCSgVxkyBnZsRyto1p/RjC5
 qr8VwdsJE0hAvdC7SKnNqO+lo0J/Q3S5hsZxpAZ/NpiXq8FbES7p3muAY5FQg6gugrOr8
 fzkRoGlFC9iFXa5NsX0utIVfY9A9IdeilfMWufhHhTx21HqUXDCfAEYnDLeNC0Rjjdmal
 U23mA/HmbPh8ihiBlkUeU46fP+aLRJ1m37pATYasfMW4BjStsgd73t8nzFj+mzGiEjRZX
 3z2ibCf/dhbOQN+LRI4/B7RlBsK+UubNxEFG0OaSK+82PafQW+h74dLpt76CQaQjJxw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1qCfACIF; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E47F4004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:17:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CD7891A18F9;
 Sat,  5 Sep 2026 14:17:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 930B160233;
 Sat,  5 Sep 2026 14:17:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA4BE11C783E9; 
 Sat,  5 Sep 2026 16:17:20 +0200 (CEST)
Date: Sat, 5 Sep 2026 16:17:20 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <apwkJkKsWDShYA-8@windsurf>
References: <20260905040256.2221199-1-br025@umbiko.net>
 <20260905040256.2221199-3-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905040256.2221199-3-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v4 2/2] support/testing: add runtime test
 for mpd
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

Hello Andreas,

On Sat, Sep 05, 2026 at 06:02:53AM +0200, Andreas Ziegler wrote:
> The test determines if mpd was started by the init system by querying
> mpd status via the built-in protocol and evaluating the result.
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Thanks for this new iteration!

> new file mode 100755
> index 0000000000..4cc6895602
> --- /dev/null
> +++ b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
> @@ -0,0 +1,35 @@
> +#!/bin/sh
> +
> +mpd_command() {
> +	mpd_result=""
> +	mpd_state=""
> +	printf "Execute %s" "$1"
> +	while IFS= read -r line; do
> +		case $line in
> +			OK) 						mpd_result=$line ;;
> +			OK\ MPD*)					mpd_protocol=${line##* } ;;
> +			state:*)					mpd_state=${line##*: } ;;
> +			ACK\ \[[0-9]*@[0-9]*\]*)	mpd_error=${line##*\} } ;;
> +		esac
> +	done <<- EOF

Why are we "hacking" a minimal mpd client here instead of adding
mpd-mpc to the image and using it to test mpd?

> +	export mpd_protocol
> +	export mpd_state

Why does this needs to be exported?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
