Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EB9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0696023B
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C0696023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5337660699;
	Sun, 24 Oct 2021 18:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id az9oxc-OeE-5; Sun, 24 Oct 2021 18:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9244960617;
	Sun, 24 Oct 2021 18:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D016D1BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB54C60617
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YuelVKz2MRQr for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 18:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21E86605DD
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:13:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g8so1342027edb.2
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ahl5prD/RcgzN1Pg3nnE0REs5M54WT8zsNyDdbJuxjg=;
 b=TJ2DxvsrUYMcXmXbkdhuL+cPF/GWqrlvNY1vlWXvhjVryH2NvDk1EurCFsbUF/Bvj3
 N/iYfElifHzHr3+v1N/7xRNWjPmGDEGvLKfLopmwylIL0h0iy76Dpsv02Ug0sNqrpwAQ
 5ciTsyZpjXxHZ8tReINfXtI8ft8xdYa4uUG0jXvTFp602LtuM9f4SJOiXWZIppE+KF6/
 ScIzURfYoMeUkbz49i1UnNJ7JQia3f48Dj6Nu/lLl732lVNYvQG53Uby8xHCHMLQ5jAD
 /BU1h0kErUxbpHZUyuew++3SLaV9XfOK+UGxNW69grUF70GlP8LRfpJQR6Mjt56jRB6M
 iDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ahl5prD/RcgzN1Pg3nnE0REs5M54WT8zsNyDdbJuxjg=;
 b=LEMpdkJc2m06Wc4GnNEbI1DeEfnElmHssNlFEkHxmIVJFtTh3ZgsGDh0ANqUJnQ0K/
 2haqDFBUSY7d2rYDLPgfEaWI2uni1hDW8Tuj8xt8Ah+Kvi1N+debL82rjUxY4cnruj1h
 r/IKqnKUQ4g4uyKksiF8zZGQC2zU+s7W8MGVcKdWsNFT2HtrgBewKxTp+7t9BW+1ZwZC
 nJ4n3XoUQnhR8pEF+R+iuCjNX3WBFzhkDdauWlJ5y4VVINcSuEzEXMN08qzX3Qn9mqlN
 X/lM/+urTPB4vNB7r2ZzECXByzBq3nXRbQUBaqol0yTx58qcRNZKIcu52R00KsCLI6A+
 lIhw==
X-Gm-Message-State: AOAM532hrwjCLOF7286x2OKmr/f59bcQ0lpWlSC9esacPoOydm3+PNrT
 AC5KvAHGNIwbLE0KFwiipY/4itDnh61gLXel
X-Google-Smtp-Source: ABdhPJycUnKIscEHT2QQletauJL5bUqzER85fzwvrhqo2Bz5zzwi9YS+cTN6EfMDZDsr2ovyl9TgaQ==
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr18975652ede.142.1635099222282; 
 Sun, 24 Oct 2021 11:13:42 -0700 (PDT)
Received: from localhost.localdomain (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id v15sm7555367edi.89.2021.10.24.11.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 11:13:42 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:12:18 +0200
Message-Id: <20211024181221.2608908-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024181221.2608908-1-raphael.melotte@mind.be>
References: <20211024181221.2608908-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/python-botocore: bump to 1.22.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYXQgaXQsIHJlbW92ZSB0aGUgbWQ1IGhhc2ggYXMgdGhlcmUgaXMgYWxyZWFkeSBhIHNo
YTI1NiBoYXNoLgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVs
b3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29y
ZS5oYXNoIHwgNSArKy0tLQogcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3Jl
Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3Rv
Y29yZS5oYXNoIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gK
aW5kZXggMzFkZDU4ZGUwYS4uOWQ1ZjcwNmZlZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24t
Ym90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tYm90b2Nv
cmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKQEAgLTEsNSArMSw0IEBACi0jIG1kNSwgc2hhMjU2IGZy
b20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2JvdG9jb3JlL2pzb24KLW1kNSAgMzFlYzkzNThiOWI5
MmQyZDdjZGJhN2ZhNDQ4YzRlZWQgIGJvdG9jb3JlLTEuMjEuNDgudGFyLmd6Ci1zaGEyNTYgIDJj
MjVhNzZmMDkyMjNiMmYwMGFkNTc4ZGYzNDQ5MmI3Yjg0Y2Q0ODI4ZmM5MGMwOGNjYmRkMWQ3MGFi
YmQ3ZWIgIGJvdG9jb3JlLTEuMjEuNDgudGFyLmd6CisjIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlw
aS5vcmcvcHlwaS9ib3RvY29yZS9qc29uCitzaGEyNTYgIDAxMTM2MGU3OWE0Yjg0M2FhNjU5MTU3
M2NmYTYxZThlZGRjOTliOTFhZGFiMWRmZGI5YTJiN2YyYzg1MTExOTMgIGJvdG9jb3JlLTEuMjIu
Mi50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDBk
NTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4N2UxMWI5Mzhl
OTQ1OTQgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9w
eXRob24tYm90b2NvcmUubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2Nv
cmUubWsKaW5kZXggZDg2ZWQ1Y2I5My4uMTYyOGUwNTU2MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9w
eXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWJv
dG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9CT1RPQ09SRV9WRVJTSU9OID0gMS4yMS40OAorUFlUSE9O
X0JPVE9DT1JFX1ZFUlNJT04gPSAxLjIyLjIKIFBZVEhPTl9CT1RPQ09SRV9TT1VSQ0UgPSBib3Rv
Y29yZS0kKFBZVEhPTl9CT1RPQ09SRV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9CT1RPQ09SRV9T
SVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzI0LzUzLzJkMzgz
ZTYxYjI0NjM3MTk3YmEyMTNlYjc4OTEyMzBiOGQyYTdmNmFjOGM0NDE1Mzk0M2I0YTc2MDk5MQor
UFlUSE9OX0JPVE9DT1JFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvMGQvOTUvZjJlNzRlNGE5MTk5NGQ5ZWJlNDU3NDZmNzVhOGM1Y2FmZDcyM2E4ODI3MGE5
NzcyZDhkNjZlMWE4YmExCiBQWVRIT05fQk9UT0NPUkVfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMK
IFBZVEhPTl9CT1RPQ09SRV9MSUNFTlNFID0gQXBhY2hlLTIuMAogUFlUSE9OX0JPVE9DT1JFX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
