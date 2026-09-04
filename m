Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD73C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F4B60BF3;
	Fri,  4 Sep 2026 12:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TShTJdEFVkfG; Fri,  4 Sep 2026 12:18:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 30A7F60D6E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524318;
	b=IKyyF81PMYIoBPeDLKse+9Wd2vvM+63DR2bmUikieXEOnXHnjP/T7wCcjmnUJWX1vgdN
	 hk2vHU/WRirHP+WedqRSAB0K5VjXkCJS+OjOCMb/oYTGFbml4d7sKLCuSJGRCM+iSUreM
	 FnlrZigno9+lpSxu2joA5Hk1lWXjx1H+sgokZj+zdfLJrS4QjBipE5n9WsfTpkJyQ2W2E
	 EbNCV+0PvV8nmO5ll2lkadlv0n14873NOn6PVwz3Rf2jIxTN8QcMlehZfg5LW0nmKujpW
	 /DxUpaqGQe7/CgLk7mdbEITK6h4QuC/HUnEoKi27mW1Wbo7EwOpyfKfYzMh8fP7ZzsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bZLT2AHGzh0I6N+qVO33GmSUaI6poVEUe3TalMrm/tk=;
	b=W4gUy2BtuOcQw8++X6MAm23H6hjxlgrrDh7UZvWAp4+6T37U0eWG1z6mqJ/32vStm5Gz
	 UhdZ4iZGydVcinY/eBKZfkMoUE6vpQLFkba7Yb5jkOLfPtrsExYG2jl/aCk4++eTYaMjz
	 wxi4tn2+imVuO2W+7gGWBpW99ah4Yfmvp69mr5mLS7wTzR+9mp6W5jGXzd40nMQ5VZxYZ
	 3PmkEqLQm5RRTpj9RDj3UhWrQWdZ4zGgF0aovnDEXSZ2kJfkL92ROwhFPsgfk2gYyAtMU
	 cELzCeyBIAGUz3s6nhdwm+ofuxfkGollGTcEOqqCA4/uykqc2aKSKkZikclX43dunJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524318;
	bh=bZLT2AHGzh0I6N+qVO33GmSUaI6poVEUe3TalMrm/tk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BXSid+/QN3aWwwuVKnQLz8am4bZRChmYHo02tkV3DbdLRIhyV7ygUsraraQhmqD6M
	 GKVPFYG75dN8WClK7vAFLto3Y7CPCcqAfYMUuGm2HuEHmuZkeO3UHZwp+Ai/vbi7/j
	 HbTh4Mzl+u2Y+bSuVzGK+IPLFVk2ilU12zi7TZLTeLUsnHDdG/rhZj35SpQpk9J3e2
	 msxCTjC+O/fxGUxfu4CCEAoaMdKTyh/H0a2zzlW7wghUP12EG0gZ9WNbdQ72wV7Fkc
	 X7d7zox5UPoFoSXCMZBLZ6ZWXjqgTjTJtCDReQnFl2EjyfXfX6ic0qKAiNIOzPu+Qo
	 hhdHvbMl3ImQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A7F60D6E;
	Fri,  4 Sep 2026 12:18:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE43310E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2967580F24
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyveC8iJ6ijG for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D315180EF0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524308;
 b=oxcohAoFT6xC1UPcjRsMoAC2S4ox+lFiUfq8cGFtVW/YQnqp6NZ2dKHVBfrExxesRhi2
 yDCSnALLMGXfEFDMQpMchcNqtPBvVMd2pu6SfO4crK+UNPkbxplI4ah53eCpu1lBldhLc
 BVv+R/k99qUL4tJAztfP4rxWMUwxrSu9EQlZmL4tZ7E4hBSgAutVG6CpSZqmmxIA78V/3
 5P8EgxnRit+FcqUQ3THeg0yxwV0HqBLMZAzJjLI7hYOkWDCvK28GxsCCoCbeW9IDDA8ml
 Fk4/Sqa3SH5/jtwiXnvwpVfasYZ0vQ6+XtvvEXOC7mdBcMWIiXyOhp2DB4aowrOTerw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524308;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=9BxJeXRsZ26MdZGXksFa4t6YMrbEfYWrcr8tG/dmEQ4=;
 b=EQUaUBJ5NcXN4V0GlfNhYk5GwHMpMbGaaCrmfG0UkOyo1b1F6sZgzGeHcGJrIaRsgoZs
 ZaE9fBjZc1iwcMFq76308bQsXnBFrby02ibwPx00sExhadaDs+kZiPTyhSnOYNaOjzZu0
 kUgfegQ3bkyG9XlO2UDGliRKAz2i8r+pfPcVdxYxIOQLgOVCw0/xaPy7B6TpsQc/I2gnv
 rJ4kfzLv/kn/Lrm6LEadqrRInDjjCkDxkAjOy4boy7/aV12my+DhvOnck8G+WqdIQjWAt
 EBYlVcoTEIzdkz6aM9sSzmN3fgx1IDx12Mygm78jgo1nSJ3pntzrWsK+zhVWOvM/fwg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IYgvAQoV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D315180EF0
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4858595f997so584125f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524305; x=1789129105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9BxJeXRsZ26MdZGXksFa4t6YMrbEfYWrcr8tG/dmEQ4=;
 b=BpBh7tQG+rtbWb/WmGoLeIFPfYNhK8kBk9OuPkxzNgaUst7TxAS6CYbhG1CfcPHqmZ
 ce2SqDIBRZKuopJVZarP/BQ8TBAHARFhW/eSlakNo//FM0iP3eGGbTue3ndon74bSfdT
 ZOW1N9/pWdFs6ymIUA8UAEqUYmNTc7YJKDGYYfhYIfQYi9W74fDjn02JVF64yHb3+WzW
 JXVn6CYBbpkKpeSZFtQhZ34wbuaKopjWxY1OmM7ueZnI7icnyOosl7kb9mbl0S90fhHU
 j+LAHqE3MLJajYY4N8UXdV5wqlv+4utzwGcwz9jVE4vkRj2IGg24WJhAu6WuLaa1yDvh
 491A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzeFbIVAXiYLd03fcI2TpIm4Jh7ByDrRDZg6XbCIh1X+cxedVFcvYKoykTJLSrNy6qkTWVVOfO+ykE=@buildroot.org
