Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0E9CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BCA3606A9;
	Sun, 18 Oct 2026 10:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-N7TwbOf02T; Sun, 18 Oct 2026 10:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B2E5606AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792318691;
	b=m5mxPAPLYPetNxtgzPbJ5MeiGyaSXHxhd6azxkT+qxTjI7rZ1O5JJwawfYJEVThJVPUf
	 oGfLwM6S9rVYtpw7V8J4iT5aTfS1CEjye38p5F8FlE83BBOUQNxHKcySbci1AzfzlpDju
	 dhFRDGxvu2bd+dtkNIZt/uBNemQwEK2x3VG6d+ln07MWDwlloOSgIB2ikDNaQrlp+8tzP
	 pbe7ASKXA/jDTKUqXBFI7aOJlZ58eltbCxVQnSrUbnOtRBzPHa20CC/N6nO9QvjysOmNA
	 9QfrCfqNCx3+izYTXwQrxP82k8quxoF3v1f2NDvQBJDIPPGh6ApBq9enf+M7MxlW5pQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792318691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ugz578q8MGePDR+9M9oTPQrue1PXKJwp786aCrrrlVo=;
	b=en2cRFXOZE4KALzRWWNJde/wNC/6X9Dctq8iUVY8nSsGBaB26dk8UblQq1DNHriHfI6u
	 OCBLhD4Kkb3ybNTnEFLyRriMFNbpReeyF5mcQYhISI0SCOn/YVZiLeopRjojqsSFj8/m8
	 nw+DTzqDPdSviRIB00Xo7LWlk8E0oS1gv3ZSqDT4BP5yYyfj7DwKUBP7kIHx7Tl0PCJVm
	 iQjVhpmFuoS7+KAyxrClnZx4X3C4sUXJdd5PCTuBytwSOKmj5iB8nmY7EX7tDk1aurgbE
	 ooMCZkCuBB7+vao373C/NcftBScMWdGi/luXDzxAnQSqmz9JZ7h8sXDirSWRbXI6G9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792318691;
	bh=ugz578q8MGePDR+9M9oTPQrue1PXKJwp786aCrrrlVo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AOSEcCGJ9YAYZW/evpQq0QYtQa+eLW9r2qRZlL5aeYy2IFJudUklIddD1RIaAbtvf
	 rxtSXKfQQLSktS3sAPX/ArspuIuzDJH2eX9Jnf1rSeRLaXo2uL8RNACvSGx/L6ZZUt
	 4/bTtRcB/WZQ8xeTSJJTya4M+Opv7PMb+lZ5hRojf+npeGHcxGrwidDofCgWQTScL6
	 V8IbC+qLatRSb2pgTHRCayzj04cnMBtinS74418ce+yo/L2b/46hMigJbevN7PNh86
	 irZgPUCk6gtx2RuxOw3GnWyaJ7DGQJNRd6kKOhzwPw6pheOJifKD7uM7CcSK3mbw+C
	 X++3rdqC8L7WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2E5606AA;
	Sun, 18 Oct 2026 10:18:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 390F3263
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EEE38115C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZVDIqY25lKU for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:18:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A58A381131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792318688;
 b=WpNzpaALGzKL6C//XhX4vQc3Pfp7sjRsCtgi6+xKRV1XawxPjnc8iZX6FgruGz8ai1m+
 Y5ADWrHLB2VXJ+qClra8ykYF+Ngpkwx/WPWbAn54rR9Cd0c1mb2TV98QbuqI5oGh8qhxt
 MrYaC+9mjR+enQh5KAMhReibtVQYruOE+yHHUT/eJB/AEjGCr/xQLhARiHuFWjvrnF+9n
 JYt1loB8HIc977ONPhz4Axh+1evGGeYVi/nxeCzeBrm8zcNDT8ECxxp/h12QVqPn0pAIv
 wD/xuwYg5y1z8jkc9Tc+EfZwGzCE+0JEJ0gTTPQO4wXlwle7S5i6Er5KheCgU0KoQrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792318688;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=cypjL3tHmUNKxxskMkd8GfwfCIpNollhHom1tQRytLU=;
 b=pChn7eMfFi8bmqmbMZ//7fBrXC2aR5NgXw89I3cZ05JjnGG1Vu+gtLLeJl0S4wUeKooH
 m0yEgf5zGV5ufcPhUBgL1vmDbVP3NyyyGftKOHtLMZd7762svulr9H43KBUmBERsibojd
 AauJVDC87TBzv7MHcI+KC2byLsilLsCT381779lIVecr/Y/ffzVmJWbt1O/YBVnENDgHk
 RBwySIRSeRfvU2+aNsydzBrwrgsyEcCuBiHkSXhhRohgwlrLJQDZgHTsD+4T+82BYWYx8
 xIOJ2uDFvdsjELzr0SoPbdsO2+/xk8LBe4V0fdix7OJrLZg2VkyKD7IwTS07AE9ZSGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Mly0aexE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A58A381131
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:18:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a1df4c0966so3464445e9.1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 03:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792318683; x=1792923483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cypjL3tHmUNKxxskMkd8GfwfCIpNollhHom1tQRytLU=;
 b=Ml+ZhMpIU/IqnIendMQ12ULOgmrbB58ZpibmFjN8TPvXXwjisymTvk0Igma94D8z99
 F1/M0BpGhow0zlkMYJrQ+Oh7QFLfujgCaRWLLp4chUp2b6rTOC5IrK22WBOYvoGnIiZd
 a2H31VzDYQnKbmYgxXgthiZ6KSDbvCfMuWaLb3avf6Ga5uRsaYlbdPCLgrB/tQ6RrVEy
 TD7BvEVFm5ZktqhFe3vOxbSoy1nsN4QlLQPh9vqLy6q3hPRb+XNAyRiRlWqtUPTmtnp6
 sE2TT9dU3EI5R0q3JSU3sIQq7UQxS4+E5MPXearMyct8hfJqqjFiyFGwmNbdzJw56GPa
 glkw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3cTa8ikMk+GF9gHndJwNy4xDrYKedyGQmh9EyiJQzOBBK4Wm9gTrvT7D01zOeVTloPNB44hSDblg=@buildroot.org
