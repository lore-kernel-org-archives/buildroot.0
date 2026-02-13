Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A41EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686EC41F76;
	Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTUtF2NoY5GF; Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D1F41F61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011450;
	bh=kKafXQNgJcTdyIckQe2GmBudQ2sJvohIdGPQoXV8efA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aq7BSqvzRXDp2pxkdt5FppzjuKVnTg/HSKQpkfD/0mp9dzpmaht5wB1UrMah+8tXP
	 s/+1TDXFDCZQjz6eikca5z5QOd9xZFIUpr3La6fidrgN55sB61pWcxbJ5v3WVASeJQ
	 RCKawZfgOSVmcu/YcATv395uc/bEuzlyR/cTuBh+m1N1DmFbeck7OwxsrrCe2dTABI
	 JA2eWJxIG1MldZ5rNpaeofb3v+2SSacOfnW73bjWwzTJ9txCcUawxsQs+FHtukdWCS
	 aHOSdn2kJ48K6j7scAIqXtlcvubVUjLZyyMiFge4ta0QiUmzN8hPKAF20895qezBeh
	 9LCECwWoTVGPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D1F41F61;
	Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26745283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B4A40380
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3txcr-5V8xAA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D7794035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D7794035F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D7794035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43638a33157so1188677f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011416; x=1771616216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ps/qijTk5vgUxg5+3Thg4pJAAB13VG1FeV5MDqN1Mpw=;
 b=PBDpAfwAw8CHam378OBJZ6yzbSmYo2DeYJzYivw1jl7qVc3gG5TuP+yaaduuDL7ZPw
 1ApPGTZ3ms9nxLHMuzdN/PMkrFwURSmfyLfKSxI0o4JBEMoUvaZbABA/7XNJBCWcQz6g
 lKYtZlgUiC9DQFyrjzczGzpcftc2PC+Ca2vggl0tNY/WtXMj6xUt8dvv0lj9Ftf9uYBG
 q5j2QT6hiQy7x/bWn7H8fleF88IADQkEm0k4e69EKcZsV0wReJBW2a3c9cd1ziXbmcYD
 KRVZMGDn0lRaxrWhpaOjEdV9geKDeErYiRlfpebgnyqIw22HlU4VbqnSX/C+h3JNIPm8
 1z/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrRUOJ45aO4ZJXdnIYwnQo39DH8tRRKy06MEm3iDN4MyzJuuYzosLru6xYQWoQAiQMYbKmfZySZ7Y=@buildroot.org
X-Gm-Message-State: AOJu0Ywjdhm3KAk1YrmIjYwxtAgHYzVX5PBwj0shl+ynGeqD7Tq6SpQT
 Ai5kL8oKqY3gxl/qutTshSFCWZ/eJgatgAah/GzbP8SbpF0BU5q4TeOulhEHO1UFCkU=
X-Gm-Gg: AZuq6aKh9C2aUP/GOYh22Nwc2jPsHWNd6bDPQ2IiLV35E2x3GXCONDUUqCU53FMXoGp
 DN1yYD4JdJfwjcpxdTLGQnWcRJgSxy4UP7bmT319BgethkeKYY5f9vI2dxpnl9An3upGJaRjBkT
 BlDgGiqNZCKcY2U4Mtnofea8xkZqK/Afgt/lvYGqM7A0y8NchFaTUxWHJ4JqwkD5AnvsH5zfBHk
 ztbHBGHnkFCPCHTINMtYsjEmXvuANvYFrMZl6sLMlEzt5/qo5ZUG0ASrLKrlWGPXNf1VC5Oeb4h
 yqUdDAB+oNdruNwplh4FS/URh2bCLaFmcoUF5U8V0TD45j5iXKEQr/I04DIAtGmySKl9PmhXYRv
 GoA5ffoY7DRbWT3Va0Dkxdk32ANqF4UWQcxPF1aJxdsldnhKW0XFTlccG96s7PWuz7Fv7K/kafD
 0/0THcbVn3q43Q97fgrVZZo4KUEw==
X-Received: by 2002:a05:6000:1883:b0:429:c851:69ab with SMTP id
 ffacd0b85a97d-43797943548mr5383777f8f.55.1771011416439; 
 Fri, 13 Feb 2026 11:36:56 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm8147505f8f.27.2026.02.13.11.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:56 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:55 +0100
