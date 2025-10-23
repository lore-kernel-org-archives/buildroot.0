Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547BDCCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 14:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F0540FE4;
	Thu, 23 Oct 2025 14:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0fcjXAQK7F8; Thu, 23 Oct 2025 14:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3753841133
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3753841133;
	Thu, 23 Oct 2025 14:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1879BDE
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3B4F407E0
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bwpN4BeHmBB for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE6084030A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6084030A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE6084030A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:42 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b6d5b756284so103524566b.1
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 07:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228341; x=1761833141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1xseQCWJmrVxaka3pOH8cMBIqPvrRulXrayyoq/zgY=;
 b=mi1iy0AS5CqCLZKqUHPy7e90KtDM1UnsCSu/Nb6jY7PTR6UKr+sTvdxMSXlJJJVjq3
 GrMjIzuwcmljB+icCLM+nfo1I5zSQLzFw9Yg4xgr5xBaM/+w4dkcy43wiealJ4Sj/kxX
 SLZvYZcubs1KXza5AiUfpYLNhey3k5trKjrjU7yjpY2IG6kZPkU6HwlVkvbMvAit+2sR
 5GVQSjEZWDxKwhU+po5lfr1WJiWaBRh4OGPINrgaGmSKdlWd3q2nqDU6WYlV5l3eQzqD
 mnLOYXMfF0Gf4Oif999hJqvD1Py15GbBUa9KQLlhCD5i48P7yolE+n6IjicAj1b9njMD
 nHvA==
X-Gm-Message-State: AOJu0YwBCLkjeNQpc2zXwxjcTAplFbHoNaYBU8tMiTWHsduHQo7CPSuO
 EQsCKYkigMMu9kzXgbADzvP/jPLvoLcb7Rdvfd8jhMa24A4FHajnLf2f2b+NzsIURlBejhdDyHW
 X9OMYwLY=
X-Gm-Gg: ASbGncu8jaLYckfF2d/0y9yeM7C5IHL6hC6YLqwPvMtA4yj37rA+aHsUIhG/CF8Gb68
 zd0feGDbF/GyUxqGu0I2a/aKWVu1lG384GSl1HmGrT4CZz4P3+wrTRvNENuDnQJYjdnmkLe7BIA
 6kSNmfdPcAQHkjQ9xz5NLG48B4oGwV9Kkg0SI00F3Wl9fBZr8gC61aocXOTACY4lpSSYoApx6jJ
 LWFuaCEImNMhcg+p+t0c5BE9tf8whrXqF7HDmnJsIoy1rHNKM7DnKJn+qhBmqtyMBNwefrYB+It
 30AKdAGiFv6M0Shsk+M6Boq2lUKoWEuYUDYgWgP17X6lJWhpWaa+4zuoZuB43qdKgxMMoMmwFz7
 bDrH1lDx1JyTpIyJ3UQyICcQYfZslSBmwfYwW0ZntAKzFg+meXFpRA2MWzmY3WrttEkRxzx2/iv
 jLJ5FO7Gy4ABK0+A==
X-Google-Smtp-Source: AGHT+IGIlyzAozHLnqmoo7T9hwNEBU5UotOZHO1LDA2xIAgnYhW2mXnI92/yWQu9dzqndTuhnLXvzQ==
X-Received: by 2002:a17:907:6d0f:b0:b0c:b51b:81f6 with SMTP id
 a640c23a62f3a-b647423c403mr3067064866b.43.1761228340626; 
 Thu, 23 Oct 2025 07:05:40 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51317e97sm222834966b.35.2025.10.23.07.05.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 07:05:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 16:05:27 +0200
Message-ID: <20251023140527.544948-5-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-1-titouan.christophe@mind.be>
References: <20251023140527.544948-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761228341; x=1761833141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J1xseQCWJmrVxaka3pOH8cMBIqPvrRulXrayyoq/zgY=;
 b=cCxYuNYdOovXspMOHPflOS3NbEDbRxdj/aQ0m6gqVZ43g0rfDjOSJXzvQ8GxKBzsKB
 r/+1dY63oQT9JfhndjF2Q8PDDa1lBuYVAbsQ3vw53h9u145lNx1GEgq4u97KAwV//AuC
 oQwwkPZlfnZEVnOkOEC2j2lWNa1rI6wTcwasQsZxE0or3PvqYVVQQcHyv/D/7N5JN+5V
 D935rv8MUnpdykHHZ6WP4WgkDbRuB4mhl8rcQqWQpVsTdhtl4WzcWXosYvCLE53u77Qf
 KcLJ0Et15zKniXBkzK/UJ7tXp1cG3sKIpq2YzeaeoQaypA4W4rzOImCbo8UpClU7FE4J
 k2hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cCxYuNYd
Subject: [Buildroot] [PATCH 4/4] package/tpm2-tss: ignore CVE-2023-22745
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
 package/tpm2-tss/tpm2-tss.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index e1f65c384d..81a1a0e59b 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -16,6 +16,10 @@ TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
 
+# Fixed in upstream commit
+# https://github.com/tpm2-software/tpm2-tss/commit/7ab42953216adec046d000a5e3085f3ee5e9cabf
+TPM2_TSS_IGNORE_CVES += CVE-2023-22745
+
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users and tmpfiles, which we do not care
 # about at build time. groupadd, useradd, and setfacl are used in the
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