X-Gm-Message-State: AFq9FYJfvTzJqm4A2cbj7+iXD7c27+rNe4dOeaoRCq2AIxLULoSX9Ozu
 LYs9eoeixeTxyxUZncfpkLGhMO/YCZ2LOAxd+FZ9gjtz2CPkLPFXej1oblS1kddWWnmOvccghQ4
 N0Rk8
X-Gm-Gg: AYBFou1rV53DFZljQXEY9U1V0jLom0WhZe1GHFawZ6ZcBNwFmSBC2BqNkIrLShrdSIH
 BsGx3oc1JZhNZ4PZrX2+JSR77NTuCpQQZmBOUUWIjFpvUtz3Qga5JT9raqc0X5n1OiK+n/So4i/
 bdevOIk3MxbHAARRZ0FG0cbHm6+I/CQ+B2dj1auo3hiKC/8HeyTdkCfhTt09SfsTIzUGfK4pYy7
 pxzS4RR1Ru/RAtpCnLWh6xz4LjhMYn/sIBVLcgC1ZWUcH0I+AXSt+ZPDWrdlGFYAB8NmIfsfGlK
 Us7G25ont9G9qS9ToNKbW0eVXYHOCQjbCsQ5zr5795WEL5af0UjiwMByEMJo20QKGaCFWGFAAgt
 3qhCt6W2sVTBzUdqKe3F92QeteWOiM1a88LDeVz0QiVznCYck3QL7u93KWpeLUaIiL9rPUsdR5o
 LqYRDaVnKcaRA0Kdnhmoo6yMpWW0DnAja+kK6/mhyCr+K78JqIIdX7Q1VP0S+Zay4=
X-Received: by 2002:a05:600c:694:b0:4a1:9c98:b9b8 with SMTP id
 5b1f17b1804b1-4a1c66bd9aemr122367625e9.11.1792318682781; 
 Sun, 18 Oct 2026 03:18:02 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4d4dddsm15781948f8f.22.2026.10.18.03.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 03:18:02 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:18:01 +0200
Message-ID: <20261018101801.263264-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atSRYnTOayKlrbjq@waldemar-brodkorb.de>
References: <atSRYnTOayKlrbjq@waldemar-brodkorb.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/erlang: enable uClibc support
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

Hello,

Also tested with the erlang test modified to use uclibc:

```diff
diff --git a/support/testing/tests/package/test_erlang.py b/support/testing/tests/package/test_erlang.py
index a765cec843..e39bd94b4e 100644
--- a/support/testing/tests/package/test_erlang.py
+++ b/support/testing/tests/package/test_erlang.py
@@ -4,8 +4,15 @@ import infra.basetest
 
 
 class TestErlang(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+    config = \
         """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_ARM_EABIHF=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_ERLANG=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
```

Reviewed-by: Thomas Perale <thomas.perale@mind.be>

Best regards,
PERALE Thomas

In reply of:
> uClibc support was disabled in commit:
> fb72418160417e9e872f626c356f898bff49cf48.
> This problem is solved in 1.0.59. So in internal
> Buildroot toolchains and external Bootlin toolchains.
> 
> The change can be backported to stable branches.
> 
> Tested with aarch64 and external uClibc Bootlin toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

> ---
>  package/erlang/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 724f91123b..d3fe0dbec1 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -15,11 +15,11 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	# erlang needs host-erlang
>  	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
>  
> -comment "erlang needs a glibc or musl toolchain w/ dynamic library, threads, wchar"
> +comment "erlang needs a toolchain w/ dynamic library, threads, wchar"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_UCLIBC
> +		|| !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_ERLANG
>  	bool "erlang"
> @@ -27,7 +27,6 @@ config BR2_PACKAGE_ERLANG
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	select BR2_PACKAGE_ZLIB
>  	help
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
