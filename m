Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60663C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 18:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3629181136;
	Sun, 10 Aug 2025 18:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwHwKRnveycN; Sun, 10 Aug 2025 18:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E7F0812BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E7F0812BF;
	Sun, 10 Aug 2025 18:24:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C11B331
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6FD940906
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hU8hXTYYGfTO for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 18:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 766E24044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 766E24044B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 766E24044B
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:24:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso20506045e9.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754850289; x=1755455089;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9c1x3tQQQmQKGxtWH6ZnoJ1VrfMmXpcZAkjGe3RI2c=;
 b=sSYE7F2Hnxug/0KlXixURDQ4I7GOHbQVPLy4MS8Fjd+4FoWIEjgJU3/Yo4FgGKiHdj
 zHiA7OJ71xGIK+iIH8FQSx89s5SoEYC7mp2QiuWslWKvMB9dyOoD74zm2XrWUlkOt+pm
 2mzGytGurimIrj5Q/m83rwQ6oINBWN/HJ5cI1yFzbg7ZwndGSdtq4IIND1Vmovy0MY3A
 U4c//E/sXe5XpGRBoM9bOk5aoIeys8F0OII3cPqvolnjJ+IeNLEpP/ufjG8/+CkEMDNT
 qRME/I4xCZaIhRISEKJkKfLDntOEfjX18vLb4a8svfta+Wtib/fKCwRypkbtd8L5uOVl
 GTOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4xEUN0NtORAGxv8UJeoL8sIp4BXwgx17Fxv5rR8Yvawd6ANKg/bchkZeg7c8/x2kVprP7UAYcbFk=@buildroot.org
X-Gm-Message-State: AOJu0YzedIDHn/GqcLGWmGcGd+gJfB85dgKKSq9xvN2Zuj/CP3yGX1ss
 kRhE0GoW4M0wTg4I/JiWJ3v5ynxVcC4N0fTWUUWUB/A0FxLADOxIj+TZGeXwN8mgakU26ji/Ecc
 aMk5n
X-Gm-Gg: ASbGncuUQrJ5frmOT58Lkn3BWov/ZMk7ZZAW7HYsYpHLmf+x2ek2B4ZiuCLT9c7B/38
 5+YvPnkdWCO3rWYbGeDGht8xcP7QjW7FVWk83S2/d66Ge10R0eCwvBkAklBYPnuBVAJNPxspKAP
 F7iMo/ELmkD6h4hnOJaV+vgxvOOxryyZvZ2hBpXewZ5O5AVvBBqiEN7v4aGoOopunF3Mcp/y5W4
 5460OlaREacfVkRvMcFkXNwHhXDCD0zisfSm4tIfGI8nqi8XBeKxsOU7PRt5/XRNn1BbTcvWR+w
 2t6jjlAeuEvqrNH8L/rtzS0h9RnUQ2dFWDQITc0SCfLful6hoZ/btLozfNx/HF9KF1wgBYnrxGw
 y0hm/DffTVnFZE7M9rSxhIAAEMTy21JIrp7jZRoRrE2zQxxb6E50ufeRb5AxrbWjjY/TLR7t/wa
 jStedYdVg71Q6/DbG/kQwXoT/bI2qFzGbjdpYr8v7ysXh6Z23db6olRZ8gNm8i
X-Google-Smtp-Source: AGHT+IGcWdNT0xVuHY9LLAQ9NVcMhgImgKyejVxwRBbqtL7Bi40iGDvJ6BKsS3+umVfa/6hnMbbliQ==
X-Received: by 2002:a05:600c:45cd:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-459f4eb4004mr99075215e9.10.1754850289233; 
 Sun, 10 Aug 2025 11:24:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5b84674sm237436145e9.30.2025.08.10.11.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 11:24:48 -0700 (PDT)
Message-ID: <51b5e540-d659-43a7-b45e-4d5b972cfc64@smile.fr>
Date: Sun, 10 Aug 2025 20:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Andreas_K=C3=A4ssens?= <kaessens@sra.uni-hannover.de>,
 buildroot@buildroot.org
