Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB0C7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A5582064;
	Sun, 29 Jun 2025 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBLg9I9ppxm2; Sun, 29 Jun 2025 20:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E63581EAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E63581EAE;
	Sun, 29 Jun 2025 20:09:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CCA41C9
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 20:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 372BB6101C
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 20:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_3uJHHQmfIy for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 20:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BDA261018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BDA261018
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BDA261018
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 20:09:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso824868f8f.1
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 13:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751227786; x=1751832586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oIlT6YSnGgMY5gY/SeNCuwIjxpQp5kC3J6mIFFaqFY=;
 b=DMNiSYGCoe++X95dvP7LPnY4M+mbptQQ0MCrLivlchyi5wxr1bFUiarY8YVTqTNfr8
 ZMxD9byfCmtaadb4oO2lLVtHpWId9NXbRhlue26lOsSQkXRYEWT26YILR83Dq54MkO63
 YZIrSIBcVDsfPy8frG7BVfNylZhx7PwoDrNAW+nr2Y2m203vmIedryRX2hawInkgHUYo
 7LAvrEPZo7GVREdg5arwqjYyk4wyORTpLLiF9aZRDTxCC4VV3dd5FC9TeUhQgV75YlhJ
 rUJPJ0BqlFkcuPLR7uGn+yjHKOhIx9ZkZLOJc0Iyo9mdxVFe+m3hF27FxuH89+UA5pUA
 MdWw==
X-Gm-Message-State: AOJu0YzJixbTeNy8FBkA0ZaOLKZqiBw7lsyeuByFIE8eEcggw3MjDW9X
 9hgAQEdS/xw9WwYRc7sSPp9FccfKdOqKWaT/iuEx1C1RgpP97sQXfrmWnUJiqLon9E1EkmBNp1A
 XxgbP
X-Gm-Gg: ASbGncvA/TQX81XU41gzzHk8tX3RyLaCCwah61HMVhlfoHMJgjxgdz4FH3+JXcCz62A
 0KTVqS8dDCxVyGrkQmBn22MOD3mTmtgFLd2zTGWDlXrnfY7wH/5p07cnMNbj5GcHuHmgobW3bfW
 Mbv2Ir9j4xFzBr6uQl+sTBFqwob9Gyo+LP9Jt3s/PrVMJZapArzGaBZq8cgeaQRFobszAheoVnD
 mYIIpEou6pehs5YlylDTOyG7vxERAYcfq4GYsuqO+t4Ko08qNxF7aQwG2NM0yIo7KPn4Z0VRYeT
 NPGvsnEcDVZysN/bATKKFxTYoeK5Ev4ZrBIIpNsmeEmJLddmeVXS/N6zZ4wSBm4ytBzzL3MoX+h
 NiC77x0Wr7g==
X-Google-Smtp-Source: AGHT+IEp2VygbV/USvvOo49/SlTnL83li9ZPeOKEOII7BMe/wMmLjJ4ax/W3YR6zdVfrqTnwIq/r7g==
X-Received: by 2002:a05:6000:41f4:b0:3a6:d967:380e with SMTP id
 ffacd0b85a97d-3a8f435eec8mr9303227f8f.3.1751227786205; 
 Sun, 29 Jun 2025 13:09:46 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5966csm8560949f8f.72.2025.06.29.13.09.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:09:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 22:09:17 +0200
Message-ID: <20250629200944.889177-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751227786; x=1751832586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+oIlT6YSnGgMY5gY/SeNCuwIjxpQp5kC3J6mIFFaqFY=;
 b=YwZ4ZdfPa2UE62+etyCpU9TxYHEhlWem+zKb4ZNeynADr9mrAH3Vi48uZrWbtKOd7v
 4F9zvKalhdJJZeHmaogEEgz7oWXNQ0frZ+eppAIwUQl6Qp5R18tO3iurJGYhISKG54kt
 +vO254MI9hPafcCATkcOlS3C+uHMESYWaDtD8GDL5Jqxc12vgsGAQST76niEkWrZbrLI
 YijqyDUhtGJifDKbPUARTmk2ZlncROTTVfI/35oW0ygQlEjK/Gw9sJAVTmIVed37Y+zM
 iGY3NoYicXwmGaLsWTzSPbS/Zon2E13Rn7cLO+aHn00vJbBGgUKJY9GbUca0fpynJrQS
 DYxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YwZ4ZdfP