Message-ID: <20260213193655.38611-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204073238.472889-1-bernd@kuhls.net>
References: <20260204073238.472889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011416; x=1771616216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ps/qijTk5vgUxg5+3Thg4pJAAB13VG1FeV5MDqN1Mpw=;
 b=EGq4AemUjsI1f9Fh7zwVROgKyItyvzNnyqC9XjCbBI25g/B1pxgkCO3/Yf1mV1+clT
 W53ick0bHeDH0ZyCtj6IV0iucTTLBWzz0Hun7Pxqkg8oKDZR9tmMlcz5M16uoA9BvHeW
 rwv38SVSDFqSQVMFITOUkRXgw8imX+HxcnjBnDB/QWIKsNrb3XQ2hBHQkKBc9a1wz3rx
 l+zeELh/9pFXnnN0UJXvRUS9bhiEJRnLIspHire156f5nn1eCcaqQ1OkiyBPaRRaaH28
 lS3K7y5rfrEN5s1G+REHsc5WtyEnyrFRcALN0pVL2rZrRx31kpx4YDZYlohu8mMqtGev
 4Nwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EGq4AemU
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: fix powerpc64 build
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
> Buildroot commit f710640be5869bb3716e254916ae614f79002f2f bumped the
> package to version 3.6.0 that includes upstream commit
> https://github.com/openssl/openssl/commit/8f24a148e6f112045cf110c3e3f4e2415d9c11fe
> which causes build errors on powerpc64.
> 
> The upstream commit was also backported to older libopenssl branches:
> https://github.com/openssl/openssl/pull/28990#issuecomment-3675219918
> but its first appearance on the buildroot master branch was with said
> bump to 3.6.0.
> 
> This patch adds an upstream patch to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/b28/b286ad40f2240a85b9cd0dc44e089d1d6babd3ea/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  ...ppc.pl-Removed-.localentry-directive.patch | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
> 
> diff --git a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
> new file mode 100644
> index 0000000000..7c507a2687
> --- /dev/null
> +++ b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
> @@ -0,0 +1,69 @@
> +From 5aaa7e5fdc59e88a13d2911cb86d814d4e2669da Mon Sep 17 00:00:00 2001
> +From: Danny Tsen <dtsen@us.ibm.com>
> +Date: Wed, 28 Jan 2026 07:23:13 -0500
> +Subject: [PATCH] aes-gcm-ppc.pl: Removed .localentry directive
> +
> +Otherwise there is mixing of  ELFv1 ABI and ELFv2 ABI directives
> +and PPC64 big endian builds fail.
> +
> +Fixes #29815
> +
> +Signed-off-by: Danny Tsen <dtsen@us.ibm.com>
> +
> +Reviewed-by: Paul Dale <paul.dale@oracle.com>
> +Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +MergeDate: Tue Feb  3 08:39:50 2026
> +(Merged from https://github.com/openssl/openssl/pull/29827)
> +
> +Upstream: https://github.com/openssl/openssl/commit/5aaa7e5fdc59e88a13d2911cb86d814d4e2669da
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + crypto/modes/asm/aes-gcm-ppc.pl | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/crypto/modes/asm/aes-gcm-ppc.pl b/crypto/modes/asm/aes-gcm-ppc.pl
> +index 68918a9305a2b..fd5dcc22a6117 100644
> +--- a/crypto/modes/asm/aes-gcm-ppc.pl
> ++++ b/crypto/modes/asm/aes-gcm-ppc.pl
> +@@ -409,7 +409,6 @@
> + ################################################################################
> + .align 4
> + aes_gcm_crypt_1x:
> +-.localentry	aes_gcm_crypt_1x,0
> + 
> + 	cmpdi	5, 16
> + 	bge	__More_1x
> +@@ -492,7 +491,6 @@
> + ################################################################################
> + .align 4
> + __Process_partial:
> +-.localentry	__Process_partial,0
> + 
> + 	# create partial mask
> + 	vspltisb 16, -1
> +@@ -564,7 +562,6 @@
> + .global ppc_aes_gcm_encrypt
> + .align 5
> + ppc_aes_gcm_encrypt:
> +-.localentry     ppc_aes_gcm_encrypt,0
> + 
> + 	SAVE_REGS
> + 	LOAD_HASH_TABLE
> +@@ -752,7 +749,6 @@
> + .global ppc_aes_gcm_decrypt
> + .align 5
> + ppc_aes_gcm_decrypt:
> +-.localentry	ppc_aes_gcm_decrypt, 0
> + 
> + 	SAVE_REGS
> + 	LOAD_HASH_TABLE
> +@@ -1032,7 +1028,6 @@
> + .size   ppc_aes_gcm_decrypt,.-ppc_aes_gcm_decrypt
> + 
> + aes_gcm_out:
> +-.localentry	aes_gcm_out,0
> + 
> + 	mr	3, 11			# return count
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
