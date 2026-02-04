Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C65BE87845
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2407A60A72;
	Wed,  4 Feb 2026 14:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l555BXuLzHHO; Wed,  4 Feb 2026 14:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2653960B77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213742;
	bh=eik31on5rcUCwj+4uVuv+NFiIhR5pOz+k9F7bSNrYbU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mNprPHw0dIxWtNsvGWwo6QIUUZFjX7yRh7toC6zKQq0tDGTEEdPcLU+jtnInq8qd3
	 OAgQ59LtSUMEV2u8+0fd7NoomclEuyRA+5s4qnuhRQy3jNcaKlzYu6zIJg9FqCavGL
	 JUsMvz8gqAyfCmNi0k39250UKDBcuJ7Ah7OyJN/qzFJ9y3NLGoY61inQG2jwS7g1LZ
	 rwxRXFjCIyLjHgpiR9VxYwcHRpjMpijg9wN44UR/6r7TsKLbcRgbZY4pUmiSCnrS5w
	 9UmCfb/jequire6LAmjj62FOI6VB7n87d8OftQUOFuU6bp6MsQU+WXgL8RoDJZxMEg
	 F3mGlzcb9yM3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2653960B77;
	Wed,  4 Feb 2026 14:02:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72366F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CB5F83B56
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnECTl5tcdEm for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8807583AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8807583AE6
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8807583AE6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:02:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EFB40C2439A;
 Wed,  4 Feb 2026 14:02:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D82C60745;
 Wed,  4 Feb 2026 14:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7E16119A8891; Wed,  4 Feb 2026 15:02:11 +0100 (CET)
Date: Wed, 4 Feb 2026 15:02:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mario Lang <mlang@blind.guru>
Message-ID: <aYNRVxpnjfR0JNpr@windsurf>
References: <20260104110506.353384-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104110506.353384-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770213732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=XrxsWazKa+63S+qFnaQo6Hq4cI/mUfCXaaRUr5F+iN0=;
 b=iiJc416r18QXwH0LvITj6+fPx6RSZMeBPNuWZzc/43FP1do8lVESCiNfVJQ4NGw4zFxK5N
 5ysPCFvicsuWiXREeX8KKpc/vwa+QkOqxBTfd2c+hzI8qj8l+lCBgeJURL7d8C2T3lCflh
 PoroIuzrUzUp+Sb7Fb42T9+wbivN/hysCBqiUYEPi7LbWxSwt5hYcc2hOUeo2sjCQP9qCy
 SDu6bd8/rfSMdaoduUuOclObvebxxnQtiYvpUi9IvdJwoFAJ+rS3mEe/WeSliYFTQeWyqM
 ALOF1WzpH8nVCNg5R5lLLG0sPRs83VeX0x+MWXZzTtK/9OupPeM9Nme3QnBCEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=iiJc416r
Subject: Re: [Buildroot] [PATCH v2 1/1] package/brltty: fix musl build
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

On Sun, Jan 04, 2026 at 12:05:06PM +0100, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da/
> 
> The build error was not introduced by the recent bump to 6.8. The oldest
> build error with the previous brltty version 6.6 used in buildroot dates
> back to 2023:
> https://autobuild.buildroot.net/results/78a/78a7fe6edfb84c2b15fff32aa475c975ecd5bdbc/
> 
> and with brltty 6.4 to 2022:
> https://autobuild.buildroot.net/results/a5b/a5b338ce9865fc7afaecd9b671e6a8f290548374/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
