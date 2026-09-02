Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0D0C61DFD
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 08:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F104D40A1F;
	Wed,  2 Sep 2026 08:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlQAsBFNGz7x; Wed,  2 Sep 2026 08:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788336738;
	bh=6EdaGh9fMp2xLaAcI2pP2S+/rJYdmxs4Wsks/P07rB4=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IXXqkxS2CvkAdAdmCkRppVrZboq36Y+6O0cSnr8+zigBf+hId5PJeSxakI9V5s3WN
	 1Qm1ypZ5usrMB1JBB5H4qU5liSPWSEUuapDMnIP5fwQw/3SfpHR/r0ICObUgvfKPgl
	 7Ngvcovp1n5yqqbADsvZdspJ+HkXRTj75EsM3EkjCoKIR6va7yrCe4J2+oSBfU+JE7
	 XrjItsFniW83cGK4pSuKRrLhR6NnbmsST3DGajS+LTEmQ7co3J0K5/T6me0uBI2b2/
	 EwePr4bVBD5XG7DmivQ9O1CvUjw5Qx6Jnl0Y/uZTweqrZKsjRe+f/QGPw1pXOqqKa4
	 /aWIuBcBx9nIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB93A406CC;
	Wed,  2 Sep 2026 08:12:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 307E6127
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 08:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D8F780B39
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 08:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOhBkWbo1nId for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 08:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E79D980BAD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 08:12:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6A79F1A1927
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 08:12:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 373C06053C
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 08:12:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0DAF11C79315; 
 Wed,  2 Sep 2026 10:12:06 +0200 (CEST)
Date: Wed, 02 Sep 2026 10:11:49 +0200
MIME-Version: 1.0
Message-Id: <20260902-revert-openscap-patch-v1-1-f56161b6c7bd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche3aTWqWir0I81DLAeihNtxoTw
 rtb5fglM/9KiixQujUrZbxFZYkVx0NDYfZxAstQTdZYZ67Gch0hF14SogafOPkSZnYXi1Pnzq7
 tRqrflDHK59/t77v19XgilF+Mtu0Lab1ZfnkAAAA=
