Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E09CD6E55
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 08:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CB942A63;
	Sun, 31 May 2026 08:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPecbajmajaE; Sun, 31 May 2026 08:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE4A42A1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780216236;
	bh=nE1UDKM18j01f8aU80ePH7v5lGwPnNTa4MUWvLYw93c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C+3cjGz7ZyTVDUW7pSJgBm/hSnzRd+cIfuYriG7bivMUyjS/BIQPxa4aZWUG/QMKd
	 6PNtdswU8ozczwkZyTyuQcckxVBTuBZJmK0STDIbben+V9XBBXqBmHb1wMEbBqUYOS
	 ZB9H0arO72y8QefJkke+DNFm+y9BNgw4Be2rrUy8BcmSdnAadf4gNk8TewU6oTvcDz
	 JV0m+jzu2OV2voRmvze6YfCgAHdb8WSFzkutmCyhsbc1FdhUWgA4u/51MkE9Xu2kdm
	 Z8fO3z/YBQYNhSpDOJNiashNddawS+vMR6TFY5P5LyMpmfYyJDQYDY+qGXLqcwe5Vr
	 R3YS0yNO3wg5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE4A42A1B;
	Sun, 31 May 2026 08:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D70B257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F317484E88
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHxfOzoVQ9h4 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 08:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96D8B84E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D8B84E63
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96D8B84E63
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:30:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2F3B65FFA3;
 Sun, 31 May 2026 10:30:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 10:30:27 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 10:30:27 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>
In-Reply-To: <20260530211414.3016442-1-thomas.petazzoni@bootlin.com>
References: <20260530211414.3016442-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <ec90120f210bc1ec03cce9659c066f82@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780216230;
 bh=YL1HnCIV/fwd6HGSul0mMYmhLFRMU6QrrPo6DEtBmmc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WyFqWOZdzxtPzxm7ngLcLcGskisR91VfPmnpZd9dRdyr1GdxJGXJ8ntO5PlM6r83M
 Hzc3FZJTssvP5eqyyEzZS5JAnhfnwmUQOY8mtIMuqqHLnEER45PzwSYNT0rUXwB9L1
 ieGEbbR5o9QKo84vfYZ0oItY+dtKeE5orvTWuFQFfohqcnN6ARwUSMFpyykOr210Lj
 PnGkIj8Ncl6Fzi3hspbi5AGuE1dIYvryDqZXYqQN545vUi3U8QldTdMA9/RnjQiuyi
 yaRDXjN7KujNJIn1V6jcFIdnsil5IfiYvGY7SsvduP3ycpjdFt4lGLZAPkfeU2QCMW
 Lo3z32IY0cAyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WyFqWOZd
Subject: Re: [Buildroot] [PATCH 1/2] package/qt6/qt6base: use regular $(RM)
 to remove directory
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

On 30/05/2026 23:14, Thomas Petazzoni via buildroot wrote:
> Using '$(Q)rm -rf' is not the typical thing we do in Buildroot, we
> more commonly use '$(RM) -rf'.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
