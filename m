Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E5CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6F7608DD;
	Sat, 10 Oct 2026 08:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDwrwvKgWEPU; Sat, 10 Oct 2026 08:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4071E608D8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621667;
	b=j441dcDFuBCimMNXhr+yxRqaKVAr84LC89Nhbwm7XgDl0dTPZ8J9BxUeofED8thzcnUB
	 IfwviY6iB9MRAyLOBYoaPQto7/AvxqBmgAHyU3lt1UJ04yXdD+GChyzRiaPJHOa1m+Dwk
	 OEHIvYDaXYqlVZymKNKCCYeObtL9UNv6dYDyqvULAfxBt04l4n9DbmTIEB6loiXW7/ufN
	 ICXfkxQykchqUvpUJCTL09YjplDrCLEZGNMWw14DaJYdRASS3gsaDEuYFRuo5v55ydPYC
	 ywHbORoZCh5l5YMSleti5nRMYjyxZ2OBNF4c5cmme/6KdKAgrgph9ibZx7w7R4pKd8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LrwYtDo9NUJNHEPCzsjnnn2eRIQXtF6XSy/m14nbq9A=;
	b=MboawuviNNJsRu2mOpzX5FMr+68Mq0T1n1ILlyWM3CRVozc7sbv2VMmJojvi5PILwqwz
	 CkUUvKnZWKsxgGqgb0+YlOuF7KOD6+81N+g6/xgJmP7Ty8kMPMwL5j2VfnkF9+HzhJg/X
	 UIufFf0yyhrRY4MXBpmqhyf5vnduG9qjO/a6qT0zxqHY6rmmyzDnu/5XbS1Ii3F8qgua8
	 L9jk7zSOKe1ayaAL89D5XjQ3e/wLkF+sZMo4PJUgsR5UlIM3jO4Wj+OyDfSoE2FrtOOlR
	 5fuf4EDQyfoK1vNhBaoNi/SrnP4TxA0FJFeQjVAoHWwMKkA7MAJtKtg+pi9Q2j1/edw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621667;
	bh=LrwYtDo9NUJNHEPCzsjnnn2eRIQXtF6XSy/m14nbq9A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s3OMlaNZ5EKaiMGXWLkcSJJeYrMHHLCRUoaKJEJAnnGqC655nkw6tY1AlAQQ/JU+G
	 nseamaFt+uD66VJk6Ec9PtjxTx7q1Diai9khBnJn4jr5rlYNWDPJ2qdq80mFj+jWRA
	 cgJn1RKVDLoIBpep/rnD1PycYY9gVV/6U0YQyWp/gA/PPqyqQmWUmNoK0uLsZveBkr
	 QVqR4P6nXcXf6OQ4lKXkW3vUFvcVK1X7TPHv+J9XDjSR0Vg/9P0MvGr0IQzzet8yrn
	 oQNVeqWJoaPj0H6KEJrx3Zbmsz/MBV7k3VnBhuaSCYn50gdXkLhA4JaHPkfqJvvrzR
	 5SNCcIeR3gfYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4071E608D8;
	Sat, 10 Oct 2026 08:41:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DA24380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 202034006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7vLt4fRLg8A for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:41:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A97F640004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621664;
 b=TTzZJBixne0SfcNs95/KvGHCuvFHqlAdGk9Fwah4aDXXSBHaX0FkSWbjv8KTomlMLNqM
 yZsmD53cxPqzWLG/RjDKDGy/y6M/wJ49tQqf+apKZ7fnsTzyhPPjkLsO+9oOU/QQ1x1ml
 cyXaTDwks6lK9vcd2li9OmXJDAObagsKzNG9qlrYX17+oVuUVSnyZxlQi+zF/20RTIx6r
 apCWLZ4kyRj9og0UBBE+lUl4KvRJ5sKbqT30YthjcPqEbeIB26aunri/h+Dw+EDJelJdf
 8VEGt4HqasYH9g4LGR1fzbsXCmj4tBebX8CmIARycpxQoY8nJc0B6pgFQMhbKEPC7ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621664;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=LYFRyC5/dQClbXQjd1Tn4WZXVnY6FueEFnV8XOzvum8=;
 b=LYx7HANQxApJfZa6yn3yIshk/xUQ0F5UX1j1m4KBQ/cOLyOzOmLK3TA9HF60LjD6Qziv
 m/BBWBW0PQI72QSRlqlnrSGg+olRMd4KoxkxWItO3JKaaTuK3eCjBmbQH2ZeOCAFq4W+r
 UZbobkzhbanyLGjXckXMtF2/OtQcHbit0hVBKvQ0MtRpvyoN4M/0or0dL8odsTC7HnOZN
 oMcfftK8Nl0sgV3RjRskdg6rWNV11yBXh+YC74Y9oP7h7uyGLjNMSG9K+xS7FU41D9p0l
 KtnPk5+M2WJRcQ50ejHZ4aclrvRnG3ScVW4bXD4OT5CNCnyw54tWvo9YhEHZzPWECxA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XzYeiAOp; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A97F640004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:41:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4827F1A11A4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:40:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C9096075C;
 Sat, 10 Oct 2026 08:40:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A86FA11D70277; 
 Sat, 10 Oct 2026 10:40:57 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:40:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <asn6FXUgq2uCRelu@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-35-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-35-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 34/84] package/lftp: Add support for
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

On Tue, Oct 06, 2026 at 06:20:15PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

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
