Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AFCCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BACC940AAA;
	Fri, 16 Oct 2026 15:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxaK5P1LNGcZ; Fri, 16 Oct 2026 15:05:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D194340AD9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163129;
	b=VleFZmcd6Jw+MYn/6u3pWRUkNuaRdXS4dZeWQsHvenPsz8eWnPqYR5dZJbSxIwp52OkO
	 1riRZQkQir9EM9DxOduOSaOdGZAlBo+nj/OUJJpJnXnHOPirKrQEGyviCFEvwjadK2xdW
	 erLlnqoJ/Q/rI8QkuaT3/ohoayVxlH9nqdAIY93zMrHW7QnI8sn1dosE4ZykQpO0Opebn
	 HJnEpAUs8ROvdCCmOphKNibrj1f/sSdbkjmbP0WwlW1NXi331+ttrLdjRbB7ZDn3Psfg+
	 tSotY90AK4qG9Qz1WYa9OapSq7/pKFGTItz7ZkxKbCnA5n5Rn5iK0pgDn0YNr9hPOdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GEtd8RHWSQyhqMuzWOS+xwoE5neHqHax34UtOJ9p4/k=;
	b=U0lqyfXqGdouYtFIXNvX2gxNsNcbHogtwbqutWn2V04u6mLnB3UQ2cvmgGaAeO/VoEoN
	 nXlytvhu5cVV1ZsaBzoa3rE6XpoDKzwxsJLkFn7rSUsF0wZn8Brqf81OG1BCjHhASZ78X
	 bgX27nhpiQFKHXErEseFAsRwCNYkAxHIA2S2N/YFBsrNDc/d0AOGR+1QfTnHUgrqQ4yCh
	 0jiwgVE3WSiKPjyjakFqu+BG+gQfNwTuZA/KSfb5LLJkQBlozy5ocjYOS59CKNllvO3pH
	 WRtqT6JepD0GEUhCBNXgmv83g1fWZPgZHf49gNB7ghx9mXtBptdrlxzNSoNP4UkmktQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163129;
	bh=GEtd8RHWSQyhqMuzWOS+xwoE5neHqHax34UtOJ9p4/k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ok53RhfQPUy+Inxs+i6w5sKXTDRNW+PDLtFk6IYFxiVWotUba0N4LdGKilE4iumse
	 V9ZKIhukwtL5/LngFwu2ekvGTZZoSw6/J0omI8uT5rGhXCRUav8XYeO6KFJPGQTS4r
	 iTDWVf71D3nyPIt2WzokhQYvR37ElRcoTQYodonYeZCXTqFpe7taDmBq2Ldb94ZXJD
	 D5xQoAQM3KZMQSA9jzhpjlHiVxSMcsbMzY0kZPVdqj6/+NhPDCXnNTwdgqa44K/urH
	 SLkW+9t5rlNWF1R/qaomckuXHX/857ftbFjdubZg5IpMSIgIoXBjD99iw38RZiemG6
	 XeV/J6cJX4oFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D194340AD9;
	Fri, 16 Oct 2026 15:05:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C16D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E715816F5
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACbOpA2tk-BV for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D0C4816F6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163127;
 b=dYqkpbPxZ9g+JVxu/PCv00Lc85Am9eOz8zk6L8dQo0yjtpqMHZAiIm5EOdnbTISH+sPo
 jlidlfom0Q4RB0/AJ8Ebc3xNq/plDRCsTwIF9N3SXC7lbk38Nr4L+Kz3uE2MpV6JEHoq3
 rdq5BlJA2uFK1soWUFPz7dK6Qo+8MwfBXgY7Lmn5eE4SgPl1kVwNsRBpLsHIZd2D+NmJ+
 sitHdcrOSe5CtUsLsWSJdKI72q790QzlMVVJkByVVwI5HxdTKrr9/eBz5jVMHFpSfh/pL
 m2JW6gFi7SiicmvMntDpCNdO0c/dy7o5LTgrnGdKOoTozfknXqeLRrYs8H70+M4u+cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163127;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PokakiKjmv0ZclcSwp5Ydn8EHGes4V/HdAPA//DV2J4=;
 b=kK3LlLFjR1X5tjYneRvh6X69SyJudew3vNaE7MJNcG9Hvfe60Ai0mRyUCJZpBJZBdDq1
 37dOJS6kXlKteyxo7EZQTrFeEii2hKJ+1cbfwl4cwKmTFkVphK8ATLoqqV8Q7cx+sajCZ
 FeE6dCRQd27W/NX6z37pr8dE5XIYXT1ZkKvfaItDn67QH597ZaS579boAQmvHUsMszeWZ
 SXueko6Pu0DEavbzHJVIZDwrTBPQOt5cIBrYtPCVw2O5Ye4Et0uamCVxeUqarJN1NsUBl
 PqensTlUSdny9PzrdLXfmn0xagwdGtk3humPv5rNNJEFk5ryPakMY595zJFx1eTPv2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="V/Ki7U5i"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D0C4816F6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso1749414f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163125; x=1792767925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PokakiKjmv0ZclcSwp5Ydn8EHGes4V/HdAPA//DV2J4=;
 b=GKDn9Qy6mQ+annhAs2ZRJzH+Vg0fYNNQxceRN0iA+R3p+pwqjTjIUHzqnbcffxzqv/
 te34y0YXK88wQBqreUjgkY9S1NyqAGShzTqIaCiRgeJ3VleKuKDlBEqi3r+RtdKXvOf/
 7I9rc6J3G2/ZM9yWYsGOROm4aqrSjnBH8YRCZrZXDm6R89TX701x4eXdc+T0Fx6WVfq6
 8+5TxA0Eb7oZEzNZ86Mxw5vELM7PjOyjVvFlzosT6Sf5wEn1D67CHt4UvNhwf05igFFy
 VB3sAVlhG1KUaaFcW79TSaZezSktW+spMP3bt2nes+5hUv55+zXaDeS3rCALAClBzKmY
 dwRg==
