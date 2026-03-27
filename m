Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A119510ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76FC66129C;
	Fri, 27 Mar 2026 10:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzVcWLn15byn; Fri, 27 Mar 2026 10:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92839613D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605800;
	bh=tzpDqQt3PkWvkHuW+bCCUGfakza2+TwHNh9QId93E7U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KNbBhocmfJ8diBd1DYGc/cHnt/m55jur9Ap/XG2ct1xssgjeHEzfHowOI+pg0wDyI
	 UyzL8L8PMtVmRfAeHRLQLX+tVpRaz3hq91u1MLmDCSlqI2CJrG9mPsYRU2mhbwBVmO
	 yagGG3Ie7QOlm88hXVgKnzeSYYJP5MdDADnjWKpdHhwE16wVchFqVmOFZDr1Kc5Qh0
	 l6qQ+kqe1Nq6WjDDxgzl/aVZfUArWAgL8clMVih86k2mlbp6xkP20Od0PtCQhvD1YF
	 6bdm6a8NKPiL50qqaQQtSCEBlk+f5mHPSHbMtIW0YA8k6psBx/boWT4ZlodRShBqeQ
	 9eqGQebqOp88w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92839613D3;
	Fri, 27 Mar 2026 10:03:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EF801D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 510C940087
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQ1ysL8EQ8FZ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 274FF40BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274FF40BD7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 274FF40BD7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so1281659f8f.0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605794; x=1775210594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u7ob7sRfG1T5JZ1arQAkUZkq0mYvX/dRWyGkdoZKHks=;
 b=XmgdJ67845rGd7j9mjKYOi//efH3Z0y7Mm5gP4907v5G0HGMh9FB6CvzlUGW5Z5njp
 eypxK31PTovmeOBpMfMPhFzHU4LB6b89oVrSQ7aMtt8vuv7PuFZD6EgRf5MxLuED9/5h
 Y9R3eecMaq9J4RHJy1ZwJ09nMK8t3a+I665ipmlZxMN4rT7xOgVZpBr+CN4hRClh1vqF
 rgJcP0txREvjbcwLx8c0kNadk/s5RkVpObNjdDNm0pXyF52OtjCt9rxd8qUa/TckhLDy
 zNZ9D+d22WNgDYneFwJSodIqMWTpP0TKaO80W+e+65TlZ+WeGdE01617VygEoQiA+O22
 n41g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJdcy6NgBkGhJYo6i40u+ZTMwesQsxskthQpBAxmXmIS9Y4fgd1wygYU7b2cs5ohJf7pCHhPFS4Gg=@buildroot.org
X-Gm-Message-State: AOJu0YwcL+J6bxBV0xxOceNzutCeUwN0ZTMeC8AhO45VxM05S/Jm26im
 3kvIHxaFwygOQXMXCSWaeT716nX6ldRRkEc+R8fPj5aRV5CaubUlv3PEieCfQBUcDyoRt+aVi2K
 VmLXQ22M=
X-Gm-Gg: ATEYQzzId1kfK3DzR1NVF08WDrDAXZ6KM4iaC2m9NNj/4V6s8THZEvAUafF0hWQbVdq
 m79tN0vCGdUrFLZAjrefwzs8nyhDGjkX46qxZ5xhfhPAabYFy5NQ40lrs86sSGSbHk3IUn3bcNi
 sIqfRPN5NBpAO6J0E5+rHT7D9r+8X9dssJTHXLmlfOItdwYp5OXMgt8rdIoEAUaWuND6UKoVYUl
 alQKYcM8dpjRMJ0gLHpm4QgXNDZaVb3s6XeMDE+MA9cKLttBm1TDK6kSaXSRDsDRAiBGpEv/G8d
 LNefj9fVRT/EH2/sDeD/Wfcx28HyanjABZZ10yQy1J3VHKVeuwBml5lQHL8/pWijGWwjKIIr05x
 p/1RSDxarT2im7JSy5cyIW0rOh4D2U2wkbqaNg6JXiF0NR6AxjVXlClFQh132lWtBWBSpzCy0r+
 SzcsdWTjiXjrSH2PVQ
X-Received: by 2002:a5d:5f50:0:b0:43b:9a9f:8956 with SMTP id
 ffacd0b85a97d-43b9e99d921mr2681612f8f.22.1774605793895; 
 Fri, 27 Mar 2026 03:03:13 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15127139f8f.18.2026.03.27.03.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:03:12 -0700 (PDT)
