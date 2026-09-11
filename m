Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830C9C88E50
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 22:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2983C605F8;
	Fri, 11 Sep 2026 22:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHhGp2-3G7A5; Fri, 11 Sep 2026 22:10:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15C7B60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789164641;
	b=YX/oUaMhokufhi/52B3uFyd95447vW7jQfCx/zavDWoNDk/9f477AiYp6TkNGyAcdWUf
	 G4k/7/ysvHuXpzcj6aVj1bAMFZG0j4wvQBooItTJKwy1myoMR3eMtguBYCI2LHYqCZtwd
	 2m55mGabEtU7GEF15FHgmlOdIRiix13ZUV7gph4BM7sVhMyvsqsnPbl+O6UJnAjBfgXle
	 3NBSOzDktH9Dyk6hALRqTM7DAz+RljqLcVNadRZl51qiS+ZbAgtVWgT40p2Lkxg+ATsie
	 zsFpTW6W2NeZvF1CfMqcONBz+ai3N5nxkwhwyCn1MiidoJm4UZcSMWRLsBJeFIX3zQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789164641;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=24PlqNrQw44ahk1b0axjQQw8/KezwFn4NJz0Q46LfGA=;
	b=Kk75wph2O3kGZfvmzQjOV1eWzwCsw5h2YtXisNzojWQbaUvrskhPwveVXkfKX93sQ3Rv
	 cbr7nGoulAOg4OLg61NxQKPG4nYiRzxFTUMSKE3oq9R1essSqwU2hhlgL3wYZsE1z7chP
	 EoaGDYvOoSmTRg25FFwp8FTZSEuI/Yd54NrTHXU0HERj1nBv7WdLzcbN9ZmXpaGWnsC9Y
	 BwSxVGRCC8uM1HMnY86CxtzAqnQV7AgDeHF8jWHp1fFMwFO1cMHcqCxmbrZneDcB2nEmC
	 RrdDyCrp+fA1zYC+I10nqlTYUR/bqkw6MkdRhbsqcsypC6VKnDt9snhabQuwyW9RWjw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789164641;
	bh=24PlqNrQw44ahk1b0axjQQw8/KezwFn4NJz0Q46LfGA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gItt4H90q1jRtsSr4OcJGxjV8Og1+rs3T6/T+8EmmNAolZISvbxeltOfbvkFWMwlJ
	 aFXheF00temP9TMCHCuXgtwGNZNyxf74uiMAJipJBYKymYfjonHUsAfBJ8aciamAMG
	 tBHCbEBAzzjgHQrboM/Jkhuva7ZGgQnX/67B6quO4is1WdpHPo6IHL1qsaOHDvXX9F
	 OaFrkic1BYn2izyOdL76SED3jmQNLDwfQ2f7/bLV9LwZLHbXbjkN5ePi7fTI8StC/M
	 JtJ6mmT+OVGE4WYiqAoRPOSjBRCK7ExyzI9ot+YXSCdEvdGgN09D80MVH8MG64w8Md
	 nnmlURTknHIWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C7B60601;
	Fri, 11 Sep 2026 22:10:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ADC12E3
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0101D4008E
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUqjcCaLZGiV for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 22:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5E23E40061
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789164638;
 b=JJEGkCrOkpyKiclZZ3BztISf/tQ2ny5XwoS4CUZA+h8lwIwaFuuwQ2q6Cjz6sleN5Qo8
 n2juxZMNRSNVldeVjd7bRLYhVYu3A37NAltph1vs0OadJfGU1BOoch8BsCEWBKNkFV5aV
 UmYk/QaYKGLaUBI7Qgkmr2HyfGopOoyxrebOcXu29cQ5Y5NAiRoWvy5hb+X1725xsQQJQ
 Xc8FKg8L1YnkmYd78Obu3HDKHrubOFbVWyfkL2llXEO7QJsnCkVz9relHEcLVFIbMhO7A
 b5ATjUlgO1uSOtEqsB4q7D/cXZIbWvHMSdJqxq3Q4SOR9YNrCwyC7tlFM/ffVT653rQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789164638;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DQ03tJQG/o11BaZfkSbpgTZd/zqAtTipViiBOAzeqYU=;
 b=lgCLTdGZdX9DGZZO0CYeasUbGI+P9g/TkOA6msJ7byoQjp6AfBY1I6OtVjybnnFXc0+w
 Ky/yN24l90ABCXX1t79+fgqnWB8xBzCvee2Egsh0vZTy5Dl8IFl7gEe2ab/RG1Gt8rPmW
 ojF2HJBPjbYe+xxsrw86nanmEyRqM6Cyt6oVKDUGH6wLDPiSl28O3IhNGBaSEt3tqTDNH
 j7nI5Ah+fq+KM4lMv02StxI3gH2McFZMA3+k5gyHYa2PU/9KPG7As0D69UpcC0F9dOT76
 S8isL5BrJmD8f9QbTIor0oPsR1Rlp+mhUjG/mP47moaLa0x1iMx8XIGL0xwWpr8aTWg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FOd+vZ7e; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FOd+vZ7e
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E23E40061
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789164634;
 bh=DQ03tJQG/o11BaZfkSbpgTZd/zqAtTipViiBOAzeqYU=;
 h=From:To:Cc:Subject:Date:From;
 b=FOd+vZ7eLO01bTmtnEw06muCUsEYzZy89tZQmpDuMrEO5el105W6qGGy+tBj7R/hH
 IuhSj2aKqal0LqzOr65Sydz3fBQCxzDiz2qMn5n/3th0Q59pBfbdIr9cVFxhwaFAN3
 OFi/3HzlFyIB6FFZ3ue5I/t15rqNY3MI+rMIXZ2WLcJUefdwK1YUJpfeU3wyjaVQxJ
 dTfrkFWa/asv7wkSjpETatjWPuwLDiJKcRecQm8/sshrmpmoMke27okd94Tf0KDybm
 d2UCZk/ZWQLRFcrkEw2ngPGddba2a1o4D9biHKiVsIianZMOssGCsa1eMmZ3CgXA/q
 BFHiF1P7iiyoQ==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 329AFA4C244F;
 Sat, 12 Sep 2026 00:10:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33350)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x59S5-0000000076f-35zK;
 Fri, 11 Sep 2026 22:10:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Sep 2026 00:10:33 +0200
