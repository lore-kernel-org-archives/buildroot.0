Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1943BFD9E0E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF3F3405F8;
	Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3oENtdGfCgF; Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C53405F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138833;
	bh=YkH7g7/Ywg4Xad5SSvlRCyYiuhcn4nsOHaFnOW6676Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LWsJ0nyHiu2RYZGoOG1hPplKtZw96dYvsL2QC8Cyp+Y1lafl5EE+r6zWhv2QfoLy5
	 6WX/R2ZFZKD7rZ0U5/iZG4+9a2Mh/7wnJ+4oDDKPcaKuKANhu7eIHHRnFxJQjJoshF
	 4Gax7/4pxyMhcIW2ckjil45lpzV5oa8zj21kxzdUtAefiU5Hk964QkP9hgLvpoKK+g
	 R8t72+xltvCEy/kIBoqBTCvuwvUDJFpHm8hN1V4P7JSua5SB4bov//28KasS0CkSpC
	 Sz14JSSEQcyEVoBlO/VK3V+Nz9WBJNmGCoSJnaWEgNh/4yAvflo1tsUNtdUMaoQmUJ
	 IgVRSaTsVl4pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C53405F9;
	Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2E723D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F58480E4E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VY7DB-AvyxAV for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40E0280E4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E0280E4D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40E0280E4D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so14333035e9.2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138827; x=1772743627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wo3D9y/3hL7R5Ufxn0y0neQT7yZHgo2R1A1mTyiGhCk=;
 b=ltpDoPRrvExkHP/KRpDvdkdSG8gTaU+XQaK7X5T2OS5NKjRvKWqBqolvVW/pN6cEB3
 5+W0yxbu0nFITF5cGIiZ6EWlHwywfk7TK0G+ByAKV4EatTpnun8RRq6u68hgM9PFtX6O
 j+5L1FiBw4dx91c4RebLJ2QDb+MRr+/5ZbdrdMfhEjVwU1KjcxobQrsxXkowf1gSrf8w
 AkOsdFA4K6GYyqtnzIiijK8WELrElQX+JGuu9gzE9cSi6Qcn/PGud1eDjxfSB71bpvnj
 txhaiWhuxQ9Ut62OLtqDYiqVZKgdB5CvZyDilgw9Ja+xXJ6nQor+MyUKg8pWw8Ohf1AB
 BY/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRCIFxPpc3BlyTJxtigKvU/SvLLu72/zAmBepB+S3SL4Qpa7cWvPB75/KqGhONkcUvYfVAXf7Pvo=@buildroot.org
X-Gm-Message-State: AOJu0YwYRoiqnUKHtNYwj0GWuMX9fQaQ7Muw6iONtmtQ8nFB7fAHKc8y
 exgOvziyrdC+MdD8yEof9tCjpvUjZcp6hFeD3XvbOTNaZ8g8OegZ9OVFbhL9QuWcz+c=
X-Gm-Gg: ATEYQzwxjT8dVaI6XCA4abULWgiBps83ohgOrpFGbPdM+BdWvpusMpHeoN/NPPdjo7h
 gFyeH1CsX7ZyPqSRsE7r8nPqAti4SqYr9MZfbufUBhIS94MLdcxgr7Sg0GwBZljyr7ZLpn9+Ta6
 02CnIwqwHao6It4xdvfCQwZ3cb/hZjBzMPjVUG8WSFnxN4JzrA1st9abLF5EsVxepswiGKpGYCT
 gyIeTY5qpLDZGq2PnjYuuxWDl7m85jT4tVkY8Yx7IHqMs3cTvKfDVap0z0uCwh6N9volsU9KnQc
 WzKlwtmutlbJRTNOgfPxOdf7iWPBrSLso6qEHhk49BFpFlUL33FbB1M1m+qCvcd35IWt/Hf3Hae
 7nERRpdTdT8kpigtb/SLx6kMNv3nQLYKdat8LW/nlIQEJXgPfJtGdwq/3ElG/D0UfTXADOLUAu4
 gZMO/HSs4FhgIeTjo=
