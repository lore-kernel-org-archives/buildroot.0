Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFCFCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FFA814AB;
	Fri, 16 Oct 2026 12:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8knXE53pkYca; Fri, 16 Oct 2026 12:55:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 458E081499
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792155337;
	b=L7or3GrHenSUuVmm3s9snKRVGiVKC+8fXgFbg38PQ2qNujy5de/qtyf4U0qIduwfxRcM
	 4mqai63on5VWWYJLUF0zPIw8bz6gPbUQuefvA/+IivMRY/g9SYfUYysDcAywVPcDAtQjw
	 zClnDr8GRNF5PejLBBSBjIB0f1QJRKfc51+reKlBnVtnO/0JykurZvW1MCyEBBV4wOox5
	 DtiXgBVGH7hC7IH8nnUNWGj4a051yyaNjC2QJXsllRBaRHqOrdRKlCjY+YM0QCj224j6R
	 PBMKJLzik9zShS9+UaOITVjQu2owVzy66Yp79V4eYOzULvXmaZnnVhMRW4bA9hZ26BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792155337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=8CIsJEohqO32cpXjevXTXirMtL/o4BLhNHSpXjbXkQ0=;
	b=al0jwgor22jYOlukPsqwF0jXEVphgvjOqLoVhpESEej/C2oPQ8J456MKiJoG/37Ojun7
	 VCcrVUalSry+52LSSgAzX1S3yL08t8zG/lloDl24EceimKgHX+a8lNjG6ak4ZVntDZL9v
	 obfB3GE2nfmG3zruysVc9wzDUJr855eChw8mmjlF6IfjRcvTM0uUaU1IKIoKRovvd685i
	 YK60KKUjqV7bF7lsZdqyf5HHCzkdoBwwe/5pdfXG+HsDFjfJ/aan6TFbLFDoyoafLy6md
	 mf+FsyfXEm0X6RIxmAV44lidUr2Bzwh3HjBGDTU/QEPDSJVRe0SAaxP6fXgQvsCnkXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792155337;
	bh=8CIsJEohqO32cpXjevXTXirMtL/o4BLhNHSpXjbXkQ0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Z005NOIdQ3fWiSD4pRzAXkD0CjTaI60kjkUJziEdjskOKonzjOLubtu4or8b/CeLg
	 BOFr5ydBehWU4p+VLB7AXGlrmBUcTMOM5O3/1gObm1ogf60bzh1WkQqbMX4AUXywhj
	 ny+XE5wA0apUBguxvRmHQOJlq0PrVQHud89Jiktz5ieYMN6LXSj31Ccf+U7D/sS45l
	 jhAKQGovfg0dNgC7yk7WLsWrY4E5BfTVKEnQx2+wk+0zWkNGX+pgMojRi43La0Wl6W
	 tC+39l9BoAxQoFjCpbqxnuiml1LOkOJo5ZFntdOdQamm9yBHPOu8WpgJzAhWwH85hA
	 5al6InyoasdYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458E081499;
	Fri, 16 Oct 2026 12:55:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB8C1DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4B9409E5
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDacj6MmAP-p for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:55:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1D1F409E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792155334;
 b=tAjsn4Dtf5k/mkFh/iOFSA6yJIRch4GTAJlP1P3A+jUIM659aXEmYgLONWM7tTpXRAEu
 DwHYJNe+nOjAlzaFTOyT59cCg7xhOlL4DcU/cvVDcdH1PPUrSUT7FmRjVv5NwrUqUNX7R
 AdmXTJZ5maU2qcQlxyRCnRnOSblibkXqLwAhls9DlNxuRGrqT8yNeGGlKkyMyHBYXY7lG
 V+uPcufh5ISI5vtq2fCSolDREHjPhZmMdAIADBJtl70owAHOVepIIxZzJfH/DZThtV3IX
 p6mIop2wfqfgQpkHh01CzUMo0PW2atDr1iWtqsufrzzZUZ6Mr/8q0oOn5pBh+Huq2qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792155334;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=bI0kCWzmaQJQN3MD2EO8InQbHMxZHqfo/Sh2w32nmsI=;
 b=H2PNG7YBS28RFNKr5LsWS5A1FDOu4jDxSrKS5NVbm65Hcq3WeqEHZq9MdD+Nt456iKaB
 IaUPU6HoP8fIMgDsaFNb66o6HQwqxCUeBQtimSp9OjJTbgLE2CApeSbq7LdAZSenCYmxA
 5jzA+KhKuqskqmdSMrnDA95CgE6W8vYYkBBA6GShK+5Hcxo0NbLpTjB68k5GH855Jf8OB
 VaEOV9Q7MmTETkqx/MD9NbB05MVQvGn5tQLhbaX0EKvd4xH4dRx8G9L2Two+v/wObu7pG
 CxqrC5c1EeMdPmXUCSoTuASPLIJgp2QRn6WMcU13sdZJvQIozMutGg75dtF21J5h9DQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bVIDMbfr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1D1F409E8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:55:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso1575267f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792155331; x=1792760131;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bI0kCWzmaQJQN3MD2EO8InQbHMxZHqfo/Sh2w32nmsI=;
 b=nhDFu0eD0jC0TVVf8HQ9sbkyYOS/bl1PXrLUSQwJaNfPpXGKHLNXc5x8egHgofqYP8
 pFsjrN7iIPn0iUjwp2zVbGz+EUHZF+Zcc0sTaajfefV6AX9T9x0YKAGyyIwE+oqMVNuE
 sjNT/TtETacQ1kRM6HsV8Gg5UJ9lmuztcpf/6Q4KH9g2mkVFlCiAw0aWEdSqG0SIrpgn
 aTgTlsQunMrQJaWtCi8FvbnbubMB4l1+mtNiCVMfveXa8qgkxyoCLkvu2tCMexrwJxnJ
 BoYNVY2vmf/kE9o+V2Hs1YU7qRyZudrLsDLMtcE853g42bYF+RwHTZ5C/lBRCrMcKYUb
 nrWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwE+xfXLcNfK8DB6ohR1klP0ta3ElOvaHHjBWIbAwOWEOkz5QAQvngStTndInfcX1fas6BHHaMhgg0=@buildroot.org
