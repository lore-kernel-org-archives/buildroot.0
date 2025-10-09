Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A582CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 16:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040AC84110;
	Thu,  9 Oct 2025 16:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwqkAo98Bu6j; Thu,  9 Oct 2025 16:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE89284103
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE89284103;
	Thu,  9 Oct 2025 16:56:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA8C721B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 16:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A992784104
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSe-GEUIjNab for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 16:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2078E840EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2078E840EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2078E840EB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 16:56:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b31b.dip0.t-ipconnect.de [84.161.179.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3861A4C623E;
 Thu,  9 Oct 2025 18:56:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34710)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6twG-000000004we-1MWD;
 Thu, 09 Oct 2025 16:56:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin@orange.com>
Date: Thu,  9 Oct 2025 18:56:24 +0200
Message-ID: <20251009165624.3914222-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760028984;
 bh=11BYhIsVo3jTDpsQfiOyjKvPmoBqfVmX+eMdaQmy+TE=;
 h=From:To:Cc:Subject:Date:From;
 b=ajDgdAEBqt5jsyDCP9cb7gezpNbD2ySbGse/fZKJ/wpJerjgXq2AeHlKTewb9slyU
 7RhbEU/Nc9t5MMBaa4YEQtZ8Wy/oOd2dShDa+qAfs2vN2qm0Lr3txxoBH0gRZIAZN3
 mUIx8M7jI3KgEExaKRI0cbD77lokpkBGtvsweLxHMSM5yAMWGh2thiGi7Ivs9CQjOF
 sPgW/hlcAe1KiiJiorJk1JYaAT8XFvwWHwrBa9ED6pGKGQ59iorE5Vkkx5o4RpSqpD
 2kSc4kdhBoYlryCQ8kQ84iOTpoGzbc1/U//J1URH7WRO3sUPxxuN459ih8K1Z5u6D1
 lejqhRRlhTyRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ajDgdAEB
