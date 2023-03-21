Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCF5C74A5B
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 09:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D410A610E2;
	Tue, 21 Mar 2023 09:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D410A610E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vo5O4GCQ3O7T; Tue, 21 Mar 2023 09:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE61610D9;
	Tue, 21 Mar 2023 09:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE61610D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2A7A1BF2A3
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 09:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8B3B4185E
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 09:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B3B4185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6H87MIaDfyQ for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 09:22:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD6A41854
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFD6A41854
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 09:22:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i5so10063149eda.0
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 02:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679390522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/l2WNJwvKtIxxaydf011h5+O/BDorcfufpIiQ5Lutw4=;
 b=GdAZSw3unpUfbS0T07y3YfzjP57OvSsgdRUw3zd4Pbt3bI5mm+1gjj8vvtik5bLBvk
 ZSUgGnX3PkgrE+tVp+/Y4d64q6qBWQHFtFLVua4IfwxsY3oEf26hUonGJVnP6O01IZ7i
 p42wU+P9o/723I4XlB++0qFh915ojSlVfoTwAk+tEZy3TO05BstbG/159djmL4836Ups
 76n8fJiRAwSbyCo143pAVq8QndOZlEbxRSmwHXLpvkVeSSfwBFoBhifeKuHY6Bw1O0W0
 kAxiIAs/OSbW/kwcmgS96y9AG4jwmjrNSALaYueJ05GEXmFX4T+SbTf/xnTi6ojyYFUL
 msjg==
X-Gm-Message-State: AO0yUKXm2HTYZ0cIglURGm5K/OpIUzimx6D6l1jcuMQhNv3ATNubxqbm
 ym3MTto6VPUmD+X0cGlDGlsk//551RRg4b5elJrb+w==
X-Google-Smtp-Source: AK7set8VHi1U9k+RO8EXIlbUig8weG8JOnbdvQ3OcN6YuJqi7v875dG9jjZRmKdKOzSXqL8tR09dEQ==
X-Received: by 2002:a17:906:5957:b0:92f:33ca:c9a3 with SMTP id
 g23-20020a170906595700b0092f33cac9a3mr2531142ejr.71.1679390522683; 
 Tue, 21 Mar 2023 02:22:02 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004af62273b66sm5923475edj.18.2023.03.21.02.21.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 02:21:54 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id ek18so56976154edb.6
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 02:21:51 -0700 (PDT)
X-Received: by 2002:a50:9507:0:b0:4fa:5b7d:ebb4 with SMTP id
 u7-20020a509507000000b004fa5b7debb4mr1247949eda.7.1679390511164; Tue, 21 Mar
 2023 02:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230319194403.450205-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230319194403.450205-1-giulio.benetti@benettiengineering.com>
