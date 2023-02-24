Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E3C61DA4
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 14:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B81008149D;
	Fri, 24 Feb 2023 14:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B81008149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZG_qekMIGp0l; Fri, 24 Feb 2023 14:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D22418140D;
	Fri, 24 Feb 2023 14:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D22418140D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 121911BF2C2
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 14:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE6B340276
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 14:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6B340276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fR5ZEbussES for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 14:33:13 +0000 (UTC)
X-Greylist: delayed 03:00:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D9B40263
Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net
 [178.33.251.118])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98D9B40263
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 14:33:13 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.146.86])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 7AFD025887
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 10:56:47 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6t8p5 (unknown [10.110.115.59])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 300CA1FD2E;
 Fri, 24 Feb 2023 10:56:47 +0000 (UTC)
Received: from armadeus.com ([37.59.142.95])
 by ghost-submission-6684bf9d7b-6t8p5 with ESMTPSA
 id lPR/B++X+GNVIh8AogAW8g
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 24 Feb 2023 10:56:47 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 11:53:15 +0100
Message-Id: <20230224105315.16171-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10947969219802754027
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudekfedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffgfevieffleetlefgteejffeuffeuhfffieekhfekgffhjeejueefudetgeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0011f58c246-9c9f-47c4-9994-ae5ebb1cebbb,
 B81A516C378EC31886751DE77157DC83CB22160B)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-g2d: drop
 BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJtIGFuZCBhYXJjaDY0IHBhY2thZ2VzIGRvbid0IGNvbnRhaW4gZXhhbXBsZXMgYW55bW9yZSBz