X-Gm-Message-State: AFuF++nlRKkJWD/5mn4lKxveQng6FQ0YcgMGVIMpP/BefxnwziI84Yd7
 y6mlMEBbOXRBMmfC9W2Ew9WhwilRZb/d51nbigwSBq3iEBGt7UDy2zHkx4+QUIQ1xnrYWAoLnik
 NbamA
X-Gm-Gg: AYBFou1tqQQiKSnOGpPoeOFjO/LBU6D+G/vTdNlTDPNkfHMCJMrhBl5jL4Y40llodh7
 bcXzgqp4vOkH453w09kuMYbxXNTPmFmXpUHn0sQ8+TSp62u39KX2LbkW2VTqGNfxkGHPK+vXubA
 iqphI5dODsenddhrbfCSrez9MrLLult/XUQEmihQwKnlFPPt1VVVGE11/Jt5rsicg2bxIs7v4LX
 vJ4AgobSrwieMQtnfvnFzGEKGxu0Vy0db/GYwR3NvMsj3U8xMvLnhNHrKnmcIiputCzFH5d74PX
 w9xRvQ3x1o/lZKR5U3p1GM1GrWdops8B68Jx+saNkV+Ma9nzbNa2SVLiFNEZtRmyHNIcfHXdo43
 ckjDWXadHVORFWbhENUJLZzmjXHJUXHaPrU5N9EUeJKSFlv4MloB8lsyE1NiqSWBGrEHhsXVnFT
 XMl51J/3TfpbXLAB8qLvtU2EA/lj1vShTiRgum2n8rA+gifLoP3twcHidZoO8gpTkh9yXrGS1Fq
 WHkBg==
X-Received: by 2002:a05:6000:2084:b0:482:f0ee:1390 with SMTP id
 ffacd0b85a97d-48587289c5bmr11540193f8f.22.1788524305400; 
 Fri, 04 Sep 2026 05:18:25 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588390e30sm6023142f8f.7.2026.09.04.05.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:25 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:24 +0200
