Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36307C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:32:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D83B601FA
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D83B601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CCB5607BD;
	Thu,  7 Oct 2021 20:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cjgX_EGK127; Thu,  7 Oct 2021 20:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02673606FA;
	Thu,  7 Oct 2021 20:31:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 991941BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 847FE84342
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQjyBUpGvRPe for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:31:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C43084340
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:31:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m22so22916622wrb.0
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=k2DzpEaZy5TgIdgT9cGVnfHL3p0FsOGPSMbmb3uiWYM=;
 b=anMUMJrJAJCbBEcyJKVx2189OFDlYrNc41RJSzwzH7tFRzTbn07/z0VXPnd4AkQyTD
 LTYCs5+GsL9G/BIyad0LcWH7z858IrZmjtQd0GkSceM0deYd7KhyiFeEjUrw4gZFHwR+
 vBqtvrP1e1CFBnYfVmK0nfiEHDaqKdtuBzyxHZQNucmLVS15c2D2R7pZ6i4T9KvtUUkD
 rwIcQMjkx8Yd09n95HT9xBsc9lM9tXXkuJCqaA2fM7sOXv27h7wr3GWeL7x804I9cAlN
 kabtbtt7X3iA/xQESbGw1kKDPkvbq0P62hCmIzplwvOtgJy6dOR2MtnJk0BDRHKTP36T
 7qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=k2DzpEaZy5TgIdgT9cGVnfHL3p0FsOGPSMbmb3uiWYM=;
 b=L+ir6xnrO322najh1Xpf1tbQx0Bb4bi3U2OwJ+JCS5x8tZ8Wr+au4BfzL5bMXGO6Q0
 lheg7G4ISGIrix4CFun94lKvqal56gZHesrTPhFQ1nC1qlDwLGTFf66iteQIbQ2+vBPL
 Pb+OMuwO/IbJGPzNz4pa1q6nOOp7px2Zzk433vzlgCv4bHjWVbhQ4lBnaaPsPhZ687cI
 IHkhFwKS1LQfiVlqwJFUSBcECGixeBT2+aOSAAa7LuCaNzXH3RSES3lRBpjtJwWxxxFx
 ym4Ry7k2BPxPMavA7kQXcLKtBisr15qYIP0T/ni483H+hAE2mBCw4yXqND57LJv7ccug
 6qvw==
X-Gm-Message-State: AOAM532flPzw1FQ9LFkNhyJ8m822/2oX5mwGfeCQN3HHwe6fwyfJperh
 36PGzJiv5SJAvcjqbt2jQxFzmsi5Go4=
X-Google-Smtp-Source: ABdhPJxrfzEVnyXqiTOwqekDC33Kb85tBHd6FiN/ZQbNeos2uoKNRYd3v1rCp4E3s0cF8lCO0yE/vg==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr7817204wri.193.1633638715344; 
 Thu, 07 Oct 2021 13:31:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id f16sm368733wrr.53.2021.10.07.13.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 13:31:54 -0700 (PDT)
Message-ID: <abf46c35-f025-8413-fe1e-ce7367d441e8@gmail.com>
Date: Thu, 7 Oct 2021 22:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210912141140.253778-9-romain.naour@gmail.com>
 <20210922201027.934860-1-arnout@mind.be>
 <074d7a6f-bebc-1b36-f845-34ab5297d707@gmail.com>
 <f40b51e0-815d-76dc-f44b-482e9adeaaf5@mind.be>
 <8c9191ba-efe8-5277-8d66-791157a52d90@gmail.com>
