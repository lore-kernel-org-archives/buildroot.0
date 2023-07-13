Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC4FEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81649612FB;
	Thu, 13 Jul 2023 07:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81649612FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egRUjA7kGIh8; Thu, 13 Jul 2023 07:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94BCE612A9;
	Thu, 13 Jul 2023 07:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BCE612A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4BF61BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAF78612A9
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF78612A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JB6Ku97bsb1R for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:25:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68906611A4
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68906611A4
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:25:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso4731991fa.1
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 00:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689233147; x=1691825147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kEPaaTloxZYGxPkbM8bc2XQrbCvsYgg7WthybCVtRyc=;
 b=MgutVI6U89ZV7SM15Bm/g3i5yxcSNADl4eD8n+9EY/pGR0P2SldFafbG30KUgQG4Gb
 ane38xOJ6pZnBAmHBZKp++uFqk2t8H+L+Z2g4/bIwUOH1KOzLeziFz1fnDPOVMehyVej
 87RajBFG26qzYbhEZUQ2y01pn17GV2WktL71oRx1VX7+16T/O2O1oefLdyxNVyKEpSbJ
 IxFdeCFzF6Fhj0w1/O5uZ6fQnrun5OQMJNBZ3eaBU7yEaAE0RlvAufVLGKILMn/NBTuy
 XokQtvWRamysSUxL/Z7es2MpPttcYxP9+BlrPmHCjsuco5O0sSp3IQaYBirbiqHL1tdV
 cmww==
X-Gm-Message-State: ABy/qLa13UvwQJsheW33qgviJkFihNwQzlY5+fx8PpvhxXptFIM3lGI+
 GWlLON6PGlrOLcREkZgUSFcarg==
X-Google-Smtp-Source: APBJJlGtiaQN78lK5tszQg+QP4o/KLwK2o3EMI9/LPvAtIyn2NvSmXQ5xKHEGKBygWQK/fW/1+6+hA==
X-Received: by 2002:a2e:8456:0:b0:2b6:df00:b371 with SMTP id
 u22-20020a2e8456000000b002b6df00b371mr692995ljh.6.1689233147005; 
 Thu, 13 Jul 2023 00:25:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bc8cf000000b003fbaa2903f4sm6892023wml.19.2023.07.13.00.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 00:25:46 -0700 (PDT)
