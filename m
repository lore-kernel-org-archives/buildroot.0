Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971BCA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD31608A3;
	Tue,  6 Oct 2026 16:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzn0S7F4Qohz; Tue,  6 Oct 2026 16:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BBB0D60B42
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304824;
	b=VwDMWSjBT/2FveAPWrfJFKIeRyQ0RMQA2y/lZJV8jai930ijzevTqs8mbe1jxNLKRdG/
	 FubgQgh7jcNCe83gMV8sjJwLf1bFUf8AP7ADofVZ5tnh5R3nL6Uu4xWAvTkqP3qSXhMf9
	 u3pShkfqtO7nizxkEflDQjJsQCrvMQSiM07H7BLyCOVa+OECfaRZI/ha1quqp/fv9dS2f
	 wZRmnP5De/08YsnIIeTpFpcHJlA4AjuPMJjJemytTVaVPRKcWm3cWA9aRCE3nEtWKBwbE
	 KXK0Osiu09mxzInBYHnisjED3Oh1FTINL+9hOzp0Iqdpg7NX2mK7wjAWx9BWle2eLsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304824;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vs4JcTy9i/s9F9QDXsQAo0apDu5Ztdnl7KL4wrJR3Xo=;
	b=AZsjXa6n4lP09sP8CUc8hn1ktN8Yvxw0i4UwzrJEG2vs+4Tx+hdBWMH34bQdQlAwBtrI
	 4yhnUG2Nb68146xGa0C+ofETFeMUtb3AK3TZ/KeFG9Ea2As35v2ywwyPgJq6UrvbdhRfE
	 9RiYmeVH3G/OwO6DDEEbdI5hOD5IXsa5uXje+Hqk9LLq9WtCJLC19WlxmCX4lO49FtW3q
	 L2+sKW5+2A2XgAWA5lePnNkHA9CdWqdnQncoe+icWPSupeO6dM2fhR32qfJHEA05LqAmp
	 87tVZCoY7MueVnd05ikSZ8+GHqm4nW55gaqX/eM0beWg5BPsbtQWAdyfYYkbo2xaQxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304824;
	bh=vs4JcTy9i/s9F9QDXsQAo0apDu5Ztdnl7KL4wrJR3Xo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LyH/ye5BBRGldNmL24S/IBlwpTk+rYM4YDFAwBWHb/mlgT80pA9S5Q6Ub3s61TNwu
	 x7q24d/dU251EOLofzlpwYYThnGwhZlfq/0tA+8NeMuHlTTrUkXrAOqENg85dTNOIO
	 4EOVBg//oJs0rCBKIogJBfZDMVXdzlubmfJfjIa3O6V9lkUo+IVeXWkHpF8xoyPT2F
	 bgmMSLoRzqdWTxZnEE2KP/nxtwKgRgJrVeuVeYQz6aDw35oM23pZtvyM45EVYAgZgT
	 SqTtQ1LnWmpr0hrtmwLNNemkurLhEhlg+UcWZ8GEr0mcsBDG1Rkwh7pkNIRjQp7a2E
	 DsajyOKNgBacw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB0D60B42;
	Tue,  6 Oct 2026 16:40:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB0BD34E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8901402CB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hCl5mnweE9J for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:37:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D3256402C6
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304661;
 b=iDY7+ZvuWHXbfJqq0KxOuQyEZJw9+0WXQaKPmBNRTKakiLUhjacgD3ws7N+E0jaEmGrV
 7l5QBX/HamEY+hJCp5SzD1irQHg7zCL9nFVgUPN9ePBYYpWx2U+0u+L1OFdzmOXPnWfPw
 Zdmpv/2t/w7CTLRu24oCCbxovX127CayfTrz+XZqlHKmTx+uaeSiH7GrGxf7V1evZy0wZ
 lJy6EPwv/ILlV+gDP6l4iAfEG1Qa/i7E2FsPm/Z1NVxFNq4ApiUkFLfVqZslvKd489i/A
 TWpjcJM1Vd3V1q3iG0pTP5tssuzNJ3YZJEwD5wt/5LBNjV7aI+uUf8os+5htx/jgl1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304661;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1MtoqvhvSbOuA0WPm0NpaNnsRky+ky8xv0u+fHdOwps=;
 b=PJAtf2zVYB/RRxKoPROY0H7R/4FSuCpkgzceNSn34WbnWPhCqSbMU3VxdMoo9zNdJ+Bq
 CKA92mJI0pvg+2rZkzm/1xRjC8zOM/w8AlrALB0PSN2p3wycCVheTz3yUIHY4gyD3E7rb
 hQUUr1RzGO6UUYH9jyYIACajyeZHdAQEyOtut7BJIIr6ajYFZxpbGugQpSaRQ38WbfNkZ
 vHgSCY9LKy0gqWzCsfOo4H9tKGJVozI2NkEajH8xDm7m1bGx3Pq+DfFF/jSHd+HGoawjD
 +3x01DhxfyruyTfPEez7t3CeGAgJylYhz3W5YPYh0Uj5B6cXuStqeyRVfLdTbbziz+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kALvzWqV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kALvzWqV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3256402C6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303713;
 bh=1MtoqvhvSbOuA0WPm0NpaNnsRky+ky8xv0u+fHdOwps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kALvzWqVNgIrX8zfGwbTiuUkEEHw5xxV9FFpuSU9d6FTyd6BGcZSu7pxg8zAWC7ms
 H+7Oj9s5kbVvf8ZWTkWwa98PSJh8MJch6zt4tAA4DOFO6txExTCe1eYx0/mgukSWlj
 G9cTcIIPs1bK+acCXHNw3pF6cK/A+TXoeJqtG30lnxSj59DTKXEizkb0XqE9Gk4Yen
 1ABgzg4yZUB63nD53muHof9/96zE5wtx9KwbJ6eo/liEaBF3Gss18m6+Hb9G9RihQs
 Pf5c/HiNTr5636gZ3E7ZLJiZHwAxKXlg8MzASu4T//XElfi5bnqCbCkqYbjDHJtJcx
 6ty+GMm09DnGA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 n5u4K5fvF8LnqOat84w1WywjLeFqm02o21Asx/yAo6XXI287Z3Lw395dmceWZ1sct9nT9EJVbdd
 +NWRNbESZ5VHRWIL+Eaf2mZkWbTPUKP6dc5BKISDo9FrVC1JYSu12nfCZr2FqLIZKhwNIPVaUZR
 iz6Mlo/11ChIQfSzIOB11ylkF8QNhGbKVHSbO54Oq5IjnhMjJqT3BCmp4KYocslPuZp+N2iKQqn
 +JUpYiWBEJRIysX/41RvSpbQQGMMIr9a4nyucjlHj4YXZ08UlzIvp3QtrjxKjsIgXETG0DJQPe6
 kp+LwRD3fP3iMTmq7PuOXZivDn8IpyoWo2Cl5N1N0wi7F8jEvU8FxNIHyFJpx7knxDl8Lb2odHL
 vixCieHUmQig9QuXqN8hkfEBhRr5frEg8PP/OQCByqcluI23oIzNh7sLL6FSeYGusG/YMA399VL
 DIf7ykBfJE8xTJP4nuogDNg6a7/y7ghJlee3ut+fhsEy5RFjRzeDrdfPnRJoW++kOew+smZgH/3
 VmYIcPcGglJ4VxpGrT8CZBOWjvstTbVnkRx4E0PiYTUmr3Z11MD7i4BISGy/UeT3N+N7PhFfVJL
 ZfrpUqG6t/JLd9wpVHtla+Qbjd/twsg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C683FA4C5577;
 Tue,  6 Oct 2026 18:21:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7un-000000000ir-4B4X;
 Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Tue,  6 Oct 2026 18:20:37 +0200
