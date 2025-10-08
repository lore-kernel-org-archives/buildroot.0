Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D1DCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 19:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFB48188A;
	Wed,  8 Oct 2025 19:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2vgoLN47Fu7; Wed,  8 Oct 2025 19:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A665081854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A665081854;
	Wed,  8 Oct 2025 19:15:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85917226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B38B40C4C
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOMVQq1fwebc for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 19:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C3F340C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3F340C12
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C3F340C12
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:15:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so295594a12.3
 for <buildroot@buildroot.org>; Wed, 08 Oct 2025 12:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759950950; x=1760555750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c+CuilhBheTREwnGqofE1bPrsEx53jrvQR9TfwC15ns=;
 b=mdfGHfYMvN5KhSyOG7lHlOoxXy4Gn7fo4WgleRNlJzdjEJqyqQEsfTdMqVUv7ZvkML
 S5NUeyi1Pac80ovF6kTuG9iNDV/Xi5duQ3rLlV2BNyuQgUTcCYTHlKjhlSUWHSQGM6ve
 yiOzd7KuHk0SjN120EDOCEdfNVPSIB2eXyGQj2MHOCd+9eY0dbiCQ+hjtzyXE+2nLxto
 MeWmChSd1lWG3eY5insr8I/rYlu2gmEh9G9x145CWZT1iNFYYrm/9DEZKraNhmMz+v1V
 hFEdnfnDKAONAcY3T8VxlER+7eEj0tXAD53I2JBq4v7FTMDBJRqqzcpgAB46ifxzhbR4
 +ZFQ==
X-Gm-Message-State: AOJu0Yx6w2mDO/oLqJ91MBBrKmeMFXcQlWPiNMtrODjJq+UopIfxvfV0
 X/sObcihAMRa5O9fDQFRsboJcMNibpLQDEI/6xO2ACF2Q4+4TR2HeTkSQDdxy3ZZzM0Y8KVU4rn
 onvM5xqE=
X-Gm-Gg: ASbGncvAue8lsoHiG0szWW7wlrzGpnFygKp8XNbntC8goVgFvRNX7irnD6EMJwrnN+q
 tBrY3MdqsclELdZfZRBe/MNeF6uiGld3Wfddncs4b1FnuFPS8aV94BZ6L+W3+b4kX6baFY5Zmwu
 wsEgItXJMokJmTXWPWT6AnBbr5ePZOy4e6Ke9ZbrmsKCQukg7FiQ3RzHMqN7UUi+YH7BMbUWVxH
 Pu+Mmn5HS5Rq+6NXvMMvFjHb1A/lirdu2E1SY+pBk4k/aHZYoNlN+itYDzddkOKI05Joo3DjLHE
 g6RwYFdOX7ih6rnKBo3+EfWG0DFvzqyRKEq3L0t0bvVLaNDrBbK5G4hNSdkMbJ4u1rcM+dJRboN
 lYVnpAZ2KfIR5v2eG7HztaLYcj0ucG+Ya0KMP2J3AFEo801Gjyj4Qcuu6JIgD7nM8gA+bgMtZuB
 eeG3gs6IRXj28TCJiFvJEBQMjNoISGfh0LcaewmCM8izvv0RlIsSM27tyG7dcz4gzSJcaGx8iyo
 QNkOzp/A8h/oAo=
X-Google-Smtp-Source: AGHT+IGIUmzH9PNDHVqbfqP6y7w68kDOkiorOBIbaZ24LqSocVAVpULSwGwex2YXo9TvsBFHfDv43g==
X-Received: by 2002:a17:907:7e82:b0:b41:c892:2c6e with SMTP id
 a640c23a62f3a-b50ac7e6c8emr525606066b.43.1759950950281; 
 Wed, 08 Oct 2025 12:15:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970a684sm1697387366b.52.2025.10.08.12.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 12:15:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 21:15:47 +0200
Message-ID: <20251008191547.2160689-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759950950; x=1760555750;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c+CuilhBheTREwnGqofE1bPrsEx53jrvQR9TfwC15ns=;
 b=LdYWqhw32Ee4B3yY2RfJekdGMxi6qnhD/fK2U6l0rSm92sZFD2R2TG45hCn+dy7UM1
 fJFaVJPS/bl5r0vT+9EJF08uHtCarTII31uyz1ysqBpAlhsAwnUAz/w2MQlc5zXe8Rp9
 yC6Rad5ND9Tu61yIY4uv/aBBTelIRZ6HdVzuQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LdYWqhw3
Subject: [Buildroot] [PATCH 1/1] package/fscryptctl: bump to version 1.2.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/google/fscryptctl/blob/master/NEWS.md#version-110
https://github.com/google/fscryptctl/blob/master/NEWS.md#version-120

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/fscryptctl/fscryptctl.hash | 2 +-
 package/fscryptctl/fscryptctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
index 0dcca6893edf..fb6cc27326f8 100644
--- a/package/fscryptctl/fscryptctl.hash
+++ b/package/fscryptctl/fscryptctl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl-1.0.0.tar.gz
+sha256  192e25733006b05592fd87038a3a51a014db22f462ce0b24d47c30e66d03ea2c  fscryptctl-1.2.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index 0546f67a1f27..d235bf45401f 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSCRYPTCTL_VERSION = 1.0.0
+FSCRYPTCTL_VERSION = 1.2.0
 FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
 FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
