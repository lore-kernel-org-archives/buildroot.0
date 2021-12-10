Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F3FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6D18531B;
	Fri, 10 Dec 2021 14:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NU6EuAyF9IES; Fri, 10 Dec 2021 14:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CAC852F2;
	Fri, 10 Dec 2021 14:12:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0852A1BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E89306142E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOTbZkxMwEd6 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:12:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE2FE61431
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:12:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so6753371wmb.0
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDaSp00b/UM/VuqJOrDISqInnYm4Ocu6iEvd6nxc5IU=;
 b=udFpUQ/jA9F2bOCB/cCg4kLShzOU0QOjhkkwiCDCoW3q/zzNIQkAr+58rBeKbrduGh
 UCHNO/fQE3Pw7Uo/F8iUcKDPwR1/QOHCF/UUdlBrjRdOW3yAhWiu+QD1hIygMh5mVqSh
 YtUN43k8bq7ZY1cnPLYhF6hWyuxfYXJxcFBfyhKuCHnAnjS3/ZzAlspdW9Z5SRYBmJYa
 t3H1dN9cRihkAbiXw916Mh2fIB5V3F+fZLIiS3q2wsXNmtnspXIXmxKUvGoKSF+e7Tpc
 D1An9IxcvuC5fqcFLQXXngcFGN76FuTmRceImJcyP5pQ2KgAhzXagR/JQmzZ2qHkSsRd
 mxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDaSp00b/UM/VuqJOrDISqInnYm4Ocu6iEvd6nxc5IU=;
 b=Rqfq9JLDradAgGRJEkIP6vtCC2XW6hKFo86FmJmcuA3e2vrAoWp8c/SYk/Tv9HZDIS
 /scUmAaSK5Kb7yiFaHXslQKEKC+d65uWup5HY4H69rUpyBvHT/dHcKjMAZsOv1nFB84r
 cFIarz6ymT0al14DLe3vZrRiwaRz/vfz2gY4lGNVeDbxZIyUA3geKwyJjPWVKLemPJeQ
 IYMMFKeLndTXUEO4hez7H5v5HPTnLORZQptKbvrvijnh/wdh9NxQ/fXvDAQUM/oWd35a
 bDmjRLJxKr6AtXqk9VBN8AWep+Dq6eqdWBBcdHvQ1u+P5h7XsAqhaFr4v5VDnzr16j5x
 0m+g==
X-Gm-Message-State: AOAM530memxS8Z7+7+gKX7f4DG6eLp5ILid1fzu1fv7H5HiMjH00RAfh
 I44AGzO8Y6vYFteDZQpocWlb3+5QyhJcOruYNckzSQ==
X-Google-Smtp-Source: ABdhPJxee19VchZlNfg66DaRdgxAIlUFn6F0y/har9L/e6PCopbTfo7z187NkuccbCB5G5IHoVaKmQ==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr16795348wmk.31.1639145540126; 
 Fri, 10 Dec 2021 06:12:20 -0800 (PST)