X-Gm-Message-State: AFq9FYIDfSp5PtpSYzcPqaKq1ToKLNCOn733IqpGElZ9JLlVywg3oRts
 9+97WIzqF4CHcUBD2FTgI+SlFIpkbuvrFOXI8zd7HvT1GcJsKS3Tr0CDj8RzqJsxMhY1RuO47NW
 FhjYTxsA=
X-Gm-Gg: AYBFou1Y+az4tWjzxu2STLxvgxiVjVsH7BjAMECdVubxUSQ+jS1duuJU0Idq+mj9K83
 W2bKT3xReiUqlY014Pa01Mc8nhWa9gXEU+t+1ZjlZ9nthhEmX/7JfyzZWALbe9hF8QD5o8dmDuH
 MCqvAbslC7B3j28OHfAgqOd1xLnxEGej9oXNIgJwEH7m8Enc4LOcpcuQxRiJVV3M4DI20nuOer8
 dFJaogjSu+upFMAxiJj+viS7mLLqYODaOQS7C1FK6H9SwfB2JYnpGuIc4655kmehrJL4rawOA8E
 IY5+n96xJQjgpMu2SKJEhY/aR4cQAebEzEn3ZgouP8uo0QAdQqVO39+O6LdMoNOZobzffhXb8Bw
 u3JK6M1w3eFSJj+5QxPw95MpqM5XzrmB+lL8UbUzgbKHEiIeRI1OMf00SdjioDxZIKbtqY6ry8B
 YCjrzztVTiZWSwMpjxgnOqCHZN+/fjIZk5pWTLlDRBCR0xbHOQDQ0oqVd3L9Ws8WbwnrhhrwUZ3
 eZcPNnSw+pA325t523e8Hf+LJbT7SzMPQkKvCr8UQ==
X-Received: by 2002:a05:6000:2411:b0:487:2428:5a2d with SMTP id
 ffacd0b85a97d-48dba9bdb3cmr47552352f8f.18.1792163125060; 
 Fri, 16 Oct 2026 08:05:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4edea3sm5879437f8f.28.2026.10.16.08.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:24 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:19 +0200
Message-ID: <20261016150521.73871-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006162106.3439373-38-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 37/84] package/luvi: fix build without c++
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
> Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
> package to 2.15.0 which first included upstream commit
> https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
> that added the miniz submodule.
> 
> The version of miniz used by luvi contains commit
> https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
> which removed "C" from the project variable causing a dependency to c++
> which causes build errors when the toolchain does not support c++:
> 
> -- Check for working CXX compiler: /bin/false - broken
> 
> This dependency was not intended so we add an upstream commit to fix the
> problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...eLists.txt-only-require-a-C-compiler.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
> 
> diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
> new file mode 100644
> index 0000000000..c68e05bdc7
> --- /dev/null
> +++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
> @@ -0,0 +1,47 @@
> +From 383e551cccf41fc2ce1177712d6a37a85d936642 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Tue, 1 Apr 2025 22:56:00 +0200
> +Subject: [PATCH] CMakeLists.txt: only require a C compiler
> +
> +Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
> +"Add some catch2 tests" dropped that C flag,
> +but should instead only have added a simple
> +enable_language call for tests only.
> +
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +
> +Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + deps/miniz/CMakeLists.txt | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
> +index 156df83..e0933f8 100644
> +--- a/deps/miniz/CMakeLists.txt
> ++++ b/deps/miniz/CMakeLists.txt
> +@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
> + endif()
> + 
> + if(CMAKE_MINOR_VERSION LESS 12)
> +-  project(miniz)
> ++  project(miniz C)
> +   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
> + else()
> +-  project(miniz)
> ++  project(miniz C)
> +   set(CMAKE_C_STANDARD 90)
> +   set(CMAKE_VERBOSE_MAKEFILE ON)
> +   # set(CMAKE_C_VISIBILITY_PRESET hidden)
> +@@ -309,6 +309,7 @@ if(BUILD_FUZZERS)
> + endif()
> + 
> + if(BUILD_TESTS)
> ++  enable_language(CXX)
> +   set(CMAKE_CXX_STANDARD 20)
> +   set(CMAKE_CXX_STANDARD_REQUIRED YES)
> + 
> +-- 
> +2.47.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
