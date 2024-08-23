Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3F5C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D480840EA;
	Fri, 23 Aug 2024 17:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3IuX9dFupnc; Fri, 23 Aug 2024 17:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3C02840F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3C02840F3;
	Fri, 23 Aug 2024 17:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 387F81BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CF781EE2
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDgF3I1zon4B for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD76A840D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD76A840D8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD76A840D8
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:34:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 268F91BF206;
 Fri, 23 Aug 2024 17:34:01 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:34:00 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823193400.667da55d@windsurf>
In-Reply-To: <20240822121710.709074-1-buildroot@bubu1.eu>
References: <20240822121710.709074-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLKWbKxqHfVdBTleLoMpBWVLqDZmn3+385XvR726dVI=;
 b=LEEKbymFYon62uth71vmvU9ffl+Pfxv7ItMC97N9/K2ekKkgO8FlcH5W3tk5SgysoLoWBJ
 cO50psWek/9xTc7tQ28CP982FNwKOpFaQbZEnKrdv2sGdBUNGgZo8QZaRqg2eyW7rhVLJD
 Qv6oQ4hKdzRHVyW062AixVfa3An5iY/heykHCnkhW/VvarlQYTrx1oGPS4sbmEs1VtyXCH
 z1U7lNU/AnCzyISwZhPdCeBBu/rqh4mepyrOBLQi3oXDCB4yCyaQ6aaVi4VsSlG+GUCSzO
 z9f8ZssaY4yWXtfCK4OwKarhEBELmtZZCibqaY/FCORJgH9+O5sNWEyTIacaGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LEEKbymF
Subject: Re: [Buildroot] [PATCH] package/python-sqlparse: security bump to
 version 0.5.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 14:17:09 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> * https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-1-jul-15-2024
> * https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-0-apr-13-2024
> 
> Version 0.5.0 fixes the following security issue [1]:
> Parsing heavily nested list leads to Denial of Service
> 
> Build backend switched from flit to hatchling in [2].
> 
> [1] https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-2m57-hf25-phgg
> [2] https://github.com/andialbrecht/sqlparse/commit/326a316446c3e091a93950251e3e376ebf0d4127
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-sqlparse/python-sqlparse.hash | 4 ++--
>  package/python-sqlparse/python-sqlparse.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
