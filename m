Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D084CC3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 07:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8598040CE9;
	Fri, 16 May 2025 07:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnaK30x1asju; Fri, 16 May 2025 07:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1D640C19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1D640C19;
	Fri, 16 May 2025 07:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68C901AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B04240C19
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIqCTqnfElts for <buildroot@buildroot.org>;
 Fri, 16 May 2025 07:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FB6240A06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB6240A06
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FB6240A06
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:56:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54e98f73850so1783290e87.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 00:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747382162; x=1747986962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFO0AEoNJBOBgK4uSI3KB+qdot9GpcDE3qFqHynphIU=;
 b=X8Q1ogLfAsEAf8SmQjnuzBbaOqPQsqtrdElZVxMDk2+D7pW/azXIJD78LGHO2ylQui
 m4izFKtvYq1NHj9yZeVe0x50Zlffu/id5Dhk6hGqaa6zIpZ1ebkfhiEGw2l1DYDtnciR
 xPnWBfLG98dPkLoDjJVhWdAvJ65TlZJ3+f3pogq/DP42z9zOLZMFAkab9KSQI+BCVkTw
 10heyvsii7DA2SXZz88qQ1xP1sDii/ZF1qH+0T4KAmkDgdBs7Jh13j6XdyfVnjfYpMCS
 H+MX770nuGcL7C55hp0pH6xuNxzXE+1GteNVdb3Hfc+Tz7HKvCpbGeaJqUgkE+WrLpYy
 NtYg==
X-Gm-Message-State: AOJu0YzDTov2CvenhaE1qUGJ/RKaU3l0Kst/2YNxAgTJQhB5myoXpKAU
 YGJ1p4ljRFsiYbmxIB9z9z+pYmQ0Fx8MTHDdERZ2nR4sQtyOy0il4k3voaoyAg==
X-Gm-Gg: ASbGncsDYAOfJZuMBPQUSK/7CHMLg628BYMzpWLXvMQjMxjn5hrZqTnoUHazXNVLTH1
 o7FklfVn+pK7oQ4mUwA40dJ1yO7BPeabniVKZnUxMgdP2UF+d7VrXsEJJ1bCwj9evytTYb3XFnJ
 cs9lcOIBDrHGw4BsZiJ9Iyu2QM+Th41hdQbZbeHEUIQTJZus9A6tEdavlkV3cijKqCeF/5QaCpw
 I54G5e+1Sc//VCIheYumg/2ND7Cj+JxaV1Hg+YJ9VrhO/2ns+XnmjrJykfKzrXttXdoopB7+rvR
 10KdFQq/9wpPlGjbxPi41fSvACcAFY7VdCsLskC41QdSITogrk2mdb7filg8cNeY5bX3uxF38Xv
 2/YHeYg==
X-Google-Smtp-Source: AGHT+IFqqn1i9cT7aflK0AJYLchP/B+HwVRuh3d2H1iyep3Iv2ZBneYVD48Y1tblA7azz2evkxQtSA==
X-Received: by 2002:a05:6512:6714:b0:54b:f10:fe46 with SMTP id
 2adb3069b0e04-550e71d02c0mr545452e87.25.1747382161765; 
 Fri, 16 May 2025 00:56:01 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f31497sm311448e87.82.2025.05.16.00.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:56:00 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 16 May 2025 09:55:51 +0200
Message-ID: <20250516075553.3942690-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516075553.3942690-1-roykollensvendsen@gmail.com>
References: <20250516075553.3942690-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747382162; x=1747986962; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFO0AEoNJBOBgK4uSI3KB+qdot9GpcDE3qFqHynphIU=;
 b=N3fp0obsBDYaMQPqv2Z4YXV2sOg5gVojLJJG3/HW04VvpV1yuwtbJTh/mQmrECG283
 zMqq9cum0teJVWg5N3TT2wJ3VnncJMKgKss/lR/u9HHFj93QvvCGyjNbvh16ZBxpFe7M
 8wH9/Ll1/94c5U4435wgZ6QNO+mQAtt/II0dFJKyjhtlRmA/C3nSb9r/j0ElIt3BJn2h
 2tkBtm/p3JJ84aDLdYXQ3fHQs1TQLPwrlOoV/bxEWQdpMeGwGi4bZTjLABXf+3mTvEfp
 S0tBdS6/gtUuuyXi7qsAAS0jiihlKuU89gqkPNybquSm57Ew9idzTcEssH8suChxLjiQ
 5tQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N3fp0obs
Subject: [Buildroot] [PATCH 2/2] package/dlib: update links in description
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/dlib/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dlib/Config.in b/package/dlib/Config.in
index 7862f8d074..4054ed8bae 100644
--- a/package/dlib/Config.in
+++ b/package/dlib/Config.in
@@ -8,7 +8,8 @@ config BR2_PACKAGE_DLIB
 	  algorithms and tools for creating complex software in C++ to
 	  solve real world problems.
 
-	  http://dlib.net
+	  https://dlib.net
+	  https://github.com/davisking/dlib
 
 comment "dlib needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
