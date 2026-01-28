Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6BED35690
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 09:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2841817A7;
	Wed, 28 Jan 2026 09:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAaHcuw-SUDV; Wed, 28 Jan 2026 09:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1A481786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769591212;
	bh=joaR9sEktAXdSjCronkm05B6NVbFQmtZ+N8xbRErxfI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mYDoWwP3Jg5ZTSIUrBYnj4vnhCdSxrLky3Lx/GrezoXbWYCM1OnPVDqj1ZPRCj2Na
	 W5T/+esEsJboodsrD3j16M9jC/5vKkzb0VxzMIGdtyHboh0MndPSilympg5oxEMAKO
	 4w0O8Kx0PAPvZyFqtNxjMMkKvSDkUf+5kwMfKfrSl/2XzsVQwx3hza/KehwqzCZA3R
	 5rYNOGI0MshOxjfE4NqFtyqvIsc9HQtuNJi5m9ZM/6mi0AmT0pPswXVqu7wbvmXJR+
	 Gc4pKQOEyS7DwA9sftu80z20fsDN8vPVLj233aRCfL5kGNX/ek9wxU73MV0v8hWNUW
	 1Wnu5JuEo22xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1A481786;
	Wed, 28 Jan 2026 09:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A39118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 09:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E7B481786
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 09:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoKjgb2aZMoT for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 09:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3025C81773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3025C81773
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3025C81773
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 09:06:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1471787330; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Jan 2026 09:06:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vl1Ve-00000004IAQ-2v8A;
 Wed, 28 Jan 2026 10:06:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jan 2026 10:06:43 +0100
Message-ID: <20260128090645.1023133-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CJ7jR2GiBot9xlFj9UrsCFxCvZ0xij5EafYp9oWqOl8neHeSV6elnwuoRxENAq4Oz1XBzEWCywhevRUQoG0GUv/UQR9Z7YNAz1sSVC2nX3Fs11S2BQ+3cW3sOqOVAtIyqc5o9Qf2oEMhEy08vycy+MuC6qMGTNqs8apDI6F3ZEaPAqe2X0dOiviDJ2kvVrYsLEjDhRVcWXKrxyHWCMhLALNm56jC/ER3dX/sSCLG1VjqqGIZI15GtzG4T+e+7VfXLL7lBhVy8kgrSHKMaCAnSLYhO746PSVLlAGnhXVmbBBGhq8eipaQVZ5/BMZtSLmpfOaCtYJB3L7tDrPdJqsrmA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=tz++tJ4EfMZ4HMqlXfCMtfcl0MxDTKRlphl9PCB7WCA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=CJ7jR2Gi
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to version
 3.6.1
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

