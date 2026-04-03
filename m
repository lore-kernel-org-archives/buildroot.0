Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2D1E7E349
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 08:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215DA60874;
	Fri,  3 Apr 2026 08:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqSTA71AdQk0; Fri,  3 Apr 2026 08:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB39607DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775206334;
	bh=fKflLMEr/P8C/d/lSCNgJPQePCE4eOIVNTqFKLRquFU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rMNe9ERLOly1IksYhSgxt0MzohbEeBryhagEtuL/cWeojZmSJOx2aMlJozfOAhTf4
	 3ZCg7BZr0e36O3l1sLdq7/B1Fwxslc75Ddo1z184+R3uo9OBfsVZBrsJhSGrtXfjl0
	 +PXstOIr59XtyguJOUBCc6lQuxAPgtLLJ8Zp4lRhqfgU8y+OCBKwMdP+DrFv9x+6CK
	 ukw8RcLdvaXgIS7oY1qDOKwisdRD3DkXSTTbJWqRxXmDvVCDmclqONAWUsXEnX7zgV
	 qjCnjnuLjSpayUfui/4qfBc6TnzQ7QIkbyyDNeeNEWuX9W1mOVaohd5L/PyVAcMks2
	 oalXrlCZYhsqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB39607DC;
	Fri,  3 Apr 2026 08:52:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE71E2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C76D740055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ6xBxK4p6jM for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 08:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EDD140028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EDD140028
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EDD140028
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 08:52:11 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-35d971fbcddso994906a91.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 01:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775206331; x=1775811131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixYi1m7SEE99uh9ViaAXHDaHjyeTDRB8Hkh+pBkPPGg=;
 b=qfCUulqPBD8BXMXWrpasvEo+t6b2ijDu4qoWQxzMXSff2zBn/MKrlnnAn7+BYGXuJQ
 aj5JOhyaD2NSHftd4JzOGyO2vlRgqfxB4AUb1HTPomuRgVb4CJXD5D+uDvsRS9d/V6Rm
 R1Fax4L1RSQSd0k/qwkrdcGUZLrQHU/KOgbIWpkrgwOxtGOPh81bvpZ81LPqR1gKCv7O
 nlqgfCSew4YEyX5JWj/Xl4hDOq8wPsAhozNRdgTQErc4ZoEGTqJ30vsueQduy5YHdDPH
 2+4X2Hpv1kV3VgK3L82du8g/m19KCGoBpwoS1dJ0aODMdr8pydVLyFcDAityXOAA4IP4
 IbpQ==
X-Gm-Message-State: AOJu0YyJeOSL2saqUAel+bTgmK3kSxyMdBanZGh8EDj4hqiO6Cr2LjO5
 6h+CgEd2YUNjGVkzxtCvBHgESlZNpQa56VPs2yHnwXUlKdBwYw6QiMYt2dLyIw==
X-Gm-Gg: AeBDieuUdmS8M0NzRAJQVkOPt9fLeFA1mqdsN9w2qytItC2JRg/6YxXbJNDVYgE1Lsp
 0+5GePKIjZ/hb9nG3w0bvpvfIR8rkwxAvyfSZd5jQoywoGxpM3czYqT8YFB0W7dsfqPXwCQn6pw
 z8Wr1MIcJNrkp5zEyXBoezdJA4sRzxwtcLojxb87qTCRBP708UxbR2mvdgIOAje+qvvRUrblgSU
 LWozRJL3oHi+b9mqDl0YtpiUX8eX1YY0xeUJaFMnSfNw2cIeQTAV2P7/1sYPd4oUJfE0K/fW1d4
 8L2QYk53bEPjnW6mS3RdcbGfyHVsL59oQzGg8SBIHRRXRHoB2ceO5anvol1GAsJUvSw/88+nuej
 7Cu7NwK8x/+ZDX6g7fJiXiNP7UedYFo0s3CJPaqoJqCJ6I0xdOx6P09pRk2qZ8jc+xdB1bFsqS3
 WKPPq6bwge9XY2IY9NThkKWDjd6YUwIBwnZJU=
X-Received: by 2002:a17:90b:1e49:b0:35d:9d5d:10bb with SMTP id
 98e67ed59e1d1-35de57b10a3mr1757758a91.0.1775206330551; 
 Fri, 03 Apr 2026 01:52:10 -0700 (PDT)
Received: from fedora ([2409:4064:2d9c:554:d9db:ca4d:ea7f:ffa9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35de51a87f4sm757206a91.2.2026.04.03.01.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 01:52:10 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Apr 2026 14:21:51 +0530
Message-ID: <20260403085152.511498-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775206331; x=1775811131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ixYi1m7SEE99uh9ViaAXHDaHjyeTDRB8Hkh+pBkPPGg=;
 b=ov/mWASBVqiYQjL0BUlF4JPwdf0UCiPfnsy12vH9sfzMtbTUnSRNUt8gOZOUpjnSIy
 igBmz8jpaCApOm4z665hdY5unRolihfHApnXR+CkfmebeNYYDUJFJijYc1wmASEsjjLQ
 U9eGhMHR+6UTrnUKiOQNKRWaZjDj1EhCEO/r5L1nG7W2OIh9ON+WjFZC9ECNPxExvQAW
 WdcyFyxO3Xa81Bzek0HS9xJud3NgK6Sm6/Jl25hhO+vfblnqkmF+X6Gv2whCZpfF1F9I
 9m4UEEAvrYBhEXUIrHqqNpnZIAoDDFLCsqAxPKWNa4rpzxk+7h1QmKJpaIvMhoIcs4bm
 qnjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ov/mWASB
Subject: [Buildroot] [PATCH] package/python3: fix build in static-only
 configurations
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
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_STATIC_LIBS=y is enabled, python3 does not produce shared
libraries (.so files). The target installation hook
PYTHON3_ENSURE_LIBPYTHON_STRIPPED fails because it tries to chmod
non-existent .so files.

Wrap the chmod command in a conditional check to ensure it only runs if
the shared libraries are actually present.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/python3/python3.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 07cba7c02d..2514dea5b0 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -229,7 +229,9 @@ PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
 # Make sure libpython gets stripped out on target
 #
 define PYTHON3_ENSURE_LIBPYTHON_STRIPPED
-	chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so
+	if [ -e $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so ]; then \
+		chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so; \
+	fi
 endef
 
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_ENSURE_LIBPYTHON_STRIPPED
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
