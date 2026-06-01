Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F0CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6F240A41;
	Mon,  1 Jun 2026 20:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAZRjdVQL8Qp; Mon,  1 Jun 2026 20:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9DA540A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780345635;
	bh=PdkW4/iO+MruqZCRff3rk4iE80C5NKyNIjs0qYJ2WsE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Wmz6MP+HTs3BvCJ6/qdFioUE7KIoXs+ZRnuC3NBhqly3nZ+jMZIbqlKMkLmX98faB
	 GL4V54ta05GSZoNAmugwA3jshXXU94xLG9k5+tDAenjTaENV23nut74RNxwwwFbQ3f
	 P89vHu89YR1Kn31Uan7sNWn/bsZCyuLczCU2RGsQ/NP8txQh9GSq9zjQ54a8cjVb4Z
	 jaKQQqH/CIae9HAlSIw7dhenw7wrzfe6w1fafxOrNpVrxByLAuh9pijoShihOCS20N
	 o5T1J/DmDIbmrRphTznE1K3i7JOdQPJUSGnM+roMD6OzCaZDQ9F5cAcar2yFe9R4VA
	 zCzzmAw0oT51Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DA540A3E;
	Mon,  1 Jun 2026 20:27:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CB69223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E2440A3E
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aKtP3GzCfCb for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6325140A3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6325140A3C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6325140A3C
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:27:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C316B97C76C; Mon,  1 Jun 2026 22:27:11 +0200 (CEST)
Message-ID: <59f5a749-6fb6-4459-a54d-2390beb532b8@rnout.be>
Date: Mon, 1 Jun 2026 22:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260529161826.517403-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529161826.517403-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780345631; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ypUD7fnq546VHKC3ahkEaUP5uO6y3hLuRPvmh8wEHMQ=;
 b=Ov1UN4qv1cdWFSiJG7ETAotSvY2YFDXXPgXNV+uIopg4Dq060Vgb4mzlWb8z1RtyqRZc4J
 Vy+wes6xIvX4xZrCOEzLO4aisbvDh3wnXu0W57h4ZEgBoVIBiobPqfWNBJtQz9hiF96FpC
 y3DIenKC0aemgUVogub9bL3+k6wF8hD/w66t5vnHnNKcrtCP4f/NVHQ3k9eaItcXw81r1k
 ArzMNyaOBe1WKzPdAsPl/VWYJ7KROKFBId3VtiXWjYjFlEU9kNGFkYS+gI4txuJi/jfizU
 0S0DKJwfBZrznACFkSbTtUs5uuUBzKqc+TFMd0KFf4LrWxtZsW8g9o+koBbAxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ov1UN4qv
Subject: Re: [Buildroot] [PATCH 1/5] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Thomas,

On 29/05/2026 18:18, Thomas Perale via buildroot wrote:
> The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
> in [1]. The IGNORE_CVES entry was removed while the patch is still
> present in [2].

  I was going to apply but it generates conflicts since we bumped busybox to 
1.38.0 on Saturday (though that patch was already pending a couple of weeks).

  Could you re-check which of the exclusions still apply?

> 
> Re-introduce this IGNORE_CVES entry.
> 
> [1] 75c594d446 package/busybox: fix pending CVEs
> [2] f88537c46b package/busybox: drop stale IGNORE_CVES entries
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   package/busybox/busybox.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index ebe169cdb9..7e0b3d5766 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
>   # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
>   BUSYBOX_IGNORE_CVES += CVE-2022-28391
>   
> +# This is not stale just wrong NVD entry.

  It would be useful to specify "This is not stale, NVD incorrectly says up to 
version 1.3X".

  Series marked as Changes Requested.
  Regards,
  Arnout

> +# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
> +BUSYBOX_IGNORE_CVES += CVE-2023-42366
> +
>   # 0012-archival-libarchive-sanitize-filenames-on-output.patch
>   # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
>   BUSYBOX_IGNORE_CVES += CVE-2025-46394

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