Rml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6CgpDVkUtMjAyNS0xMTE4NyAtIElt
cHJvcGVyIHZhbGlkYXRpb24gb2YgUEJNQUMxIHBhcmFtZXRlcnMgaW4gUEtDUyMxMiBNQUMgdmVy
aWZpY2F0aW9uLgpDVkUtMjAyNS0xNTQ2NyAtIFN0YWNrIGJ1ZmZlciBvdmVyZmxvdyBpbiBDTVMg
QXV0aEVudmVsb3BlZERhdGEgcGFyc2luZy4KQ1ZFLTIwMjUtMTU0NjggLSBOVUxMIGRlcmVmZXJl
bmNlIGluIFNTTF9DSVBIRVJfZmluZCgpIGZ1bmN0aW9uIG9uIHVua25vd24gY2lwaGVyIElELgpD
VkUtMjAyNS0xNTQ2OSAtIOKAmG9wZW5zc2wgZGdzdOKAmSBvbmUtc2hvdCBjb2RlcGF0aCBzaWxl
bnRseSB0cnVuY2F0ZXMgaW5wdXRzID4xNk1CLgpDVkUtMjAyNS02NjE5OSAtIFRMUyAxLjMgQ29t
cHJlc3NlZENlcnRpZmljYXRlIGV4Y2Vzc2l2ZSBtZW1vcnkgYWxsb2NhdGlvbi4KQ1ZFLTIwMjUt
NjgxNjAgLSBIZWFwIG91dC1vZi1ib3VuZHMgd3JpdGUgaW4gQklPX2ZfbGluZWJ1ZmZlciBvbiBz
aG9ydCB3cml0ZXMuCkNWRS0yMDI1LTY5NDE4IC0gVW5hdXRoZW50aWNhdGVkL3VuZW5jcnlwdGVk
IHRyYWlsaW5nIGJ5dGVzIHdpdGggbG93LWxldmVsIE9DQiBmdW5jdGlvbiBjYWxscwpDVkUtMjAy
NS02OTQxOSAtIE91dCBvZiBib3VuZHMgd3JpdGUgaW4gUEtDUzEyX2dldF9mcmllbmRseW5hbWUo
KSBVVEYtOCBjb252ZXJzaW9uLgpDVkUtMjAyNS02OTQyMCAtIE1pc3NpbmcgQVNOMV9UWVBFIHZh
bGlkYXRpb24gaW4gVFNfUkVTUF92ZXJpZnlfcmVzcG9uc2UoKSBmdW5jdGlvbi4KQ1ZFLTIwMjUt
Njk0MjEgLSBOVUxMIFBvaW50ZXIgRGVyZWZlcmVuY2UgaW4gUEtDUzEyX2l0ZW1fZGVjcnlwdF9k
MmlfZXggZnVuY3Rpb24KQ1ZFLTIwMjYtMjI3OTUgLSBNaXNzaW5nIEFTTjFfVFlQRSB2YWxpZGF0
aW9uIGluIFBLQ1MjMTIgcGFyc2luZwpDVkUtMjAyNi0yMjc5NiAtIEFTTjFfVFlQRSBUeXBlIENv
bmZ1c2lvbiBpbiB0aGUgUEtDUzdfZGlnZXN0X2Zyb21fYXR0cmlidXRlcygpIGZ1bmN0aW9uCgpG
b3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIGFubm91bmNlbWVudDoKaHR0cHM6Ly9vcGVuc3NsLWxp
YnJhcnkub3JnL3Bvc3QvMjAyNi0wMS0yNy1yZWxlYXNlLWFubm91bmNlbWVudC8KCkRyb3Agbm93
IHVwc3RyZWFtZWQgMDAwNC1TY29wZS1hZXNfY2ZiMTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXItdG8t
eDY0LnBhdGNoOgpodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL2NvbW1pdC9mNTI5
ZDI2NTkxNTU4ODMwMjZjYzVmZTFlM2E1NjBjMjc0ZGE4NmI5CgpTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Ci0tLQogLi4uZXNfY2ZiMTI4X3ZhZXNf
ZW5jZGVjX3dyYXBwZXItdG8teDY0LnBhdGNoIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFj
a2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaCAgICAgICAgICAgIHwgIDQgKy0tCiBwYWNr
YWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tayAgICAgICAgICAgICAgfCAgMiArLQogMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbGlib3BlbnNzbC8wMDA0LVNjb3BlLWFlc19jZmIxMjhfdmFlc19lbmNk
ZWNfd3JhcHBlci10by14NjQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9wZW5zc2wv
MDAwNC1TY29wZS1hZXNfY2ZiMTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXItdG8teDY0LnBhdGNoIGIv
cGFja2FnZS9saWJvcGVuc3NsLzAwMDQtU2NvcGUtYWVzX2NmYjEyOF92YWVzX2VuY2RlY193cmFw
cGVyLXRvLXg2NC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYWI0Y2Y4OGE0
MC4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL2xpYm9wZW5zc2wvMDAwNC1TY29wZS1hZXNfY2Zi
MTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXItdG8teDY0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MzYgKzAsMCBAQAotRnJvbSBhMzdkMzE2ZTY0M2E0YzJiZTQ3MDhkNTA0Y2MzZWNiZjM3ZWMxNzcz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2FpIFBhc3RvciA8ZGcweXRAZGFyYy5k
ZT4KLURhdGU6IFdlZCwgOCBPY3QgMjAyNSAxODo1MDozMyArMDIwMAotU3ViamVjdDogW1BBVENI
XSBTY29wZSBhZXNfY2ZiMTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXIgdG8geDY0Ci0KLVRoaXMgZnVu
Y3Rpb24gaXMgb25seSB1c2VkIG9uIHg2NCBhbmQgcmVsaWVzIG9uIG90aGVyIGZ1bmN0aW9ucyB3
aGljaAotYXJlIG9ubHkgaW1wbGVtZW50ZWQgZm9yIHg2NC4KLUZpeGVzICMyODc0NS4KLQotVXBz
dHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NsL29wZW5zc2wvcHVsbC8yODc5MgotCi1T
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0tCi0gcHJvdmlk
ZXJzL2ltcGxlbWVudGF0aW9ucy9jaXBoZXJzL2NpcGhlcl9hZXNfY2ZiX2h3X2Flc25pLmluYyB8
IDIgKysKLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9w
cm92aWRlcnMvaW1wbGVtZW50YXRpb25zL2NpcGhlcnMvY2lwaGVyX2Flc19jZmJfaHdfYWVzbmku
aW5jIGIvcHJvdmlkZXJzL2ltcGxlbWVudGF0aW9ucy9jaXBoZXJzL2NpcGhlcl9hZXNfY2ZiX2h3
X2Flc25pLmluYwotaW5kZXggZDU1NzdkMDBmMTMyZS4uZWI4ZTAxNjRhYzllZCAxMDA2NDQKLS0t
LSBhL3Byb3ZpZGVycy9pbXBsZW1lbnRhdGlvbnMvY2lwaGVycy9jaXBoZXJfYWVzX2NmYl9od19h
ZXNuaS5pbmMKLSsrKyBiL3Byb3ZpZGVycy9pbXBsZW1lbnRhdGlvbnMvY2lwaGVycy9jaXBoZXJf
YWVzX2NmYl9od19hZXNuaS5pbmMKLUBAIC0zMCw2ICszMCw3IEBACi0gc3RhdGljIGludCBvc3Ns
X2Flc19jZmI4X3ZhZXNfZWxpZ2libGUodm9pZCkgeyByZXR1cm4gMDsgfQotIHN0YXRpYyBpbnQg
b3NzbF9hZXNfY2ZiMV92YWVzX2VsaWdpYmxlKHZvaWQpIHsgcmV0dXJuIDA7IH0KLSAKLSsjaWYg
KGRlZmluZWQoX194ODZfNjQpIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfTV9B
TUQ2NCkgfHwgZGVmaW5lZChfTV9YNjQpKQotIC8qIGFjdGl2ZSBpbiA2NC1iaXQgYnVpbGRzIHdo
ZW4gQUVTLU5JLCBBVlg1MTJGLCBhbmQgVkFFUyBhcmUgZGV0ZWN0ZWQgKi8KLSBzdGF0aWMgaW50
IGFlc19jZmIxMjhfdmFlc19lbmNkZWNfd3JhcHBlcigKLSAgICAgUFJPVl9DSVBIRVJfQ1RYKiBk
YXQsCi1AQCAtNTYsNiArNTcsNyBAQCBzdGF0aWMgaW50IGFlc19jZmIxMjhfdmFlc19lbmNkZWNf
d3JhcHBlcigKLSAKLSAgICAgcmV0dXJuIDE7Ci0gfQotKyNlbmRpZgotICAKLSAvKiBnZW5lcmF0
ZXMgQUVTIHJvdW5kIGtleXMgZm9yIEFFUy1OSSBhbmQgVkFFUyBpbXBsZW1lbnRhdGlvbnMgKi8K
LSBzdGF0aWMgaW50IGNpcGhlcl9od19hZXNuaV9pbml0a2V5KFBST1ZfQ0lQSEVSX0NUWCAqZGF0
LApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaCBiL3BhY2th
Z2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2gKaW5kZXggOTMyMmE1NmU3Ni4uMGUwZGJkMzky
NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaAorKysgYi9w
YWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoCkBAIC0xLDUgKzEsNSBAQAotIyBGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NsL29wZW5zc2wvcmVsZWFzZXMvZG93bmxvYWQvb3Bl
bnNzbC0zLjYuMC9vcGVuc3NsLTMuNi4wLnRhci5nei5zaGEyNTYKLXNoYTI1NiAgYjZhNWY0NGI3
ZWI2OWUzZmEzNWRiZjE1NTI0NDA1YjQ0ODM3YTQ4MWQ0M2Q4MWRhZGRkZTNmZjIxZmNiYjhlOSAg
b3BlbnNzbC0zLjYuMC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9v
cGVuc3NsL3JlbGVhc2VzL2Rvd25sb2FkL29wZW5zc2wtMy42LjEvb3BlbnNzbC0zLjYuMS50YXIu
Z3ouc2hhMjU2CitzaGEyNTYgIGIxYmZlZGNkNWIyODlmZjIyYWVlODdjOWQ2MDBmNTE1NzY3ZWJm
NDVmNzcxNjhjYjZkNjRmMjMxZjUxOGE4MmUgIG9wZW5zc2wtMy42LjEudGFyLmd6CiAKICMgTGlj
ZW5zZSBmaWxlcwogc2hhMjU2ICA3ZDU0NTBjYjJkMTQyNjUxYjhhZmEzMTViNWYyMzhlZmM4MDVk
YWQ4MjdkOTFiYTM2N2Q4NTE2YmM5ZDQ5ZTdhICBMSUNFTlNFLnR4dApkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3Bl
bnNzbC5tawppbmRleCAyOGRjYjlkZmMyLi5kNTgwOTQ3ODk5IDEwMDY0NAotLS0gYS9wYWNrYWdl
L2xpYm9wZW5zc2wvbGlib3BlbnNzbC5taworKysgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3Bl
bnNzbC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJ
Qk9QRU5TU0xfVkVSU0lPTiA9IDMuNi4wCitMSUJPUEVOU1NMX1ZFUlNJT04gPSAzLjYuMQogTElC
T1BFTlNTTF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9yZWxlYXNl
cy9kb3dubG9hZC9vcGVuc3NsLSQoTElCT1BFTlNTTF9WRVJTSU9OKQogTElCT1BFTlNTTF9TT1VS
Q0UgPSBvcGVuc3NsLSQoTElCT1BFTlNTTF9WRVJTSU9OKS50YXIuZ3oKIExJQk9QRU5TU0xfTElD
RU5TRSA9IEFwYWNoZS0yLjAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
