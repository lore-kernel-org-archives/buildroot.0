Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE5C369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 17:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609A480C0B;
	Wed, 16 Apr 2025 17:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HE7nimyfdLsr; Wed, 16 Apr 2025 17:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9087F80E9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9087F80E9E;
	Wed, 16 Apr 2025 17:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB60159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DFDC80E41
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ybuoqlr2rLzD for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 17:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D24480A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D24480A5C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D24480A5C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EB54460128;
 Wed, 16 Apr 2025 19:21:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 19:21:41 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 19:21:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250415205324.2509045-1-thomas.petazzoni@bootlin.com>
References: <20250415205324.2509045-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4f04a82c3b93ca8e15efe8a134f13cad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744824103;
 bh=M8TaVoQcdkevI5K9Rg4Wvavdvet/K/l+/upSxaJh+Zs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pj6PN6x/Yb2B/Pd1Y/+lutwla7WYos1UD+AQvnRvZ5tuNlxBTyE/mSBkb4/SibasL
 tKdGzS62B6mbE9G43A/SbG6mAru7/PAdMTXZnyDMw2mn0JXfvbpnJGkYSlgge9N2gE
 9yToikHsys6N0HRRna+ARQ0XFEhnWGqLbgWPrKahjIswrKpd+iXr6BV5oMITrEAhdV
 w13mUwi0pmssRE9Xoz/POegiTX6yRkPsZvtFQBWQC6+c1UnYn+HsWPKEyAIfioZe/b
 gtKouMD73DC7ti/jau/neqR9Nv2dQN2KyeK9gYlT7l+FeFLsGD7bk68MxiSrYhFKEu
 uHXL6yF7G/k4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Pj6PN6x/
Subject: Re: [Buildroot] [PATCH] package/libffi: bump to version 3.4.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/04/2025 22:53, Thomas Petazzoni via buildroot wrote:
[...]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
