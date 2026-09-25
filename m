Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC82C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8716260DA5;
	Fri, 25 Sep 2026 14:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVwJsim3q6s9; Fri, 25 Sep 2026 14:44:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BAADF60D97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347456;
	b=cQ+EFJDJjP8plQuhD0FOvsAxtcyYmDrCA/ftUDjk0O7RLdQRroNIXvda8tcWuNCnUYY+
	 c3Dot+o6SQgCi+x3r9X/z243WYKoRDNxhPJcfQcqN4/PzkXRo0CLbxUyEap71PuwxeZHi
	 LPwPRsv5UF8qcptyCFFzj3gxYKA2cWrRmE1ZKKs5uLv0Bd5qnhVY5lFlA5QvfbRN8wtDb
	 AP0UBaIiimtAtKga335FIcjZW/o58iHSBB3g+RL5O7HFyJeHnmA3ImhHg23oc9Nq+fh+R
	 seZ6YrUrHUmgAGrg00dliJcVeCZ4xljRBmLB/W8LS/aN+iMJ1U+wj3SbwAJIOnRKEeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z6hC7gwni6YvRVfFSH05/zBw45ZNZZnZ/Uum/9Zrn5Q=;
	b=tMzrm71nNhwCWYLjMgxJCR/JhcxWn/EvDi0qb5nZn6yqNAGUxLH9GkDl8AVQNWTBShW0
	 +dA9oZqLDQMlCUNkbtEelWH38mbgeUT9vkLW3jh4iRE9HGeMNPieOsWLKUv1RSqfyXlou
	 LDq79AIuscBt1zFJqtEMWBPCvWCKrTQvSKkeuJixyOX21V/Rv48HekkOh9Pz4hZvYWZF4
	 +ZuT9wvKItljAV/9JIOZtN0zHDjqv/r52azvUlFPL9th27RD6Oq00hAbYOz3Cx3amVd3Z
	 77NEWXhZPCNqAWGU/VrDU/Ah54B7twcaWBtKFZDtrwE2mMIdBvLIyS+xhnKbXt4WvJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347456;
	bh=Z6hC7gwni6YvRVfFSH05/zBw45ZNZZnZ/Uum/9Zrn5Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k8mgptPqQ36eBILO2N5rzUsqbwOOzct6XkAJhnZmU/vCj7W/8n8gYHmKiugZdQF2C
	 phV2yMn4CZh3pIQlodOj8atscH0JtdrdT0VrtIOlXtwGTfD9KeswFHaKqQFLStw0VP
	 uM8LozWG9cYGy/HMoMlfLdUKGHMtbmiVTyp7B70pd5NqcdOKCh0KUp5BGcvhpEiSx4
	 mAKD4lQ+9LpHVh43eroLh/CUj5x92tspV7o1acTZlVcViZrfENfuYW+v7nEz+9oxHm
	 q6cc7aU1c9RiWy5sWOzCUoGxnwKHc7T0mnioe7ISZKHQ5E0fUokfSiJfH3q9yYnsVE
	 y6CsK6//XzqJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAADF60D97;
	Fri, 25 Sep 2026 14:44:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F057E332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D604960D9B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZnRVb3HUXom for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA5F260DA5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347452;
 b=gk6Hcn3ANoKrOEQE6Hvpp7HsgXbkdJBkj10S7GOdqoVKKTwDnO7T6I5aDrs0mZefAqwi
 JLW8z2FCBL59jl3V5ALyKnQE/dmqZIqLUWOjYijeL8H2DNizCQuZKaJpnfS/6YCpLAnPk
 rS3ZtqSvStyOtQZRd6W9J4uvXHnni7FZFSffGo7TFbWmYzdptMQCB1Ycr/SvhgjSKfWML
 o00lrBaBFo6egfla/1fwx8Ee49/ri3KPS6qiWpn0GVL4/sUXqDi9O4FeHCkbNWcvTdMCM
 7TST4ZYfSxkFXapMOkOIYZs6RXiNiElNFLRE8DmtjEf0lvoNO26fIAXyUJRhFX5BihQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347452;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=60fFeftzN3cekXJX50w1Ly2vo3VHws0oMuZa/eP9XmA=;
 b=KLX/OY6kTvYeOgOemjONaL64kQvJRqa3rrxqkdS8Ne9D824/jAI4G6tKwjxO7tiOvWGr
 Gzlsle3nIu21tKEy/hw3W5H7G/h1pw6QG2shrKtZzrxYaXa/vsKLqJILbOSESoM0OlMW8
 PtYW82yzEaECLblnADx7ombc+JGFcuh2UA2OcHew1wk0DMBlnCPR6bokiMj9YFVpkiKnL
 Ohj3FxKZVw84ZvQmQHn6bmrFKOTxAZbAZFqowfGBBEJdy895Lc36aDerKVD2VdAdUw5ns
 sUWGy66S7pjLk+aBKMt5sCGOAKTj1W+iEvSXeUfHMHPwRhdlYUGY1KfdtUwuG9QEs0w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CcIyyWXm; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA5F260DA5
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:11 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so626732f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347449; x=1790952249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=60fFeftzN3cekXJX50w1Ly2vo3VHws0oMuZa/eP9XmA=;
 b=hvgfeiDiJfH0ZLKdA4CwSIKky8CDmrid63xxzNBKtuFETaSMDaQVuDZFm+6lJYMHxL
 oro6m1nNEphAb4La5eYbkn+X2Y8q4MDPupYLXIrlEFrasutiTttglFkDLgGL4HfmhTkY
 O0nE9KoY9iXN4nwoE4+4xjpnwnsjmfkASwRg2fXUUTHEXhulGeTrMVKLcxt3utELUFGL
 zTcPKP6k1PE4/6zpyheeM2As5o5JP187/wE+Zpa+krBJ7M3q9aC8GtJeghw5GAzmu/iQ
 Dx9IVAuL+rLTaubl5YkgMF7zz49nIbubVAPx/PjiRLOAcXNB4ty8xDPH6A1Xz8hRGAVR
 PFsA==
