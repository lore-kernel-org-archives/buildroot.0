Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A019C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 12:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82DD61242
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C82DD61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ECF4600C9;
	Sat, 21 Aug 2021 12:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyRmHXa989mJ; Sat, 21 Aug 2021 12:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3A460664;
	Sat, 21 Aug 2021 12:46:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 507C01BF3A0
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 12:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F43A403F6
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 12:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lZN-L6ZEBa7 for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 12:46:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D79E403F5
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 12:46:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v10so7027978wrd.4
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QZnB6Tls+PifaEGYUfd8DejV7gYXzb4rz9jo7GZOyzY=;
 b=CMBIRHWuEg3/Ei9QQxIKiuDmk2OsihQ2PXMMNI1++vMqlTL3GjnZBxendyNP90+WHA
 YVAD9oeqyOdwn+Byvu1A9Vp9GY8sfEuVjYBV4uY+zbML7BLmRa/HjRiv0GME+gdJHFk+
 nEY+3YWHtq/mLvB6Zfwww6zuyoNzx25kKIOeq5n7gZ1TEkylOac11RoW0CekJhhfcruX
 K+tAIVRnYs+Rq3KIrub71Ej1jj2VhxJrXOyxYGSf4vGtyfSFendIWOOkGEEZ5p81FqI2
 ZZJ8HZzLG6dzRyyZExa3NY/kTNAzuVq9PYlfq6N/JCbzqOBSz8uIrZMXnlTRe/O5q5L2
 K3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QZnB6Tls+PifaEGYUfd8DejV7gYXzb4rz9jo7GZOyzY=;
 b=AFU8W2SJgULnHg5o1PjIbM17PJ22XQWS+X56zqi4yCrL9sIJ683HfuPzOeDQcz/W1l
 zT+dl22s6olBXqSgvgJnU3IPLO5sI1rktR40TbZ908RuO2m7MBuB15BED3drzsKjQG/c
 /+Sk4pjN97EIbfUYvObRcbIKSxqd7o1VpUHQvZlvawMMvO3rzkW119nenoJkUUzp33Pc
 f07tG4FJOA0QgXdcrciFiBRDzOhqjxcO4LPb9FjiHKZUwFWCzCsWGZ6UAFYhzkHQ0AN8
 CdORyqN61xXZM/dPmTM19cXlBEDbQx0vScOxAOR0SgiWKM0nrYPkZPgCHu+VyoPdDgMO
 +zMw==
X-Gm-Message-State: AOAM533RltdHS5JmAWGpeoCyBpk8IRBp5AabEUj5XnDWCVA8M/YLzzXW
 7dYjwlNv/bX+J6keOJYmCWQ=
X-Google-Smtp-Source: ABdhPJzIHkNsBEEOa1ujVCARNtcA9acZMnViCQyYn6P5ehcAPUGYEdMc72ggaM+CQr3/EYoSvO3k7Q==
X-Received: by 2002:a5d:4f8e:: with SMTP id d14mr3847452wru.24.1629549996690; 
 Sat, 21 Aug 2021 05:46:36 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id u5sm8789320wrr.94.2021.08.21.05.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 05:46:36 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210820225341.1131147-1-romain.naour@gmail.com>
 <62964b45-9ad7-c951-889c-84387ec3220a@benettiengineering.com>
 <8897f104-9059-5caf-db4b-fd31101bc0de@benettiengineering.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <f73ebaf4-dff8-c3c7-fc5b-ff43dee0accb@gmail.com>
