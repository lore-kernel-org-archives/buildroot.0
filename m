Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F405ED0D162
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DA981150;
	Wed,  7 Jan 2026 18:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbhuQZ60qfwU; Wed,  7 Jan 2026 18:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CF4810FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767810308;
	bh=Sl5xYLdpH/euAWcEa5B6BJqv2F7qayhi2aksqs/l8DA=;
	h=To:In-Reply-To:References:Date:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UiGEoD3/36+XbCjisTe+SPo6oRdPWHCseiqiIGjMNNe+QBkr4kafFF/8qHKZ3McPF
	 l6PHSOAiyeHt/AiiaXS/Z8gqJmoARPYzzO2MIITrOc6CGFDNdtuGKWN9tEJesO7fAT
	 ZLj/Zc2EDT0KRgPVbgSmu8X4JFNFv08J+o8EAmy9zBT3vG2iP1/ZsH2/28+R8v3DF0
	 FEiLISl+4FgjnnxUIAI7R+Lywvrdwg6OGMJfffQS4uFyaw9JBG1ZGcKM1lSMqeMJr1
	 YL5I/rBkxClcw+xgsa9LK1r3macEVd+qP6eDp4SOa8YjcBhD8NcE2021B3Sboy25y4
	 KqwwI9j/uDY6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5CF4810FB;
	Wed,  7 Jan 2026 18:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A93436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 047CB40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LluJRL0aQamF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 439434000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439434000B
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 439434000B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:25:04 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 964634405EE;
 Wed,  7 Jan 2026 20:22:06 +0200 (IST)
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <20260107175147.228330-1-arnout@rnout.be> (Arnout Vandecappelle
 via buildroot's message of "Wed, 7 Jan 2026 18:51:47 +0100")
References: <20251229090719.13291-9-thomas.perale@mind.be>
 <20260107175147.228330-1-arnout@rnout.be>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Wed, 07 Jan 2026 20:25:01 +0200
Message-ID: <875x9d5lhe.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1767810126;
 bh=Xb9vdjs2CWyQdPuJdsKsHlULf8sIzUIshso18zpDrDQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KHCRNtL9XtbR2yLjHT873pJthc1+Ca6CDLVvy5VHFLOqe593B7GclzPmNt8TSY8Ep
 3xOhCgUAa11jqcrSbKXGdr99mqLYxEUh+HpZF7o4j7dlvfgCK43BRQ0Bzct83KHOIN
 HVUw/scnSWbB/w71lDgcSYu1ARMrnqT3I6K1QrokbB9yjc5HfyXEnHhd3jV76NmW0q
 ZfafOl3XYlYenfbCkgKWFY+p3Rdpu3UHH8wBNte5xczZNoQeyIKG2YZ/NjbULymey9
 sZCZT3365zReGSSDibJ7NUySLHWbFykssQ7fTf+E8T5JRELdFbw5Uk1NiVzoOZLfQj
 xXSfSiPFibRZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=KHCRNtL9
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Wed, Jan 07 2026, Arnout Vandecappelle via buildroot wrote:
> In reply of:
>> Since Buildroot commit [1] the patches that fixes a security
>> vulnerability needs to reference the fixed vulnerability.
>> 
>> This patch adds the relevant information to the patch header
>> and adds the `Upstream` trailer.
>> 
>> [1] 1167d0ff3d docs/manual: mention CVE trailer
>> 
>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>
> Applied to 2025.02.x and 2025.11.x. Thanks

Not in 2025.11.x as of commit e98515299 ("package/mupdf: add
CVE-2024-2425{8, 9} to IGNORE_CVES").

baruch

>
>> ---
>>  .../0001-Fix-163-unterminated-username-used-with-getpwnam.patch | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git
>> a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>> b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>> index 9ff3f5ec1c..4c2aa114aa 100644
>> --- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>> +++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>> @@ -5,6 +5,8 @@ Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
>>  
>>  Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
>>  
>> +CVE: CVE-2022-40320
>> +Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
>>  [Retrieved (and backported) from:
>>  https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
>>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> -- 
>> 2.52.0
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