In-Reply-To: <8c9191ba-efe8-5277-8d66-791157a52d90@gmail.com>
Subject: Re: [Buildroot] [PATCH] .gitlab-ci.yml: update docker image to
 20210922.2200
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMjMvMDkvMjAyMSDDoCAyMjo1MiwgUm9tYWluIE5hb3VyIGEgw6lj
cml0wqA6Cj4gSGVsbG8gQXJub3V0LAo+IAo+IE9uIDIzLzA5LzIwMjEgMjA6MjUsIEFybm91dCBW
YW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMi8wOS8yMDIxIDIzOjQ1LCBSb21haW4g
TmFvdXIgd3JvdGU6Cj4+PiBIaSBBcm5vdXQsCj4+Pgo+Pj4gTGUgMjIvMDkvMjAyMSDDoCAyMjox
MCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSBhIMOpY3JpdMKgOgo+Pj4+
IENvbW1pdCA3MWI4MzIyNzEyOGJlNjJjMTY5MzEzZTg1YmI4ZjMzOWY5NzdhZDY3IHVwZGF0ZWQg
dGhlIERvY2tlcmZpbGUKPj4+PiB0byBiZSB1c2VkIGluIENJIHRlc3RzLiBJbiBvcmRlciB0byBh
Y3R1YWxseSB1c2UgdGhpcyBuZXcgZG9ja2VyIGltYWdlLAo+Pj4+IHVwZGF0ZSAuZ2l0bGFiLWNp
LnltbCB0byBwb2ludCB0byB0aGUgZG9ja2VyIGltYWdlIHRoYXQgd2FzIGNyZWF0ZWQgd2l0aAo+
Pj4+IHRoZSB1cGRhdGVkIERvY2tlcmZpbGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBcm5v
dXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KPj4+Cj4+
PiBUaGVyZSBhcmUgc29tZSBuZXcgaXNzdWVzIHNpbmNlIGxhc3QgdGltZSBJIHRlc3RlZDoKPj4+
Cj4+PiBXaXRob3V0IHB5dGhvbiBpbnN0YWxsZWQsIHN5c2xpbnV4IGRvZXNuJ3QgYnVpbGQuCj4+
Pgo+Pj4gVGVzdFN5c0xpbnV4WDg2RUZJL2J1aWxkL3N5c2xpbnV4LTYuMDMvY29tMzIvY21lbnUv
bWVudWdlbi5weSBbLi4uXQo+Pj4gbWFrZVs2XTogcHl0aG9uOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Cj4+Pgo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2Jz
LzE2MTQ0NDY3NjYKPj4KPj4gwqBGb3IgdGhhdCwgd2UganVzdCBuZWVkIHRoZSBweXRob24taXMt
cHl0aG9uMyBwYWNrYWdlIChvciB3aGF0ZXZlciBpdCdzIGNhbGxlZCkuCj4+IE9yLCBiZXR0ZXIg
eWV0LCBsZXQgc3lzbGludXggZGVwZW5kIG9uIGhvc3QtcHl0aG9uMy4KPiAKPiBBY3R1YWxseSBw
eXRob24gaXMgbm90IGEgbWFuZGF0b3J5IGRlcGVuZGVuY3kgb2YgQnVpbGRyb290Lgo+IFdpdGgg
cHl0aG9uLWlzLXB5dGhvbjMgaW5zdGFsbGVkIGl0IGRvZXNuJ3QgZml4IHRoZSBkZXBlbmRlbmN5
IGlzc3VlIGZvciBnb29kLgo+IAo+IEl0IHNlZW1zIHdlIGNhbiBvdmVycmlkZSB0aGUgcHl0aG9u
IGludGVycHJldGVyOgo+IGh0dHBzOi8vcmVwby5vci5jei9zeXNsaW51eC5naXQvY29tbWl0ZGlm
Zi80ZGVjNjJjZTljMmMwZDE3MGYyMWIzYWUyZDdjNjE4ZWI3YTMwYzA1Cj4gCj4gU28gd2UgY2Fu
IGZvcmNlIHN5c2xpbnV4IHVzaW5nIHRoZSBweXRob24zIGludGVycHJldGVyIHByb3ZpZGVkIGJ5
IGhvc3QtcHl0aG9uMy4KCkZpeGVkIGJ5OgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxk
cm9vdC9jb21taXQvP2lkPTZjY2ZkNDA3MTFlMTIyYzcyMDE0NTA0NGViNGQxNDVhOGJhY2Q5ZGIK
Cj4gCj4+Cj4+Cj4+PiBUaGVyZSBpcyBhIG5ldyBpc3N1ZSB3aXRoIHB5dGhvbi1hdHRycyB0ZXN0
IHdoZW4gcHl0aG9uMiBpcyBub3QgaW5zdGFsbGVkOgo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2t1
YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MTQ0NDY5NDMKPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9r
dWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNjE0NDQ2OTM5Cj4+Cj4+IMKgSSBzdXNwZWN0IHRoYXQg
dGhhdCdzIGp1c3QgYmVjYXVzZSBweXRob24tYXR0cnMgbm8gbG9uZ2VyIHN1cHBvcnRzIHB5dGhv
bjIuIEl0Cj4+IGhhcHBlbnMgb24gdGhlIGF1dG9idWlsZGVycyBhcyB3ZWxsOgo+Pgo+PiBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xNzUvMTc1YzJkZDgyZGQzMDVlZDg4
YjRkMTc4MGJkOGM1MmU0ZjY1MWRlNS8KPj4KPiAKPiBJdCBzZWVtcyBhIGZpeCBpcyBub3cgYXZh
aWxhYmxlOgo+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIxMDkyMzE4Mzc1MS4zNjEzODYtMS1hc2Fma2E3QGdtYWlsLmNvbS8KCkZpeGVkIGJ5
OgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWVmNWM4YmUy
NWFiMzczODY2YjVhOTJkM2Q5ZjMxYmYzNmI3YThhYmYKCj4gCj4+Cj4+IMKgQW5kIEkgaGF2ZSB0
aGUgc2FtZSBmYWlsdXJlIHdoZW4gSSBidWlsZCBvbiBteSBsYXB0b3AsIHdoaWNoIGRvZXMgaGF2
ZSBweXRob24yCj4+IGluc3RhbGxlZCAodGhvdWdoIC91c3IvYmluL3B5dGhvbiBpcyBweXRob24z
KS4KPj4KPj4KPj4+IFN0cmFuZ2UgcHl0aG9uIGlzc3VlIHdpdGggcmVmcG9saWN5LTIuMjAyMTA5
MDggYnVpbGQ6Cj4+PiBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMv
MTYxNDQ0NjgyNi8KPj4KPj4gwqBBcmUgeW91IHN1cmUgaXQgaXMgcmVsYXRlZCB0byBweXRob24/
IEkgYWxzbyBnZXQgdGhlIHNhbWUgZXJyb3Igd2hlbiBJIGJ1aWxkIGl0Cj4+IGxvY2FsbHkgb24g
bXkgbGFwdG9wLgo+IAo+IE5vLCBJIHJldmVydGVkIHRoZSBsYXN0IHZlcnNpb24gYnVtcCBvZiBy
ZWZwb2xpY3kgYW5kIHRoZSB0ZXN0IHN1Y2NlZWQuCj4gSXQgc2VlbXMgYSByZWZwb2xpY3kgaXNz
dWUuCgpGaXhlZCBieToKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0
Lz9pZD02MGY5OTFlNjhjYWMzMGMzZTk5MTJlNzMyNThmNzgwNGU3MDIxZDVlCgpTbyBhbGwgdGhl
IHJ1bnRlc3QgaXNzdWVzIGhhcyBiZWVuIGZpeGVkLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+CgpCZWZvcmUgbWVyZ2luZyB0aGlzIHBhdGNoIHdlIGNhbiBtZXJn
ZSB0aGUgY3NreSB0b29sY2hhaW4gcmVtb3ZhbDoKCmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9w
aXBlcm1haWwvYnVpbGRyb290LzIwMjEtT2N0b2Jlci82MjQ4NjYuaHRtbAoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4KPj4KPj4gwqBS
ZWdhcmRzLAo+PiDCoEFybm91dAo+Pgo+Pj4KPj4+Cj4+PiBCdXQgdGhlIGlzc3VlIEkgaGFkIHdp
dGggVGVzdENoZWNrUGFja2FnZSBpcyBmaXhlZCB3aXRoIHRoZSByZWNlbnQgc3dpdGNoIHRvCj4+
PiBweXRob24zLgo+Pj4KPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0v
am9icy8xNjE0NDQ3MjM2Cj4+Pgo+Pj4gV2l0aCBhbGwgaXNzdWVzIGZpeGVkOgo+Pj4gwqDCoCBB
Y2tlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+Pj4gwqDCoCBU
ZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4+Cj4+PiBC
ZXN0IHJlZ2FyZHMsCj4+PiBSb21haW4KPj4+Cj4+Pj4gLS0tCj4+Pj4gwqAgLmdpdGxhYi1jaS55
bWwgfCAyICstCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNp
LnltbAo+Pj4+IGluZGV4IGJmOWYyZGNhNmMuLjE1MGI4ZWFjMWEgMTAwNjQ0Cj4+Pj4gLS0tIGEv
LmdpdGxhYi1jaS55bWwKPj4+PiArKysgYi8uZ2l0bGFiLWNpLnltbAo+Pj4+IEBAIC0xLDcgKzEs
NyBAQAo+Pj4+IMKgICMgQ29uZmlndXJhdGlvbiBmb3IgR2l0bGFiLUNJLgo+Pj4+IMKgICMgQnVp
bGRzIGFwcGVhciBvbiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
cGlwZWxpbmVzCj4+Pj4gwqAgLWltYWdlOiBidWlsZHJvb3QvYmFzZToyMDIwMDgxNC4yMjI4Cj4+
Pj4gK2ltYWdlOiBidWlsZHJvb3QvYmFzZToyMDIxMDkyMi4yMjAwCj4+Pj4gwqAgwqAgc3RhZ2Vz
Ogo+Pj4+IMKgwqDCoCAtIGdlbmVyYXRlLWdpdGxhYi1jaQo+Pj4+Cj4+Pgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
