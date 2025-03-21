Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5802C36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965EA411FF;
	Fri, 21 Mar 2025 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH9i8l2mT1bE; Fri, 21 Mar 2025 16:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C68A541222
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68A541222;
	Fri, 21 Mar 2025 16:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACE311A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE0C411FF
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8_dBiDp8hXm for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 16:21:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFE2F40D1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE2F40D1A
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFE2F40D1A
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 16:21:14 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225b5448519so44169405ad.0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 09:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742574074; x=1743178874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BJnbD5kZ20nlKozD2rvc9TcaUhebZc7QprZrVRTtIs=;
 b=ePg053AHiDdd/HFrutySFuqAvOH4IweR1a3whik2NnipkgSrNhimKPcUtOF4r0qeLL
 LCwMEJ2BlBbHcrKKuQ4i1V6mmEITQDKkv6TMNeH97uguXvfcmigj8m5XklM1rntCo0BZ
 1U9D5RHBExTNs2YCth+MNiOjkjChfvLeYxfnRl2gmmQ8TnRUoWwVzD9XmVBcOpGujiS7
 +seezBBsok4WkFNA11iDOjH1J9LrJoGv+Yu0PytNOo4LESDrQr+j0ivsFC8LastGbnd+
 yI9pM6EIIcZdSHZaQtPF1iSrLkBbDRMb/jjyY2aAcsie1x3Pvt013DFjd6wBhBENRIzV
 WP7A==
X-Gm-Message-State: AOJu0YzpvNHsNfWBwLXN6AcC72j1o3I6WHNHiUw9vJkyD6KjnDHPkU39
 t4qbJV6uZQE6W3WqjIgbfuknGv8/aVPbz2ECyJaP1Hu+7gjEwUT+Y6L3Q78q649q6mFZ6apwbKj
 ibr4=
X-Gm-Gg: ASbGncvrct+VXOx+Wz4U+0yh7IheHzzTwZGa5MkuSZZaVhwEfM4kZ1PKm2vFDvvY6nP
 UGyZtusmTNJZbLAUD/RnIPzqhTddoJr2/ybNO2HMNPcb0FZvKkusgZYC5FWLxdTDAMyF+zUp0Yc
 QV7BvAcX96SrVvjAq7mprcz/D4gO8nbD6qSeLQ8sSHKQvC2xRxwC9ZmIiHvMPy/cZqJFKSeWvU8
 Z9wMt1RvUGtBMUTLkGEVIzQsPkkpDqYndRJEIQC3zLeXcQVlMRvO+9fT0csIXicuORMlEr1E2/O
 4rHOBWH3rkwQLKgdq7FFIG4Bl2zGQzqCPvg0WoNdTMoEmF/sS5pRhWp5nNO6OB0lPhSNAH/bPvg
 =
X-Google-Smtp-Source: AGHT+IGXU3nc6aBdRF94O724EHQgvFFzN9lLlV7H7zBS4j/H/HYmKp157YRSqIXx7xRP6MFgg0xvmA==
X-Received: by 2002:a05:6a00:1702:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-7390597f7eamr5175848b3a.7.1742574073632; 
 Fri, 21 Mar 2025 09:21:13 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739060089fasm2134601b3a.75.2025.03.21.09.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 09:21:13 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 13:21:08 -0300
