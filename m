Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006E2C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 21:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1852B605CF;
	Sun, 16 Aug 2026 21:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7RX8X_xWvyx; Sun, 16 Aug 2026 21:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF1B605F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786914941;
	bh=inJ7o7/OClphdfaFDJyzljHRXX3H2Z0z6jDwtHrwNqA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PueQ8zwYylUdLVB3OcN753qCEk1h3szfxa1YHDoa7yF+fq+5QtcOOSCTA0idQKIV5
	 O8JqA3P61Q804mrxA/9cTxJgnvbGlLxjCxJsNJdeLa8C4DiKsube19VIu4RzVvfkJf
	 MG/w2vGsffdl0fJLcnMD1JoTRuzOZnxHQo4X2XABXqvSXjQocUjdrE6dekfldQC3bk
	 x6C0BragGl0cloM2nFTB2QSO1qW3I2PxCeP5Lb5iCz/YVUS5rcKzgTJmanhK3CRtb4
	 dsei6T7ymB7WHLqaQmgachXHfQ4okcRFhq96lZVa11aUwBqdLKOx2Cc0qvgEStz61S
	 FV7qsN3tAvTmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF1B605F8;
	Sun, 16 Aug 2026 21:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB513A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B2E605F8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 21:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDLJ5qjr6N4q for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 21:15:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01648605F1
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01648605F1
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Xc3C1mX0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01648605F1
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 21:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786914936;
 bh=U0GFJW35GSZmK9io+SaTTjH2wqQKSuW5PMxStXl/WD4=;
 h=From:To:Cc:Subject:Date:From;
 b=Xc3C1mX0PuPeHLz91qzo0OA3e6A/1AJpTQGnu0w/V4cmzW1OBQBAXtatIp15K97Ch
 J5E3gpsBS870k9Wbc1uVGL6AsZoN26OuSfMFnSe6bIlx9NdPYi0LzsTG/1t19PKLF5
 /+ebFIbigNc1CxcoEj+mXevY32s+4mTGzMzVjwMLT0/Gncq0bSYZBA8WwiGkMtwZRz
 6jYkR72bJ4y7peWGg6wgWAb8h/qt2pFj2bklzUewDr1XYXHAxmwE945xDRzAOomNQH
 m/TVmh5cgqRbKrzwK2MfyVyibyGGDKzQO38960YMClo5oreUtU31J85b2hJXBtFucH
 4YU4Hx1wvMNhQ==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E43B9A4C4BFE;
 Sun, 16 Aug 2026 23:15:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59198)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wviCe-000000001af-2SaO;
 Sun, 16 Aug 2026 21:15:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 23:15:35 +0200
