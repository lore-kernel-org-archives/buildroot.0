Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1FAC369A6
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 02:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2634380CA0;
	Fri, 11 Apr 2025 02:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-c_aMait6gj; Fri, 11 Apr 2025 02:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E931F82CD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E931F82CD3;
	Fri, 11 Apr 2025 02:35:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 208B3193
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05EA182768
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPG_EkkqRnfc for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 02:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1ACD80B2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1ACD80B2B
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1ACD80B2B
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:32 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-30384072398so1357335a91.0
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744338932; x=1744943732;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8eLUr58aGaW1nWs+nDOnxmnieYuGNln2Ce2UMoziE0=;
 b=sO30I39rM9m4mIfAi3HaILyMbYFVbwGRv9pFEale/Vl9UCNSOKX9PBGu0dyruCOPz+
 jHhpcEfmQjAUd2ijZipruJRfiImUcNCSgPvQjz/EP3lGgnWkgWbgyfLk+PKbV3ty05tA
 G5jy82gFIRLBsOspcHizUY/SgNxlRo1GtpHb348kS3vvetswX3O7CobYm++QCRRiYNMp
 4ILVSKgeN5VpiHXAsoNwHbaVsz3ZCwt+9rBmRt03c72ZbwV/O1f+oTx197JqRLcoA9yE
 DdBD05jC+IX+Xa1+9SerK9OVNKXjv1I5TV6IXMH5tTEHcy0do9TsXwyGoFZ9WFVN+lFh
 UDpw==
X-Gm-Message-State: AOJu0YxiCGBm99oPbKfLl2aFjw1qoIkRFmlFxpCHrwtI0bqE1mg5jnLG
 25mYl/mpdFOVJeX+lZp7UcfFb+89HAzVjgueqhz+kBTmNMjuatHvZHCpkAX/aF4w4VkOhEY7biI
 k
X-Gm-Gg: ASbGncsw5c7C8NAdhyZJR+Qx+TJ+NnwR22/bu397k0o6djv74BUC1+VX3A4uqr9YrVg
 7gXtqbxdOIVJKOeTQiA7SNaGYsFJOCWorwWdjrFYuEOKdWiJ3PKdNanRO7kGCbuoqMFuWyoLc7/
 UQAtPE99JsmtQi4e7Fvgv/3aEV2MHIsFZX2Zs10Ezp6cmNxYRVqtKbGT/1tfpReGK/u2830NOAN
 RS8vjBrEm6jWmWVInA7dfKJQKn34J6+hararwtjC5W19xDd5SI9cTB738wXzST9ggXaiGNT8E/F
 c1adzy2rTl+HQqIJH3LPOP9qM/QfbFpsPn1sB4qvh/QcdzFZdDNiw6r/
X-Google-Smtp-Source: AGHT+IFidU3HEfp4pfM4BKPh4YeAleFyOvGaJQZWcy86RicVUZpZJFJ2cIG6U4dxaV/N570wezIV2Q==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:90a1:5d42 with SMTP id
 98e67ed59e1d1-308235fc4demr2372129a91.0.1744338932019; 
 Thu, 10 Apr 2025 19:35:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308218fecf2sm900117a91.7.2025.04.10.19.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 19:35:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 10 Apr 2025 19:35:17 -0700
Message-Id: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOV/+GcC/x3MTQqAIBBA4avIrBNU+qGuEhFlo80ilREiCO+et
 PwW772QkQkzTOIFxpsyxVChGwH23IJHSUc1GGU61Wol6Uocb1wvZI+rjcGRl7ofDqNHs7uxhZo
 mRkfPv52XUj4O0XjSZgAAAA==
X-Change-ID: 20250410-improve_merge_config-167d2192bf94
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=x8qQMN1msVYHSwWMSdCFd+rNfRGCp07aRn0nMB2XtHA=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qP+ud73hcHzL3qzavKmb458qMKiyDzycl8dsuW3QzZm
 SQinbW6o5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIkckWL4n2vW1c37/PHqn86X
 H2wL+LtD6veG+A2uj91Cd6dPEffNSWRk+KiuYGzKcbPnuve/TouaEO96sXWiL/weHMidrDlX7ac
 2IwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744338932; x=1744943732;
 darn=buildroot.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n8eLUr58aGaW1nWs+nDOnxmnieYuGNln2Ce2UMoziE0=;
 b=lKmms7B1NalU7zxDQ9iW7dnVCdNOR1+umeMubB2jw0Nkk8NammV+5T/N9Z12i8DTI1
 rG9A6CO7HYqm8SQ6BQ0AmjwXuQz8lPBaeekKZttLvTwg33ZXsnqPuqpEvRWxmXN+FwX4
 brSZFWGvWKaZxc/YgcwfB2abvQL7eMm0UJ6ETvWg3XX+SoMt1CvEjE1Ha7xi5nrpHewc
 qwmcG8ZOfd78fKkoKyA4SjY6YN2NJQ1Q+t0KJtFac9DbiC25HZRhKYDun385Sh/n/wb6
 DLYvQWOYjhoVhUqI4iN0bOCgeH4TQDTfjc0PmNxhu1Tehg/z8sbJBB1iRJ5oM8T6xoig
 Er8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lKmms7B1
Subject: [Buildroot] [PATCH 0/3] support/kconfig: various merge_config.sh
 improvements
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

I am using merge_config.sh along with config fragments in some automated
build testing. There are three features here in three patches to aid in
this.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (3):
      support/kconfig: Support running merge_config.sh from a different directory
      support/kconfig: Allow appending to config
      support/kconfig: Add option to fail merge_config.sh on invalid configs

 support/kconfig/merge_config.sh | 50 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)
---
base-commit: c497e5fcc7b5d6b0877ba0dc557c604dcd194260
change-id: 20250410-improve_merge_config-167d2192bf94
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