X-Gm-Message-State: AFuF++kXDVjR/t0ecRxp2Vhxo8ILomX5TmLVp3p/Zg+8K7h69zmXI4uz
 o2NaPUmBtAC82NZmTodQ2WZBgg5nwhe4gtgZ8Y2iUCwDoeirw/x2/yml1pt7jj+1rY1+dTNERMK
 OmG237k8MMw==
X-Gm-Gg: AYBFou1cs/reC0D7My1e3XN2iOnHgd8xK6hmMHs+Vkq7DmOsC8cbawrg+Dv1FjFhMIv
 KwUeH3gbLLCm6uk16BQKe7P2cJ9UhqkQ+Osw1KOe1bSVp/Oisyp2/G+9VF7QktNuJ0XdIvYsX2d
 I/Mk5BR1VccepezzS/8km18CbElUCI1fgcTgDY3wqMurbZLA2R/qPDNIaXJxrYWDnUzE3q40N4T
 xEPoUJG6bg2AIdVTlKwKICkkF2F9XGu8CMKrQypN6bU9JRDygsPrkDj4IoZljJhtMgTwr2iZ4e7
 RBUdyp5/6zZyfPl7sD8bv79kOoHq3DjR28HWwpW2NxJIm2Q2J9D6EUXFZy08IebKnL+unWAzCth
 huM66Tr3+lHSgLIt146Qth1y7vje1S/S7b1YpvjphpTXQqujbxwnZcUWzYNmLST3HxcUmExNAEP
 NsDNoPFHUzwJX67TeSYKA8j/KiWzQCuLEGNaeMOI5CQA2tDLjW3K7AMAdaLsENW/8JHqWEPFGiz
 ZajBuXmyRpv58Ja/JsPd8luajbCVONSpznKn1pqUFg=
X-Received: by 2002:a05:6000:41f9:b0:487:13f:f612 with SMTP id
 ffacd0b85a97d-4887db39634mr4448943f8f.37.1790347449294; 
 Fri, 25 Sep 2026 07:44:09 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a76fsm7858636f8f.7.2026.09.25.07.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:06 +0200
Message-ID: <20260925144408.4095700-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908191348.1892945-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/libest: fix build with gcc >=
 14.x
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Renumbered remaining patches.
> 
> Fixes:
> https://autobuild.buildroot.net/results/149/149aad6f98163faab14232a9d3013c197579cbb4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commit/bdbdbd0557ae43c5cc6f186ee93a01eb7610c1b5
> 
>  ...client.c-include-est-est_ossl_util.h.patch | 27 +++++++++++++++++++
>  ...ve-duplicate-invocation-of-AM_INIT_.patch} |  0
>  ...h-add-missing-extern-on-e_ctx_ssl_e.patch} |  0
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
>  rename package/libest/{0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch => 0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch} (100%)
>  rename package/libest/{0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch => 0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch} (100%)
> 
> diff --git a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
> new file mode 100644
> index 0000000000..d027d8012f
> --- /dev/null
> +++ b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
> @@ -0,0 +1,27 @@
> +From b49542dea03c4b895a860c393453ab8497dabfce Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Tue, 8 Sep 2026 12:52:02 +0200
> +Subject: [PATCH] java/jni/client.c: include est/est_ossl_util.h
> +
> +Upstream: https://github.com/cisco/libest/pull/132#issuecomment-4749526125
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + java/jni/client.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/java/jni/client.c b/java/jni/client.c
> +index c5bc28e..2c4663e 100644
> +--- a/java/jni/client.c
> ++++ b/java/jni/client.c
> +@@ -12,6 +12,7 @@
> + #include <stdint.h>
> + #include "jest.h"
> + #include <est/est.h>
> ++#include "est/est_ossl_util.h"
> + #include <openssl/x509v3.h>
> + #include <openssl/bio.h>
> + #include "safe_mem_lib.h"
> +-- 
> +2.47.3
> +
> diff --git a/package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch b/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
> similarity index 100%
> rename from package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
> rename to package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
> diff --git a/package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
> similarity index 100%
> rename from package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
> rename to package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
