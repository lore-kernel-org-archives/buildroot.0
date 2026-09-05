Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A31DC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32A740C8E;
	Sat,  5 Sep 2026 12:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85hpmxV4NvgP; Sat,  5 Sep 2026 12:20:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F322340AA6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610859;
	b=o7h7d3xSdS74FBW51n2+iYt/zjeRwYsv/nkAS785DrYHTMSHd24ysWyFVBXSwdWjcOWI
	 XZau0xU+yFqMOs/6PsZGuMw1dzn5M1jyOVSOloSrPEVdMiTXPe6JkyApsXfcMwI5E/lQN
	 NevsDiRThMQSEmSTeQUiiv3bmEketXKe4N4EZeaOociV4q1Aagw60wdaqTilWSbE4eLVj
	 3Xh9wVWIvrcbXNlmetUxQLZAr454nTsmz7mDWFaPLForwjSWIM4VuLUI1WNGNTpSrKcEh
	 O0Q27sf4fEU1i9KXhSCJMNMBBzvqaAHu0d2FVMAD0v6PA3yj7wtMLEDyNVMnyKAm1zQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dOq/yxCyHEk0JI5SWoHP7IVu/+EY0Ros0qjG+wn2LkQ=;
	b=A1iQ+oj+KriEAfUwAz+OUfJvE06NKf7aMy868vh/PHriM7Z8itp1fIxcsQL6ZgpWPdXp
	 Kib2xLGHs58KJNKNA7P+IDlpwyR6mpcx+WI6dgO5G2h7IZ9dDf3Cn6PyYUWFE8NxujBdJ
	 ndMUzCnhkpMFg22vEnzc2d75Ot46LDNh8DXEAd9GkeY4yIHDFikfBNuTfn/MxqN8lvomo
	 eL8TukuRsg8yEDX8I6eauch9ZUblTek/Qd3y2xJEW2qr/X3y4pnb3WJNsbJiXlV+aWmwq
	 C8oq4evnigSm2L3bu5/J+eCg7O72RHmbKqMhwNDzJ4yCI23Ycn5VAHeVwBI5z33amjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610859;
	bh=dOq/yxCyHEk0JI5SWoHP7IVu/+EY0Ros0qjG+wn2LkQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mx1lXb9cjF9oQ8EQIRVBS3MsHCz6OYe4O4JjiZb4kspOr9XT45S+0SZgQiWILFt3A
	 fhaPomTUHR8uBAOmUIlUSY1Xh/pxnae4ZS4Z6PxfMUF4+00U1Q+nNOimbs2DuQEBnY
	 I9frzsfbad+mdC74zx6XY7Cxhf2eE8joMaYvFQXeLcBOdfhR/J9RYEx7nC96pN6WJo
	 IVn1z/vE0U/hnAHPKTxG8rnblA7UiQ2QbsQf6zdAY5EpdwxCgQ/yCiD7dTZ0+xSnSw
	 1wmWf2sr6/XFaB6WK4n2ywvXtPZ9rcP2YxFXrjr/DExCB7UFgwexga3+ii0ue4nDCJ
	 zGXKnsNPbIUYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F322340AA6;
	Sat,  5 Sep 2026 12:20:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B46049D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509B08111C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elx7r1QMuAj0 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 44EE0809E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610856;
 b=fp77jaLwka0lZFC6vknYM7VX2DO5myhsgC/Ulb8di3V4ZxHIJc7pylEa3xVH9zB5I3an
 agc4+UBQZyz2lVx5vUEh5afMslVF4qU6PnfeRiiqadDy/jMl1xqu4ZVoeE/hSeqBv5AaV
 QhbRN4svdk+cdt8iYWrI6u4XQLF2REjdbdzxHQQvVkY0sc23LHEpv8Bxd4G+ly2rNw8zk
 rJG7EsUig2D9rxsL3R6v0m8cCq/JPM3eD4wU6UgLTuoM/2y9gGZfteUd6+xBBvl0Ll6gz
 u21ufiqztk4yjpENgmnx+Oidj046XnijeOAGLaHsCJUtVsj3zpaFeKqFD+3akyrQYnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610856;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eJmoOmnHsPO3lslA1Zd8Ov4oEuNRxDUQVyIk0VmCxFI=;
 b=L2cKukqFppNDOwhSFN8W+FXaNgBPXeqAXoULELKXJrEXrw1PgdlYuExs7PgvCQ4+PNQ3
 x8J4YzDlG/+RpQCWF8fZeuKtIUmyD/QPM8e/gKsfCPzpUTJRlT8OPAq06o6dlSUIBKkn0
 X9tPLNUSYN3/vSz1x3Kzj0vKmlpZwpd4ZnqStjknZUDUChzPE4d1X8VsaUO4TJHhYaCP/
 vN9QmD28IpD93tT+Gclg9dM0TwHOk/b/kDR+cM7o+RsBkEgH4b68LMlP+Jx24I4NmSTQB
 2PRpaSZX0p7xRYYe+WhpB5+hxEeX0Y1uULzRZ465Y9G1SGFU2xn7mPxge0dcvrmECIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tzLAn8dn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tzLAn8dn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44EE0809E7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610841;
 bh=eJmoOmnHsPO3lslA1Zd8Ov4oEuNRxDUQVyIk0VmCxFI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tzLAn8dnYKZw+ad7zFRHnmBcRDcwc1dlAX29VHmlHZRTTXzUXT2xhXULRHCKhvJku
 /KTtimWXHkaBC3xjyaKYnCcJlyaN2nlkGUQy88dxfEykD9mYeXZ0ajNYKl9YkTkszD
 sk2zZNOhnzbALL61uuoj5THfLcNBuoqcibUlz+jH80In3N7ojHwoNlXcW7D8eAYxja
 pg/qLCCGz6qB/fXak0DjSe7gLF2EPIuY7cCNeMGGUjMvthfeBgVEorF4vvpbycX0t6
 jEaODnx30GpnXaQAllA8U+ALKOPsHAPqOCrUNn+WDZoHbwhnyAEXBVYFug4paIBkT/
 VCXPszIduhzqA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D7EEA4C3229;
 Sat,  5 Sep 2026 14:20:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNw-000000006UX-3NeZ;
 Sat, 05 Sep 2026 12:20:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:34 +0200
