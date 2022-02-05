Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F356C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D164606D3;
	Sat,  5 Feb 2022 22:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dru-s8Gp1zxl; Sat,  5 Feb 2022 22:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 730396076C;
	Sat,  5 Feb 2022 22:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05CA21BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA1BF81CAD
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azRFQkLmZV_j for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:47:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A3D181CA3
 for <buildroot@busybox.net>; Sat,  5 Feb 2022 22:47:50 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id bx2so5096329edb.11
 for <buildroot@busybox.net>; Sat, 05 Feb 2022 14:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2doBJRauXCuyt0SM5ikKyyuurWFbMObtC1KYvFv3lFc=;
 b=gSqdhTUs/G3EI0JuYX98eOm0zyPB9KEIxFytZTOzjKI2o5WUIC6pON1jhU4o0Ryd+e
 WrxzBVZXmIGyF9riCSocWXdfyeY0P/tX46KcByCgJpg1+J2pyOf14+PsSAEKkNkpTu7o
 29ex31MBJUXrTUyTDtGOnD8qnoXkf6C19CrKesSKVd2G87e4p7Kut8I3CCZwpR57/V19
 I6jJz8AtTVxD2CFD0Kj5IkgFRvWbiq4gdHmmCaAEOn9lQEVW9ovWOGyXz75GHcf4jhro
 0yW/tkwumkqP+l7UNFEbWdVVXli3uZh/2w7jV9lDpXJqeHmnP8S7WUOe0Zn4bXFzP1Ji
 Pf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2doBJRauXCuyt0SM5ikKyyuurWFbMObtC1KYvFv3lFc=;
 b=hKKPPGIQAS9end5184GQUQcDnMED3QorDlukyjStuDtXwotLPLZ2hHvf7alp0X1C+3
 QzLmBwtDt3sgQJcUvD7sJDKOCXg4OFnodBPx2pfxDp3Nj9n8KSmU3WgxoHm/S9uctQAp
 ahNwcbAgcuHEC1SbZ1zheDwrK2eEMjFykQDlzj7wchyC72KxVr6KGc3LUz7G28Xo/Ugl
 0bGUx2Ib4n+DaHAhVEy9BADZWvQgY+WsVEvZUxdbD4qfecPHPHPZr6k8TgEEr4zsw2mb
 lzsfs+7o6ooZ0VbT1tY2PNjw543k6C5Mge94YnGQvdGIorgek6zkx8Jt1+UMrzj6r6qs
 l6Xw==
X-Gm-Message-State: AOAM530Ki7zsmPD7XyDJNyk4mkKdE/a73geYOhZQ7yKssKHzasycYaBw
 tGaoEgLVWHBCdtjZU2pS9FQOtA==
X-Google-Smtp-Source: ABdhPJwTT/4w8YWH3PlsR5xc9pKutmidvcf42wtnZ4t9U//lFyplZijkE01Zh/D3OJ/G7f1o9dgiKw==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr6423959edq.245.1644101268959; 
 Sat, 05 Feb 2022 14:47:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d23sm788258edv.79.2022.02.05.14.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:47:48 -0800 (PST)
Message-ID: <ebe3fcf1-9b86-c07d-21bd-7f58df40c853@mind.be>
Date: Sat, 5 Feb 2022 23:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220126145503.1032630-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126145503.1032630-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 1/2] package/lua: bump to version 5.4.4
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

