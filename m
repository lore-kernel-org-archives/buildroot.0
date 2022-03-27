Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F74C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCEF81B60;
	Sun, 27 Mar 2022 15:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4PHzpreweXW; Sun, 27 Mar 2022 15:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2920E81B35;
	Sun, 27 Mar 2022 15:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A52221BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92B2B40133
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOFoXe9Tho0b for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:40:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6790940104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:40:10 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bi12so24047868ejb.3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=kI/nNFSicU3t+Kx87md2VNfHOm9u8w8DecsI7dzLqFw=;
 b=PuadV6tbEv4akRsXQTEi1X4fp9ioTNhi7PN86fagD8tz2raGx6y6EHQdzU8a4JJh8i
 VTqVlzJwkek3k9vx/22Wd/ghs2PJF5A6xR65fQAjKkq+7haIFj9lt4m1OmY9tiUGEui0
 AeLLEQ8kT6lh38t1ERi4MtYX1qx1SmpJyCrlGzALsDClRqllVS7q23OToE1mjW8xekY3
 9dywysjk8+i/jXVR8xsSyugtiU3NKH94CGQ3mimvstRG8kDSK7/s0uCbbQFSrIQhQ+ve
 9RCZYEM5DRMjKQ8OATkB3Odgdsjr4akQVj6rWB3AXtf/z/p6VUm/wkxTMVSQsdp0mTfx
 dAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kI/nNFSicU3t+Kx87md2VNfHOm9u8w8DecsI7dzLqFw=;
 b=W5qwXQhsh+gtRYAF8gmhGy3UNAgirZBwwJrohJERAHmKXqABUfC2+j4Hwvnc96f90o
 tZICFs1UELUSbfWz+34lUdpdJy1R9g4Jhpp5WSggYVO/UTj4hTpptGqiWFigkP1K4AV8
 2FKhNJ99+fP4Nh6xG4zO/r8Zp6ayP7TM9Ez5zUpZxCmkUppDxf+tnwFe4R94zIBHoBdU
 qBSOVhUCGzfOw4YDR72ycbAcZKm09PUoun6PBWj///41+N60XersDqbkqNiiZ0A6XoY7
 u151igtu4cj8usLX40OciSzSucuaMNq2XjT7FzIRot0LI17j7hV+iWosfj86CcJzx2MC
 yyJA==
X-Gm-Message-State: AOAM53301kulwQQc6qsWf8Z7GAza1m9sPB6YTVEFGAmfjdw/lNsRXsoz
 aTT4EGeoj8oY94Au96hA5lOjyD6AWEuHGQ==
X-Google-Smtp-Source: ABdhPJzn5MZ8KO/UAHQIf+7wm/mns75WxzIL/c2O7NdzERpKGy2cGw5t8Ab86Kb44Q9oEqeNlsk+/A==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id
 di7-20020a170906730700b006da92e19c83mr22759297ejc.459.1648395608655; 
 Sun, 27 Mar 2022 08:40:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 sa32-20020a1709076d2000b006df935924c1sm4719298ejc.59.2022.03.27.08.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:40:08 -0700 (PDT)
Message-ID: <912d932f-0aed-0c9c-b35f-935b7177e812@mind.be>
Date: Sun, 27 Mar 2022 17:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220318131058.32240-1-ps.report@gmx.net>
 <20220318131058.32240-2-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318131058.32240-2-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libcamera-apps: add
 '-fpermissive' (fixes X11 preview compile)
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

