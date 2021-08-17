Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F9BC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:39:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34B9460FD8
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34B9460FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCD86607FE;
	Tue, 17 Aug 2021 08:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4P0CejVZadi; Tue, 17 Aug 2021 08:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C09607F8;
	Tue, 17 Aug 2021 08:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F90D1BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8C280CE0
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j64Ilyanyd_6 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 551CA80C2B
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:38 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 2841B1BF206;
 Tue, 17 Aug 2021 08:39:33 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:14 +0200
Message-Id: <20210817083930.3718711-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 00/16] Overwritten file detection and fixes,
 one more step to TLP build
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGksCgpUaGlzIHYzIHNlcmllcyBhZGRzIGEgbmV3IHBhdGNoIChwYXRjaCAxKSB0byBmaXggYSBm
aW5kIGZhaWx1cmUgYWxyZWFkeSBwcmVzZW50CmluIFBLR19QWVRIT05fRklYVVBfU1lTQ09ORklH
IHRoYXQgd2FzIGhpZ2hsaWdodGVkIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uCm9mIHRoaXMgc2Vy
aWVzLgpJdCBhbHNvIHJld29ya3MgdGhlIHB5dGhvbiBmaXh1cCBhY2NvcmRpbmcgdG8gcHJldmlv
dXMgcmV2aWV3IChwYXRjaGVzIDIgYW5kIDMpCmFuZCBmaXhlcyB0aGUgdGVzdCBnaXZlbiBpbiBw
YXRjaCAxMi4KClR3byBwYXRjaGVzIGFyZSBhZGRlZCByZWxhdGVkIHRvIFF0NS4gVGhlIGZpcnN0
IG9uZSAocGF0Y2ggNSkgd2FzIHByZXZpb3VzbHkKc2VudCBieSBBbmRyZWFzIE5hdW1hbm4gYW5k
IGZpeGVzIGEgUXQ1IG92ZXJ3cml0ZS4gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9v
dC8yMDIxMDYyMzA4MzkyNy44Mjc4LTEtYW5hdW1hbm5AdWx0cmF0cm9uaWsuZGUvCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9iMWQwYzVhNS1mNzZmLWUzOGUtMDI1Ny0xMzAwZjZh
MzBlYWJAYW5kaW4uZGUvClRoZSBzZWNvbmQgb25lIChwYXRjaCA2KSBtb3ZlcyB0aGUgZml4dXAg
ZnVuY3Rpb24gdG8gdGhlIHBvc3QtcHJlcGFyZSBob29rcy4KCk9uZSBtb3JlIHBhdGNoIHdhcyBh
ZGRlZCBpbiB0aGlzIHNlcmllIChwYXRjaCAxNCkgdG8gbW92ZSBmaXh1cC1saWJ0b29sLWZpbGUg
dG8KdGhlIHBvc3QtcHJlcGFyZSBob29rcy4gVGhpcyB3YXMgbWVudGlvbm5lZCBkdXJpbmcgdGhl
IHJldmlldyBvZiB0aGUgZmlyc3QKdmVyc2lvbiBvZiB0aGlzIHNlcmllcyAoaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjEwNjI1MDkyNzA0LkdKMjg1MkBzY2Flci8pLgoKTW9y
ZSBjaGFuZ2VzIGRldGFpbHMgYXJlIGdpdmVuIGluIGVhY2ggaW5kaXZpZHVhbCBwYXRjaGVzLgoK
QmVzdCByZWdhcmRzLApIZXJ2w6kgQ29kaW5hCgpBbmRyZWFzIE5hdW1hbm4gKDEpOgogIHF0NTog
Rml4IHNwb3JhZGljIGJ1aWxkIGZhaWx1cmUgZHVyaW5nIHRvcC1sZXZlbCBwYXJhbGxlbCBidWls
ZAoKSGVydmUgQ29kaW5hICgxMSk6CiAgcGFja2FnZS9wa2ctcHl0aG9uOiBmaXggUEtHX1BZVEhP
Tl9GSVhVUF9TWVNDT05GSUdEQVRBCiAgcGFja2FnZS9wa2ctcHl0aG9uOiBpbnZhbGlkYXRlIHBy
ZWNvbXBpbGVkIF9zeXNjb25maWdkYXRhKi5weWMKICBwYWNrYWdlL3BrZy1nZW5lcmljLm1rOiBt
b3ZlIHB5dGhvbiBmaXh1cCB0byBnZW5lcmljIHBhY2thZ2UKICAgIGluZnJhc3RydWN0dXJlCiAg
cGFja2FnZS9vd2ZzOiByZW1vdmUgUHl0aG9uIHN5c2NvbmZpZ2RhdGEgZml4dXAKICBwYWNrYWdl
L3BrZy1xbWFrZS5tazogTW92ZSBRVDVfUVRfQ09ORl9GSVhVUCB0byBwb3N0LXByZXBhcmUgaG9v
awogIHBhY2thZ2UvcGtnLWdlbmVyaWMubWs6IGdlbmVyYXRlIGZpbmFsIHJzeW5jIGV4Y2x1ZGUg
ZmlsZSBsaXN0CiAgTWFrZWZpbGU6IHJzeW5jIGdsb2JhbCB7VEFSR0VULEhPU1R9X0RJUiB1c2lu
ZyBleGNsdXNpb24gZmlsZSBsaXN0CiAgTWFrZWZpbGU6IGJyZWFrcyBoYXJkbGlua3MgaW4gZ2xv
YmFsIHtUQVJHRVQsSE9TVH1fRElSIG9uIHBlci1wYWNrYWdlCiAgICBidWlsZAogIHBhY2thZ2Uv
cGtnLWdlbmVyaWMubWs6IGZpeCBwZXItcGFja2FnZQogICAgPHBrZz4te3JlY29uZmlndXJlLHJl
YnVpbGQscmVpbnN0YWxsfQogIHBhY2thZ2UvcGtnLWdlbmVyaWMubWs6IHJlbW92ZSAuZmlsZXMt
ZmluYWwtcnN5bmMuYmVmb3JlIHRlbXBvcmFyeQogICAgZmlsZQogIHBhY2thZ2UvcGtnLWdlbmVy
aWMubWs6IG1vdmUgZml4dXAtbGlidG9vbC1maWxlcyB0byBwb3N0LXByZXBhcmUgaG9vawoKVGhv
bWFzIFBldGF6em9uaSAoNCk6CiAgcGFja2FnZS9wa2ctZ2VuZXJpYy5tazogZGV0ZWN0IGZpbGVz
IG92ZXJ3cml0dGVuIGluIFRBUkdFVF9ESVIgYW5kCiAgICBIT1NUX0RJUgogIHN1cHBvcnQvdGVz
dGluZy9pbmZyYTogYWRkIGxvZ19maWxlX3BhdGgoKSBmdW5jdGlvbgogIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0czogYWRkIHRlc3QgZm9yIGNoZWNrX2Jpbl9hcmNoCiAgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzOiBhZGQgdGVzdCBmb3IgZmlsZSBvdmVyd3JpdGUgZGV0ZWN0aW9uCgogTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDM0ICsrKystCiBwYWNrYWdlL293
ZnMvb3dmcy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgLS0KIHBhY2thZ2UvcGtn
LWdlbmVyaWMubWsgICAgICAgICAgICAgICAgICAgICAgICB8IDEyNSArKysrKysrKysrKysrKysr
LS0KIHBhY2thZ2UvcGtnLXB5dGhvbi5tayAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCAt
LQogcGFja2FnZS9wa2ctcW1ha2UubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICst
CiBwYWNrYWdlL3F0NS9xdDUubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwog
c3VwcG9ydC90ZXN0aW5nL2luZnJhL19faW5pdF9fLnB5ICAgICAgICAgICAgIHwgIDExICstCiAu
Li4vYnIyLWV4dGVybmFsL2RldGVjdC1iYWQtYXJjaC9Db25maWcuaW4gICAgfCAgIDEgKwogLi4u
L2RldGVjdC1iYWQtYXJjaC9leHRlcm5hbC5kZXNjICAgICAgICAgICAgIHwgICAxICsKIC4uLi9i
cjItZXh0ZXJuYWwvZGV0ZWN0LWJhZC1hcmNoL2V4dGVybmFsLm1rICB8ICAgMSArCiAuLi4vcGFj
a2FnZS9kZXRlY3QtYmFkLWFyY2gvQ29uZmlnLmluICAgICAgICAgfCAgIDQgKwogLi4uL2RldGVj
dC1iYWQtYXJjaC9kZXRlY3QtYmFkLWFyY2gubWsgICAgICAgIHwgIDE1ICsrKwogLi4uL2JyMi1l
eHRlcm5hbC9kZXRlY3Qtb3ZlcndyaXRlL0NvbmZpZy5pbiAgIHwgICAxICsKIC4uLi9kZXRlY3Qt
b3ZlcndyaXRlL2V4dGVybmFsLmRlc2MgICAgICAgICAgICB8ICAgMSArCiAuLi4vYnIyLWV4dGVy
bmFsL2RldGVjdC1vdmVyd3JpdGUvZXh0ZXJuYWwubWsgfCAgIDEgKwogLi4uL3BhY2thZ2UvZGV0
ZWN0LW92ZXJ3cml0ZS9Db25maWcuaW4gICAgICAgIHwgICA1ICsKIC4uLi9kZXRlY3Qtb3Zlcndy
aXRlL2RldGVjdC1vdmVyd3JpdGUubWsgICAgICB8ICAxOSArKysKIHN1cHBvcnQvdGVzdGluZy90
ZXN0cy9jb3JlL3Rlc3RfYmFkX2FyY2gucHkgICB8ICAxOSArKysKIC4uLi90ZXN0aW5nL3Rlc3Rz
L2NvcmUvdGVzdF9maWxlX292ZXJ3cml0ZS5weSB8ICA0OCArKysrKysrCiAxOSBmaWxlcyBjaGFu
Z2VkLCAyNjkgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2NvcmUvYnIyLWV4dGVybmFsL2RldGVjdC1iYWQtYXJj
aC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29y
ZS9icjItZXh0ZXJuYWwvZGV0ZWN0LWJhZC1hcmNoL2V4dGVybmFsLmRlc2MKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29yZS9icjItZXh0ZXJuYWwvZGV0ZWN0LWJh
ZC1hcmNoL2V4dGVybmFsLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL2NvcmUvYnIyLWV4dGVybmFsL2RldGVjdC1iYWQtYXJjaC9wYWNrYWdlL2RldGVjdC1iYWQt
YXJjaC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
Y29yZS9icjItZXh0ZXJuYWwvZGV0ZWN0LWJhZC1hcmNoL3BhY2thZ2UvZGV0ZWN0LWJhZC1hcmNo
L2RldGVjdC1iYWQtYXJjaC5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90
ZXN0cy9jb3JlL2JyMi1leHRlcm5hbC9kZXRlY3Qtb3ZlcndyaXRlL0NvbmZpZy5pbgogY3JlYXRl
IG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9jb3JlL2JyMi1leHRlcm5hbC9kZXRl
Y3Qtb3ZlcndyaXRlL2V4dGVybmFsLmRlc2MKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvY29yZS9icjItZXh0ZXJuYWwvZGV0ZWN0LW92ZXJ3cml0ZS9leHRlcm5hbC5t
awogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9jb3JlL2JyMi1leHRl
cm5hbC9kZXRlY3Qtb3ZlcndyaXRlL3BhY2thZ2UvZGV0ZWN0LW92ZXJ3cml0ZS9Db25maWcuaW4K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvY29yZS9icjItZXh0ZXJu
YWwvZGV0ZWN0LW92ZXJ3cml0ZS9wYWNrYWdlL2RldGVjdC1vdmVyd3JpdGUvZGV0ZWN0LW92ZXJ3
cml0ZS5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9jb3JlL3Rl
c3RfYmFkX2FyY2gucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
Y29yZS90ZXN0X2ZpbGVfb3ZlcndyaXRlLnB5CgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
