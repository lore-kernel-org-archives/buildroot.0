Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1E1C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D8EA41932;
	Thu,  6 Jun 2024 19:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5Tsx8HbWE1S; Thu,  6 Jun 2024 19:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9679541949
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9679541949;
	Thu,  6 Jun 2024 19:41:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 075081BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6650B848B6
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTFf5tEy9qx6 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB2EA849BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB2EA849BB
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB2EA849BB
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42159283989so16641205e9.3
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702851; x=1718307651;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrU4MR84fPvl3UdqyOdWluKOh/y5Mg07sI3/Cv+G2Bw=;
 b=gUpmKEMmqtUlhUcSTo/Pf+YjL9W+G4gEPW2BUwevpK4GJSIJLFk5GvKomrm5S9zBgs
 CGGk5AcfPcxUuGJWan+UAhmADaFylYQa2iRdorczEpEoeHBxIYcjbkPar9JH1CGGq6KW
 Z0sNNU/lpqq+WF2juiHiVIhxx0/ez+xzf+S3CkVRQU5vgL8J0UWK5B1OuvZ0zXqcnpMv
 loVb0IFQsDkrBVKl8cszecu9MfU1HS8GroKxmEod10EMC114xBeq6bmnEa5+B0yG1i/v
 iHV2Hkv34IpIL8NBH/b++yMVowmobXHqbYRYcamAW1XmMjUJGkpRsfY7TUBBaxAuw99b
 mgfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdvGPxGzEHA+9tM7ppjwCgS0K/llmmNLYqrLmVVMt8rcs8Mp1qzXjiYFmu7gAnB+NTXx2EP7JoOvd+yXq2hHpodYbHgVulMA==
X-Gm-Message-State: AOJu0YxwCUg/R/t8k+PkweLL0WzA4ihss6rSlL/X8GiU8LIiIw5xnCxJ
 mzLZ9bHek9SOP+w6To4w0ewAvvfQrfhCrK4xU1dkEKvy2ccQhB/8nQMKqLlXLJU=
X-Google-Smtp-Source: AGHT+IHNeP9ihm+eZ2DjElXfkHne+twVikvI7LRkziJGSbeT7yY8y30Nxg80vlMvNr8xh3U28GMKzA==
X-Received: by 2002:a05:600c:4750:b0:421:f39:d45f with SMTP id
 5b1f17b1804b1-421649ec30amr7363945e9.4.1717702850598; 
 Thu, 06 Jun 2024 12:40:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6130sm31051965e9.26.2024.06.06.12.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:50 -0700 (PDT)
Message-ID: <9f6f521e-3853-4d3c-bc2a-b882a52a5b12@mind.be>
Date: Thu, 6 Jun 2024 21:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240515162627.1087686-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240515162627.1087686-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702851; x=1718307651; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wrU4MR84fPvl3UdqyOdWluKOh/y5Mg07sI3/Cv+G2Bw=;
 b=QfVeYH86UETK5mun5Mg9QDs/z167xHWzeESeWbkl2sQTNRM65qoiAeepHr82OczzTG
 jClCXRnH9dyxMr1c6W11Kba7fmPbdZJur0a2efICsbltx5ruDHdc38cPm8SNSsAGC/4s
 fkxkJ8seF6baOtHUDv4S9LckGt0BpHqCHyBfB8JaGkgdeY3hqB50YkZhBS1eXLJbavJa
 hT3h3VWoaTMXe2dtkdUrM4YtzMh6QpbEhlP5LdPmrtIm7YWf3wqe9jKYkTurDmlRd2g9
 QWTpvWUrSy7oi5TQ0mMrYYLOCbrRQBKAF5KRDl2FPq3HKgKwWajOvww24hFeRG3w5FSr
 MNDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QfVeYH86
