Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E7DE74ADB
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 21:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE59845F9;
	Tue,  3 Dec 2024 21:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PzHa0Vpsz67; Tue,  3 Dec 2024 21:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D76A1845FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76A1845FC;
	Tue,  3 Dec 2024 21:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B8E2073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD18660F79
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-JpAqWqMHg2 for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 21:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED64360E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED64360E07
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED64360E07
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:57:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2EA7860128;
 Tue,  3 Dec 2024 22:57:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56330])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 22:57:35 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 22:57:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20241202190647.1211779-8-bernd@kuhls.net>
References: <20241202190647.1211779-1-bernd@kuhls.net>
 <20241202190647.1211779-8-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <c2be6e5c80cb8a212f3c60c7d7414dd1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733263062;
 bh=wu7GzLO5ij6/kPv2QsENRmB5gkOryMvFmO3WsLYaRXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eIDWoRRGtMti7AAtrtCeFdTDDCxo+1r7DH40joQbgeqBk1pfhfE7w731LogKDapoi
 l8DUiICwIw3raxJVm1TN9KI2mVP9s532OBpqvvUigF8q5fEC5iuMc3JU+8pYHzMmMp
 f/Tsm8C0UP2EEYzVPKye2Rc5GWYKgtIE4abS8RfUgiDcX0quvgxu6EnkNSUWKtMTWh
 LOJW56U6Aruq3Qx2go+MQiMjAFioBSmlKasNQUMFnYqhw113uHEydXOkNavYHdKb5q
 YgPrIHPbcjvbPON4J3xktj+TkeSmAJqLPWHum12pIW4+cmvuFWMZhFkpeRLaSQdE+3
 22Fd8Y1YTm2Xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eIDWoRRG
Subject: Re: [Buildroot] [PATCH 8/8] package/vkmark: add vkmark benchmarking
 tool
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsIEFsZXgsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIDAyLzEyLzIwMjQgMjA6
MDYsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IEZyb206IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4KPiAKPiBXZSBidWlsZCBmcm9tIHRoZSBjdXJyZW50IG1hc3RlciBhcyB3ZSBu
ZWVkIGZhaXJseSB1cHRvIGRhdGUgYml0cyBmb3IKPiBjcm9zcyBjb21waWxlIHN1cHBvcnQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpUaGlzIHBhdGNo
IGdlbmVyYXRlcyBmZXcgIm1ha2UgY2hlY2stcGFja2FnZSIgZXJyb3JzLiBSdW5uaW5nOgoKICAg
ICB1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQoKU2hvd3M6CgogICAgIHBhY2th
Z2UvdmttYXJrL0NvbmZpZy5pbjo3OiBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCBvbmUgdGFiIAoo
aHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCiAgICAgcGFja2Fn
ZS92a21hcmsvQ29uZmlnLmluOjE3OiBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCBvbmUgdGFiIAoo
aHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCiAgICAgcGFja2Fn
ZS92a21hcmsvQ29uZmlnLmluOjI2OiBhdHRyaWJ1dGVzIG9yZGVyOiB0eXBlLCBkZWZhdWx0LCAK
ZGVwZW5kcyBvbiwgc2VsZWN0LCBoZWxwIChodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8j
X2NvbmZpZ19maWxlcykKICAgICBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW46MjY6IHNob3VsZCBi
ZSBpbmRlbnRlZCB3aXRoIG9uZSB0YWIgCihodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8j
X2NvbmZpZ19maWxlcykKICAgICBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW46Mjc6IHNob3VsZCBi
ZSBpbmRlbnRlZCB3aXRoIG9uZSB0YWIgCihodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8j
X2NvbmZpZ19maWxlcykKICAgICBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW46Mjk6IGF0dHJpYnV0
ZXMgb3JkZXI6IHR5cGUsIGRlZmF1bHQsIApkZXBlbmRzIG9uLCBzZWxlY3QsIGhlbHAgKGh0dHBz
Oi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVzKQogICAgIHBhY2thZ2Uvdmtt
YXJrL0NvbmZpZy5pbjoyOTogc2hvdWxkIGJlIGluZGVudGVkIHdpdGggb25lIHRhYiAKKGh0dHBz
Oi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVzKQogICAgIHBhY2thZ2Uvdmtt
YXJrL0NvbmZpZy5pbjozMDogc2hvdWxkIGJlIGluZGVudGVkIHdpdGggb25lIHRhYiAKKGh0dHBz
Oi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVzKQoKQ291bGQgeW91IGZpeCB0
aG9zZSwgcGxlYXNlPwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
