Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480FBC433FE
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DB4611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86DB4611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2A440025;
	Tue,  5 Oct 2021 19:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l38TBjK3LeAa; Tue,  5 Oct 2021 19:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74404408B8;
	Tue,  5 Oct 2021 19:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C01621BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCE7260676
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeGKtK7XugFh for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:33:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82F456063E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:33:25 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v18so732682edc.11
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=F4ruN16oVAznLMpjuaTziVflF3NM1okYhSIE8KFroZs=;
 b=ESfF+gaN87dJHbGg0X/YQTJyfLbFVcDdfz4NwfrVSywi1m0umpIeParc40rLo9eon+
 v1Zi2zBnnLbfNsx2V6yVvmAiYN7i2yYgr61Qnnwy0xHMp3QYrDlSBrvuCxtVlGY8nx84
 2tQ9RlFlK/lfuYbqC+6+vyRpTPbv/M2zKzan8c28uH2q4NfDfd0FjTsE+pm+RRQmPUaE
 r/L1o19ormSRrGWoNe7PeCTAb43U4/N4kz+s9KnFg7VpWf5GAhjInULlQsQFwZV5ch6k
 r2PmZXqqKEU6S72ZlQWETeaJscbjlJmiNB9Xhgwh493vTRG/rNKNBif6D/h+yglZKUDp
 6YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F4ruN16oVAznLMpjuaTziVflF3NM1okYhSIE8KFroZs=;
 b=PooNSpmUm/363EtQogBMmQJooGG2CTnZfU0Wcl1cV0lno8tJFcdUS3dKxxKgLXLrY1
 HmYhRMN8JUKdBXakwtRtU08bVzPLI3JoeHjWPqJ/kUevHNbnqCCFCGzh3sDMJ4jpBTkF
 iNC20E3QDZmNE9/dI4BDUYknwHVoaEdAZLK+OR/iFjYyAG5xxdgLQzs9HQW4pOxWWa0W
 FwNusllUESpeuGSDthSJdiuf0wPFe2Pz6kd/J9beMyNaVSoFs2eTYtEEttEwbnL/Aycb
 CTXuIGyp9m9bELcinmJibrBsjNDT4JJidHeeNqzDbMnPBXu8I3QaQ3YVUDKaBpgTJxs2
 UlRw==
X-Gm-Message-State: AOAM532pqJx9AwuCHEX5voG3RFKnHS1ZG8qTr32jUQF7rBLjXuZM5foG
 51HZDKBmKGtgoGmcxMwIgk/+eQ==
X-Google-Smtp-Source: ABdhPJwhXNanMmd/tC3zusm1ExWInv/TR/+sVVcqDB1WOLA+Z/+9y45mOxb6H+ckUJlzEGQeRtDvgw==
X-Received: by 2002:a50:e041:: with SMTP id g1mr29024941edl.4.1633462403533;
 Tue, 05 Oct 2021 12:33:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v10sm9007006edt.24.2021.10.05.12.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:33:23 -0700 (PDT)
Message-ID: <8125324e-5f77-0ad9-d182-ec1dc838a010@mind.be>
Date: Tue, 5 Oct 2021 21:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20210907120933.31647-1-raphael.melotte@mind.be>
 <20210927110354.1193430-1-raphael.melotte@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927110354.1193430-1-raphael.melotte@mind.be>
Subject: Re: [Buildroot] [PATCH v3] package/mupdf: fix building with mips
 toolchains
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

