Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42BAC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 17:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BD840952;
	Tue, 21 Jul 2026 17:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvSTNJVQZyc5; Tue, 21 Jul 2026 17:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F0BD40953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784656788;
	bh=W8VtGjP+xbIP5y6c3HfzE7flFI/EaB7mEe/hFjsrgVg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XCfceWr0BSwkcASxTCk63/BcpsmPEfnj3iBF2HG7Uru5L7K0WbUaFvDLou9o2kwK+
	 Cs9O/o41Esm3jN+MAMoH09hD2Xu//JnHb8LHLto/D3scWTB3EVWsNkVuWwcCTwAjl8
	 8AUFrlBCW/Ldp4UOwKYa5OhC1qgZy0Rb0mAWXcvTSadp3ZEf0MRsuLHdbnr6/z12i9
	 uxHuIvHLDF0FSkPdCLWM2cO00ZOjwxS2wCMWH6XHGK8l4Ii9ZpwCJhoGmeDti1ccEp
	 hLzuisuhJJdO7LAZORVETyL4LcBI30pYdVfjJPfhnRutr8SVkSff2fHtqq+IhtMz0z
	 wn4jDGp2nXPpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F0BD40953;
	Tue, 21 Jul 2026 17:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1DD942A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 17:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97D5140154
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 17:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMLd5EQ3GZr0 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 17:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8F584014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F584014D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8F584014D
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 17:59:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf2b.dip0.t-ipconnect.de [84.161.191.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56806A4C2F6B;
 Tue, 21 Jul 2026 19:59:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34166)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmEkn-00000000592-3zDy;
 Tue, 21 Jul 2026 17:59:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 19:59:38 +0200
Message-ID: <20260721175941.76461-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784656782;
 bh=jRhXT0hohb4qliMGF8/kwGng7N8TDBbMlipfhtehkBQ=;
 h=From:To:Cc:Subject:Date:From;
 b=fkZoHJuNp+2/pLexHuUqD6RCmL+17GqZeHEUxiUS84g5GHUiykwopX6nXoSBsfK4B
 94AOAQ0j22bq7ca63AZ2UEhfArC7gcaWfa6Yx934/iAS+MalpbKtyZqSHYWSxRG7qq
 rj9PPwgeuptGCjo0CisNSwSDwOEsbnFF1oeavqgLHMsL2st5tu08DG4HOWCypU/DqY
 Ja3txlgZKorW59/AHmFHsqI0H+DZeE4uB7jGAO4UHxfZ2q1tr716d7gfFl//Fr1lfk
 d5GcAqGMSeNeQ4c49tqqq4S+7UmxtobfLkfi0Haa2A9ydxsxQ2Xo58GwwOF9cz/Kh5
 enHT4bKBSEwXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fkZoHJuN
Subject: [Buildroot] [PATCH 1/1] package/dropbear: security bump version to
 2026.93
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

