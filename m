Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9B0C44501
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 07:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C6681985;
	Thu,  9 Jul 2026 07:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swICX5Zk_7eY; Thu,  9 Jul 2026 07:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB7481971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783581055;
	bh=xKW0fMcp1/modaPgH3BIK4AQUz3rXJSn6TjCEuBLSbg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=g0+ClmT7C5YZiaxJwYkeponxsAJZ8nC6/27JEfLiwTXMnjL5ObEVB650ksdhEO6WN
	 I85+6FwqKXIkSHEw6+2VdePEd7fJMhIF69yfyFa3d3awoyrfE/y0rTe3hn/YUOWcTY
	 ssntWk41g14VpnruafvSoAkvlTm7MuTLoJqz+jJsXi+nsXW4W2HLNJKdCVHefHO9l9
	 tYo5cJ4OABdfc9/o5g+3u/h7JSeTU0Qq/c4FhXLi7mppqGOLGAPs4nQC85ImO/GzY6
	 yctmMtX9Tv5JVjllIX6s41+OHVMds0iIJLTYBFpReqwpDSHjkLDpm/kLnJ8dRer3sy
	 KNCaRFttxFvnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB7481971;
	Thu,  9 Jul 2026 07:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C17D7315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 07:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A656F4091C
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 07:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBKqOA7mYh_e for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 07:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31440405AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31440405AC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31440405AC
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 07:10:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47df440fcd5so598556f8f.3
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 00:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783581048; x=1784185848;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cA8DS0fQsF9Ir8anX+Zgpht9dswe15ratGH56WQrph0=;
 b=od/zMOe52w5R03DS8NO7eUmp8qgeh86AShGf2O/bidKGPqOE0zc4U3S+QzlKqOG0op
 G6EhzNbvXjPTyojuOc2kevfFuDqPewULBMF9+hSq/mwnYvzI/Z+iGvEDZtxfv65Npuj2
 USf3fflOhw7657A3F31xiXNEgrp7nORc5KqBWY021I0/DNSIrtC0tv/0JH/qUm/gaJJg
 EWsSZfSP57MkQl6/QBPmJfS1IgGJVtvzpTabem3cjvF5BoKS+n4dTPPOFizaRxbJiL02
 wBfoISMfsIxn3IhWumcUaa+bGiM2Eeu/REs/VjN3togQqHCfG1PoC5jJGTdAiveQkgiV
 UiKA==
X-Gm-Message-State: AOJu0YwcpRf/Z9FU2VqL0nW2MSszoRDnEuhuJ2qHeYms5muJtr/CMGax
 rMQEKkjlt+zKOGyNeJ/IFGC0be9Jb+dKVrqpMbm61XN07yb6Jlr1JT/pDYQvI4pSGAc=
X-Gm-Gg: AfdE7cn8BC/tQ9szxT5YdFzah2lZCjdjcV/V8FFeSA4UqAgXUyi6ZjE/t+BzaOKmW6y
 w5t7fGv6H+OtEtSEjs+9Vi/mPQbxaqUHQ/jaheXp5kmYY5BzBf0FLM0i3waFEmIrJfEVFgrwT/Q
 2SwuRseaUEr7zhHXq7jcFYsBTFfbUp7hQtsdYOGbu6yFplpY8nfwnYVkaY5B1Qa8QOyM553e+ng
 btdzBhvlLGcz+x76vLYMQMhPgpcwz+slzMphhK0Ij0LzKbnFqgAWg2mO4uYyc3a2ZwB141/3yOH
 GlaEkQxux/b/eAF4rSdNLHaYAT+keBDKkI7JMaNg56fvRf75QyOnDmO+nt3FG8CxDHU2yublhxX
 ymE/PNX2KWzWxz8cddg7XLe/gY0XplIvjxmhqHJ94vfXeasNySa2Yu6A3PusjMVU3oP+dycH+rB
 KxRxxR5BRyB8TXueQH3GYm0CceA3qDv/hzNWBRp2aPlJWDIev3VybZDtYVeL9AGjgvISQ06xMWl
 8zShHAzZYG3KZyvddC5tDfeSdxJzmAxWe4sykGPGTDxG3WaHw1c8v8=
