Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBAD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45DD8842E8;
	Tue, 13 Jan 2026 19:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yazGZjW34yDz; Tue, 13 Jan 2026 19:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A44484310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333627;
	bh=78qQ7ilb0graKOtcUCfgU3NXQ43d06eLi6GPw97iyYg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vwv7InAHdCtcbIHErebCvO7QAt8d0NkQWWl3IARMYPhv/QIqdBluIhJ5Bzmv2h4d1
	 1tf+PKXOP4KU4Uj7gfbNX8qJpVklEyfG9qL54ygGiUWU5EBCFKymHAvS1YjteFA4Ti
	 2dsT39I08eNWonNDJ79vyu2lcu7iQYCQWC2y6cDwYek+cGY+222QiJ4UgKJ6k5f/kv
	 dvlhYeHASzzrVRKrJaS49BmWIrNvZw5eqykPUknAnaal09Rrz/sKJjSvXaqSxgxP9h
	 W0aZrJDzGNKIzVRFEXANEnr1fXWpzqZlySHReJyeY0NM/p3JnGD7FLtmtTlkIM/pcW
	 LK/OgtonEbk6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A44484310;
	Tue, 13 Jan 2026 19:47:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F611C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 585D560BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaF6YJVDLuiJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5100860BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5100860BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5100860BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37321B97A863; Tue, 13 Jan 2026 20:47:03 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:01 +0100
Message-ID: <20260113194701.99334-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-9-thomas.perale@mind.be>
References: <20251230081917.18676-9-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333623; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=FxF73kQFgbOQzoMxdEpkRpwPbbBPnEm0YpukSULguag=;
 b=gc3jhf4uudzRhugbLf5LgEDfc06M+Wm3uI76zh8B4dEXCm6oIUOjWlC+KglwonrxEoxFZI
 deW8CZfzESeyqMWcuvjzYKhrzWoNFVLghfUIVz6ZZS3kzicbg5XWSULlj6nwmLnqiTtM4g
 YjGwLqEUIj3JJhT3NbJjrRyjYl9sOUF9kWZiO09u2o683893prFoMHCUHJQMRAQVzrqIKh
 zfV/UsUTW8k2dIhNjdZoo7GpZU8vi8MZl2rPeLPjO2Q2Zc8nDXureCGhOgRYgh0xg4BGV8
 pddDEqraley1q1oA7SImb5ORJqewqL+tOLNospouEGmiErKbcWvTaPPufKaiPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gc3jhf4u
Subject: Re: [Buildroot] [PATCH v2 08/15] package/libssh: remove stale
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
> The entry was added in commit [1]. But since then the NVD database
> updated the version end specifier.
> 
> This IGNORE_CVES entry is then no longer needed.
> 
> [1] 51b1e1daf5 package/libssh: ignore CVE-2025-5318
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libssh/libssh.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index 2be9013454..3c7e77a206 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -17,10 +17,6 @@ LIBSSH_CONF_OPTS = \
>  	-DWITH_STACK_PROTECTOR=OFF \
>  	-DWITH_EXAMPLES=OFF
>  
> -# NVD database is missing an upper version specifier.
> -# This vulnerability only affects libssh<0.11.2
> -LIBSSH_IGNORE_CVES = CVE-2025-5318
> -
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
>  endif
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
