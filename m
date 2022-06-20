Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A84C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5EB418D8;
	Mon, 20 Jun 2022 19:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5EB418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1atSQkU_Igk; Mon, 20 Jun 2022 19:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2752418D3;
	Mon, 20 Jun 2022 19:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2752418D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 554BB1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FD1081ADE
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD1081ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiogOy_w87Po for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:42:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5168194A
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE5168194A
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:42:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cf14so6741170edb.8
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=dMdmZjV6oeJPbnpZCUcFSx2MbWKyVXA3fFdsCyUx5BY=;
 b=dMN3gQPhh/qk42zqGv9v9kuwvMpspT3YenpTluggGWnuU3yl1oTHmVedGQZTqQ1Ln5
 UPjg5iYg6V6RwvbqnW5m4Jf7DN7frDu+KBpgdf520ayDJeXmhZ6uT+nvj58AKYTMgTVf
 Gylw25iM4Z6sgGseO68rCHJAGPsgkRl2BNgeK24m1Mh6yrtkcC+jwWxZqcBSoQnt6GY/
 VfGLT5MbY5/qBRDRBEulXna7RnIbDshcMAJGVJD/HIVTbhB9iS+dGBOWLewqvnlDtSuE
 FRpFmGW+LxieU4sO+tKsqKxSEGuI/gWQEvSIR36ISiu2MvMtMI0tYIUVx82/gODZ4XRl
 LfaA==
X-Gm-Message-State: AJIora/KE2zR6+Gwr2Tj7/5u8NLRqiKiKl2W4rpPVLven0xhFuSEc8Kp
 JaZ+GJLDOvKXsMRZIi6Z130l6w==
X-Google-Smtp-Source: AGRyM1vPasgi9cytcosJpUJHuuBiJkk6kqmybk3cJgha9Miz8m7JQhQsIEa9XykAB1VL10Ar0bBxGg==
X-Received: by 2002:a05:6402:5008:b0:42d:c421:48c8 with SMTP id
 p8-20020a056402500800b0042dc42148c8mr31578367eda.422.1655754144025; 
 Mon, 20 Jun 2022 12:42:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906219100b007105a157706sm6452271eju.82.2022.06.20.12.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:42:23 -0700 (PDT)
Message-ID: <b3eda097-672f-da25-3b5a-e50b8a0a8077@mind.be>
Date: Mon, 20 Jun 2022 21:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: vsvoboda@forkoder.eu, buildroot@buildroot.org
References: <20220531125152.135227-1-vsvoboda@forkoder.eu>
 <156e8291-d30a-86cb-0063-0fbf05369cd5@mind.be>
Organization: Essensium/Mind
In-Reply-To: <156e8291-d30a-86cb-0063-0fbf05369cd5@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=dMdmZjV6oeJPbnpZCUcFSx2MbWKyVXA3fFdsCyUx5BY=;
 b=A+mwwMSQden5tADfqOpufMzLj1emCwaqe3RsdsMJ4SCEHjmSvpezKndf5YzQpARrzi
 jSwux7FhQBqeiWntPsBo3HBLF3iM8ERJuwTji1fM7iQss1lm53Xixfn8inoPejS2Tq33
 f/F09pyhq7pKt3dYfnyU3GI0Kzb9rTxQkh5IMiC2iBlAta+ZqTsZi3JR8WJ3NjOV+q/O
 Oy9tSWsNcl26A9gghk2z+g7QZcnC3s2YDqj8x2R4R6t1rmyPtaR/YdKiKVGG9Kdm9WEU
 8a48z2WRBjsmU+8+q15KucifCjvP6U1zDhoNgMBusDdYMBPrboJQqp6RW1o9xBWWErRZ
 80Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A+mwwMSQ
Subject: Re: [Buildroot] [PATCH 1/2] fs/ext2: add option for zstd compression
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

Ck9uIDIwLzA2LzIwMjIgMjE6NDEsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
VmxhZGltaXIKPgo+IE9uIDMxLzA1LzIwMjIgMTQ6NTEsIHZzdm9ib2RhQGZvcmtvZGVyLmV1IHdy
b3RlOgo+PiBGcm9tOiBWbGFkaW1pciBTdm9ib2RhIDx2c3ZvYm9kYUBmb3Jrb2Rlci5ldT4KPgo+
IEFkZCBhIFNpZ25lZC1vZmYtYnkgbGluZSBmb3IgeW91cnNlbGYuwqAgVGhpcyBpcyBhIHNob3J0
IHdheSBmb3IgeW91IHRvCj4gYXNzZXJ0IHRoYXQgeW91IGFyZSBlbnRpdGxlZCB0byBjb250cmli
dXRlIHRoZSBwYXRjaCB1bmRlciBidWlsZHJvb3Qncwo+IEdQTCBsaWNlbnNlLsKgIFNlZSBbMV0g
Zm9yIG1vcmUgZGV0YWlscy4gV2l0aG91dCB0aGlzLCB3ZSBjYW4ndCBhcHBseSB0aGUKPiBwYXRj
aC4KCiDCoEZvcmdvdCB0byBtZW50aW9uOiBpdCdzIHN1ZmZpY2llbnQgdG8gcmVwbHkgdG8gdGhp
cyBtYWlsIHdpdGggdGhlIApTaWduZWQtb2ZmLWJ5IC0gcGF0Y2h3b3JrIHdpbGwgcGljayBpdCB1
cCBhbmQgYWRkIGl0IHRvIHRoZSBwYXRjaC4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgo+Cj4g
wqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPiBbMV0gaHR0cDovL2VsaW51eC5vcmcvRGV2ZWxvcGVy
X0NlcnRpZmljYXRlX09mX09yaWdpbgo+Cj4+Cj4+IC0tLQo+PiDCoCBmcy9leHQyL0NvbmZpZy5p
biB8IDUgKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZnMvZXh0Mi9Db25maWcuaW4gYi9mcy9leHQyL0NvbmZpZy5pbgo+PiBpbmRl
eCAzMzNlYWQ5NWZlLi43MDU0NDZkZjU3IDEwMDY0NAo+PiAtLS0gYS9mcy9leHQyL0NvbmZpZy5p
bgo+PiArKysgYi9mcy9leHQyL0NvbmZpZy5pbgo+PiBAQCAtMTMxLDYgKzEzMSwxMSBAQCBjb25m
aWcgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9YWgo+PiDCoMKgwqDCoMKgIGhlbHAKPj4gwqDCoMKg
wqDCoMKgwqAgRG8gY29tcHJlc3MgdGhlIGV4dDIgZmlsZXN5c3RlbSB3aXRoIHh6Lgo+PiDCoCAr
Y29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfWlNURAo+PiArwqDCoMKgIGJvb2wgInpzdGQi
Cj4+ICvCoMKgwqAgaGVscAo+PiArwqDCoMKgwqDCoCBEbyBjb21wcmVzcyB0aGUgZXh0MiBmaWxl
c3lzdGVtIHdpdGggenN0ZC4KPj4gKwo+PiDCoCBlbmRjaG9pY2UKPj4gwqAgwqAgZW5kaWYgIyBC
UjJfVEFSR0VUX1JPT1RGU19FWFQyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
