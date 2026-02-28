Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BF4FEE4FE
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3996360FBB;
	Sat, 28 Feb 2026 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27-ILHD19zG2; Sat, 28 Feb 2026 20:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44EA660FA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772311278;
	bh=TupTDb5vEFUAMlFBLKe8qAUI8D2UHS6BgLsV31L29Kc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pt4WWx0v1EI5bmyzvbxrpywKRUxigAnrz0EpCFxIW4YR91C57Bd94JiqNna+kmmdI
	 w0HMrwS8JCy34yQEIQPdsBs693QEEWDGXxZT3GBmOAfw8+9nZKLFsJAOnn0HEZhfMl
	 0vLF52UHKE3z+MOboEYbWqGqBoAsl1bquoHq0j/0Gbr13X856/JVvLmrAHpHKLNnmh
	 pi1Cv81YxWBqkrzpLbT+QdIjsXgkqzzlMr+pg6JAV8VZQ2oOdRcBfUS1vdYepflbKS
	 6Q7fMU/ZgVfYjszqJgZ089TMMCSVP0LfLpBxvj87wmhhWiwMM1W7Et8S7/BysDYg+L
	 /VxIwmfiF3p4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44EA660FA2;
	Sat, 28 Feb 2026 20:41:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70CC218D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6208541960
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9KeFxEn5UHL for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 20:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF34C41959
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF34C41959
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF34C41959
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:41:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbEp-1vmqSw2DjP-006c4C; Sat, 28
 Feb 2026 21:41:05 +0100
Message-ID: <4de55993-a547-418b-83a5-b5e5549480fd@gmx.de>
Date: Sat, 28 Feb 2026 21:41:04 +0100
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
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <871pi4prz5.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:PIS29ereu/hvn5MatcggtT6ZEKPCxaQGpZcTnW2ykJvGy/p1sh7
 aAZvgmdLnP7vc8jFPI6uPPrPFN+rTjxAST61V1OEO0MlFNTGP93ybnlGnoki09SVEgmGh0v
 kEC5nR1OCS4BJQ+5tYa+R/uMMjUGJZRdxc1GC2UTGLNPJuzvyJmfwVukbFYl3Ib4u63AnYb
 6QPNDYuIv1GxJuiwOT6iA==
UI-OutboundReport: notjunk:1;M01:P0:5UqhhDe3QZY=;0wnhVULi/8EgLpSrDFjiljRbwuH
 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
 TEVMBrS22MRXOhFfQ3Ux
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772311265; x=1772916065; i=fiona.klute@gmx.de;
 bh=6N28WQsdoiIvx2T+qZ08Xx7CnIbsl/WV86ltsW+WiCQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tFOsVDnFYZ5B3Tv3sTnTB4MHD1haqKPQfP1ZLScub0BP6b8i6UIP3BKzhEJH0OJr
 3pNI4u2iNYK3fVgFkdG75IymLBFMY3/UGcguwsrjG2pHgija+Lwpwl8L7noEf1Y0z
 k+msXetJgdDHGC83EIMZVy2mF9BiKv/X2jZgEzj02UrdX9pEXl7YNnjNK9Ngn8sCS
 KPLW2YRYgZpUhCR/75ZQvREVl8AIezzAjZXy84allfPruqsqPKM+d4dDOHWijdJ1+
 GAoUTv7zRXBa/V9ODr4ItPJ6j6OlOKuxkGWla4StqGcFccEqHZTZfRUPjeUaViEXp
 jc8AeIfo/wXwwdoOPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tFOsVDnF
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

Am 28.02.26 um 20:50 schrieb Peter Korsgaard:
>>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:
> 
>   > With Python 3.14 the default process start method in the
>   > multiprocessing module for POSIX platfroms changed from "fork" to
>   > "forkserver". Unlike with "fork" the new process does not inherit
>   > loaded modules, classes, etc., instead it has to load any it
>   > needs. This means that class variables modified in the parent process
>   > are lost, which breaks the way support/testing/run-tests sets
>   > configuration in BRConfigTest.
> 
>   > Instead add a method to serialize the configuration into an
>   > environment variable, and read it during
>   > BRConfigTest.__init__(). Reading is skipped if the environment
>   > variable is not set so test discovery (not execution) works without
>   > configuration (e.g. utils/get-developers uses this).
> 
>   > The (de-)serialization could be simpler using a dedicated
>   > @dataclasses.dataclass class, but the dataclasses module was added
>   > with Python 3.7, while support/dependencies/check-host-python3.mk
>   > specifies 3.4 as the minimum for Buildroot.
> 
>   > Remove the "fork" method override added in
>   > 3d2141bceefda32bef06ddda594eaf8665913276. This fixes a crash that
>   > occured in combination with an incorrect [1] patch added to the Debian
>   > python3-nose2 package with version 0.15.1-2 [2] because setting the
>   > default multiprocessing start method twice is an error.
> 
> Looking at https://wiki.debian.org/Python, python 3.7+ was included
> since Debian 10 (released July 2019, EOL September 2022), so I do think
> that we can start relying on 3.7 for new releases, but for 2026.02 (and
> 2025.02.x) why not just change run-tests to do:
> 
> # set_start_method() may only be called once
> if multiprocessing.get_start_method() != 'fork:
>     multiprocessing.set_start_method('fork')
> 
> Wouldn't that work?
No, because with the execution order in support/testing/run-tests that 
is the *first* call (so it would still happen, except on pre-3.14 Python 
where "fork" is the default), the second one (which then causes an 
exception) happens in the Debian-patched "mp" plugin of Nose, 
specifically when it's loaded. Otherwise we could just catch the 
exception and ignore it if the start method is what we expect.

The main issue is with Debian, of course (without that incorrect patch 
run-tests would work as it is), but relying on a specific 
multiprocessing start method was always fragile. For stable branches I 
think it'd be fair to point at the problem being a Debian bug, if this 
patch (or something similar) is considered too big to backport. The 
buggy Nose version is only in unstable & testing right now, I hope 
there'll be a properly fixed one before the Forky release.

A very simple alternative would be to disable the "mp" plugin, but that 
has obvious disadvantages.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
