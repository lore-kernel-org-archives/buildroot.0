Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B252C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC96A40608;
	Wed, 27 Jul 2022 15:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC96A40608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sr6keJF1Oimz; Wed, 27 Jul 2022 15:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 354104013D;
	Wed, 27 Jul 2022 15:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 354104013D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 280491BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02F7260B30
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F7260B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TFAgPQpIg60 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9DE60B00
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC9DE60B00
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:06:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l4so3142946wrm.13
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pf6jPrsnVkg+CZzcfcppDMH10HFag5014x7p5US/zMg=;
 b=GeihPb1QeC0L0ffgC4YOHC6jnpunYECbw7Ugr4HVo2SjBFb8DyzMwGWu5Iqt2RiB+1
 yLlgOgjycpnRo9t9+SieAaleU7asJYkr2gDx4eytob85ICeRsVWencv6vKLYJTcnheqZ
 hBQW/KAc8seoc1RqyUsvE7oa5crMLuNwl7PzMfvr7MegrXy5YhrZKANIF4PqgQN45ZYY
 6/TydiBWOF78W3w3NshbnYZ9iTe6jCPHLqvtDHM6hzDlVes+4ee5B1bFTBjdg/pJDWp+
 iAYohgiOUj0BRx7Ge+u9G0jeVx/JXy7kY4csPOFkegezMfQ+si+IpuRpqzWvGNKQnhnT
 E8TQ==
X-Gm-Message-State: AJIora+QitiV99Oxd5IRiXGguLrpBILxTE/RfIytubP3RPNzNwVQvNVq
 D7pxAdZ6M62RGmdYCyEaMIGLKnV/2Tmudw==
X-Google-Smtp-Source: AGRyM1uLm8ZB5opE7ORIaI3Mw0/x68wd+0RT9L6fGkeMiOoB/nZxiCaV6u75yDGXw4qP65nehWFixA==
X-Received: by 2002:adf:edc1:0:b0:21d:7157:f4aa with SMTP id
 v1-20020adfedc1000000b0021d7157f4aamr14638068wro.454.1658934412883; 
 Wed, 27 Jul 2022 08:06:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b0039747cf8354sm2721345wmb.39.2022.07.27.08.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 08:06:52 -0700 (PDT)
Message-ID: <efe0cf31-54a7-6abc-8034-c440327e644f@smile.fr>
Date: Wed, 27 Jul 2022 17:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
References: <20220620115510.33792-1-paul@crapouillou.net>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220620115510.33792-1-paul@crapouillou.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Pf6jPrsnVkg+CZzcfcppDMH10HFag5014x7p5US/zMg=;
 b=jSdWSSqcXSMho2FEoDwXdPbHH/lOLd3gcM8EOhCyso75iLOi4Jzs2jAMhyfM0pIlJg
 mncZmLhP+ik0xupiGEfEpCtLI2226oMv2fQwPqT5uv48lL/APrSbGcSwXAO/6n67YfjA
 5KJTSKh0hM9SsICgi5z9KsMqzVj12NZrGChVFYcQYgtMPLNYmod+faHm+JyVSWBb4CZG
 RYOx1zLMIR04tJM8wVY8xWU6zC9gipAQk83dY3edsTtC1iN+GC0OrKreu/SwsAvX0vf0
 00DvwVHGeDCU3htAfoA7KBqKfrEcHC2bn0Teggk0lX/q+TVfy789M6iXZWENI62k3qFV
 +Vag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jSdWSSqc
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: add option to force
 static build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGF1bCwKCkxlIDIwLzA2LzIwMjIgw6AgMTM6NTUsIFBhdWwgQ2VyY3VlaWwgYSDDqWNy