X-Received: by 2002:a05:600c:138d:b0:483:361b:deff with SMTP id
 5b1f17b1804b1-483c9bb2c10mr3054485e9.14.1772138827027; 
 Thu, 26 Feb 2026 12:47:07 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfccd7b6sm42440085e9.24.2026.02.26.12.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:06 -0800 (PST)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:05 +0100
Message-ID: <20260226204706.253731-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216-host-dtc-build-failure-v1-1-75dd77ff4650@bootlin.com>
References: <20260216-host-dtc-build-failure-v1-1-75dd77ff4650@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138827; x=1772743627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wo3D9y/3hL7R5Ufxn0y0neQT7yZHgo2R1A1mTyiGhCk=;
 b=E5RLOsC+J7yZBTidikSEk/NoomyLMlppM9/+mS4kh2FNPkihjiz/mm3jHKjHt4zPwX
 KG9pJuLuWCcxrMm8Qodx1TevgXK9v/lDX5W+BaSkbH8PDV7CQ+Yni1ayuGoQHgP8GISf
 Gg13hmVIZZfH6RF809gJBUpmmpHxHNc4gBG4x7jqtreXU9ska7gCIybLHfNvoXPaQ3hU
 /PQFFqxNvIxw6KkisE6w2OJx+/98H9Cylp56385nBm56jaQfRatHxzO+W3pUNxPFan2v
 BpFL7+UoLNeSSP2ugCuXL32tCTSpu38QmsoD0nZAUsPDP68yiYjzXQcqAUAx9kcy4g81
 OTJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E5RLOsC+
