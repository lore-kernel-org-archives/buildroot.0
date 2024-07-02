Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED29C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D03F82064;
	Tue,  2 Jul 2024 13:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfk4cTjq9ymk; Tue,  2 Jul 2024 13:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C7078206B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7078206B;
	Tue,  2 Jul 2024 13:37:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1998A1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0760B60BA8
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H2Pc6zQXATz for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E948160B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E948160B9F
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E948160B9F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:37:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b447c519eso1182761a12.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 06:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719927419; x=1720532219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RbHbI1zNnqYcLnXh1sEPUzA1ZrKBZdzCCVBQ3z3nkkY=;
 b=SCUHKYr7keX7yhOBnZimr2zrvHIdjmVAbdHVeE0yIdRmf0WrBir4WURHQ9WMdDv667
 k3Q1NN+zGdreWGHq/nUiCEBQy7fGHWi4sUwqURMz48V1rAABYc4fVMrFx627pr3stwTB
 s5bRqk9K5s+LjkrMkILt/GKCewvCC+kQSFhc1DPeg+V6HGJMjGUuAgUknQKHbkkCPmJ2
 5vMgqpQE8pVIrUNKDCNjymknXnX3/1JPl6Lemtwfot10pYtFjKXeAWi4gngfCGjLaZTY
 Op4xPqGILRbrYJfUmQa/rxA6QWBpcbCW4F0GZcozHkhs44eblTFW335URKuy4a46Fbq5
 KElA==
X-Gm-Message-State: AOJu0Yy1o7AxDI41pok3Pznft8eOq6mrKDpZb+ScmkulWH3gw8K3UK55
 9sD8CgFB12hV8GTbenQPEcx68BQx1K4jsh0f7xS9g7UWfsMEyICExKxC0uMVj+ivN5WGF8gg8A+
 aWZM=
X-Google-Smtp-Source: AGHT+IEs7tJwt3lQUqHGO64HAAi/bY4HxO0PETD/Ik74xDlPxcxmGpXmH6NK2NvetLDQxNs4ZXDOSQ==
X-Received: by 2002:a05:6402:13c1:b0:57d:4bd:7315 with SMTP id
 4fb4d7f45d1cf-5879f4a5f03mr5549439a12.20.1719927418620; 
 Tue, 02 Jul 2024 06:36:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614f3d51asm5682813a12.81.2024.07.02.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:36:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 15:36:54 +0200
Message-ID: <20240702133655.2425922-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719927419; x=1720532219;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RbHbI1zNnqYcLnXh1sEPUzA1ZrKBZdzCCVBQ3z3nkkY=;
 b=rLH8I9PKxBJMO2vJDcmmtAVmMjrcTO5QOMi38pFaG6Kg8KGgeO6X0FtHZNUF+oA6Rs
 J8IA0My2aqSaGDAGCoGLo19kulKNkAmroDFAuMkc5wF7t17P7SKnx7Hqzdvr/jLLzpxf
 rRF8vZ9jwZfRn3ZzTF9UqItCPrqcN2Mu7gEFw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rLH8I9PK
Subject: [Buildroot] [PATCH 1/2] package/libmad: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libmad fails to build with output:

    Applying mips-gcc4.4.diff using series:
    patching file fixed.h
    Hunk #1 FAILED at 297.
    1 out of 1 hunk FAILED -- saving rejects to file fixed.h.rej

The package applied the patches in two steps, first the local ones and
then the official ones downloaded from the repository. The commit fixes
the issue by reversing the order of patch application steps.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libmad/libmad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 084a533cc00c..9f3396b1a4e8 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -19,7 +19,7 @@ define LIBMAD_APPLY_DEBIAN_PATCHES
 	fi
 endef
 
-LIBMAD_POST_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
+LIBMAD_PRE_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
 
 # debian/patches/md_size.diff
 LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
