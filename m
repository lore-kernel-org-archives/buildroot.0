Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84A0C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9792A608A3;
	Wed,  7 Aug 2024 14:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dirHGW1No2wC; Wed,  7 Aug 2024 14:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D3A608AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D3A608AE;
	Wed,  7 Aug 2024 14:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B40D1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4330040273
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMD-nv88Inbl for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B66140184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B66140184
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B66140184
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso12878465e9.0
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041273; x=1723646073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPFSOnOV4pY0yeNzI2eWDCPciWSak5TVYCuWNBKlKrM=;
 b=jpU3+eocjVM6ph4ovpqgjfiXo/S4HW9T1N9m5t12nL2LNdqnkH/cixJmGri5K1V6KP
 ABbXwZYr84FJt6gSJ7Z6bq4sAvN8dW6YPdksxy7rdfmeAr/ctXK0Dltrr49V21hz657d
 j9UelnQk3Ojq9zmhvtUk7idb6gcYdbXJ5IoEyV/2HyW+0KlI6MLibfYtY/aR0mRRph/x
 TvnguI03rVirokgg25TFGADZOCSzXBfTTBFYoW9uFgI2X32itZG72q67h3XOlla31I80
 XnT6AvwH3NB9qLPcYN29eSzOxK58EaeaQDhz39TDnbjLFhbdQEf+ww5wkUGvK2POEZmS
 4+6g==
X-Gm-Message-State: AOJu0YzBI7I8sm9mY5mC/R3qv/niXxrdJlBLRCqVuOTrQxh37LviQeNj
 8FcQwzkOHyCBFDly2K0R5D+w4tW+LyQSf6lzMeXlaTQ2Tcl+Zfm4tnF0Dg==
X-Google-Smtp-Source: AGHT+IFXmlZJOp0YpZR6mSIR/v/jUnkWIBo2BjHUUd2XFGNzzy29UBTtzMqjg4PJIIz2ITRpwUTfKw==
X-Received: by 2002:a05:600c:3b92:b0:426:5d0d:a2c9 with SMTP id
 5b1f17b1804b1-428e6b076f2mr129274645e9.10.1723041272902; 
 Wed, 07 Aug 2024 07:34:32 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:32 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:06 +0200
Message-Id: <20240807143318.439619-7-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041273; x=1723646073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPFSOnOV4pY0yeNzI2eWDCPciWSak5TVYCuWNBKlKrM=;
 b=W0z2q+ICFibBJDMRODtknpgWUUneCkoLgz5QgLJP+cGU2jHSM12vC/jrFZ7sgku60X
 mrSB6CMuMeA/m+dOiosq005rGc84zDp3CbaP5Zz9Np8jRkhw0v9TMq+kEOEFiR6qB+fW
 wyGkuWxvcXMJAksLoeFAWn2pnqhQ3vKyGXMKsIPSBdMdw4lXf76uFTeLgqtxQXJSlhSp
 IwgUjfg+yjsDDXy1zYobkigmQEpY/BffnteOqd9/vJqP0GZwXBdcmP3h0+MI9UqXdpav
 6N8MItd255dxheNeqpoi/O/tqmDTiQv1roqxt+KPWz33Siom20zTAF4jhM4FglTxzZC0
 8RjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W0z2q+IC
Subject: [Buildroot] [PATCH 06/18] package/erlang-p1-tls: bump version to
 1.1.21
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The license hash has changed because of a year update at the beginning
of the file.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 9a14a44293..b88844b3c1 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c38768998e8ee0aa2bf5831bc25deeb4ea2e08bd52e26b2abfd654504fbe4f9  erlang-p1-tls-1.1.16.tar.gz
-sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
+sha256  08235a436f2222d6caf6b17e4e1471c65bf677dd2f5659d9174160dad4f51b7a  erlang-p1-tls-1.1.21.tar.gz
+sha256  823a9f2a803502343d969639e581c206d415cef3089ddcbc4f7cc02de201b8da  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index c16a124068..3fa849d133 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.16
+ERLANG_P1_TLS_VERSION = 1.1.21
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
