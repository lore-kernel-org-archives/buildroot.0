Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ECFC369D5
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A81F81318;
	Mon, 21 Apr 2025 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjVJRL3YGajX; Mon, 21 Apr 2025 20:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D0B080CAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D0B080CAB;
	Mon, 21 Apr 2025 20:31:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2BFE1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 988CD40A5B
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjfIGaaO43Xv for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 20:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C68AB40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C68AB40042
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C68AB40042
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:31:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2290833f8f.3
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745267481; x=1745872281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfbgVSOJboXJpsoa7RqB+tnpv1W4EkAfXu1w5t67aBw=;
 b=B3Il3t3oBmn10BLZ/vS4BxFg5jp4CpzLUhUIMiWLmAQx3dselvwdcvMEGlGGXqz2OH
 dVsgbAElOUSvwteQDhjr/FfJBnwDe1p/bDEaIBKP/lACaIUyuCH3pZUxhZTRF8QCh71f
 qglUUJVpKJp0C42CVnVvTTCOb1TCBfMVvks/O6Qwyh+ddIe6o6op0FnPpLm/23J5v2I1
 kMZm+NEo6I/RuFQK7t84QUjougx/b+/LI3jtfZ8FVhPRSsuzi7YSjER//DVHk8B51Boy
 gjGYcCjm4eMW48D+Mj0RMsn68DtCiiUHX4VOU+6XlWeOhhoudp+x43P+Mc16D17vOqAs
 FpRA==
X-Gm-Message-State: AOJu0Yx854hUIeg85ftiY3AkF2oINXqo3H7189Y98uSwGoxqEnzuKTiO
 NMOqZuLkRZofN7JDHDYb6zNTKK7HkGnIJ0c6nHKRHoBK+l6QUlycp8OQCw==
X-Gm-Gg: ASbGncuL+RUanouq+2JzrYF5r/VZdr0o/zgMvjyQ3pIN1VHQ9vXJs1U9Io9ZLjTlXTv
 6PPQCkuGay2PpfEnQwJCrCQHxKzcXZ/cF72/AsAAPztEw6y6jMj05v3W/Tpy6TJHhOsK1hmso64
 j8FqZbs320E3UeS8QBn7kNoQ+MVJVAjTJOurtOvHdnj0KeeSA2zA1hFCwrNyVl42t6nwLDVVKVm
 qL6OXeLMgMWvy1BMrI9BMSLTcD7p5m+r92zaSGQh3sBFmg0OY7GbIQhIYFn4lUD6e2pWny3EtHW
 x3ZAw4KQ5PB0UnEVtmK2De+lHn1uPz8tB9AEAxpLi+h6XMYMYMXEMVvZ1CAH0Ua55Dc=
X-Google-Smtp-Source: AGHT+IFHCJpQSSsC0wEO99DazzhY/Wvomci3K8+XwFfh3qsxMbuUarA9YnNeKXJ6N1twXdVf6CIMhg==
X-Received: by 2002:a5d:5c84:0:b0:390:f394:6271 with SMTP id
 ffacd0b85a97d-39efbae066bmr10658120f8f.43.1745267481397; 
 Mon, 21 Apr 2025 13:31:21 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493124sm12984266f8f.68.2025.04.21.13.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:31:21 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 22:31:07 +0200
Message-ID: <20250421203110.896967-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421203110.896967-1-petr.vorel@gmail.com>
References: <20250421203110.896967-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745267481; x=1745872281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfbgVSOJboXJpsoa7RqB+tnpv1W4EkAfXu1w5t67aBw=;
 b=ElmsuQGTBTzmSTK2eIo5LqNrLeDmbqgjMogELjqU85KqaoCgI5X1zuvaX4sYHrpEC9
 +J/zqTO0RbnjEok4MkWOMrQPx+DLsCeAkvYF5UVSa4v+jPSligaTYSVh9URfOKtB+Gfv
 aRrSuGITXqfxB71V4z4+SP0/YbPz7/9gyBhVUFbfuoQSq7WQgIRBhfDZAiV2rspZBOqm
 ZBluEsz5mMYjKbjegOd2nqtXX6eUkgWbm3jD5wH86YOS3+pNR1wt1/apFYZPAiA+Hieu
 UadwtLJHqJRUwcgi4BvJf2ceXFQUqJBzwZcY/f6CHX+PDYTlOMANTsYQa0Idy5T359TZ
 q65A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ElmsuQGT
