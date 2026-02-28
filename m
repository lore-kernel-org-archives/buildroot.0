Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7345FD0040
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 22:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F4A83F5F;
	Sat, 28 Feb 2026 22:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id os_wWyTpwmEz; Sat, 28 Feb 2026 22:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A990283F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772317862;
	bh=cwQqIXZFriOp5VTrR732tOV3UbFOIrIRTVP44n0dkRI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eek0qnFeW63fWsJtNVxFt6VULcjpkvpzSKm1gwCVKImyrzlLt6nfJZELepa0tKxmg
	 et4lSs2CpP9zO/mUE9idKjEbcgcLGkQ4qEJOKJadTIHvvE3irxOpbbZr9gaOrZsMs0
	 BYJfq5pCG5gM26MvPTPDK1BuJahuc/4ixNBxv1+AL+m3sQdRySBuwDs27QNcH1FSk2
	 O6rsBDskLrWcGIb37Fqz8PiQ/dW8mlM44/owpeN59j+sbpGmij6VqsG2fbl3j5gPvN
	 zjppoW89C3d0ZECwAIj4XlD6h2skVg/9GVFnb8RfWD8mRmY8RFS1arSiTFKnq+6Lhl
	 5yAXsZcS68KfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A990283F5B;
	Sat, 28 Feb 2026 22:31:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58A031EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 22:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A55983F5B
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 22:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idrxaBH4P23N for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 22:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A09A783F5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09A783F5A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A09A783F5A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 22:30:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXdC-1wHrb23oZe-00S7pt; Sat, 28
 Feb 2026 23:30:47 +0100
Message-ID: <d5069f4c-565b-4111-8f11-67f31281f3f4@gmx.de>
Date: Sat, 28 Feb 2026 23:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
References: <20260227192112.3792145-1-fiona.klute@gmx.de>
 <871pi4prz5.fsf@dell.be.48ers.dk>
 <4de55993-a547-418b-83a5-b5e5549480fd@gmx.de>
 <87wlzwo6gc.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87wlzwo6gc.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:te8kr1ay4+Flm1lpopgdUOuqyuoszFYd/L2C4x4v7JwZFkQptqk
 0OKKy2Z/p2leQE79fRfot6QwjReSuNFbXfTDRE1+Lj1Kho9zRA2oGjrJyrW8D0NxpRj9lV1
 6Kd7aLR3nonYrBV5ycmHlf7aKkrbKMclEbw3Q3iPGO1DrSZ4fSC6waCT45wWPGKjXGgPzc3
 dc1lNnfLHX/uPxcgbhN4g==
UI-OutboundReport: notjunk:1;M01:P0:iTKU/YU/bJ0=;NxbrkxL8vkQUb+8wDFyVimcGmjC
 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
 A58B+VwPMfQqI+U4gF0+ciPzCzPjK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772317847; x=1772922647; i=fiona.klute@gmx.de;
 bh=w7WXr4C7gjLhSgZtYEexIhQVsMC4CTp5RMhO4z+rWi0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=mIXl0bN/zcxvbzfq0/qUP810SZsWW3vp1p8kUFQMuhYpMqlNR7Srs+p7bQG+AIvW
 Liz/vndTryWjPmCFV2+UDf7Krjfd/hlm48scDVpKwVkjyiYViVk6xUcbufyFMFCZr
 6zz4cRvmVBthVWwnmBiv6ZmuQQWLYBlGitdbmqFKw4BnlT5pO0SOuDHOagSCxNyjl
 3vsbtj8ny6h5311B70h9pOvz97FezUXZOUNRr48Kb2nEndm8fPfAhLFpDjQ4exLBo
 qw66bad1c/6FtPRbFNwjeiSMXgCo52qxZSCIOwltyPHgOo7ezkZ6pQ0yS4k/lbKHa
 eqHaSeMNpqa4XGfang==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mIXl0bN/
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: transfer config in
 environment instead of class variables
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 28.02.26 um 23:21 schrieb Peter Korsgaard:
>>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:
> 
> Hi,
> 
>   >> Wouldn't that work?
> 
>   > No, because with the execution order in support/testing/run-tests that
>   > is the *first* call (so it would still happen, except on pre-3.14
>   > Python where "fork" is the default), the second one (which then causes
>   > an exception) happens in the Debian-patched "mp" plugin of Nose,
>   > specifically when it's loaded. Otherwise we could just catch the
>   > exception and ignore it if the start method is what we expect.
> 
> Ahh, true.
> 
> 
>   > The main issue is with Debian, of course (without that incorrect patch
>   > run-tests would work as it is), but relying on a specific
>   > multiprocessing start method was always fragile. For stable branches I
>   > think it'd be fair to point at the problem being a Debian bug, if this
>   > patch (or something similar) is considered too big to backport. The
>   > buggy Nose version is only in unstable & testing right now, I hope
>   > there'll be a properly fixed one before the Forky release.
> 
> What we could also do is to only add the workaround for python >= 3.14.x
> (which is not yet in Debian), E.G.
> 
> if sys.version_info >= (3,14):
>    multiprocessing.set_start_method('fork')
That would fix the immediate issue, yes. If Debian updates to 3.14 
before Nose is fixed we'll be back where we started, and I think it'd be 
good not to rely on a specific start method in general. But I suppose 
the version check would be a reasonable compromise for the stable 
branches. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