aXTCoDoKPiBUaGlzIG9wdGlvbiBjYW4gYmUgdXNlZnVsIHdoZW4gYnVpbGRpbmcgZm9yIGEgc3lz
dGVtIHRoYXQKPiBuZWVkcyB0byBzb21ld2hhdCBtYWludGFpbiBjb21wYXRpYmlsaXR5IHdpdGgg
cHJldmlvdXNseSBidWlsdAo+IHNvZnR3YXJlLCBhcyBCb29zdCBpcyBub3RvcmlvdXMgZm9yIGJy
ZWFraW5nIEFCSSBhdCBldmVyeQo+IHNpbmdsZSByZWxlYXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IC0tLQo+ICBwYWNrYWdlL2Jv
b3N0L0NvbmZpZy5pbiB8IDExICsrKysrKysrKysrCj4gIHBhY2thZ2UvYm9vc3QvYm9vc3QubWsg
IHwgIDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm9vc3QvQ29uZmlnLmluIGIvcGFja2FnZS9i
b29zdC9Db25maWcuaW4KPiBpbmRleCBiOTliMDFmMjJlLi42MGViODNmZjRjIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvYm9vc3QvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9ib29zdC9Db25maWcu
aW4KPiBAQCAtMTYsNiArMTYsMTcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0JPT1NUCj4gIAo+ICBp
ZiBCUjJfUEFDS0FHRV9CT09TVAo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0JPT1NUX1NUQVRJ
Qwo+ICsJYm9vbCAiQnVpbGQgc3RhdGljIGxpYnJhcmllcyIKPiArCWRlcGVuZHMgb24gQlIyX1NI
QVJFRF9MSUJTCj4gKwloZWxwCj4gKwkgIEJ1aWxkIHN0YXRpYyBCb29zdCBsaWJyYXJpZXMuCj4g
Kwo+ICsJICBUaGlzIG9wdGlvbiBjYW4gYmUgdXNlZnVsIHdoZW4gYnVpbGRpbmcgZm9yIGEgc3lz
dGVtIHRoYXQKPiArCSAgbmVlZHMgdG8gc29tZXdoYXQgbWFpbnRhaW4gY29tcGF0aWJpbGl0eSB3
aXRoIHByZXZpb3VzbHkgYnVpbHQKPiArCSAgc29mdHdhcmUsIGFzIEJvb3N0IGlzIG5vdG9yaW91
cyBmb3IgYnJlYWtpbmcgQUJJIGF0IGV2ZXJ5Cj4gKwkgIHNpbmdsZSByZWxlYXNlLgo+ICsKPiAg
Y29uZmlnIEJSMl9QQUNLQUdFX0JPT1NUX0FUT01JQwo+ICAJYm9vbCAiYm9vc3QtYXRvbWljIgo+
ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1NVUFBPUlRTX0FMV0FZU19MT0NLRlJFRV9BVE9N
SUNfSU5UUwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Jvb3N0L2Jvb3N0Lm1rIGIvcGFja2FnZS9i
b29zdC9ib29zdC5tawo+IGluZGV4IGY2ZTlhMDMyMjAuLjE2MjI3N2I5NjggMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9ib29zdC9ib29zdC5tawo+ICsrKyBiL3BhY2thZ2UvYm9vc3QvYm9vc3QubWsK
PiBAQCAtMTA5LDcgKzEwOSw3IEBAIGVuZGlmCj4gIAo+ICAjIEJ5IGRlZmF1bHQsIEJvb3N0IGJ1
aWxkIGFuZCBpbnN0YWxscyBib3RoIHRoZSBzaGFyZWQgYW5kIHN0YXRpYwo+ICAjIHZhcmlhbnRz
LiBPdmVycmlkZSB0aGF0IGlmIHdlIHdhbnQgc3RhdGljIG9ubHkgb3Igc2hhcmVkIG9ubHkuCj4g
LWlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICtpZmVxICgkKEJSMl9TVEFUSUNfTElCUykk
KEJSMl9QQUNLQUdFX0JPT1NUX1NUQVRJQykseSkKPiAgQk9PU1RfT1BUUyArPSBsaW5rPXN0YXRp
YyBydW50aW1lLWxpbms9c3RhdGljCgpTbyBpbiBhIEJSMl9TSEFSRURfTElCUyBjb25maWd1cmF0
aW9uLCB3ZSBlbmQgdXAgd2l0aCBzdGF0aWMgYm9vc3QgbGlicmFyaWVzPwoKV2hhdCBjb3VsZCBo
YXBwZW5zIHdpdGggcGFja2FnZXMgZXhwZWN0aW5nIGJvb3N0IHNoYXJlZCBsaWJyYXJpZXMgZHVl
IHRvCkJSMl9TSEFSRURfTElCUyBidXQgb25seSBnZXQgc3RhdGljIGJvb3N0IGxpYnJhcmllcz8K
CkFsc28gYSBzaW1pbGFyIHBlci1wYWNrYWdlIG9wdGlvbiBjb3VsZCBiZSBhZGRlZCB0byBhbGwg
cGFja2FnZXMuLi4KCkFmdGVyIGRpc2N1c3Npbmcgd2l0aCBUaG9tYXMgYW5kIEFybm91dCwgd2Ug
YXJlIG5vdCBjb252aW5jZWQgYnkgdGhpcyBwYXRjaC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAgZWxzZSBpZmVxICgkKEJSMl9TSEFSRURfTElCUykseSkKPiAgQk9PU1RfT1BUUyArPSBsaW5r
PXNoYXJlZCBydW50aW1lLWxpbms9c2hhcmVkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