Message-ID: <20260905122040.2054789-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/7] package/libselinux: fix build with swig >=
 4.5.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5jZS1Q
eVN0cmluZ19Gcm9tU3RyaW5nLXdpdGgtUHlVbmljb2QucGF0Y2ggfCA2MCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvbGlic2VsaW51eC8wMDAzLWxpYnNlbGludXgtUmVwbGFjZS1QeVN0cmluZ19G
cm9tU3RyaW5nLXdpdGgtUHlVbmljb2QucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNl
bGludXgvMDAwMy1saWJzZWxpbnV4LVJlcGxhY2UtUHlTdHJpbmdfRnJvbVN0cmluZy13aXRoLVB5
VW5pY29kLnBhdGNoIGIvcGFja2FnZS9saWJzZWxpbnV4LzAwMDMtbGlic2VsaW51eC1SZXBsYWNl
LVB5U3RyaW5nX0Zyb21TdHJpbmctd2l0aC1QeVVuaWNvZC5wYXRjaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5hNTAzYTljZmY0Ci0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9saWJzZWxpbnV4LzAwMDMtbGlic2VsaW51eC1SZXBsYWNlLVB5U3RyaW5nX0Zyb21TdHJp
bmctd2l0aC1QeVVuaWNvZC5wYXRjaApAQCAtMCwwICsxLDYwIEBACitGcm9tIGZiNTE4ZmY0OTJj
ZDZhMjg2ZjM1YjQxNWNiZDdmZDBmNmUzZmFlZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tOiBQZXRyIExhdXRyYmFjaCA8bGF1dHJiYWNoQHJlZGhhdC5jb20+CitEYXRlOiBUaHUsIDYg
QXVnIDIwMjYgMTY6MzA6NDQgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gbGlic2VsaW51eDogUmVw
bGFjZSBQeVN0cmluZ19Gcm9tU3RyaW5nIHdpdGgKKyBQeVVuaWNvZGVfRnJvbVN0cmluZyBmb3Ig
U1dJRyA0LjUuMCBjb21wYXRpYmlsaXR5CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4
Yml0CisKK1NXSUcgNC41LjAgcmVtb3ZlZCBQeXRob24gMiBDIEFQSSBjb21wYXRpYmlsaXR5IG1h
Y3JvcyAoUHlJbnRfKiwKK1B5U3RyaW5nXyosIFNXSUdfUHl0aG9uX3N0cl8qKSBmcm9tIGl0cyBy
dW50aW1lIGhlYWRlciBweWhlYWQuc3dnLgorVGhlc2UgbWFjcm9zIHByZXZpb3VzbHkgbWFwcGVk
IGRlcHJlY2F0ZWQgUHl0aG9uIDIgQyBBUEkgbmFtZXMgdG8gdGhlaXIKK1B5dGhvbiAzIGVxdWl2
YWxlbnRzLgorCitGaXhlczogaHR0cHM6Ly9naXRodWIuY29tL1NFTGludXhQcm9qZWN0L3NlbGlu
dXgvaXNzdWVzLzUzOAorQXV0aG9yZWQtYnk6IEppdGthIFBsZXNuw61rb3bDoSA8anBsZXNuaWtA
cmVkaGF0LmNvbT4KK1NpZ25lZC1vZmYtYnk6IFBldHIgTGF1dHJiYWNoIDxsYXV0cmJhY2hAcmVk
aGF0LmNvbT4KK0Fja2VkLWJ5OiBTdGVwaGVuIFNtYWxsZXkgPHN0ZXBoZW4uc21hbGxleS53b3Jr
QGdtYWlsLmNvbT4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9TRUxpbnV4UHJvamVj
dC9zZWxpbnV4L2NvbW1pdC9mYjUxOGZmNDkyY2Q2YTI4NmYzNWI0MTVjYmQ3ZmQwZjZlM2ZhZWRi
CisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBz
cmMvc2VsaW51eHN3aWdfcHl0aG9uLmkgfCA2ICsrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvc2VsaW51eHN3
aWdfcHl0aG9uLmkgYi9zcmMvc2VsaW51eHN3aWdfcHl0aG9uLmkKK2luZGV4IGM4YzA4YTQwLi43
NGQ5MjNlNCAxMDA2NDQKKy0tLSBhL3NyYy9zZWxpbnV4c3dpZ19weXRob24uaQorKysrIGIvc3Jj
L3NlbGludXhzd2lnX3B5dGhvbi5pCitAQCAtNjksNyArNjksNyBAQCBkZWYgaW5zdGFsbChzcmMs
IGRlc3QpOgorIAlQeU9iamVjdCogbGlzdCA9IFB5TGlzdF9OZXcoKiQyKTsKKyAJaW50IGk7Cisg
CWZvciAoaSA9IDA7IGkgPCAqJDI7IGkrKykgeworLQkJUHlMaXN0X1NldEl0ZW0obGlzdCwgaSwg
UHlTdHJpbmdfRnJvbVN0cmluZygoKiQxKVtpXSkpOworKwkJUHlMaXN0X1NldEl0ZW0obGlzdCwg
aSwgUHlVbmljb2RlX0Zyb21TdHJpbmcoKCokMSlbaV0pKTsKKyAJfQorIAkkcmVzdWx0ID0gU1dJ
R19BcHBlbmRPdXRwdXQoJHJlc3VsdCwgbGlzdCk7CisgfQorQEAgLTEyMyw3ICsxMjMsNyBAQCBk
ZWYgaW5zdGFsbChzcmMsIGRlc3QpOgorIAkJCWxlbisrOworIAkJcGxpc3QgPSBQeUxpc3RfTmV3
KGxlbik7CisgCQlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsKKy0JCQlQeUxpc3RfU2V0SXRl
bShwbGlzdCwgaSwgUHlTdHJpbmdfRnJvbVN0cmluZygoKiQxKVtpXSkpOworKwkJCVB5TGlzdF9T
ZXRJdGVtKHBsaXN0LCBpLCBQeVVuaWNvZGVfRnJvbVN0cmluZygoKiQxKVtpXSkpOworIAkJfQor
IAl9IGVsc2UgeworIAkJcGxpc3QgPSBQeUxpc3RfTmV3KDApOworQEAgLTE0MCw3ICsxNDAsNyBA
QCBkZWYgaW5zdGFsbChzcmMsIGRlc3QpOgorIAlpZiAoKiQxKSB7CisgCQlwbGlzdCA9IFB5TGlz
dF9OZXcocmVzdWx0KTsKKyAJCWZvciAoaSA9IDA7IGkgPCByZXN1bHQ7IGkrKykgeworLQkJCVB5
TGlzdF9TZXRJdGVtKHBsaXN0LCBpLCBQeVN0cmluZ19Gcm9tU3RyaW5nKCgqJDEpW2ldKSk7Cisr
CQkJUHlMaXN0X1NldEl0ZW0ocGxpc3QsIGksIFB5VW5pY29kZV9Gcm9tU3RyaW5nKCgqJDEpW2ld
KSk7CisgCQl9CisgCX0gZWxzZSB7CisgCQlwbGlzdCA9IFB5TGlzdF9OZXcoMCk7CistLSAKKzIu
NDcuMworCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
