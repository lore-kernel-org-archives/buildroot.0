Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCD3CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 360754056B;
	Tue, 13 Oct 2026 17:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5rI9UXU7Qmd; Tue, 13 Oct 2026 17:52:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6FBBC4037D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913951;
	b=kOxQ83o8HLAFPBRT9922N/KF8XQ2vMhkWN9RpAdm1lluiX+wOHUOrE4oV4sLfdeCZMuw
	 JsUVldQXL03MucJ3gKj44R/Wh7l+TeKg+ITUoSbZEHIYtHpDuRsqoPe1+7FL4tgh7BR9A
	 dUOuluDNj9AwOOwqgv2GkdTVlWIbNFLSdVxUTWXAHxvC0jBPvIOj1YUWovIgbTzdXVNN1
	 rK+oM26iGuJbojJSPzjOSfwq0BjMH9lk4d3IOWMcqpxJ42ZBBqVSA9WAlKlMoaSAHJBeU
	 6mDKsLqtc7R2gcLqXqIeyxHfP/CUthBU8ry5bFbbJ/YFyARzMULcNw0YyLvbiqkNxBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0Uxqn76/pVWTC6WiggznjVWCnTdlSFsiit3jNwF4r+M=;
	b=X5aUonjmBaOqZAU/AREw7OVbogPMiQqRi4J6HmeeZMpBr6bSiqQ0JQmlQs2Dvmj+bObf
	 UxzTrpc55nsPYv4cu5SRhUxUpI/UlRXh/jq0HvR8sBkuTz7blleBM14g7kkqFmswNUHNo
	 T0Zh1Ie3lMIw5L5IK2E4Y7dIJyxEuOcY3yDevK0q7kPeszyn8Z6nMvo0udaOZ5aqhGDuI
	 ctVO7Qi0n+VBR7knxaaOqOf7xKjAXjfWSbzmggQ37YnH24cpMrMvKZBZJR7Tijq7fV4Q9
	 VTAgmKxdw2hzksdd7c4gekeBHp8VDCGuPbibcJd7aX5WsJKLrYIJBi50w+GTdIah0yg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913951;
	bh=0Uxqn76/pVWTC6WiggznjVWCnTdlSFsiit3jNwF4r+M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TZbv3PAQR7YezbZ2eXUNIAboq5axsS8HruUYK+0E1fVhL1RAboRST0Booy3tFEZIv
	 NDvXn8/5PxzfdYb3rqOLyMQXfWFQJDK8GFHk1AZYxscEOA/QuYTB1zAqzHI/9ny7o3
	 EepeIs/q5rWcIoS65sPU9V0/RGxYMKVSkui0o4S+HCyLrM8kvqhP1YgI2rryldSThK
	 0qNNt838AqSZt9S1YsXLd5tvmft4OP0GxgWx0UFUoQMfIXSXBk5Gl/PSD9wTFai7nV
	 ZePRS4aYglgDxm2HWhShwWgAK8uYHxBnCRKPROuoCi90YWv6ghmmWuJzaEe9UZvqJf
	 eRs3I3zD5+Mag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FBBC4037D;
	Tue, 13 Oct 2026 17:52:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEFF75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A3E46073B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_bw1Xwv6MBn for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:52:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4D8CE60705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913949;
 b=JwP65fuZuFAQOaNM4GOUfIeiH2Whc93UbLcMxjLFNuj003zAAFwfI0Sf0dG6OnwtVUQL
 q5n4Yq/YTtTR1ayt1qxOmi/VmnZdnDXBcyjvNBAxQQ7ciWMUxF7WF7cB3rv52+TfiaERo
 MYNYod8JxK3RM1+P5cBv1ct+7kxiIiSegJ8drVYQbFIh0AQnn0FMzQyA6wswBR3Pb9v7s
 UT6HP/8hoqKxISM1PlJ9AmtnyzX2Oxo1tNiQr96F1kK9fXU97PnVSLURFhjX9z/MK24Ov
 HOh+fh0yhQ3b13UdufnKT+VsnFuaDw3fWWDkfppdgiWuDorGzDQ5E6zJ0BHtgdeRq3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913949;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=9rD3axOI++YSY+elMegL2Z0CHm69juOSdjbH/r7E0MM=;
 b=AWDl3dKDboO2+N5GOZYlqXcEVlC71cCiIrbW/ZHJp/EutH9Spq0PF7ms3n0ygWQr1uSn
 bexTqI/vv86h0zEnCKUCb2BELQlZFfmqvUQ40gwqAtdFCKSfDZ8NocXk19gye0+MlNQO/
 XE6kQPxYfdlbb3tf+3JE0dGEIlDgmwm3Sn3uNTLLMggvsngMpGVyuSmYCieg2ee9oepfl
 Jx716ZPCCcHF+zgiM4J88uoZUy2gojdIL7ORYTH7tqmhrAF56vETOfxer3EPBvBGH8VN8
 c/JodcvOKx9Iadna+god7P1csfB0Un9lmX2bP1Wv1uV3kgUH0TnhlAjdRDlvBR3PCoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KqPcvqCL; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D8CE60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 362C7C653FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9219260362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:25 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 0A50811D7188E; Tue, 13 Oct 2026 19:50:50 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:42:43 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <asuSTHo3pVVSbiIE@windsurf>
References: <20261011133348.713816-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011133348.713816-1-thomas.perale@mind.be>
X-TUID: H4U4WoHuoqMu
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 0A50811D7188E
X-Spamd-Result: default: False [-3.20 / 30.00]; BAYES_HAM(-4.60)[97.77%];
 DATE_IN_PAST(1.00)[52]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_ZERO(0.00)[0];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; BCC(0.00)[];
 MIME_TRACE(0.00)[0:+]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo,mind.be:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: adding myself in packages
 with LTS policies
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

On Sun, Oct 11, 2026 at 03:33:48PM +0200, Thomas Perale via buildroot wrote:
> To better track the version of a package before a Buildroot LTS release
> is made I'm adding myself to DEVELOPERS file for those one so I receive
> alerts for this subset of packages.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

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
