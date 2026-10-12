Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A397CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 08:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB8680CCC;
	Mon, 12 Oct 2026 08:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXD0jIL_woR5; Mon, 12 Oct 2026 08:35:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E75A180C86
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791794139;
	b=eFOhj93YWh0+IidMuSS2OWUM5UNGdOZg5d/vvxjywa1Nbbd9NRRnG8qn07RiDFG/cFO4
	 UrOrkpgKGE+9w3v+9Tm7/XtzusSUcWbX+777ymqZ39Kdc2tKSwV2ksRTJDQkjossXPoZK
	 /+nsfINOP9y069l/LcPASHojvzslE4zEojHbVkm+K8NPOAWvqUM6DYShO5eXav30Bajl+
	 8j2xz0LANViNSm7ztmVzrnw7hzr+MBXLMb6CZxET+ueZcNQpDW6LGkMwh244XjcPUjMBR
	 XpBMbah+Y9HiG3hh7HZVmE/RHLme372mjWwzDqMplkyThJG1vfBeQXdKhwirZO85YzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791794139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EIt+9J4F+sEQwHGtWmfHg83R0b1VyqV7nuuYDTFbvpY=;
	b=ahoVwd/tsxjdWCQiRnIJXvRcb/LRBYT72dG0dbSWfkzLbm+YBXPJPtFB0oE2jZRd1jfU
	 UOyfuyTEHb3qHX0ucYFe0UP9XsRAudkrhjnPy12XOcCwQz22SyXmxKElMD70xPkeval0l
	 pRrprzEWhMe1cHE7dXptswSkM6PmMsjpr+4Wrd+uh58QWn/achD69Olt2O9+GJgf7FxWA
	 3BTzeb0j9SU565pdWA41nEp3YJzrpvHf5HdpebqMbkMGfY9otfr/wpOydQvxujFb6ngsE
	 lC5fhIAurJNzogs5jBCE3ToWDiP40m46darwNYY6GPp3Rpwj1CrqbpXNlp2IQk/+QEw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791794139;
	bh=EIt+9J4F+sEQwHGtWmfHg83R0b1VyqV7nuuYDTFbvpY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pHQHeVjp13irBO2W6BbTqOaR1icxkXq+Hm45Fc1ZOu66hXbDFoxN6ZQHvV83wv/bw
	 nHE/siQrEYVgvvYgGrDHLeI5mwqhwuXAz/EY13a91q9OXf0X4UbUVmnScPP++PENRB
	 vVatBoiaGWR6xfQeqEWrYFkN42Y4zgsCCBxXXiBAk4geyQibCnlEzgtzREx4yzkV4R
	 ujN9Qhlkf1IVSCvw37WkU6A0D5PNjbUnvyX6fjp7TJYS1j7D37LLgewM1v8mdR2oDi
	 hFrcfDhCgoSnM1M9wqhRF+8PALGVo+ataD2Dp2l/zlVWnE4f3yriSL7a/TT+M3m6gL
	 LnaR6RzLV9dug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E75A180C86;
	Mon, 12 Oct 2026 08:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE7C89DF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 08:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3C916061A
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 08:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sp5upl1hyR9 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 08:35:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 98C7C60618
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791794137;
 b=rO2/EZ85q43M/pihfqsStEk8Y5GDF3wmNYnwFGxfoyFCg8Ncz3IUlDXAqqVkeFpzu7J0
 ayOuvxM9DbyHA6gJTdlhRb5Dle0NobJIF4X32inWYl5l5y63jxhN1Mc5yUzn+1AL1Uh96
 1XWLZCxR1KW63FPh41bDVr6nDg6K03muGud7aRBr+j5N+NfPdpDL1vebkDlArPkaChfP/
 J07j2bPcCtODnzki9V9zTpIXilFs1dLteCDwTg1x49g5I7kXypNibgFEPz7NdLe4JmmJz
 4qLguMIhA+fDxASoXmPHi5ug/2nv/MQb0iMHw7L91DfBpbNi/NOIWoyIBrlG2mfv58w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791794137;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=puQPWBx9DoPMC9E6L7kpJECsKJ5cR6OgrwFSpAIwvd4=;
 b=ifKjdkLYqjDc6jiMhzK9WgjeRmGZIZ4n6qOW1aNo8TpCHmN6IaqETMQPRzMEBC19oyRL
 IkYRKf9E79rKOuKDh5hvMrYgisTG7soJsQk7z0XJxNHDwol7vuIAEV2oQuKv7mbIM31E1
 yV1RNmUxdSVJy3sbNLSh7F1HRVyaHQ+eK1CuBOt5m22mZFrsIIpK5WOgjpkB3yBsCKGLE
 mB9ak8iy5H+A3l1cnzZSAt1pMX5wxSzx0YxpjFJ+XiuIB9CMyjQZ3FKhMle6hUUxyb+ui
 MbCH2l5MbmbiUIMMDOMKh9v4ngwVStxUl+39b9r/6Q0LRzte3YkJXOVPwLHobCzSiKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Gnq3CK9b; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98C7C60618
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 08:35:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso10683285e9.1
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 01:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791794133; x=1792398933;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=puQPWBx9DoPMC9E6L7kpJECsKJ5cR6OgrwFSpAIwvd4=;
 b=AlfGnSWeN2Qk1GBhLNcIK75uQY2H8/XDSQA/qurCLPbDy+STbB87x6F6HXVNYfZTwY
 4LY98awL1W/cDG5ecb0ojnJr2YlyZed1SSmW9d1WafIfP84tRSbTvrljeeLQPgXZFr9y
 zItAaP//oe23air7l+7coa5L3asCMmHcwCqono8mv/8cvMgqolBbrs75vFCCGTlpf0sS
 6VPLLHF/SK8PQJASWZO9jgl50aqKZnil62ih+qycSDDCBKUDaS5msAQ0nBy/r2MSH6q7
 BUAXZTYD+uTiFqXqjv0DpT5+cxYDcWZ9eJFnnq4zQwhGCu9EWYfKOyEAzj1t7jVHt3BS
 sWUQ==
