Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD4BD74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B1381114;
	Tue, 29 Oct 2024 21:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zfd3ZhHekhL; Tue, 29 Oct 2024 21:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12E48111B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12E48111B;
	Tue, 29 Oct 2024 21:14:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 614134EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4200F405E6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gu-OZFr1Mwh9 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5A99405DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5A99405DA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5A99405DA
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:14:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73FEB60005;
 Tue, 29 Oct 2024 21:14:43 +0000 (UTC)
Date: Tue, 29 Oct 2024 22:14:42 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241029221442.25634738@windsurf>
In-Reply-To: <20240928064217.1047737-1-roykollensvendsen@gmail.com>
References: <20240928064217.1047737-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730236483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/ZqTx2cEikQFj5OVGQ7WbbQyMG9pD0n7BOy/NwvSJI=;
 b=KvL3/FDp5KganIemz9trZy5AswId/pHt55zvVw6SPynUCIYnwCe2bmnFP3nAS15NlgO5NK
 oxVL7hVQzVSLBdsnvm7M6JlcY4uwG5CQxPaXCwkR6zWagrte+W+6gDBl8DtkDOTANVKXBp
 5CD4ktHpB3i3QGaLLTDUqmA+7aRtm1AEMRSiBK1dlViVaG0lIaLS3MHmD5GMGf2nXwX4Mw
 upR0dx7Hnnurh+5b61t+ND97p7UaMEZfKUnJlRU2oVfXNBK/rbY0XPyCnpcEOLBSc7/Sia
 2XTFTW6tFtHT4ykqdD8j17mWaDN29rjmqRMxw2/a7ovGmL9BDLdpq3kWIrig7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KvL3/FDp
Subject: Re: [Buildroot] [PATCH v3] package/dlib: add missing dependency on
 wchar
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

On Sat, 28 Sep 2024 08:42:15 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Fixes: https://autobuild.buildroot.org/results/f5c543bcf57181373680d0c16a1814d21b000bcf
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v1 -> v2:
>   - remove slash in autobuild url to fix link in gmail

Applied to master, thanks. However, please always indicate in the
commit message since *when* the problem has started occurring, when
fixing an issue, so we know if the fix needs to be backported or not.

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
