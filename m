Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4988C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:40:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9CD6108D
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C9CD6108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE62D400EE;
	Wed, 25 Aug 2021 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ot3MdTHBeUwE; Wed, 25 Aug 2021 20:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 603AA40117;
	Wed, 25 Aug 2021 20:40:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFC81BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F3FD8109C
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90YIWpJz4cGz for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:40:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 196958106A
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:40:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id x11so1241206ejv.0
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hmnpIX0SjIwTobF9TZqMcumxjhDQL+gqqusbuexDaAY=;
 b=cBmiWNRz4p45jgYB9iOejuAQsJVChE01hczIQAWgetb7Sh8tk8V5nDs+WkTyXDaswX
 GfSJrDzE8MBNAoLNVb22dJwHpyhok+4D8akxLShaQiXQHXOHiaYT0/EToH0swumdPWeh
 eeiNCCAwW/uiNAAnNA3fIMFhIZwxtrrOV9JDSNmOxiKA3b7H2eMAA9KvwnMMYd4keztB
 n/kpduvyB3t1BUPu0g9GBdHhNTsg8N0zLN5qui7vC1GobpHzGYxzJ+NatOjT+X8a87Gz
 KsY88krYau2rhmCr1MkOCggT1x24Aau9d66XEKa943yoI92azGimPC2S+5DL0PEP2SW0
 etMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hmnpIX0SjIwTobF9TZqMcumxjhDQL+gqqusbuexDaAY=;
 b=NnNXac+5Ywittx6zMRyDgMEB58eZ6nZLezRWKyA2WpVA5dvS4/tcBMOi4hwi46E8IT
 7cLKNZvLiEOpIiYgquBMI4p3BV+Ujbo5A0D7FgX0sye82whKGcmtrLDk9/0Kjma/wyYn
 4b0EgMq+iI4KpaP4TmSSYIsjJXvPzWy72VLqbsiCQVjOPXPZfECFw/eUzF2x2accPWrD
 vDu80CybQqx5Uk2z5h+3sNQs3bWGl+F8qiFMY3krEIulYMYpphxU2Wu5kesyZUOh5gXZ
 ZiL/YKBQ+OgUffidoQj5GZoczstKc6GvNY8u4C+qOdhzmTnDAbKrxpI4IiihY5IPVmj7
 jA/g==
X-Gm-Message-State: AOAM5306R1UdGFDER8YELBHMPnR3V6EWdpbcQ4q6WBdkjWOlORheEpd+
 pyF3w8YuNwr68JyO9B/tFliHzQnWKjVqjw==
X-Google-Smtp-Source: ABdhPJzkMRRlLe3GuMUu9VN4bQHZVTpEvXfpIE93LEFXStxHft3ODA299PTokQhqf4UzMqiwcTCBJA==
X-Received: by 2002:a17:907:9853:: with SMTP id
 jj19mr512557ejc.69.1629924038969; 
 Wed, 25 Aug 2021 13:40:38 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n2sm569465edi.32.2021.08.25.13.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:40:17 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210822085740.1770451-1-fontaine.fabrice@gmail.com>
 <d726dd48-a452-e75b-b7f8-6fe4ec6eab26@mind.be>
 <CAPi7W806-W1S3e9vBZxGGo8a7JTjWpPFqLrDVn2eCC4pEofbRw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fc5d4277-af5e-e037-ab82-1593c3c685ba@mind.be>
