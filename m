Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416B1CDE008
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 10:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04DE60EDE;
	Fri, 26 Jun 2026 10:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaWGi2pJf7be; Fri, 26 Jun 2026 10:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 258C560ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782470513;
	bh=JefiUfM8i6NeQTXj/L73sT2v6kkw4qdgzhvHIVAYBt8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hi08KDx1scrrCygFmZC9x/TaYlMDwH6YMFXmiubityFEzXqgu2lODlBnYFh5U4Wvg
	 IJ/BEIzJEwsYEj5fYKsmTkWK3KHgKnbzA/SoG/Ty2bAnaxv2DR9kIEN9EtvUqXSDOY
	 G+Ky/8OObwl06vkxu2UIEiMXeSaeqEY2Bc/7QFiCo9AMDTwZON0OOsXQq3LwWDmc61
	 1YrLBmv2Ub66pxMoEd2wRiiIkCDB6zcGtBrsnMXb6f0c8dktFHf2IrFGaVnWr97kfG
	 yBVEwYu4aIRm9MkHG3n8NUTan3jpftg21QIYtlbuJ+S3oj6+vJI9WJPNnQ4Vq92ytQ
	 2n6cGLyQmrUMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258C560ED7;
	Fri, 26 Jun 2026 10:41:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E41F83A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 10:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5812406E8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 10:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2p-_hgrNnWA for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 10:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A979406E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A979406E0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A979406E0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 10:41:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1xQM6Q2onv-00sAgr; Fri, 26
 Jun 2026 12:41:45 +0200
Message-ID: <628553e6-5076-4374-ad62-3a49828c75dd@gmx.de>
Date: Fri, 26 Jun 2026 12:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz via buildroot <buildroot@buildroot.org>,
 Quentin Schulz <foss+buildroot@0leil.net>, Martin Bark
 <martin@barkynet.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <877bnm7aye.fsf@dell.be.48ers.dk>
 <20260626070140.4195-1-thomas.perale@mind.be>
 <87y0g163vm.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87y0g163vm.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:1OpNSNPHhQj4HHXp+Y5zZ48mu33tO0cCVf7De9hGUFfYlRto/Qi
 fdCWqIQqEJ0vDSY3sSKFJ5V7nTeTiaOmt8N8AAv6fFFAZ3G0NrzoTZgkfAiVsOGjvbbV+oP
 NyyIs4mpBW3mIpJBkEomXYB1SWMh595KDxGehZS7Tn8FsnjVdcBr5bt+uP6CNwTYm/BRrDT
 qCqRcCAyR+TWpAYljHAGA==
UI-OutboundReport: notjunk:1;M01:P0:Zc31151h8iw=;JxjovkaqimfOqWW0e1VQZ96SCYj
 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
 TgCcUgBarsW/XMtT7BuJ9KgmGsmw25o6SYfCqGU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782470505; x=1783075305; i=fiona.klute@gmx.de;
 bh=iQJxds5BUdr5ckiVedrCetV81lhIngJ/jPlpNwVNTrA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pQ5UX0SSt7Ogtm3FsS2yJEPpRPunvnGklfe4M9h0n7DYQToKinPPSv/Wls7ZptJa
 0khheAl2yzbHfB4Cr3Bf/6ArB93jlX3CpEHW1RIE61LntJFOjuK7h/AFhJWToe57T
 UnrNOtBU5yncSXhxUWq3mIf3Iyv0VwcIvhIQ8cmD4IgraboVJNLCUv1c/K4u3uuxf
 sRG9jljxFvqzjtQiDZulfU9C/U6ap0MTYW0OGkFB3rDsyruBgrbtjaObghNZuJYbm
 a4pEoAvn0pG3s7e22hP+bw3H66PSNTt5wXzHuyViW4bHsOCsK8M3oFI/ibyROZlhK
 xo7sZDHLar9eIuO7MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pQ5UX0SS
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

Am 26.06.26 um 11:35 schrieb Peter Korsgaard:
>>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:
> 
> Hi,
> 
>   >> Then I think that the pragmatic solution is to drop those list type
>   >> hints. Thomas, I think you originally added them, what do you say?
> 
>   > Sure we can remove it. That line doesn't add much right now.
> 
> OK, good! Quentin, can you send a patch removing them after verifying
> that it then works?
> 
> 
>   > But would that mean that in the future we need to make python 3.9 a potential
>   > target for any new changes ? That would be more annoying in the long run.
> 
> I guess you mean python < 3.9? It is indeed always a tradeoff. Maybe we
> could start requiring python >= 3.9 for the 2027.02.x series?
By the time of the 2027.02.0 release, Python 3.9 will be EOL for well 
over a year, and 3.10 for a few months, so at that point I'd prefer to 
go right to 3.11 (which is in Debian oldstable now). Plus it brings some 
nice typing improvements.

In any case I'd definitely like to have a clearly documented minimum, 
the manual still refers to Python 2.7 in a few places, while 
support/dependencies/check-host-python3.mk looks for 3.4. I think for 
people with very old system Python the pragmatic solution is to use 
host-python, if there are any issues with that we should fix them. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