Subject: [Buildroot] [PATCH 1/1] package/gpsd: remove -std=gnu++98 from
 CFLAGS
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gMjAxNiBidWlsZHJvb3QgY29tbWl0IGI0YzA1MGU5YWZlZDdhOGRjMzAyZTZlMTAxNGNjNGZm
YjUwODU5MGQgYWRkZWQKLXN0ZD1nbnUrKzk4IGFsc28gdG8gQ0ZMQUdTIGtub3dpbmcgdGhhdCBp
dCB3aWxsIGNhdXNlIHdhcm5pbmdzOgoKaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUv
aHRtbC9ncHNkLWRldi8yMDE2LTA5L21zZzAwMDgyLmh0bWwKJ0FsdGhvdWdoIHRoaXMgbGVhZHMg
dG8gbG90cyBvZiB3YXJuaW5ncyBvbiBldmVyeSBjb21waWxhdGlvbiB3aXRoIGdjYzoKImNjMTog
d2FybmluZzogY29tbWFuZCBsaW5lIG9wdGlvbiAnLXN0ZD1nbnUrKzk4JyBpcyB2YWxpZCBmb3Ig
QysrL09iakMrKyBidXQgbm90IGZvciBDIicKClRoZXNlIHdhcm5pbmdzIGFyZSBzdGlsbCBwcmVz
ZW50IGJ1dCBjYXVzZSBhIG1pc2RldGVjdGlvbiBpbiBjb25maWd1cmUKCiAgICBDaGVja2luZyBp
ZiBzdHJlcnJvcl9yKCkgcmV0dXJucyBpbnQuLi4gbm8KCmJlY2F1c2UgaGVyZSB3YXJuaW5ncyBh
cmUgdHJlYXRlZCBhcyBlcnJvcnMsIHF1b3RpbmcgY29uZmlnLmxvZzoKCmNjMTogZXJyb3I6IGNv
bW1hbmQtbGluZSBvcHRpb24gw6LigqzLnC1zdGQ9Z251Kys5OMOi4oKs4oSiIGlzIHZhbGlkIGZv
ciBDKysvT2JqQysrIGJ1dCBub3QgZm9yIEMgWy1XZXJyb3JdCmNjMTogYWxsIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpJbiAyMDE3IHVwc3RyZWFtIGNvbW1pdHRlZApodHRwczov
L2dpdGxhYi5jb20vZ3BzZC9ncHNkLy0vY29tbWl0L2QyODdjNzZmNGYyZTFmZmQyNzVkYTQxYjg0
ZjllMDhlYTdmNzQzNDQKd2hpY2ggYWRkZWQgInN0ZDo6IiBuYW1lc3BhY2UgcHJlZml4ZXMgYW5k
IGZpeGVkIHRoZSBvcmlnaW5hbCBwcm9ibGVtLgoKLXN0ZD1nbnUrKzk4IGJlaW5nIHJlbW92ZWQg
ZnJvbSBDRkxBR1MgbGV0cyBjb25maWd1cmUgY29ycmVjdGx5IGRldGVjdApzdHJlcnJvcl9yKCk6
CgogICAgQ2hlY2tpbmcgaWYgc3RyZXJyb3JfcigpIHJldHVybnMgaW50Li4uIHllcwoKYW5kIG5v
IG5ldyBidWlsZCBlcnJvcnMgb2NjdXI6CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFy
bS1hYXJjaDY0IFsgMS8zNV06IE9LCiAgICAgICAgICAgICAgICAgICBib290bGluLWFhcmNoNjQt
Z2xpYmMgWyAyLzM1XTogT0sKICAgICAgICAgICAgICAgYm9vdGxpbi1hcmNsZS1oczM4LXVjbGli
YyBbIDMvMzVdOiBPSwogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsg
NC8zNV06IE9LCiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWyA1LzM1
XTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBbIDYvMzVdOiBT
S0lQUEVECiAgICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3LW11c2wgWyA3LzM1XTog
T0sKICAgICAgICAgICAgICAgIGJvb3RsaW4tbTY4ay01MjA4LXVjbGliYyBbIDgvMzVdOiBTS0lQ
UEVECiAgICAgICAgICAgICAgIGJvb3RsaW4tbTY4ay02ODA0MC11Y2xpYmMgWyA5LzM1XTogT0sK
ICAgICAgICAgICAgIGJvb3RsaW4tbWljcm9ibGF6ZWVsLXVjbGliYyBbMTAvMzVdOiBPSwogICAg
ICAgICAgICAgICAgYm9vdGxpbi1taXBzZWwzMnI2LWdsaWJjIFsxMS8zNV06IE9LCiAgICAgICAg
ICAgICAgICAgICBib290bGluLW1pcHNlbC11Y2xpYmMgWzEyLzM1XTogT0sKICAgICAgICAgICAg
ICAgICBib290bGluLW9wZW5yaXNjLXVjbGliYyBbMTMvMzVdOiBPSwogICAgICAgIGJvb3RsaW4t
cG93ZXJwYzY0bGUtcG93ZXI4LWdsaWJjIFsxNC8zNV06IE9LCiAgICAgICAgICAgYm9vdGxpbi1w
b3dlcnBjLWU1MDBtYy11Y2xpYmMgWzE1LzM1XTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3Rs
aW4tcmlzY3YzMi1nbGliYyBbMTYvMzVdOiBPSwogICAgICAgICAgICAgICAgICAgYm9vdGxpbi1y
aXNjdjY0LWdsaWJjIFsxNy8zNV06IE9LCiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1yaXNj
djY0LW11c2wgWzE4LzM1XTogT0sKICAgICAgICAgICAgICAgICBib290bGluLXMzOTB4LXoxMy1n
bGliYyBbMTkvMzVdOiBPSwogICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1zaDQtdWNsaWJj
IFsyMC8zNV06IE9LCiAgICAgICAgICAgICAgICAgICBib290bGluLXNwYXJjNjQtZ2xpYmMgWzIx
LzM1XTogT0sKICAgICAgICAgICAgICAgICAgICBib290bGluLXNwYXJjLXVjbGliYyBbMjIvMzVd
OiBPSwogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0LWdsaWJjIFsyMy8zNV06IE9L
CiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0LW11c2wgWzI0LzM1XTogT0sKICAg
ICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0LXVjbGliYyBbMjUvMzVdOiBPSwogICAgICAg
ICAgICAgICAgICAgYm9vdGxpbi14ODYtaTY4Ni1tdXNsIFsyNi8zNV06IE9LCiAgICAgICAgICAg
ICAgICAgICBib290bGluLXh0ZW5zYS11Y2xpYmMgWzI3LzM1XTogT0sKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyLWFybS1iYXNpYyBbMjgvMzVdOiBTS0lQUEVECiAgICAgICAgICAgICAg
ICAgICAgYnItYXJtLWZ1bGwtbm90aHJlYWQgWzI5LzM1XTogU0tJUFBFRAogICAgICAgICAgICAg
ICAgICAgICAgYnItYXJtLWZ1bGwtc3RhdGljIFszMC8zNV06IFNLSVBQRUQKICAgICAgICAgICAg
ICAgICAgIGJyLWkzODYtcGVudGl1bTQtZnVsbCBbMzEvMzVdOiBGQUlMRUQKICAgICAgICAgICAg
ICAgICAgICAgIGJyLW1pcHM2NC1uNjQtZnVsbCBbMzIvMzVdOiBPSwogICAgICAgICAgICAgICAg
IGJyLW1pcHM2NHI2LWVsLWhmLWdsaWJjIFszMy8zNV06IE9LCiAgICAgICAgICAgICAgIGJyLXBv
d2VycGMtNjAzZS1iYXNpYy1jcHAgWzM0LzM1XTogU0tJUFBFRAogICAgICAgICAgICAgICBici1w
b3dlcnBjNjQtcG93ZXI3LWdsaWJjIFszNS8zNV06IE9LCjM1IGJ1aWxkcywgNiBza2lwcGVkLCAx
IGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCgpU
aGUgYnItaTM4Ni1wZW50aXVtNC1mdWxsIGVycm9yIGlzIG5vdCBjYXVzZWQgYnkgZ3BzZDoKCnBh
Y2thZ2UvcHl0aG9uMy9weXRob24zLm1rOjMyNDogKioqIFB5dGhvbjMgZG9lc24ndCB3b3JrIHdp
dGggdUNsaWJjIGFuZAprZXJuZWwgaGVhZGVycyA8IDUuMS4gUGxlYXNlIHVzZSBhIGRpZmZlcmVu
dCB0byBvbGNoYWluIG9yIHVuc2VsZWN0ClB5dGhvbjMuLgoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy81MmQ3NDdkMzNkNzE0ZWExMGI5ZTdlZTEwYWRlYWRk
OWU0NTEyYzJkLwoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4K
LS0tCiBwYWNrYWdlL2dwc2QvZ3BzZC5tayB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dwc2QvZ3BzZC5tayBiL3BhY2thZ2UvZ3BzZC9n
cHNkLm1rCmluZGV4IDFiMjAyMTBjNDkuLmM1YzRkYWQyOTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
Z3BzZC9ncHNkLm1rCisrKyBiL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCkBAIC0zNyw3ICszNyw2IEBA
IGVuZGlmCiAjIEJ1aWxkIGxpYmdwc21tIGlmIHdlJ3ZlIGdvdCBDKysKIGlmZXEgKCQoQlIyX0lO
U1RBTExfTElCU1REQ1BQKSx5KQogR1BTRF9MREZMQUdTICs9IC1sc3RkYysrCi1HUFNEX0NGTEFH
UyArPSAtc3RkPWdudSsrOTgKIEdQU0RfQ1hYRkxBR1MgKz0gLXN0ZD1nbnUrKzk4CiBHUFNEX1ND
T05TX09QVFMgKz0gbGliZ3BzbW09eWVzCiBlbHNlCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