Received: from woodpecker.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.gmail.com with ESMTPSA id r11sm2623459wrw.5.2021.12.10.06.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:12:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 16:12:06 +0200
Message-Id: <20211210141209.1812043-4-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/7] package/alfred: new package
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyAgcGF0Y2ggd2lsbCBwcm92aWRlIHRoZSBpbml0aWFsCnBhY2thZ2UgZm9yIGFsZnJlZCBw
cm9qZWN0LgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVu
QHVuaWtpZS5jb20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvYWxmcmVkL0NvbmZpZy5pbiAg
IHwgMjAgKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvYWxmcmVkL2FsZnJlZC5oYXNoIHwg
IDQgKysrKwogcGFja2FnZS9hbGZyZWQvYWxmcmVkLm1rICAgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2FsZnJlZC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2FsZnJlZC9hbGZyZWQuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYWxmcmVk
L2FsZnJlZC5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGUz
ZTQ4NTIyYWEuLjBlNGRiODM1ZDMgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxP
UEVSUwpAQCAtMTQ2NCw2ICsxNDY0LDcgQEAgRjoJcGFja2FnZS96ZnMvCiBGOglzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQogCiBOOglKb3PDqSBQZWtrYXJpbmVuIDxq
b3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KK0Y6CXBhY2thZ2UvYWxmcmVkLwogRjoJcGFja2Fn
ZS9ibXg3LwogRjoJcGFja2FnZS9taW5pamFpbC8KIEY6CXBhY2thZ2Uvb3BlbnNjLwpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA1NWJhMGRl
ZDEzLi5iODU3ZTE4OTc2IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNr
YWdlL0NvbmZpZy5pbgpAQCAtMjExMiw2ICsyMTEyLDcgQEAgZW5kbWVudQogCiBtZW51ICJOZXR3
b3JraW5nIGFwcGxpY2F0aW9ucyIKIAlzb3VyY2UgInBhY2thZ2UvYWlyY3JhY2stbmcvQ29uZmln
LmluIgorCXNvdXJjZSAicGFja2FnZS9hbGZyZWQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9hb2V0b29scy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2FwYWNoZS9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL2FyZ3VzL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
YWxmcmVkL0NvbmZpZy5pbiBiL3BhY2thZ2UvYWxmcmVkL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZjljNmYyYTZlCi0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9hbGZyZWQvQ29uZmlnLmluCkBAIC0wLDAgKzEsMjAgQEAKK2NvbmZpZyBCUjJfUEFD
S0FHRV9BTEZSRUQKKwlib29sICJhbGZyZWQiCisJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJT
ICMgZGxvcGVuKCkKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTkwKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfTElCQ0FQCisJc2VsZWN0IEJSMl9QQUNLQUdFX0dQU0QKKwloZWxwCisJICBBbGZyZWQgaXMg
YSB1c2VyIHNwYWNlIGRhZW1vbiBmb3IgZGlzdHJpYnV0aW5nCisJICBhcmJpdHJhcnkgbG9jYWwg
aW5mb3JtYXRpb24gb3ZlciB0aGUgbWVzaC9uZXR3b3JrIGluCisJICBhIGRlY2VudHJhbGl6ZWQg
ZmFzaGlvbi4KKwkgIFRoaXMgZGF0YSBjYW4gYmUgYW55dGhpbmcgd2hpY2ggYXBwZWFycyB0byBi
ZSB1c2VmdWwKKwkgIC0gb3JpZ2luYWxseSBkZXNpZ25lZCB0byByZXBsYWNlIHRoZSBiYXRtYW4t
YWR2CisJICB2aXN1YWxpemF0aW9uICh2aXMpLCB5b3UgbWF5IGRpc3RyaWJ1dGUgaG9zdG5hbWVz
LAorCSAgcGhvbmUgYm9va3MsIGFkbWluaXN0cmF0aW9uIGluZm9ybWF0aW9uLCBETlMKKwkgIGlu
Zm9ybWF0aW9uLCB0aGUgbG9jYWwgd2VhdGhlciBmb3JlY2FzdCAuLi4KKworCSAgaHR0cHM6Ly93
d3cub3Blbi1tZXNoLm9yZy9wcm9qZWN0cy9hbGZyZWQvd2lraQorCitjb21tZW50ICJhbGZyZWQg
bmVlZHMgYSB0b29sY2hhaW4gd2l0aCBkeW5hbWljIGxpYnJhcnkgc3VwcG9ydCIKKwlkZXBlbmRz
IG9uIEJSMl9TVEFUSUNfTElCUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbGZyZWQvYWxmcmVkLmhh
c2ggYi9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi5hMmRkMDExNmQ3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9hbGZy
ZWQvYWxmcmVkLmhhc2gKQEAgLTAsMCArMSw0IEBACisjIEZyb20gaHR0cHM6Ly9kb3dubG9hZHMu
b3Blbi1tZXNoLm9yZy9iYXRtYW4vc3RhYmxlL3NvdXJjZXMvYWxmcmVkCitzaGEyNTYgIDRjNzli
NmM0NWRlNGJjYzhjYmZlNjRjYmE5YTBmOGI0ZWYzMDRjYTg0YzE5NDYyMmYyYmZhNDFlMDFlMmNi
OTUgIGFsZnJlZC0yMDIxLjQudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgY2Vj
YmY1M2QxMTQ4ZTEzMjU2YWMyOWY4YjkwMDY1NWI3ZmM4ZGMxMmQ1OTkzOWE5NWJjMjMyM2VhMTc0
NzAyNSAgTElDRU5TRVMvcHJlZmVycmVkL0dQTC0yLjAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWxm
cmVkL2FsZnJlZC5tayBiL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5tawpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi40ZTM4ZGRhZDkyCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9hbGZyZWQvYWxmcmVkLm1rCkBAIC0wLDAgKzEsMjUgQEAKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisjCisjIGFsZnJlZAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworQUxGUkVE
X1ZFUlNJT04gPSAyMDIxLjQKK0FMRlJFRF9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZHMub3Blbi1t
ZXNoLm9yZy9iYXRtYW4vc3RhYmxlL3NvdXJjZXMvYWxmcmVkCitBTEZSRURfTElDRU5TRSA9IEdQ
TC0yCitBTEZSRURfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0VTL3ByZWZlcnJlZC9HUEwtMi4wCitB
TEZSRURfREVQRU5ERU5DSUVTID0gbGlibmwgbGliY2FwIGdwc2QKKworZGVmaW5lIEFMRlJFRF9C
VUlMRF9DTURTCisJKGNkICQoQEQpOyBcCisJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMg
JChARCkvJChkKSBDQz0iJChUQVJHRVRfQ0MpIikKK2VuZGVmCisKK2RlZmluZSBBTEZSRURfSU5T
VEFMTF9UQVJHRVRfQ01EUworCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS9hbGZyZWQgXAor
CQkkKFRBUkdFVF9ESVIpL3Vzci9iaW4vYWxmcmVkCisJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQo
QEQpL3Zpcy9iYXRhZHYtdmlzIFwKKwkJJChUQVJHRVRfRElSKS91c3IvYmluL2JhdGFkdi12aXMK
K2VuZGVmCisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjMwLjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