Subject: Re: [Buildroot] [PATCH 1/1] package/p11-kit: fix build with gcc 14
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNS8yMDI0IDE4OjI2LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBnY2MgMTQ6Cj4gCj4gcDExLWtpdC9pbXBvcnQt
b2JqZWN0LmM6IEluIGZ1bmN0aW9uICdhZGRfYXR0cnNfcHVia2V5X3JzYSc6Cj4gcDExLWtpdC9p
bXBvcnQtb2JqZWN0LmM6MjIzOjYyOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAzIG9mICdwMTFf
YXNuMV9yZWFkJyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxl
LXBvaW50ZXItdHlwZXNdCj4gICAgMjIzIHwgICAgICAgICBhdHRyX21vZHVsdXMucFZhbHVlID0g
cDExX2FzbjFfcmVhZCAoYXNuLCAibW9kdWx1cyIsICZhdHRyX21vZHVsdXMudWxWYWx1ZUxlbik7
Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxvbmcgdW5zaWduZWQgaW50ICoKPiAKPiBGaXhlczoKPiAgIC0gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDE1MDhhMDU3NTY4YWQ3MTVlOWUw
MGE2N2FkZmMzODY3NDQ1ZDZjMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIC4uLnRlZ2VyLXRydW5jYXRpb24tb24t
MzItYml0LXBsYXRmb3Jtcy5wYXRjaCB8IDEwOSArKysrKysrKysrKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcDExLWtpdC8wMDAxLWltcG9ydC1vYmplY3QtQXZvaWQtaW50ZWdlci10cnVuY2F0aW9uLW9u
LTMyLWJpdC1wbGF0Zm9ybXMucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wMTEta2l0
LzAwMDEtaW1wb3J0LW9iamVjdC1Bdm9pZC1pbnRlZ2VyLXRydW5jYXRpb24tb24tMzItYml0LXBs
YXRmb3Jtcy5wYXRjaCBiL3BhY2thZ2UvcDExLWtpdC8wMDAxLWltcG9ydC1vYmplY3QtQXZvaWQt
aW50ZWdlci10cnVuY2F0aW9uLW9uLTMyLWJpdC1wbGF0Zm9ybXMucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjAzZjU0YjQ0MDgKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9wMTEta2l0LzAwMDEtaW1wb3J0LW9iamVjdC1Bdm9pZC1pbnRlZ2Vy
LXRydW5jYXRpb24tb24tMzItYml0LXBsYXRmb3Jtcy5wYXRjaAo+IEBAIC0wLDAgKzEsMTA5IEBA
Cj4gK0Zyb20gZDQ5YzkyYzg0MjBkYjZlZTRjODg1MTViZGIwMTRmNjhmNGQ0NzFkOSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRGFpa2kgVWVubyA8dWVub0BnbnUub3JnPgo+ICtE
YXRlOiBTYXQsIDIgRGVjIDIwMjMgMDk6MjQ6MDEgKzA5MDAKPiArU3ViamVjdDogW1BBVENIXSBp
bXBvcnQtb2JqZWN0OiBBdm9pZCBpbnRlZ2VyIHRydW5jYXRpb24gb24gMzItYml0IHBsYXRmb3Jt
cwo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArVGhlIGJ1
aWxkIGZhaWxzIHdoZW4gY29tcGlsaW5nIGZvciAzMi1iaXQgcGxhdGZvcm1zIHdpdGgKPiArLVdl
cnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlczoKPiArCj4gKyAgQ0ZMQUdTPSItbTMyIC1t
YXJjaD1pNjg2IC1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMgLVdlcnJvcj1pbXBs
aWNpdCAtV2Vycm9yPWludC1jb252ZXJzaW9uIiBzZXRhcmNoIGk2ODYgLS0gbWVzb24gc2V0dXAg
X2J1aWxkCj4gKyAgc2V0YXJjaCBpNjg2IC0tIG1lc29uIGNvbXBpbGUgLUMgX2J1aWxkIC12Cj4g
KyAgLi4uCj4gKwo+ICsgIC4uL3AxMS1raXQvaW1wb3J0LW9iamVjdC5jOiBJbiBmdW5jdGlvbiDi
gJhhZGRfYXR0cnNfcHVia2V5X3JzYeKAmToKPiArICAuLi9wMTEta2l0L2ltcG9ydC1vYmplY3Qu
YzoyMjM6NjI6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2Yg4oCYcDExX2FzbjFfcmVhZOKA
mSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBv
aW50ZXItdHlwZXNdCj4gKyAgICAyMjMgfCAgICAgICAgIGF0dHJfbW9kdWx1cy5wVmFsdWUgPSBw
MTFfYXNuMV9yZWFkIChhc24sICJtb2R1bHVzIiwgJmF0dHJfbW9kdWx1cy51bFZhbHVlTGVuKTsK
PiArICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiArICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8Cj4gKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbG9uZyB1bnNpZ25lZCBpbnQgKgo+ICsKPiArUmVwb3J0ZWQg
YnkgU2FtIEphbWVzIGluOgo+ICtodHRwczovL2dpdGh1Yi5jb20vcDExLWdsdWUvcDExLWtpdC9p
c3N1ZXMvNjA4Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBEYWlraSBVZW5vIDx1ZW5vQGdudS5vcmc+
Cj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3AxMS1nbHVlL3AxMS1raXQvY29t
bWl0L2Q0OWM5MmM4NDIwZGI2ZWU0Yzg4NTE1YmRiMDE0ZjY4ZjRkNDcxZDkKPiArU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gKy0t
LQo+ICsgcDExLWtpdC9pbXBvcnQtb2JqZWN0LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3AxMS1raXQvaW1wb3J0LW9iamVjdC5jIGIvcDExLWtp
dC9pbXBvcnQtb2JqZWN0LmMKPiAraW5kZXggZmVlZTA3NjUuLmZiNDdiOTY0IDEwMDY0NAo+ICst
LS0gYS9wMTEta2l0L2ltcG9ydC1vYmplY3QuYwo+ICsrKysgYi9wMTEta2l0L2ltcG9ydC1vYmpl
Y3QuYwo+ICtAQCAtNTUsNiArNTUsNyBAQAo+ICsgI2VuZGlmCj4gKwo+ICsgI2luY2x1ZGUgPGFz
c2VydC5oPgo+ICsrI2luY2x1ZGUgPGxpbWl0cy5oPgo+ICsgI2luY2x1ZGUgPHN0ZGJvb2wuaD4K
PiArICNpbmNsdWRlIDxzdGRsaWIuaD4KPiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPiArQEAgLTIw
MSw2ICsyMDIsNyBAQCBhZGRfYXR0cnNfcHVia2V5X3JzYSAoQ0tfQVRUUklCVVRFICphdHRycywK
PiArIAlDS19BVFRSSUJVVEUgYXR0cl9lbmNyeXB0ID0geyBDS0FfRU5DUllQVCwgJnR2YWwsIHNp
emVvZiAodHZhbCkgfTsKPiArIAlDS19BVFRSSUJVVEUgYXR0cl9tb2R1bHVzID0geyBDS0FfTU9E
VUxVUywgfTsKPiArIAlDS19BVFRSSUJVVEUgYXR0cl9leHBvbmVudCA9IHsgQ0tBX1BVQkxJQ19F
WFBPTkVOVCwgfTsKPiArKwlzaXplX3QgbGVuID0gMDsKPiArCj4gKyAJcHVia2V5ID0gcDExX2Fz
bjFfcmVhZCAoaW5mbywgInN1YmplY3RQdWJsaWNLZXkiLCAmcHVia2V5X2xlbik7Cj4gKyAJaWYg
KHB1YmtleSA9PSBOVUxMKSB7Cj4gK0BAIC0yMjAsMTcgKzIyMiwzMSBAQCBhZGRfYXR0cnNfcHVi
a2V5X3JzYSAoQ0tfQVRUUklCVVRFICphdHRycywKPiArIAkJZ290byBjbGVhbnVwOwo+ICsgCX0K
PiArCj4gKy0JYXR0cl9tb2R1bHVzLnBWYWx1ZSA9IHAxMV9hc24xX3JlYWQgKGFzbiwgIm1vZHVs
dXMiLCAmYXR0cl9tb2R1bHVzLnVsVmFsdWVMZW4pOwo+ICsrCWF0dHJfbW9kdWx1cy5wVmFsdWUg
PSBwMTFfYXNuMV9yZWFkIChhc24sICJtb2R1bHVzIiwgJmxlbik7Cj4gKyAJaWYgKGF0dHJfbW9k
dWx1cy5wVmFsdWUgPT0gTlVMTCkgewo+ICsgCQlwMTFfbWVzc2FnZSAoXygiZmFpbGVkIHRvIG9i
dGFpbiBtb2R1bHVzIikpOwo+ICsgCQlnb3RvIGNsZWFudXA7Cj4gKyAJfQo+ICsrI2lmIFVMT05H
X01BWCA8IFNJWkVfTUFYCj4gKysJaWYgKGxlbiA+IFVMT05HX01BWCkgewo+ICsrCQlwMTFfbWVz
c2FnZSAoXygiZmFpbGVkIHRvIG9idGFpbiBtb2R1bHVzIikpOwo+ICsrCQlnb3RvIGNsZWFudXA7
Cj4gKysJfQo+ICsrI2VuZGlmCj4gKysJYXR0cl9tb2R1bHVzLnVsVmFsdWVMZW4gPSBsZW47Cj4g
Kwo+ICstCWF0dHJfZXhwb25lbnQucFZhbHVlID0gcDExX2FzbjFfcmVhZCAoYXNuLCAicHVibGlj
RXhwb25lbnQiLCAmYXR0cl9leHBvbmVudC51bFZhbHVlTGVuKTsKPiArKwlhdHRyX2V4cG9uZW50
LnBWYWx1ZSA9IHAxMV9hc24xX3JlYWQgKGFzbiwgInB1YmxpY0V4cG9uZW50IiwgJmxlbik7Cj4g
KyAJaWYgKGF0dHJfZXhwb25lbnQucFZhbHVlID09IE5VTEwpIHsKPiArIAkJcDExX21lc3NhZ2Ug
KF8oImZhaWxlZCB0byBvYnRhaW4gZXhwb25lbnQiKSk7Cj4gKyAJCWdvdG8gY2xlYW51cDsKPiAr
IAl9Cj4gKysjaWYgVUxPTkdfTUFYIDwgU0laRV9NQVgKPiArKwlpZiAobGVuID4gVUxPTkdfTUFY
KSB7Cj4gKysJCXAxMV9tZXNzYWdlIChfKCJmYWlsZWQgdG8gb2J0YWluIGV4cG9uZW50IikpOwo+
ICsrCQlnb3RvIGNsZWFudXA7Cj4gKysJfQo+ICsrI2VuZGlmCj4gKysJYXR0cl9leHBvbmVudC51
bFZhbHVlTGVuID0gbGVuOwo+ICsKPiArIAlyZXN1bHQgPSBwMTFfYXR0cnNfYnVpbGQgKGF0dHJz
LCAmYXR0cl9rZXlfdHlwZSwgJmF0dHJfZW5jcnlwdCwgJmF0dHJfbW9kdWx1cywgJmF0dHJfZXhw
b25lbnQsIE5VTEwpOwo+ICsgCWlmIChyZXN1bHQgPT0gTlVMTCkgewo+ICtAQCAtMjYwLDEyICsy
NzYsMjAgQEAgYWRkX2F0dHJzX3B1YmtleV9lYyAoQ0tfQVRUUklCVVRFICphdHRycywKPiArIAlD
S19BVFRSSUJVVEUgYXR0cl9rZXlfdHlwZSA9IHsgQ0tBX0tFWV9UWVBFLCAma2V5X3R5cGUsIHNp
emVvZiAoa2V5X3R5cGUpIH07Cj4gKyAJQ0tfQVRUUklCVVRFIGF0dHJfZWNfcGFyYW1zID0geyBD
S0FfRUNfUEFSQU1TLCB9Owo+ICsgCUNLX0FUVFJJQlVURSBhdHRyX2VjX3BvaW50ID0geyBDS0Ff
RUNfUE9JTlQsIH07Cj4gKysJc2l6ZV90IGxlbiA9IDA7Cj4gKwo+ICstCWF0dHJfZWNfcGFyYW1z
LnBWYWx1ZSA9IHAxMV9hc24xX3JlYWQgKGluZm8sICJhbGdvcml0aG0ucGFyYW1ldGVycyIsICZh
dHRyX2VjX3BhcmFtcy51bFZhbHVlTGVuKTsKPiArKwlhdHRyX2VjX3BhcmFtcy5wVmFsdWUgPSBw
MTFfYXNuMV9yZWFkIChpbmZvLCAiYWxnb3JpdGhtLnBhcmFtZXRlcnMiLCAmbGVuKTsKPiArIAlp
ZiAoYXR0cl9lY19wYXJhbXMucFZhbHVlID09IE5VTEwpIHsKPiArIAkJcDExX21lc3NhZ2UgKF8o
ImZhaWxlZCB0byBvYnRhaW4gRUMgcGFyYW1ldGVycyIpKTsKPiArIAkJZ290byBjbGVhbnVwOwo+
ICsgCX0KPiArKyNpZiBVTE9OR19NQVggPCBTSVpFX01BWAo+ICsrCWlmIChsZW4gPiBVTE9OR19N
QVgpIHsKPiArKwkJcDExX21lc3NhZ2UgKF8oImZhaWxlZCB0byBvYnRhaW4gRUMgcGFyYW1ldGVy
cyIpKTsKPiArKwkJZ290byBjbGVhbnVwOwo+ICsrCX0KPiArKyNlbmRpZgo+ICsrCWF0dHJfZWNf
cGFyYW1zLnVsVmFsdWVMZW4gPSBsZW47Cj4gKwo+ICsgCS8qIHN1YmplY3RQdWJsaWNLZXkgaXMg
cmVhZCBhcyBCSVQgU1RSSU5HIHZhbHVlIHdoaWNoIGNvbnRhaW5zCj4gKyAJICogRUMgcG9pbnQg
ZGF0YS4gV2UgbmVlZCB0byBERVIgZW5jb2RlIHRoaXMgZGF0YSBhcyBPQ1RFVCBTVFJJTkcuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
