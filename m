Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C6BCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED73360847;
	Tue, 13 Oct 2026 17:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6K8F-FzaTyxU; Tue, 13 Oct 2026 17:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 252156083A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914235;
	b=FyTdZxQR3Ks2oydwzMM18sh4jM0E233xODGumT9Z9N/XuJ0irTJvnT7SjFPbxKKWE5uC
	 s7MnuzGOLh4nYjzMIumy2cufWHiVI2ee/KKJ6Lz7zzLHYzGrsh+XXrfZrOX1a0GYAvvrp
	 XdRXqWmbMCdr176wley+jPZV3nwFtVAhI6ce9TvqbmDOZFVsLWUYgw4J6gX5J9Z1XOFgg
	 oqGpB2AKn99FdGCVqfk46J7cKSe1IYBRS+olqZOkjIynpKkx6VQmyvJdPUbskBbYf5Gw1
	 irqFG9awzW7ig4vTcc4Wab/fHLsqQo8miok3wcDLk40Hx9Bq4JviB4KbF4R/N/stfpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x8wfmmHTHNsDnK7L5gMi1BlQsBM+XWGcnosahZvFERY=;
	b=j0PadTuBlzWrpZIvBIIy+aCdqt2ruYWB20Fka6HeS2sN15MOhcPEkUppbGWCnSoResgb
	 d4Ei/w1I9ITPxcQK3ZjPdDBo/qbITw7kR4rpZP1Ss+P7rE+cyYB2sXO9HRtctuSr5NGLK
	 oNxhtSnfLEWWewa1FVIyDlWaCkMkxWl3hLPRmWPN1Kxscf2Xd+c+hBX8Zn/rg4DcdCY4e
	 e+hCsomlSogy2DDlNbJkk6zEaB9hVfxrghMMWl+aEuEW1xCGJARrEDP0ntOkXSX9lguNC
	 fJVy7QZBRBgbpaGIJnSIlpxEw+YnNO146y9XGRO0BnO/QXNdTdF7N5A8kxuhkholxEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914235;
	bh=x8wfmmHTHNsDnK7L5gMi1BlQsBM+XWGcnosahZvFERY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CgX6WpWII5aXptd+DvPgWEgPtVd92KgHQqHF8W4IOI/4b3viC9S5xfApkK0ooiTHd
	 gmw0Dq2bBQcHXwvUZDdh5JpSRR8YdwUmFbqlkwpHxTVAppqgfhHpf0GoxkeadiDOZb
	 VIICtAHFwtNMhB1F5p9E2p1ZFtd0/v7bZkwvVqr41xwQa9gjRzD/AKMtQddvGCK6RW
	 7NqrU2hRjnOfGePhrmFA2ykrpLINYzZNAX0akeUg5+Wrb8O5CSBOSgaBnsdWP1lcFT
	 MdQhLdM0TqGCWlNUc21qybelPRfhpBSeiCpnMHQXqtzrducmUQQoWaGF0a+JcdA7mD
	 YRQVHFp3/5J5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252156083A;
	Tue, 13 Oct 2026 17:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B420362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 011D66083A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMtBvvHH9q27 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:57:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24A9C60809
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914232;
 b=XOmVHq46d4gVXwCvkJUj6rtx258EsXOIOpLf7OAYieka9mvnkFta4VbMa5DDqPDjM0cq
 2hyj+YwUolNzp2ZwywSuznVig11yssMkrcqwk+ZXNXRZczZeaUoJCGmXqXFPl5ZYKIju2
 sMtYfeWSVmfuEuB4sAZGnI7fBg5YO6+maeAmug8mkIqYPIydjgyNtUeE0+QYeRBZlfape
 43rgHxdHcgVa/7e1X/Bmqr6FILy+7XyCpxwQSaBayOaDB0QBCYnsFjx798uRWa9zICfY/
 xwjKxpHYf3Nsb6Z4CI+GOIN0a5AoGKOL6QDpQR2GMSEQdlrM7XHYM4KTIUAO+vrIU9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914232;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=e/C3F7slcMo2ucl+uwDta2DAvZzLWGIcHLkqqws8jDE=;
 b=Wos4XHru4/dD/SoKHtmOMuOnWazDs7wJMIbpU8vazCouch2y1ynx6zpdJtMBDJOyXmJr
 BrHlnQ7YnWnHXa1Twe3XW9zPnCUdyFHhFQ2tzUo2EgFjCWcppfxRlbXQENO6CR6vRkt2T
 34i7mTGbdwvDrDXIM1mz165wyIeizokZezP6fNowN+s3XiH9aR0owClnHXsx2yf2+Sb41
 +VDwJ27BmPwIn+SChYz17rix+tj4ltYSL/49iic5IpHZTM0dBCD+1NUigVy/tQQIMv9ft
 NpPuN4D5kmN1QfyecOO6M8FaoH9osQthKcPzK76iMNjDPPNf+/RtJxP623WlqUs/02g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hZGTnH0P; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24A9C60809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 51D1D4E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 23B7160362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:10 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id A42B111D718D1; Tue, 13 Oct 2026 19:50:28 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:26:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asn2uN79DQ84ICKD@windsurf>
References: <20261004124407.3597326-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004124407.3597326-1-bernd@kuhls.net>
X-TUID: hNIV08mlrFU+
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: A42B111D718D1
X-Spamd-Result: default: False [-2.17 / 30.00]; BAYES_HAM(-3.57)[94.73%];
 DATE_IN_PAST(1.00)[81]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[]; BCC(0.00)[];
 MISSING_XM_UA(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_CC(0.00)[buildroot.org,gmail.com];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,kuhls.net:email,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyqt5: fix build with
 python-3.15
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

On Sun, Oct 04, 2026 at 02:44:07PM +0200, Bernd Kuhls wrote:
> Please note that the upstream repo is private so we used the Debian
> mirror as source for patch 0003 which is marked as a cherry-pick by
> upstream.
> 
> Other mirrors are not updated: https://github.com/baoboa/pyqt5/issues/76
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