Subject: [Buildroot] [PATCH v2,
 2/2] package/iproute2: backport NULL dereference fix
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB3aWxsIGJlIHBhcnQgb2YgNi4xNS4wIHJlbGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBQZXRy
IFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KLS0tCk5PVEU6IFRoZSBzYW1lIGFzIGluIHYy
LgoKSGkgYWxsLAoKTm90IHN1cmUgYWJvdXQgdGhpcywgYnV0IElNSE8gd29ydGggdG8gYmFja3Bv
cnQuClRoZXJlZm9yZSBzZXBhcmF0ZWQgaW50byBpdCdzIG93biBjb21taXQsIGZlZWwgZnJlZSB0
byBzcXVhc2ggaW50bwpzaW5nbGUgY29tbWl0LgoKQnVpbGQgdGVzdGVkOgoKICAgICAgICAgICAg
ICAgICAgICBib290bGluLWFybXY1LXVjbGliYyBbMS82XTogT0sKICAgICAgICAgICAgICAgICAg
ICAgYm9vdGxpbi1hcm12Ny1nbGliYyBbMi82XTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3Rs
aW4tYXJtdjdtLXVjbGliYyBbMy82XTogU0tJUFBFRAogICAgICAgICAgICAgICAgICAgICBib290
bGluLXg4Ni02NC1tdXNsIFs0LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAgYnItYXJtLWZ1
bGwtc3RhdGljIFs1LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFybS1hYXJj
aDY0IFs2LzZdOiBPSwoKS2luZCByZWdhcmRzLApQZXRyCgoKIC4uLmVyZWZlcmVuY2Utd2hlbi1u
by1lbnRyaWVzLXNwZWNpZmllZC5wYXRjaCB8IDM2ICsrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9p
cHJvdXRlMi8wMDAxLW5zdGF0LU5VTEwtRGVyZWZlcmVuY2Utd2hlbi1uby1lbnRyaWVzLXNwZWNp
ZmllZC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXByb3V0ZTIvMDAwMS1uc3RhdC1OVUxM
LURlcmVmZXJlbmNlLXdoZW4tbm8tZW50cmllcy1zcGVjaWZpZWQucGF0Y2ggYi9wYWNrYWdlL2lw
cm91dGUyLzAwMDEtbnN0YXQtTlVMTC1EZXJlZmVyZW5jZS13aGVuLW5vLWVudHJpZXMtc3BlY2lm
aWVkLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjhhNzdmYzQx
ZjMKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2lwcm91dGUyLzAwMDEtbnN0YXQtTlVMTC1E
ZXJlZmVyZW5jZS13aGVuLW5vLWVudHJpZXMtc3BlY2lmaWVkLnBhdGNoCkBAIC0wLDAgKzEsMzYg
QEAKK0Zyb20gODY2ZTFkMTA3YjdkZTY4Y2ExZmNkMWQ0ZDVmZmVjZjlkOTZiZmYzMCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFppQW8gTGkgPDIzMTEwMjQwMDg0QG0uZnVkYW4uZWR1
LmNuPgorRGF0ZTogV2VkLCA5IEFwciAyMDI1IDIzOjAzOjMwICswODAwCitTdWJqZWN0OiBbUEFU
Q0hdIG5zdGF0OiBOVUxMIERlcmVmZXJlbmNlIHdoZW4gbm8gZW50cmllcyBzcGVjaWZpZWQKKwor
VGhlIE5VTEwgUG9pbnRlciBEZXJlZmVyZW5jZSB2dWxuZXJhYmlsaXR5IGhhcHBlbnMgaW4gbG9h
ZF91Z2x5X3RhYmxlKCksIG1pc2MvbnN0YXQuYywgaW4gdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIGlw
cm91dGUyLgorVGhlIHZ1bG5lcmFiaWxpdHkgY2FuIGJlIHRyaWdnZXJlZCBieToKKzEuIGRiIGlz
IHNldCB0byBOVUxMIGF0IHN0cnVjdCBuc3RhdF9lbnQgKmRiID0gTlVMTDsKKzIuIG4gaXMgc2V0
IHRvIE5VTEwgYXQgbiA9IGRiOworMy4gTlVMTCBkZXJlZmVyZW5jZSBvZiB2YXJpYWJsZSBuIGhh
cHBlbnMgYXQgc3NjYW5mKHArMSwgIiVsbHUiLCAmbi0+dmFsKSAhPSAxCisKK1NpZ25lZC1vZmYt
Ynk6IFppQW8gTGkgPDIzMTEwMjQwMDg0QG0uZnVkYW4uZWR1LmNuPgorU2lnbmVkLW9mZi1ieTog
U3RlcGhlbiBIZW1taW5nZXIgPHN0ZXBoZW5AbmV0d29ya3BsdW1iZXIub3JnPgorWyB1cHN0cmVh
bSBzdGF0dXM6IDg2NmUxZDEwICgibnN0YXQ6IE5VTEwgRGVyZWZlcmVuY2Ugd2hlbiBubyBlbnRy
aWVzIHNwZWNpZmllZCIpIF0KKy0tLQorIG1pc2MvbnN0YXQuYyB8IDQgKysrKworIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL21pc2MvbnN0YXQuYyBiL21p
c2MvbnN0YXQuYworaW5kZXggZmNlM2U5YzEuLmIyZTE5YmRlIDEwMDY0NAorLS0tIGEvbWlzYy9u
c3RhdC5jCisrKysgYi9taXNjL25zdGF0LmMKK0BAIC0yMTgsNiArMjE4LDEwIEBAIHN0YXRpYyB2
b2lkIGxvYWRfdWdseV90YWJsZShGSUxFICpmcCkKKyAJCQlwID0gbmV4dDsKKyAJCX0KKyAJCW4g
PSBkYjsKKysJCWlmIChuID09IE5VTEwpIHsKKysJCQlmcHJpbnRmKHN0ZGVyciwgIkVycm9yOiBJ
bnZhbGlkIGlucHV0IOKAkyBsaW5lIGhhcyAnOicgYnV0IG5vIGVudHJpZXMuIEFkZCB2YWx1ZXMg
YWZ0ZXIgJzonLlxuIik7CisrCQkJZXhpdCgtMik7CisrCQl9CisgCQlucmVhZCA9IGdldGxpbmUo
JmJ1ZiwgJmJ1ZmxlbiwgZnApOworIAkJaWYgKG5yZWFkID09IC0xKSB7CisgCQkJZnByaW50Zihz
dGRlcnIsICIlczolZDogZXJyb3IgcGFyc2luZyBoaXN0b3J5IGZpbGVcbiIsCistLSAKKzIuNDku
MAorCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