Message-ID: <20260816211536.3994135-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/2] package/libnl: fix build with kernel < 4.15
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGRyb290IGNvbW1pdCAwZjJlOWNjODc4NDcxNWJkZjE4ZTcyYzQzM2ZlOWJlY2U0NTM3Zjg1
IGJ1bXBlZCB0aGUKcGFja2FnZSBmcm9tIDMuMTEuMCB0byAzLjEyLjAuIFRoaXMgYnVtcCBpbmNs
dWRlcyB1cHN0cmVhbSBjb21taXQKaHR0cHM6Ly9naXRodWIuY29tL3Rob20zMTEvbGlibmwvY29t
bWl0LzlmODk0NTI1MWRhNDA0ZmI1OTc3OGVkYzc0YmU1Nzc1MDkxZTFmNDQKd2hpY2ggYWRkZWQg
dGhlIHVzYWdlIG9mIGVudW1zIG5vdCBwcmVzZW50IGluIG9sZGVyIGtlcm5lbCB2ZXJzaW9ucy4K
ClRoZSBHaXRsYWIgcGlwZWxpbmVzIGNhdWdodCB0aGUgYnVpbGQgZXJyb3JzIHdpdGggdGhlIGRl
ZmNvbmZpZwpib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkOgoKbGliL3JvdXRlL25oX2VuY2FwX2ls
YS5jOjUwOjE5OiBlcnJvcjog4oCYSUxBX0FUVFJfSURFTlRfVFlQReKAmSB1bmRlY2xhcmVkCiAo
Zmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCmxpYi9yb3V0ZS9uaF9lbmNhcF9pbGEuYzo1Mzox
OTogZXJyb3I6IOKAmElMQV9BVFRSX0hPT0tfVFlQReKAmSB1bmRlY2xhcmVkCiAoZmlyc3QgdXNl
IGluIHRoaXMgZnVuY3Rpb24pCgpCb3RoIGVudW1zIHdlcmUgYWRkZWQgdG8gdGhlIExpbnV4IGtl
cm5lbCBpbiB2ZXJzaW9uIDQuMTU6Cmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9j
b21taXQvZmRkYjIzMWViZTY0Nzc0OTc4MmE5ZWJmMTExMDZhODFmNzE2OGJhNwpodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzcwZDVhZWY0OGE0MjFhNjhiZDlkMWJmOGY4
MjY3YWY0MDY2ODE1ODAKCkFkZCB1cHN0cmVhbSBjb21taXQgdG8gZml4IHRoZSBwcm9ibGVtLgoK
U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCkdpdGxhYiBw
aXBlbGluZXMgcGFzc2VkOgpodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2Nv
bW1pdHMvOTI5YjMxYjIzMjEyMDg2ODNmNWYzZTdhNjAxZmU3NTE4OGMyY2EzMgoKIC4uLnVkZS1s
aW51eC1pbmNsdWRlLWxpbnV4LWhlYWRlci1pbGEuaC5wYXRjaCB8IDEwNyArKysrKysrKysrKysr
KysrKysKIHBhY2thZ2UvbGlibmwvbGlibmwubWsgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
NCArCiAyIGZpbGVzIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9saWJubC8wMDAyLWluY2x1ZGUtbGludXgtaW5jbHVkZS1saW51eC1oZWFkZXIt
aWxhLmgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm5sLzAwMDItaW5jbHVkZS1saW51
eC1pbmNsdWRlLWxpbnV4LWhlYWRlci1pbGEuaC5wYXRjaCBiL3BhY2thZ2UvbGlibmwvMDAwMi1p
bmNsdWRlLWxpbnV4LWluY2x1ZGUtbGludXgtaGVhZGVyLWlsYS5oLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjMyNzAzNjZkYWMKLS0tIC9kZXYvbnVsbAorKysg
Yi9wYWNrYWdlL2xpYm5sLzAwMDItaW5jbHVkZS1saW51eC1pbmNsdWRlLWxpbnV4LWhlYWRlci1p
bGEuaC5wYXRjaApAQCAtMCwwICsxLDEwNyBAQAorRnJvbSA0OWY4YjM2NGM5YTZmNmRiNGFiNTM1
Zjk5OTM4NmZlY2ZhMzgyNDFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVGhvbWFz
IEhhbGxlciA8dGhvbTMxMUBnbWFpbC5jb20+CitEYXRlOiBUaHUsIDExIERlYyAyMDI1IDIyOjI3
OjA3ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUvbGludXg6IGluY2x1ZGUgbGludXgg
aGVhZGVyICJpbGEuaCIKKworVGFrZW4gZnJvbSB2Ni4xOCAoN2QwYTY2ZTRiYjkwODFkNzVjODJl
YzQ5NTdjNTAwMzRjYjBlYTQ0OSkuCisKK2h0dHBzOi8vZ2l0aHViLmNvbS90aG9tMzExL2xpYm5s
L2lzc3Vlcy80NDcKKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS90aG9tMzExL2xpYm5s
L2NvbW1pdC80OWY4YjM2NGM5YTZmNmRiNGFiNTM1Zjk5OTM4NmZlY2ZhMzgyNDFiCisKK1NpZ25l
ZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBNYWtlZmlsZS5h
bSAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCisgaW5jbHVkZS9saW51eC1wcml2YXRlL2xp
bnV4L2lsYS5oIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKworIDIgZmlsZXMg
Y2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQorIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xp
bnV4LXByaXZhdGUvbGludXgvaWxhLmgKKworZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFr
ZWZpbGUuYW0KK2luZGV4IDJiZDBjMDZlLi5lNjNlMzExMiAxMDA2NDQKKy0tLSBhL01ha2VmaWxl
LmFtCisrKysgYi9NYWtlZmlsZS5hbQorQEAgLTI3OCw2ICsyNzgsNyBAQCBub2luc3RfSEVBREVS
UyA9IFwKKyAJaW5jbHVkZS9saW51eC1wcml2YXRlL2xpbnV4L2lmX3BhY2tldC5oIFwKKyAJaW5j
bHVkZS9saW51eC1wcml2YXRlL2xpbnV4L2lmX3R1bm5lbC5oIFwKKyAJaW5jbHVkZS9saW51eC1w
cml2YXRlL2xpbnV4L2lmX3ZsYW4uaCBcCisrCWluY2x1ZGUvbGludXgtcHJpdmF0ZS9saW51eC9p
bGEuaCBcCisgCWluY2x1ZGUvbGludXgtcHJpdmF0ZS9saW51eC9pbi5oIFwKKyAJaW5jbHVkZS9s
aW51eC1wcml2YXRlL2xpbnV4L2luNi5oIFwKKyAJaW5jbHVkZS9saW51eC1wcml2YXRlL2xpbnV4
L2luX3JvdXRlLmggXAorZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgtcHJpdmF0ZS9saW51eC9p
bGEuaCBiL2luY2x1ZGUvbGludXgtcHJpdmF0ZS9saW51eC9pbGEuaAorbmV3IGZpbGUgbW9kZSAx
MDA2NDQKK2luZGV4IDAwMDAwMDAwLi42YTZjOTdjZgorLS0tIC9kZXYvbnVsbAorKysrIGIvaW5j
bHVkZS9saW51eC1wcml2YXRlL2xpbnV4L2lsYS5oCitAQCAtMCwwICsxLDY4IEBACisrLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8K
KysvKiBpbGEuaCAtIElMQSBJbnRlcmZhY2UgKi8KKysKKysjaWZuZGVmIF9MSU5VWF9JTEFfSAor
KyNkZWZpbmUgX0xJTlVYX0lMQV9ICisrCisrLyogTkVUTElOS19HRU5FUklDIHJlbGF0ZWQgaW5m
byAqLworKyNkZWZpbmUgSUxBX0dFTkxfTkFNRQkJImlsYSIKKysjZGVmaW5lIElMQV9HRU5MX1ZF
UlNJT04JMHgxCisrCisrZW51bSB7CisrCUlMQV9BVFRSX1VOU1BFQywKKysJSUxBX0FUVFJfTE9D
QVRPUiwJCQkvKiB1NjQgKi8KKysJSUxBX0FUVFJfSURFTlRJRklFUiwJCQkvKiB1NjQgKi8KKysJ
SUxBX0FUVFJfTE9DQVRPUl9NQVRDSCwJCQkvKiB1NjQgKi8KKysJSUxBX0FUVFJfSUZJTkRFWCwJ
CQkvKiBzMzIgKi8KKysJSUxBX0FUVFJfRElSLAkJCQkvKiB1MzIgKi8KKysJSUxBX0FUVFJfUEFE
LAorKwlJTEFfQVRUUl9DU1VNX01PREUsCQkJLyogdTggKi8KKysJSUxBX0FUVFJfSURFTlRfVFlQ
RSwJCQkvKiB1OCAqLworKwlJTEFfQVRUUl9IT09LX1RZUEUsCQkJLyogdTggKi8KKysKKysJX19J
TEFfQVRUUl9NQVgsCisrfTsKKysKKysjZGVmaW5lIElMQV9BVFRSX01BWAkJKF9fSUxBX0FUVFJf
TUFYIC0gMSkKKysKKytlbnVtIHsKKysJSUxBX0NNRF9VTlNQRUMsCisrCUlMQV9DTURfQURELAor
KwlJTEFfQ01EX0RFTCwKKysJSUxBX0NNRF9HRVQsCisrCUlMQV9DTURfRkxVU0gsCisrCisrCV9f
SUxBX0NNRF9NQVgsCisrfTsKKysKKysjZGVmaW5lIElMQV9DTURfTUFYCShfX0lMQV9DTURfTUFY
IC0gMSkKKysKKysjZGVmaW5lIElMQV9ESVJfSU4JKDEgPDwgMCkKKysjZGVmaW5lIElMQV9ESVJf
T1VUCSgxIDw8IDEpCisrCisrZW51bSB7CisrCUlMQV9DU1VNX0FESlVTVF9UUkFOU1BPUlQsCisr
CUlMQV9DU1VNX05FVVRSQUxfTUFQLAorKwlJTEFfQ1NVTV9OT19BQ1RJT04sCisrCUlMQV9DU1VN
X05FVVRSQUxfTUFQX0FVVE8sCisrfTsKKysKKytlbnVtIHsKKysJSUxBX0FUWVBFX0lJRCA9IDAs
CisrCUlMQV9BVFlQRV9MVUlELAorKwlJTEFfQVRZUEVfVklSVF9WNCwKKysJSUxBX0FUWVBFX1ZJ
UlRfVU5JX1Y2LAorKwlJTEFfQVRZUEVfVklSVF9NVUxUSV9WNiwKKysJSUxBX0FUWVBFX05PTkxP
Q0FMX0FERFIsCisrCUlMQV9BVFlQRV9SU1ZEXzEsCisrCUlMQV9BVFlQRV9SU1ZEXzIsCisrCisr
CUlMQV9BVFlQRV9VU0VfRk9STUFUID0gMzIsIC8qIEdldCB0eXBlIGZyb20gdHlwZSBmaWVsZCBp
biBpZGVudGlmaWVyICovCisrfTsKKysKKytlbnVtIHsKKysJSUxBX0hPT0tfUk9VVEVfT1VUUFVU
LAorKwlJTEFfSE9PS19ST1VURV9JTlBVVCwKKyt9OworKworKyNlbmRpZiAvKiBfTElOVVhfSUxB
X0ggKi8KKy0tIAorMi40Ny4zCisKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibmwvbGlibmwubWsg
Yi9wYWNrYWdlL2xpYm5sL2xpYm5sLm1rCmluZGV4IDJkY2I1OTQxNDEuLjViNzllYTI0YTEgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGlibmwvbGlibmwubWsKKysrIGIvcGFja2FnZS9saWJubC9saWJu
bC5tawpAQCAtMTMsNiArMTMsMTAgQEAgTElCTkxfQ1BFX0lEX1ZBTElEID0gWUVTCiBMSUJOTF9J
TlNUQUxMX1NUQUdJTkcgPSBZRVMKIExJQk5MX0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9z
dC1mbGV4IGhvc3QtcGtnY29uZgogCisjIDAwMDItaW5jbHVkZS1saW51eC1pbmNsdWRlLWxpbnV4
LWhlYWRlci1pbGEuaC5wYXRjaAorTElCTkxfQVVUT1JFQ09ORiA9IFlFUworSE9TVF9MSUJOTF9B
VVRPUkVDT05GID0gWUVTCisKIEhPU1RfTElCTkxfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBo
b3N0LWZsZXggaG9zdC1wa2djb25mCiAKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCTkxfVE9PTFMp
LHkpCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