aHR0cHM6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvQ0hBTkdFUwoKLSBTZWN1cml0eTogRml4
IGEgdXNlLWFmdGVyLWZyZWUgaW4gWDExIGZvcndhcmRpbmcgdGhhdCBjb3VsZCBwb3NzaWJseSBs
ZWFkCiAgdG8gbWVtb3J5IGNvcnJ1cHRpb24uIFRoaXMgaXMgdnVsbmVyYWJsZSB0byBhdXRoZW50
aWNhdGVkIHVzZXJzIGlmIFgxMQogIGZvcndhcmRpbmcgaXMgZW5hYmxlZC4gQnkgZGVmYXVsdCBY
MTEgZm9yd2FyZGluZyBpcyBub3QgYnVpbHQuCiAgSW4gMjAyNi44OSB0aGUgc2VydmVyIGlzIHJ1
bm5pbmcgYXMgdGhlIGF1dGhlbnRpY2F0ZWQgdXNlciBmb3IgWDExCiAgZm9yd2FyZGluZywgaW4g
ZWFybGllciB2ZXJzaW9ucyBpdCBydW5zIGFzIHJvb3QuCiAgVGhpcyByZW1vdmVzIFgxMSAic2lu
Z2xlIGNvbm5lY3Rpb24iIHdoaWNoIGhhcyBwcm9iYWJseSBuZXZlciBiZWVuIHVzZWQuCiAgUmVw
b3J0ZWQgYnkgQHBldGVyLXBlCiAgaHR0cHM6Ly9naXRodWIuY29tL21rai9kcm9wYmVhci9jb21t
aXQvODgyZjgzODA2ZDVlMTMzMDM3Y2QyOGU5NTRhODc4OTg0ZWY3YjljNAoKQWRkZWQgcGF0Y2gg
dG8gZml4IGJ1aWxkIGVycm9ycyB3aGljaCB3b3VsZCBiZSBpbnRyb2R1Y2VkIGJ5IHRoaXMgYnVt
cDoKaHR0cHM6Ly9naXRodWIuY29tL21rai9kcm9wYmVhci9jb21taXQvODZiYWE2NmZjOTM0YmI1
NWE5MTFlYWNlYzI4ZDkzZDg2ZmIwZTZmOAoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJl
cm5kQGt1aGxzLm5ldD4KLS0tCkdpdGxhYiBwaXBlbGluZXMgcGFzc2VkOgpodHRwczovL2dpdGxh
Yi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2NvbW1pdHMvZDhlZGEwODViMmU3Y2Y3NmU1ODlmMDUy
MDM0ZmNhZDkwYzdlN2Q3ZgphZnRlciBpbmNsdWRpbmcKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI2MDYwNzEzMDIxOS4xMzUwMTI4LTgtamVh
bm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnLwp0byBmaXggYW4gb2xkIG02OGsgYnVpbGQgZXJy
b3IuCgogLi4uLzAwMDEtc2NwLWZpeC1idWlsZC13aXRoLWdjYy0xNC54LnBhdGNoICAgIHwgNDAg
KysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5oYXNoICAgICAg
ICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvZHJvcGJlYXIvZHJvcGJlYXIubWsgICAgICAgICAg
ICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9kcm9wYmVhci8wMDAxLXNjcC1m
aXgtYnVpbGQtd2l0aC1nY2MtMTQueC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHJvcGJl
YXIvMDAwMS1zY3AtZml4LWJ1aWxkLXdpdGgtZ2NjLTE0LngucGF0Y2ggYi9wYWNrYWdlL2Ryb3Bi
ZWFyLzAwMDEtc2NwLWZpeC1idWlsZC13aXRoLWdjYy0xNC54LnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjBjMmI1Y2JkYjUKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL2Ryb3BiZWFyLzAwMDEtc2NwLWZpeC1idWlsZC13aXRoLWdjYy0xNC54LnBhdGNoCkBA
IC0wLDAgKzEsNDAgQEAKK0Zyb20gMGM2NzM3MjI1NzU3NWY2ZWM1OTM2NGFiYTVjYTU3OWMxMjZi
NzY3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFZveGVsIDx2b3hlbEBhbmRyZWV2
Lm1zay5ydT4KK0RhdGU6IFR1ZSwgMjEgSnVsIDIwMjYgMTk6Mjg6MDAgKzAyMDAKK1N1YmplY3Q6
IFtQQVRDSF0gc2NwOiBmaXggYnVpbGQgd2l0aCBnY2MgPj0gMTQueAorTUlNRS1WZXJzaW9uOiAx
LjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAorCitGaXhlcyBidWlsZCBlcnJvcnMgc2VlbiB3aXRoIGdjYyAx
NC54OgorCitzcmMvc2NwLmM6IEluIGZ1bmN0aW9uIOKAmHNpbmvigJk6CitzcmMvc2NwLmM6MTIx
NDozMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGFzY2lpX2lz
ZGlnaXTigJkKKyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KKworc3JjL3NjcC5j
OiBJbiBmdW5jdGlvbiDigJhva25hbWXigJk6CitzcmMvc2NwLmM6MTUwMToyMjogZXJyb3I6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGFzY2lpX2lzYWxwaGHigJkKKyBbLVdp
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ta2ovZHJvcGJlYXIvcHVsbC80NzQKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMg
PGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHNyYy9zY3AuYyB8IDEgKworIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvc3JjL3NjcC5jIGIvc3JjL3NjcC5jCitp
bmRleCBkNzI2NmZkZC4uNjMzYjRkYmEgMTAwNjQ0CistLS0gYS9zcmMvc2NwLmMKKysrKyBiL3Ny
Yy9zY3AuYworQEAgLTgxLDYgKzgxLDcgQEAKKyAjaW5jbHVkZSAiY29tcGF0LmgiCisgI2luY2x1
ZGUgInNjcG1pc2MuaCIKKyAjaW5jbHVkZSAicHJvZ3Jlc3NtZXRlci5oIgorKyNpbmNsdWRlICJk
YnV0aWwuaCIKKyAKKyB2b2lkIGJ3bGltaXQoaW50KTsKKyAKKy0tIAorMi40Ny4zCisKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZHJvcGJlYXIvZHJvcGJlYXIuaGFzaCBiL3BhY2thZ2UvZHJvcGJlYXIv
ZHJvcGJlYXIuaGFzaAppbmRleCA5ZGY4MWVhNGI1Li4yNTM4MTMyNDYzIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLmhhc2gKKysrIGIvcGFja2FnZS9kcm9wYmVhci9kcm9w
YmVhci5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBGcm9tIGh0dHBzOi8vbWF0dC51Y2MuYXNuLmF1
L2Ryb3BiZWFyL3JlbGVhc2VzL1NIQTI1NlNVTS5hc2MKLXNoYTI1NiAgOTFkY2I1MjM0ZGU4ZGVh
NjhkZDgyYzU1NDExYzlmYzk4NmI0NTdhYjU4MzcyYTc4MGVlOGE4NzA0MTljMmY3ZSAgZHJvcGJl
YXItMjAyNi45Mi50YXIuYnoyCitzaGEyNTYgIDMxMGE2MDg3OTUyODk3YzE4MmVmYmUxNjA4OGZh
MGM0ZDA3YzQ2N2U4NTBhMjI2OTk0NzIxMzcyNzhmYWJmMDkgIGRyb3BiZWFyLTIwMjYuOTMudGFy
LmJ6MgogCiAjIExpY2Vuc2UgZmlsZSwgbG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICBhOTljZTY1
N2Q3OTBiNzYxYzEzMmVlN2UwZGUxOGVkYjQzN2FlNjM2MWU1MzZkOTkxYzZhMTJmMzZlNzcwNDQ1
ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rIGIvcGFj
a2FnZS9kcm9wYmVhci9kcm9wYmVhci5tawppbmRleCA5MDQxMTdiOTA2Li5lODhkMWRiZGYxIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rCisrKyBiL3BhY2thZ2UvZHJv
cGJlYXIvZHJvcGJlYXIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1EUk9QQkVBUl9WRVJTSU9OID0gMjAyNi45MgorRFJPUEJFQVJfVkVSU0lPTiA9IDIw
MjYuOTMKIERST1BCRUFSX1NJVEUgPSBodHRwczovL21hdHQudWNjLmFzbi5hdS9kcm9wYmVhci9y
ZWxlYXNlcwogRFJPUEJFQVJfU09VUkNFID0gZHJvcGJlYXItJChEUk9QQkVBUl9WRVJTSU9OKS50
YXIuYnoyCiBEUk9QQkVBUl9MSUNFTlNFID0gTUlULCBCU0QtMi1DbGF1c2UsIFB1YmxpYyBkb21h
aW4KLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
