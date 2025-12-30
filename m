Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B2E92722
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 05:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49DBE40649;
	Tue, 30 Dec 2025 05:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hruqWyKcI41b; Tue, 30 Dec 2025 05:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2998440519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767072778;
	bh=r5R0QZEPnjz0d5y+XudujE2Rtsw66vNsZJ/AeFohFhk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=kBm310gLRFhgFDmj3Gqj2kLADR1idH19vGDMImdpuI9nuzIZYj1uX1tiOPeYCoHL8
	 7Ob2ENDtc5a4Yn7uTQsJ/Jc5uOA4i1DXNGsut8usfIRI7LedhDBp4auIGgugzuo0A+
	 u9q8lYigZ6UwktetSVPxWH9zRmOHLobXRckAybb66zZqcmEqVTdWuHVbpNM58MQb7L
	 5QiSu5JiDz5qs92f1SbdlFCydsFQDli/zABcxx4/qaIxmvenw0ThGVfQXc+9bw3074
	 8rc9SzdwadTmapLUHfJe6CvEtJN5StPqcIw6u24/hRvuF99Wt8vhDhRpLRm6btOOqj
	 ojt2pHsjHzaQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2998440519;
	Tue, 30 Dec 2025 05:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2178F177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 05:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06F6E81132
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 05:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEywzeVEQQ0p for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 05:32:55 +0000 (UTC)
X-Greylist: delayed 911 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 30 Dec 2025 05:32:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00E74810F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E74810F1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.78;
 helo=send239.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send239.i.mail.ru (send239.i.mail.ru [95.163.59.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00E74810F1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 05:32:54 +0000 (UTC)
Received: from [10.113.18.39] (port=35252 helo=send149.i.mail.ru)
 by exim-fallback-7cc5959d8d-q8mr5 with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1vaS72-00000000Mbv-28Ot
 for buildroot@buildroot.org; Tue, 30 Dec 2025 08:17:40 +0300
Received: by exim-smtp-7b4fb89df9-4rqsk with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vaS6p-00000000Bhd-2ify; Tue, 30 Dec 2025 08:17:28 +0300
Message-ID: <df0ba331-9509-4c15-b23a-34783c73f934@inbox.ru>
Date: Tue, 30 Dec 2025 08:17:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20251229212149.167902-1-thomas.perale@mind.be>
 <20251229212149.167902-7-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20251229212149.167902-7-thomas.perale@mind.be>
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD915529E8FC4AA0671BD67E88CAEA01909A7D0956CEC736A9C1867C24CE74E72BB5FE18E9CBFBE7C0707C0485CA639CA67E530197BE547E8BFD194E1F1D61F74A5DE97A92B948BC3A9660823B2EEFD31DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE742D9BD90C58D50E0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2D528D66B13FD8CBF2E070BE324C7D3C458BDA4DCC4C58D53BB0A4F435E46E6718B35066C979671628AA50765F79006370277CA7F994D7EF5389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF87214F1A954108EA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CAA44A86D94E7BBB043847C11F186F3C59DAA53EE0834AAEE
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5530C660782ABDEFA5002B1117B3ED69670B6984C6D8A2ABC715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD0AA277257C6A5E3DBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6592639ACF19CC1CF3513D26124765BD4C6B0C1203139F47E2475FED9161F6746881FAED616A0D6C212B8341EE9D5BE9A0A8853BC85C33D6323F7CC7C7C257A182E08905987C9814A9F546A885F7A58241B4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVTZJppT4ZVHRzt5pmNxq7a8=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2632DE36F423D014731C1133BA2037FF284D435E03BBDDA4890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B414E2BB1FC3DCCE2F5D926209BB32FDF01D5785F45FAC9B22049FFFDB7839CE9E314DDF40E8ADA771E5BE6F763ECAF6D63A829FECC08B48BD0896C102DB5207F6779F1FD6862BD636
X-7FA49CB5: 0D63561A33F958A5B3A564AA429A86DA5002B1117B3ED696467C8BCF3DA57B919F6E6D0C7B647F4E02ED4CEA229C1FA827C277FBC8AE2E8BE75104DB1CFE09D5
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZaRk/SPCY14kVYys/TP5nhg==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=z4RaRo5wZFeLyNQM8/XYX6vKscjUyMTW2AvY6WHQlD4=; t=1767072775; x=1767162775; 
 b=pT5F3kCF7hlRc233qaM0TeE36fZQNNRqN7bfS0VLBX/uGisF7ruY88mjUspeA3GzKEXY2jl+8cn
 v0zfNQBnpbjv2SmIryaX3BTfcnug23sr66WYU+uAneJ49kJpIvkAi0i7wkm3qm//HTB5EtVKVlYWy
 6B+MrriNv5w+671yFfNdDtKwx0n5McFUPLvTAKGp0VMC29DYrGDbf7sBTnb+xkCWm7kgwNdxL891l
 3YeOR8R++KJquHciKrwisWv+s0mp09GJ3CM9ofSnp8k4Z/Ub+flQ7nhp17xvA5d+uG34MPRLitYcS
 a9TRgSUz3/p3x7T1nbgFC/fT5pcr7rmUb1iQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=z4RaRo5wZFeLyNQM8/XYX6vKscjUyMTW2AvY6WHQlD4=; t=1767071860; x=1767161860; 
 b=CAmKVFdteSBGn4P2ucD+hOPxbzQ+LgXPy5TeWoW3cXJaCTyTz4IwBIKcWkedtibpY/T2W7fMJmy
 NLcDVHcm01wld1eo2Jy+FplCsAEr5nVT3IjpntgYDC4lT3LrTYelfsJ+kAifcpr+12sUeAjJVL13Z
 rTuXGb+xKxoFZTG0pVHkcdC/H+B79WYaX/ARDPt+dWAhMizLUEmWoZa+pRyh3tYiN83ZHkt+Br9Qt
 ABj8GGZelhUCMredzMobZ8vHrrKjzuDa7CrflQoulm1pdxCVYIxJ7lLiENrM0AxKF4v96vPRcUd0U
 WXyc9OH9kORpv4IZuzDAY/u7uZtvgPhgvMvA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=pT5F3kCF; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=CAmKVFdt
Subject: Re: [Buildroot] [PATCH 06/15] package/postgresql: remove stale
 IGNORE_CVES
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

30.12.2025 00:21, Thomas Perale wrote:
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> The CVE-2017-8806 is then no longer matched to the postgresql package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>


Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
