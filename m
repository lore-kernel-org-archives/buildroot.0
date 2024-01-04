Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4722DC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 17:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FA883083;
	Thu,  4 Jan 2024 17:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FA883083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OsXhnMSB6la; Thu,  4 Jan 2024 17:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D15182F6C;
	Thu,  4 Jan 2024 17:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D15182F6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A91801BF3C4
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 17:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B0960B9C
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 17:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B0960B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqUrIsfawxjQ for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 17:14:53 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 572ED60A9B
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 17:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 572ED60A9B
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d8e7a50c1so7705775e9.2
 for <buildroot@buildroot.org>; Thu, 04 Jan 2024 09:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704388490; x=1704993290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BfyioU1KJ2E6XDJkJ+LEI7AmQLZTS/YxM/oL/gFfza0=;
 b=ANrHHiUTSPLiH+I54RkDUISmK1t00akPpkLujYZqVHy4TUjeGtQm3IriUxIUN49EaL
 Z75dXB4q5BzTL+BhbVQuIktm1tF31BfSfvCnX+ZJ+xQIiLXWCAi9VePLt90CCaQGHXt6
 skO95DC8dsYsvnDANx+mEuzYy7ufmdc9zBkgIvmVyhQf/lOEjC0DzGiXwQ0bTOJwc3CA
 QLjpW7bXd8QJltY6Ay2RXpyhnoPa/QuoMpgjiEPmTE+/G34u+DoFdiPjAcUqcHJD6Wvi
 y5q4aZu5koYVfHNAe1Bp9pSGkEvlsp8h3POjMl48jtUwB/cmrlGZmK/EaYy0144r6fHj
 Triw==
X-Gm-Message-State: AOJu0YxFJUNlYNa81iUALzMNzDKTABRrps7n88Q2Zt6dpSuVw/TJpXvi
 KIDQ9nwnrisZX01jjekdhp6bXJee20Y=
X-Google-Smtp-Source: AGHT+IHq1SgUdj0jfZ55Do1hO4Rmg3W7iexhiSffM3kc4io9L+KaUcv+sWFSOPjHfT/sG5/w521GPw==
X-Received: by 2002:a05:600c:1688:b0:40d:5c54:9bb5 with SMTP id
 k8-20020a05600c168800b0040d5c549bb5mr513759wmn.170.1704388490430; 
 Thu, 04 Jan 2024 09:14:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b0040d61b1cecasm6399336wmq.33.2024.01.04.09.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 09:14:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 18:14:47 +0100
Message-ID: <20240104171447.10551-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704388490; x=1704993290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BfyioU1KJ2E6XDJkJ+LEI7AmQLZTS/YxM/oL/gFfza0=;
 b=eYhM4RKpvP20wfI7nWodX+6/BQyyoyD1PrUDoxsJyVa+OvXmOx0uikyp6v2lJY3y9P
 lxXnUaKGgSddTTVFbc2cO9cwzuqLTlADWs4OZDPElwnxTSTiu1eND2gWNxWM4CDsn+xd
 ENLCI/9HIv4dasrxGGVeo94qCmZqpNmZirIxG6bLl+RVIGVKkapA37eaM38Yg+bCYXC7
 uQTFGwW+h6WqKwka5booTEdEmilZj5wScX8cTRg64j6kmd5z7i1Y6UhGiUEtBoYEnEZ6
 X8wuOe18VsMsySB8x219DlhfMdp5tcS4pBor2IlK2wUBsWof+7qjHHVI7rQCbtHN2eXU
 ClKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eYhM4RKp
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: fix build with
 linux >= 6.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGxpbnV4ID49IDYuNDoKCi9ob21l