Cc: Rudi Heitbaum <rudi@heitbaum.com>
References: <20250611084023.22693-1-kaessens@sra.uni-hannover.de>
Content-Language: fr
In-Reply-To: <20250611084023.22693-1-kaessens@sra.uni-hannover.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754850289; x=1755455089; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q9c1x3tQQQmQKGxtWH6ZnoJ1VrfMmXpcZAkjGe3RI2c=;
 b=lbEmYFZq8JB6q02x9lZc4OU9CeHHivyl4EOWvfWwE7oXRBDceFvxJgqxOzHxWDGarv
 jif0yawWVYj69oAimg6QtH9gV2A+tUeB+NMvEgSDqVTNsIidFvXvNVGVofPISA+Hl8yZ
 2Q4wmKzKBie6pRA1dmqfqJ+F5QxLOOBlPyzY8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lbEmYFZq
Subject: Re: [Buildroot] [PATCH] package/yajl: fix cmake 4 compatibility
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywgQWxsLAoKTGUgMTEvMDYvMjAyNSDDoCAxMDo0MCwgQW5kcmVhcyBLw6Rz
c2VucyBhIMOpY3JpdMKgOgo+IEZpeGVzIGRlcHJlY2F0ZWQgQ01ha2Ugb3B0aW9ucy4KPiAKPiBP
cmlnaW5hbCBwYXRjaCBieSBSdWRpIEhlaXRiYXVtLCByZWJhc2VkIGFuZCBhcHBsaWVzIHdpdGgg
ZnV6eiAwLgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydG9iYXIveWFqbC9jb21taXQvZGQ4OGUyZWEy
ZmMzZjA0NTcyMmY2ZmVlMzYyYWYyNjQzYjUzOTRmNS5wYXRjaAo+IAoKSSBmb3VuZCBhIHJlZmVy
ZW5jZSBsaW5rIHRvIHRoaXMgaXNzdWUgaW4gb3VyIGF1dG9idWlsZGVyczoKCmh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvP3JlYXNvbj15YWpsLTIuMS4wCgpGaXhlczoKaHR0cHM6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzBiNi8wYjZhZGE5M2Y0NWMxNmNjOGM1NThl
YzIzYTBlYjU2ZGEyYWE4NmU5Cgo+IENDOiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEvDpHNzZW5zIDxrYWVzc2Vuc0BzcmEudW5pLWhh
bm5vdmVyLmRlPgo+IC0tLQo+IAo+IFRoZSBvcmlnaW5hbCBwYWNrYWdlIGhhc24ndCBiZWVuIHVw
ZGF0ZWQgZm9yIDEwIHllYXJzIAo+IGFuZCB0aGUgeWFqbCBmb3JrIGNvbnRhaW5zIENWRSBmaXhl
cyBhcyB3ZWxsLAo+IGJ1dCBpIGRvbid0IGtub3cgaG93IHRvIGhhbmRsZSB0aGF0Lgo+IEFsc28g
cGxlYXNlIGNvbnNpZGVyIHRoYXQgdGhpcyBpcyBteSBmaXJzdCBzdWJtaXNzaW9uIHRvIGJ1aWxk
cm9vdCwKPiBpZiB0aGVyZSBhcmUgYW55IGlzc3VlcyB3aXRoIHRoZSBwYXRjaCwgcGxlYXNlIGxl
dCBtZSBrbm93LgoKSW5kZWVkLCBpdCdzIGFub3lpbmcgc2luY2UgaXQgdXNlZCBieSBzZXZlcmFs
IHBhY2thZ2VzIHN1Y2ggY29sbGVjdGQsIGNydW4sCmxpYnZpcnQsIG1vZHNlY3VyaXR5MiBhbmQg
cmFwdG9yLi4uCgo+IAo+IAo+ICAuLi4vMDAwNS1BbGxvdy1idWlsZC13aXRoLUNNYWtlLTQuMC4w
LnBhdGNoICAgfCA2NiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3lhamwvMDAwNS1BbGxv
dy1idWlsZC13aXRoLUNNYWtlLTQuMC4wLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
eWFqbC8wMDA1LUFsbG93LWJ1aWxkLXdpdGgtQ01ha2UtNC4wLjAucGF0Y2ggYi9wYWNrYWdlL3lh
amwvMDAwNS1BbGxvdy1idWlsZC13aXRoLUNNYWtlLTQuMC4wLnBhdGNoCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jNzJlNGRlNmFjCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UveWFqbC8wMDA1LUFsbG93LWJ1aWxkLXdpdGgtQ01ha2UtNC4wLjAucGF0
Y2gKPiBAQCAtMCwwICsxLDY2IEBACj4gK0Zyb20gZGQ4OGUyZWEyZmMzZjA0NTcyMmY2ZmVlMzYy
YWYyNjQzYjUzOTRmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogUnVkaSBIZWl0
YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Cj4gK0RhdGU6IEZyaSwgMjggTWFyIDIwMjUgMDk6MzE6
NDAgKzAwMDAKPiArU3ViamVjdDogW1BBVENIXSBBbGxvdyBidWlsZCB3aXRoIENNYWtlIDQuMC4w
Cj4gKwo+ICtmaXhlcyBkZXByZWNhdGVkIGNtYWtlIG9wdGlvbiBhbmQgdXNlcyBjbWFrZSAyLjgu
MCBUQVJHRVRfRklMRQo+ICt1cGRhdGUgY21ha2Ugc3VwcG9ydGVkIG1pbmltdW0gdmVyc2lvbnMg
dG8gMi44LjAuLi4zLjEwCj4gKwo+ICtyZWY6Cj4gKy0gaHR0cHM6Ly9jbWFrZS5vcmcvY21ha2Uv
aGVscC9sYXRlc3QvcG9saWN5L0NNUDAwMjYuaHRtbAo+ICsKPiArQ01ha2UgRXJyb3IgYXQgLi4u
L0NNYWtlTGlzdHMudHh0OiAoR0VUX1RBUkdFVF9QUk9QRVJUWSk6Cj4gKyAgVGhlIExPQ0FUSU9O
IHByb3BlcnR5IG1heSBub3QgYmUgcmVhZCBmcm9tIHRhcmdldCAianNvbl8uLi4iLiAgVXNlIHRo
ZQo+ICsgIHRhcmdldCBuYW1lIGRpcmVjdGx5IHdpdGggYWRkX2N1c3RvbV9jb21tYW5kLCBvciB1
c2UgdGhlIGdlbmVyYXRvcgo+ICsgIGV4cHJlc3Npb24gJDxUQVJHRVRfRklMRT4sIGFzIGFwcHJv
cHJpYXRlLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1
bS5jb20+CgouL3V0aWxzL2NoZWNrLXBhY2thZ2Ugd2FybiBhYm91dCBtaXNzaW5nICJ1cHN0cmVh
bToiIHRhZwoKV0FSTklORzogcGFja2FnZS95YWpsLzAwMDUtQWxsb3ctYnVpbGQtd2l0aC1DTWFr
ZS00LjAuMC5wYXRjaDowOiBtaXNzaW5nClVwc3RyZWFtIGluIHRoZSBoZWFkZXIuCgpDYW4geW91
IHNlbmQgYW4gdXBkYXRlZCBwYWNoIHdpdGggYm90aCBmaXhlcz8KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgoKPiArLS0tCj4gKyBDTWFrZUxpc3RzLnR4dCAgICAgICAgICAgICB8IDIgKy0KPiArIHJl
Zm9ybWF0dGVyL0NNYWtlTGlzdHMudHh0IHwgNCArLS0tCj4gKyB2ZXJpZnkvQ01ha2VMaXN0cy50
eHQgICAgICB8IDQgKy0tLQo+ICsgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxp
c3RzLnR4dAo+ICtpbmRleCA0NzFlZWUxMy4uZGViYTNhNDAgMTAwNjQ0Cj4gKy0tLSBhL0NNYWtl
TGlzdHMudHh0Cj4gKysrKyBiL0NNYWtlTGlzdHMudHh0Cj4gK0BAIC0xMiw3ICsxMiw3IEBACj4g
KyAjIEFDVElPTiBPRiBDT05UUkFDVCwgTkVHTElHRU5DRSBPUiBPVEhFUiBUT1JUSU9VUyBBQ1RJ
T04sIEFSSVNJTkcgT1VUIE9GCj4gKyAjIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgVVNFIE9S
IFBFUkZPUk1BTkNFIE9GIFRISVMgU09GVFdBUkUuCj4gKyAKPiArLUNNQUtFX01JTklNVU1fUkVR
VUlSRUQoVkVSU0lPTiAyLjYpCj4gKytDTUFLRV9NSU5JTVVNX1JFUVVJUkVEKFZFUlNJT04gMi44
LjAuLi4zLjEwKQo+ICsgCj4gKyBQUk9KRUNUKFlldEFub3RoZXJKU09OUGFyc2VyIEMpCj4gKyAK
PiArZGlmZiAtLWdpdCBhL3JlZm9ybWF0dGVyL0NNYWtlTGlzdHMudHh0IGIvcmVmb3JtYXR0ZXIv
Q01ha2VMaXN0cy50eHQKPiAraW5kZXggNTJhOWJlZTguLjI2N2QwMmUyIDEwMDY0NAo+ICstLS0g
YS9yZWZvcm1hdHRlci9DTWFrZUxpc3RzLnR4dAo+ICsrKysgYi9yZWZvcm1hdHRlci9DTWFrZUxp
c3RzLnR4dAo+ICtAQCAtMzksOSArMzksNyBAQCBJRiAoTk9UIFdJTjMyKQo+ICsgRU5ESUYgKE5P
VCBXSU4zMikKPiArIAo+ICsgIyBjb3B5IHRoZSBiaW5hcnkgaW50byB0aGUgb3V0cHV0IGRpcmVj
dG9yeQo+ICstR0VUX1RBUkdFVF9QUk9QRVJUWShiaW5QYXRoIGpzb25fcmVmb3JtYXQgTE9DQVRJ
T04pCj4gKy0KPiArIEFERF9DVVNUT01fQ09NTUFORChUQVJHRVQganNvbl9yZWZvcm1hdCBQT1NU
X0JVSUxECj4gKy0gICAgQ09NTUFORCAke0NNQUtFX0NPTU1BTkR9IC1FIGNvcHlfaWZfZGlmZmVy
ZW50ICR7YmluUGF0aH0gJHtiaW5EaXJ9KQo+ICsrICAgIENPTU1BTkQgJHtDTUFLRV9DT01NQU5E
fSAtRSBjb3B5X2lmX2RpZmZlcmVudCAkPFRBUkdFVF9GSUxFOmpzb25fcmVmb3JtYXQ+ICR7Ymlu
RGlyfSkKPiArIAo+ICsgSU5TVEFMTChUQVJHRVRTIGpzb25fcmVmb3JtYXQgUlVOVElNRSBERVNU
SU5BVElPTiBiaW4pCj4gK2RpZmYgLS1naXQgYS92ZXJpZnkvQ01ha2VMaXN0cy50eHQgYi92ZXJp
ZnkvQ01ha2VMaXN0cy50eHQKPiAraW5kZXggOTY3ZmNhMTYuLjJmMzkwMDgyIDEwMDY0NAo+ICst
LS0gYS92ZXJpZnkvQ01ha2VMaXN0cy50eHQKPiArKysrIGIvdmVyaWZ5L0NNYWtlTGlzdHMudHh0
Cj4gK0BAIC0zMyw5ICszMyw3IEBAIEVMU0UoKQo+ICsgRU5ESUYoKQo+ICsgCj4gKyAjIGNvcHkg
aW4gdGhlIGJpbmFyeQo+ICstR0VUX1RBUkdFVF9QUk9QRVJUWShiaW5QYXRoIGpzb25fdmVyaWZ5
IExPQ0FUSU9OKQo+ICstCj4gKyBBRERfQ1VTVE9NX0NPTU1BTkQoVEFSR0VUIGpzb25fdmVyaWZ5
IFBPU1RfQlVJTEQKPiArLSAgICBDT01NQU5EICR7Q01BS0VfQ09NTUFORH0gLUUgY29weV9pZl9k
aWZmZXJlbnQgJHtiaW5QYXRofSAke2JpbkRpcn0pCj4gKysgICAgQ09NTUFORCAke0NNQUtFX0NP
TU1BTkR9IC1FIGNvcHlfaWZfZGlmZmVyZW50ICQ8VEFSR0VUX0ZJTEU6anNvbl92ZXJpZnk+ICR7
YmluRGlyfSkKPiArIAo+ICsgSU5TVEFMTChUQVJHRVRTIGpzb25fdmVyaWZ5IFJVTlRJTUUgREVT
VElOQVRJT04gYmluKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
