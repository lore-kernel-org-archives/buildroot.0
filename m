Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E209BD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B682940FBB;
	Wed,  7 Jan 2026 17:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1N5OrjZOkggZ; Wed,  7 Jan 2026 17:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E189C40FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808334;
	bh=Q/FMswdGNzdf0lTSKzknEFf4HCqSwxf1CipcFuHslSs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZdxWx/F1TnaFYpZCp/vcgOV7B5/rkQRl85lJE6r4qwRbvMZFmwVFKuSber65kIZtW
	 mROKIiot7WdMhfgWhqABttim9HUZPjBgelTUXijZNG7cP6dATJkU75/Z9L+BNBMWaX
	 WQfaJhZUpGHX1Q6rtaoXPKKk9fS6ZS3Ud/nZHlYlZKzphNeCnLeYIeYhYdm/rmETQF
	 KBitT9S0CKkkF2QYegpugKrJgcGwVCA7SQNjkR3E3ovh67v3oQw5Gs8kOzS3H1VWFo
	 FuJ1+UZrvmMKLAI5H9CzkUZNNkAWwO6KVxriFjl6X9UJoKvS6K7rnuaeDd1J/o00AQ
	 iH7F0GhS7x3IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E189C40FAA;
	Wed,  7 Jan 2026 17:52:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0200F25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD91040FB5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mvEw_yeR8rH for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B21A40FAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B21A40FAB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B21A40FAB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66699B97A704; Wed,  7 Jan 2026 18:52:09 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:52:08 +0100
Message-ID: <20260107175208.228764-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-2-thomas.perale@mind.be>
References: <20251229090719.13291-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808329; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kviXHDYwoJYdksfVkd0gWTaEz9vfKjY+uST/3fNYu+Q=;
 b=JILZjSa0KBMmLXqzNi8cO7UEej/jomNyOiI2FbLLxsHb2kia8FRnxj/xYdlZ1yv5xu/L11
 rKtSvp0s3Sa8WLIpQB7KpEyKgppCW/SRRSMmPGzqBCqhPkHoAtXdJ5bcSpklpAhYmFIQvM
 jE0RqzX0ECC4JxfwBsfZlDMiy1hjTDTrD6M0umGhDg7CWvjO8D9izCPqpi1lgiEs2MBUcO
 XmVnYFcGBOTywJvPZlzyln9yozxcNtsw8yM4KIJPuq6SpdqZV+VRqa/EIjERA9l6jH9oVM
 IHgIDS7fFz1og7AbU5YXkf+rNMZ0awqA1uXoV9AzVdCXcpH7mT8O6/qP8Zm73w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JILZjSa0
Subject: Re: [Buildroot] [PATCH 02/14] package/x11vnc: add CVE trailer in
 patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...02-scan-limit-access-to-shared-memory-segments-to-curre.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
> index 05977375d8..015a8c4c41 100644
> --- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
> +++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
> @@ -3,6 +3,7 @@ From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
>  Date: Wed, 18 Nov 2020 08:40:45 +0100
>  Subject: [PATCH] scan: limit access to shared memory segments to current user
>  
> +CVE: CVE-2020-29074
>  Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
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
