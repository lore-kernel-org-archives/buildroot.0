Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF07C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A2A61027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75A2A61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 481C340300;
	Sun, 14 Nov 2021 14:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9dri1q0p-PK; Sun, 14 Nov 2021 14:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9868340294;
	Sun, 14 Nov 2021 14:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA1771BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D979A606B3
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31jrxAOLnUIV for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:56:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 844AA6061A
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636901765;
 bh=l3Yvt411LnJVgPXaPypTKaQgwusLSiS8MPL4Zr5Wxog=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=CmD3wYWbw2FRqXgaX8HwiztI2xS5pQsfAsnOQfVcC5M9dDphroOY7Ne2V+S1Qj5MT
 PSa/SItLopcre5EAUYXH9GUL93Vu8NCmTv7N+uefqkfFxhXGZkKBTDycZ8+EXnWJpr
 PesRN9a7xVIr5aP4VL+XHGL2shqAhpl3eFXi/euU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRMs-1nG1A90S44-00Thjt; Sun, 14
 Nov 2021 15:56:05 +0100
Date: Sun, 14 Nov 2021 15:56:04 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: =?UTF-8?B?0JrRg9C30YzQvNC40L3QvtCyINCh0LXRgNCz0LXQuQ==?=
 <kuzminov.sergey81@gmail.com>
Message-ID: <20211114155604.6fef7e82@gmx.net>
In-Reply-To: <6fd05f97-7fb9-96d8-cca0-5063be8ad620@gmail.com>
References: <6fd05f97-7fb9-96d8-cca0-5063be8ad620@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:bEN3CHBChW3NKLOsDNYBhxKacJRQgY5RARRX6cYSYywKPfGEnXO
 QNhd6/AQkqtOX5Aqh+CuSmHOnj5v9f+yabATqrLuy7l+6tD/Glf0ptMzQw5yJVCkz95ZmSZ
 q5R6N6nZjAuzpC1m4rjPJHch7TRikhkIUcgdvwq41pb/2WYSidLMRGOk1a0uBGM/0/fWYJi
 XBRUTah20nSOJHHJOkPEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ea+0oQnU83w=:/qth5QIFKm5pw6KWvrQBVU
 4HjOsgNc3e95r1dKLp2For1MDSXJMCG08lc/7hyMDfyL9kc6kucSmornxIJvLiP5o3N/DQMEx
 J8+1RJSoiMA2n7YhVyEJgrDkC37Qh3AV+sla3mKqP0PzcvJW9nf30zDthTn5Fy2/TOjm4FmyD
 uReHnyiQtK/JiL0aBvs/BQX6T9mx2qLv3dvMKrZgN9BfSrKGnBRhG052+5jPe4Q6NAYi88TaZ
 283mR8+0f4JjSFJNDdwPZZ1syY5QTQdMkUXysQmvRNGKtgmTGatnBbNEPJyZkLzzJFMXEKprZ
 +HG9d1jOa1/KCHwWipKa7ljnYa1eoznLPxIJr/QTiRi+ohDfb5D61aZPTx44kXxcAekuhYoiU
 5WAHwX0SFWQsHjV2GHCCOXRojdnuQZwSe6FDmu7M6p6iQU9EjJiBm+ZhbMVvF9HAzKq24g79H
 lw9CT4bjZ1hoB/LUhxH8KkMvcvziTJJLDg7ibhTUgtL1CC57pOqUD8fxNbO8DHOAjXf3oARo7
 QbWBu23UTwYXTat6oRb2h8sgCo1RrTqfodcuAi64CwZBRbA28JOk3YrzDBgXnkjg1dA7kkhEa
 memLZqvGBbLHZqB4bDLl/qor/xA2PfA6RCcDCA9pBRs9DWunk8DrwM2mwUs+UZ7Iyw9DPRUlt
 kZRUvzT/IiW5VKJQ2SQkrrUNz1lrxh8Bq66pseijy5C47Bxdkkh7GJ/F73v51jaowEN72B2/g
 6MxuQxTGoE9RLroFvQcu1rL+wkgB0HgpeVU9CdAeOYcv7DS3lfICq1+ibplHTN18ALqOvSzTL
 vlq595RvBScmiKeRzYW0l4ryspIfeIlBpv3seZ++efY9jkk/YzjQUV+r5JqhvpAidCj0C9iRc
 wL6PHRnQlPUT7OV7ti5ER65oPcyoKHpCAEiJ6j2O8BTPepFgaq9/FaSaUAc9FI3SgyXEii4U+
 IfyUuj8qNMhngolfcU1CSID/JpXhPLkLsbF6/eqOlW6LwDwOU1TyMpHKKjr9/r386zmjjy8CE
 vQ/VUDw0ulQxu/MlJO1Vy2NXZ7gQuVmmr3QV/b0rt2g6aeQq+aZHFavWMY67DMDJ98MxtMqN2
 8bgBPCTt8iF+n0=
