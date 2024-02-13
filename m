Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB65BC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B3F8238C;
	Tue, 13 Feb 2024 21:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQzvlhkEnEyh; Tue, 13 Feb 2024 21:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 634C48232B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 634C48232B;
	Tue, 13 Feb 2024 21:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9BA61BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8A1060C1A
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_2SHQ66vrcN for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0541560C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0541560C14
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0541560C14
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:16:04 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so293990739f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858963; x=1708463763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9vErHwNVDwf/OCPhrHELAZ7ff4SHY8pAQZVoaZnXOU=;
 b=kqmzSHONK/n4wfJk0OhWSXaZ3jyHXjIUyc6UU6R9AAWP2IECS1pMWF1LLZbi7UZMo7
 bEQgtAGxW48fAwTMN6UhsEqDZYm4fLR+p+e9kZ3wpWgfR+1UQe38oYWaFL2gH02XUeHc
 xLfLvcA49B+mOmfP8AAB56X1MjKa6Len5Rwt9uUs4Tt4uEqiALfdrsTb2BSCZodQG3EB
 Fpt9iERBG0InMtrtmTpAiGNPdYw9R0f6bguzvo8z9FYruIL4kyJcgiAFipj8zF1GsT6n
 EzKVFMMWoqc7roBs5JxAAHtRBLKYwAwSdPObBuwn31dnRXl211ijZNb544qB4k+XZ2lN
 L/TA==
X-Gm-Message-State: AOJu0Yy63seqyL0GQMEB2K59fr6duMweEUWaX4yYLwJc/U934o+5J3yZ
 E5LzQl70r5dF3WjS4HUf4AsVlJ64JFPL/7MwZGX59MyUc5K1FYKeKY1twE6yff6p7A==
X-Google-Smtp-Source: AGHT+IHCAtWmNFfRfvu60TpIOdC3DN1sCaOBumFvvfGbpAVmOdTfZ5Tjo0hmwee0zI0d0iLQ8oF8kQ==
X-Received: by 2002:a05:6602:21c6:b0:7c4:7627:b4c6 with SMTP id
 c6-20020a05660221c600b007c47627b4c6mr1031817ioc.7.1707858963242; 
 Tue, 13 Feb 2024 13:16:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUz9DDn2A7dL1fyEfPKkun2O57Pp2bxSThvLYQ9ikgCRqreOwuv/bbttq+3CaL6gEcXByME/AQsfYMlGlL7c9Sf4CSLdVMD0AUcflqlVsPfVun3D6vbIMYtoqnSfSjwpb5ARdXdQFpEMQN0XyVZBY4geycLQpOxi/FUClVBDfeOlYPnelAFYoheNYbbYbcqRhtcfC9Zf0hGv8SvZwGjgEInH4jUQjewz7ZNVg3B6O37Oho5oFjMZwbku6xMLGxMHqTOpip1xCFXoU/gE5aNMGFUbMaP1c8wHW1u+hDB95ztLQJGBdpjEa3FcefmViFjPaz7GfdK8R6sykpzZnNoG0PCd1ghF2/0erajoEXJ5naoLa5FSumWb7W32ZH4/YMAUx5WQusqJtJAN30x01Kj2nwcY+nPJtNN07+M9rCLdnQ/1ilbOV3hzzSSM/tcKMzTZoP4Ko9HfvFv7VvnLE+yz/ks7Ja/kHAzXeLLIn2qrFCZIJN1bifY82sj7MIOmHB+6xJDZUC73yZ7Iak0AcKY+Wof/3Wr4RIbcAaq114eYwh2zOsk7RiRXgXb1i1fE1kVh2Idd3KiJsMtTxyX6czSlKvTdH4InILEk5TcSjGnpPUmfIXcgJMglGKz9Sl3f8YBXIlkyMqxIJslD4degJIUEmmLNLmRqxFcvN0azJUO52czIPFJbKwaZ4N/pS8djvXJ+0cfijc70B3yAPpYXITdMzKtNi073KFC19nEvjK+YOzSJQNZ0vfEYg==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:16:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:10 -0700
Message-Id: <20240213211512.3918044-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858963; x=1708463763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9vErHwNVDwf/OCPhrHELAZ7ff4SHY8pAQZVoaZnXOU=;
 b=d9DB9Z/lwSP77m7GJWAGQ5+CPrAmKNqCDYdvZedtbOzxN+5KG1WV+xLOMkB+ZMrQoX
 Wk8BC5sqPxylnJshob1O+0P0nbxI3lc8fso6LEHenNjBFWHbRDjSuNhe+ylDK9RfLv1V
 O7oEYlfvAigH0TJ/FLIB3AiDkKOXs5dVAkHbLOvfqYf1e34zuL0uCIf4UhrlmeNyZ0qT
 L1LMDUNV/1EmGSHFMmXY++FdZGIFU9ouJJpc5ABJUbg+eieRoXZixgtkkTkH+ZuqXXHi
 7QchdLeLyIVQWIXkbSDORTsGp2zcUyPaoOHicNs0WUDntzPkT+FMAokviVjT9C7HoyZs
 VCaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d9DB9Z/l
Subject: [Buildroot] [PATCH v8 24/26] package/python-sqlalchemy: add cython
 for python-sqlalchemy
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for
python-sqlalchemy.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 400ad92f63..167c3a4498 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -12,5 +12,6 @@ PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
 PYTHON_SQLALCHEMY_CPE_ID_VENDOR = sqlalchemy
 PYTHON_SQLALCHEMY_CPE_ID_PRODUCT = sqlalchemy
+PYTHON_SQLALCHEMY_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
