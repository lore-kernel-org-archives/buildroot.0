Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7131BC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 16:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA8E60200
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 16:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EA8E60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA40740588;
	Fri, 23 Jul 2021 16:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxVZ4laU88kq; Fri, 23 Jul 2021 16:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D958940589;
	Fri, 23 Jul 2021 16:42:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E62D31BF299
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 16:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0A3F60692
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 16:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2D9JSlcC9sI for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 16:42:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E125C60663
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627058559;
 bh=9H+6M06SYFBXgUf3iT03ciBAoWdU4kYNUofEeEy3KNk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CP/2E7lM/4gTW8kKxmZF/qpP46Jf1U46/E2q3QqFRLPTeeZtUc432LiKumZvs8+Hd
 dh+pWxD6p0AR1naAHG4Jlpg034I35bFVBXvKUX2x5qWzb1Z4K8zpQB/OykYDevVVzM
 8RVGq7nEEnlLYP9fAw7XHV03x0Gfx6CNjq1Xfahk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.101]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MDysm-1lzF0s3A0K-00A24J; Fri, 23 Jul 2021 18:42:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 18:42:35 +0200
Message-Id: <20210723164235.17643-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:XKyPVNyOc6sL7Elb2OGPOJPrfLdsaqlaP3qDDw6dlEW+jIInrGn
 YJ4B7UulIghmPP2OToBR4uwy2LNSOGvhlPY2XB+3WsjIJimuDATNtreGOAcdnOGunL58tXc
 A6Yaa2X16oZyuZbMCVQTBE8hjV0uSZNAsGvn8wCct40DHNYy3cv/HUr7LHIa9uArtjMK/3B
 C1GPCPUG6qxD+E6a/4YGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lN/WosTjPNo=:sP9NiaLq3zWAjdLDLyUOjS
 5nk7S/5tdYF1QQEvTyCE/CVJt3/VxlZDvWJ8Gm2NF+9BHt8oZYvkMB348/ISQYFehEFSp6zTw
 te8OsfGOV1EI/vIXSsAS3/CGNKe5zE7aAMOxitfEPcNDLsYRl0fMQzZZd+X7Zsngxad5sBr0I
 xekeAbcuwRCbskFo4LfDAkpOmXw56QmGzeEW2rv7sTB/DQggQJ+0ILvZeA7a91PVugAMr2XhJ
 WcEytJ3nAElYHhY0xyywB6FhIDtjPl/w/jJCAvQksq7t+VUJNZiRvPTX52j015ft0LSsvWqun
 vE0jdjLi94hfWyA02r7tksu9dJW5siHH9UkJlo3cWCgGLMKbGM0CSCPbvHm7rJ/6jnbVD/avR
 I8Z2KQQXlb2Sui09dT0V+Ej9nZnaPo/d1OiydpBBU2lSxgznDq8JSdAPt1IGvSZybD0j2Xyi1
 TwTWWsdu13zgKNiTzAtR0pKgZZ9VwHL29WM0jfw8w0htGUK/Ok0L+vkfzMWJ7dOtpynMiYo+u
 ezsg+J3U69C0s8eTz/EyPjB7paR8L2xwXZzNubsx/QABvnY/PrAn/g30H+UOHdxbkme1wjglD
 75/jMSoZ+5tTb19B0W4tB0UdKA6d9ODafC6NvkkaMKhLpN0r0Difay+Z1v/jsTbgYydND/mqH
 PuWVV+FirAJZAj65ogCT8wyxZ49j878YgSZ/FjMO8B9eja4gH8y7WZqaL7xaZiz+IbpeKJ7UX
 DgK5O2rA/XplEOmz+myqFGdOulFlc/3EYrzHJqWN5Uyjw3IghonC0xb4EelcqBVFrQ1h77EUY
 tT3p+uGDVTLJeTb6g163U/7rPK9eTX9FeyowyJ25ZSeYPnXq5ugH1+HVMm0SauITmbM1Zbi7s
 LcMHJKMBzLvGUO3LtjaE4WOzvMxK5fqEumJ2G1ZqJdJBwFnDJPwQAqFtt9fwQF9/0VgOkvcNe
 G8i3lwlXQfM7H5MRrgN6nw1qGp9sDrPEDFpiFZ7dClIv4ifmKIlEGMAMjLyh6/bZKe+7xsC0W
 fHl6ebiUBY2l+izrJr/aceYxcLgdQYVa1e9ClF3BAJ8gP09pcCyqFUYg5e9uPlqRGOpw6l/Lr
 giJ915QzBkZHfeMCGCbuQCUY2JmL1Ix8UDE
