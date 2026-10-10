Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85DBCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE3D406A3;
	Tue, 13 Oct 2026 17:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VS4R8HPBRef; Tue, 13 Oct 2026 17:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CD404405F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914111;
	b=RP090h4e0FYax0s9107TaQe8VLU9wWqElAeQeJLHc4v8nqgk48N08Ev4gLs4vT7nj+YW
	 cQRyAluz8biqNlAOf5cnuamx3j1RoUgAjOLwB3vg34XynuTaiT0xZDZkf6KY9GOvf1q9e
	 cJgJi7PjugzmH28DUGq0RkQMZB86rbMMQlpMoYDUq3SWYRRhPWxwAet7uu1p9Cz/hBpn/
	 LYlxoae7kKftvr4+7mw8t3e64W9+i6BplWO9Zsfga7yP3KLRNNm4NanrVC50GIpeK/fhA
	 M6kPf17Ff0bJCI6BZmbypuVM1l7V/T40Uxp62Eb2Y86udiqzL+7mXBM+JEI2ogsi69Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2mUY2tV5U8kTVtr4/Egg75ZOx6G0uiFqLNR5OhRLNhM=;
	b=hkSZjoXy8HITz4LYYTgD9EZ68MmTpMDHl218zIM1CWGprBvdt8ow8n8/CfSS7UDw5xwu
	 Z7GBmjUug7xhTnAyTT/DSLcHzvdL7N5LPVrUXkG4m2RhQYzTCeVPXERsQ490a0p8uixvf
	 cKMeuYWiC8ot2LNx3iJjC9r9JbB8uKgAQhijj233YeYG4HSJ+9Z2yvHvrwR+sGjJ7q8XD
	 vKjMZBGmIVrXssDg5vgN7wPY1NGm6c7b1wfZ+YVhZJiAIADg8on8fYCYH7FKA1UqkYw4/
	 KZ7viM+NjYF3lLGSmbdChvcL9FwS7OGVQrDaNPVroXatjIQgWv9Vc3P4n09O/6cjfvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914111;
	bh=2mUY2tV5U8kTVtr4/Egg75ZOx6G0uiFqLNR5OhRLNhM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nMBUdZaJkZgSAYgzUe9Gn1Qd53ktuADg1gAfzHLwnKRDaRGKris0GnmBtkj8cszW5
	 8yyPalvMOyXxhOoOpq7xAHnMf6JKDjeayxRb68UhvtTtRbf2IMTgFdrqiCZIdTMHpk
	 LuB20tlXSiN3lewhMVw8a7DWwEvwhoK4saaIUifn995X77jtkwWe5xTjdXqlO6Ukpv
	 elW25vGqAhesxxeqsX+P9kMGOf9GdWCTXC2HWCBxTRyktjXoiOeiualjwgM+67SboO
	 3NzKaiXnzF4or617asYRJSwtOZVBElfMpdHoQNSgX+I8xhTJGE1yK6ZDJ8ZUIHT1rB
	 5NLJh+8b7HFdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD404405F6;
	Tue, 13 Oct 2026 17:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD255362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE596073B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2YjKE2XxImo for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C599C60705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914110;
 b=Ziu5nFOvNxs5t+koqN4TnrsAPrH6t1q9Gu41sp4RqIybQJMXPwBRrMrORBsp7yJ5H4f+
 9QVIrZDVoLl8oibHYblBqPcx9umQiUFLPtO+xsTdwi6MOwndEKOX+Lb2+u2MUvoKeWlwX
 f3LMrZpjiNzwqpkvlZWMxqnsOHNTo66g9bdQpFG7ymjzIGE36FHBkCHQzZsYziy5T0yqm
 FDhQbTqg6YD6T4CU2750KY2/THz/2WDKkWuWCzXM6pbg1Z8RYYAahcvvzdmY5ATJ3sKaL
 NdmcWAgLReRMLY4pwkYOUQ8Sxu5X2gROrqTeZBeQNcJv8Fkvlvqgdc0OCFNEAwcvgwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914110;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=AtcWfZW0bvu23WtouNIgKUGa6q0F3fPcX/gbBrg2Yko=;
 b=AOFCZK5UEskt0jQwWvZxcjbunX/WetZR6phn1ACLKo6LJIeNKmjLxG121DJ3FtOQBbWG
 SFLoVKwH0/OAG3tHUxm0WutenlmDULI1O305hYW8BuhBYvjL5uhyrffafCKSvTh55ZZ+0
 nmLtLNwxXO0uJ9wjZ96Jh8BHfZQvM0rvx6ldp6zhGqTanRQAWZ7UwMRdCs2YtYFhdJkV2
 jesOLZ8DXZ1vbyDE9XengBUN36CedS+TQs/P7GSt0awyRngiM7ZM5jiM5GQzkdBIlwppF
 o4ETVqhF81IUniF1+gAJs5ejFGRyJ9F7Rs//Be+fEiZR09icjTPBGUvt1HbqzTXBjpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nr+6PwPT; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C599C60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 32999C653FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 880DF60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:07 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id D68B511D71897; Tue, 13 Oct 2026 19:50:37 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:30:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <asoFvORZFXVHNdsG@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-43-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-43-bernd@kuhls.net>
X-TUID: Cb0EtRrmT+R1
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: D68B511D71897
X-Spamd-Result: default: False [-1.72 / 30.00]; BAYES_HAM(-3.12)[93.16%];
 DATE_IN_PAST(1.00)[80]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_ZERO(0.00)[0];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; BCC(0.00)[];
 MIME_TRACE(0.00)[0:+]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[kuhls.net:email,bootlin.com:url,bootlin.com:email,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH v8 42/84] package/qpid-proton: Fix build
 with OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:23PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>

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
