Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72917CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 21:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E28D60BA8;
	Sun, 16 Nov 2025 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFU9cvtt-Hma; Sun, 16 Nov 2025 21:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A51B608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A51B608D9;
	Sun, 16 Nov 2025 21:10:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B556E1A9
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6EC0408E3
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIfjRItXr4ef for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 21:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96BE3408D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BE3408D5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96BE3408D5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:10:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C69F0B0054E;
 Sun, 16 Nov 2025 22:10:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Nov 2025 22:10:02 +0100
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 22:10:02 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
In-Reply-To: <87h5utwvhp.fsf@dell.be.48ers.dk>
References: <20251115220705.572223-1-bernd@kuhls.net>
 <87h5utwvhp.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.11
Message-ID: <4f593e5a5246154f4a6334dc57483aef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763327405;
 bh=O71I7Cazx6ut5Zr/Tafh+n98fR5+juby/dK2OxvYZjU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jqQOisQ93nSSZ+Cki1GB7o0OEPEIDHyirHBqIukxDqNG+byJWPyZ6aJyb1GJQTJpL
 XIdxepGjt4Lf7ylgLpejSdj7ICdlxtjHxqBw5zg6xP5lRV7dliOT+9H1u7T+5JtARs
 rPAMxtWt5PbifDryxxzD4agP403kNSupUhZzgIDx7Md58UP+13GPgtdzikDDcLG0yn
 41P+64GLFrAPivyj5rOZqKf82u7ZCLJTZZ/pBGdqbqYg74D9I6tH00nJFTPOowcpwP
 SIwgFgH6XYkcD9L3dZpWnA/mgw73xGsNReqsPLOqsswnxOey78R9Pice7O5whBBzpR
 30aZ1cgP2demQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jqQOisQ9
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: remove package
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

Hi Peter, Bernd,

On 16/11/2025 21:52, Peter Korsgaard wrote:
>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
> 
> Hi,
> 
>  > The package is incompatible with newer versions of protobuf:
>  > 
> https://github.com/OpenLightingProject/ola/issues/1879#issuecomment-2567133849
>  > 
> https://github.com/OpenLightingProject/ola/pull/1975#issuecomment-2346854820
> 
>  > with no upstream fixes in sight and fails to build with protobuf 
> 29.3
>  > currently used by buildroot:
>  > 
> https://lists.buildroot.org/pipermail/buildroot/2025-February/772533.html
> 
>  > Fixes:
>  > 
> https://autobuild.buildroot.net/results/fbb/fbbfef6e3715c0ac195537ab88ebb2e0e6c90c2f/
> 
>  > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> Julien, what do you say?
> 
> It sounds like there also may be some unfixed security issues in ola:
> 
> https://github.com/OpenLightingProject/ola/issues/2006

I am OK to remove this package for the time being.

Acked-by: Julien Olivain <ju.o@free.fr>

> 
> --
> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
