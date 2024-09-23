Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CF6CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7BB40D0B;
	Mon, 23 Sep 2024 19:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6IWBDU_v2U7; Mon, 23 Sep 2024 19:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EEDB40CB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EEDB40CB3;
	Mon, 23 Sep 2024 19:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561D81BF3C3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E618136D
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3113bWBhrpzw for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=jarraneil@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08C4181369
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C4181369
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08C4181369
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:30:23 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7a9a3e731f9so422577885a.0
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 12:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727119823; x=1727724623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rlUeeFzVRVQMuSzn4V1c25a7+MaQQWmD8Y1ZQesaAZ0=;
 b=EFABYOCTx2guRUstXLA7kCYyDojYM/1uj7D/o0QaZvTERT54cVhKSlSbf2sKM9xgvD
 3ffvVxDpJrEHa9d79H6fgXF8/55knOd35GCtlOHpuT1yzIBupuAz7MCgm6scvSektQex
 J0uXmylFSnYGrr/rY/mua4IrGRPwRZe0e6+RcJ2pwyxMrvjlw/MBlwO5ld2pfq0ormhy
 2ix37MTwa9zidChMyykEucuRBZyICpPnG18RlZ2nzSghS0CnURtQFErsUdXe5Lew1eJD
 z3GZwEZnI6/fbMk/WN+r0/PnqmBiGrJRVEwMjMKpjmBb7YAPybZaA0sCWF229xlqE6mm
 68uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAr8FxKK9Y+wByvdUeFWlsuqn8NFUi+c/BAFgdwzYE2ZD0vZRTOT0rFQPo3gXINiTGwkP0J749UxU=@buildroot.org
X-Gm-Message-State: AOJu0YzlxnasW+L/iN4ZyPM0YL7W8gFzKMlGp/+zIGdePFn7mCjuEiXV
 Wq0uKtxsr2rUutB2oV5MTgHu0q/Rwx44UXVxaUk3LucSM9crmgVIIsqw6w==
X-Google-Smtp-Source: AGHT+IHI36cYRmilYUiZ2D4uieaX9IyUcbrHlj+rQaxFAIQtSUFzYmQb+hmTD/gNGRoHeEgqRcOXzQ==
X-Received: by 2002:a05:620a:2953:b0:7a1:e9a3:7945 with SMTP id
 af79cd13be357-7acb80aaf81mr2158588885a.21.1727119822559; 
 Mon, 23 Sep 2024 12:30:22 -0700 (PDT)
Received: from ?IPV6:2605:8d80:5a2:45c:47c1:6033:d878:9c9?
 ([2605:8d80:5a2:45c:47c1:6033:d878:9c9])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7acb08c15cdsm514546085a.91.2024.09.23.12.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 12:30:21 -0700 (PDT)
Message-ID: <a9c3d961-ceda-4092-9830-27e3c4bd114b@gmail.com>
Date: Mon, 23 Sep 2024 15:30:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
 <216539b9-4730-4adc-b400-655d287a082a@mind.be>
Content-Language: en-US
From: Neil Webster <jarraneil@gmail.com>
In-Reply-To: <216539b9-4730-4adc-b400-655d287a082a@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727119823; x=1727724623; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rlUeeFzVRVQMuSzn4V1c25a7+MaQQWmD8Y1ZQesaAZ0=;
 b=NbmB0F66YpvdpFx9VQzZDZYeGkEoBJhdP1M0Sv2b5vkhU7u3FDBZ75q5whMddXslM3
 LXkdqGnRHLUh7f+0bP+C71kp+T9ZTZpyDMtFQ3Dt2Vdg88gG1buXfM/qMX0vpnxQ8wF/
 kayib+22QPapRmWN/C4Wg9DwbqPgflUZfKuzfi5RpakCair6xiV4VxcrsVYLZMoLkFJW
 OS9Jp8Gz19FFsuvM3KxZbCjWxJQwFu3J6zCXNZnOEuFVxAkhAFyyPPYcgU1NkI3Z0n3r
 FGClk+Pj/YfO8xcdGgx3p1QK24E7u5kyMbF7M0o/vbV8EzVml7eeaJPEEB4WGCiSbcg2
 Vmsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NbmB0F66
