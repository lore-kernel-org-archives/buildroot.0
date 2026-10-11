Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74537CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39743606A8;
	Sun, 11 Oct 2026 22:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtFTBQuae__0; Sun, 11 Oct 2026 22:19:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 405DC60612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791757198;
	b=Xvt+TANuB4hVt2YS0E2NDyHg5kdF6P5lcfeXYdjM4XJEWSqD2C3+E9VfWH5AyOnkVBvX
	 QHmh6mypEKr9X7SgP4xHDXJomgzCot7k1K1ouB026dLRVnD/7yjXPoctbaIbxPmBiOgnM
	 cQZbnJSbyB7+Mdf04R2OvtYHud6zPdnsWizXbEXEn4Sj3ivL4/mqf7DVj9VfTNvpWCu/q
	 DC4oBAGA98nBc9ysmV7Wk4r962LnJO0+ny1HQBnkPval2QqUiJ9rmouBtqR67Y3VBYCA+
	 GL4PfsAVeHqqOVY2VhnNxxElL4XcMyPjyicGJZJ1bksGu28Y/v5dfXz81cFFeZqrJOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791757198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rDGtADCe7qDkI4SjkLsqUC73LTlc+uCCKr75iYVjNxs=;
	b=gI1bQ+1mH5TstsM1ilu3AFmOoB9EhWqjVQH095EFWVZ+TvL/8UydsGcKNOPHdIjjMKfb
	 /PYduvSmxOkfvsAzN3kNQt1FXp+i/BXamtx9zeOKy3+lRdC3sWFmGgk1AuwmBS+3dbXXb
	 T1qdOCNJCyXt95MKxwNT0ugq+YQJ1BjMOG01VYHWbFqz9b1HWdd/YU8GM8iJydC0efGAU
	 eb3VxcumO21USireIneAreNMKTaRHEULVrxUjShzMJi0HWvrGcLjdHmNSIT7lXBDiC16T
	 2xzhQDVde/hN/DNbqUSgREumtoLhbKHWlnQKi2gf/28ncxQ3DDGR/9aSebRWSKk7bcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791757198;
	bh=rDGtADCe7qDkI4SjkLsqUC73LTlc+uCCKr75iYVjNxs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J2jhGoVEs/8iVzoIe2sveYjTIbfld8lLdZBsGN1df/MkEsIgFVQYLEad0sVQK/yGC
	 htf1udhxnLpAw3xn+bvn3cGYUzTSpILBbW4npY9oq3oZ0uBsvH0U1lYey0k+LJb7Xw
	 P6tkcv++XYujnYVl8FXEBCurUDEwbIjHQQNfESRuvEgZtZUYonlArn6MYjw+v/igWA
	 4WH9bi3L+VysU+f5Hblwb87tfMS0a1Dy7z2Vmm01pfi0TxC4r2xA+Hy/fAjy2/3IwV
	 yuf8kSDeJpPDJWiAOR6qDv8cPLuEGZq7yK1sDHVH3cC4GjIGwaPnJkSZAmEsJot4da
	 js8Pzay41s4uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 405DC60612;
	Sun, 11 Oct 2026 22:19:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7798775
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DA444005F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cn-Eht8WLDQx for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 22:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BE84740004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791757195;
 b=ZcIIE47lAXzZng39oK7AMIwxqroYuul67BgbMjIAEFinkinjlLarWBChR5tuetqmRpOy
 wNPHTJ/kCJoUFQOkpxongjC8z0jGRvA/T7v4tDbpf9shQ2Dgr3rswWmY8RYJy3D9ENeS2
 LlEcfo6949BenZdi0oJZx/BNmoQoxiodcJfLIo6Rc+Ccbz1UliA6FG6cfXM7lU1AAbhBM
 3dW5FW7kvTLV7et+BjBqs0QyKq7bgE07DOedrB3RjYPQgpl1i2H6dS1wyLa/HOnOnk/20
 1dz3kN8x2G3L+MlsWlIW23jzFBwnBDv6tIMbIou7ZUNyBlo0KI9kodCQbDUKYGoPd2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791757195;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=iHpe3Nvxcff5i++hiPkD0/dOMvy9hyW9JGosdpMEyEc=;
 b=P4U8dh2pw097uKoW80ZbFiR5g02cYC55d5j4yBxoowqcb6ulwvH3A3kyfpIo+5ptaV+m
 BUoEmxML+gvXazii6skVocnzHI7B4H2va8zcFGfOioYMZFaeM+3fOGoTqkW73FIxq3eDa
 dd7FTa/oiO3ZVjPOWKObkByJY9JzXRCClPq2p1QBETJysJc5cAWYp5ICCcdohviiBtxDX
 0AB6tO/fBbf4e88EfbL0K9uwbiHV/wIgY7ff1MVfppOE+dbjSgsDRu7lgIypo8HB9WIDA
 tItvZRUkouKC+Uk1adKBxautSA2avtOZm4SSl5bWcDRuTTuplMKR19Qpb68wi6djg1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=J+SPzu5Q; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE84740004
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:19:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1wvTAo2APd-00Pzoq; Mon, 12
 Oct 2026 00:19:51 +0200
