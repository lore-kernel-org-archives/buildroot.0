Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0CC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 10:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AC780E06;
	Tue, 11 Mar 2025 10:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwU6vlXmsJb1; Tue, 11 Mar 2025 10:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A3880E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A3880E4F;
	Tue, 11 Mar 2025 10:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A72A21C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95AB540CB4
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS_dEHyutlsl for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 10:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=daniel@0x0f.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE3CC40C7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE3CC40C7A
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE3CC40C7A
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:13:07 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-223594b3c6dso93201555ad.2
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 03:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741687987; x=1742292787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aygiqg8AGCRb+YLr4IzlKTtKc52FYTWCfwRJbb7SPKo=;
 b=JkTjx+G+O12OB+wInXbWGRbcmJ6TDV/hSaPLXmG6ZqcmnjyB7UrjgsPCCNFjWseAqC
 KY+BsPehUQvvedab3O2rg555uIrOkryukXBe9qUrsUP3TdsnQ1OMtkmf59t+rodKh3lw
 YPWpWZrNCSGRWuay58Or6mOOv4btkatjgFxsH4qIcFGu0V/AGE3m8T/GxyPcA2fnJK3K
 BfSbO55zPmW8hyUkKSPTNtXFk/PjSv9GtqKxZXJrIJmoMYTdAdiDVfWz2fk1KxnTCaqC
 EclpNXgs4CzvEew000KTzUPmPQG1e7JLVH+0+m/dke0tmOHFQG23Gm9y5tb8Rt4zc9xh
 p46Q==
X-Gm-Message-State: AOJu0YxGF1cpea0ys0oHURF5Y61amYZy5cyXFVEebd5S93lngbQR+hHn
 oI4cF9VqoAnKoDodFS0E0YME4PRRcZa4kIDoKYYikCxwV/t26RpLFa1i6Nh0eumkg2eQ9b5Cu4O
 2ITQ=
X-Gm-Gg: ASbGncuzSONfb911hdlWnYeBnD9ktyhtXXunbnOK3wrvv2Fj2mXmEmYDkCAx8KnKrlf
 IXquAOB9NZHVffKxhL/PyaFqo1cLJFhdw2MfKdvZLYCAbzNuGyYZiJY8foG3GiMzCX0Ze3JAs6o
 L1TXwNtE5wCH48gK2fn4hpY06xLcqF/R7mFkUwsH9/IpRKo4y5qk3hF+Fqo7cEIiylqOS7KP3uO
 1eBEvC05fic+C39fEweAB5jR62U/Fd02epXIa8p/MUB2Se6O1E9S7nKnkh/PJ9AVbU8z2AhIxfL
 i6YQBD6L761NeDy4XxbRoQGABjtiFBu/Az2OKlEoCmsRPU6v99YgsY8=
X-Google-Smtp-Source: AGHT+IEvhv8QOF12s03D1yhggcPrSSHVKgWizusyNPhLA9OLZDQgNElIcU8pWuXPXCXw2FHfytfgGg==
X-Received: by 2002:a17:903:2282:b0:224:2717:7992 with SMTP id
 d9443c01a7336-22428be5a5amr216210285ad.33.1741687986897; 
 Tue, 11 Mar 2025 03:13:06 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:cd1:9323:d48c:3544])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-22410a7f954sm93823985ad.143.2025.03.11.03.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 03:13:06 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: buildroot@buildroot.org
Cc: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 11 Mar 2025 19:13:01 +0900
Message-ID: <20250311101301.3583028-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1741687987; x=1742292787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aygiqg8AGCRb+YLr4IzlKTtKc52FYTWCfwRJbb7SPKo=;
 b=nhhZ75gHSC8hOmaD+GZag4ZCh/6on/JS6ciIP7chUf9nBn3qMhphRTz0/PrfEGzDkC
 ze9VX/jiYmjDFG5mwbSW3GCsSiYm28ToSa/2K2oRqxtNLbomOGrc5Hqfi8EvcnZNTc7l
 jhiDTmDzH50L05ETsfGWuhb59BUCZ9C4b0nKw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0x0f.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256
 header.s=google header.b=nhhZ75gH
Subject: [Buildroot] [PATCH] package/prboom: Fix big endian fix up
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

The hack to force big endian support when building
for a big endian machine doesn't work as there is
some whitespace between "#" and "undef" in config.h.

Add a wildcard between those two so that the target
line matches and the replacement is done.

Allows me to play DOOM on my LC475.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 package/prboom/prboom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index c1ba05ff7035..fc440e5cf8d3 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -40,7 +40,7 @@ PRBOOM_CONF_OPTS = \
 
 # endianness detection isn't used when cross compiling
 define PRBOOM_BIG_ENDIAN_FIXUP
-	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
+	$(SED) 's,.*#.*undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
 		$(PRBOOM_DIR)/config.h
 endef
 
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