To: Neal Frager <neal.frager@amd.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:03:12 +0100
Message-ID: <20260327100312.47004-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318100457.1838670-1-neal.frager@amd.com>
References: <20260318100457.1838670-1-neal.frager@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605794; x=1775210594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7ob7sRfG1T5JZ1arQAkUZkq0mYvX/dRWyGkdoZKHks=;
 b=ZcL5puiYhyC2SiRzZnA+7o8rQiByWijAi2o8dXnXlSJNWFDx9htnFDftqfifY3A5m3
 5mPEMjW8gBE5rkn+MqGhwZ63lszE85EjDnq18HEn+mv9rnpHHqGOwixB0MBoQKTOC28m
 bBZwwzHSe3tJrqTcQ78k4tf29O1+YS3tOwnxGhRw8012F/w5TldGjgRph73e2uiWnIxv
 CUaUrBuW8ZJxXBxeZrD1UGPO6sfx7O4eKwXNfrwVR5DU+YAZ4LiWloxAUKMV6BgBjx2p
 178s1dKJ1/swbz9+a0Ig2nI8B12Y3s0zwmQS1Myw+zMdS9LQcRIStkRsDFJyhsLBv7Qn
 fjHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZcL5puiY
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: fix build issue if
 host-flex already built
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
> Fix a silent build issue with the host-bootgen package if host-flex is already
> built. The host-flex package will install a version of the flexlexer.h header
> file that is not compatible with the version embedded in bootgen.
> 
> While the build will still 'succeed', the binary will not be correct. This
> can be seen by just running the binary that is built. By default, running
> bootgen without any parameters should print the help menu, but if the wrong
> version of flexlexer.h is used, it will print the following instead:
> 
> $ output/host/bin/bootgen
> 
> ****** Bootgen v2025.1-Merged
>   **** Build date : Mar 18 2026-07:08:01
>     ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
>     ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
> 
> ERROR: syntax error
> -h
> 
> Add a patch to the bootgen package that corrects the issue.
> 
> Upstream: CR to AMD jira
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2026.02.x. Thanks

> ---
>  ...use-embedded-win_include-flexlexer.h.patch | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
> 
> diff --git a/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
> new file mode 100644
> index 0000000000..1de9a91223
> --- /dev/null
> +++ b/package/bootgen/0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
> @@ -0,0 +1,76 @@
> +From dfe45e10791a171c3c79699257d3d3a978ec30eb Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Wed, 18 Mar 2026 09:51:58 +0000
> +Subject: [PATCH] flexlexer: use embedded win_include/flexlexer.h
> +
> +bootgen embeds an old version of flex. If the host machine has a newer version
> +of flex, the bootgen binary that is built will have errors such as the
> +following, if the wrong version of flexlexer.h is used.
> +
> +$ output/host/bin/bootgen
> +
> +****** Bootgen v2025.1-Merged
> +  **** Build date : Mar 18 2026-07:08:01
> +    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
> +    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
> +
> +ERROR: syntax error
> +-h
> +
> +Running the bootgen binary should print the help menu by default and should
> +not have a syntax error.
> +
> +Correct the path to the flexlexer.h header files, such that no host version
> +of these files can cause a silent build failure.
> +
> +Upstream: CR to AMD jira
> +
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +---
> + common/include/bifscanner.h        | 2 +-
> + common/include/cmdoptionsscanner.h | 2 +-
> + common/include/reginitscanner.h    | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/common/include/bifscanner.h b/common/include/bifscanner.h
> +index 9683416..9aa72a5 100755
> +--- a/common/include/bifscanner.h
> ++++ b/common/include/bifscanner.h
> +@@ -29,7 +29,7 @@
> + #if ! defined(yyFlexLexerOnce)
> + #undef yyFlexLexer
> + #define yyFlexLexer bifFlexLexer
> +-#include "FlexLexer.h"
> ++#include "../../win_include/FlexLexer.h"
> + #endif
> + 
> + // Override the interface for yylex since we namespaced it
> +diff --git a/common/include/cmdoptionsscanner.h b/common/include/cmdoptionsscanner.h
> +index aa2f474..78fa7cf 100755
> +--- a/common/include/cmdoptionsscanner.h
> ++++ b/common/include/cmdoptionsscanner.h
> +@@ -30,7 +30,7 @@
> + 
> + #undef yyFlexLexer
> + #define yyFlexLexer reginitFlexLexer
> +-#include "FlexLexer.h"
> ++#include "../../win_include/FlexLexer.h"
> + #endif
> + 
> + // Override the interface for yylex since we namespaced it
> +diff --git a/common/include/reginitscanner.h b/common/include/reginitscanner.h
> +index 74463e6..d8152a6 100755
> +--- a/common/include/reginitscanner.h
> ++++ b/common/include/reginitscanner.h
> +@@ -30,7 +30,7 @@
> + 
> + #undef yyFlexLexer
> + #define yyFlexLexer reginitFlexLexer
> +-#include "FlexLexer.h"
> ++#include "../../win_include/FlexLexer.h"
> + #endif
> + 
> + // Override the interface for yylex since we namespaced it
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
