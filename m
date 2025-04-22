Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D6C369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2958C40CCF;
	Tue, 22 Apr 2025 21:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0ZFmoooW5fA; Tue, 22 Apr 2025 21:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B8B3406D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8B3406D9;
	Tue, 22 Apr 2025 21:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D96E1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 639BE8207E
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bs6WDgWOCiFb for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8A738207C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A738207C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8A738207C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:53:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso42412845e9.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745358779; x=1745963579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0z2iR36lkfdUx3UQeWL3DVxjuShMwBeYYL6EHlixgug=;
 b=bT8DfipgOV4+/L5jdWqsq//3/8uvThtfM2wxXDrmjw0Np1jOayI4MdsiHoSH1/OMOC
 aYO2GObibvoqLf7ukFt2IvgybY1eWoSxBesGHoFrhC1gNnI5a7Xb87XCrm7SE1mF0PFd
 SSczGVvM/fvXEYxaGIlJcMXF0i8+o6llpWgOuVmzHxggQhzPz+S58L8s4S064bbwcjdY
 w/jq0uUc8m7FssmR8Dft0FWTvSbeOaP3cJ3sW2Cj6NFcw8Cu/oXdpeRjyjcIetrJFXmQ
 yzl5tZqGF8pL9ioXURiyKE5+BMijY3q+4J/odHxN0n4EUbexr6Iuq9pTY141dp2bfNqW
 vLTg==
X-Gm-Message-State: AOJu0Yzz3enDPTJECsXYVUaHz8VZN8ct32EX0znbTKi75PLGyTiRkgjd
 s7CquTq0ryFICS0pdCntaa6MJgHbGC92AM0hrhyGZFiUX7N/CXGuigO/jFrkg4WI8MAKybRjrUs
 sqjI=
X-Gm-Gg: ASbGncvrjBLdJ2J23b1IATGfdJ0n3hz3jEEmEQw8VpjIMWMkyr/9e6nt829bBYOsIJ3
 NILl1p6jotrq7qqWGUDb3fYA56/vALjwmD4UC6T+20NJS5vaD3YKHZUVOH6ALiB4CrPIDFVcAHq
 i0pukebmAbTLqsWWTwZnmHxcYpYeLHrwfXMtVqSgbma9YTx7ohagAMn8DI5bpEY4tgVyiU7YYsS
 i601YQIC4eZUx3oZXfx6XRfHm+75Ec0mGWtTCXG9t/21MYERZAftq9z8mKW0yiQBLElMgzF03eF
 afoiEM0sYC65mS1stcxckDwPxAgoKylcK4ddSRxDIKrNWlWRHY4pJe6fKj+VWkxatQ==
X-Google-Smtp-Source: AGHT+IEWybctIWXe/vDJpEaUSg4xYtXUtjF944oAj4MezrNZfjFhZy2hD7IC9S41/DOMTiz6XbC6DA==
X-Received: by 2002:a05:600c:3482:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-4406ab7fe91mr143011505e9.6.1745358779450; 
 Tue, 22 Apr 2025 14:52:59 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d23262sm2604085e9.16.2025.04.22.14.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 14:52:59 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Joris Lijssens <joris.lijssens@gmail.com>
Date: Tue, 22 Apr 2025 23:52:49 +0200
Message-ID: <20250422215249.2222735-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745358779; x=1745963579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0z2iR36lkfdUx3UQeWL3DVxjuShMwBeYYL6EHlixgug=;
 b=iSeOtRGfJ5X+k/4tpt2padCzxq1PRSZ1UaNCHuisAv1kaqO9U+iV+5/l+TxzOz2vB2
 eoF8+tG8WLFBiyjgFMhODC2/fg/IjJOsSM2QJ3tDJcUs2V0Ayr/R9iqsJCE2T1eX6Y1G
 pA7SGAbv5pbL2pe8vBFtI74xst7W4YeXBZ+qiKUMn+iM5BXPi+gRRixsTkFAAatYwC7Y
 XTLhCFxcm8RXlGBLy3Rsx+YjRvL9BI9yr56uxPwV0GftlrE59YJzsgmiIhWORpbwQJR1
 xjylV17p/dXZTjMnrWP1YTuWkfiIRC8kKFDzeTgc3vJG/j0ojBsBS4RSgqs3L68pTZjH
 5NUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iSeOtRGf
Subject: [Buildroot] [PATCH 1/1] package/libcoap: fix build for toolchains
 w/o threads
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

The version bump in [1] introduced the upstream commit [2] which made
builds using toolchain without thread support fail to build libcoap.

This patch adds an option check in the libcoap.mk file to verify
the toolchain has thread support and passes the correct configuration
options introduced in [2] as well.

The build can be tested with the following config.

```
BR2_armeb=y
BR2_cortex_a76_a55=y
BR2_ARM_EABI=y
BR2_ARM_SOFT_FLOAT=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PACKAGE_LIBCOAP=y
```

Fixes:
https://autobuild.buildroot.org/results/9c0/9c0b675a64fb2576bc34457043f118cffe5fe555//

[1] 4df4d1d312 package/libcoap: bump version to 4.3.5
[2] https://github.com/obgm/libcoap/commit/c69c5d5af0a30859e90756f535e2ca21cdeda0b2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcoap/libcoap.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index c5e5f85c62..d7c2a78944 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -31,4 +31,10 @@ else
 LIBCOAP_CONF_OPTS += --disable-dtls
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBCOAP_CONF_OPTS += --enable-thread-safe
+else
+LIBCOAP_CONF_OPTS += --disable-thread-safe
+endif
+
 $(eval $(autotools-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