X-Received: by 2002:a05:600c:a55:b0:493:a5d4:3798 with SMTP id
 5b1f17b1804b1-493e6859a16mr57940925e9.1.1783581047962; 
 Thu, 09 Jul 2026 00:10:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a558easm48931690f8f.27.2026.07.09.00.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 00:10:47 -0700 (PDT)
Message-ID: <1fb8e724-87a2-49cd-9084-75e288715b93@smile.fr>
Date: Thu, 9 Jul 2026 09:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
 <akyWylX0rDN1XX6N@yd-6wlzhs3> <77b8d847-cf94-4919-bbef-bb934e1fbc9d@smile.fr>
 <c4368489-8d6e-447f-9568-c8f87b0d19e6@smile.fr> <ak8y7dUp1ueJ7oLy@yd-6wlzhs3>
Content-Language: fr, en-US
In-Reply-To: <ak8y7dUp1ueJ7oLy@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783581048; x=1784185848; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cA8DS0fQsF9Ir8anX+Zgpht9dswe15ratGH56WQrph0=;
 b=kCh/9x30BY7i4ARAvKFxN8eCqnHLkl1u9/iGKu+aW7lwBNu5PK9CIevRDYN+Shk+hA
 ROUEW0J8FWnG7Lyh17PowY6hdykixKS79QWJH+GXN3xTmif1ngqusQRvi2t+D8aXdLnR
 r5LvANEeLpfWkXATeYJRFlk8qp6F6UlxtoOuE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kCh/9x30
Subject: Re: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Dowan Gullient <dowan.gullient@smile.fr>,
 Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDkvMDcvMjAyNiDDoCAwNzozNCwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gUm9tYWluLCBBbGwsCj4gCj4gT24gMjAyNi0wNy0wOCAyMzo0