Date: Sat, 21 Aug 2021 14:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8897f104-9059-5caf-db4b-fd31101bc0de@benettiengineering.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] Config.in: disable Fortify Source for
 microblaze
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gR2l1bGlvLAoKTGUgMjEvMDgvMjAyMSDDoCAwMTowOSwgR2l1bGlvIEJlbmV0dGkgYSDD
qWNyaXTCoDoKPiBPbiA4LzIxLzIxIDEyOjU5IEFNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4g
SGkgUm9tYWluLCBBbGwsCj4+Cj4+IE9uIDgvMjEvMjEgMTI6NTMgQU0sIFJvbWFpbiBOYW91ciB3
cm90ZToKPj4+IEFzIHJlcG9ydGVkIGJ5IFRvb2xjaGFpbi1idWlsZGVyIHByb2plY3QgWzFdLCB0
aGUgc3lzdGVtIGRvZXNuJ3QKPj4+IGJvb3Qgd2hlbiBGb3J0aWZ5IFNvdXJjZSBpcyBlbmFibGVk
IGZvciBnbGliYyBiYXNlZCB0b29sY2hhaW4KPj4+ICh0aGUgaW5pdCBwcm9jZXNzIGhhbmcpLgo+
Pj4KPj4+IEFsc28sIGhhcmRlbmluZyBmZWF0dXJlcyBtYXkgbm90IGJlIHdhbnRlZCBvciBwb3Nz
aWJsZSBmb3Igc3VjaAo+Pj4gc2xvdyBzb2Z0LWNvcmUgY3B1cyBbMl0uCj4+Pgo+Pj4gWzFdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMTQ2NzYy
NDUwMAo+Pj4gWzJdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290
LzIwMjEtSnVuZS8zMTI0MTYuaHRtbAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+Pj4gQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gLS0tCj4+PiBXaXRoIEJSMl9SRUxS
T19QQVJUSUFMIGVuYWJsZWQsIHRoZSBzeXN0ZW0gYm9vdC4KPj4+IC0tLQo+Pj4gwqDCoCBDb25m
aWcuaW4gfCA3ICsrKysrKysKPj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Db25maWcuaW4gYi9Db25maWcuaW4KPj4+IGluZGV4IDJl
ZjVkNDA3ZTQuLjg0ZjdmYTZlOGQgMTAwNjQ0Cj4+PiAtLS0gYS9Db25maWcuaW4KPj4+ICsrKyBi
L0NvbmZpZy5pbgo+Pj4gQEAgLTg1Myw5ICs4NTMsMTYgQEAgZW5kY2hvaWNlCj4+PiDCoMKgIGNv
bW1lbnQgIlJFTG9jYXRpb24gUmVhZCBPbmx5IChSRUxSTykgbmVlZHMgc2hhcmVkIGxpYnJhcmll
cyIKPj4+IMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uICFCUjJfU0hBUkVEX0xJQlMKPj4+IMKgwqAg
K2NvbmZpZyBCUjJfRk9SVElGWV9TT1VSQ0VfQVJDSF9TVVBQT1JUUwo+Pj4gK8KgwqDCoCBib29s
Cj4+PiArwqDCoMKgIGRlZmF1bHQgeQo+Pj4gK8KgwqDCoCAjIE1pY3JvYmxhemUgZ2xpYmMgdG9v
bGNoYWlucyBkb24ndCB3b3JrIHdpdGggRm9ydGlmeSBTb3VyY2UgZW5hYmxlZCA+Cj4+PiArwqDC
oMKgIGRlcGVuZHMgb24gIUJSMl9taWNyb2JsYXplCj4+Cj4+IGhlcmUgeW91IHNheSBpdCBkb2Vz
bid0IHdvcmsgd2l0aCBnbGliYyB0b29sY2hhaW5zLCBzbyB5b3UgY291bGQgYWRkCj4+ICcmJiAh
QlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDJy4gSSB0aGluayBpdCdzIHdvcnRoIGlmIGl0IHdvcmtz
IHdpdGgKPj4gdWNsaWJjIGFuZCBtdXNsLgo+IAo+IE9mIGNvdXJzZSBiZXR3ZWVuIHBhcmVudGhl
c2lzIGxpa2U6Cj4gYGBgCj4gZGVwZW5kcyBvbiAoIUJSMl9taWNyb2JsYXplICYmICFCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMpCj4gYGBgCj4gb3RoZXJ3aXNlIGV2ZXJ5IHRvb2xjaGFpbiB3aGlj
aCB1c2VzIGdsaWJjIGRvZXNuJ3QgdXNlIEZvcnRpZnkgYW55bW9yZS4KPiAKPj4gV2hhdCBkbyB5
b3UgdGhpbmsgYWJvdXQgaXQ/CgpGb3J0aWZ5IFNvdXJjZSBpcyBkaXNhYmxlZCBmb3IgdGhlIHNh
bWUgcmVhc29uIGFzIGZvciBQSUMvUElFIGV2ZW4gZm9yIHVDbGliYy1uZwpvciBtdXNsOgoKaHR0
cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1kMTIwZjg0NDYwNGRh
MjI5NWJiN2JkOGZjNmMxZjRlZmJlOGI1NzkyCgpJIHdhbnQgdG8gYXZvaWQgdGhlIG1haW50ZW5h
bmNlIGJ1cmRlbiBvbiBzdWNoIHBsYXRmb3JtLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4+Cj4+
IEJlc3QgcmVnYXJkcwo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQK
aHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