Message-ID: <5ee0c4ce-abdb-4b38-a3fd-c356a43ebbd0@gmx.de>
Date: Mon, 12 Oct 2026 00:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <20261011203230.2072127-2-fiona.klute@gmx.de>
 <20261011205857.812885-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261011205857.812885-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:+XFK69tEM/lq1Cey7lm5kRPwQm6Y+Gf6+O4hMabJTkziP8SRPma
 Oa3NlyshBakYziJlEAs2rYQkRxijOo+jPsEKAGItsBzPJxqFsdhwr3WcAn24pE2Pzh+GbIQ
 e9dNL6ovUvvftlXPGhovxMPwQAxZT217DN8I8LzkzfpQ8SqxccVnyxhkSY0xt8JEEhY05ch
 RMV+92iHV+hKggQdUnn8A==
UI-OutboundReport: notjunk:1;M01:P0:SPhK+G9xAyg=;Jts1H/qyKjSxL2p0DQQpNAfgz4I
 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
 Aa4X/VydSgT8xLD7XidQ=
Subject: Re: [Buildroot] [PATCH v5 1/2] package/pkg-utils.mk: include
 external tree info in show-info output
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

Hi Thomas!

Am 11.10.26 um 22:58 schrieb Thomas Perale:
> Hello,
> 
> In reply of:
>> This allows identifying packages from external trees, and the external
>> tree version allows identifying the precise version of the packaging
>> code independent of the package version. If needed, the location of
>> the external tree can be derived from package_dir and further
>> information loaded from there.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> 
> Acked-by: Thomas Perale <thomas.perale@mind.be>
> 
>> ---
>> Double SOB line is because initial development was sponsored, but the
>> current revision wasn't.
>>
>> Changes v4 -> v5:
>> * Name package property in show-info output "external-tree" instead of
>>    "external" for clarity
>>
>> Changes v3 -> v4:
>> * Add an "external" mapping with external tree name and version to
>>    show-info output for packages from external trees (this patch).
>>
>>   package/pkg-utils.mk | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 17b0aa1760..454ae376c0 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -111,6 +111,17 @@ define json-info
>>   	}
>>   endef
>>   
>> +define json-external-tree
>> +	$(foreach name,$(BR2_EXTERNAL_NAMES),\
>> +		$(if $(findstring $(BR2_EXTERNAL_$(name)_PATH),$(1)),\
> 
> NIT: Took me a bit of time to remember why this was needed at the time and then remembered that external packages have an absolute path instead of the 'core' packages that just use a relative path. Would be nice to have a small doc-string in the top but since this is not enforced consistently in pkg-utils it's up to you.

That's reasonable, yes. I've added the following in my tree (right above 
the "define" line:

# json-external-tree -- if a package is from an external tree, format
#                       its details (name, version) as a JSON
#                       dictionary entry with dictionary value
# $(1): path of the package directory, relative for Buildroot
#       packages, absolute for packages from external trees

Could be added while applying, otherwise I'll send v6 in a few days.

Thanks for the review,
Fiona

>> +			"external-tree": {\
>> +				"name": $(call mk-json-str,$(strip $(name)))$(comma)\
>> +				"version": $(call mk-json-str,$(strip $(BR2_EXTERNAL_$(name)_VERSION)))\
>> +			}$(comma)\
>> +		)\
>> +	)
>> +endef
>> +
>>   # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
>>   # for json-info, above
>>   define _json-info-pkg
>> @@ -121,6 +132,7 @@ define _json-info-pkg
>>   		$(call _json-info-pkg-details,$(1)) \
>>   	)
>>   	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
>> +	$(call json-external-tree,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR)))
>>   	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
>>   	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
>>   	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
> 
> Best regards,
> PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
