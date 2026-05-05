Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38C5FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 18:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA4440B6B;
	Tue,  5 May 2026 18:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oce-j1oT0pPZ; Tue,  5 May 2026 18:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6778940B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778007200;
	bh=PnNY5o//UQnRLIbIwxlBsLcMSqUh/K65hzkg6RPyeIM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LFvXzYg6xEy8ZWGPdFo1Ox/26EkaIkYNiFnyWY/Yf6GUZIN3k65UAJ60A01rB1nFH
	 AmReYwx2tNoEC6aTrqGI14ahDSLThj+0EwOUxnh6nFmlQAfMU5A+8Ikhzlu/gvwAuL
	 2n+PtVaH2ppLwV6ZZqY35QXZ/EYEx2KLAYC2S6Hy9e0OUTKJq8VJxTtndMxEaSk79R
	 BsbDD73Bc/MiEnkXWkMZfo/PxPWUOCCFHLz0bGN0ldM9llCRzcQlbhh4vjRJ8IuF+Y
	 EetAxObKDbIKRm8N75tLhMAYreCOiFe9FyWQXu+LJo7MoarxICBuDyh+I6hDg4ZvCJ
	 tyqCdoUF+/kJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6778940B6C;
	Tue,  5 May 2026 18:53:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E073A2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C63B3403BF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBz55YRH6HYm for <buildroot@buildroot.org>;
 Tue,  5 May 2026 18:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 425BB4029B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 425BB4029B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 425BB4029B
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:53:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7DB2A13F8CE;
 Tue,  5 May 2026 20:53:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 May 2026 20:53:13 +0200
MIME-Version: 1.0
Date: Tue, 05 May 2026 20:53:13 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20260505134056.2212740-1-buildroot@bubu1.eu>
References: <20260505134056.2212740-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <76531a1a002001fcdf769b742f11c198@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778007194;
 bh=JYVyNGBF7xYm+xHhv4xNa13yUdiXwpK/IvauXdwjHmE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HMDGVe8ksNtFCNS2S9L6sbUf+2L7TZSiDYc1HsE7ahn8diW/rYSdUkDKv5b9e4f4x
 i4IlA8p7pVMwLg2pe6sbLE1bODHWbNcz/VooC1KV6GyVEe3xo+i31SEiE6CAW4TelT
 7do63VmIs4OUwTOCJ8ZYka/q9FUYia9ad5qXSqm3goLOotIC70j7Z5cSvnQ6gnWNr3
 OjIxdYBbQ1xLpKa8bPX63FEphXOR1+k3AE7502fuVy4Dr4f6beHqAyO/Kt1hQCBcdL
 s12PwVoRcyTgM8eWENXEI72L7jbhpNEYE8JL4yOQ23neZB4779wP7O/pfoVUq8ocml
 fByPs/07K4gqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HMDGVe8k
Subject: Re: [Buildroot] [PATCH] package/mpc: bump to 1.4.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/05/2026 15:40, Marcus Hoffmann via buildroot wrote:
> Changes:
> https://gitlab.inria.fr/mpc/mpc/-/blob/b8c90939ef1dc32cfbaa1823fe9e676ad5515ef4/NEWS#L1-16
> 
> Releases changed from tar.gz to .tar.xz format.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
