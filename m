Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AFBCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962E7810C3;
	Sat,  3 Oct 2026 12:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1lORHEy1DBS; Sat,  3 Oct 2026 12:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EFF4880F88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030899;
	b=VuS9Gzf+X99Dw83BTa7GEbiOP5dpxanYMKW4Qc08KL423alJSuKerzQd28uUAr2sRrwI
	 WfJteFt6Ce65VeVorl+o+F1RrZRCfqD/ygPzNyQNXm4IXqKRFv7t1ZjVzI7P3ZYly3jGt
	 SmRiEjAKHPJDPDNAGZyScR+sL/f+Nye9Tp8Qu8QoeeOHHQlfHgLEHhPbwEIuFUG/w4AX2
	 CHR601QSMuGhsBdtAZEqLGq5zl1f+pYLk3vccBy7ywclCRF4V1OQavSon0KFiivZkavWX
	 D1TSnwT97VrHmmaQ6sCO3i4fRYqgvEfA6jDF//QRWxl8MlFvw+yBUsvX8MDB8hS6nbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ehBbCAWtQ8+HQ36835PPmrLSNWsIPuYvYEyPD9stgc8=;
	b=fu4uQhMrGST2l3S7m/LMhUTwrgWr7yIyfjulqco+vE1lm2jOwlqU0KVZ4U9UKNOe7d2+
	 7vP4ca4AsrlMveby+q3iIAMJhg5+ruO5UQTHi2pGgTbJRRGaRpo+gfeB6xb5i+U9OsQyl
	 oQly5j6/xfTE/vZueuVupRjsW+dSBTTzK5sbe9pvsfn7cVUHuAWfJdcfyVKTPy/1Cj/d4
	 q4gFKVOvB3S0iU/wV3+btpAVBm+EuNwdo3du+27wamxkeuiARP87Z+qx4zTREFZ7IWI1U
	 QkLiBqQAl3CxSm5w1k62fcEs3moBla/752IeMGqhY3I/mUgBFqbnGuU5dN/SMThh6TA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030899;
	bh=ehBbCAWtQ8+HQ36835PPmrLSNWsIPuYvYEyPD9stgc8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Uc0QoocnQJbvg+Dr3D1x4QfaOi7BCrCzuEwUZjGmVwy2JQNsbB6QLxmvqwmxxMivt
	 YjIYFo+jQSNAdGEohMBou09fux57O7s+L2eHMCwPBNhOBK6KVMBtyOyQ8kez4FE9YP
	 zdvkAa2Z+L83q2UGPITroiJoYlevCpIcnHIPrMhU9mml7NTCd6nfuq5/arMNweN442
	 19k1CRm7F4+ngDOM+KyBcjUbOP09Ep3vD22imPnR3VB1aor0dGwkUwsk0zZ/2pT2Wh
	 p+qWvKVNRnvEVYXlT/o1tqlXo++x0lbwFTadHh1dw7WYIA3kGUjklsslPCoZVS5UFX
	 +o6OXzCRgpUYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFF4880F88;
	Sat,  3 Oct 2026 12:34:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6C1C1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C816412ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpt-k_RAZZ21 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:34:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BB64740F91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030896;
 b=ED4C+OrYNb0zXbDqw5RuiN5XE/BKfLswjN20vwDomH6dQB6KaG57bwof+RN8NI1HOHN4
 YBWZgvqnPCjlr2b24ysinV7MFS6T5xGw5xAcaThd278fwLlFhhPK7APzL+/rE/cPg0tfC
 Ypxj/q3YINE924NYcHrLs1OuCtOE6lIwt9Z46QN2L46sbx91mTkXs1Mi7ShDHnYCF9x2U
 VV9K2Mnmrq1fxRFu2eWUkMf92HZ0F6F5BxeM4r3iQ7v03L8n+CJ6sXEw8rRwQrbuN7HSg
 Op8z//jBw6vV3qdKiUpvbb09obEvUEfjM7an0MichiOa53jH/zVgNTXaVU42rxjsU9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030896;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NxvRQDCmBYwjqIWeY7Em3a1RuIL++8flNuI9sVUpnmg=;
 b=d50ZhKo6KG+VKko/r68E/t/lSDwmSFTX9KceMNYpG5xoB7VGnsqx8z/Fj6Kv9nU2SxPf
 5Le13tGvWQKhbyqYc1NxY0iTQAuJpMO+r9WCt3ubl1EZ/RCXk4SHDKsNHaPeVTj3tgWMr
 bkIcyW8OYEFlxWblZNC2pHKBDQ2NlGSmmQNPK/8se5KwMJ1viv9qM1bUZ/JjlzBdqWvSs
 vwwAHMGLbfBX/cEKm79rT5kuNz0ml/3Fm0auk0iFclYrRG77n5SZ/V8ZonV9iIDvZAqs3
 vo2AFCXqOZGZWxaRcl6f1+qbhRdBzL7gxJhr+IQDz1Xo8G++4tvRiOuOkPIrVBDApcQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eyh66JDV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB64740F91
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C3A411A10F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 97A4B604FF;
 Sat,  3 Oct 2026 12:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE0F710328318; 
 Sat,  3 Oct 2026 14:34:50 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:34:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD2Zrbydo-qlDLK@windsurf>
References: <20261003084453.545653-6-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-6-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cssselect2: bump to
 version 0.10.1
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

On Sat, Oct 03, 2026 at 02:43:51AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
