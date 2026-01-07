Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C3ED0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950458238A;
	Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AydECzEXcHgS; Wed,  7 Jan 2026 17:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD71822A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808279;
	bh=hZ3JNDuZqxNy9SmJh4V5a89Lw2RE6VOMf6uz4fdE2tM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bnq2S04hDH8Fb5l8l1w6QujGXOfpJrF46xWDYs6vhFZK0cRuh29pjsoXlAOi+S8Vp
	 osdYeL4UbO23klcjjhUzBt+pJRTi9CJOTpb6elxoTT0aUD3FLWrrBa8rr6TlzAAegW
	 DF5Nh45fd35J1yzYps71UZejpV/diPr//KlufwjqHtSRelagYOZHPnI6TaC5VvfF1t
	 0ZsHb/3LJxlKHA+N4Bpi4rMpQiahVytyAQb/KKE8Pd/r7nCoCT5E3ptvS0gSwfRM4c
	 oxfmOIea6rZSmQbAMZdk4uOf3hLjVe37hmjwV5CWergkJGmVd4OuDXUDfuitNDXRI3
	 ecnbULA1OHhFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD71822A9;
	Wed,  7 Jan 2026 17:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 378E525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 295D5811CE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRk8nOTb3bfB for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16988811C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16988811C5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16988811C5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E7F0B97A70C; Wed,  7 Jan 2026 18:51:14 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:12 +0100
Message-ID: <20260107175112.227614-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227130610.163006-1-thomas.perale@mind.be>
References: <20251227130610.163006-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808274; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=4aR4mxoPIEAAaDS1jfqVYpbiTx491QN/m7QaeZeeD74=;
 b=fxJzZNz82sYn62xR9hJjuGCNg/RFqtHtF3aRpS6I1uMSJ5GkFmy6kmvCLpMEavROtw74sn
 Fp0TnWoXWAyI71ceD5h8vqnM79IvAkhj5lWO77zdCsygqHSsCAkCr2yP2wVmCAgO+QjwRd
 boo9DWQEOVb3twcKWiDyu2l+LC0VsrA8flVkfMe4aSswGQevePKFvOviJ9phP8EHtodr8h
 RORV3+QwGj47hsh42nlsiiQUqP7oPup0xTKiajsfF9fpLGK+5yAaposF/aUue/6h6AT5MI
 ohznKl31FjfEF3AazCl8AiL7mnOgpoB81yfmae46u0+zjeGTnD7vecmrsLEq6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fxJzZNz8
Subject: Re: [Buildroot] [PATCH 1/1] package/linenoise: add CPE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The CPE 'cpe:2.3:a:antirez:linenoise:1.0:*:*:*:*:*:*:*' is valid for the
> package linenoise [1].
> 
> Since the latest version is '1.0' since 2015 the CPE_ID_VERSION is set
> to that version.
> 
> The CVE that applies on version 1.0 were checked with the 'cve-check'
> script:
> 
> ```
> echo '{"components": [{"bom-ref": "linenoise", "name": "linenoise", "version": "1.0", "cpe": "cpe:2.3:a:antirez:linenoise:1.0:-:*:*:*:*:*:*"}]}' | support/scripts/cve-check | jq -r '.vulnerabilities[].id'
> ```
> 
> Only the CVE-2025-9810 exists and that was fixed in [2].
> 
> [1] https://nvd.nist.gov/products/cpe/detail/10423C23-6AAA-439E-B723-1FCDEB3A769F
> [2] 3c7cbf97d7 package/linenoise: security bump to version e26268de5e
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/linenoise/linenoise.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
> index 05f8aa4845..29bed3ce4f 100644
> --- a/package/linenoise/linenoise.mk
> +++ b/package/linenoise/linenoise.mk
> @@ -8,10 +8,15 @@ LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
>  LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
>  LINENOISE_LICENSE = BSD-2-Clause
>  LINENOISE_LICENSE_FILES = LICENSE
> +LINENOISE_CPE_ID_VENDOR = antirez
> +LINENOISE_CPE_ID_VERSION = 1.0
>  LINENOISE_INSTALL_STAGING = YES
>  # Static library only, nothing to install on target
>  LINENOISE_INSTALL_TARGET = NO
>  
> +# Fixed in https://github.com/antirez/linenoise/commit/880b94130ffa5f8236392392b447ff2234b11983
> +LINENOISE_IGNORE_CVES += CVE-2025-9810
> +
>  define LINENOISE_BUILD_CMDS
>  	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
>  	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
