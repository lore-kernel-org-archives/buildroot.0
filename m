Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135F8C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 08:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A886881342;
	Wed, 29 May 2024 08:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE6F_Z3JZBc4; Wed, 29 May 2024 08:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8682812F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8682812F5;
	Wed, 29 May 2024 08:58:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2629F1D3342
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 08:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1344260757
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 08:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnDafo-arCbK for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 08:58:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62B6860756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B6860756
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62B6860756
 for <buildroot@buildroot.org>; Wed, 29 May 2024 08:58:21 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCF8S-0000000DUzW-1Asc; Wed, 29 May 2024 08:58:17 +0000
Message-ID: <31d643d8-4bca-4817-a6f2-a40ac0d77d37@infradead.org>
Date: Wed, 29 May 2024 17:58:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, yann.morin.1998@free.fr
References: <99605672-166f-4747-9653-6f45458ddf04@infradead.org>
 <87plt5ruxy.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <87plt5ruxy.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=cS0OV06mYpyuWTB2/sbzgRilnNU2Fuvh/CAfdU0n1wQ=; b=nOfEwABWYgxuQZXL7h2Akjr1h+
 RPaKalq13xE6RlWccSH3IlBqHsxjVzfvq1kkdWR1TYBIgQhlCgkXcevwqVYKE13TAqdLPxZrDiXKO
 AAuW4fAX0vD6tyS18nwESJdECGmL8svFc2xw12yLDEkeLK2qlTMaJ6EmtFV/Kv/l4CaxRs0Ei4PTn
 tr/FW6Iotw/8SP+fkkNAlT9YUaveRLEWt8fMAmz1bULX4cv9yWA4NT+9eR0MKw+WnUkctKNNS6+Q+
 xKvzwSF0aGLxGUd8NXrcAB+heDoGDxt3XbbmVZxnAGrIWHs6ddYOXmHS0aKEZKxXpgY0kEaaEjhaS
 pY18S39w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=nOfEwABW
Subject: Re: [Buildroot] [PATCH] package/flannel: Bump to version 0.25.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 5/29/24 15:30, Peter Korsgaard wrote:
>>>>>> "Geoff" == Geoff Levand <geoff@infradead.org> writes:
> 
>  > Signed-off-by: Geoff Levand <geoff@infradead.org>
>  > diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
>  > index 831f6234da..367c4f6ecf 100644
>  > --- a/package/flannel/flannel.hash
>  > +++ b/package/flannel/flannel.hash
>  > @@ -1,3 +1,3 @@
>  >  # Locally computed:
>  > -sha256  8406a3b2b799344197c79f96e5b39ea7b6228f0bb2cb069b5f44dce684e29b9b  flannel-0.25.1-go2.tar.gz
>  > +sha256  565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954  flannel-0.25.2-go2.tar.gz
> 
> Hmm, I get a different hash here?
> 
> ERROR: while checking hashes from package/flannel/flannel.hash
> ERROR: flannel-0.25.2-go2.tar.gz has wrong sha256 hash:
> ERROR: expected: 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954
> ERROR: got     : e181a5e4233db47b0f03718ea801274c3a6024d235ead76e974f3df4f4183de1

I always do a clean build and run some tests before I send out a
patch.  It worked OK then, and I just tested again and it was OK.
I see this in the build log;

  flannel-0.25.2-go2.tar.gz: OK (sha256: 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954)
  >>> flannel 0.25.2 Extracting

Maybe there was some problem with your download of flannel-0.25.2-go2.tar.gz 

-Geoff
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
