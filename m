Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75643C5478C
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 20:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E0A821C3;
	Fri, 23 Feb 2024 20:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jK1yL5AJ-PLc; Fri, 23 Feb 2024 20:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1683F821C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1683F821C8;
	Fri, 23 Feb 2024 20:14:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6AF1BF2FE
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 20:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68A1A40190
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 20:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebsxV2XU8s5i for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 20:14:01 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6779A400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6779A400AB
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6779A400AB
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 20:14:01 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d71cb97937so13737395ad.3
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 12:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708719240; x=1709324040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VKz9fbes0MRLEK16yxhcgudXjaLRiJry7o5jyNxXOCc=;
 b=MEIE4/A1LbURiZZqT4bHW5DgEM9BRtxCLZwa0tuNAIP5yfl2stOydh+gD6CqeqlSW0
 VslOWNYZIjEGF4Hm9TV6LHgOTZdAMhDeBgAo6RmUJ5YWJQS51yqMDFhrf5v+dEf3mBhl
 YUvXEQW3du1wxS85gAmZRJ2pFiCHqh/PiCXRWPt5dcK5xaErr9MB+zfeRZAkmtiuyP7C
 sqq+XkOy1SHsRVNyQEFgtFHux3E1JBpOPrbzY7F4b825AVAJL9OecllduwvJHZ3NomP0
 q5Wdap3bDyh1/M8mu2ps8hmaMIyNakeBBper3zyE0V4ubuMpEgd1S9flBNqWtb16Wsfy
 dzTQ==
X-Gm-Message-State: AOJu0Yz4odVlnI2YCZGffwAh2WQSB6ngGzKfhFkNJr6qULeJwNHxaXNn
 rXyAUAVoikGeR5bZl31juJtR4vYQXpijoZFcugISc0bi1HZJ1Fe7Lch5GIbhQKrXU5fygqCZXaM
 Vaj2yBw==
X-Google-Smtp-Source: AGHT+IF+7N8Jrygm9cLmMsnunHxYdAATU8bmrdOfwRFaofxSQGupdzzcIlpxAJ78x31u6unomJPIpA==
X-Received: by 2002:a17:90a:4985:b0:299:75a9:9273 with SMTP id
 d5-20020a17090a498500b0029975a99273mr912553pjh.21.1708719240406; 
 Fri, 23 Feb 2024 12:14:00 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 pd7-20020a17090b1dc700b0029696f7f443sm1911281pjb.50.2024.02.23.12.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 12:14:00 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 17:13:53 -0300
Message-ID: <20240223201354.478070-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1708719240; x=1709324040;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VKz9fbes0MRLEK16yxhcgudXjaLRiJry7o5jyNxXOCc=;
 b=B3SgQmU3M+6OBsPLrrBMZA6PlnE/797IJ7lEuDXZ+xmsAxV8P6lxLLFx5L37ZG2OUX
 nZOfERqc1FEuhTqpSElt8t4woo/2QL/I4sYdmkuPEt3OkeDDMYS+YkWIPp2ihYSRB34b
 /7EzUczGnMxnzhFt4OIwa+k1I0hYk9y8mIwNClmx8mFZHYiFZ9s5L5Lg0haLgOi1fNoA
 ulJW69sqHRqh7+2koPMPc9jCRYZp5W12mAT6hcrfZtHOOpOQMVdZtuy9vrMB2m/99Rkw
 ubsxX1KxFiUiPxQCaIYjO6TvZg61SToQFbfH9dI89HYnWF1Hu/sgFDEnWzWduW7BosXE
 b96A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=B3SgQmU3
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/2=5D_DEVELOPERS=3A_add_Fl=C3=A1?=
 =?utf-8?q?vio_Tapaj=C3=B3s_for_python-paho-mqtt?=
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
Cc: Davide Viti <zinosat@gmail.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogREVWRUxPUEVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMGYwNjViZmFm
Yi4uZTA0ODRjMDRiMCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC0xMDc3LDYgKzEwNzcsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1weW1vZGJ1cy8KIE46CUZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgogRjoJY29uZmlncy9h
c3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKIEY6CWJvYXJkL2FzdXMvdGlua2VyLXMvCitG
OglwYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvCiBGOglwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15
LwogRjoJcGFja2FnZS9yc3lzbG9nLwogCi0tIAoyLjQzLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