Subject: [Buildroot] [PATCH v1] package/qt5base: select mandatory libopenssl
 PSK feature
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
Cc: Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Rml4ZXM6CgogIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMjQyMzAy
NDJjMTVlYjM3OWQ2NTNjOTU3YTA4NjIxZjhhMWZhYzU1ZQoKICBzc2wvcWR0bHNfb3BlbnNzbC5j
cHA6IEluIG1lbWJlciBmdW5jdGlvbiDigJhib29sIGR0bHNvcGVuc3NsOjpEdGxzU3RhdGU6Omlu
aXRDdHhBbmRDb25uZWN0aW9uKFFEdGxzQmFzZVByaXZhdGUqKeKAmToKICBzc2wvcWR0bHNfb3Bl
bnNzbC5jcHA6NzE3Ojk6IGVycm9yOiDigJhxX1NTTF9zZXRfcHNrX3NlcnZlcl9jYWxsYmFja+KA
mSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZCB5b3UgbWVhbiDigJhxX1NTTF9z
ZXRfcHNrX3VzZV9zZXNzaW9uX2NhbGxiYWNr4oCZPwogICAgNzE3IHwgICAgICAgICBxX1NTTF9z
ZXRfcHNrX3NlcnZlcl9jYWxsYmFjayhuZXdDb25uZWN0aW9uLmRhdGEoKSwgZHRsc2NhbGxiYWNr
czo6cV9QU0tfc2VydmVyX2NhbGxiYWNrKTsKICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgICB8ICAgICAgICAgcV9TU0xfc2V0X3Bza191c2Vfc2Vz
c2lvbl9jYWxsYmFjawogIHNzbC9xZHRsc19vcGVuc3NsLmNwcDo3MTk6OTogZXJyb3I6IOKAmHFf
U1NMX3NldF9wc2tfY2xpZW50X2NhbGxiYWNr4oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBz
Y29wZTsgZGlkIHlvdSBtZWFuIOKAmHFfU1NMX3NldF9wc2tfdXNlX3Nlc3Npb25fY2FsbGJhY2vi
gJk/CiAgICA3MTkgfCAgICAgICAgIHFfU1NMX3NldF9wc2tfY2xpZW50X2NhbGxiYWNrKG5ld0Nv
bm5lY3Rpb24uZGF0YSgpLCBkdGxzY2FsbGJhY2tzOjpxX1BTS19jbGllbnRfY2FsbGJhY2spOwog
ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICAgIHwg
ICAgICAgICBxX1NTTF9zZXRfcHNrX3VzZV9zZXNzaW9uX2NhbGxiYWNrCgpTaWduZWQtb2ZmLWJ5
OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogcGFja2FnZS9xdDUvcXQ1
YmFzZS9Db25maWcuaW4gfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NWJhc2UvQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvcXQ1
YmFzZS9Db25maWcuaW4KaW5kZXggZWU3Yzc1N2M2MC4uZTkzYjJkZWMzOCAxMDA2NDQKLS0tIGEv
cGFja2FnZS9xdDUvcXQ1YmFzZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9xdDUvcXQ1YmFzZS9D
b25maWcuaW4KQEAgLTMsNiArMyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9RVDVCQVNFCiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1pMSUIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUENSRTIKIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfUENSRTJfMTYKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCT1BFTlNTTF9FTkFC
TEVfUFNLIGlmIEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wKIAloZWxwCiAJICBRdCBpcyBhIGNyb3Nz
LXBsYXRmb3JtIGFwcGxpY2F0aW9uIGFuZCBVSSBmcmFtZXdvcmsgZm9yCiAJICBkZXZlbG9wZXJz
IHVzaW5nIEMrKy4KLS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5u
ZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