X-Gm-Message-State: AFq9FYKD6UTauVcAKzyGq5EEgHvgp5DMY1tJsMJIcEmmzbVBtNoZK/dh
 5MYux25E3CZPsxHYeEnQpP8B3CdF1uhHT7C37bZ3BTaJopJVRVa6o1eq2Pz9ZdmaYVc=
X-Gm-Gg: AYBFou1G0g+x2UG+3tZfDFvOfCDjPPTC7Kf86Bn66nDNkekNj53IbQahm8g73N2Y+/l
 WjVRAJsXAEsR+8vCsHASN8EJsns1ztSun11gAtPuFt6xhUNYDMX/vf69XLR5bXYQxm8cEPWPsSk
 Zg0fhqWoHkW9SXp8TJBiZpF/3T4ofRvw01huukZiIljyL5bkVweGcCEfQ1z5GmJATh6LvwM7w4R
 I730HRPF5/BGX9q4Qj5SEdvvzoVGXT3ecfGY27rxdBtxK76QMMk8EJmk8l3Uqv6ZgPgxwl3gKzs
 L9zOVmAE7GGPyYv6MAYFNQuj1bIFOl6qAqe91mXFekzTsUP1PFFx4OUI0QeLQujIwjrC+kZmB+m
 cm/pglRNI1+kKYML5zlw8CPF80EogeVdHTPQCltPFWPv2v54asKeqHi4Xm/Y2o5DmRzJWfSKduh
 im/plvolwFzDDmHlh+KuW66IrO8DH81yTPM/Fj/Q7nxzvIBe93WM8FbtCaEiYemD3a0Cmydi5lV
 47DBQKJwHkTjfFh91ETzpC0HuCiYskymXDecBEZ/SFb
X-Received: by 2002:a05:600c:1911:b0:49f:faa3:3ca2 with SMTP id
 5b1f17b1804b1-4a18e4aae7emr180172525e9.13.1791794132471; 
 Mon, 12 Oct 2026 01:35:32 -0700 (PDT)
