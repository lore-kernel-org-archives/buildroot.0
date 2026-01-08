Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6710FD148BE
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 07:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7825409E5;
	Thu,  8 Jan 2026 07:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMWyzBo11No2; Thu,  8 Jan 2026 07:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BFD40950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767858873;
	bh=fQ/A9hR5EHKJSgteZPJsK3NAxA4m8uYwE8ZkPBRGNRs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZfsaV1USAIW82VCP5HJeKhulZ9rmKwLskmsAcozNBUAmL51HMP7fnIWuGbYC6HCWV
	 zOabOF9bPSconK1VlEss4F5QFlLYFm0G+Ah1DnR5jBr23oU71bhMw3WLFLqm+9BLnz
	 y9THpcwy8BkVGg/IayJ7Eh6yzsDApuw0tziNo7hFEppAF/UKeE+nStozkJP6O1ybm+
	 iVHDJ6SLIKJ4IZBzgg6GroEANoVpLPaB4xPDYvzFXSXLtEzUUi5U4IhUFzs8f0ccIK
	 Vq4TNH8g5Jz/Oehiqy/SWPKUQSXNNXb7JhVj/H24K02yIQ2jbQLstp2Bu3yHPJ3Flc
	 RZxETHLbLjb/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21BFD40950;
	Thu,  8 Jan 2026 07:54:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E652C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 07:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE74382733
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 07:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oR23_hh70tBZ for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 07:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CDA58272D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CDA58272D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CDA58272D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 07:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 90C87B97A673; Thu,  8 Jan 2026 08:54:25 +0100 (CET)
Message-ID: <d45c3aec-d4c5-455b-b51d-c06f271d655c@rnout.be>
Date: Thu, 8 Jan 2026 08:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20251229090719.13291-9-thomas.perale@mind.be>
 <20260107175147.228330-1-arnout@rnout.be> <875x9d5lhe.fsf@tarshish>
Content-Language: en-GB, fr-BE
In-Reply-To: <875x9d5lhe.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767858867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=fxx58nDZQfMGYKY/SAHIYms4CXejcbKEd0s89My7Sis=;
 b=M2R3S/UolM8xkfVcY+Uj/0pzq/V5fClDl7a3xV08ijip70pSw3848Emyj8ID/KeuctJd/8
 1Ik5+VromJOFoeRqSutAt1Kre7erqBXOEIy89t0UjhwllSGcLsEpln67RaDBg9x7s8UigC
 R9LJmy8gkINCnUJ3N/8xxt3t1maJSPN2XhN8SNv2Y1k7VvcBRCAXzCy6mRHAL97L/DeT2t
 PZ6LZE5rtkWOPq5kQ4OQYYnVxM4xBUhlQTX5rQZpdzRc+OUT6mUAw1hMbrNilzZtwSTZXS
 V208Rkv+WZpHhuJmj0/fG4IbC+K1EBGdIqsCcWteAbeQllCYzZw43trXw6rYIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=M2R3S/Uo
Subject: Re: [Buildroot] [PATCH 09/14] package/libconfuse: add CVE trailer
 in patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/01/2026 19:25, Baruch Siach wrote:
> Hi Arnout,
> 
> On Wed, Jan 07 2026, Arnout Vandecappelle via buildroot wrote:
>> In reply of:
>>> Since Buildroot commit [1] the patches that fixes a security
>>> vulnerability needs to reference the fixed vulnerability.
>>>
>>> This patch adds the relevant information to the patch header
>>> and adds the `Upstream` trailer.
>>>
>>> [1] 1167d0ff3d docs/manual: mention CVE trailer
>>>
>>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>>
>> Applied to 2025.02.x and 2025.11.x. Thanks
> 
> Not in 2025.11.x as of commit e98515299 ("package/mupdf: add
> CVE-2024-2425{8, 9} to IGNORE_CVES").

  Applied now, thanks!

  Thomas, Titouan, I also pushed it to .pre, please make sure to pull before 
adding more commits.

  Regards,
  Arnout

> 
> baruch
> 
>>
>>> ---
>>>   .../0001-Fix-163-unterminated-username-used-with-getpwnam.patch | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git
>>> a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>>> b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>>> index 9ff3f5ec1c..4c2aa114aa 100644
>>> --- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>>> +++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>>> @@ -5,6 +5,8 @@ Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
>>>   
>>>   Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
>>>   
>>> +CVE: CVE-2022-40320
>>> +Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
>>>   [Retrieved (and backported) from:
>>>   https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
>>>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> -- 
>>> 2.52.0
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