CgpPbiAyNi8wMS8yMDIyIDE1OjU1LCBGcmFuY29pcyBQZXJyYWQgd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+CgogIEJvdGgg
YXBwbGllZCB0byBtYXN0ZXIuIEhvd2V2ZXIsIEZyYW5jzKdvaXMsIHdoZW4gdGhlIGxpY2Vuc2Ug
aGFzaCBjaGFuZ2VzLCAKcGxlYXNlIGV4cGxhaW4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdoeSBp
dCBjaGFuZ2VkLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbHVhLzUu
NC4zL2x1YS5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiAtLS0tLS0K
PiAgIHBhY2thZ2UvbHVhL3s1LjQuMyA9PiA1LjQuNH0vMDAwMS1yb290LXBhdGgucGF0Y2ggICAg
ICAgICAgIHwgMAo+ICAgcGFja2FnZS9sdWEvezUuNC4zID0+IDUuNC40fS8wMDAyLXNoYXJlZC1s
aWJzLWZvci1sdWEucGF0Y2ggfCAwCj4gICBwYWNrYWdlL2x1YS97NS40LjMgPT4gNS40LjR9LzAw
MTEtbGluZW5vaXNlLnBhdGNoICAgICAgICAgICB8IDIgKy0KPiAgIHBhY2thZ2UvbHVhLzUuNC40
L2x1YS5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKysrKysKPiAg
IHBhY2thZ2UvbHVhL2x1YS5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sdWEvNS40LjMvbHVhLmhhc2gK
PiAgIHJlbmFtZSBwYWNrYWdlL2x1YS97NS40LjMgPT4gNS40LjR9LzAwMDEtcm9vdC1wYXRoLnBh
dGNoICgxMDAlKQo+ICAgcmVuYW1lIHBhY2thZ2UvbHVhL3s1LjQuMyA9PiA1LjQuNH0vMDAwMi1z
aGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoICgxMDAlKQo+ICAgcmVuYW1lIHBhY2thZ2UvbHVhL3s1
LjQuMyA9PiA1LjQuNH0vMDAxMS1saW5lbm9pc2UucGF0Y2ggKDk3JSkKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2x1YS81LjQuNC9sdWEuaGFzaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2x1YS81LjQuMy9sdWEuaGFzaCBiL3BhY2thZ2UvbHVhLzUuNC4zL2x1YS5oYXNoCj4gZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYmUzNjA0ODM3Li4wMDAwMDAwMDAKPiAtLS0g
YS9wYWNrYWdlL2x1YS81LjQuMy9sdWEuaGFzaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw2ICsw
LDAgQEAKPiAtIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly93d3cubHVhLm9yZy9mdHAvCj4gLW1kNSAg
ZWY2M2VkMmVjZmI3MTM2NDZhN2ZjYzU4M2NmNWYzNTIgIGx1YS01LjQuMy50YXIuZ3oKPiAtc2hh
MSAgMWRkYTJlZjIzYTk4Mjg0OTJiNDU5NWMwMTk3NzY2ZGU2ZTc4NGJjNyAgbHVhLTUuNC4zLnRh
ci5nego+IC0KPiAtIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAgZDIwNWJmZWExMzExMTNi
Y2RkNjRkNGViZTRhNTBjZTM0MDYzYjQyYmFkMjRiOTNlNDRiNGIwZDg1M2FlNGQ0OSAgZG9jL3Jl
YWRtZS5odG1sCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhLzUuNC4zLzAwMDEtcm9vdC1wYXRo
LnBhdGNoIGIvcGFja2FnZS9sdWEvNS40LjQvMDAwMS1yb290LXBhdGgucGF0Y2gKPiBzaW1pbGFy
aXR5IGluZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBwYWNrYWdlL2x1YS81LjQuMy8wMDAxLXJvb3Qt
cGF0aC5wYXRjaAo+IHJlbmFtZSB0byBwYWNrYWdlL2x1YS81LjQuNC8wMDAxLXJvb3QtcGF0aC5w
YXRjaAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS81LjQuMy8wMDAyLXNoYXJlZC1saWJzLWZv
ci1sdWEucGF0Y2ggYi9wYWNrYWdlL2x1YS81LjQuNC8wMDAyLXNoYXJlZC1saWJzLWZvci1sdWEu
cGF0Y2gKPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBwYWNrYWdlL2x1YS81
LjQuMy8wMDAyLXNoYXJlZC1saWJzLWZvci1sdWEucGF0Y2gKPiByZW5hbWUgdG8gcGFja2FnZS9s
dWEvNS40LjQvMDAwMi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbHVhLzUuNC4zLzAwMTEtbGluZW5vaXNlLnBhdGNoIGIvcGFja2FnZS9sdWEvNS40LjQv
MDAxMS1saW5lbm9pc2UucGF0Y2gKPiBzaW1pbGFyaXR5IGluZGV4IDk3JQo+IHJlbmFtZSBmcm9t
IHBhY2thZ2UvbHVhLzUuNC4zLzAwMTEtbGluZW5vaXNlLnBhdGNoCj4gcmVuYW1lIHRvIHBhY2th
Z2UvbHVhLzUuNC40LzAwMTEtbGluZW5vaXNlLnBhdGNoCj4gaW5kZXggN2I5ZDZkNzZmLi42ODMx
NmUxMDggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWEvNS40LjMvMDAxMS1saW5lbm9pc2UucGF0
Y2gKPiArKysgYi9wYWNrYWdlL2x1YS81LjQuNC8wMDExLWxpbmVub2lzZS5wYXRjaAo+IEBAIC04
LDcgKzgsNyBAQCBJbmRleDogYi9zcmMvbHVhLmMKPiAgID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgIC0tLSBhL3Ny
Yy9sdWEuYwo+ICAgKysrIGIvc3JjL2x1YS5jCj4gLUBAIC00MjEsNiArNDIxLDE0IEBACj4gK0BA
IC00MjgsNiArNDI4LDE0IEBACj4gICAgI2RlZmluZSBsdWFfc2F2ZWxpbmUoTCxsaW5lKQkoKHZv
aWQpTCwgYWRkX2hpc3RvcnkobGluZSkpCj4gICAgI2RlZmluZSBsdWFfZnJlZWxpbmUoTCxiKQko
KHZvaWQpTCwgZnJlZShiKSkKPiAgICAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWEvNS40LjQv
bHVhLmhhc2ggYi9wYWNrYWdlL2x1YS81LjQuNC9sdWEuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwLi5iNTViMTdmMjUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9sdWEvNS40LjQvbHVhLmhhc2gKPiBAQCAtMCwwICsxLDYgQEAKPiArIyBIYXNoZXMg
ZnJvbTogaHR0cHM6Ly93d3cubHVhLm9yZy9mdHAvCj4gK21kNSAgYmQ4Y2U3MDY5ZmY5OWE0MDBl
ZmQxNGNmMzM5YTcyN2IgIGx1YS01LjQuNC50YXIuZ3oKPiArc2hhMSAgMDNjMjc2ODRiOWQ1ZDk3
ODNmYjc5YTdjODM2YmExY2RjNWYzMDljZCAgbHVhLTUuNC40LnRhci5nego+ICsKPiArIyBMb2Nh
bGx5IGNvbXB1dGVkCj4gK3NoYTI1NiAgMjU1NmFjNzE5ODI0M2Y5ZjgzMTMwYjljODEwMTZlMTkw
NGY3YjMwMzUxNDgxZjFjMjhlMDI0NzVkYmQyMzdmYiAgZG9jL3JlYWRtZS5odG1sCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbHVhL2x1YS5tayBiL3BhY2thZ2UvbHVhL2x1YS5tawo+IGluZGV4IDg0
NGUxNjVkZi4uMDllN2IzNGY3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhL2x1YS5tawo+ICsr
KyBiL3BhY2thZ2UvbHVhL2x1YS5tawo+IEBAIC01LDcgKzUsNyBAQAo+ICAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAgIAo+ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9MVUFfNV80KSx5KQo+IC1M
VUFfVkVSU0lPTiA9IDUuNC4zCj4gK0xVQV9WRVJTSU9OID0gNS40LjQKPiAgIGVsc2UgaWZlcSAo
JChCUjJfUEFDS0FHRV9MVUFfNV8zKSx5KQo+ICAgTFVBX1ZFUlNJT04gPSA1LjMuNgo+ICAgZWxz
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