X-Gm-Message-State: AFq9FYLCsG8WizW18tJ+aiXU4M8C1cnY/kFIHbz8lpr4yxkTyfzAsuyS
 BKCDb6LgFIgMAAJ3ilghra/tyiCcdcS0x3XiYD9Ju70OKNuBJOjx8SmlaJ+PK4xvu/usSnyJlj/
 LB7jAIfA=
X-Gm-Gg: AYBFou1Fpc0K8ArnbcPAqh2ePV+ONCIbwHLoDH6Ul2uvcyebRWWt6oB8y/44J5iDb1q
 8+lPO0d6Q8DXyIiWh1LZNJY07Fwx1twBNMg4f7hnqkoTMLIjkITb/sIWmEzDDfpSRB2u3XEZKyk
 XYlmEbSygftD+TjWoCsi4UzerGy1xzkxx7GBglUs2u2JzWhZqwAKtSynBhvo3CXGJ6jRTut7BvF
 uwxS4NMf67FYxY0PLr0g1Uaa9TeFm62zCt9OJlCmNvI/qZhWmTWP9Xc1g1Mu+iLc12DY8hba+fZ
 9zqOSZd/6NiNlb/gITEA9adjiMI3vuLeZoSC9xL4M7kWLKjNPntpLsgzs548T2HCV6teuh14Ome
 jiQyKcVp08tabfJObtcZtt5k05yjyt882cfLwzN2i6Dxmz0OO6KVQAI6ZPthyel4LrrygMW4i4a
 HW7jYyNU2ZCfja7CO9r3ZmBfQ27yfxpEB0GHq68EGHGQ7xyHtP4zPBFRuBjlOllJOKKM8hOeSmV
 IVgRdT2bzmCYPCBjXTH+i7LWdCkV6V4cM/Ngp8QMNsT
X-Received: by 2002:a05:6000:2505:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-48dbace65bcmr44479047f8f.53.1792155330795; 
 Fri, 16 Oct 2026 05:55:30 -0700 (PDT)
