Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A17C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D9DC4069F;
	Sun, 13 Sep 2026 08:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M05FQg1AECLD; Sun, 13 Sep 2026 08:46:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 41B3C40685
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789289178;
	b=TvHIDEnUKlEpEPzFa+Ed2YpZj2O1y4130cZA7sN7nugV5i1WGkJPz17YfoK3NUmYkZ6o
	 a/Q26I23u/VuwrYWRc9nY9atuTr+SAz151exJyxVfRRu9JbwyzR72ZDQ+vAYMLqPrQwcX
	 MgrEwzGHtJN2AkVwYK8toiMvr2pnDziLsRSWGE2ugjfSgcgr7sgMarO94+fy0M9zG1Ezk
	 kFxK+b9AdBBsqJwlBdN2WV4IlUaw9KCseULqCWa38Kms2fVLmDgwIJC3MD4guLlVtp4qn
	 oFLdXbiCZ8YR2B14CfklA7GW39J8sTR421YAU5dT0bJuu74ADhvtbkyqtH0R3JIgicA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789289178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=R5Ap/1CkWK2crwwYd2VaHLnrXd44trM97P7at4WJVpY=;
	b=ZH/4y1mTZzPFiw9XoptfwJvNw6L+fM97FlxVFDGRIoJnDjVihvtObWGnBEdXpEOyvQF6
	 fbpEGVMr2Df580pklCp3hWS4GCz00CJNR6xPCf6LCuNQI2EIrS50cA8/gpVmo1w23BEnK
	 2s2rnbgqrK9cDF6TjMT7qH1XifBxHnugr1LO7xPDePhkCtD7Tz7gfHMRRtvwHufEFQ4qD
	 SnLBuqmFtg4lk/0vYDxoZtVgMBx8aFbobTtLd/EaZTYBFvtn5zQnvbGuVR0hTzw91ytCB
	 A0sWF0iMjC3R2MtABiaDkI+uFmQ1bu0N595s17TsuCZbQ3XzE0fyIH8zX4TvierQh5A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789289178;
	bh=R5Ap/1CkWK2crwwYd2VaHLnrXd44trM97P7at4WJVpY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GcJZG3wIYgMPs5p8YF7JS6MsvuAI4ItAT91owJMh+2VaNxSs9BD81Lw+HOiFcB2SR
	 mXNovjeqd7Ak+naqE/sU/s/1+5dGKspOxiJOsDb+ad0apuexq6O8j3AsMs3D5phCDM
	 ZTxqhL4bOL/mYq6rJ2MqxjXXaogEe1jMk3fGgVLuWyoQ1k7vWcETvGjBvttQxlUQV9
	 BSOq+6srJLTq72Py0Td7LgxSnHaIRJKztWDu11Rkpug+2wk0tBE/5KQ5EbZWvSfD9v
	 GHh+QmFB9xer6BXqqoVzWZFabGHPcv3MuL12TNBRvK2Rz1vjjXFYNSQ9IA4GCBuCle
	 1YBFnyb4o8XcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B3C40685;
	Sun, 13 Sep 2026 08:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0010E701
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAD9340685
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTH8C5bPGe91 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:46:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33AD84064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789289176;
 b=TrUZeZamRtgmzkeDD5ESWYN5sdYbZvjbH33DHgmFBODrfdAnqDbhe6d6R/LQrSVGh+/g
 xVhkCkkNaNTf5Y6T/w3OAT7Ukw/0CIQ78UBGy2eew8TS0siu8EYUCmnVW+SrMM6t1m43o
 34Km0lbvIttlidxfsPz69o2CyU5gZP1yjmVsiyOvPY7ZW/a0RtIimE6GU1M8EUnS5sWyR
 yWwmhPpj1n4cnyQsm6gOddBvFbaYeyBehQ4TSeqqeu06DGBqFBNVu/hHRlX4u/gkktYoD
 zNIlDH4spfkRxvi7bNR2qo8qFUzs3epeMQGYWYB0eROBvpxdKeOidhvxrx9dem9KCiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789289176;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=SxtYp1PKIrCJ2dd0O2tHSwFXwI3dCg4Y8MU1v+dw9ho=;
 b=fI0pHJEHpghYiAVT7nq5dupHZeSR79Y7EhqspkTkhanLDK6q53U2tqQN1+YTc+jH/54m
 0QdLQDjpndIY51l9vtFVfVwKiSlF+35w0wsRv4FjphefNjSffAJ3Z2wcWLUEbyaZ3eB5B
 vgCBf57SOEX/rsAQYyw3gVQGsqa5YGwmjW+ALRXrlfRcQlg+K2fFRE9UDC10UAjwL5H09
 1lCQm4maKsNQuuT1Hc/0YTjO9mWlJ0JS4i/7sVeItuneulKsiEk5K5g4K4zCF6KJM/tox
 /hOueyHAwo2CSEWGEyTBvKi4rfamGh7rXgYtkWCCf2oqUaOwShvUwcmDCs0kBvteaYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NTf4Gqd5; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33AD84064C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:46:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 834FB78035E;
 Sun, 13 Sep 2026 10:46:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 10:46:11 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 10:46:11 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
References: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ebe1b221489e60953b18b9dd26351e78@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2]
 package/python-googleapis-common-protos: add missing
 BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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

On 12/09/2026 23:09, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS selects
> BR2_PACKAGE_PYTHON_PROTOBUF but did not propagate
> BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS.
> 
> Fixes: d37766a886a8dc3d49d45e14955411700a5efd26 
> ("package/python-googleapis-common-protos: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