CgpPbiAyNy8wOS8yMDIxIDEzOjAzLCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBXaXRoIHNv
bWUgdG9vbGNoYWlucyAoZS5nLiBtaXBzNjRlbCksIHBhcnRpYWwgbGlua2luZyBmYWlscyBpbiB0
aGUKPiBmb2xsb3dpbmcgd2F5Ogo+IC90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29wdC9l
eHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11Y2xp
YmMvOC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4v
bGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVwZGYuYShEaW5nYmF0cy5jZmYubyk6IEFCSSBpcyBpbmNv
bXBhdGlibGUgd2l0aCB0aGF0IG9mIHRoZSBzZWxlY3RlZCBlbXVsYXRpb24KPiAvdG1wL2luc3Rh
bmNlLTEvb3V0cHV0LTEvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9taXBz
NjRlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjLzguNC4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1
aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOiBmYWlsZWQgdG8gbWVyZ2UgdGFyZ2V0IHNwZWNp
ZmljIGRhdGEgb2YgZmlsZSBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEoRGluZ2JhdHMuY2ZmLm8p
Cj4gCj4gVGFraW5nIGluc3BpcmF0aW9uIGZyb20gY29tbWl0Cj4gOWVjYTRiOWY4NGZlMjUzNWQ4
Y2FlZTZlZWIwNjJjZTMzNzMzYmRmMSwgZml4IGl0IGJ5IHVzaW5nIEdDQyBpbnN0ZWFkCj4gb2Yg
TEQgZm9yIHBhcnRpYWwgbGlua2luZy4KPiAKPiBOb3RlIHRoYXQgb24gbWlwcyB0aGUgYnVpbGQg
d2lsbCBub3cgcHJvZHVjZSB3YXJuaW5ncyBzaW1pbGFyIHRvIHRoaXMKPiBvbmU6Cj4gYnVpbGRy
b290L291dHB1dC9ob3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS8xMC4z
LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IGJ1aWxk
L3JlbGVhc2UvbGlibXVwZGYuYShOb3RvU2Fuc1RhaVRoYW0tUmVndWxhci50dGYubyk6IHdhcm5p
bmc6IGxpbmtpbmcgYWJpY2FsbHMgZmlsZXMgd2l0aCBub24tYWJpY2FsbHMgZmlsZXMKPiAKPiBE
dXJpbmcgYSBydW50aW1lIHRlc3Qgb24gbWlwczY0ZWwgdW5kZXIgcWVtdSwgbXVwZGYteDExIHdh
cwo+IG5vbmV0aGVsZXNzIGFibGUgdG8gZGlzcGxheSBhIHNhbXBsZSBQREYgZmlsZSBjb3JyZWN0
bHkuCj4gCj4gRml4ZXM6Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy8xNTZmZTllZTVmNmRjY2RjOTg5OTBmNmM1ZGU1NTYyMzgzYmMyYjc0Lwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCiAgQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCltzbmlwXQoKPiArCj4gK1NpZ25lZC1vZmYtYnk6IFJh
cGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiArW1Vwc3RyZWFtIHN0
YXR1czogaHR0cHM6Ly9idWdzLmdob3N0c2NyaXB0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9NzA0NDQy
XQoKICBVcHN0cmVhbSBjb21tZW50ZWQgdGhhdCB5b3UgY291bGQgYWxzbyBidWlsZCB3aXRoIEhB
VkVfT0JKQ09QWT1ubywgYnV0IEkgbGlrZSAKdGhpcyBzb2x1dGlvbiBiZXR0ZXIuCgo+ICstLS0K
PiArIE1ha2VmaWxlIHwgMiArLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+ICtp
bmRleCBiMGZiNjE3ZTIuLjBhODc5NWUwZSAxMDA2NDQKPiArLS0tIGEvTWFrZWZpbGUKPiArKysr
IGIvTWFrZWZpbGUKPiArQEAgLTY0LDcgKzY0LDcgQEAgZW5kaWYKPiArIExJTktfQ01EID0gJChR
VUlFVF9MSU5LKSAkKE1LVEdURElSKSA7ICQoQ0MpICQoTERGTEFHUykgLW8gJEAgJF4gJChMSUJT
KQo+ICsgVEFHU19DTUQgPSAkKFFVSUVUX1RBR1MpIGN0YWdzIC1SIC0tYy1raW5kcz0rcAo+ICsg
V0lORFJFU19DTUQgPSAkKFFVSUVUX1dJTkRSRVMpICQoTUtUR1RESVIpIDsgJChXSU5EUkVTKSAk
PCAkQAo+ICstT0JKQ09QWV9DTUQgPSAkKFFVSUVUX09CSkNPUFkpICQoTUtUR1RESVIpIDsgJChM
RCkgLXIgLWIgYmluYXJ5IC16IG5vZXhlY3N0YWNrIC1vICRAICQ8Cj4gKytPQkpDT1BZX0NNRCA9
ICQoUVVJRVRfT0JKQ09QWSkgJChNS1RHVERJUikgOyAkKENDKSAtV2wsLXIgLVdsLC1iIC1XbCxi
aW5hcnkgLVdsLC16IC1XbCxub2V4ZWNzdGFjayAtbm9zdGRsaWIgLW8gJEAgJDwKCiAgTm90ZSB0
aGF0IC1XbCBhbGxvd3MgeW91IHRvIHNlcGFyYXRlIG9wdGlvbnMgd2l0aCBjb21tYXMsIGkuZS46
CgokKENDKSAtV2wsLXIsLWIsYmluYXJ5LC16LG5vZXhlY3N0YWNrIC1ub3N0ZGxpYiAtbyAkQCAk
PAoKICBIb3dldmVyLCBJIGRpZG4ndCBmZWVsIGxpa2UgZG9pbmcgYSBidWlsZCB0byB0ZXN0LCBz
byBJIGxlZnQgaXQgYXMgaXMuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiArCj4gKyAjIC0tLSBS
dWxlcyAtLS0KPiArCj4gKy0tCj4gKzIuMzMuMAo+ICsKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
