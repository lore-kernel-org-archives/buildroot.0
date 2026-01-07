Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA1DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5B541272;
	Wed,  7 Jan 2026 17:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HN3XL8zNVj-H; Wed,  7 Jan 2026 17:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77E641276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808573;
	bh=04f+GXmRMd0Me3bz6WcDyUp1yVxFfU5KeX81UzPwhcI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FLg1sA0y6svneg8eztfpAcPJEpVEi0vNXJI/HcxZH3au7/lanaVKScIKyM7P8Tldz
	 VFs8vg3IhnM8OQ4TF7mNiYumN0w/aS1BJimXP6TotLHkXCfx86fbJ1mFnXLA7QScw7
	 +n3TUvC9DqGM4Wa0TjNddMpmKEOVwW2gYzAqeoY2IQd0MSGevLc+8dKGVvJQgLXb9d
	 Q/eghJ8hg0XheDqLhL3h0F33POiQ5LJ6IYBhoD33DNQ5b0PM8vKHTZArcsBSIwzQDZ
	 wbj904ZX+GqB2dAnNvtqztbVlyOMdf/rwgCiQww3YiEWgTMOErSgRWmsxAEtxam+nM
	 3bDVq4ke06J0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77E641276;
	Wed,  7 Jan 2026 17:56:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE619ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3089F40263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqhxDs64-eqp for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FD3240128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD3240128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD3240128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 69D6EB97A70C; Wed,  7 Jan 2026 18:56:09 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:56:08 +0100
Message-ID: <20260107175608.230832-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808569; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=77PsBj1IqJf2HjoMROsN20I57TMqFKBy21VELc87V3Q=;
 b=Kj8ssa447Z12+JAa/VG6oaekYs8edkroK+XO6gHV40nxnfyFvwLJdW2CGNw7ScaN5rJfyz
 Rpt5AB+d3T7yanFmdKDWmgBZGVj09XOqlZrK8W8nrto2dIj2lJnqw6xlQrbu3FSQb0FAK+
 lpw8js4MCovYgFitouDB1D+yhWUyKs9FP+t7xryTdJnzyR6WzlAwP+FIfeVmDgzaXazDU/
 NAxpuV/a6R8V6dHqWoJzFZaBeHMjhxuVW5XhqaSzgJ4+Fcq9BF7RY56/MvjEvs+wmP+bt2
 tP0FCe8zg//gMmBLWq12GdwOeyugJYeEDXOxiPRpGJHlYDn4qrjcELkkJ/Wypg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Kj8ssa44
Subject: Re: [Buildroot] [PATCH 01/10] package/cpp-httplib: remove stale
 IGNORE_CVES
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
> Buildroot commit [1] removed the stale cpp-httplib patched but the
> IGNORE_CVES entry wasn't removed.
> 
> [1] 8988278241 package/cpp-httplib: remove stale patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  package/cpp-httplib/cpp-httplib.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index 62255180f4..ed5c33d2a5 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -13,9 +13,6 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
>  CPP_HTTPLIB_CONF_OPTS = \
>  	-Dtest=false
>  
> -# 0001-merge-commit-from-fork.patch
> -CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
> -
>  ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
>  CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
>  CPP_HTTPLIB_DEPENDENCIES += host-python3
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