Subject: Re: [Buildroot] [PATCH] package/dtc: fix host build with glibc 2.43
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gV2hlbiB0cnlpbmcgdG8gYnVpbGQgaG9zdC1kdGMgb24gYSBob3N0IHdp
dGggZ2xpYmMgMi40MywgdGhlIGJ1aWxkIGZhaWxzCj4gb24gdGhlIGZvbGxvd2luZyBlcnJvcjoK
PiAKPiAgIGxpYmZkdC9mZHRfb3ZlcmxheS5jOiBJbiBmdW5jdGlvbiDigJhvdmVybGF5X2ZpeHVw
X3BoYW5kbGXigJk6Cj4gICBsaWJmZHQvZmR0X292ZXJsYXkuYzo0MjQ6MjE6IGVycm9yOiBhc3Np
Z25tZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZCj4gICBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRh
cmdldCB0eXBlIFstV2Vycm9yPWRpc2NhcmRlZC1xdWFsaWZpZXJzXQo+ICAgICA0MjQgfCAgICAg
ICAgICAgICAgICAgc2VwID0gbWVtY2hyKGZpeHVwX3N0ciwgJzonLCBmaXh1cF9sZW4pOwo+ICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF4KPiAgIGxpYmZkdC9mZHRfb3ZlcmxheS5jOjQz
NDoyMTogZXJyb3I6IGFzc2lnbm1lbnQgZGlzY2FyZHMg4oCYY29uc3TigJkKPiAgIHF1YWxpZmll
ciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNd
Cj4gICAgIDQzNCB8ICAgICAgICAgICAgICAgICBzZXAgPSBtZW1jaHIobmFtZSwgJzonLCBmaXh1
cF9sZW4pOwo+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF4KPiAgIGZkdHB1dC5jOiBJ
biBmdW5jdGlvbiDigJhjcmVhdGVfbm9kZeKAmToKPiAgIGZkdHB1dC5jOjIzNToxMTogZXJyb3I6
IGFzc2lnbm1lbnQgZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20KPiAgIHBvaW50
ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4gICAgIDIzNSB8
ICAgICAgICAgcCA9IHN0cnJjaHIobm9kZV9uYW1lLCAnLycpOwo+ICAgICAgICAgfCAgICAgICAg
ICAgXgo+ICAgY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiAgIG1h
a2VbMl06ICoqKiBbTWFrZWZpbGU6MzU5OiBmZHRwdXQub10gRXJyb3IgMQo+ICAgbWFrZVsyXTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiAgIGNjMTogYWxsIHdhcm5pbmdz
IGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gICBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjM1OTog
bGliZmR0L2ZkdF9vdmVybGF5Lm9dIEVycm9yIDEKPiAgIG1ha2VbMV06ICoqKiBbcGFja2FnZS9w
a2ctZ2VuZXJpYy5tazoyNzM6Cj4gICAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdC9kdGMvYnVp
bGQvaG9zdC1kdGMtMS43LjIvLnN0YW1wX2J1aWx0XSBFcnJvciAyCj4gICBtYWtlOiAqKiogW01h
a2VmaWxlOjgzOiBfYWxsXSBFcnJvciAyCj4gCj4gVGhlIGlzc3VlIGNhbiBiZSByZXByb2R1Y2Vk
IG9uIG1hc3RlciB3aXRoIHRoaXMgbWluaW1hbCBkZWZjb25maWcgb24gYQo+IGhvc3QgaGF2aW5n
IGdsaWJjIDIuNDM6Cj4gCj4gICBCUjJfeDg2XzY0PXkKPiAgIEJSMl9UT09MQ0hBSU5fRVhURVJO
QUw9eQo+ICAgQlIyX1BBQ0tBR0VfUU9SSVFfTUNfVVRJTFM9eQo+IAo+IChRT1JJUV9NQ19VVElM
UyB3aWxsIHB1bGwgSE9TVF9EVEMpCj4gCj4gVGhpcyBlcnJvciBpcyBkdWUgdG8gc29tZSBmdW5j
dGlvbnMgcHJvdG90eXBlIHVwZGF0ZSBpbiBnbGliYyAyLjQzIGZvcgo+IElTTyBDMjMgKHNlZSBb
MV0sIHBvaW50IDMgaW4gdGhlIE5FV1MgbGlzdCkuIFRoZSBjb3JyZXNwb25kaW5nIGZpeCBoYXMK
PiBhbHJlYWR5IGJlZW4gaW50ZWdyYXRlZCB1cHN0cmVhbSwgYnV0IGl0IGhhcyBub3QgYmVlbiBy
ZWxlYXNlZCBzaW5jZQo+IHRoZW4uCj4gCj4gQnJpbmcgdGhlIGNvcnJlc3BvbmRpbmcgdXBzdHJl
YW0gcGF0Y2ggdG8gYWxsb3cgaG9zdC1kdGMgdG8gYnVpbGQgb24KPiBhZmZlY3RlZCBob3N0cy4K
PiAKPiBbMV0gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9pbmZvLWdudS8yMDI2
LTAxL21zZzAwMDA1Lmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFs
ZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjEx
LnguIFRoYW5rcwoKPiAtLS0KPiBUaGUgaXNzdWUgYWZmZWN0cyBib3RoIG1hc3RlciBhbmQgMjAy
NS4wMi54Cj4gLS0tCj4gIC4uLi9kdGMvMDAwMi1maXgtZGlzY2FyZGVkLWNvbnN0LXF1YWxpZmll
cnMucGF0Y2ggIHwgODggKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
ODggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2R0Yy8wMDAyLWZpeC1k
aXNjYXJkZWQtY29uc3QtcXVhbGlmaWVycy5wYXRjaCBiL3BhY2thZ2UvZHRjLzAwMDItZml4LWRp
c2NhcmRlZC1jb25zdC1xdWFsaWZpZXJzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjk1ZGI4ODYzODljZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL2R0Yy8wMDAyLWZpeC1kaXNjYXJkZWQtY29uc3QtcXVhbGlmaWVycy5wYXRjaAo+IEBA
IC0wLDAgKzEsODggQEAKPiArRnJvbSA5YTFjODAxYTFhM2MxMDJiZjk1YzUzMzljOWU5ODViMjZi
ODIzYTIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBTdGVwaGVuIEdhbGxhZ2hl
ciA8c2dhbGxhZ2hAcmVkaGF0LmNvbT4KPiArRGF0ZTogVHVlLCA2IEphbiAyMDI2IDE0OjE5OjMw
IC0wNTAwCj4gK1N1YmplY3Q6IEZpeCBkaXNjYXJkZWQgY29uc3QgcXVhbGlmaWVycwo+ICsKPiAr
SXQncyB1bnNhZmUgdG8gaW1wbGljaXRseSBkaXNjYXJkIHRoZSBjb25zdCBxdWFsaWZpZXIgb24g
YSBwb2ludGVyLiBJbgo+ICtvdmVybGF5X2ZpeHVwX3BoYW5kbGUoKSwgdGhpcyB3YXMgcHJvYmFi
bHkganVzdCBhbiBvdmVyc2lnaHQsIGFuZCBtYWtpbmcKPiArdGhlICJzZXAiIHZhcmlhYmxlIGEg
Y29uc3QgY2hhciAqIGlzIHN1ZmZpY2llbnQgdG8gZml4IGl0Lgo+ICsKPiArSW4gY3JlYXRlX25v
ZGUoKSwgaG93ZXZlciwgdGhlICJwIiB2YXJpYWJsZSBpcyBkaXJlY3RseSBtb2RpZnlpbmcgdGhl
Cj4gK2J1ZmZlciBwb2ludGVkIHRvIGJ5ICJjb25zdCBjaGFyKiBub2RlX25hbWUiLiBUbyBmaXgg
dGhpcywgd2UgbmVlZCB0bwo+ICthY3R1YWxseSBtYWtlIGEgZHVwbGljYXRlIG9mIHRoZSBidWZm
ZXIgYW5kIG9wZXJhdGUgb24gdGhhdCBpbnN0ZWFkLgo+ICsKPiArVGhpcyBpbnRyb2R1Y2VzIGEg
bWFsbG9jKCkvZnJlZSgpICBhbmQgYW4gdW5ib3VuZGVkIHN0cmR1cCgpIGludG8gdGhlCj4gK29w
ZXJhdGlvbiwgYnV0IGZkdHB1dCBpc24ndCBhIGxvbmctcnVubmluZyBzZXJ2aWNlIGFuZCB0aGUg
bm9kZV9uYW1lCj4gK2FyZ3VtZW50IGNvbWVzIGRpcmVjdGx5IGZyb20gYXJndiwgc28gdGhpcyBz
aG91bGRuJ3QgaW50cm9kdWNlIGEKPiArc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UgaW1wYWN0Lgo+
ICsKPiArU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBHYWxsYWdoZXIgPHNnYWxsYWdoQHJlZGhhdC5j
b20+Cj4gK1NpZ25lZC1vZmYtYnk6IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFy
LmlkLmF1Pgo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxz
L2R0Yy9kdGMuZ2l0L2NvbW1pdC8/aWQ9OWExYzgwMWExYTNjMTAyYmY5NWM1MzM5YzllOTg1YjI2
YjgyM2EyMQo+ICtTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3Jl
QGJvb3RsaW4uY29tPgo+ICsKPiArLS0tCj4gKyBmZHRwdXQuYyAgICAgICAgICAgICB8IDggKysr
KystLS0KPiArIGxpYmZkdC9mZHRfb3ZlcmxheS5jIHwgMyArKy0KPiArIG1lc29uLmJ1aWxkICAg
ICAgICAgIHwgMSArCj4gKyAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9mZHRwdXQuYyBiL2ZkdHB1dC5jCj4gK2luZGV4
IDA1ZjJiOTMuLmZkYjU4MWEgMTAwNjQ0Cj4gKy0tLSBhL2ZkdHB1dC5jCj4gKysrKyBiL2ZkdHB1
dC5jCj4gK0BAIC0yNTQsMTkgKzI1NCwyMSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9wYXRocyhjaGFy
ICoqYmxvYiwgY29uc3QgY2hhciAqaW5fcGF0aCkKPiArIHN0YXRpYyBpbnQgY3JlYXRlX25vZGUo
Y2hhciAqKmJsb2IsIGNvbnN0IGNoYXIgKm5vZGVfbmFtZSkKPiArIHsKPiArIAlpbnQgbm9kZSA9
IDA7Cj4gKy0JY2hhciAqcDsKPiArKwljb25zdCBjaGFyICpwOwo+ICsrCWNoYXIgKnBhdGggPSBO
VUxMOwo+ICsgCj4gKyAJcCA9IHN0cnJjaHIobm9kZV9uYW1lLCAnLycpOwo+ICsgCWlmICghcCkg
ewo+ICsgCQlyZXBvcnRfZXJyb3Iobm9kZV9uYW1lLCAtMSwgLUZEVF9FUlJfQkFEUEFUSCk7Cj4g
KyAJCXJldHVybiAtMTsKPiArIAl9Cj4gKy0JKnAgPSAnXDAnOwo+ICsgCj4gKyAJKmJsb2IgPSBy
ZWFsbG9jX25vZGUoKmJsb2IsIHAgKyAxKTsKPiArIAo+ICsgCWlmIChwID4gbm9kZV9uYW1lKSB7
Cj4gKy0JCW5vZGUgPSBmZHRfcGF0aF9vZmZzZXQoKmJsb2IsIG5vZGVfbmFtZSk7Cj4gKysJCXBh
dGggPSB4c3RybmR1cChub2RlX25hbWUsIChzaXplX3QpKHAgLSBub2RlX25hbWUpKTsKPiArKwkJ
bm9kZSA9IGZkdF9wYXRoX29mZnNldCgqYmxvYiwgcGF0aCk7Cj4gKysJCWZyZWUocGF0aCk7Cj4g
KyAJCWlmIChub2RlIDwgMCkgewo+ICsgCQkJcmVwb3J0X2Vycm9yKG5vZGVfbmFtZSwgLTEsIG5v
ZGUpOwo+ICsgCQkJcmV0dXJuIC0xOwo+ICtkaWZmIC0tZ2l0IGEvbGliZmR0L2ZkdF9vdmVybGF5
LmMgYi9saWJmZHQvZmR0X292ZXJsYXkuYwo+ICtpbmRleCBlNmI5ZWI2Li41MWEzODU5IDEwMDY0
NAo+ICstLS0gYS9saWJmZHQvZmR0X292ZXJsYXkuYwo+ICsrKysgYi9saWJmZHQvZmR0X292ZXJs
YXkuYwo+ICtAQCAtNDA3LDcgKzQwNyw4IEBAIHN0YXRpYyBpbnQgb3ZlcmxheV9maXh1cF9waGFu
ZGxlKHZvaWQgKmZkdCwgdm9pZCAqZmR0bywgaW50IHN5bWJvbHNfb2ZmLAo+ICsgCQljb25zdCBj
aGFyICpmaXh1cF9zdHIgPSB2YWx1ZTsKPiArIAkJdWludDMyX3QgcGF0aF9sZW4sIG5hbWVfbGVu
Owo+ICsgCQl1aW50MzJfdCBmaXh1cF9sZW47Cj4gKy0JCWNoYXIgKnNlcCwgKmVuZHB0cjsKPiAr
KwkJY29uc3QgY2hhciAqc2VwOwo+ICsrCQljaGFyICplbmRwdHI7Cj4gKyAJCWludCBwb2Zmc2V0
LCByZXQ7Cj4gKyAKPiArIAkJZml4dXBfZW5kID0gbWVtY2hyKHZhbHVlLCAnXDAnLCBsZW4pOwo+
ICtkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAo+ICtpbmRleCA2NmI0NGU4
Li41MDFiNzA2IDEwMDY0NAo+ICstLS0gYS9tZXNvbi5idWlsZAo+ICsrKysgYi9tZXNvbi5idWls
ZAo+ICtAQCAtMTgsNiArMTgsNyBAQCBhZGRfcHJvamVjdF9hcmd1bWVudHMoCj4gKyAgICAgJy1X
c2hhZG93JywKPiArICAgICAnLVdzdWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXQnLAo+ICsgICAgICct
V3dyaXRlLXN0cmluZ3MnLAo+ICsrICAgICctV2Rpc2NhcmRlZC1xdWFsaWZpZXJzJywKPiArICAg
XSksCj4gKyAgIGxhbmd1YWdlOiAnYycKPiArICkKPiArLS0gCj4gK2NnaXQgMS4yLjMta29yZwo+
ICsKPiArCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGJlYWJkOGJhZWVmMzdmMTc4MGY1MmUzYzlk
NDY0YzYxMTczMWJhOTgKPiBjaGFuZ2UtaWQ6IDIwMjYwMjE2LWhvc3QtZHRjLWJ1aWxkLWZhaWx1
cmUtY2Y3YjhjYzZkNjk3Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tIAo+IEFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
