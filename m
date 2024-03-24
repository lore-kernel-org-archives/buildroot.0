Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254CBC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9D61400C4;
	Sun, 24 Mar 2024 16:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9gokJMF4kXD; Sun, 24 Mar 2024 16:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD7DF4034A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD7DF4034A;
	Sun, 24 Mar 2024 16:29:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4D11BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD3740557
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAS4vWunVNre for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:29:07 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7B6540550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B6540550
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7B6540550
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:29:06 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3685ef364d8so17739785ab.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711297745; x=1711902545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I5kTvAcw1QnJgp3j7E7qL8IT7aDIkDCJJfTUDPqmr3Y=;
 b=OwPIR6BNbvoKE0NuRKd0hXCrRmrhlE5e/YhqxVDpDEcmIqqlAQUnfmsafgcK32eQYQ
 mR3/ZQZ8eGlpEBjsg3tqXHVbdZu137iKN4tArgwVCKXxGPZAWFB9VzWKU3ogxN9igt+k
 oihv4J1rUl2wcN/5kPd4CF3BKpfcMZlKjhkjKLk9h0NtG40dHbNf0VSuQ2yl6ANX3G2o
 xvEZSMKI1zScU3womVUCk2ikmnTGg0oRQyVBvqrhpPYaa2N6lf3GtegohG0SpK6W2C7f
 OENJBw6h8Ax8GYKIQougA5H1P0egEiggOsqO4qJm3dHCRW/LNSGoCr+yUpc0PhDVUUqb
 gZ9A==
X-Gm-Message-State: AOJu0Yz2jmuPEFurdCWdEOgSXPSuLf2jgkVd/R37OAb3JnjW7pLOF+fG
 lTCf9nhbBMcjEraMWpftHMnCSftzjIuZrLpf85M9nPCUViu/huZEOdZZWluRsExZ1E54cRk1r+n
 5gDo=
X-Google-Smtp-Source: AGHT+IH2Gyy4OAR2H/HEKj6ppxaOfPQTf9IH7FSdJW63O13VINSlE2nOFdZVQi1GklPQybrBxHLMjg==
X-Received: by 2002:a05:6e02:13c9:b0:366:175:15c1 with SMTP id
 v9-20020a056e0213c900b00366017515c1mr4857434ilj.31.1711297744842; 
 Sun, 24 Mar 2024 09:29:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:b402:265:5f08:1698:f1a5:8997])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a636b0a000000b005d880b41598sm4594385pgc.94.2024.03.24.09.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 09:29:04 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 13:28:47 -0300
Message-ID: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1711297745; x=1711902545;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I5kTvAcw1QnJgp3j7E7qL8IT7aDIkDCJJfTUDPqmr3Y=;
 b=bSglP2IvEdlNaD4xD5b9bBJsaaRTRPpdzDdDz+YK2xuB7AmcD4F106JZMgce3+yHQL
 fS0YMzlN2I+mKUtvoXwr9DRv8PNf4BADbElwV8fcsaqNmxY6CJQ0IIT5AJkkC7NxBYI3
 rp9sVZCvyLxRxiK7BWmb1ywLKLk3i5e1vpVWREXnqPdiyuAGmBnAmqKD6NE7WaDuZGvr
 aiwVTWCpz10swVV4wVTAipHciT2aRYibZ52Ufk/l6H7xUD1N3PXKvQ4sQsoHkMh0hg3b
 P7OHMFDJuWJg5YDmwLjSkGIaxonPSF/ybB1NIfqJ598ILsHCOhfy9gdGgIgB5Z21JLIk
 X8qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=bSglP2Iv
Subject: [Buildroot] [PATCH 1/2] package/python-sqlalchemy: add cython for
 python-sqlalchemy
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpXaGVuIG1p
Z3JhdGluZyB0byBzZXR1cHRvb2xzIHdpdGggcGVwNTE3IHN1cHBvcnQgd2UgbmVlZCB0byBhZGQK
aG9zdC1weXRob24tY3l0aG9uIHdoaWNoIGlzIGEgcGVwNTE3IGJ1aWxkIGRlcGVuZGVuY3kgZm9y
CnB5dGhvbi1zcWxhbGNoZW15LgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+ClRlc3RlZC1CeTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+ClNpZ25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3Mg
PGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgotLS0KIHBhY2thZ2UvcHl0aG9uLXNxbGFs
Y2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkubWsgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rCmluZGV4IDQwMGFkOTJmNjMuLjE2N2MzYTQ0OTggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0
aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24t
c3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tawpAQCAtMTIsNSArMTIsNiBAQCBQWVRIT05f
U1FMQUxDSEVNWV9MSUNFTlNFID0gTUlUCiBQWVRIT05fU1FMQUxDSEVNWV9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQogUFlUSE9OX1NRTEFMQ0hFTVlfQ1BFX0lEX1ZFTkRPUiA9IHNxbGFsY2hlbXkK
IFBZVEhPTl9TUUxBTENIRU1ZX0NQRV9JRF9QUk9EVUNUID0gc3FsYWxjaGVteQorUFlUSE9OX1NR
TEFMQ0hFTVlfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY3l0aG9uCiAKICQoZXZhbCAkKHB5
dGhvbi1wYWNrYWdlKSkKLS0gCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
