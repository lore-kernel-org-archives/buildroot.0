Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A7BC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C06184704;
	Sat,  1 Jun 2024 20:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAq4_gYByz38; Sat,  1 Jun 2024 20:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4027820C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F4027820C3;
	Sat,  1 Jun 2024 20:22:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A99B1BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 660CD404D8
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBxCCSZomziq for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 20:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46EA0404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EA0404C2
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46EA0404C2
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 20:22:42 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-24c9f892aeaso1734912fac.2
 for <buildroot@buildroot.org>; Sat, 01 Jun 2024 13:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717273361; x=1717878161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bN7JaL6kJ069hyjQr7DEWGe9kciXGmR3oFnBoSCpzfU=;
 b=MpWLvdhAhpeTbVJc+BpQGLTqvEuQaEBA7wuP10W5BuarRBQ848Zeit0dG2ZrHKHA/c
 0XziXdt3XeXndNstgU9FoU5ziR3xbbVhIVsRMxL4LG5Xo6sIkGSKZIgEalYkv1yMPpOt
 Dilo1SzwxbiEkWuHNIMz/LZa5aeLT3WHngNuoVcV1SeOTQ6WS+7LAgEzPhQVWMCcUh1r
 8yFdCjWLW+TwyTgXgzTlO9B+rDlq1g6PbH6o+MssrKrPc3PCBEYiDKFCEYCrkWcTsP1G
 ahi+qeY5SJoNz564PJnmQYzmLILSVG9HXZVoLe6Qj/u0zZluEUjB2NxBqOOWl5lC7FmX
 J3QQ==
X-Gm-Message-State: AOJu0Yzk1dbZFG0iMgGn0en9m47NDRzofmITiXP4DDVR6ddG30vim8YA
 CZQ/0xOLfwge1IvcEroT4TGbsZ9XwSJAP7RSCk1CilPGkfuK7k2fFEtE3K0w0pLr8+SEVfvHEsL
 DvQxTcs1hQqU7DiMf8c0LzutQhhM=
X-Google-Smtp-Source: AGHT+IGXT/Pkl3cWFfpbbgJ30mmHxhsxOPr/05xcetN7fV1oUl14UTeB49Ea3TW1Ty3q1YqXvM7KtQ7Pdg2VOGPg9x0=
X-Received: by 2002:a05:6870:9a11:b0:21f:1705:d5b0 with SMTP id
 586e51a60fabf-2508bb80660mr6547196fac.52.1717273361064; Sat, 01 Jun 2024
 13:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240531202219.2486947-1-james.hilliard1@gmail.com>
 <Zlt-hVkDH0Aq3G-X@landeda>
In-Reply-To: <Zlt-hVkDH0Aq3G-X@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 1 Jun 2024 14:22:29 -0600
Message-ID: <CADvTj4pvo2Sy1hFVbp=4hcxA1OjucbncqEyaSaX70JAv5b3puA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717273361; x=1717878161; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bN7JaL6kJ069hyjQr7DEWGe9kciXGmR3oFnBoSCpzfU=;
 b=l/u0AQMLDVT2vxW2xjQrJ/a5ZmdLG4+OPqUeb6lu5WEHG2xLHF9mTJGqXSUrG5CAK5
 8R92yj9wq0OlippHiFEUBnSPqWsDalekmUcSu9n2isO3Qy9K51Lw7BMzhdVzbCh2y3fp
 /z9Rs9YvPAxHSO2eqZ+K+IF5jH3eXd/5pkKp95VTYYVV0lCoppBOvxLNBCNoH2SRIB8/
 R8kDNzHeIsOwnL3RV0oPa7NuEkGLttW95BkqbUGeFafjLbM7F/qHXt2qxFJEK9FaUkAK
 Xxi5RmJQTjpPOPwDSIbPITanVcNialS0K6ISI+kE9PHJ8WZY7jKn/8QE+JT/ZLBgKH7h
 CtJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l/u0AQML