Date: Wed, 25 Aug 2021 22:40:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPi7W806-W1S3e9vBZxGGo8a7JTjWpPFqLrDVn2eCC4pEofbRw@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/ushare: fix build without msgfmt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyNS8wOC8yMDIxIDIxOjQzLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IExlIG1lci4g
MjUgYW/Du3QgMjAyMSDDoCAyMTozMywgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5k
LmJlPiBhIMOpY3JpdCA6Cj4+Cj4+Cj4+Cj4+IE9uIDIyLzA4LzIwMjEgMTA6NTcsIEZhYnJpY2Ug
Rm9udGFpbmUgd3JvdGU6Cj4+PiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGhv
dXQgL3Vzci9iaW4vbXNnZm10IHJhaXNlZCBzaW5jZSB0aGUKPj4+IGFkZGl0aW9uIG9mIHVzaGFy
ZSBpbiBjb21taXQgNzQwOTdmZDY1OTE1NDQ5OTYxMmYyMWZhYmVkYTRlM2U3YzhmZGJmYzoKPj4+
Cj4+PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9ob21lL2J1aWxkcm9vdC9hdXRvYnVp
bGQvcnVuL2luc3RhbmNlLTMvb3V0cHV0LTEvYnVpbGQvdXNoYXJlLTIuMS9wbycKPj4+IC91c3Iv
YmluL21zZ2ZtdCAtYyAtLXN0YXRpc3RpY3MgLW8gZnIuZ21vIGZyLnBvCj4+PiBtYWtlWzNdOiAv
dXNyL2Jpbi9tc2dmbXQ6IENvbW1hbmQgbm90IGZvdW5kCj4+Pgo+Pj4gVG8gZml4IHRoaXMgYnVp
bGQgZmFpbHVyZSwgc2V0IEdNU0dGTVQgdG8gJChIT1NUX0RJUikvYmluL21zZ2ZtdCBhbmQKPj4+
IGRvbid0IGJ1aWxkIHBvIGZpbGVzIGlmIE5MUyBpcyBkaXNhYmxlZAo+Pj4KPj4+IEZpeGVzOgo+
Pj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvOWY2YjViOGYzODM4
NjEzNWJhY2QyZDhmNmU5N2MxZmVhNzdiYmU2OQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgLi4u
LXQtYnVpbGQtcG8tZmlsZXMtaWYtTkxTLWlzLWRpc2FibGVkLnBhdGNoIHwgNDcgKysrKysrKysr
KysrKysrKysrKwo+Pj4gIHBhY2thZ2UvdXNoYXJlL3VzaGFyZS5tayAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICstCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdXNoYXJlLzAwMDEtRG9u
LXQtYnVpbGQtcG8tZmlsZXMtaWYtTkxTLWlzLWRpc2FibGVkLnBhdGNoCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvdXNoYXJlLzAwMDEtRG9uLXQtYnVpbGQtcG8tZmlsZXMtaWYtTkxTLWlz
LWRpc2FibGVkLnBhdGNoIGIvcGFja2FnZS91c2hhcmUvMDAwMS1Eb24tdC1idWlsZC1wby1maWxl
cy1pZi1OTFMtaXMtZGlzYWJsZWQucGF0Y2gKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBp
bmRleCAwMDAwMDAwMDAwLi5mMGZhODk5OThmCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9w
YWNrYWdlL3VzaGFyZS8wMDAxLURvbi10LWJ1aWxkLXBvLWZpbGVzLWlmLU5MUy1pcy1kaXNhYmxl
ZC5wYXRjaAo+Pj4gQEAgLTAsMCArMSw0NyBAQAo+Pj4gK0Zyb20gOTc3MTcxNzgxZjVkNDllNjFi
NDZjMDI0MWZiNjdjYmI3ZDY2NjQ5OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4+ICtGcm9t
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPj4+ICtEYXRl
OiBTdW4sIDIyIEF1ZyAyMDIxIDEwOjQ0OjQ4ICswMjAwCj4+PiArU3ViamVjdDogW1BBVENIXSBE
b24ndCBidWlsZCBwbyBmaWxlcyBpZiBOTFMgaXMgZGlzYWJsZWQKPj4+ICsKPj4+ICtTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPj4+
ICtbVXBzdHJlYW0gc3RhdHVzOiBodHRwczovL2dpdGh1Yi5jb20vZGR1Z292aWMvdVNoYXJlL3B1
bGwvMTJdCj4+PiArLS0tCj4+PiArIE1ha2VmaWxlICB8IDcgKysrKystLQo+Pj4gKyBjb25maWd1
cmUgfCAxICsKPj4+ICsgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+PiArCj4+PiArZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPj4+ICtp
bmRleCBlYmQ4ZjkxLi42Njg2Y2ZkIDEwMDY0NAo+Pj4gKy0tLSBhL01ha2VmaWxlCj4+PiArKysr
IGIvTWFrZWZpbGUKPj4+ICtAQCAtMTQsMTAgKzE0LDEzIEBAIEVYVFJBRElTVCA9IEFVVEhPUlMg
XAo+Pj4gKyAgICAgICAgIFRIQU5LUyBcCj4+PiArICAgICAgICAgVE9ETyBcCj4+PiArCj4+PiAr
LVNVQkRJUlMgPSBwbyBcCj4+PiArLSAgICAgIHNjcmlwdHMgXAo+Pj4gKytTVUJESVJTID0gc2Ny
aXB0cyBcCj4+PiArICAgICAgIHNyYyBcCj4+PiArCj4+PiArK2lmZXEgKCQoTkxTKSx5ZXMpCj4+
PiArK1NVQkRJUlMgKz0gcG8KPj4+ICsrZW5kaWYKPj4+ICsrCj4+PiArIGFsbDoKPj4+ICsgICAg
IGZvciBzdWJkaXIgaW4gJChTVUJESVJTKTsgZG8gXAo+Pj4gKyAgICAgICAkKE1BS0UpIC1DICQk
c3ViZGlyICRAOyBcCj4+PiArZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQo+Pj4g
K2luZGV4IDRhM2VmZTAuLjE2MmE3NzYgMTAwNzU1Cj4+PiArLS0tIGEvY29uZmlndXJlCj4+PiAr
KysrIGIvY29uZmlndXJlCj4+PiArQEAgLTcyMyw2ICs3MjMsNyBAQCBhcHBlbmRfY29uZmlnICJM
REZMQUdTPSRMREZMQUdTIgo+Pj4gKyBhcHBlbmRfY29uZmlnICJJTlNUQUxMPSRJTlNUQUxMIgo+
Pj4gKwo+Pj4gKyBhcHBlbmRfY29uZmlnICJERUJVRz0kZGVidWciCj4+PiArK2FwcGVuZF9jb25m
aWcgIk5MUz0kbmxzIgo+Pj4gKwo+Pj4gKwo+Pj4gKyBlY2hvbG9nICJDcmVhdGluZyAkQ09ORklH
X0ggLi4uIgo+Pj4gKy0tCj4+PiArMi4zMi4wCj4+PiArCj4+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS91c2hhcmUvdXNoYXJlLm1rIGIvcGFja2FnZS91c2hhcmUvdXNoYXJlLm1rCj4+PiBpbmRleCBh
NGM5NzExNjAwLi43YzczNTljMzg1IDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS91c2hhcmUvdXNo
YXJlLm1rCj4+PiArKysgYi9wYWNrYWdlL3VzaGFyZS91c2hhcmUubWsKPj4+IEBAIC0xOCw4ICsx
OCwxMSBAQCBVU0hBUkVfQ09ORl9PUFRTID0gXAo+Pj4gICAgICAgLS1zeXNjb25mZGlyPS9ldGMg
XAo+Pj4gICAgICAgLS1kaXNhYmxlLXN0cmlwCj4+Pgo+Pj4gK1VTSEFSRV9NQUtFX09QVFMgPSBM
REZMQUdTPSIkKFRBUkdFVF9MREZMQUdTKSAkKFVTSEFSRV9MREZMQUdTKSIKPj4+ICsKPj4+ICBp
ZmVxICgkKEJSMl9TWVNURU1fRU5BQkxFX05MUyksKQo+Pj4gIFVTSEFSRV9DT05GX09QVFMgKz0g
LS1kaXNhYmxlLW5scwo+Pj4gK1VTSEFSRV9NQUtFX09QVFMgKz0gR01TR0ZNVD0iJChIT1NUX0RJ
UikvYmluL21zZ2ZtdCIKPj4KPj4gIFRoaXMgbG9va3MgZmlzaHkuLi4gSWYgTkxTIGlzIGRpc2Fi
bGVkLCB0aGVyZSdzIG5vIGRlcGVuZGVuY3kgdGhhdCBtYWtlcyBzdXJlCj4+IHRoYXQgZ2V0dGV4
dCBpcyBidWlsdCBiZWZvcmUgdXNoYXJlIChvciBhdCBhbGwpLiBDb252ZXJzZWx5LCBpZiBnZXR0
ZXh0IGlzCj4+IGVuYWJsZWQsIHNob3VsZG4ndCB3ZSBzcGVjaWZ5IEdNU0dGTVQ/Cj4gSXQncyBh
bHJlYWR5IGhhbmRsZWQgYnkgKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKSBhdCBsaW5lIDkgb2YK
CiBBRkFJSyBUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUyBjb250YWlucyBnZXR0ZXh0IG9ubHkgaWYg
TkxTIGlzIGVuYWJsZWQuIEJ1dCB0aGlzCmNvbmRpdGlvbiBpcyB3aGVuIE5MUyBpcyAqZGlzYWJs
ZWQqLgoKCiBJIHdvdWxkIGV4cGVjdCBzb21ldGhpbmcgbGlrZToKCmlmZXEgKCQoQlIyX1NZU1RF
TV9FTkFCTEVfTkxTKSx5KQpVU0hBUkVfQ09ORl9PUFRTICs9IC0tZW5hYmxlLW5scwpTSEFSRV9N
QUtFX09QVFMgKz0gR01TR0ZNVD0iJChIT1NUX0RJUikvYmluL21zZ2ZtdCIKZWxzZQpVU0hBUkVf
Q09ORl9PUFRTICs9IC0tZGlzYWJsZS1ubHMKZW5kaWYKCgogUmVnYXJkcywKIEFybm91dAoKPiB1
c2hhcmUubWsgYnV0IEkgY2FuIGFsd2F5cyBkZWZpbmUgR01TR0ZNVCBpZiB5b3UgcHJlZmVyLgo+
IEknbGwgYWxzbyBzZXQgLS1lbmFibGUtbmxzIGV2ZW4gaWYgdGhpcyBpcyBub3QgbmVlZGVkIHRv
IGZpeCB0aGUgYnVpbGQKPiBmYWlsdXJlIGFzIE5MUyBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuCj4+
Cj4+ICBSZWdhcmRzLAo+PiAgQXJub3V0Cj4+Cj4+PiAgZW5kaWYKPj4+Cj4+PiAgZGVmaW5lIFVT
SEFSRV9DT05GSUdVUkVfQ01EUwo+Pj4gQEAgLTMxLDcgKzM0LDcgQEAgZGVmaW5lIFVTSEFSRV9D
T05GSUdVUkVfQ01EUwo+Pj4gIGVuZGVmCj4+Pgo+Pj4gIGRlZmluZSBVU0hBUkVfQlVJTERfQ01E
Uwo+Pj4gLSAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgTERGTEFHUz0iJChUQVJHRVRf
TERGTEFHUykgJChVU0hBUkVfTERGTEFHUykiIC1DICQoQEQpCj4+PiArICAgICAkKFRBUkdFVF9N
QUtFX0VOVikgJChNQUtFKSAkKFVTSEFSRV9NQUtFX09QVFMpIC1DICQoQEQpCj4+PiAgZW5kZWYK
Pj4+Cj4+PiAgZGVmaW5lIFVTSEFSRV9JTlNUQUxMX1RBUkdFVF9DTURTCj4+Pgo+IEJlc3QgUmVn
YXJkcywKPiAKPiBGYWJyaWNlCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