byBkcm9wIHRoZQpjb25maWcgb3B0aW9uIHRvIGluc3RhbGwgdGhlbSB0byBwcmV2ZW50IGJ1aWxk
IGZhaWx1cmUgd2hlbiBzZWxlY3RlZDoKCj4+PiBpbXgtZ3B1LWcyZCA2LjQuMy5wNC40LWFybSBJ
bnN0YWxsaW5nIHRvIHRhcmdldApta2RpciAtcCAvaG9tZS9zc3p5L2JyLXRlc3QtcGtnL2Jvb3Rs
aW4tYXJtdjctZ2xpYmMvdGFyZ2V0L3Vzci9zaGFyZS9leGFtcGxlcy8KY3AgLWEgL2hvbWUvc3N6
eS9ici10ZXN0LXBrZy9ib290bGluLWFybXY3LWdsaWJjL2J1aWxkL2lteC1ncHUtZzJkLTYuNC4z
LnA0LjQtYXJtL2dwdS1kZW1vcy9vcHQvKiAvaG9tZS9zc3p5L2JyLXRlc3QtcGtnL2Jvb3RsaW4t
YXJtdjctZ2xpYmMvdGFyZ2V0L3Vzci9zaGFyZS9leGFtcGxlcy8KY3A6IGNhbm5vdCBzdGF0ICcv
aG9tZS9zc3p5L2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjctZ2xpYmMvYnVpbGQvaW14LWdwdS1n
MmQtNi40LjMucDQuNC1hcm0vZ3B1LWRlbW9zL29wdC8qJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQptYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6Mzg0OiAvaG9tZS9zc3p5L2Jy
LXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjctZ2xpYmMvYnVpbGQvaW14LWdwdS1nMmQtNi40LjMucDQu
NC1hcm0vLnN0YW1wX3RhcmdldF9pbnN0YWxsZWRdIEVycm9yIDEKCkZpeGVzOiBiODQ1NTdiNTg4
YjMgKCJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQ6IGJ1bXAgdmVyc2lvbiB0byA2
LjQuMy5wNC40IikKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGll
bi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysrCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LWdwdS1nMmQvQ29uZmlnLmluICAgICAgfCA5IC0tLS0tLS0tLQogcGFja2FnZS9mcmVlc2Nh
bGUtaW14L2lteC1ncHUtZzJkL2lteC1ncHUtZzJkLm1rIHwgOCAtLS0tLS0tLQogMyBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0Nv
bmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5CmluZGV4IDdmNjk0NjJmMmVjMS4uYWYx
ZDhjYzFkYzlmIDEwMDY0NAotLS0gYS9Db25maWcuaW4ubGVnYWN5CisrKyBiL0NvbmZpZy5pbi5s
ZWdhY3kKQEAgLTE0Niw2ICsxNDYsMTIgQEAgZW5kaWYKIAogY29tbWVudCAiTGVnYWN5IG9wdGlv
bnMgcmVtb3ZlZCBpbiAyMDIzLjAyIgogCitjb25maWcgQlIyX1BBQ0tBR0VfSU1YX0dQVV9HMkRf
RVhBTVBMRVMKKwlib29sICJpbXgtZ3B1LWcyZCBleGFtcGxlcyByZW1vdmVkIgorCXNlbGVjdCBC
UjJfTEVHQUNZCisJaGVscAorCSAgVGhlIGV4YW1wbGVzIGFyZSBub3QgcHJvdmlkZWQgYnkgTlhQ
IGFueW1vcmUuCisKIGNvbmZpZyBCUjJfS0VSTkVMX0hFQURFUlNfNl8wCiAJYm9vbCAia2VybmVs
IGhlYWRlcnMgdmVyc2lvbiA2LjAueCBhcmUgbm8gbG9uZ2VyIHN1cHBvcnRlZCIKIAlzZWxlY3Qg
QlIyX0xFR0FDWQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtZzJk
L0NvbmZpZy5pbiBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9Db25maWcuaW4K
aW5kZXggYWVjYTA4N2Y4NjViLi5jMTQzYjE3YzQ3ZmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9mcmVlc2NhbGUt
aW14L2lteC1ncHUtZzJkL0NvbmZpZy5pbgpAQCAtMTgsMTIgKzE4LDMgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX0lNWF9HUFVfRzJECiAKIAkgIFRoaXMgbGlicmFyeSBpcyBwcm92aWRlZCBieSBOWFAg
YXMtaXMgYW5kIGRvZXNuJ3QgaGF2ZSBhbgogCSAgdXBzdHJlYW0uCi0KLWlmIEJSMl9QQUNLQUdF
X0lNWF9HUFVfRzJECi0KLWNvbmZpZyBCUjJfUEFDS0FHRV9JTVhfR1BVX0cyRF9FWEFNUExFUwot
CWJvb2wgImluc3RhbGwgZXhhbXBsZXMiCi0JaGVscAotCSAgQ29weSB0aGUgVml2YW50ZSBHMkQg
ZXhhbXBsZXMgdG8gdGhlIHRhcmdldC4KLQotZW5kaWYKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tayBiL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tawppbmRleCBkOTRkYTI0ZDhmMGUuLjQyYTFm
ZTcwY2YxMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtZzJkL2lt
eC1ncHUtZzJkLm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgt
Z3B1LWcyZC5tawpAQCAtMjYsMTUgKzI2LDcgQEAgZGVmaW5lIElNWF9HUFVfRzJEX0lOU1RBTExf
U1RBR0lOR19DTURTCiAJY3AgLWEgJChARCkvZzJkL3Vzci8qICQoU1RBR0lOR19ESVIpL3Vzcgog
ZW5kZWYKIAotaWZlcSAoJChCUjJfUEFDS0FHRV9JTVhfR1BVX0cyRF9FWEFNUExFUykseSkKLWRl
ZmluZSBJTVhfR1BVX0cyRF9JTlNUQUxMX0VYQU1QTEVTCi0JbWtkaXIgLXAgJChUQVJHRVRfRElS
KS91c3Ivc2hhcmUvZXhhbXBsZXMvCi0JY3AgLWEgJChARCkvZ3B1LWRlbW9zL29wdC8qICQoVEFS
R0VUX0RJUikvdXNyL3NoYXJlL2V4YW1wbGVzLwotZW5kZWYKLWVuZGlmCi0KIGRlZmluZSBJTVhf
R1BVX0cyRF9JTlNUQUxMX1RBUkdFVF9DTURTCi0JJChJTVhfR1BVX0cyRF9JTlNUQUxMX0VYQU1Q
TEVTKQogCWNwIC1hICQoQEQpL2cyZC91c3IvbGliICQoVEFSR0VUX0RJUikvdXNyCiBlbmRlZgog
Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