Received: from [10.42.0.101] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd471877sm4251190f8f.1.2026.10.16.05.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 05:55:30 -0700 (PDT)
Message-ID: <5a419175-d57f-40c1-9e76-57500c10cc64@mind.be>
Date: Fri, 16 Oct 2026 14:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
References: <20261001072630.546933-1-raphael.melotte@mind.be>
 <19b0bc07-a423-4d8f-8e63-8f83ab560c53@rnout.be>
Content-Language: en-US
In-Reply-To: <19b0bc07-a423-4d8f-8e63-8f83ab560c53@rnout.be>
Subject: Re: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions: fix
 newline in commit message
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMTAvMTEvMjYgMTA6MTYgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOgo+IFsuLi5dCj4gIMKgSSBkb24ndCBsaWtlIHRoaXMgdmVyeSBtdWNoIGJlY2F1c2UgdGhl
IGNvbnN0cnVjdCBpcyBub3QgdmVyeSB3ZWxsIGtub3duLiBBIHNvbWV3aGF0IGxlc3Mgd2VpcmQg
d2F5IHdvdWxkIGJlIHRvIHVzZSAkKGVjaG8pLgo+IAo+ICDCoEhvd2V2ZXIsIEkgdGhpbmsgdGhl
IHdheSB0aGUgdXBkYXRlZF92ZXJzaW9ucyBpcyBjb25zdHJ1Y3RlZCBpcyBwZXJoYXBzIGp1c3Qg
bm90IHZlcnkgZ29vZC4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1ha2UgaXQgYSBiYXNoIGFy
cmF5Lgo+IAo+ICDCoMKgwqAgdXBkYXRlZF92ZXJzaW9ucys9KCIke29sZF92ZXJzaW9ufSAtPiAk
e25ld192ZXJzaW9ufSIpCj4gCj4gV2hlbiBwcmludGluZywgYWRkIHRoZSBuZXdsaW5lcyBhbmQg
ZW51bWVyYXRpb24gd2l0aAo+IAo+ICDCoMKgwqAgcHJpbnRmICcgLSAlc1xuJyAiJHt1cGRhdGVk
X3ZlcnNpb25zW0BdfSIKPiAKCkkgYWdyZWUsIHRoZSBzY3JpcHQgYWxyZWFkeSB1c2VzIGJhc2gg
YXJyYXlzIHNvIGl0IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUgdG8gdXNlIG9uZSBoZXJlIGFzIHdl
bGwuCkknbGwgc2VuZCBhIHYyLgoKPiAKPiAgwqBSZWdhcmRzLAo+ICDCoEFybm91dAo+IAo+Pgo+
PiBGaXhlczogZmFiNTBlZDNiMTUzMjAzN2ZhNjc1ODJhNmI0N2FjNDA4NGRhYWE4OCAoInV0aWxz
L2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9uczogYXV0b21hdGljYWxseSBjb21taXQgcmVzdWx0
IikKPj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBt
aW5kLmJlPgo+PiAtLS0KPj4gwqAgdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zIHwg
MiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL3V0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucyBiL3V0
aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucwo+PiBpbmRleCBhZjg1ZDMyODUyLi45NWE3
MDU5Yjg5IDEwMDc1NQo+PiAtLS0gYS91dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMK
Pj4gKysrIGIvdXRpbHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zCj4+IEBAIC04NSw3ICs4
NSw3IEBAIHVwZGF0ZV9saW51eF9oYXNoKCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXBkYXRl
ZF9yZWxlYXNlc19saXN0PSIke3VwZGF0ZWRfcmVsZWFzZXNfbGlzdH0gJHtyZWxlYXNlX3ZlcnNp
b259LngiCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXBkYXRlZF92ZXJzaW9u
cz0iJHt1cGRhdGVkX3ZlcnNpb25zfVxuIC0gJHtvbGRfdmVyc2lvbn0gLT4gJHtuZXdfdmVyc2lv
bn0iCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXBkYXRlZF92ZXJzaW9ucz0i
JHt1cGRhdGVkX3ZlcnNpb25zfSIkJ1xuJyIgLSAke29sZF92ZXJzaW9ufSAtPiAke25ld192ZXJz
aW9ufSIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGVsc2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBEaWZmZXJlbnQgbGluZTog
UmVzZXQgaGFzaCBsaXN0IGFuZCBqdXN0IGNvcHkgdGhpcyBsaW5lIG92ZXIgYXMgaXMuCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
