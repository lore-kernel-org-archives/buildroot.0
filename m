Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09383EF584D
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 00:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC4840BF0;
	Sun, 15 Feb 2026 00:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t48DbY-jh32P; Sun, 15 Feb 2026 00:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6F240BE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771116253;
	bh=LmktRwfJ7pkg0ESnM5lHl8OBPwzpl4MoQe7om0A7d9s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YdS7mTTus7NgYyoZSGHZskoGl7D3ITgOIZvRPZi5KZS2el+h0pRIjymM+TpcH/sQi
	 aLKCQkOaXywFdVc1ba8CwI9CkB8B/JE+IAnry1gn7L2+B/PRN5jImCbIGD5XhKKWnY
	 Z4uYISYsMK1UlMQ7eTbYVjCCzCBpIjKeilLTZHdwC5OJQ6AWAl56vQt78FCGJpng+E
	 Ydmu5vdX76xFnGVBNyh7zY/znrIHZDr8E0Q3B5dAHXNnIiq2W+wIfxYY0JFvumbfNA
	 oKuPt3xrHYrP/Y9a6FZveSsl6L5W9aj1SA09lyirWdKQVFHPGiotpdPV2qugwb9vKE
	 8Vwpc6RV+YYmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA6F240BE3;
	Sun, 15 Feb 2026 00:44:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D1131F
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 00:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B13D612B7
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 00:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOrV944Exj-x for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 00:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0B58612C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0B58612C9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0B58612C9
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 00:44:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.25.185]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6mE-1vUV240YH6-00ooCW; Sun, 15
 Feb 2026 01:44:00 +0100
Message-ID: <81e91ea4-20bd-4786-83f9-5e3810f52cfd@gmx.de>
Date: Sun, 15 Feb 2026 01:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot@buildroot.org, guenther.harrasser@mobileye.com
References: <20260119144010.1646792-1>
 <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
 <a062166d22db6b02629b21913b366fb2@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <a062166d22db6b02629b21913b366fb2@free.fr>
X-Provags-ID: V03:K1:eCr4O9JDBNqfWTs5YjvwugVnIWLhz0o9ueF1Dj3x5MizV9eaUQ8
 Jp2u9ETtZySYGhyiytv4GwknQVDWk2g/4s31Y0T8Me+Hf/eEAVgMjJVIWQeg7fYUIl/p4GM
 unbLpaw2yCxJ3gNPNRDfhJknp3I9m2Pr2cP7CMHVpdNFtrdTWa2pxhDhx1WyCtzsH6AkQbZ
 deUaICcCB34meQDeHIawA==
UI-OutboundReport: notjunk:1;M01:P0:TFdH27XujFE=;6X06gNFman1NxIdZPCWyMksPDmf
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771116240; x=1771721040; i=fiona.klute@gmx.de;
 bh=tdCo1+tHgsf6MpaF2GDU5Ktf3LRCuFFma4/YcZMteL4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UUNnaMlTxNqav+JZ1SrGkuisaVCDnW+sx7Gd85R8FK8EG/2E17R2kSBOJ8D3mlpT
 7XNlTlZO9tTbuSCCbl/mRxqVgj8BhLubDyoUKl2TYendG8EKC3jirje5XTuVa2lbB
 ZcUCJWn9lXCF8JlCp4Wt7GuEsdw8WLyUqT0PWwyii5kuBYXEHkpbieakBhVrPjz1o
 N/uG4hMHXPhzrms1Ql3Ud3Fmh5FktgZUbhaCObrI73EtDNUMKffXsUMV0keZCP8Vm
 FQqxK9B6JvjGU9YsNsAP+koBOI5YU8N8keWe/78sm2s8dsBm9bVThOSKVWpKaaYai
 Ko0jRwhyUFoD0iW7sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UUNnaMlT
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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

Hi Jimmy, Julien, all!

Am 02.02.26 um 17:45 schrieb Julien Olivain via buildroot:
> Hi Jimmy,
> 
> On 02/02/2026 15:10, Jimmy Durand Wesolowski via buildroot wrote:
>> Since Python 3.14, the multiprocessing library API has changed:
>>> On POSIX platforms the default start method was changed from fork to
>>> forkserver to retain the performance but avoid common multithreaded
>>> process incompatibilities.
>> https://docs.python.org/3/library/multiprocessing.html
>>
>> Since this is expected to be under "if __name__ == '__main__'", we need
>> to have this in support/testing/run-tests regardless of how this will be
>> fixed in nose2.
>>
>> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> 
> Applied to master, thanks.
> 
> For info, I slightly reworded the commit log. See:
> https://gitlab.com/buildroot.org/buildroot/-/ 
> commit/3d2141bceefda32bef06ddda594eaf8665913276

Unfortunately this patch makes run-tests fail on Debian Sid, because a 
similar patch [1] was accepted into the Debian nose2 package to fix 
build errors there [2]. The result is that 
multiprocessing.set_start_method() is called twice, once in run-tests 
and once in nose2, and that second call causes a crash with:

RuntimeError: context has already been set

Commenting the multiprocessing.set_start_method() call in run-tests 
fixes the problem. I'm not sure if there is a good fix we can apply in 
Buildroot (if we revert the patch it'll probably fail again on systems 
with unpatched nose2), but I wanted to point it out and mention the 
workaround.

I assume a proper fix would have to be in nose2 itself, either not 
relying on a specific start method, or using a multiprocessing context 
to select the needed one independent of global settings/defaults.

Best regards,
Fiona


[1] 
https://sources.debian.org/src/nose2/0.15.1-3/debian/patches/0004-plugins-mp-set-context-to-fork-for-Python-3.14-mp-AP.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1123154
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
