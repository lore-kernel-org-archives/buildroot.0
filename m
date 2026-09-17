Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5ABC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 11:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC0D980F92;
	Thu, 17 Sep 2026 11:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8M1wWUOf4M1; Thu, 17 Sep 2026 11:38:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 92D2680F85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789645090;
	b=lLi2WrKmGYHdDHmSm5Wo/ZsyaxXn+uvi/KvMx6SBSuDpTqHK+sWR1M0qQQHB71s9Sec+
	 ZEw4/SKNWKdzsL7lQ6O9QFYj7M4/MA9VGRHeUNxTNT9NIPgaAf/R7Cek7+2lXYBJev3WQ
	 r79OnxoaX2RkYtDdKWOGS1sM34woxR8DytLXckgluFVkhM4lvKqxYy5H2l3xFxlQkHdD4
	 h9tG+A0mWVQNjyuLVjw5xJX75dDllEhhaahCeKavoqOXM5nQGVIcDCLuhu5flMhlA+3XT
	 e9nMbKbJg4SrS9WpqnbLmF91AyA8EviDBDtr0HeZ4W3ng1ebJJ3nLzStGXXusWYuSIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789645090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/ywFhJ705EjI6sPmJ5+TlcK0K3jneDDUCtzDFrFdPCg=;
	b=IE3JEa360kVBH7Qbk4Y9sqPmnuPS0uzAY/DM9psBnxiHLkH1uEcZtXCCxdwoGaRniqos
	 jPeZZtjT1Ya290wcsAymcJxtWvqVA2HNBV6A5UwYbV+GndbcAWIMk0mxbPGih5gtC8qZX
	 bS4edk8I51T2+lGq9COW7LXWltfEp0wU0NTlG8jqk+/vaS8wvPT4VJzUGcS67uaYgtkjU
	 cn8um+iJiAg5dRhKR+yuTa5iypkSM01gusXo4E7c6sCko/Il2MCFSar/dONyfDLw559VK
	 9S7CQZJn/TbK7ZipBsCghqfuLgwNbKYtLtEGjNVR4ckm/qvWamNLDEtA0rtueuaAEbQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789645090;
	bh=/ywFhJ705EjI6sPmJ5+TlcK0K3jneDDUCtzDFrFdPCg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GDsGUCDlw3tj9Wbw2MbkV2Gehkr/mdFbVN/P+KePJ3G1xFC3roBfrD/ZZjp7qHmXE
	 yzEJM6Cdgw90dNxqRCrg+EM0f9xkSeMuzNaLbn052uteCbXrl0BqYqsp1YBNl/Qdo3
	 8bcXgUkjQjfBaQd9Zhugbp5KW0UR6NLWLGzCSN7C8tGuviQOgtFz2lzm2l1WH0BHVG
	 Yar/Ec9RwNQsVEZkTRa0tAqcwRJKHx7GIT5Jqc73fJVx+tBUgqeg3XUtTv9CWy102N
	 Ld//xCTBIjh3jgpAZ+A9V22zWKa5dxxht4AJnH9dKG+IqZ8zR+Btxs6mMo81mEob3R
	 dtFgRf1Ur6pDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D2680F85;
	Thu, 17 Sep 2026 11:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87044465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 788704027C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAXtvr2cbbAT for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 11:38:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4A34640050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789645088;
 b=X5KnlUn9kA9eC3eXlEY1OJ3MhiQtyL77SqkPjVeaMVameeIyMvPn/TEmaQphLvhIeBzA
 DetPCohTpwAlTlvsKD9B/Bwl1D2SC7nn74JRuFIoGrlkWrLyXQ+qv+C4M0i2frMOuJ89s
 iL+zy0YpCMpexaqHdrlRH4S+CRlOOLmCBzeNZbdKuTDZou/ocKc4W7Mz6fG6G8TSMnLkw
 rVIDczJTm5c3Sb26GMBME/44edwrx9buZuKZtyMS6booHqX2t8DTiWZIqZdOdrUXMb8qc
 JjFTaHlt37kQ4nRP8Jqshq3MKBDVAUa7jFRowMiNOTu6Wu8yXWZZ+ZVE1UGXJjOhQdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789645088;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=ranpHRcEFGxCphnimCn0+PZANIF7HFMn8WOM+7SgNj4=;
 b=ietsmRO8XXRAfmKLUCQXVMwWycLgj1P7UzCkglnDMmYj86DDMy8i1atjETjkRHBTdc2q
 hk2Yyi6qv5vJBbdHPIFeAiXRgptH6YXPUDYNsEI6qAU1VJ1ZeHjQQCDGhAXLEgHFakvsy
 wTWXYbxA3yw4WWFxaTq5kBoA0c8BUrMbNpjxY8Cq1+gvFfvMkx8zxivE8rZPCMvM+/NQ/
 omk0tclOzdD+FjFJHyXWQyaSFhYDhd7tOpHyGJSM+jfV6Vb7a/dp6ay/dXP+ba5k8BN5Q
 nS1/4juRH12Z3cHymA5rAakbBxT6Hvolfs7IxU8LjuFD4alwkfm+tJEljHdfEw51Hrw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=la2Ppny1; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A34640050
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 11:38:07 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254fa650c8so117952166b.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 04:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789645086; x=1790249886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ranpHRcEFGxCphnimCn0+PZANIF7HFMn8WOM+7SgNj4=;
 b=O1B+IKhMC5KwrvntjSvoO6qEaB6qd2i7G4lYA9XghXa9p8TODLkdwI3a8iQGtCr/Mu
 ErRuqGyy+C/4TfcZTH9TwyAYaFcONcMq4T6oZjlm3Wwzxt5DSFW+b0Id6QeIHZ4JWPx6
 MQ0lEpY5FKTprSYLQ+3AmnbNKXiPsD19BZbclh2CaHsqYxnYeQigYSNXrDBcytvXkSBe
 1kGvXnXe6zdYhEIIL1X02qS48BNw8cwHsE8bcTzelhdyH7drtga6pXtm66lGqUQJ+o7M
 Qj8Ori2Fl+YMM0A7QTu5Va3HSDU0P3E3+ZHXTTHJT3x5gr7Nui3qAi+m7rlUl9DCYi7B
 ethg==
