Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF29C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9036984B7E;
	Sat, 23 Jul 2022 21:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9036984B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUEUNJzVuEHR; Sat, 23 Jul 2022 21:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F20484B56;
	Sat, 23 Jul 2022 21:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F20484B56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6671BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E50E84B56
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E50E84B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcFjnUMxdkPh for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:35:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A8B84B52
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3A8B84B52
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:35:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v13so3134383wru.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=5zCsR/9KdmsWl7ySC/dmL8v0krSFhQM+IToDiG8gGW4=;
 b=PAEqW8him6BcnfMjucqFiUZuuUrqeq531/W8DXa1+kXDI5W9P7h5nkno1QjMoZ2sfj
 XtG5zYKnGXVn40EhCAWuWyXS5mQgJ2I/mrZYmJVB3G7xsgyLH++gD77T8Bf5QGVMyoBu
 D+YTo/27HPFh9AGsB1h9ATaeAHPnB2ZdJ5te+v7+Na92NdhWy5cWoVthoQBJ6HwvIh9E
 MkvvxwjFjUfdMpJ4scLzLeIag1QlQG49TFIgBVi7vvnvy1xKxMaLhzswRsEKvrOD41Gl
 /O4DZ1I2h4946Nv3aYOkYu6hR1piVtaeOna276JIdIRBrosxBKOKkMOyhVmRMWJn+++q
 sVCg==
X-Gm-Message-State: AJIora8Q26T2JV892q7F35kGRAu3mUEhx4bte9EoXEf6UDkAvvcEiqG2
 6s7oJQ2lyhfvACRW+f5iSj7wLhNW6D8Zwg==
X-Google-Smtp-Source: AGRyM1uqxA9OiqTWhPjdPCrFV34tViBIdaaC1MJpjElhvkBcYsfbBqi9neybrOeLKcg6QF4+Rd5rOw==
X-Received: by 2002:a5d:4e82:0:b0:21e:482a:705f with SMTP id
 e2-20020a5d4e82000000b0021e482a705fmr3427542wru.543.1658612117269; 
 Sat, 23 Jul 2022 14:35:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a5d4fc6000000b0021d76a1b0e3sm7822212wrw.6.2022.07.23.14.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:35:16 -0700 (PDT)
Message-ID: <df67ea80-c938-0eae-94bf-96f7e7b82a9c@smile.fr>
Date: Sat, 23 Jul 2022 23:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: Nicolas Tran <nicolas.tran@smile.fr>, buildroot@buildroot.org
References: <20220519140453.1546982-1-nicolas.tran@smile.fr>
 <adbf3b21-b5c7-29d0-3a7b-2288c0c249fa@smile.fr>