Message-ID: <20261006162106.3439373-57-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v8 56/84] package/znc: Fix build with OpenSSL
 4.0.0
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

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEPDqWRyaWMg
Q2jDqXBpZWQgPGNlZHJpYy5jaGVwaWVkQGdtYWlsLmNvbT4KLS0tCiAuLi4tRml4LWJ1aWxkLWVy
cm9yLXdpdGgtT3BlblNTTC00LTIwMjQucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uvem5jLzAwMDEtRml4LWJ1aWxkLWVycm9yLXdpdGgtT3BlblNTTC00LTIwMjQucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3puYy8wMDAxLUZpeC1idWlsZC1lcnJvci13aXRoLU9wZW5TU0wt
NC0yMDI0LnBhdGNoIGIvcGFja2FnZS96bmMvMDAwMS1GaXgtYnVpbGQtZXJyb3Itd2l0aC1PcGVu
U1NMLTQtMjAyNC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4x
ZGM3ZWIyOGZiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS96bmMvMDAwMS1GaXgtYnVpbGQt
ZXJyb3Itd2l0aC1PcGVuU1NMLTQtMjAyNC5wYXRjaApAQCAtMCwwICsxLDU3IEBACitGcm9tIDk0
YmNmOTE5ZTExNjM1NjRlNjM3ZGY4ZDQzNzU4NWJjN2I1NWU3YWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBSYXZpIEthbnQgU2hhcm1hIDxya3MxOTg2QGdtYWlsLmNvbT4KK0RhdGU6
IE1vbiwgMjkgSnVuIDIwMjYgMjA6MDM6MjcgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGJ1
aWxkIGVycm9yIHdpdGggT3BlblNTTCA0ICgjMjAyNCkKKworTW9yZSBkZXRhaWxzIGhlcmUgaHR0
cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz0xMTM4MzU2CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vem5jL3puYy9jb21taXQvOTRiY2Y5MTllMTE2
MzU2NGU2MzdkZjhkNDM3NTg1YmM3YjU1ZTdhYQorCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgorLS0tCisgc3JjL1NTTFZlcmlmeUhvc3QuY3BwIHwgNCArKy0t
Cisgc3JjL1V0aWxzLmNwcCAgICAgICAgIHwgNSArKysrLQorIDIgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL1NTTFZlcmlm
eUhvc3QuY3BwIGIvc3JjL1NTTFZlcmlmeUhvc3QuY3BwCitpbmRleCBjY2MyMDg5OC4uOTliMjE1
YmMgMTAwNjQ0CistLS0gYS9zcmMvU1NMVmVyaWZ5SG9zdC5jcHAKKysrKyBiL3NyYy9TU0xWZXJp
ZnlIb3N0LmNwcAorQEAgLTMwNiw4ICszMDYsOCBAQCB0eXBlZGVmIGVudW0geworIHN0YXRpYyBI
b3N0bmFtZVZhbGlkYXRpb25SZXN1bHQgbWF0Y2hlc19jb21tb25fbmFtZShjb25zdCBjaGFyKiBo
b3N0bmFtZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgWDUwOSogc2VydmVyX2NlcnQpIHsKKyAgICAgaW50IGNvbW1vbl9uYW1lX2xv
YyA9IC0xOworLSAgICBYNTA5X05BTUVfRU5UUlkqIGNvbW1vbl9uYW1lX2VudHJ5ID0gbnVsbHB0
cjsKKy0gICAgQVNOMV9TVFJJTkcqIGNvbW1vbl9uYW1lX2FzbjEgPSBudWxscHRyOworKyAgICBj
b25zdCBYNTA5X05BTUVfRU5UUlkqIGNvbW1vbl9uYW1lX2VudHJ5ID0gbnVsbHB0cjsKKysgICAg
Y29uc3QgQVNOMV9TVFJJTkcqIGNvbW1vbl9uYW1lX2FzbjEgPSBudWxscHRyOworICAgICBDT05T
VF9BU04xX1NUUklOR19EQVRBIGNoYXIqIGNvbW1vbl9uYW1lX3N0ciA9IG51bGxwdHI7CisgCisg
ICAgIC8vIEZpbmQgdGhlIHBvc2l0aW9uIG9mIHRoZSBDTiBmaWVsZCBpbiB0aGUgU3ViamVjdCBm
aWVsZCBvZiB0aGUgY2VydGlmaWNhdGUKK2RpZmYgLS1naXQgYS9zcmMvVXRpbHMuY3BwIGIvc3Jj
L1V0aWxzLmNwcAoraW5kZXggZWQyYzljODMuLjc0NGY2MWQxIDEwMDY0NAorLS0tIGEvc3JjL1V0
aWxzLmNwcAorKysrIGIvc3JjL1V0aWxzLmNwcAorQEAgLTEyOSw3ICsxMjksOCBAQCB2b2lkIENV
dGlsczo6R2VuZXJhdGVDZXJ0KEZJTEUqIHBPdXQpIHsKKyAgICAgc0VtYWlsQWRkciArPSAiQCI7
CisgICAgIHNFbWFpbEFkZHIgKz0gc0hvc3ROYW1lOworIAorLSAgICBYNTA5X05BTUUqIHBOYW1l
ID0gWDUwOV9nZXRfc3ViamVjdF9uYW1lKHBDZXJ0LmdldCgpKTsKKysgICAgWDUwOV9OQU1FKiBw
TmFtZSA9IFg1MDlfTkFNRV9uZXcoKTsKKysgICAgaWYgKCFwTmFtZSkgcmV0dXJuOworICAgICBY
NTA5X05BTUVfYWRkX2VudHJ5X2J5X3R4dChwTmFtZSwgIk9VIiwgTUJTVFJJTkdfQVNDLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgY2hhciopcExvZ05hbWUsIC0x
LCAtMSwgMCk7CisgICAgIFg1MDlfTkFNRV9hZGRfZW50cnlfYnlfdHh0KHBOYW1lLCAiQ04iLCBN
QlNUUklOR19BU0MsCitAQCAtMTM3LDcgKzEzOCw5IEBAIHZvaWQgQ1V0aWxzOjpHZW5lcmF0ZUNl
cnQoRklMRSogcE91dCkgeworICAgICBYNTA5X05BTUVfYWRkX2VudHJ5X2J5X3R4dChwTmFtZSwg
ImVtYWlsQWRkcmVzcyIsIE1CU1RSSU5HX0FTQywKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHVuc2lnbmVkIGNoYXIqKXNFbWFpbEFkZHIuY19zdHIoKSwgLTEsIC0xLCAwKTsKKyAK
KysgICAgWDUwOV9zZXRfc3ViamVjdF9uYW1lKHBDZXJ0LmdldCgpLCBwTmFtZSk7CisgICAgIFg1
MDlfc2V0X2lzc3Vlcl9uYW1lKHBDZXJ0LmdldCgpLCBwTmFtZSk7CisrICAgIFg1MDlfTkFNRV9m
cmVlKHBOYW1lKTsKKyAKKyAgICAgaWYgKCFYNTA5X3NpZ24ocENlcnQuZ2V0KCksIHBLZXkuZ2V0
KCksIEVWUF9zaGEyNTYoKSkpIHJldHVybjsKKyAKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