Message-ID: <20250321162108.1852085-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1742574074; x=1743178874;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0BJnbD5kZ20nlKozD2rvc9TcaUhebZc7QprZrVRTtIs=;
 b=DuUVzSqK7J/Zn5xPbngQ7QcVlLDtZMT673+PKzu5aVz5acpiu3pEXS8r2IwL5iiBJM
 dZMW7UoVV4U0zqcyyR/37hGa2yfLqCsM3Vc2wxxUf+varD55xVaifs37oOKkUNRHVkiK
 yhoiillm7qV+QhU7/j8eamgq3DMG4TunULmk+5Mfse1wqwpOGDym0cyjJPPBPpol5rJi
 49QJLgAJC5I1nXp0VWW7TARLrfxkQNi5PXz04omYcRkfXqVloh+fKVeF+IUkd8TBrby+
 o1wwfpHa4qWjOlCrC5atPgEP0pxlmlg3DV+vTPHuPsxVAHELnJcCBkJ5DhLsfwV1GvYE
 RG2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DuUVzSqK
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.0.39
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGNoYW5nZSBsb2csIHNlZToKaHR0cHM6Ly9kb2NzLnNxbGFsY2hlbXkub3JnL2VuLzIwL2No
YW5nZWxvZy9jaGFuZ2Vsb2dfMjAuaHRtbCNjaGFuZ2UtMi4wLjM5CgpTaWduZWQtb2ZmLWJ5OiBG
bMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KLS0tCiBwYWNr
YWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2ggfCA0ICsrLS0KIHBh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoIGIv
cGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCmluZGV4IGFh
OTg4OGI1OGQuLmM2NmVlNDRlOTEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hl
bXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaAorKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15
L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIG1kNSwgc2hhMjU2IGZy
b20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NxbGFsY2hlbXkvanNvbgotbWQ1ICAzY2JmMjE4YzU0
YjI1ZmE0ZTE4ZDc4ODQyOTU2NjAxZCAgc3FsYWxjaGVteS0yLjAuMzgudGFyLmd6Ci1zaGEyNTYg
IGU1YTRkODJiZGI0YmYxYWMxMjg1YTY4ZWFiMDJkMjUzYWI3MzM1NWQ5ZjBmZTcyNWE5N2UxZTBm
YTY4OWRlY2IgIHNxbGFsY2hlbXktMi4wLjM4LnRhci5negorbWQ1ICA0YWVjYjhkM2IxZDA3N2Q2
MDk5YzFmOGVkMTgzNjdhNCAgc3FsYWxjaGVteS0yLjAuMzkudGFyLmd6CitzaGEyNTYgIDVkMmQx
ZmU1NDhkZWYzMjY3YjRjNzBhODU2OGYxMDhkMWZlZDdjYmJlY2NiOWNjMTY2ZTA1YWYyYWJjMjVj
MjIgIHNxbGFsY2hlbXktMi4wLjM5LnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBj
aGVja3N1bXMKIHNoYTI1NiAgOTgyMTcyMGI1OGQ0YTU2NWI2MTMyMTAwN2E4YWQ0M2FiNjk5MWEz
OTU5ZTY2Y2Q1ZGI0ZGQ5ZWFlNjljN2RmYyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayBiL3BhY2thZ2UvcHl0aG9uLXNx
bGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5kZXggM2E5ZDllMDZiNi4uMjZkN2QzMDhi
OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVt
eS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1r
CkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1NR
TEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4zOAorUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIu
MC4zOQogUFlUSE9OX1NRTEFMQ0hFTVlfU09VUkNFID0gc3FsYWxjaGVteS0kKFBZVEhPTl9TUUxB
TENIRU1ZX1ZFUlNJT04pLnRhci5negotUFlUSE9OX1NRTEFMQ0hFTVlfU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lNC8wOC85YTkwOTYyZWE3MmFjZDUzMmJk
YTcxMjQ5YTYyNjM0NGQ4NTVjNDAzMjYwMzkyNGIxYjU0NzY5NGI4MzcKK1BZVEhPTl9TUUxBTENI
RU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMDAvOGUv
ZTc3ZmNhYTY3ZjhiOWY1MDRiNDc2NDU3MDE5MWUyOTE1MjQ1NzVkZGJmZTc4YTkwZmM2NTZkNjcx
ZmRjCiBQWVRIT05fU1FMQUxDSEVNWV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX1NR
TEFMQ0hFTVlfTElDRU5TRSA9IE1JVAogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