Message-ID: <20260911221033.880486-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/tpm2-openssl: bump version to 1.3.0
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

aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1vcGVuc3NsL3JlbGVhc2VzL3Rh
Zy8xLjMuMAoKVXBkYXRlZCBsaWNlbnNlIGhhc2ggZHVlIHRvIGNvcHlyaWdodCB5ZWFyIGJ1bXA6
Cmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItb3BlbnNzbC9jb21taXQvM2Zi
M2E1ZmY3ZmNkOTkyMWFkNmU5MzNhZWQ4ZjM0ZThlNjNkNDZkYgoKUmVtb3ZlZCAtV2Vycm9yIC1X
YWxsIGZyb20gTWFrZWZpbGUue2FtLCBpbn0gd2hpY2ggd2FzIGFkZGVkIGJ5IHVwc3RyZWFtCmNv
bW1pdCBodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLW9wZW5zc2wvY29tbWl0
L2MzYTg3NThjYWQxNTIwZDM2ZDZjYjg3YWE4N2ZmODAxMmYzMjgzZDgKZmlyc3QgaW5jbHVkZWQg
aW4gdGhpcyByZWxlYXNlLgoKVGhpcyBmaXhlcyBhIGJ1aWxkIGVycm9yIHNlZW4gd2l0aCB0aGUg
R2l0bGFiIHBpcGVsaW5lcyBmb3IKYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9sZDoKCnNyYy90cG0y
LXByb3ZpZGVyLWVuY29kZXIuYzoKIEluIGZ1bmN0aW9uIOKAmHRwbTJfcnNhX2VuY29kZXJfZW5j
b2RlX1N1YmplY3RQdWJsaWNLZXlJbmZvX2RlcuKAmToKc3JjL3RwbTItcHJvdmlkZXItZW5jb2Rl
ci5jOjg2OjcxOiBlcnJvcjogdGhlIGNvbXBhcmlzb24gd2lsbCBhbHdheXMKIGV2YWx1YXRlIGFz
IOKAmHRydWXigJkgZm9yIHRoZSBhZGRyZXNzIG9mIOKAmHRwbTJfcnNhX2VuY29kZV9wdWJsaWNf
ClN1YmplY3RQdWJsaWNLZXlJbmZvX2RlcuKAmSB3aWxsIG5ldmVyIGJlIE5VTEwgWy1XZXJyb3I9
YWRkcmVzc10KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0t
LQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWls
ZHJvb3QvLS9jb21taXRzL2U2NjAwNGEyMmEzMTMzZTdjNDllZGU4MGJjYTlkMTM3ODBkZjAyMDEK
CiBwYWNrYWdlL3RwbTItb3BlbnNzbC90cG0yLW9wZW5zc2wuaGFzaCB8IDQgKystLQogcGFja2Fn
ZS90cG0yLW9wZW5zc2wvdHBtMi1vcGVuc3NsLm1rICAgfCA3ICsrKysrKy0KIDIgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvdHBtMi1vcGVuc3NsL3RwbTItb3BlbnNzbC5oYXNoIGIvcGFja2FnZS90cG0yLW9wZW5zc2wv
dHBtMi1vcGVuc3NsLmhhc2gKaW5kZXggZWUxNWVlODg1Zi4uMzZlZjcwNTA2OSAxMDA2NDQKLS0t
IGEvcGFja2FnZS90cG0yLW9wZW5zc2wvdHBtMi1vcGVuc3NsLmhhc2gKKysrIGIvcGFja2FnZS90
cG0yLW9wZW5zc2wvdHBtMi1vcGVuc3NsLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkg
Y29tcHV0ZWQ6Ci1zaGEyNTYgIDJlZTE1ZGEyZGNlYWUxNDY2ZmZiYTg2OGU3NWEwMGIxMTlkNzUy
YmFiYzFiNmEyNzkyMjg2MzM2YTMzMjRmYjAgIHRwbTItb3BlbnNzbC0xLjIuMC50YXIuZ3oKLXNo
YTI1NiAgN2ZmYmE5ZDY2MjI2ZWI2N2FiYjk3NDdjZTFjZDQ3NDc3ZDU2NjE0M2E4ZGVkNTk3YmJk
OTc0YzZmYjVmZTlmNSAgTElDRU5TRQorc2hhMjU2ICA5YTlhY2E1NWQ0MjY1ZWM1MDFiY2Y5YzU2
ZDIxZDZjYTE4ZGJhOTAyNTUzZjIxYzg4OGZlNzI1YjQyZWE5OTY0ICB0cG0yLW9wZW5zc2wtMS4z
LjAudGFyLmd6CitzaGEyNTYgIDM1NWRkMGVkMzA2ZWFiYTBiNzM5NzU0Mjk3M2IwYmRjY2U4NGZl
ZDAzNmE1OGY5NGJlOGNmN2Q3NWY0MmRlYmEgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
dHBtMi1vcGVuc3NsL3RwbTItb3BlbnNzbC5tayBiL3BhY2thZ2UvdHBtMi1vcGVuc3NsL3RwbTIt
b3BlbnNzbC5tawppbmRleCBlZDU5MGMyZjQ3Li41Yzg3Y2M0YTY0IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3RwbTItb3BlbnNzbC90cG0yLW9wZW5zc2wubWsKKysrIGIvcGFja2FnZS90cG0yLW9wZW5z
c2wvdHBtMi1vcGVuc3NsLm1rCkBAIC00LDEzICs0LDE4IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1UUE0yX09QRU5TU0xfVkVSU0lPTiA9IDEuMi4wCitUUE0yX09QRU5TU0xfVkVS
U0lPTiA9IDEuMy4wCiBUUE0yX09QRU5TU0xfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItb3BlbnNzbC9yZWxlYXNlcy9kb3dubG9hZC8kKFRQTTJfT1BFTlNTTF9W
RVJTSU9OKQogVFBNMl9PUEVOU1NMX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKIFRQTTJfT1BFTlNT
TF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogVFBNMl9PUEVOU1NMX0lOU1RBTExfU1RBR0lORyA9
IFlFUwogVFBNMl9PUEVOU1NMX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBvcGVuc3NsIHRw
bTItdHNzCiAKK2RlZmluZSBUUE0yX09QRU5TU0xfRElTQUJMRV9XRVJST1IKKwkkKFNFRCkgJ3Mv
LVdlcnJvciAtV2FsbCAvL2cnIC1pICQoQEQpL01ha2VmaWxlLioKK2VuZGVmCitUUE0yX09QRU5T
U0xfUFJFX0NPTkZJR1VSRV9IT09LUyArPSBUUE0yX09QRU5TU0xfRElTQUJMRV9XRVJST1IKKwog
IyBQcm92aWRlIC0td2l0aC1tb2R1bGVzZGlyIHRvIGF2b2lkIHVzaW5nIGFic19idWlsZGRpciBh
bmQgREVTVERJUgogIyAoYWxzbyBkZWZpbmVkIGFzIGFic29sdXRlIHBhdGgpIGF0IHRoZSBzYW1l
IHRpbWUgdG8gZGVmaW5lIG1vZHVsZXMKICMgaW5zdGFsbCBwYXRoIChhbV9faW5zdGFsbGRpcnMp
LgotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