L2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTUvb3V0cHV0LTEvYnVpbGQvY3J5cHRvZGV2
LWxpbnV4LTEuMTMvLi9pb2N0bC5jOjEyNDk6MTg6IGVycm9yOiDigJhzdHJ1Y3QgY3RsX3RhYmxl
4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYY2hpbGTigJkKIDEyNDkgfCAgICAgICAgICAgICAg
ICAgLmNoaWxkICAgICAgICAgID0gdmVyYm9zaXR5X2N0bF9kaXIsCiAgICAgIHwgICAgICAgICAg
ICAgICAgICBefn5+fgoKRml4ZXM6CiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzL2VjYmY0MjZmNmIwZmY5MjBhNTFjMTY3NGIwODBjMzVlZGY1ZGI4NTkKClNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0K
IC4uLjAxLXplcm8tY29weS1GaXgtYnVpbGQtZm9yLUxpbnV4LTYtNC5wYXRjaCB8IDM3ICsrKysr
KysrKysrKysrKysKIC4uLmV2X3ZlcmJvc2l0eS1GaXgtYnVpbGQtZm9yLUxpbnV4LTYtNC5wYXRj
aCB8IDQ0ICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvY3J5cHRvZGV2LWxpbnV4LzAwMDEtemVy
by1jb3B5LUZpeC1idWlsZC1mb3ItTGludXgtNi00LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9jcnlwdG9kZXYtbGludXgvMDAwMi1jcnlwdG9kZXZfdmVyYm9zaXR5LUZpeC1idWls
ZC1mb3ItTGludXgtNi00LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcnlwdG9kZXYtbGlu
dXgvMDAwMS16ZXJvLWNvcHktRml4LWJ1aWxkLWZvci1MaW51eC02LTQucGF0Y2ggYi9wYWNrYWdl
L2NyeXB0b2Rldi1saW51eC8wMDAxLXplcm8tY29weS1GaXgtYnVpbGQtZm9yLUxpbnV4LTYtNC5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40YmVhNTUzMTFjCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9jcnlwdG9kZXYtbGludXgvMDAwMS16ZXJvLWNvcHkt
Rml4LWJ1aWxkLWZvci1MaW51eC02LTQucGF0Y2gKQEAgLTAsMCArMSwzNyBAQAorRnJvbSA1OTIw
MTdjM2E5MTBhMzkwNWIxOTI1YWVlODhjNDY3NGU5YTU5NmI3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogR2F1cmF2IEphaW4gPGdhdXJhdi5qYWluQG54cC5jb20+CitEYXRlOiBUdWUs
IDMwIE1heSAyMDIzIDE3OjA5OjQyICswNTMwCitTdWJqZWN0OiBbUEFUQ0hdIHplcm8gY29weTog
Rml4IGJ1aWxkIGZvciBMaW51eCA2LjQKKworZ2V0X3VzZXJfcGFnZXNfcmVtb3RlIGFwaSBwcm90
b3R5cGUgaXMgY2hhbmdlZCBpbiBrZXJuZWwuCitzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKip2bWFz
IGFyZ3VtZW50IGlzIHJlbW92ZWQuCitNaWdyYXRlIHRvIHRoZSBuZXcgQVBJLgorCitTaWduZWQt
b2ZmLWJ5OiBHYXVyYXYgSmFpbiA8Z2F1cmF2LmphaW5AbnhwLmNvbT4KKworVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9jcnlwdG9kZXYtbGludXgvY3J5cHRvZGV2LWxpbnV4L2NvbW1pdC81
OTIwMTdjM2E5MTBhMzkwNWIxOTI1YWVlODhjNDY3NGU5YTU5NmI3CitTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KKy0tLQorIHpjLmMg
fCA2ICsrKysrLQorIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKKworZGlmZiAtLWdpdCBhL3pjLmMgYi96Yy5jCitpbmRleCBmZGY3ZGExNy4uNjYzNzk0NWEg
MTAwNjQ0CistLS0gYS96Yy5jCisrKysgYi96Yy5jCitAQCAtODAsMTAgKzgwLDE0IEBAIGludCBf
X2dldF91c2VyYnVmKHVpbnQ4X3QgX191c2VyICphZGRyLCB1aW50MzJfdCBsZW4sIGludCB3cml0
ZSwKKyAJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKHRhc2ssIG1tLAorIAkJCSh1bnNpZ25l
ZCBsb25nKWFkZHIsIHBnY291bnQsIHdyaXRlID8gRk9MTF9XUklURSA6IDAsCisgCQkJcGcsIE5V
TEwsIE5VTEwpOworLSNlbHNlCisrI2VsaWYgKExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9W
RVJTSU9OKDYsIDQsIDApKQorIAlyZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUobW0sCisgCQkJ
KHVuc2lnbmVkIGxvbmcpYWRkciwgcGdjb3VudCwgd3JpdGUgPyBGT0xMX1dSSVRFIDogMCwKKyAJ
CQlwZywgTlVMTCwgTlVMTCk7CisrI2Vsc2UKKysJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3Rl
KG1tLAorKwkJCSh1bnNpZ25lZCBsb25nKWFkZHIsIHBnY291bnQsIHdyaXRlID8gRk9MTF9XUklU
RSA6IDAsCisrCQkJcGcsIE5VTEwpOworICNlbmRpZgorICNpZiAoTElOVVhfVkVSU0lPTl9DT0RF
IDwgS0VSTkVMX1ZFUlNJT04oNSwgOCwgMCkpCisgCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2NyeXB0b2Rldi1saW51eC8wMDAyLWNyeXB0b2Rldl92ZXJib3Np
dHktRml4LWJ1aWxkLWZvci1MaW51eC02LTQucGF0Y2ggYi9wYWNrYWdlL2NyeXB0b2Rldi1saW51
eC8wMDAyLWNyeXB0b2Rldl92ZXJib3NpdHktRml4LWJ1aWxkLWZvci1MaW51eC02LTQucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZTYwMjJjNjg2ZgotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvY3J5cHRvZGV2LWxpbnV4LzAwMDItY3J5cHRvZGV2X3ZlcmJv
c2l0eS1GaXgtYnVpbGQtZm9yLUxpbnV4LTYtNC5wYXRjaApAQCAtMCwwICsxLDQ0IEBACitGcm9t
IDk5YWUyYTM5ZGRjM2Y4OWM2NmQ5ZjA5NzgzYjU5MWMwZjJkYmYyZTkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBHYXVyYXYgSmFpbiA8Z2F1cmF2LmphaW5AbnhwLmNvbT4KK0RhdGU6
IFdlZCwgMjggSnVuIDIwMjMgMTI6NDQ6MzIgKzA1MzAKK1N1YmplY3Q6IFtQQVRDSF0gY3J5cHRv
ZGV2X3ZlcmJvc2l0eTogRml4IGJ1aWxkIGZvciBMaW51eCA2LjQKKworcmVnaXN0ZXJfc3lzY3Rs
X3RhYmxlIGFwaSBpcyByZW1vdmVkIGluIGtlcm5lbC4KK21pZ3JhdGUgdG8gdGhlIG5ldyBhcGkg
cmVnaXN0ZXJfc3lzY3RsLgorCitjaGlsZCBpcyBhbHNvIHJlbW92ZWQgaW4gbGludXggNi40IGN0
bF90YWJsZSBzdHJ1Y3QuCisKK1NpZ25lZC1vZmYtYnk6IEdhdXJhdiBKYWluIDxnYXVyYXYuamFp
bkBueHAuY29tPgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2NyeXB0b2Rldi1saW51
eC9jcnlwdG9kZXYtbGludXgvY29tbWl0Lzk5YWUyYTM5ZGRjM2Y4OWM2NmQ5ZjA5NzgzYjU5MWMw
ZjJkYmYyZTkKK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPgorLS0tCisgaW9jdGwuYyB8IDYgKysrKysrCisgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvaW9jdGwuYyBiL2lvY3RsLmMKK2luZGV4
IDhmMjQxYjg2Li40MjYyYmJkNSAxMDA2NDQKKy0tLSBhL2lvY3RsLmMKKysrKyBiL2lvY3RsLmMK
K0BAIC0xMjQ2LDcgKzEyNDYsOSBAQCBzdGF0aWMgc3RydWN0IGN0bF90YWJsZSB2ZXJib3NpdHlf
Y3RsX3Jvb3RbXSA9IHsKKyAJeworIAkJLnByb2NuYW1lICAgICAgID0gImlvY3RsIiwKKyAJCS5t
b2RlICAgICAgICAgICA9IDA1NTUsCisrI2lmIChMSU5VWF9WRVJTSU9OX0NPREUgPCBLRVJORUxf
VkVSU0lPTig2LCA0LCAwKSkKKyAJCS5jaGlsZCAgICAgICAgICA9IHZlcmJvc2l0eV9jdGxfZGly
LAorKyNlbmRpZgorIAl9LAorIAl7fSwKKyB9OworQEAgLTEyNjcsNyArMTI2OSwxMSBAQCBzdGF0
aWMgaW50IF9faW5pdCBpbml0X2NyeXB0b2Rldih2b2lkKQorIAkJcmV0dXJuIHJjOworIAl9Cisg
CisrI2lmIChMSU5VWF9WRVJTSU9OX0NPREUgPCBLRVJORUxfVkVSU0lPTig2LCA0LCAwKSkKKyAJ
dmVyYm9zaXR5X3N5c2N0bF9oZWFkZXIgPSByZWdpc3Rlcl9zeXNjdGxfdGFibGUodmVyYm9zaXR5
X2N0bF9yb290KTsKKysjZWxzZQorKwl2ZXJib3NpdHlfc3lzY3RsX2hlYWRlciA9IHJlZ2lzdGVy
X3N5c2N0bCh2ZXJib3NpdHlfY3RsX3Jvb3QtPnByb2NuYW1lLCB2ZXJib3NpdHlfY3RsX2Rpcik7
CisrI2VuZGlmCisgCisgCXByX2luZm8oUEZYICJkcml2ZXIgJXMgbG9hZGVkLlxuIiwgVkVSU0lP
Tik7CisgCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
