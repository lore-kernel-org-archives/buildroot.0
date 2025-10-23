Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C55CCF9E0
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 14:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9FE84756;
	Thu, 23 Oct 2025 14:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6wgyNQj4dpX; Thu, 23 Oct 2025 14:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B3B844F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B3B844F4;
	Thu, 23 Oct 2025 14:05:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA591DE
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6066178D
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d16QqEsX5j6D for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3B69616FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B69616FF
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3B69616FF
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b4f323cf89bso197908466b.2
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 07:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228341; x=1761833141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDGQczMdnN7GDPYZJ6WwNoyChfpySTIG2WRysNIKveo=;
 b=usA9VBzCrz69lZYTwr5Osq2DgwjI3X7Gcd5i4EvIPRcuqr7VbwSMRy9IKZGArKKO3T
 yMeRhUB2Ff5/o7HWXCQaSUmC0bGMg+8UvlTnJQGcVzHHpPZGC0VAuvb+cq5V+OlzXERN
 wnkfbQg7rMRKFFycL2yW6LtEeoONVbrEd4kA/XfGM8Q+YU9MG2UbKdyMfLhYOXSqeEQh
 pFPDiLvPc0GyCqDRVcQbsSX8/zJbxhqzbalswVQid2VNmi+aiO7A/INmfsSC/SFrMCAX
 SBa41j4mQi3XYeE1Lz8GFSx+jupTQFZLc52mQud3ndA0Y3+VYLB1HtQ6hWHNZ2qgt/0G
 dV/w==
X-Gm-Message-State: AOJu0Yw9eGio6syEZmE4rqixOyiwFP19nWOewuAfzt2IkomttkxBJa9e
 DZiORJ+DsMBcO8q1JiguPj3EJHTAyF7qxjRE3czMbOtkmRBGCF2Vd4euOeIVfE6c5JwV1R3t7uA
 qa6+Kg40=
X-Gm-Gg: ASbGncvDrNX/kxldjNNrLT4WwZwGod1d4DLkjbIUNHduC1o7BSa47bTObD10HtL7F0L
 fScwyZ4BsOMiq767uYiyziiGQ3dyEpgPonHKBCrEjk8kSWkQfuQgBU7gkarsQYgFaMZMcJ4FwP4
 wqImvCIM76o6Ad/Ynaw7zicdEGdZRz3CRee2R65mdJbOrJCW5B6s5bWvftktYhGZiqpWFyeE3tP
 2cOVmXcsdPkeaME3nXJsclRm9aPv5dGIAs80wuDspKof85bCRwpETraVrPSpgiSlg6SRpwwA84S
 Xwmv84m1WGb59RK30GPCdTJL9WjWxUz9pAuJZug8Ob0BFpxO+D4nYD7cCZmkRNX8WmM/IDHj/42
 hm0SSdaIZvtoOLHM7y0Y2bNty7e53PNT64e5NWr3ghj8LpWt8VKFMasW/t3oKmV8UzMKjH16Mt8
 YBlJmTWwkjmKrOlg==
X-Google-Smtp-Source: AGHT+IHtcxj+2+9C/Hotjka2/RV4UtandlI88YNnkDIICMHOjZheX00eX/6wnmBZDaIUCDi7YvETQA==
X-Received: by 2002:a17:906:fe4c:b0:b55:c30d:c9fc with SMTP id
 a640c23a62f3a-b6472b628a4mr2716291466b.11.1761228338927; 
 Thu, 23 Oct 2025 07:05:38 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51317e97sm222834966b.35.2025.10.23.07.05.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 07:05:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 16:05:25 +0200
Message-ID: <20251023140527.544948-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-1-titouan.christophe@mind.be>
References: <20251023140527.544948-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761228341; x=1761833141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JDGQczMdnN7GDPYZJ6WwNoyChfpySTIG2WRysNIKveo=;
 b=H2oszGf7QB4SZoLqcg5wIWpGmTQlcTRWDQMJ3dZzIXMGI0UP9etOYSm1+XCLwVtNds
 CTkSeHNnWYBN9b0edJbegmGZAZVgu3VovVEJ+Zpu9dEeqED4PRQ6OqzOfiPsiOfjU1A4
 JavXfmrlv66qsFrFy/BUBTJ2V3kpAKVGT1UxzSBDCKZN6cR4osdiQqODHN6iXrXfRvBz
 NIDHc2m/23Lim0WcJNgBeTmZO9bJ/fu3or8CruXLRS6z9dqXyHRjzQ0uPg2U9RPNSs9g
 35sCIje0w3iWQsD4SIQCz3A/qBM5KEm9DwcO/mE+vGnddxY2kUhkcoIg0d8Y5CSeVaOz
 tk7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H2oszGf7
Subject: [Buildroot] [PATCH 2/4] package/libssh: ignore CVE-2025-5318
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libssh/libssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 3c7e77a206..2be9013454 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,6 +17,10 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
+# NVD database is missing an upper version specifier.
+# This vulnerability only affects libssh<0.11.2
+LIBSSH_IGNORE_CVES = CVE-2025-5318
+
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