Subject: Re: [Buildroot] Variscite Dart
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKVGhhbmsgeW91IGZvciB0aGUgcmVzcG9uc2UuCgpJIHdpbGwgd29yayB0aHJv
dWdoIGVhY2ggb2YgeW91ciBzdWdnZXN0aW9ucyBhbmQgSSBzdGFydGVkIHdpdGggdGhlIG9uZSAK
dGhhdCB5b3Ugc3RhdGVkIHdhcyBkZWZpbml0ZWx5IGluY29ycmVjdCBpLmUuIFRoZSBEVFMgbmFt
ZS4KClRoZSBWYXJpc2NpdGUgZGV2aWNlIHRyZWVzIGFyZSBkZXNjcmliZWQgaGVyZQoKaHR0cHM6
Ly93d3cudmFyaXNjaXRlLmNvbS9ibG9nL2dldHRpbmctc3RhcnRlZC13aXRoLXZhcmlzY2l0ZS1k
ZXZpY2UtdHJlZXMvCgpJIGZvdW5kIGFuZCBjb3BpZWQgdGhyZWUgRFRTKEkpIGZpbGVzCgppbXg4
bW0tdmFyLWRhcnQtZHQ4bWN1c3RvbWJvYXJkLmR0cwoKd2hpY2ggI2luY2x1ZGVzIC4uLgoKaW14
OG1tLXZhci1kYXJ0LmR0c2kKCndoaWNoICNpbmNsdWRlcyAuLi4KCmlteDhtbS5kdHNpCgpJIHJl
ZmVyZW5jZWQgdGhlIGxvY2F0aW9uIG9mIHRoZXNlIGZpbGVzIGluIApCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9EVFNfUEFUSCBhbmQgSSBzZWUgaXQgY29waWVzIHRoZW0gdG8gCm91dHB1dC9idWls
ZC9saW51eC1jdXN0b20vYXJjaC9hcm02NC9ib290L2R0cy8KClRoZSBzdWJzZXF1ZW50IGJ1aWxk
IGNvbXBsYWluZWQgYWJvdXQgbWlzc2luZyBkZXBlbmRlbmNpZXMgYW5kIEkgYWxzbyAKaGFkIHRv
IGFkZCBpbXg4bW0tcGluZnVuYy5oIGFuZCBteGwtODYxMXguaCB0byAKQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fRFRTX1BBVEguIElzIHRoYXQgdGhlIGNvcnJlY3Qgd2F5IHRvIGFkZCAuaCAKZGVw
ZW5kZW5jaWVzIG9yIGlzIHRoZXJlIGEgY2xlYW5lciB3YXkgb3IgZG9pbmcgdGhpcyBpLmUuIHNo
b3VsZCB0aGUgCkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIGJlIHJlc2VydmVkIGZv
ciBEVFMgZmlsZXMgb25seSBhcyB0aGUgCm5hbWUgc3VnZ2VzdHM/CgpBbnl3YXkgdGhlIGJ1aWxk
IHN1Y2NlZWRlZCBhZnRlciBhZGRpbmcgdGhvc2UgLmggZmlsZXMgYnV0IHNhZGx5IHN0aWxsIApu
byBjb25zb2xlLiBJIHdpbGwgbm93IG1vdmUgb250byBsb29raW5nIGF0IHRoZSBvdGhlciBpdGVt
cyB5b3UgbWVudGlvbmVkLgoKQ2hlZXJzLCBOZWlsCgpPbiAyMDI0LTA5LTE5IDc6NTMgYS5tLiwg
QXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwg
ZnJvbSBhcm5vdXRAbWluZC5iZS4gTGVhcm4gd2h5IHRoaXMgaXMgCj4gaW1wb3J0YW50IGF0IGh0
dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4KPiDCoEhpIE5l
aWwsCj4KPiBPbiAxOS8wOS8yMDI0IDAwOjE5LCBOZWlsIFdlYnN0ZXIgd3JvdGU6Cj4+IEhlbGxv
LAo+Pgo+PiBJIGFtIG5ldyB0byBCdWlsZHJvb3QgYW5kIGhhdmUgYmVlbiBzdHJ1Z2dsaW5nIGZv
ciBhIGNvdXBsZSBvZiBkYXlzIHdpdGgKPj4gc29tZXRoaW5nIGFuZCB3b25kZXJpbmcgaWYgSSBj
b3VsZCBnZXQgc29tZSBwb2ludGVycy4gUGxlYXNlIGxldCBtZSBrbm93Cj4+IGlmIHRoaXMgaXMg
bm90IHRoZSBhcHByb3ByaWF0ZSBwbGFjZSB0byBwb3N0IHN1Y2ggcXVlc3Rpb25zLgo+Pgo+PiBJ
IHdhbnQgdG8gZ2V0IGFuIGVtYmVkZGVkIExpbnV4IGltYWdlIHJ1bm5pbmcgb24gYSBWYXJpc2Np
dGUgRGFydCBNaW5pCj4+IChsaW5rIGJlbG93KQo+Pgo+PiBodHRwczovL3d3dy52YXJpc2NpdGUu
Y29tL3Byb2R1Y3Qvc3lzdGVtLW9uLW1vZHVsZS1zb20vY29ydGV4LWE1My1rcmFpdC9kYXJ0LW14
OG0tbWluaS1ueHAtaS1teDhtLW1pbmkvIAo+Pgo+Pgo+PiBJIGhhdmUgdGhlIFNPTSBjb25uZWN0
ZWQgdG8gYSBkZXYga2l0IHJlZmVyZW5jZWQgaW4gdGhlIHNhbWUgbGluayBhYm92ZS4KPj4KPj4g
SSB3YW50ZWQgdG8gdXNlIHRoZSBvcHBvcnR1bml0eSB0byBnZXQgZmFtaWxpYXIgd2l0aCBCdWls
ZHJvb3QgYnV0IHNhZGx5Cj4+IFZhcmlzY2l0ZSBkbyBub3Qgc3VwcG9ydCBCdWlsZHJvb3QgYW5k
IGluc3RlYWQgdGhleSBzdGVlcmVkIG1lIHRvd2FyZHMKPj4gWW9jdG8uCj4KPiDCoDpzYWQtZmFj
ZToKPgo+Cj4+IEkgaGF2ZSBiZWVuIGFibGUgdG8gZ2V0IGFuIGltYWdlIHJ1bm5pbmcgd2l0aCBZ
b2N0byBmb2xsb3dpbmcgdGhlaXIKPj4gcmVjaXBlcyBidXQgSSBmb3VuZCB0aGUgd2hvbGUgcHJv
Y2VzcyB0byBiZSBvYnNjdXJlIGFuZCBvcGFxdWUgYW5kIEkgYW0KPj4gdGhlcmVmb3JlIGJhY2sg
dG8gbXkgb3JpZ2luYWwgb2JqZWN0aXZlIG9mIHVzaW5nIEJ1aWxkcm9vdC4KPgo+IMKgUGxlYXNl
IG1ha2Ugc3VyZSB0byBnaXZlIHRoaXMgZmVlZGJhY2sgdG8gVmFyaXNjaXRlIQo+Cj4KPj4KPj4g
SSBoYXZlIGJlZW4gYWJsZSB0byBmb2xsb3cgdGhlIHR1dG9yaWFscyBhbmQgZ2V0IGEgYnVpbGQg
d29ya2luZyBvbiBhCj4+IFJhc3BiZXJyeSBQaS4KPj4KPj4gSG93ZXZlciwgYXMgbWVudGlvbmVk
IGFib3ZlIHRoZXJlIGlzIG5vIHN1cHBvcnQgYXZhaWxhYmxlIGZyb20gVmFyaXNjaXRlCj4+IGFu
ZCB0aGVyZSBpcyBubyBzcGVjaWZpYyBkZWZjb25maWcgZm9yIG15IGhhcmR3YXJlLCBzbyBJIHRy
aWVkIHRvIHN0YXJ0Cj4+IHdpdGggZnJlZXNjYWxlX2lteDhtbWV2a19kZWZjb25maWcgYXMgdGhp
cyBzZWVtcyB0byBiZSBjbG9zZSB3aXRoIHdoYXQKPj4gYXBwZWFyIHRvIGJlIGNvcnJlY3Qgc2V0
dGluZ3MgdW5kZXIgdGhlICJ0YXJnZXQgb3B0aW9ucyIgbWVudS4KPgo+IMKgWWVzLCB0aGF0J3Mg
YW4gZXhjZWxsZW50IHN0YXJ0IQo+Cj4gwqAuLi4gYnV0IG5vdCBlbm91Z2ggdG8gZ2V0IGEgd29y
a2luZyBib2FyZC4uLgo+Cj4KPj4gSG93ZXZlciBJIGFtIG5vdCBnZXR0aW5nIGFueXRoaW5nIGF0
IHRoZSBjb25zb2xlLgo+Pgo+PiBJIG5vdGljZWQgdGhhdCB0aGUgZnJlZXNjYWxlX2lteDhtbWV2
a19kZWZjb25maWcgc2V0cyB0aGUgZ2V0dHkgVFRZIHBvcnQKPj4gdG8gdHR5bXhjMSwgc28gSSB0
cmllZCBjaGFuZ2luZyB0aGlzIHRvIHR0eW14YzAgYXMgdGhhdCBpcyB0aGUgcG9ydAo+PiBtYXBw
ZWQgdG8gdGhlIGRlYnVnIGludGVyZmFjZSBvbiB0aGUgZGV2ZWxvcG1lbnQgYm9hcmQuIFN0aWxs
IG5vdGhpbmcgYXQKPj4gdGhlIGNvbnNvbGUuCj4KPiDCoFRoYXQgaXMgb25lIG9mIHRoZSB0aGlu
Z3MgeW91IG5lZWQgdG8gY2hhbmdlIGluZGVlZC4gSG93ZXZlciwgdGhpbmdzIAo+IGFscmVhZHkK
PiB3ZW50IHdyb25nIHdheSBiZWZvcmUgdGhhdCwgYmVjYXVzZSB5b3Ugc2hvdWxkIGhhdmUgZ290
dGVuIFUtQm9vdCBhbmQgCj4ga2VybmVsCj4gZGVidWcgb3V0cHV0IG9uIHRoZSBjb25zb2xlLgo+
Cj4gwqBUaGVyZSBhcmUgYSBudW1iZXIgb2YgdGhpbmdzIHlvdSBoYXZlIHRvIGNoYW5nZSBpbiBh
IGRlZmNvbmZpZyB3aGVuIAo+IHlvdSBzd2l0Y2gKPiB0byBhIGRpZmZlcmVudCAoYnV0IHNpbWls
YXIpIGJvYXJkLiBJJ20gZ29pbmcgdG8gbGlzdCB0aGVtIGJlbG93IHdpdGggCj4gdGhlIHN5bWJv
bAo+IG5hbWVzLCBub3QgaG93IHRoZXkgYXBwZWFyIGluIHRoZSBtZW51LiBZb3UgY2FuIGFsd2F5
cyBzZWFyY2ggZm9yIAo+IHRob3NlIHN5bWJvbHMKPiBpbiBgbWFrZSBtZW51Y29uZmlnYCBieSB0
eXBpbmcgLwo+Cj4gQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVEFSQkFM
TF9MT0NBVElPTj0iJChjYWxsCj4gZ2l0aHViLG54cC1pbXgsaW14LWF0ZixsZi02LjYuMjMtMi4w
LjApL2lteC1hdGYtbGYtNi42LjIzLTIuMC4wLnRhci5neiIKPgo+IFlvdSBzaG91bGQgY2hlY2sg
VmFyaXNjaXRlJ3MgeW9jdG8gbGF5ZXIgdG8gc2VlIGlmIHRoZXkgdXNlIHRoZSBOWFAgCj4gVEYt
QSBvciBpZgo+IHRoZXkgZm9yayBpdCBldmVuIG1vcmUuIFRoZXkgbWF5IGFsc28gdXNlIGEgZGlm
ZmVyZW50IHZlcnNpb24uCj4KPgo+IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExB
VEZPUk09ImlteDhtbSIKPgo+IEkgZXhwZWN0IHRoYXQgdGhpcyB3aWxsIGJlIE9LIGZvciB0aGUg
VmFyaXNjaXRlIGJvYXJkIGFzIHdlbGwsIGJ1dCBpdCBpcwo+IHBvc3NpYmxlIHRoYXQgdGhleSBo
YXZlIGRlZmluZWQgdGhlaXIgb3duIHBsYXRmb3JtLgo+Cj4KPgo+IEJSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbAo+IGdpdGh1YixueHAtaW14LHVib290LWlt
eCxsZi02LjYuMjMtMi4wLjApL3Vib290LWlteC1sZi02LjYuMjMtMi4wLjAudGFyLmd6IiAKPgo+
Cj4gWW91IHNob3VsZCBjaGVjayBWYXJpc2NpdGUncyB5b2N0byBsYXllciB0byBzZWUgaWYgdGhl
eSB1c2UgdGhlIE5YUCAKPiBVLUJvb3Qgb3IgaWYKPiB0aGV5IGZvcmsgaXQgZXZlbiBtb3JlLiBU
aGV5IG1heSBhbHNvIHVzZSBhIGRpZmZlcmVudCB2ZXJzaW9uLgo+Cj4KPiBCUjJfVEFSR0VUX1VC
T09UX0JPQVJEX0RFRkNPTkZJRz0iaW14OG1tX2V2ayIKPgo+IFRoaXMgbmVlZHMgdG8gY2hhbmdl
IHRvIHRoZSBVLUJvb3QgZGVmY29uZmlnLiBUaGF0IGRlZmNvbmZpZyBjb3VsZCBiZSAKPiBpbiBO
WFAncwo+IFUtQm9vdCBmb3JrIGFscmVhZHksIG9yIGl0IGNvdWxkIGJlIGluIFZhcmlzY2l0ZSdz
IGZvcmssIG9yIFZhcmlzY2l0ZSAKPiBtYXkgc3VwcGx5Cj4gaXQgaW4gdGhlaXIgdS1ib290IHlv
Y3RvIHJlY2lwZS4KPgo+Cj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElP
Tj0iJChjYWxsCj4gZ2l0aHViLG54cC1pbXgsbGludXgtaW14LGxmLTYuNi4yMy0yLjAuMCkvbGlu
dXgtaW14LWxmLTYuNi4yMy0yLjAuMC50YXIuZ3oiIAo+Cj4gQlIyX0xJTlVYX0tFUk5FTF9ERUZD
T05GSUc9ImlteF92OCIKPiBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iZnJlZXNj
YWxlL2lteDhtbS1ldmsKPiBmcmVlc2NhbGUvaW14OG1tLWV2ay1yZXZiLXFjYS13aWZpIgo+Cj4g
WW91IHByb2JhYmx5IHN0YXJ0IHRvIGtub3cgdGhlIGRyaWxsLCByaWdodD8gVGhlIGRlZmNvbmZp
ZyBpcyBwcm9iYWJseSAKPiBPSywKPiBhbHRob3VnaCBpdCdzIHBvc3NpYmxlIHRoYXQgVmFyaXNj
aXRlIGFwcGVuZHMgYSBmcmFnbWVudCB0byBpdCBpbiB0aGVpcgo+IGJiYXBwZW5kLiBUaGUgRFRT
IG5hbWUgaXMgbW9zdCBkZWZpbml0ZWx5IG5vdCBPSywgYnV0IGl0IG1pZ2h0IGNvbWUgZnJvbQo+
IFZhcmlzY2l0ZSdzIG1ldGFsYXllciBpbnN0ZWFkIG9mIE5YUCdzIGtlcm5lbC4gVGhlIGtlcm5l
bCBpcyB1bmxpa2VseSAKPiB0byBiZQo+IGZvcmtlZCBieSBWYXJpc2NpdGUgc28gdGhhdCBvbmUg
aXMgcHJvYmFibHkgT0ssIGJ1dCBpdCBtYXkgYmUgYSAKPiBkaWZmZXJlbnQgdmVyc2lvbi4KPgo+
Cj4+IEkgdHJpZWQgY2hhbmdpbmcgdGhlIGluaXQgc3lzdGVtIGZyb20gYnVzeWJveCB0byBzeXN0
ZW1kLiBTdGlsbCBub3RoaW5nLgo+Cj4gwqBObywgYnVzeWJveCBpbml0IHNob3VsZCB3b3JrIGZp
bmUuCj4KPgo+PiBJIGZlZWwgbGlrZSBJIGFtIHBva2luZyBhcm91bmQgaW4gdGhlIGRhcmsuIEFu
eSB0aG91Z2h0cyBvbiB3aGF0IEkKPj4gc2hvdWxkIHRyeSBuZXh0Pwo+Cj4gwqBJZiB5b3UgZG8g
bWFuYWdlIHRvIGFkdmFuY2Ugd2l0aCB0aGlzLCB0aGVyZSBhcmUgdHdvIGNvbnRyaWJ1dGlvbnMg
Cj4geW91IGNvdWxkIG1ha2U6Cj4gLSBZb3UgY2FuIGFkZCBhIGRlZmNvbmZpZyBmb3IgdGhlIFZh
cmlzY2l0ZSBib2FyZC4KPiAtIFlvdSBjb3VsZCB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gd2l0
aCBhICJob3cgdG8gYWRkIHN1cHBvcnQgZm9yIGEgCj4gbmV3IGJvYXJkIgo+IHNlY3Rpb24gdGhh
dCBleHBsYWlucyB3aGF0IEkgd3JvdGUgYWJvdmUgaW4gYSBiZXR0ZXIgKG1vcmUgZ2VuZXJpYykg
d2F5Lgo+Cj4KPiDCoFJlZ2FyZHMsCj4gwqBBcm5vdXQKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