Message-ID: <20260904121824.405285-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoSh0nj09EJBIC4F@waldemar-brodkorb.de>
References: <aoSh0nj09EJBIC4F@waldemar-brodkorb.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix for gcc libquadmath
 conflict
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> As seen in the Buildroot autobuilders, struct rm_ctx should
> not be exposed in the public fenv.h header.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/761/7613538e0847a10eb3e2a7e40f3ae76386ac015b/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...tx-should-be-private-and-not-exposed.patch | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
> 
> diff --git a/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch b/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
> new file mode 100644
> index 0000000000..e77f079dcc
> --- /dev/null
> +++ b/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
> @@ -0,0 +1,151 @@
> +From 1105fd6c97f020f6ca7426e19d29081f404b567d Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Tue, 18 Aug 2026 18:13:29 +0200
> +Subject: [PATCH] fenv: struct rm_ctx should be private and not exposed in a
> + public header
> +
> +Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/1105fd6c97f020f6ca7426e19d29081f404b567d
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + include/fenv.h              | 10 ----------
> + include/fenv_private.h      | 24 ++++++++++++++++++++++++
> + libm/aarch64/fenv_private.h |  1 +
> + libm/arc/fenv_private.h     |  1 +
> + libm/arm/fenv_private.h     |  1 +
> + libm/csky/fenv_private.h    |  1 +
> + libm/mips/fenv_private.h    |  1 +
> + libm/sparc/fenv_private.h   |  1 +
> + 8 files changed, 30 insertions(+), 10 deletions(-)
> + create mode 100644 include/fenv_private.h
> +
> +diff --git a/include/fenv.h b/include/fenv.h
> +index 4b532c573..34042d5ac 100644
> +--- a/include/fenv.h
> ++++ b/include/fenv.h
> +@@ -1,5 +1,4 @@
> + /* Copyright (C) 1997, 1999, 2000 Free Software Foundation, Inc.
> +-   This file is part of the GNU C Library.
> + 
> +    The GNU C Library is free software; you can redistribute it and/or
> +    modify it under the terms of the GNU Lesser General Public
> +@@ -131,15 +130,6 @@ extern int fedisableexcept (int __excepts) __THROW;
> + extern int fegetexcept (void) __THROW;
> + #endif
> + 
> +-/* Rounding mode context.  This allows functions to set/restore rounding mode
> +-   only when the desired rounding mode is different from the current rounding
> +-   mode.  */
> +-struct rm_ctx
> +-{
> +-  fenv_t env;
> +-  bool updated_status;
> +-};
> +-
> + __END_DECLS
> + 
> + #endif /* fenv.h */
> +diff --git a/include/fenv_private.h b/include/fenv_private.h
> +new file mode 100644
> +index 000000000..5e81c71aa
> +--- /dev/null
> ++++ b/include/fenv_private.h
> +@@ -0,0 +1,24 @@
> ++/* Copyright (C) 1997, 1999, 2000 Free Software Foundation, Inc.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++/* Rounding mode context.  This allows functions to set/restore rounding mode
> ++   only when the desired rounding mode is different from the current rounding
> ++   mode.  */
> ++struct rm_ctx
> ++{
> ++  fenv_t env;
> ++  bool updated_status;
> ++};
> +diff --git a/libm/aarch64/fenv_private.h b/libm/aarch64/fenv_private.h
> +index 5afb790ea..3eaf0eb3f 100644
> +--- a/libm/aarch64/fenv_private.h
> ++++ b/libm/aarch64/fenv_private.h
> +@@ -19,6 +19,7 @@
> + #define AARCH64_FENV_PRIVATE_H 1
> + 
> + #include <fenv.h>
> ++#include <fenv_private.h>
> + #include <fpu_control.h>
> + 
> + static __always_inline void
> +diff --git a/libm/arc/fenv_private.h b/libm/arc/fenv_private.h
> +index 5f74c5e13..2e985722f 100644
> +--- a/libm/arc/fenv_private.h
> ++++ b/libm/arc/fenv_private.h
> +@@ -19,6 +19,7 @@
> + #define _FENV_PRIVATE_H 1
> + 
> + #include <fenv.h>
> ++#include <fenv_private.h>
> + #include "get-rounding-mode.h"
> + 
> + /* The standards only specify one variant of the fenv.h interfaces.
> +diff --git a/libm/arm/fenv_private.h b/libm/arm/fenv_private.h
> +index 566bf443c..61418d9f4 100644
> +--- a/libm/arm/fenv_private.h
> ++++ b/libm/arm/fenv_private.h
> +@@ -19,6 +19,7 @@
> + #define ARM_FENV_PRIVATE_H 1
> + 
> + #include <fenv.h>
> ++#include <fenv_private.h>
> + #include <fpu_control.h>
> + 
> + static __always_inline void
> +diff --git a/libm/csky/fenv_private.h b/libm/csky/fenv_private.h
> +index f0f48a88a..e6015abee 100644
> +--- a/libm/csky/fenv_private.h
> ++++ b/libm/csky/fenv_private.h
> +@@ -19,6 +19,7 @@
> + #define CSKY_FENV_PRIVATE_H 1
> + 
> + #include <fenv.h>
> ++#include <fenv_private.h>
> + #include <fpu_control.h>
> + #include "fenv_libc.h"
> + 
> +diff --git a/libm/mips/fenv_private.h b/libm/mips/fenv_private.h
> +index bc9be3b62..273d6faf8 100644
> +--- a/libm/mips/fenv_private.h
> ++++ b/libm/mips/fenv_private.h
> +@@ -24,6 +24,7 @@
> +    code instead.  */
> + 
> + #include <fenv.h>
> ++#include <fenv_private.h>
> + #include "fenv_libc.h"
> + #include <fpu_control.h>
> + 
> +diff --git a/libm/sparc/fenv_private.h b/libm/sparc/fenv_private.h
> +index b888d8442..c76fbad7f 100644
> +--- a/libm/sparc/fenv_private.h
> ++++ b/libm/sparc/fenv_private.h
> +@@ -2,6 +2,7 @@
> + #define SPARC_FENV_PRIVATE_H 1
> + 
> + #include <fenv.h>
> ++#include <fenv_private.h>
> + #include <fpu_control.h>
> + 
> + /* For internal use only: access the fp state register.  */
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