X-Gm-Message-State: AFuF++kzc1Yf3ii0VQhUbuYR3VXFedGQ/0SNlk40eYgg9QoUkeZr4fKF
 1IjkQbmiPwdvUbUrTUfrEmUxxnQkcDhPq71fbjaEEtYoCH66gJbU/JrEojWiWA==
X-Gm-Gg: AYBFou0euMRyQeOF54QYOPLJ4/nwIT3rKB09wwRM9VgMT9Gx7g/0NsRvAW5P0f+PH2B
 d6FP65GfPHRGrRjSDBfL0JYUHf3ktegBAfODXXkUZeYE640/P8zt9VpQmeWjWEyA36IAj+Ln1mA
 QGMnJGPkGBqWjU0/rcXiyPNhXIdfL0kkVKYaQTc7emXcBwRj61HgpTxrVldZzrrse9LrAqMLfmh
 Ye4KnG+9ggvVlPed5fAnnUH0YPLKMZHRFh96QgZGsQtl7BsHT6yQXlWvPh9Y0ESaLa/u3yMYbAF
 qPMwl9/2jrIKv0pW3g+8Z78dkuJKFORDMwASCci8I4Gf2vH81+qULHtali2jsjeBtFn0bhrhu5m
 4e8unG0Fe9P91Kg/DK8ySnMHO6B5V+qF9cbdEIhTblFUxY/zcpWQRbca0wOWKd5lAMFCE05J1Df
 nM/j5pxugKnz7GVn5YMMA5XN2/ogD7W42MHJQKy0Vu5xwSeNGyEcelfJL+eYEzQ2RwSo9/zaeHS
 uePIqgZle8SDT0VF37NBzevXfiuD3Kp7/hoMKLUCxCBdas=
X-Received: by 2002:a17:907:7214:b0:c29:65ef:b907 with SMTP id
 a640c23a62f3a-c29e52ffe28mr432757766b.26.1789645085417; 
 Thu, 17 Sep 2026 04:38:05 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa1cfe037esm3687101a12.1.2026.09.17.04.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 04:38:04 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 13:37:19 +0200
Message-Id: <20260917113720.1297345-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917113720.1297345-1-yegorslists@gmail.com>
References: <20260917113720.1297345-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/libabseil-cpp: disable for the
 MIPS n32 ABI
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

absl::base_internal::DirectMmap() only implements mmap() via mmap2 for
the o32 ABI on MIPS:

    #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...

With the n32 ABI, the "remaining 64-bit architectures" fallback is
selected instead, which fails to build because long is 32-bit there:

    absl/base/internal/direct_mmap.h: In function 'void* absl::lts_20260107::base_internal::DirectMmap(void*, size_t, int, int, int, off_t)':
    absl/base/internal/direct_mmap.h:130:39: error: static assertion failed: Platform is not 64-bit
      130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
          |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
    absl/base/internal/direct_mmap.h:130:39: note: the comparison reduces to '(4 == 8)'

direct_mmap.h is included by absl/base/internal/low_level_alloc.cc and
absl/base/internal/poison.cc, which are always built, so the failure is
unconditional. Upstream abseil has no support for the n32 ABI, so
disable the package for that ABI.

Since n32 is the default ABI for BR2_mips64/BR2_mips64el, this affects
every mips64 build that does not explicitly select n64. The o32
(BR2_MIPS_OABI32) and n64 (BR2_MIPS_NABI64) ABIs are unaffected, and all
in-tree mips64 defconfigs use n64.

For the LTS maintainers: the ABI list in direct_mmap.h is identical in
abseil 20200225 (the version in tree when the arch dependencies were
introduced) and in the current 20260817.0, so the failure has existed
ever since mips64 was allowed. It is still reproduced on all maintained
branches, e.g.:

    2026.02.x https://autobuild.buildroot.net/results/5818407a73cfd3371cd1f726a24df6ceb9afa42d/
    2025.02.x https://autobuild.buildroot.net/results/5065bda3b91bdbee53559dd97af8ab5a63a1e112/

so a backport is needed there.

Fixes: ae0557403a3a4cbf5354f0ab1784a08623382e5e ("package/libabseil-cpp: add BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS")
Fixes:
https://autobuild.buildroot.net/results/f375584f3721d61238b9e43d9926e037802f6141/

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libabseil-cpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index d13bf6e663..feb4963042 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -14,6 +14,10 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	# absl/base/internal/direct_mmap.h only implements DirectMmap()
+	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
+	# fails to build with the n32 ABI, where long is 32-bit
+	depends on !BR2_MIPS_NABI32
 
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
