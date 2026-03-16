Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB5DF30275
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E40410E7;
	Mon, 16 Mar 2026 21:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIs82jumntNe; Mon, 16 Mar 2026 21:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAD5410E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773696527;
	bh=awmf7U/VNmVHa2O31MGeCyOvZ5SwexX+Pw87UbeLAtc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O8FtQakbs+hqVEeaJS8ekWJQX6/XZ8VUUJjwAmbO+pLSABIFpSy9ZYVXvCVWPu1B7
	 AnTCwWKxr7RUDP+VNL9oPwveDJJKohi7B4wCjP6G5pgjyE++LNK32vmBwOgr/562rw
	 INPlwBprQ2LIK8JORGAOtJMqT/FXuzhyjh+j2PW8ect/Kp2cTuNv/ZCLWYWj3Is11v
	 TrCInszvB4z+yK9lI4BRH38NL9f9aAhkYiz3+1tJSbRM1HDSlBA7t7KYlKnzIfuQ0j
	 gN/TUNhwJDcm7mBkbXBdf+T7+g1w64K1/pggVxu6cETHcDTeacvj4nsbvy5v/FeDIL
	 v4sJ8AHj5Aqcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BAD5410E8;
	Mon, 16 Mar 2026 21:28:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 474863C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C28383870
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO-tQoA4i56X for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D3E28386F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3E28386F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D3E28386F
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:28:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 77B2178032A;
 Mon, 16 Mar 2026 22:28:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Mar 2026 22:28:40 +0100
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 22:28:40 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
In-Reply-To: <cc8642ba-44aa-4971-b682-52bf3abe5dd8@benettiengineering.com>
References: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
 <06e35fabddb8f84102a922b63710ea3d@free.fr> <20260315230743.GB267706@pevik>
 <74d33c7d-ec03-45ef-82ae-f75fb8bc35c7@benettiengineering.com>
 <cc8642ba-44aa-4971-b682-52bf3abe5dd8@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <0779d55b109fcf2a058641faadd8af26@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773696522;
 bh=4+pSpTAM0DDzzw2LHGiP8bpDYszCRuCVLVLlCNuScOs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pn7KxfxFhj9rVtSRLGm7PAi9wkt0/30Q9Vj82mnVewwo9h2kIvHdOdBC1AlIEurIQ
 d/ia43VBi0EssSE548AbywJZ5EibbhPhMf49g0VVbGhpZpQupZWrhreRrDE7KN1Cn1
 l+w0i6R7+AiJvVAdLSMDxVV9JwPrSNhxuY6VB3/YVznuv9IPPVLA1Po0j4ldv2GCLj
 Y9JYMOaQ5m4LEDGjslhVHlDMj42sfm6ZCdF3ZHjfEBl4Uskv8LReiN9/IprBb/SXg2
 ytPL8F479mNCQGj6y6kqvz3W+BaaZphiZeRkxVgXpmvI7D9docS+Kq+wZyrZVCzUK1
 JTow0KWigTltQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pn7KxfxF
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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

Hi Giulio,

On 16/03/2026 11:54, Giulio Benetti wrote:
> On 3/16/26 11:53, Giulio Benetti wrote:
>> Hi Julien and Petr,
>> 
>> On 3/16/26 00:07, Petr Vorel wrote:
>>> Hi Julien,
>>> 
>>>> Hi Giulio,
>>> 
>>>> On 13/03/2026 22:10, Giulio Benetti wrote:
>>>>> Release announce:
>>>>> https://lore.kernel.org/linux- 
>>>>> nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/
>>> 
>>>> The commit title says it is a "security" bump. I can't find any 
>>>> reference to
>>>> security
>>>> fixes in the release note. Could you provide details?
>>> 
>>>> Or is it a copy paste error from the previous bump?
>>>> https://gitlab.com/buildroot.org/buildroot/-/ 
>>>> commit/7dfd2feb445c2cf83a2b52057fab96e72e42a071
>>> 
>>>> In the later case, no need to send a v2, I'll just remove "security" 
>>>> while
>>>> applying.
>>> 
>>> I'd also say it's just a copy paste from 2.8.6. 2.8.7 seems to me 
>>> only a bugfix
>>> release.
>> 
>> I interpret commit [1] as a security commit, but maybe I'm wrong.
>> It's not a CVE or similar but to me it sounds like a security commit,
>> this is why subject is " security bump..".
> 
> [1]: 
> https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.7/2.8.7-Changelog

Applied to master, thanks.

I removed "security" in the commit title. While I agree that using
uninitialized data from the stack might be a security issue, we
generally flag updates in Buildroot as "security" when there is a
mention in the release note, a CVE assigned, or an advisory. This
"bugfix" release will go in Buildroot LTS branches anyway.

>> Best regards
>> Giulio
>> 
>>> Kind regards,
>>> Petr
>>> 
>>>>> Signed-off-by: Giulio Benetti 
>>>>> <giulio.benetti@benettiengineering.com>
>>> 
>>>> Best regards,
>>> 
>>>> Julien.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