CgpPbiAxOC8wMy8yMDIyIDE0OjEwLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiAtIGFkZCBwYXRj
aCB0byBhZGQgJy1mcGVybWlzc2l2ZScgY29tcGlsZXIgY29tbWFuZCBsaW5lIG9wdGlvbiB0byBm
aXgKPiAgICBlZ2xfcHJldmlldy5jcHAgY29tcGlsZQo+IAo+IEZpeGVzOgo+IAo+ICAgIC4uLi9i
dWlsZC9saWJjYW1lcmEtYXBwcy0yZDEwMDllM2JhZGNjODA0NzM2MWZmODExNDlhZDZjYmEzYjkx
MWI1L3ByZXZpZXcvZWdsX3ByZXZpZXcuY3BwOjMyOTo2OTogZXJyb3I6IGludmFsaWQgY29udmVy
c2lvbiBmcm9tIOKAmFdpbmRvd+KAmSB7YWthIOKAmGxvbmcgdW5zaWduZWQgaW504oCZfSB0byDi
gJhFR0xOYXRpdmVXaW5kb3dUeXBl4oCZIHtha2Eg4oCYZmJkZXZfd2luZG93KuKAmX0gWy1mcGVy
bWlzc2l2ZV0KPiAgICAgIDMyOSB8ICAgICAgICAgZWdsX3N1cmZhY2VfID0gZWdsQ3JlYXRlV2lu
ZG93U3VyZmFjZShlZ2xfZGlzcGxheV8sIGNvbmZpZywgd2luZG93XywgTlVMTCk7Cj4gICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn4KPiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+ICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBXaW5kb3cge2FrYSBsb25nIHVuc2lnbmVkIGludH0KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gLS0tCj4gICAu
Li5taXNzaXZlLWNvbXBpbGVyLWNvbW1hbmQtbGluZS1vcHRpb24ucGF0Y2ggfCAzNyArKysrKysr
KysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliY2FtZXJhLWFwcHMvMDAwMi1jbWFrZS1hZGQtZnBl
cm1pc3NpdmUtY29tcGlsZXItY29tbWFuZC1saW5lLW9wdGlvbi5wYXRjaAo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzLzAwMDItY21ha2UtYWRkLWZwZXJtaXNzaXZlLWNv
bXBpbGVyLWNvbW1hbmQtbGluZS1vcHRpb24ucGF0Y2ggYi9wYWNrYWdlL2xpYmNhbWVyYS1hcHBz
LzAwMDItY21ha2UtYWRkLWZwZXJtaXNzaXZlLWNvbXBpbGVyLWNvbW1hbmQtbGluZS1vcHRpb24u
cGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjBiZmM3ZTFh
ZDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJjYW1lcmEtYXBwcy8wMDAyLWNt
YWtlLWFkZC1mcGVybWlzc2l2ZS1jb21waWxlci1jb21tYW5kLWxpbmUtb3B0aW9uLnBhdGNoCj4g
QEAgLTAsMCArMSwzNyBAQAo+ICtGcm9tIGIwNDc3N2U2YjM4NmVkMGM2YjEwMzZkNGMxMTc4YjRi
OGExYzg4ZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFBldGVyIFNlaWRlcmVy
IDxwcy5yZXBvcnRAZ214Lm5ldD4KPiArRGF0ZTogRnJpLCAxOCBNYXIgMjAyMiAxMjozOToyNyAr
MDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiBhZGQgLWZwZXJtaXNzaXZlIGNvbXBpbGVy
IGNvbW1hbmQgbGluZSBvcHRpb24KPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKPiArCj4gK0ZpeGVzICh3aXRoIGJvb3RsaW4gYXJtIHRvb2xjaGFpbik6Cj4gKwo+ICsg
IC4uLi9idWlsZC9saWJjYW1lcmEtYXBwcy0yZDEwMDllM2JhZGNjODA0NzM2MWZmODExNDlhZDZj
YmEzYjkxMWI1L3ByZXZpZXcvZWdsX3ByZXZpZXcuY3BwOjMyOTo2OTogZXJyb3I6IGludmFsaWQg
Y29udmVyc2lvbiBmcm9tIOKAmFdpbmRvd+KAmSB7YWthIOKAmGxvbmcgdW5zaWduZWQgaW504oCZ
fSB0byDigJhFR0xOYXRpdmVXaW5kb3dUeXBl4oCZIHtha2Eg4oCYZmJkZXZfd2luZG93KuKAmX0g
Wy1mcGVybWlzc2l2ZV0KPiArICAgIDMyOSB8ICAgICAgICAgZWdsX3N1cmZhY2VfID0gZWdsQ3Jl
YXRlV2luZG93U3VyZmFjZShlZ2xfZGlzcGxheV8sIGNvbmZpZywgd2luZG93XywgTlVMTCk7Cj4g
KyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KPiArICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+
ICsgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBXaW5kb3cge2FrYSBsb25nIHVuc2lnbmVkIGludH0KPiAr
Cj4gK1NpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAr
LS0tCj4gKyBDTWFrZUxpc3RzLnR4dCB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0
IGIvQ01ha2VMaXN0cy50eHQKPiAraW5kZXggMWNhMWUzOS4uZWRkZGExZiAxMDA2NDQKPiArLS0t
IGEvQ01ha2VMaXN0cy50eHQKPiArKysrIGIvQ01ha2VMaXN0cy50eHQKPiArQEAgLTExLDcgKzEx
LDcgQEAgZW5kaWYoKQo+ICsKPiArIHNldCAoQ01BS0VfRVhQT1JUX0NPTVBJTEVfQ09NTUFORFMg
T04pCj4gKyBzZXQgKENNQUtFX0NYWF9TVEFOREFSRCAxNykKPiArLWFkZF9jb21waWxlX29wdGlv
bnMoLVdhbGwgLVdleHRyYSAtcGVkYW50aWMgLVduby11bnVzZWQtcGFyYW1ldGVyIC1mYWxpZ25l
ZC1uZXcpCj4gKythZGRfY29tcGlsZV9vcHRpb25zKC1XYWxsIC1XZXh0cmEgLXBlZGFudGljIC1X
bm8tdW51c2VkLXBhcmFtZXRlciAtZmFsaWduZWQtbmV3IC1mcGVybWlzc2l2ZSkKCiAgVGhpcyBw
YXRjaCBpcyBtb3N0IGxpa2VseSBub3QgdXBzdHJlYW1hYmxlIChhbmQgSSBpbmRlZWQgY2FuJ3Qg
ZmluZCB5b3VyIAp1cHN0cmVhbSBQUikuIEl0IHdvdWxkIGJlIG11Y2ggYmV0dGVyIHRvIHNpbXBs
eSBmaXggdGhlIHVuZGVybHlpbmcgaXNzdWUgYW5kIAp1cHN0cmVhbSB0aGF0LiBTaG91bGQgYmUg
c2ltcGxlIGVub3VnaCwganVzdCBhZGQgYSBjYXN0LgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAr
IGFkZF9kZWZpbml0aW9ucygtRF9GSUxFX09GRlNFVF9CSVRTPTY0KQo+ICsKPiArIGlmIChDTUFL
RV9DT01QSUxFUl9JU19HTlVDWFgpCj4gKy0tCj4gKzIuMzUuMQo+ICsKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