In-Reply-To: <adbf3b21-b5c7-29d0-3a7b-2288c0c249fa@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=5zCsR/9KdmsWl7ySC/dmL8v0krSFhQM+IToDiG8gGW4=;
 b=ig4pAMOoDW5qoQQEjp3x5Y8DGZL63HureWNEM/QfI9lAB/64XTlMktOHp0IvYJh90m
 C6VgoSU3LkAaJm4eHddK2j91X/Om+nKWPxJgOgiuX+8ZVzfEJsqxXwMRJI9MIn86j+uw
 mffC4xY9tshWqsZe10jTagbs8hdMyTEzL+W/4NG5lzaLHJypmJpj9WLAI1BqpbXmNffK
 EULgjFX/DXQpC4gj8OftYuGk7I35JrFTB6LGGZQFTRR6gYdJ+1acb9cwYxKSNiFvQPdC
 RsaZOpPqrHmt7poer/DqGaJTtq2bWcZKTEzmutUmVMRevc741UG5uwTkvzHQduy8oN+h
 XAZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ig4pAMOo
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-coreutils: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmljb2xhcywKCkxlIDIzLzA1LzIwMjIgw6AgMTI6MTIsIFJvbWFpbiBOYW91ciBhIMOp
Y3JpdMKgOgo+IEhlbGxvIE5pY29sYXMsCj4gCj4gTGUgMTkvMDUvMjAyMiDDoCAxNjowNCwgTmlj
b2xhcyBUcmFuIGEgw6ljcml0wqA6Cj4+IHJ1c3QtY29yZXV0aWxzIGlzIGEgcGFja2FnZSBmcm9t
IHRoZSBHaXRodWIgcHJvamVjdAo+PiB1dXRpbHMvY29yZXV0aWxzIGNvbnRhaW5pbmcgdGhlIGVx
dWl2YWxlbnQgb2YKPj4gdGhlIEdOVSBjb3JldXRpbHMgYmFzaWMgc2hlbGwgY29tbWFuZHMgaW50
ZWdyYXRlZAo+PiBpbiBSdXN0IGxhbmd1YWdlLgo+IAo+IElzIHJ1c3QtY29yZXV0aWxzIHBhY2th
Z2UgaXMgYSBjb21wbGV0ZSByZXBsYWNlbWVudCBmb3IgdGhlIEdOVSBjb3JldXRpbHMgPwoKSSBo
YXZlIG1hcmtlZCB0aGlzIHBhdGNoIGFzICJDaGFuZ2VzIFJlcXVlc3RlZCIuCgpJIGtub3cgd2Ug
ZGlzY3Vzc2VkIGFib3V0IHRoaXMgcGF0Y2ggcHJpdmF0ZWx5IGJ1dCBwbGVhc2UgcmVwbHkgdG8g
Y29tbWVudHMKKGV2ZW4gZnJvbSBtZSBzaW5jZSBpdCBjYW4gYmUgaW50ZXJlc3RpbmcgZm9yIG90
aGVycykuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPj4gSXQgY2FuIGJlIGNvbnZpbmllbnQg
Zm9yIHB1cnBvc2VzIG9mIFJ1c3Qtd3JpdHRlbiBzeXN0ZW1zIGFzCj4+IGl0IHJ1bnMgaW4gYSBz
dGFibGUgdmVyc2lvbiBvZiBSdXN0Lgo+Pgo+PiBUaGUgcGFja2FnZSBoYXMgYmVlbiBjaGVja2Vk
IHdpdGggY29ycmVjdCBmb3JtYXR0aW5nIGFuZAo+PiB3aXRob3V0IHR5cG9zOgo+PiAkIC4vdXRp
bHMvY2hlY2stcGFja2FnZSBwYWNrYWdlL3J1c3QtY29yZXV0aWxzLyoKPj4KPj4gVGVzdHMgaGF2
ZSBiZWVuIHJ1biB0byBlbnN1cmUgdG9vbGNoYWluIGNvbXBhdGliaWxpdGllczoKPj4gJCAuL3V0
aWxzL3Rlc3QtcGtnIHBhY2thZ2UvcnVzdC1jb3JldXRpbHMKPj4gICBib290bGluLWFybXY1LXVj
bGliYyBbMS82XTogU0tJUFBFRAo+PiAgICBib290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwo+
PiAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiBTS0lQUEVECj4+ICAgIGJvb3RsaW4teDg2
LTY0LW11c2wgWzQvNl06IE9LCj4+ICAgICBici1hcm0tZnVsbC1zdGF0aWMgWzUvNl06IFNLSVBQ
RUQKPj4gICAgICAgICAgIHNvdXJjZXJ5LWFybSBbNi82XTogT0sKPj4KPj4gU2lnbmVkLW9mZi1i
eTogTmljb2xhcyBUcmFuIDxuaWNvbGFzLnRyYW5Ac21pbGUuZnI+Cj4+IC0tLQo+PiAgcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gIHBhY2thZ2Uv
cnVzdC1jb3JldXRpbHMvQ29uZmlnLmluICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysr
Cj4+ICBwYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLmhhc2ggfCAgMyArKysK
Pj4gIHBhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMubWsgICB8IDEyICsrKysr
KysrKysrKwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ydXN0LWNvcmV1dGlscy9Db25maWcu
aW4KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29y
ZXV0aWxzLmhhc2gKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3J1c3QtY29yZXV0aWxz
L3J1c3QtY29yZXV0aWxzLm1rCj4gCj4gQnVzeWJveCBwYWNrYWdlIHNob3VsZCBkZXBlbmQgb24g
cnVzdC1jb3JldXRpbHMgaWYgYm90aCBwYWNrYWdlcyBhcmUgc2VsZWN0ZWQgaW4KPiB0aGUgY29u
ZmlndXJhdGlvbi4KPiAKPiBTZWUgbm9jbG9iYmVyIGluc3RhbGwgaW4gYnVzeWJveC5tawo+IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9NTBkYzM1MGM2NWY0
YjE2NjJiYTk4NmQ2ZWIyNWIyNGE3MGM0MzEyOAo+IAo+IEFsc28sIHdoYXQgYWJvdXQgdGhlIGNv
bmZsaWN0IHdpdGggKEdOVSkgY29yZXV0aWxzIHBhY2thZ2UgaXRzZWxmID8KPiAKPiBEbyB3ZSB3
YW50IHRvIGNvbnZlcnQgY29yZXV0aWxzIHRvIGEgdmlydHVhbCBwYWNrYWdlIFsxXS4KPiBXZSBt
YXkgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBmb3IgZWFjaCBwYWNrYWdlcyByZWNvZGVkIGludG8gYW5v
dGhlciBsYW5ndWFnZS4KPiAKPiAKPiAKPiBbMV0gaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5v
cmcvbWFudWFsLmh0bWwjX2luZnJhc3RydWN0dXJlX2Zvcl92aXJ0dWFsX3BhY2thZ2VzCj4gCj4+
Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4+
IGluZGV4IDg4OTIxMzQxMzMuLjk0ZjkyYjM1YjQgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvQ29u
ZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4+IEBAIC0xLDUgKzEsNCBAQAo+PiAg
bWVudSAiVGFyZ2V0IHBhY2thZ2VzIgo+PiAtCj4+ICAJc291cmNlICJwYWNrYWdlL2J1c3lib3gv
Q29uZmlnLmluIgo+PiAgCXNvdXJjZSAicGFja2FnZS9za2VsZXRvbi9Db25maWcuaW4iCj4+ICAJ
c291cmNlICJwYWNrYWdlL3NrZWxldG9uLWN1c3RvbS9Db25maWcuaW4iCj4+IEBAIC0yNTc5LDYg
KzI1NzgsNyBAQCBtZW51ICJTeXN0ZW0gdG9vbHMiCj4+ICAJc291cmNlICJwYWNrYWdlL3JhdWMv
Q29uZmlnLmluIgo+PiAgCXNvdXJjZSAicGFja2FnZS9yc3lzbG9nL0NvbmZpZy5pbiIKPj4gIAlz
b3VyY2UgInBhY2thZ2UvcnVuYy9Db25maWcuaW4iCj4+ICsJc291cmNlICJwYWNrYWdlL3J1c3Qt
Y29yZXV0aWxzL0NvbmZpZy5pbiIKPj4gIAlzb3VyY2UgInBhY2thZ2UvczM5MC10b29scy9Db25m
aWcuaW4iCj4+ICAJc291cmNlICJwYWNrYWdlL3M2L0NvbmZpZy5pbiIKPj4gIAlzb3VyY2UgInBh
Y2thZ2UvczYtbGludXgtaW5pdC9Db25maWcuaW4iCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1
c3QtY29yZXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvQ29uZmlnLmlu
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmFmNmU4NzA3MDkK
Pj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL0NvbmZpZy5p
bgo+PiBAQCAtMCwwICsxLDE3IEBACj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArIwo+
PiArIyBydXN0LWNvcmV1dGlscwo+PiArIwo+PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4g
Kwo+PiArY29uZmlnIEJSMl9QQUNLQUdFX1JVU1RfQ09SRVVUSUxTCj4+ICsJYm9vbCAicnVzdC1j
b3JldXRpbHMiCj4+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9B
UkNIX1NVUFBPUlRTCj4gCj4gImRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09U
SEVSUyIgaXMgbWlzc2luZwo+IAo+IElmIGNvcmV1dGlscyBpcyBub3QgY29udmVydGVkIHRvIGEg
dmlydHVhbCBwYWNrYWdlLCAiZGVwZW5kcyBvbgo+ICFCUjJfUEFDS0FHRV9DT1JFVVRJTFMiIHNo
b3VsZCBiZSB1c2VkIGhlcmUuCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+PiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDCj4+ICsJaGVscAo+PiArCSAgcnVzdC1jb3Jl
dXRpbHMgaXMgYSBwYWNrYWdlIGZyb20gdGhlIEdpdGh1YiBwcm9qZWN0Cj4+ICsJICB1dXRpbHMv
Y29yZXV0aWxzIGNvbnRhaW5pbmcgdGhlIGVxdWl2YWxlbnQgb2YKPj4gKwkgIHRoZSBHTlUgY29y
ZXV0aWxzIGJhc2ljIHNoZWxsIGNvbW1hbmRzIGludGVncmF0ZWQKPj4gKwkgIGluIFJ1c3QgbGFu
Z3VhZ2UuCj4+ICsKPj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS91dXRpbHMvY29yZXV0aWxzCj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLmhhc2gg
Yi9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLmhhc2gKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMDY1ZGUwZWVjNQo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMuaGFzaAo+
PiBAQCAtMCwwICsxLDMgQEAKPj4gKyMgTG9jYWxseSBnZW5lcmF0ZWQKPj4gK3NoYTI1NiAgN2Nk
MDVlYmRlMTMwMmEyN2U3YTI2NDMwZWZjN2Q1MjJiODZlM2Q4ZjIyYWQ2MDYyNzVhMWE5NjQ4NTQy
NGU0NiAgcnVzdC1jb3JldXRpbHMtMC4wLjEzLnRhci5nego+PiArc2hhMjU2ICBhODM2ZWIzMzYw
ZDBlODBmNmExNjIwNDk1NTQzYWQyYTRlMjBlNGNmNzJhZjg5ZmY1MjhmY2NmOWU2M2JlODFlICBM
SUNFTlNFCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0
aWxzLm1rIGIvcGFja2FnZS9ydXN0LWNvcmV1dGlscy9ydXN0LWNvcmV1dGlscy5tawo+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi4xMjk2ZGIwZmYyCj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS9ydXN0LWNvcmV1dGlscy9ydXN0LWNvcmV1dGlscy5t
awo+PiBAQCAtMCwwICsxLDEyIEBACj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArIwo+
PiArIyBydXN0LWNvcmV1dGlscwo+PiArIwo+PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4g
Kwo+PiArUlVTVF9DT1JFVVRJTFNfVkVSU0lPTiA9IDAuMC4xMwo+PiArUlVTVF9DT1JFVVRJTFNf
U0lURSA9ICQoY2FsbCBnaXRodWIsdXV0aWxzLGNvcmV1dGlscywkKFJVU1RfQ09SRVVUSUxTX1ZF
UlNJT04pKQo+PiArUlVTVF9DT1JFVVRJTFNfTElDRU5TRSA9IE1JVAo+PiArUlVTVF9DT1JFVVRJ
TFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPj4gKwo+PiArJChldmFsICQoY2FyZ28tcGFja2Fn
ZSkpCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