Subject: Re: [Buildroot] Disable qt5declarative dependency on GUI
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

SGVsbG8gU2VyZ2V5LAoKT24gU2F0LCAxMyBOb3YgMjAyMSAxNDo0NToxMCArMDMwMCwg0JrRg9C3
0YzQvNC40L3QvtCyINCh0LXRgNCz0LXQuSA8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPiB3
cm90ZToKCj4gSGVsbG8uIE15IEVuZ2xpc2ggaXMgcG9vci4gWW91IG5lZWQgdG8gcmVtb3ZlIHRo
ZSAic2VsZWN0IAoKTm8gcHJvYmxlbSwgZXZlcnkgY29udHJpYnV0aW9uIHdlbGNvbWUgOy0pCgo+
IEJSMl9QQUNLQUdFX1FUNUJBU0VfR1VJIiBkZXBlbmRlbmN5IGZyb20gdGhlIAo+IHBhY2thZ2Uv
cXQ1L3F0NWRlY2xhcmF0aXZlL0NvbmZpZy5pbiBmaWxlLgo+IAo+IFRoaXMgaXMgbmVlZGVkIHRv
IGJ1aWxkIFF0IGNvbnNvbGUgYXBwbGljYXRpb25zIHdpdGhvdXQgYSBHVUkuIFRoZSAKPiBxdDVk
ZWNsYXJhdGl2ZSBsaWJyYXJ5IGlzIG5lZWRlZCBhcyBhIHJlcGxhY2VtZW50IGZvciB0aGUgb3V0
ZGF0ZWQgCj4gcXQ1c2NyaXB0Lgo+IAo+IFNvbWUgYXNwZWN0cyBvZiBxdDVkZWNsYXJhdGl2ZSBh
cmUgbm90IEdVSSByZWxhdGVkOiAKPiBodHRwczovL2RvYy5xdC5pby9xdC01L3Fqc2VuZ2luZS5o
dG1sCj4gCj4gQSBzaW1wbGUgZXhhbXBsZToKPiAKPiBRSlNFbmdpbmUgbXlFbmdpbmU7Cj4gUUpT
VmFsdWUgdGhyZWUgPSBteUVuZ2luZS5ldmFsdWF0ZSgiMSArIDIiKTsKPiAKPiBUaGFua3MgYSBs
b3QhCgpKdXN0IHNlbnQgb3V0IGFuIGltcHJvdmVkIHZlcnNpb24gb2YgeW91ciBwYXRjaCAoaW5z
dGVhZCBvZiByZW1vdmluZyB0aGUgcXQ1Z3VpCnNlbGVjdCBlbnRpcmVseSBtb3ZlIGl0IGRvd24g
dG8gdGhlIHF0NXF1aWNrIHNlY3Rpb24pIHRvIHRoZSBtYWlsaW5nIGxpc3QgKHNlZSBbMV0pLi4u
CgpUaGFua3MgZm9yIHN1Z2dlc3Rpb24hCgpSZWdhcmRzLApQZXRlcgoKWzFdIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTExMTQxMzU3MjIu
MTIzODYtMS1wcy5yZXBvcnRAZ214Lm5ldApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
