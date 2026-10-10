Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47638CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1206940624;
	Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2FFWlgcTf2Z; Tue, 13 Oct 2026 17:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3ABB240613
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914048;
	b=kk7kSE9DQiJlUQm7rYKy30ucRT1i4ZG4WEp2YSxtaSQA/2Wzsv4nNqsWNyjRqONs3DN+
	 I2ix/1t+w6+83rsgedfQ3o2fk6q+hI6S5eZZknYSMGODFeRw7gTki11UbDy0EOtfKa2eT
	 Wb1CNKb792p3l0OBju9KFqlDHO5vHyYcPAyNoto7l+vMOjJYoZY2SLazXgoDr+fK/NnDt
	 x2Sr/lMiN/0QNYh5liDGOxw8s5IqEs4UfAKzg0jh+Wh5o2/HPAosoGYZstfd6pOE+/5F5
	 n7fv1q5RMQvxp7TP2miXwhGHUB2v5CEuwbMETrtZsDQa9T9ZOAeFB99yVEiUTnMyA6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TFmRPpDTYd5dKr1c64CguY3ilOdSIeJDlBApWtQM0vs=;
	b=tChMUYnv4ey9+MxEMxQv99HnE9dnxI6t4hiWeFMbcglKZ2MmYL+Gw0Sz3Z+ln5pBSxjB
	 gpZ1j5LX9hhTO7pJ9mOw0rbvnVMtGv+hVh+HOkvpsEBoBAb6LPHcL7tQCxlnYc/6YkjMO
	 j+/4Yw9AEa5seND73TemgwUX2CIVJcOoOCTTmiwJOftsTYE+nAxzIRUdJj/zy82+1/8FF
	 zArdRCTKivvjfPvuQEHGUWieze/E893ja3+9dW1RBLqWzD1kW3Uy7rxX1QfrOR7R9R8jc
	 /xtRLKTPpDvtXEgFIPjomrdtd5tmnnCf/uiNaw7wIk8E+YvKl2W6P8G1KQlrKa3a05w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914048;
	bh=TFmRPpDTYd5dKr1c64CguY3ilOdSIeJDlBApWtQM0vs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VXewZY0ErPDIxozA3nx6EpFG3XoYwsAfef1UMJZD5X4FpPM+2+EcIICL9hPEPQmk3
	 dzD34NgzboElVhMY/xXWQqTpdL3HFtOyBXv57/9xkKhWIojiVZhNftEdNi+wu18ENN
	 5kuKXc2mVpnzHS5lc3w17ZTY4s7lt2fUPthf35ezSuJMV+pN7sVeGr6lIErp+Y/sER
	 HGhDPg7CqnnJvUU/li/XYKtqFCjVLkUeofjmhsLLhMRgBYoAp/Blsj89tAm+uAM3Cq
	 QSgMnjXI3Kx9t8pOHvShHNKL2crU35oksqjRZNEqTpORcwvIIaQNX5UJcRAgl8uGq6
	 8D9BI+z/P96oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABB240613;
	Tue, 13 Oct 2026 17:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC80362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADAA84056B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNqAmRuHBXrA for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D6851403A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914043;
 b=Ff4FR3mzcC41QuDptV2kA/HUAFWNU2jRxFcT5zXDY2jqRNFeMivjZjxOFchj42G7G+ho
 IANCThkrrhjC7E9NDRf/QbucdGIELk/rURhD+QQzE6a7/fD33oeEvmTHLW7a21uB7s8I2
 IgsAiBhR3bGcMZ13ANR1WCfJ76qcbF8TQcdNTelI1Oaqn0M1cGkaYrOdyUH1rxfmR7f7z
 PFc7BkVHp5AM6EaO1OON+HTLjTK5Ut4au6dwvkFzLxz1up8EZ0CnEL+YoodSyzG+/ZwJ1
 yaAOuvQOL1pjQvQLbDat7GnyB+v5Ms7AaoPoH1pZp9pZttr5Cw/BHw+tWf+8cMGSVtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914043;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=Ac2lcAOJqtJf40Sfe8ZxuntQBlFJd/4NBoenC0ACxIQ=;
 b=BYbTVUft9vMj9p5BcTOo//Chc6YmM9kh9gAnq2PRoud/AnThfHkK3m+fuj6T0s7ZvmXK
 dnp7cwwIKQo+LeNFalQvuYCuyUtTn+uqvhbaV2Ejp6DIER5yhSqDKD0DEfIr0Bb6MvZsi
 Sl3mh05YqOM1xhazeqqa1083TN8ET03GiJN13eXp5ZVMO2i80mFVGSydqconW2CT596gS
 mU4bwxAIy+0r6fJBVyoVcaA4yFk/d+3ESnc0+ITg0kfj+S6pplgE/d6JXyRAK6p9swy9G
 8RLiF9R6QK6pICNDIO/7t7gzjMJqMQTTVgnC7GOtp/BSDuxrE0S5Y/h19CqMkpZKYcA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dHokovr6; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6851403A7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5A659C653F9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9C0960362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:00 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 45AF811D7188E; Tue, 13 Oct 2026 19:50:38 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:59:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>
Message-ID: <asoMlggP2G6Y3gST@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-48-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-48-bernd@kuhls.net>
X-TUID: 4Z7mhJwURU2H
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 45AF811D7188E
X-Spamd-Result: default: False [-1.23 / 30.00]; BAYES_HAM(-2.63)[91.17%];
 DATE_IN_PAST(1.00)[79]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_CC(0.00)[buildroot.org,gmail.com];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,kuhls.net:email,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH v8 47/84] package/sofia-sip: Fix build with
 OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:28PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Gregory Dymarek <gregd72002@gmail.com>

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