Date: Tue, 21 Mar 2023 02:21:40 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rrXSmdQVfGWGQR3wSXtG6fHQVrriNN74fbxiGc4t+8=Q@mail.gmail.com>
Message-ID: <CA+h8R2rrXSmdQVfGWGQR3wSXtG6fHQVrriNN74fbxiGc4t+8=Q@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1679390522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/l2WNJwvKtIxxaydf011h5+O/BDorcfufpIiQ5Lutw4=;
 b=iO3TCqNK5WfFsVu+wOKi+f+1JJf8E2HsLSddNBXQ1lA7Mr0OAimArYZANFpnMQN1Ie
 kJHNNt4RoR2ppGL+PqY+YA6PoCG8TSaLmysoSN9i7/eYydmpUYrOoKPgivAqgSVzeHiE
 GLxomLUlzi9PEoe81Sb8qskfovavq4/PN81yZZ9vB16wRlAdVyteEjPdMvKzYXQjJmCF
 nlw0AEZ6Adq9kB6mJ54ueWn6lw9SpzaVooYdewSoExxLkeubDNkN7+gUG5wQ9Dx7vI+6
 3ZpGw0JMrinMdKFp4qDZLOyUMnVicMoP8OJ9CnHAlf0apQ4gM1dOo8RUOyDT6zMAT/2x
 jy+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=iO3TCqNK
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2023-03-19 on main branch
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKCgpPbiBTdW4sIE1hciAxOSwgMjAyMyBhdCAxMjo0NOKAr1BNIEdpdWxpbyBC
ZW5ldHRpCjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiBX
aXRoIHRoaXMgYnVtcCBMaW51eCA2LjMgaXMgc3VwcG9ydGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4g
LS0tCj4gIHBhY2thZ2UvcnRsODgyMWN1L3J0bDg4MjFjdS5oYXNoIHwgNCArKy0tCj4gIHBhY2th
Z2UvcnRsODgyMWN1L3J0bDg4MjFjdS5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J0
bDg4MjFjdS9ydGw4ODIxY3UuaGFzaCBiL3BhY2thZ2UvcnRsODgyMWN1L3J0bDg4MjFjdS5oYXNo
Cj4gaW5kZXggZTJkODNhZGMwZi4uNDU0NjBkNmQxMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3J0
bDg4MjFjdS9ydGw4ODIxY3UuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcnRsODgyMWN1L3J0bDg4MjFj
dS5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1
NiAgMWQwOTBkYTI5MmMzZjkzMjI2MDM4NDY0NjdhODAyNzg2NzAyMTFmY2RlMzM1NGRjYWJmZTMy
YzQ0OTk5MjQ5MyAgcnRsODgyMWN1LTY5YzkwM2I3NWJkZTM2MjkzYzY2YjI1YzA1MTkxNmE3NGRi
YWRmNTgudGFyLmd6Cj4gLXNoYTI1NiAgYWY1NGQwMGVmYzU3Y2ZjZTY2NDE3MWFjOGJlMmEyMGMw
ZjI5MGIxYjVjMWE2N2JiMmViYTdiNjM4MDI3NmM0ZSAgTElDRU5TRQo+ICtzaGEyNTYgIDMyNTg5
YzNhYzNmZmRlNmRlM2VjYWNhODM1NzBhYjA3YTJiOTJhNjZlMzI2NTI5NGIwNDY5Mzc1YjAwN2E0
ODAgIHJ0bDg4MjFjdS04MDc4MWRlMzc2MDA3ZWNkNzc4ZGZiMmJlZjA1NTMzZTNhNmNjN2M2LnRh
ci5nego+ICtzaGEyNTYgIDIyY2RiMGE5Y2Y0OTJkYmYwNWM1YjI3MzgxYTVjMGU3M2FlMGQ0NjIy
NDI3YjUyMmIwYmE5MmI3NDk1ZTVmYjAgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9y
dGw4ODIxY3UvcnRsODgyMWN1Lm1rIGIvcGFja2FnZS9ydGw4ODIxY3UvcnRsODgyMWN1Lm1rCj4g
aW5kZXggNWE5MzM3NmMyMC4uOTUzZGExZjAxYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3J0bDg4
MjFjdS9ydGw4ODIxY3UubWsKPiArKysgYi9wYWNrYWdlL3J0bDg4MjFjdS9ydGw4ODIxY3UubWsK
PiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVJU
TDg4MjFDVV9WRVJTSU9OID0gNjljOTAzYjc1YmRlMzYyOTNjNjZiMjVjMDUxOTE2YTc0ZGJhZGY1
OAo+ICtSVEw4ODIxQ1VfVkVSU0lPTiA9IDgwNzgxZGUzNzYwMDdlY2Q3NzhkZmIyYmVmMDU1MzNl
M2E2Y2M3YzYKPiAgUlRMODgyMUNVX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG1vcnJvd25yLDg4MjFj
dS0yMDIxMDkxNiwkKFJUTDg4MjFDVV9WRVJTSU9OKSkKPiAgUlRMODgyMUNVX0xJQ0VOU0UgPSBH
UEwtMi4wCj4gIFJUTDg4MjFDVV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQoKClJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQHBhcmFsLmluPgoKVGhhbmtzIQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