Received: from [10.20.174.153] (ptr-94-109-87-164.dyn.orange.be.
 [94.109.87.164]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea1021sm249101645e9.10.2026.10.12.01.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:35:32 -0700 (PDT)
Message-ID: <812cdd41-61b0-4f4a-9258-72ad40699895@mind.be>
Date: Mon, 12 Oct 2026 10:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>
Cc: Titouan Christophe via buildroot <buildroot@buildroot.org>, ju.o@free.fr, 
 thomas.petazzoni@bootlin.com, arnout@rnout.be, git@jdknight.me,
 thomas.perale@mind.be
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish> <58a1eb0e-91e4-4810-a13f-26cc2f1bc625@mind.be>
 <871p9v4fpl.fsf@tarshish>
Content-Language: en-US
In-Reply-To: <871p9v4fpl.fsf@tarshish>
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R29vZCBtb3JuaW5nIEJhcnVjaCwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZGV0YWls
ZWQgYW5zd2VyIGFuZCB0YWtpbmcgdGhlIHRpbWUgdG8gCnF1ZXN0aW9uIGNydWNpYWwgcGFydHMg
b2YgdGhpcyBwYXRjaCwgSSByZWFsbHkgYXBwcmVjaWF0ZSAhCgpPbiAxMi8xMC8yNiAwODowNCwg
QmFydWNoIFNpYWNoIHdyb3RlOgo+IEhpIFRpdG91YW4sCj4KPiBPbiBTdW4sIE9jdCAxMSAyMDI2
LCBUaXRvdWFuIENocmlzdG9waGUgd3JvdGU6Cj4+IE9uIDExLzEwLzI2IDE4OjQ1LCBCYXJ1Y2gg
U2lhY2ggd3JvdGU6Cj4+PiBPbiBTYXQsIE9jdCAxMCAyMDI2LCBUaXRvdWFuIENocmlzdG9waGUg
dmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+PiBVcGRhdGUgYWxsIGRlZmNvbmZpZ3MgdGhhdCBhcmUg
dXNpbmcgYSBjdXN0b20gTGludXggdmVyc2lvbiBiYXNlZCBvbiBhCj4+Pj4gbG9uZ3Rlcm0gc3Vw
cG9ydGVkIExpbnV4IHZlcnNpb24gc28gdGhleSB1c2UgdGhlIG5ld2x5IGludHJvZHVjZWQgc3lt
Ym9scy4KPj4+IFRoaXMgaXMgYSBzaWduaWZpY2FudCBwb2xpY3kgY2hhbmdlIGZvciBCdWlsZHJv
b3QuIFRoZSBjb25maWdzLwo+Pj4gZGlyZWN0b3J5IGlzIG1lYW50IHRvIGNhcnJ5IGNvbmZpZ3Vy
YXRpb25zIHRoYXQgYXJlICJrbm93biB0byB3b3JrIiwKPj4+IGFjY29yZGluZyB0byBhZGRpbmct
Ym9hcmQtc3VwcG9ydCBzZWN0aW9uIGluIEJ1aWxkcm9vdCBtYW51YWwKPj4+IChkb2NzL21hbnVh
bC9hZGRpbmctYm9hcmQtc3VwcG9ydC5hZG9jKS4KPj4gVGhhbmsgeW91IGZvciByYWlzaW5nIHRo
YXQgY29uY2VybiAhIEkgYW0gY3VycmVudGx5IHByZXBhcmluZyBhIHYyIG9mIHRoaXMKPj4gcGF0
Y2ggKHdpdGggbWFueSBvdGhlciBmaXh1cHMpLCBhbmQgSSB3aWxsIHVwZGF0ZSB0aGUgbWFudWFs
IGFjY29yZGluZ2x5Lgo+Pj4gQXV0b21hdGljIHVwZGF0ZSBvZiB0aGUga2VybmVsIGNvbXBvbmVu
dCB3aXRob3V0IGFjdHVhbCBoYXJkd2FyZSB0ZXN0Cj4+PiByaXNrcyBpbnRyb2R1Y2luZyByZWdy
ZXNzaW9ucyB0aGF0IG1ha2UgdGhlIHN5c3RlbSB1bmJvb3RhYmxlLgo+PiBUaGlzIGlzIGEgdHJh
ZGVvZmYsIHJlYWxseS4KPj4gT24gb25lIGhhbmQgKEEpLCB0aGVyZSBpcyB0aGUgcmlzayBvZiBi
cmVha2luZyB0aGUgZnVuY3Rpb25hbGl0eSBvZiBhIGJvYXJkIGJ5Cj4+IGJ1bXBpbmcgZnJvbSBv
bmUgcGF0Y2ggdmVyc2lvbiB0byBhbm90aGVyLgo+PiBPbiB0aGUgb3RoZXIgKEIpLCBhbnkgbmV3
IExpbnV4IHBhdGNoIHZlcnNpb24gYnJpbmdzIGEgaGFuZGZ1bCBvZiBzZWN1cml0eQo+PiBmaXhl
cywgYW5kIHRoaXMgaGFwcGVucyBvbiBhIHdlZWtseSBiYXNpcy4KPiBUaGUgYmFzaWMgcXVlc3Rp
b24gaXMgd2hhdCBhcmUgdGhlc2UgZGVjb25maWdzIG1lYW50IHRvIGFjaGlldmU/IE15Cj4gdW5k
ZXJzdGFuZGluZyBpcyB0aGF0IGRlZmNvbmZpZ3MgZGVtb25zdHJhdGUgaGFyZHdhcmUgd29ya2lu
ZyB3aXRoIGEgQnVpbGRyb290Cj4gZ2VuZXJhdGVkIGltYWdlLiBGb3IgbWFueSB1c2VycyB0aGlz
IGlzIHRoZSBmaXJzdCBCdWlsZHJvb3Qgc3RlcC4gSGFyZHdhcmUKPiBicmluZy11cCBpcyBub24g
dHJpdmlhbCwgYW5kIGRlZmNvbmZpZ3MgcHJlc2VydmUgYSBrbm93biB3b3JraW5nIHN0YXRlIGZv
ciBhCj4gZ2l2ZW4gdGFyZ2V0IHN5c3RlbS4gZGVmY29uZmlnIGlzIG9ubHkgYW4gZW5hYmxlciBm
b3IgbmV3IHVzZXJzLgoKSW5kZWVkLCB0aGlzIGRpc2N1c3Npb24gc2hvdWxkIGFkZHJlc3MgdGhl
IGludGVuZGVkIHJvbGUgb2YgaW4tdHJlZSAKZGVmY29uZmlncy4KTXkgcGVyc29uYWwgb3Bpbmlv
biBvbiB0aGlzIHJvbGU6Ci0gVGhleSBwcm92aWRlIChhcyB5b3Ugc2F5KSBhIGZpcnN0IGVudHJ5
IGludG8gQnVpbGRyb290IGZvciBtYW55IHVzZXJzLgotIEhvd2V2ZXIsIEkgYmVsaWV2ZSB0aGV5
IHNob3VsZCBidWlsZCBhIHNvbWV3aGF0IHVwLXRvLWRhdGUgc3lzdGVtLCBhbmQgCmRlbW9uc3Ry
YXRlIHdheXMgZm9yIHVzZXJzIHRvIGtlZXAgdGhlaXIgYm9hcmRzIHVwIHRvIGRhdGUuCi0gVGhl
cmUgY291bGQgYmUgb3RoZXIgcGFja2FnZXMgdGhhdCBhcmUga2V5IHRvIHRoZSBib2FyZCBmdW5j
dGlvbmluZyAKbm9ybWFsbHkgKHN1Y2ggYXMgZmlybXdhcmUgYmxvYnMsIGhvc3QgdG9vbHMgaW52
b2x2ZWQgaW4gdGhlIHRhcmdldCAKaW1hZ2UgZmluYWxpemF0aW9uLCAuLi4pLCBhbmQgdGhlc2Ug
cGFja2FnZXMgcmVjZWl2ZSB2ZXJzaW9uIGJ1bXBzIGFzIAp3ZWxsLCB3aXRob3V0IGJlaW5nIHNl
dCBpbiB0aGXCoCBib2FyZCdzIGNvbmZpZy4gSSB3b3VsZCBldmVuIGV4cGVjdCB0aGVtIAp0byBi
cmVhayBsZXNzIG9mdGVuIHdpdGggdXAtdG8tZGF0ZSBrZXJuZWxzIChidXQgdGhpcyBpcyBzcGVj
dWxhdGlvbikKPgo+PiBOb3cgb250byBwcmFjdGljYWwgY29uc2lkZXJhdGlvbnMgYW5kIG15IG9w
aW5pb25zOgo+PiAtIEZyb20gbXkgdW5kZXJzdGFuZGluZywgKEEpIGlzIG5vdCB2ZXJ5IGZyZXF1
ZW50IHdoZW4gYnVtcGluZyBmcm9tIG9uZSBwYXRjaAo+PiAgICB2ZXJzaW9uIHRvIGFub3RoZXIu
IEl0IGNhbiBjZXJ0YWlubHkgaGFwcGVuIG9uIGEgc3BlY2lmaWMgYm9hcmQgZnJvbSB0aW1lIHRv
Cj4+ICAgIHRpbWUsIGJ1dCB0aGlzIGlzIGRlZmluaXRlbHkgZmFyIGZyb20gdGhlIGdlbmVyYWwg
Y2FzZS4gSWYgeW91IChvciBhbnlvbmUKPj4gICAgZWxzZSkgaGF2ZSBzb21lIHJlY2VudCBleGFt
cGxlcyBvZiBzdWNoIHNpdHVhdGlvbnMsIEknZCBiZSBnbGFkIHRvIHJlYWQKPj4gICAgYWJvdXQg
dGhlbS4gT24gdGhlIGNvbnRyYXJ5IGJ1Z3MgaW4gY29yZSBjb21wb25lbnRzIHRoYXQgd291bGQg
YWZmZWN0IGFsbAo+PiAgICBib2FyZHMsIHN1Y2ggYXMgdGhlIGV4dDQgY29ycnVwdGlvbiBpbnRy
b2R1Y2VkIGluIGxpbnV4IDYuMS42NCwgd291bGQgYmUKPj4gICBtb3JlIGVhc2lseSBjb250cm9s
bGFibGUgdHJlZS13aXNlIHdpdGggc3VjaCBhIG1lY2hhbmlzbS4KPiBJIGhhdmUgc2VlbiBjYXNl
cyB3aGVyZSB0cml2aWFsIGNoYW5nZXMgYnJva2UgZXNzZW50aWFsIGZ1bmN0aW9uYWxpdHkuIElu
IG9uZQo+IGNhc2UgSSByZW1lbWJlciBhIHJlbW92ZWQgcHJpbnQgYnJva2UgdHdvIGRpZmZlcmVu
dCBuZXR3b3JrIFBIWXMgb24gdGhlIHNhbWUKPiBib2FyZCBiZWNhdXNlIG9mIG1pc3NpbmcgcHJv
cGVyIGluaXRpYWxpemF0aW9uIGRlbGF5CgpIb3cgZnJlcXVlbnRseSBoYXZlIHlvdSBzZWVuIHN1
Y2ggYnJlYWthZ2VzID8gSSBiZWxpZXZlIHRoZXkgc2hvdWxkbid0IApoYXBwZW4gdGhhdCBvZnRl
biwgdGhleSBhcmUgdmVyeSBoYXJkd2FyZSBzcGVjaWZpYywgYW5kIHNob3VsZCBiZSBlYXNpbHkg
CmZpeGVkIGJ5IHRlbXBvcmFyaWx5IHBpbm5pbmcgdGhlIGtlcm5lbCB0byBhIHByZXZpb3VzIHZl
cnNpb24sIHVudGlsIHRoZSAKYnVnIGlzIHJlc29sdmVkIGluIGxpbnV4LgpXZSBjb3VsZCBldmVu
IGFyZ3VlIHRoYXQgdGhpcyBjb3VsZCBoZWxwIHVudmVpbCBzdWNoIGJyZWFrYWdlcyB0byByZXBv
cnQgCnRoZW0gdXBzdHJlYW0sIGJ1dCB0aGlzIGlzIGFub3RoZXIgcXVlc3Rpb24gOi0pCgo+Cj4g
VGhlIGN1cnJlbnQgc3VnZ2VzdGlvbiBkb2VzIG5vdCBldmVuIHByZXNlcnZlIHRoZSBvcmlnaW5h
bCB1c2VyIHRlc3RlZAo+IGtlcm5lbCB2ZXJzaW9uLiBCeSB0aGUgdGltZSBhIGRlZmNvbmZpZyBy
ZWFjaGVzIG1hc3RlciBicmFuY2gsIHRoZQo+IGtlcm5lbCBpcyBkaWZmZXJlbnQuIElmIHRoaXMg
Y29tbWl0IGlzIGFjY2VwdGVkLCBJIHRoaW5rIHdlIHNob3VsZAo+IHByb3ZpZGUgYSB3YXkgdG8g
cHJlc2VydmUgc29tZWhvdyB0aGUgaW5mb3JtYXRpb24gb2YgdXNlciB0ZXN0ZWQga2VybmVsCj4g
dmVyc2lvbi4KClRoYXQgaXMgaW5kZWVkIGEgdmVyeSB2YWxpZCBwb2ludC4gV291bGQgeW91IG1l
YW4gaGF2aW5nIGFuIGVudHJ5IGluIHRoZSAKYm9hcmQncyBSRUFETUUsIG9yIGEgY29tbWVudCBp
biB0aGUgZGVmY29uZmlnOyBiYXNpY2FsbHkgYSBodW1hbi13cml0dGVuIApub3RlIHN0YXRpbmcg
InRoaXMgYm9hcmQgd2FzIHRlc3RlZCBzdWNjZXNzZnVsbHkgb24gPGRhdGU+IHdpdGggPGtlcm5l
bCAKdmVyc2lvbj4iID8gQW55IG90aGVyIHN1Z2dlc3Rpb24gPwoKQXMgQXJub3V0IHN1Z2dlc3Rl
ZCBpbiBoaXMgcmVwbHksIG1heWJlIHdlIGNvdWxkIG9ubHkgc3RhcnQgd2l0aCBxZW11IApib2Fy
ZHMgZm9yIG5vdywgYXMgdGhleSBjYW4gZWFzaWx5IGJlIHRlc3RlZCBpbiB0aGUgQ0kuIFRoZW4g
YWRkIHRoaXMgCmZlYXR1cmUgZm9yIGNvbmZpZ3Mgd2hlcmUgYSBtYXRjaGluZyBib2FyZCBpcyBh
dmFpbGFibGUgZm9yIGF1dG9tYXRlZCAKdGVzdGluZzsgYWx0aG91Z2ggSSd2ZSBuZXZlciBoZWFy
ZCBvZiBhbnkgYm9hcmQgZmFybSBhc3NvY2lhdGVkIHdpdGggdGhlIApCdWlsZHJvb3QgcHJvamVj
dC4KCj4KPj4gLSBXZSBzZWUgdGhhdCBtYW55IGJvYXJkcyBpbiB0aGUgQnVpbGRyb290IHRyZWUg
YXJlIHVwZGF0ZWQgdmVyeSBpbmZyZXF1ZW50bHksCj4+ICAgIGFuZCBhcmUgdXNpbmcgb2xkIGtl
cm5lbCB2ZXJzaW9ucywgc29tZXRpbWVzIGxhZ2dpbmcgbW9yZSB0aGFuIDIwMCB2ZXJzaW9ucwo+
PiAgICBiZWhpbmQgKHNlZSBmb3IgZXhhbXBsZSBjb25maWdzL21pbm5vd2JvYXJkX21heF9kZWZj
b25maWcpLiBUaGlzIGlzIG5vdCBhCj4+ICAgZ29vZCBzaWduIGZvciBuZXdjb21lcnMuCj4gSSBh
Z3JlZSB3ZSBzaG91bGQgcmVtb3ZlIHVubWFpbnRhaW5lZCBkZWZjb25maWdzIGFmdGVyIGEgZ2l2
ZW4gdGltZSBvZgo+IGluYWN0aXZpdHkuIEJ1dCBJJ20gbm90IHN1cmUgYmxpbmQga2VybmVsIHZl
cnNpb24gdXBkYXRlcyBtYWtlIHRoZSBzdGF0ZSBvZgo+IHRoZXNlIHBsYXRmb3JtcyBtdWNoIGJl
dHRlci4KCkFzIHlvdSBzYWlkIGVhcmxpZXIsIGJvYXJkIGJyaW5ndXAgaXMgbm90IGFsd2F5cyB0
cml2aWFsLCBzbyBJIHdvdWxkIApmaW5kIGl0ICJzYWQiIHRoYXQgd2UgZWxpbWluYXRlIGRlZmNv
bmZpZ3Mgc29sZWx5IGJlY2F1c2Ugbm9ib2R5IGlzIApzdWJtaXR0aW5nIGZyZXF1ZW50IGtlcm5l
bCB1cGRhdGVzIHRvIHRoZW07IHdoaWxlIHRoZXkgY291bGQgc3RpbGwgc2VydmUgCmFzIGEgcmVm
ZXJlbmNlIGZvciBzaW1pbGFyIHBsYXRmb3Jtcy4KCj4KPj4gLSBFYWNoIGtlcm5lbCB2ZXJzaW9u
IGJ1bXAgZm9yIGEgc2luZ2xlIGJvYXJkIGlzIGEgcGF0Y2ggdGhhdCBoYXMgdG8gYmUKPj4gICAg
cmV2aWV3ZWQgYW5kIGFwcGxpZWQgYnkgYSBtYWludGFpbmVyLiBJIGJlbGlldmUgdGhlaXIgdGlt
ZSBpcyBiZXR0ZXIKPj4gICAgaW52ZXN0ZWQgaW50byBwYXRjaGVzIHRoYXQgbmVlZCBhY3R1YWwg
ZWZmb3J0LCBlc3BlY2lhbGx5IGdpdmVuIHRoZSBjdXJyZW50Cj4+ICAgcGF0Y2h3b3JrIGJhY2ts
b2cKPiBUaGlzIGNvbW1pdCBvbmx5IHNhdmVzIHN0YWJsZSBrZXJuZWwgdmVyc2lvbiB1cGRhdGVz
LiBUaGVzZSBwYXRjaGVzIGFyZQo+IHRyaXZpYWwuIFdlIGNhbiB0aGluayBvZiBhIGZhc3QgdHJh
Y2sgbWVjaGFuaXNtIHRoYXQgYWxsb3dzIGNvbnRyaWJ1dG9yIHRvCj4gYXNzZXJ0IHNvbWUgbmV3
ZXIga2VybmVsIHZlcnNpb24gd29ya3Mgb24gYSBnaXZlbiBoYXJkd2FyZSwgYW5kIGF1dG9tYXRp
Y2FsbHkKPiBnZW5lcmF0ZSBhIG1hdGNoaW5nIGNvbW1pdC4KClllcyBpbmRlZWQsIGJ1dCBldmVu
IGxvb2tpbmcgYXQgdGhlIGJhY2tsb2cgdG8gZmluZCB0cml2aWFsIHBhdGNoZXMgCmNvc3RzIHNv
bWUgbWFpbnRhaW5lciB0aW1lLCBhbmQgaW4gYW55IGNhc2UgaW5jcmVhc2VzIHRoZSBjb2duaXRp
dmUgCm92ZXJoZWFkIGZvciB0aGVtLgoKPgo+IFRoZSBwb2ludCBoZXJlIGlzIHRvIHByZXNlcnZl
IHRoZSB2aXRhbCBpbmZvcm1hdGlvbiBjb250cmlidXRvcnMgcHJvdmlkZQo+IG9mIHRlc3RlZCBz
b2Z0d2FyZS4KCkFncmVlZCAhCgpLaW5kIHJlZ2FyZHMsClRpdG91YW4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