Message-ID: <e0d6be06-b05d-a3bb-7ddb-ea847697facb@smile.fr>
Date: Thu, 13 Jul 2023 09:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Bernd Kuhls <bernd@kuhls.net>
References: <20230712171342.1204890-1-bernd@kuhls.net>
 <20230712184259.GG188780@scaer>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230712184259.GG188780@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689233147; x=1691825147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kEPaaTloxZYGxPkbM8bc2XQrbCvsYgg7WthybCVtRyc=;
 b=AsL6Y8pklvnpZtVwnLuJGihMfXA9D0R1UsG8S8s2Q66Jia3O1wxWx3QmqpsxiDX6X0
 l8w8m+gp4ut1gA9oRy9SmAnT4/wdAtxlJGW04LlyUiwoFSo6CrAF9DgDeQEl1zM5k7l0
 PmfBaPVkt3PsW2BnSnuFQ+nEYDhblABIp+2QS94lSJ9e7ebDOcthQOL/FDdTv/iy/m3+
 aPk4DegwBGeMhU+XTsHkohL4Z/cxtGuUWBes5wTzCLcLdbkRiC2ypC0gS2A9IzQl7i9A
 OkAIY6D3CHLUgoCY/NC7C/Bt0QQwFINblsSv9RxU8spR7aE5RpLh088AoucIivsT/0g5
 2z3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=AsL6Y8pk
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: fix glx-detection
 without glvnd
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpMZSAxMi8wNy8yMDIzIMOgIDIwOjQyLCBZYW5uIEUuIE1PUklOIGEgw6lj
cml0wqA6Cj4gQmVybmQsIEFsbCwKPiAKPiBPbiAyMDIzLTA3LTEyIDE5OjEzICswMjAwLCBCZXJu
ZCBLdWhscyBzcGFrZSB0aHVzbHk6Cj4+IEZpeGVzOgo+PiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ2MjEwNDYzMjYKPj4KPj4gU2lnbmVkLW9mZi1i
eTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAKPiBBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiAtLS0KPj4gIC4uLmVzb24tZml4LWds
eC1kZXRlY3Rpb24td2l0aG91dC1nbHZuZC5wYXRjaCB8IDQ3ICsrKysrKysrKysrKysrKysrKysK
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9tZXNhM2QtZGVtb3MvMDAwMi1tZXNvbi1maXgtZ2x4LWRldGVjdGlvbi13aXRo
b3V0LWdsdm5kLnBhdGNoCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC1kZW1vcy8w
MDAyLW1lc29uLWZpeC1nbHgtZGV0ZWN0aW9uLXdpdGhvdXQtZ2x2bmQucGF0Y2ggYi9wYWNrYWdl
L21lc2EzZC1kZW1vcy8wMDAyLW1lc29uLWZpeC1nbHgtZGV0ZWN0aW9uLXdpdGhvdXQtZ2x2bmQu
cGF0Y2gKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMzdhNjBl
ZmRkNwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvbWVzYTNkLWRlbW9zLzAwMDIt
bWVzb24tZml4LWdseC1kZXRlY3Rpb24td2l0aG91dC1nbHZuZC5wYXRjaAo+PiBAQCAtMCwwICsx
LDQ3IEBACj4+ICtGcm9tIGUxNjExN2ZjOTI2ODhkNzZhMDQyYWQyYzU5MGM3N2Q1YTk4N2E0YWMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+ICtGcm9tOiBFcmlrIEZheWUtTHVuZCA8ZXJpay5m
YXllLWx1bmRAY29sbGFib3JhLmNvbT4KPj4gK0RhdGU6IEZyaSwgMjQgTWFyIDIwMjMgMTM6MzE6
NTggKzAxMDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gbWVzb246IGZpeCBnbHgtZGV0ZWN0aW9uIHdp
dGhvdXQgZ2x2bmQKPj4gKwo+PiArV2hlbiBidWlsZCB3aXRob3V0IEdMVk5ELCBNZXNhIHByb3Zp
ZGVzIEdMWCBhcyBhIHBhcnQgb2YgbGliR0wsIGp1c3QKPj4gK2xpa2UgWFF1YXJ0eiBkb2VzIG9u
IE1hY09TLiBUaGVyZSdzIG5vdGhpbmcgcmVhbGx5IG1hY09TIHNwZWNpZmljIGFib3V0Cj4+ICt0
aGlzIGZhbGxiYWNrLCBzbyBsZXQncyBkcm9wIHRoZSBjb25kaXRpb24uCj4+ICsKPj4gK0FuZCBq
dXN0IGZvciBnb29kIG1lYXN1cmUsIGxldCdzIGFkZCBpbiBkZXBfZ2wgYXMgYSBkZXBlbmRlbmN5
IGZvcgo+PiArdGhlIGhlYWRlci1jaGVjayBoZXJlLCBpbiBjYXNlIHNvbWUgb25lIGRlY2lkZXMg
dG8gaW5zdGFsbCBsaWJHTCBvdXRzaWRlCj4+ICtvZiB0aGUgZGVmYXVsdCBpbmNsdWRlIGRpcmVj
dG9yeS4KPj4gKwo+PiArRml4ZXM6IDM0MzAwNTUxICgibWVzb246IGV4cGxpY2l0bHkgY2hlY2sg
Zm9yIGdseCBkZXBlbmRlbmN5IikKPj4gK0Nsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL21lc2EvZGVtb3MvLS9pc3N1ZXMvMzYKPj4gK1Jldmlld2VkLWJ5OiBIb2UgSGFvIENo
ZW5nIDxoYW9jaGVuZ2hvMTI5MDdAZ21haWwuY29tPgo+PiArCj4+ICtVcHN0cmVhbTogaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZGVtb3MvLS9jb21taXQvZTE2MTE3ZmM5MjY4
OGQ3NmEwNDJhZDJjNTkwYzc3ZDVhOTg3YTRhYwo+PiArCj4+ICtTaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+PiArLS0tCj4+ICsgbWVzb24uYnVpbGQgfCA5ICsr
KysrLS0tLQo+PiArIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4+ICsKPj4gK2RpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCj4+ICtp
bmRleCBjMTg1M2Y5NC4uYmMzMjc4ZTEgMTAwNjQ0Cj4+ICstLS0gYS9tZXNvbi5idWlsZAo+PiAr
KysrIGIvbWVzb24uYnVpbGQKPj4gK0BAIC05OSwxMCArOTksMTEgQEAgaWYgbm90IGRlcF9nbHUu
Zm91bmQoKSBhbmQgaG9zdF9tYWNoaW5lLnN5c3RlbSgpICE9ICdkYXJ3aW4nCj4+ICsgZW5kaWYK
Pj4gKyAKPj4gKyBkZXBfZ2x4ID0gZGVwZW5kZW5jeSgnZ2x4JywgcmVxdWlyZWQ6IGZhbHNlLCBk
aXNhYmxlciA6IHRydWUpCj4+ICstaWYgbm90IGRlcF9nbHguZm91bmQoKSBhbmQgaG9zdF9tYWNo
aW5lLnN5c3RlbSgpID09ICdkYXJ3aW4nCj4+ICstICAjIHhxdWFydHogZG9lc24ndCBoYXZlIGEg
Z2x4LnBjLCBidXQgaXQgZG9lcyBoYXZlIHRoZSBoZWFkZXIuIEFuZCBhbGwgdGhlCj4+ICstICAj
IHN5bWJvbHMgcmVzaWRlIGluIGxpYkdMLCBzbyBsZXQncyBqdXN0IHVzZSB0aGF0Lgo+PiArLSAg
aWYgY2MuY2hlY2tfaGVhZGVyKCdHTC9nbHguaCcsIGRlcGVuZGVuY2llczogZGVwX3gxMSkKPj4g
KytpZiBub3QgZGVwX2dseC5mb3VuZCgpCj4+ICsrICAjIEJvdGggTWVzYSBidWlsZCB3aXRob3V0
IEdMVk5EIGFuZCBYUXVhcnR6IGxhY2tzIGEgZ2x4LnBjLCBidXQgZG9lcwo+PiArKyAgIyBwcm92
aWRlIHRoZSBoZWFkZXIuIEFuZCBhbGwgdGhlIHN5bWJvbHMgcmVzaWRlIGluIGxpYkdMLCBzbyBs
ZXQncwo+PiArKyAgIyBqdXN0IHVzZSB0aGF0Lgo+PiArKyAgaWYgY2MuY2hlY2tfaGVhZGVyKCdH
TC9nbHguaCcsIGRlcGVuZGVuY2llczogW2RlcF94MTEsIGRlcF9nbF0pCj4+ICsgICAgIGRlcF9n
bHggPSBkZXBfZ2wKPj4gKyAgIGVuZGlmCj4+ICsgZW5kaWYKPj4gKy0tIAo+PiArR2l0TGFiCj4+
ICsKPj4gLS0gCj4+IDIuMzkuMgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