Subject: Re: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBKdW4gMSwgMjAyNCBhdCAyOjAz4oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDUtMzEg
MTQ6MjIgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IEFkZCBuZXcgaG9z
dC1nb2JqZWN0LWludHJvc3BlY3Rpb24gZGVwZW5kZW5jeS4KPgo+IEkgY2FuIGVhc2lseSBzZWUg
dGhhdCBuZXcgZGVwZW5kZW5jeSBpbiB0aGUgZGlmZjsgc2F5aW5nIHNvIGluIHRoZQo+IGNvbW1p
dCBsb2cgaXMgbm90IHNvIHVzZWZ1bGwgYnV0IHRvIGV4cGxhaW4gd2h5IGl0IGlzIG5vdyBuZWVk
ZWQ6Cj4gZXhwbGFpbiwgZG9uJ3QgZGVzY3JpYmUuCj4KPiBTbywgd2h5IGlzIHRoaXMgbWlub3Ig
dmVyc2lvbiBidW1wIG5vdyByZXF1aXJpbmcgaG9zdC1HT0k/CgpXZWxsIHRoZSByZXF1aXJlbWVu
dCB3YXMgYWRkZWQgaGVyZSwgc28gaXQgc2VlbXMgdG8gb25seSBiZSB1c2VkCmZvciBmaW5kaW5n
IGdpcmRpcjoKCnZhbGE6IEZvbGxvdyB0aGUgbG9naWMgb2YgR0lyUGFyc2VyLmxvY2F0ZV9naXIo
KSB0byBmaW5kIGdpciBmaWxlcwpodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvdmFsYS8t
L2NvbW1pdC9hOWQzODA3MGNlODZkNzk5NGI5NDlmN2NiNDI2ZmJmNjcwYTk1M2Q4CgpUaGVyZSdz
IHNvbWUgbW9yZSBiYWNrZ3JvdW5kIGhlcmUgb24gdGhpcyBpc3N1ZSBhbHRob3VnaCBpdCdzCnNv
bWV3aGF0IHVuY2xlYXIgd2hhdCB0aGUgYnVpbGRyb290IGltcGxpY2F0aW9ucyBhcmUgZXhhY3Rs
eSBhcwpvdXIgR09JIGludGVncmF0aW9uIGlzIHJhdGhlciBjb21wbGV4OgoKaHR0cHM6Ly9naXRs
YWIuZ25vbWUub3JnL0dOT01FL3ZhbGEvLS9pc3N1ZXMvMTUxOAoKQnkgdGhlIHdheSB0aGlzIHVw
ZGF0ZSBoYXBwZW5zIHRvIGZpeCBzb21lIGJ1aWxkIGlzc3VlcyB3aXRoIEdDQyAxNCwKYWx0aG91
Z2ggdGhhdCBhcHBlYXJzIHRvIGJlIHVucmVsYXRlZCB0byB0aGUgaG9zdC1HT0kgZGVwZW5kZW5j
eToKCmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzRhNi80YTYwMGYwMzlh
ZDU3MjlhM2ZiMTMxNjk4Y2NkZTUxMzJiMzEzOWFlL2J1aWxkLWVuZC5sb2cKCj4KPiBSZWdhcmRz
LAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS92YWxhL3ZhbGEu
aGFzaCB8IDQgKystLQo+ID4gIHBhY2thZ2UvdmFsYS92YWxhLm1rICAgfCA4ICsrKysrKy0tCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdmFsYS92YWxhLmhhc2ggYi9wYWNrYWdlL3ZhbGEvdmFs
YS5oYXNoCj4gPiBpbmRleCBiMzcxNmYwODU0Li5hMTY4NzVhYzZhIDEwMDY0NAo+ID4gLS0tIGEv
cGFja2FnZS92YWxhL3ZhbGEuaGFzaAo+ID4gKysrIGIvcGFja2FnZS92YWxhL3ZhbGEuaGFzaAo+
ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3Jn
L3NvdXJjZXMvdmFsYS8wLjU2L3ZhbGEtMC41Ni4xNC5zaGEyNTZzdW0KPiA+IC1zaGEyNTYgIDkz
ODJjMjY4Y2E5YmRjMDJhYWVkYzgxNTJhOTgxOGJmMzkzNTI3MzA0MWY2MjljNTZkZTQxMGUzNjBh
M2Y1NTcgIHZhbGEtMC41Ni4xNC50YXIueHoKPiA+ICsjIEZyb20gaHR0cHM6Ly9kb3dubG9hZC5n
bm9tZS5vcmcvc291cmNlcy92YWxhLzAuNTYvdmFsYS0wLjU2LjE3LnNoYTI1NnN1bQo+ID4gK3No
YTI1NiAgMjYxMDBjNGU0ZWYwMDQ5YzYxOTI3NWYxNDBkOTdjZjU2NTg4M2QwMGM3NTQzYzgyYmNj
ZTVhNDI2OTM0ZWQ2YSAgdmFsYS0wLjU2LjE3LnRhci54ego+ID4gICMgTG9jYWxseSBjb21wdXRl
ZAo+ID4gIHNoYTI1NiAgNWRmMDcwMDcxOTg5ODljNjIyZjVkNDFkZThkNzAzZTdiZWYzZDBlNzlk
NjJlMjQzMzJlZTczOWE0NTJhZjYyYSAgQ09QWUlORwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
dmFsYS92YWxhLm1rIGIvcGFja2FnZS92YWxhL3ZhbGEubWsKPiA+IGluZGV4IDQxNWQ5OTZmYWEu
LjdhZWJkNGYzOTUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3ZhbGEvdmFsYS5tawo+ID4gKysr
IGIvcGFja2FnZS92YWxhL3ZhbGEubWsKPiA+IEBAIC01LDE0ICs1LDE4IEBACj4gPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAgVkFMQV9WRVJTSU9OX01BSk9SID0gMC41Ngo+ID4g
LVZBTEFfVkVSU0lPTiA9ICQoVkFMQV9WRVJTSU9OX01BSk9SKS4xNAo+ID4gK1ZBTEFfVkVSU0lP
TiA9ICQoVkFMQV9WRVJTSU9OX01BSk9SKS4xNwo+ID4gIFZBTEFfU0lURSA9IGh0dHA6Ly9kb3du
bG9hZC5nbm9tZS5vcmcvc291cmNlcy92YWxhLyQoVkFMQV9WRVJTSU9OX01BSk9SKQo+ID4gIFZB
TEFfU09VUkNFID0gdmFsYS0kKFZBTEFfVkVSU0lPTikudGFyLnh6Cj4gPiAgVkFMQV9MSUNFTlNF
ID0gTEdQTC0yLjErCj4gPiAgVkFMQV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gIFZBTEFf
Q1BFX0lEX1ZFTkRPUiA9IGdub21lCj4gPgo+ID4gLUhPU1RfVkFMQV9ERVBFTkRFTkNJRVMgPSBo
b3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWxpYmdsaWIyCj4gPiArSE9TVF9WQUxBX0RFUEVOREVO
Q0lFUyA9IFwKPiA+ICsgICAgIGhvc3QtYmlzb24gXAo+ID4gKyAgICAgaG9zdC1mbGV4IFwKPiA+
ICsgICAgIGhvc3QtZ29iamVjdC1pbnRyb3NwZWN0aW9uIFwKPiA+ICsgICAgIGhvc3QtbGliZ2xp
YjIKPiA+ICAjIFllcywgdGhlIGF1dG9jb25mIHNjcmlwdCB1bmRlcnN0YW5kcyAnOicgYXMgInhz
bHRwcm9jIGlzIG5vdAo+ID4gICMgYXZhaWxhYmxlIi4KPiA+ICBIT1NUX1ZBTEFfQ09ORl9FTlYg
PSBhY19jdl9wYXRoX1hTTFRQUk9DPToKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
