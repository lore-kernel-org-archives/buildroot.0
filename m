Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643DCC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98466059A;
	Sun, 15 Jan 2023 12:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98466059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFNNkx-GncET; Sun, 15 Jan 2023 12:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1337761194;
	Sun, 15 Jan 2023 12:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1337761194
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D24261BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B632D415DF
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B632D415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7msb1pN9i6Sw for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 341BF4167D
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 341BF4167D
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:10 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qx13so3896041ejb.13
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mk5A43aGuSWnzp3jC3JgZ4eZkg6iZJt7fFF/rxhysdE=;
 b=XEd8uoPXLe68Hc4hntkRT+tyHdgfIlvfxvatekS1dlSLdzN6KtxpdwMIRcOl93IR5D
 wlECf+DzASykAIlTGooZAQ10EVjmaQgHwAoIRRrxL0dA07kziyCYJw+eIuPyiteIOSoU
 CCuYy2w1lyuuZpW+am1zgtRzQtK5GiYF5zl/5Zl4htJx/NPBHQprv6iEV84I55h21XD6
 o3piJWzFZVsVFLhqWKxN7tASL0Yraq9JYDpv2NE/3zDZCeYyXZ/YGVYUe4bWus15ipkb
 /TiE2gkMPqoF8eGZD8R4bsTelwOMbI/a3hCWHg56DWOzNtP6qrgzx2gTg1NBopN2i00T
 t7Sw==
X-Gm-Message-State: AFqh2kodAOl29Hy/8PYE9awa1+BdVPAgHA5jT++vMDfvwZlZ+USUQssq
 i1XSCt0KtTAG56BwWg+CeTNkKaPS8Sw=
X-Google-Smtp-Source: AMrXdXsiJbdsd++SfeYI/qLCRWUPI0+5zP1o11aHeuKiBjhSuISejPW3x7er34shKFg6kISMI7aSGg==
X-Received: by 2002:a17:907:674e:b0:78d:f455:b5d4 with SMTP id
 qm14-20020a170907674e00b0078df455b5d4mr14549387ejc.20.1673787189761; 
 Sun, 15 Jan 2023 04:53:09 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:09 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:49 +0100
Message-Id: <20230115125253.280257-5-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115125253.280257-1-nolange79@gmail.com>
References: <20230115125253.280257-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mk5A43aGuSWnzp3jC3JgZ4eZkg6iZJt7fFF/rxhysdE=;
 b=COlgYZeHRhiiDT1Xh1TprR1NnXNkMpnOgMquMAVxC+ppASIkvgTveq6bXJuXKQM+qX
 gqiavqPaCT0PbjCpnr/6P6rMgwuLBe118oAFxr79yVbl/iQeYoNH1iNj19AsJJmBjz7a
 UezDZhduI5oEdQqSv/2TfxO/W6eKwzeNlkCO/UbtZO+GmXo9uUyNmwVpNPERZp8Pxbfy
 8QUz5PsKPwuJATMWfMQuE71NWM1zgB//2pOcMb9JjmyILlemzUhaDbH7/6ZdzzFpiM1h
 2B9UZ7gslFwevRzSq/wSqGJpD7Mdsh3JRihJUk9Qz9dGZpjpQZBarXpFebkSm1Vruj6Q
 Th/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=COlgYZeH
Subject: [Buildroot] [PATCH 4/7] system: add systemd generator for /var
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
Cc: Norbert Lange <nolange79@gmail.com>,
 =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgYWRkcyBhbiBhbHRlcm5hdGl2ZSB0aGF0IGhhcyB0aGUgZm9sbG93aW5nIGNo