X-Change-ID: 20260902-revert-openscap-patch-672e3864658f
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/openscap: drop duplicate patch
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IGJkNWIyNjdiMWRlMCAoInBhY2thZ2Uvb3BlbnNjYXA6IGZpeCBidWlsZCBmYWlsdXJl
IHdpdGggZGJ1cyBhbmQKbXVzbCIpIGJyb3VnaHQgYW4gdXBzdHJlYW0gcGF0Y2ggdG8gZml4IGEg
YnVpbGQgZmFpbHVyZSBvbiB0aGUgb3BlbnNjYXAKcGFja2FnZSwgZGV0ZWN0ZWQgYnkgdGhlIGF1
dG9idWlsZGVyIG9uIGJ1aWxkcm9vdCAyMDI2LjAyLngsIHdoaWNoIGhhZApvcGVuc2NhcCAxLjMu
MTIgYXQgdGhhdCB0aW1lLiBiZDViMjY3YjFkZTAgaGFzIHJlY2VudGx5IGJlZW4gbWVyZ2VkIG9u
Cm1hc3Rlcjsgb3BlbnNjYXAgaGFzIGFscmVhZHkgYmVlbiBidW1wZWQgdG8gMS40LjQgb24gdGhp
cyBicmFuY2gsIGFuZCBzbwppdCBhbHJlYWR5IGJyaW5ncyB0aGUgbmVlZGVkIGZpeCBmb3IgbXVz
bCtkYnVzIGJ1aWxkIGNvbmZpZ3VyYXRpb25zLApoZW5jZSBtYWtpbmcgdGhlIHBhdGNoIHN0ZXAg
ZmFpbC4gVGhpcyB1cHN0cmVhbSBwYXRjaCBpcyB0aGVuIG5vdCBuZWVkZWQKYW55bW9yZSBvbiBh
bnkgbWFpbnRhaW5lZCBicmFuY2guCgpGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzL2QxMWQwYjgyZGNkYjRiZjEwZjZjMzdkYjhiZGJjNDJhNzhiZGYyOGIvCkZp
eGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDM5N2E0ZWY5NGNj
ZjQ4MmYxYWI5ZDI0YjYzMzRhZGIwMjIyYTU4MC8KU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhv
csOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tClVwIHRvIG15IGtub3dsZWRnZSB0
aGUgZmF1bHR5IHBhdGNoIGhhcyBiZWVuIG1lcmdlZCBvbmx5IG9uIG1hc3Rlciwgc28KdGhlIHJl
dmVydCBpcyBvbmx5IG5lZWRlZCBvbiBtYXN0ZXIuCi0tLQogLi4uMDItT1ZBTC1wcm9iZXMtYWRk
LW1pc3NpbmctaGVhZGVyLWluY2x1ZGUucGF0Y2ggfCA0OCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9v
cGVuc2NhcC8wMDAyLU9WQUwtcHJvYmVzLWFkZC1taXNzaW5nLWhlYWRlci1pbmNsdWRlLnBhdGNo
IGIvcGFja2FnZS9vcGVuc2NhcC8wMDAyLU9WQUwtcHJvYmVzLWFkZC1taXNzaW5nLWhlYWRlci1p
bmNsdWRlLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwYzc1OThiMmI1ZTEu
LjAwMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL29wZW5zY2FwLzAwMDItT1ZBTC1wcm9iZXMtYWRk
LW1pc3NpbmctaGVhZGVyLWluY2x1ZGUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0OCArMCww
IEBACi1Gcm9tIGFiNjliNzZjYjQwZDZmMzVkMjUyMjQ2ZTk2NTI0NTgwNGIxNzU5MWYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiA9P1VURi04P3E/QWxleGlzPTIwTG90aG9yPUMzPUE5
Pz0gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotRGF0ZTogVGh1LCAxMyBBdWcgMjAyNiAx
NToxODoxNSArMDIwMAotU3ViamVjdDogW1BBVENIXSBPVkFML3Byb2JlczogYWRkIG1pc3Npbmcg
aGVhZGVyIGluY2x1ZGUKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotT3Bl
bnNjYXAgYnVpbGQgY2FuIGZhaWwgd2l0aCB0aGUgZm9sbG93aW5nIGxvZyB3aGVuCi0tV2ltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIGlzIHR1cm5lZCBpbnRvIGFuIGVycm9yOgotCi1JbiBm
aWxlIGluY2x1ZGVkIGZyb20gWy4uLl0vc3JjL09WQUwvcHJvYmVzL3VuaXgvbGludXgvc3lzdGVt
ZHVuaXRwcm9wZXJ0eV9wcm9iZS5jOjM4OgotWy4uLl0vc3JjL09WQUwvcHJvYmVzL3VuaXgvbGlu
dXgvc3lzdGVtZHNoYXJlZC5oOiBJbiBmdW5jdGlvbiDigJhnZXRfYWxsX3N5c3RlbWRfdW5pdHPi
gJk6Ci1bLi4uXS9zcmMvT1ZBTC9wcm9iZXMvdW5peC9saW51eC9zeXN0ZW1kc2hhcmVkLmg6MTg4
OjUwOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYmFzZW5hbWXi
gJk7IGRpZCB5b3UgbWVhbiDigJhyZW5hbWXigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQotICAxODggfCAgICAgICAgICAgICAgICAgY2hhciAqdW5pdF9uYW1lX3MgPSBvc2Nh
cF9zdHJkdXAoYmFzZW5hbWUodmFsdWUuc3RyKSk7Ci0gICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgotICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVuYW1lCi1JbiBmaWxl
IGluY2x1ZGVkIGZyb20gWy4uLl0vc3JjL09WQUwvcHJvYmVzL3VuaXgvbGludXgvc3lzdGVtZHVu
aXRkZXBlbmRlbmN5X3Byb2JlLmM6Mzc6Ci1bLi4uXS9zcmMvT1ZBTC9wcm9iZXMvdW5peC9saW51
eC9zeXN0ZW1kc2hhcmVkLmg6IEluIGZ1bmN0aW9uIOKAmGdldF9hbGxfc3lzdGVtZF91bml0c+KA
mToKLVsuLi5dL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFyZWQuaDoxODg6
NTA6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhiYXNlbmFtZeKA
mTsgZGlkIHlvdSBtZWFuIOKAmHJlbmFtZeKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCi0gIDE4OCB8ICAgICAgICAgICAgICAgICBjaGFyICp1bml0X25hbWVfcyA9IG9zY2Fw
X3N0cmR1cChiYXNlbmFtZSh2YWx1ZS5zdHIpKTsKLSAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Ci0gICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW5hbWUKLQotQWRkIHRo
ZSBtaXNzaW5nIGhlYWRlciBpbmNsdWRlIHBvaW50ZWQgYnkgYG1hbiAzIGJhc2VuYW1lYCB0byBm
aXggdGhlCi1lcnJvci4KLQotVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9v
cGVuc2NhcC9jb21taXQvYWI2OWI3NmNiNDBkNmYzNWQyNTIyNDZlOTY1MjQ1ODA0YjE3NTkxZgot
U2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNv
bT4KLS0tLQotIHNyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFyZWQuaCB8IDEg
KwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL09W
QUwvcHJvYmVzL3VuaXgvbGludXgvc3lzdGVtZHNoYXJlZC5oIGIvc3JjL09WQUwvcHJvYmVzL3Vu
aXgvbGludXgvc3lzdGVtZHNoYXJlZC5oCi1pbmRleCA4NzlhZTViZTlkNmMuLjU3ZTk0Y2E2ZjQ5
ZSAxMDA2NDQKLS0tLSBhL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFyZWQu
aAotKysrIGIvc3JjL09WQUwvcHJvYmVzL3VuaXgvbGludXgvc3lzdGVtZHNoYXJlZC5oCi1AQCAt
MzUsNiArMzUsNyBAQAotICNpbmNsdWRlIDxjb25maWcuaD4KLSAjZW5kaWYKLSAKLSsjaW5jbHVk
ZSA8bGliZ2VuLmg+Ci0gI2luY2x1ZGUgPGxpbWl0cy5oPgotICNpbmNsdWRlIDxzdGRpby5oPgot
ICNpbmNsdWRlICJjb21tb24vZGVidWdfcHJpdi5oIgotLS0gCi0yLjU1LjAKLQoKLS0tCmJhc2Ut
Y29tbWl0OiA3OWZkNjI0MWU0MzQ3ZjY3ZDY1OWNjMDI2Njk0NDgzOTdiNDU4ZDUyCmNoYW5nZS1p
ZDogMjAyNjA5MDItcmV2ZXJ0LW9wZW5zY2FwLXBhdGNoLTY3MmUzODY0NjU4ZgoKQmVzdCByZWdh
cmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