OCArMDIwMCwgUm9tYWluIE5hb3VyIHNwYWtlIHRodXNseToKPj4gTGUgMDgvMDcvMjAyNiDDoCAy
MzoyOSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4+PiBMZSAwNy8wNy8yMDI2IMOgIDA4OjAz
LCB5YW5uLm1vcmluQG9yYW5nZS5jb20gYSDDqWNyaXTCoDoKPj4+PiBPbiAyMDI2LTA2LTAzIDA5
OjUxICswMjAwLCB5YW5uLm1vcmluQG9yYW5nZS5jb20gc3Bha2UgdGh1c2x5Ogo+Pj4+PiBUaGUg
RGViaWFuIDEyIEJvb2t3b3JtIHNuYXBzaG90IHdlIHVzZSwgMjAyNTAyMDMsIHVzZXMgdGhlIG5l
dyBkZWI4MjIKPj4+Pj4gZm9ybWF0IFswXSBmb3Igc291cmNlIGxpc3QgZmlsZXM7IGl0IGNhcnJp
ZXMgYSBzb3VyY2UgbGlzdCBmaWxlIHRoYXQKPj4+Pj4gcG9pbnRzIHRvIHRoZSBjdXJyZW50IHJl
cG9zaXRvcnksIG5vdCB0byB0aGUgc25hcHNob3QuCj4+PiBJIHN0YXJ0ZWQgYSBsb2NhbCBidWls
ZCBoZXJlLgo+PiBCdWlsdCBsb2NhbGx5IHdpdGggc3VjZXNzLCBub3QgeWV0IHB1c2hlZCB0byB0
aGUgQ29udGFpbmVyIHJlZ2lzdHJ5Lgo+PiBBcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzLgo+IAo+
IFRoYW5rcyEgOi0pCj4gCj4+PiBXZSB3YW50IHRvIHVwZGF0ZSB0aGUgRG9ja2VyIGltYWdlIHRv
IERlYmlhbiAxMyAoY3VycmVudCBzdGFibGUpIHNvb24sIGRvIHlvdQo+Pj4gdGhpbmsgaXQgd29y
dGggdG8gcmVidWlsdCBpdCBub3c/Cj4gCj4gV2VsbCwgSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8g
cHVzaCBpdCBub3csIGJlY2F1c2Ugd2UgaGF2ZSBubyBFVEEgYmVmb3JlCj4gYW4gdXBncmFkZSBp
cyBjb21pbmcgKGJ1dCBnaXZlbiBJIGhhdmUgYWxyZWFkeSBtb3ZlZCB0byB0cml4aWUKPiBpbnRl
cm5hbGx5LCBJIGNhbiB3b3JrIG9uIHRoYXQgaW4gdGhlIG5lYXIgZnV0dXJlLi4uKQo+IAo+IEJ1
dCB0aGF0IGRvZXMgbnRvIHByZXZlbnQgdXMgZnJvbSBwdXNoaW5nIGEgdGFnIHRvIHRoZSByZXBv
ICh5b3UgaGF2ZQo+IGJ1aWxkIGl0IGFscmVhZHksIHlvdSBjYW4ganVzdCBwdXNoIGl0IDstKSAp
LgoKT2suCgo+IAo+Pj4gSSB3b3VsZCBsaWtlIHRvIHVzZSB0aGlzIG9wcG9ydGluaXR5IHRvIGFk
ZCBhIG5ldyBHaXRsYWItQ0kgam9iIHRvIGJ1aWxkIHRoaXMKPj4+IGRvY2tlciBpbWFnZSBhbmQg
cHVzaCBpdCBkaXJlY3RseSBpbnRvIHRoZSBHaXRsYWIgY29udGFpbmVyIHJlZ2lzdHJ5LiBBcm5v
dXQKPj4+IHN1Z2dlc3RlZCB0aGlzIGEgd2hpbGUgYWdvIDstKQo+IAo+IEZUUiwgdGhhdCdzIHdo
YXQgSSBkbyBmb3Igb3VyIGludGVybmFsIHJlZmVyZW5jZSBpbWFnZS4gVGhlIHRyaWNrIGlzLAo+
IHlvdSBkbyBub3Qgd2FudCB0byBidWlsZCB0aGUgaW1hZ2UgZm9yIGV2ZXJ5IHB1c2ggaWYgaXQg
aGFzbid0IGNoYW5nZWQsCj4gYWRuIGlmIGl0IGhhcyBjaGFuZ2VkLCB5b3UgZG8gbm90IHdhbnQg
dG8gcHVzaCB0aGUgaW1hZ2UgaWYgaXRzIHZlcnNpb24KPiBoYXNuJ3QgY2hhbmdlZCAob3IgeW91
J2Qgb3ZlcndyaXRlIGEgcHJldmlvdXMgaW1hZ2UpLgo+IAo+IFNvLCAiSSBIYXZlIEEgU2NyaXB0
IijihKIpIHRoYXQgY2hlY2tzIHRoZSBjb25kaXRpb25zLiBJIGNhbiBzZWUgdG8gbWFrZQo+IGl0
IGdlbmVyaWMgZW5vdWdoIHRvIHVzZSB0aGF0IHVwc3RyZWFtIHRvby4uLiBMZXQncyBzZWUgd2hh
dCBJIGNhbiBkby4uLgoKR2l0bGFiLUNJIHByb3ZpZGUgbWFudWFsIGpvYnMgWzFdLCBJIHRoaW5r
IHRoaXMgd2hhdCB3ZSB3YW50LgoKV2UgY2FuIHN0YXJ0IG1hbnVhbCBqb2JzIGZyb20gdGhlIHdl
YiBpbnRlcmZhY2Ugb3IgZnJvbSB0aGUgQVBJIFsyXS4KClsxXQpodHRwczovL2RvY3MuZ2l0bGFi
LmNvbS9jaS9qb2JzL2pvYl9jb250cm9sLyNjcmVhdGUtYS1qb2ItdGhhdC1tdXN0LWJlLXJ1bi1t
YW51YWxseQpbMl0gaHR0cHM6Ly9kb2NzLmdpdGxhYi5jb20vY2kvdHJpZ2dlcnMvI3VzZS1jdXJs
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