YXJhY3RlcmlzdGljczoKCi0gICBEb250IGRlcGVuZCBvbiBhbnl0aGluZyBiZWluZyBhdmFpbGFi
bGUsIGV4Y2VwdCB0aGUKICAgIEFQSSBGaWxlIFN5c3RlbXMgWzFdLgoKLSAgIEJlIGEgY2xlYW4g
ZHJvcC1pbiwgdGhhdCBjYW4gYmUgdHJpdmlhbGx5IGFkZGVkIC8gcmVtb3ZlZC4KCi0gICBSdW5z
IGJlZm9yZSBzeXN0ZW1kIGxvYWRzIGl0cyBjb25maWd1cmF0aW9uLgoKICAgIENvdWxkIGJlIGV4
dGVuZGVkIHRvIGhhbmRsZSBtb3JlIHRyaWNreSBwYXRocyBsaWtlIC9ldGMuCgpGb3IgbW9yZSBl
eHBsYWluYXRpb24sIHNlZSB0aGUgY29tbWl0IGludHJvZHVjaW5nIHRoZSBvdmVybGF5IG1ldGhv
ZC4KClRoZSBpbXBsZW1lbnRhdGlvbiBkb2VzbnQgZm9jdXMgb24gYmVpbmcgZXhwYW5kYWJsZSBi
dXQgc2ltcGxlLAppbiB0aGUgZnV0dXJlIHRoZXJlIGNvdWxkIGJlIGFuIGF0dGVtcHQgdG8gc291
cmNlIHNoZWxsIHNjcmlwdHMKZm9yIGNvbmZpZ3VyYXRpb24uClNvIHRoYXQgbXVsdGlwbGUgcGF0
aHMgY2FuIGJlIGNvdmVyZWQgKC9ldGMpLApvciB0aGUgbW91bnRzIGFuZCBoYW5kbGluZyBzcGVj
aWZpZWQKKGRvLW5vdGhpbmcsIGNvcHktb3ZlciBvciBvdmVybGF5IG9yaWdpbmFsIGNvbnRlbnRz
KS4KClRoZSBpbnRlbnQgaXMgdG8gaGF2ZSBhIGRpcmVjdCByZXBsYWNlbWVudCBmb3IgdGhlIHZh
ciBmYWN0b3J5IG1ldGhvZC4KClsxXSAtIGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtp
L1NvZnR3YXJlL3N5c3RlbWQvQVBJRmlsZVN5c3RlbXMvCgpDYzogWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4KQ2M6IEplzIFyZcyBbXkgUm9zZW4gPGplcmVteS5yb3NlbkBzbWlsZS5mcj4KU2lnbmVk
LW9mZi1ieTogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KLS0tCiAuLi4vZ2Vu
ZXJhdG9yL2JyLW1vdW50LWdlbmVyYXRvciAgICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysr
KysrKysrCiAuLi4vc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rICAgICAgICAgICAgICAgICAgfCAx
MCArKysrKysrKystCiBzeXN0ZW0vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMyArKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3NrZWxldG9uLWluaXQt
c3lzdGVtZC9nZW5lcmF0b3IvYnItbW91bnQtZ2VuZXJhdG9yCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvZ2VuZXJhdG9yL2JyLW1vdW50LWdlbmVyYXRvciBiL3Bh
Y2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL2dlbmVyYXRvci9ici1tb3VudC1nZW5lcmF0b3IK
bmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMC4uZmQxMDY1OWMxYwotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL2dlbmVyYXRvci9ici1t
b3VudC1nZW5lcmF0b3IKQEAgLTAsMCArMSwxOSBAQAorIyEvYmluL3NoCitzZXQgLWUKKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAorIyBOb3RlOiBkb2luZyBoZWF2eSBzdHVmZiBoZXJl
IGlzIG5vdCByZWNvbW1lbmRlZCwgYnV0IHRoaXMgd2F5CisjIHRoZSBvcmRlcmluZyBpcyBndWFy
YW50ZWVkLiBCZSBxdWljayBhYm91dCBldmVyeXRoaW5nLgorIyBLbm93IHRoYXQgdGhlIGdlbmVy
YXRvciBjYW4gYmUgcnVuIGFnYWluIGxhdGVyLgorCitbICIke1NZU1RFTURfSU5fSU5JVFJELTB9
IiA9IDEgXSAmJiBleGl0CitncmVwICdedG1wZnNfYnJfdmFyIC92YXIgdG1wZnMnIC9wcm9jL3Nl
bGYvbW91bnRzID4vZGV2L251bGwgJiYgZXhpdAorCitUTVBNT1VOVD0vcnVuLy5ici8udG1wdmFy
Cit0cmFwICJ1bW91bnQgLWwgJFRNUE1PVU5UIHx8IDo7IHJtZGlyICRUTVBNT1VOVCB8fCA6IiAw
CisKK21rZGlyIC1tNzU1IC1wICRUTVBNT1VOVAorbW91bnQgLW4gLXQgdG1wZnMgLW8gbm9zdWlk
LG5vZGV2LHNpemU9NTAlIHRtcGZzX2JyX3ZhciAkVE1QTU9VTlQKKworY3AgLXIgLXAgL3Zhci8u
ICRUTVBNT1VOVAorIyB0aGlzIGlzIGEgc2hhcmVkIG1vdW50IHNvIC0tbW92ZSB3b250IHdvcmsK
K21vdW50IC1uIC0tYmluZCAkVE1QTU9VTlQgL3ZhcgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9za2Vs
ZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rIGIvcGFja2FnZS9za2Vs
ZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rCmluZGV4IGY0MzFlYzQ2
MTIuLmI5Yjg0OTJmNTggMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1k
L3NrZWxldG9uLWluaXQtc3lzdGVtZC5taworKysgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lz
dGVtZC9za2VsZXRvbi1pbml0LXN5c3RlbWQubWsKQEAgLTY5LDExICs2OSwxOSBAQCBkZWZpbmUg
U0tFTEVUT05fSU5JVF9TWVNURU1EX1BPU1RfSU5TVEFMTF9WQVJfT1ZFUkxBWUZTCiAJCSQoVEFS
R0VUX0RJUikvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9ici1iaW5kbW91bnQtcnVuQC5zZXJ2aWNl
CiAJJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQoU0tFTEVUT05fSU5JVF9TWVNURU1EX1BLR0RJUikv
b3ZlcmxheWZzL2JyLW92ZXJsYXktcHJlcGFyZUAuc2VydmljZSBcCiAJCSQoVEFSR0VUX0RJUikv
dXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9ici1vdmVybGF5LXByZXBhcmVALnNlcnZpY2UKLQkjIC92
YXIgbW91bnQgZ2V0cyBwdWxsZWQgaW4gYXV0b21hdGljYWxseSBieSBiYXNpYy50YXJnZXQKKwkj
IHZhci5tb3VudCBnZXRzIHB1bGxlZCBpbiBhdXRvbWF0aWNhbGx5IGJ5IGJhc2ljLnRhcmdldAog
ZW5kZWYKIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9
IFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QT1NUX0lOU1RBTExfVkFSX09WRVJMQVlGUwogZW5kaWYg
ICMgQlIyX0lOSVRfU1lTVEVNRF9WQVJfT1ZFUkxBWUZTCiAKK2lmZXEgKCQoQlIyX0lOSVRfU1lT
VEVNRF9WQVJfR0VORVJBVE9SKSx5KQorZGVmaW5lIFNLRUxFVE9OX0lOSVRfU1lTVEVNRF9QT1NU
X0lOU1RBTExfVkFSX0dFTkVSQVRPUgorCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFNLRUxFVE9O
X0lOSVRfU1lTVEVNRF9QS0dESVIpL2dlbmVyYXRvci9ici1tb3VudC1nZW5lcmF0b3IgXAorCQkk
KFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0tZ2VuZXJhdG9ycy9ici12YXItbW91
bnQtZ2VuZXJhdG9yCitlbmRlZgorU0tFTEVUT05fSU5JVF9TWVNURU1EX1BPU1RfSU5TVEFMTF9U
QVJHRVRfSE9PS1MgKz0gU0tFTEVUT05fSU5JVF9TWVNURU1EX1BPU1RfSU5TVEFMTF9WQVJfR0VO
RVJBVE9SCitlbmRpZiAgIyBCUjJfSU5JVF9TWVNURU1EX1ZBUl9HRU5FUkFUT1IKKwogZW5kaWYg
ICMgQlIyX1RBUkdFVF9HRU5FUklDX1JFTU9VTlRfUk9PVEZTX1JXCiAKIGlmZXEgKCQoQlIyX0lO
SVRfU1lTVEVNRF9QT1BVTEFURV9UTVBGSUxFUykseSkKZGlmZiAtLWdpdCBhL3N5c3RlbS9Db25m
aWcuaW4gYi9zeXN0ZW0vQ29uZmlnLmluCmluZGV4IGNkZjM4M2QwZDQuLjE0ZmVmYmYyODMgMTAw
NjQ0Ci0tLSBhL3N5c3RlbS9Db25maWcuaW4KKysrIGIvc3lzdGVtL0NvbmZpZy5pbgpAQCAtMjAw
LDYgKzIwMCwxOSBAQCBjb25maWcgQlIyX0lOSVRfU1lTVEVNRF9WQVJfT1ZFUkxBWUZTCiAJICBF
eGVjU3RhcnQ9CiAJICBFeGVjU3RhcnQ9L2Jpbi9tb3VudCAtLW1ha2UtcHJpdmF0ZSAtbiAvZGV2
L3NkYzEgJHtPVkVSTEFZX0RJUn0KIAorY29uZmlnIEJSMl9JTklUX1NZU1RFTURfVkFSX0dFTkVS
QVRPUgorCWJvb2wgInVzZSBhIHN5c3RlbWQgZ2VuZXJhdG9yIHRvIG1vdW50IGFuZCBwb3B1bGF0
ZSBhIHRtcGZzIgorCWhlbHAKKwkgIE1vdW50IGFuIHRtcGZzIG9uIC92YXIsIHdpdGggdGhlIHRo
ZSBvcmlnaW5hbCBjb250ZW50cyBjb3BpZWQuCisKKwkgIFRoZSBsb2dpYyBpcyBjb250YWluZWQg
aW4gYSBzeXN0ZW1kIGdlbmVyYXRvciwgdG8gZW5zdXJlIHRoaXMKKwkgIGlzIGRvbmUgZWFybHkg
YW5kIG9yZGVyZWQgYmVmb3JlIGFueXRoaW5nIGNhbiBhY2Nlc3MgL3Zhci4KKworCSAgVW5saWtl
IHRoZSB2YXIgZmFjdG9yeSwgbm90aGluZyBuZWVkcyB0byBiZSBwcmVwYXJlZCBhbmQKKwkgIHRo
ZSBwb3B1bGF0aW5nIGhhcHBlbnMgYmVmb3JlIGFueSB1bml0IGFjY2Vzc2VzIC92YXIuCisKKwkg
IFVubGlrZSB0aGUgdmFyIGZhY3RvcnksIGl0IGRvZXMgbm90IG5lZWQgYW4gb3ZlcmxheWZzLgor
CiBjb25maWcgQlIyX0lOSVRfU1lTVEVNRF9WQVJfTk9ORQogCWJvb2wgImRvIG5vdGhpbmciCiAJ
aGVscAotLSAKMi4zOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