Subject: [Buildroot] [PATCH 1/1] package/kvmtool: fix build failure w/ musl
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

VGhlIGZvbGxvd2luZyBlcnJvciBvY2N1cnMgb24gdGhlIGF1dG9idWlsZGVyIGZvciBidWlsZHMg
d2l0aCBtdXNsCmxpYmMuCgpgYGAKICBDQyAgICAgICB1dGlsL2JpdG1hcC5vCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4L2JpdG1hcC5oOjcsCiAgICAgICAgICAgICAgICAgZnJv
bSB1dGlsL2JpdG1hcC5jOjk6CmluY2x1ZGUvbGludXgvYml0b3BzLmg6NDoxMDogZmF0YWwgZXJy
b3I6IGJpdHMvd29yZHNpemUuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogICAgNCB8ICNp
bmNsdWRlIDxiaXRzL3dvcmRzaXplLmg+CiAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn4KYGBgCgpUaGUgZXJyb3Igb2NjdXJzIGJlY2F1c2UgYml0cy93b3Jkc2l6ZS5oIGlzIHNwZWNp
ZmljIHRvIGdsaWJjLgoKVGhpcyBwYXRjaCBhcHBsaWVzIGFuIHVwc3RyZWFtIGZpeCB0aGF0IHJl
cGxhY2VzIHRoZSB1c2Ugb2YgX19XT1JEU0laRQp3aXRoIGFuIGludGVybmFsIG1hY3JvLCBtYWtp
bmcgdGhlIGNvZGUgcG9ydGFibGUgYWNyb3NzIGRpZmZlcmVudCBsaWJjLgoKRml4ZXM6IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zMGQvMzBkNmU0MDdlNmEwZmM3ZDg1
MDYyYzJkNTYwMDg3NTVjNzBjYTczMy9idWlsZC1lbmQubG9nClNpZ25lZC1vZmYtYnk6IFRob21h
cyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KLS0tCiAuLi5lLWgtaW5jbHVzaW9uLWZv
ci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2ggfCA1MiArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
a3ZtdG9vbC8wMDAxLXJlbW92ZS13b3Jkc2l6ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRp
YmlsaXR5LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3ZlLXdv
cmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9wYWNrYWdl
L2t2bXRvb2wvMDAwMS1yZW1vdmUtd29yZHNpemUtaC1pbmNsdXNpb24tZm9yLW11c2wtY29tcGF0
aWJpbGl0eS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zMTI4
YTIzNjg5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3ZlLXdv
cmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKQEAgLTAsMCAr
MSw1MiBAQAorRnJvbSAwNTkyZjhmODI5Yzg0M2ZmNWNiMmQxMDhjMzA5ZTMyZjRmNmY1Mzc5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3
YXJhQGFybS5jb20+CitEYXRlOiBUaHUsIDEgQXVnIDIwMjQgMTI6MTA6NTQgKzAxMDAKK1N1Ympl
Y3Q6IHJlbW92ZSB3b3Jkc2l6ZS5oIGluY2x1c2lvbiAoZm9yIG11c2wgY29tcGF0aWJpbGl0eSkK
K01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworVGhlIHdvcmRzaXplLmggaGVh
ZGVyIGZpbGUgYW5kIHRoZSBfX1dPUkRTSVpFIGRlZmluaXRpb24gZG8gbm90IHNlZW0KK3RvIGJl
IHVuaXZlcnNhbCwgdGhlIG11c2wgbGliYyBmb3IgaW5zdGFuY2UgaGFzIHRoZSBkZWZpbml0aW9u
IGluIGEKK2RpZmZlcmVudCBoZWFkZXIgZmlsZS4gVGhpcyBicmVha3MgY29tcGlsYXRpb24gb2Yg
a3ZtdG9vbCBhZ2FpbnN0IG11c2wuCisKK1RoZSB0d28gbGVhZGluZyB1bmRlcnNjb3JlcyBzdWdn
ZXN0IGEgY29tcGlsZXItaW50ZXJuYWwgc3ltYm9sIGFueXdheSwgc28KK2xldCdzIGp1c3QgcmVt
b3ZlIHRoYXQgcGFydGljdWxhciBtYWNybyB1c2FnZSBlbnRpcmVseSwgYW5kIHJlcGxhY2UgaXQK
K3dpdGggdGhlIG51bWJlciB3ZSByZWFsbHkgd2FudDogdGhlIHNpemUgb2YgYSAibG9uZyIgdHlw
ZS4KKworUmVwb3J0ZWQtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+
CitTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4K
K1Jldmlld2VkLWJ5OiBBbGV4YW5kcnUgRWxpc2VpIDxhbGV4YW5kcnUuZWxpc2VpQGFybS5jb20+
CitMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwODAxMTExMDU0LjgxODc2NS0x
LWFuZHJlLnByenl3YXJhQGFybS5jb20KK1NpZ25lZC1vZmYtYnk6IFdpbGwgRGVhY29uIDx3aWxs
QGtlcm5lbC5vcmc+CitVcHN0cmVhbTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvd2lsbC9rdm10b29sLmdpdC9jb21taXQvP2lkPTA1OTJmOGY4MjljODQz
ZmY1Y2IyZDEwOGMzMDllMzJmNGY2ZjUzNzkKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUg
PHRob21hcy5wZXJhbGVAbWluZC5iZT4KKy0tLQorIGluY2x1ZGUvbGludXgvYml0b3BzLmggfCA2
ICsrLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oIGIvaW5jbHVkZS9saW51eC9i
aXRvcHMuaAoraW5kZXggYWUzMzkyMmYuLmVlOGZkNTYwIDEwMDY0NAorLS0tIGEvaW5jbHVkZS9s
aW51eC9iaXRvcHMuaAorKysrIGIvaW5jbHVkZS9saW51eC9iaXRvcHMuaAorQEAgLTEsMTUgKzEs
MTMgQEAKKyAjaWZuZGVmIF9LVk1fTElOVVhfQklUT1BTX0hfCisgI2RlZmluZSBfS1ZNX0xJTlVY
X0JJVE9QU19IXworIAorLSNpbmNsdWRlIDxiaXRzL3dvcmRzaXplLmg+CistCisgI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgorICNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgorICNpbmNsdWRl
IDxhc20vaHdlaWdodC5oPgorIAorLSNkZWZpbmUgQklUU19QRVJfTE9ORyBfX1dPUkRTSVpFCisg
I2RlZmluZSBCSVRTX1BFUl9CWVRFICAgICAgICAgICA4CistI2RlZmluZSBCSVRTX1RPX0xPTkdT
KG5yKSAgICAgICBESVZfUk9VTkRfVVAobnIsIEJJVFNfUEVSX0JZVEUgKiBzaXplb2YobG9uZykp
CisrI2RlZmluZSBCSVRTX1BFUl9MT05HICAgICAgICAgICAoQklUU19QRVJfQllURSAqIHNpemVv
Zihsb25nKSkKKysjZGVmaW5lIEJJVFNfVE9fTE9OR1MobnIpICAgICAgIERJVl9ST1VORF9VUChu
ciwgQklUU19QRVJfTE9ORykKKyAKKyAjZGVmaW5lIEJJVF9XT1JEKG5yKQkJKChucikgLyBCSVRT
X1BFUl9MT05HKQorIAorLS0gCitjZ2l0IDEuMi4zLWtvcmcKKwotLSAKMi41MC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
