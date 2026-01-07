Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AC0D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF6740CDE;
	Wed,  7 Jan 2026 17:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZ4l4lYXRSyT; Wed,  7 Jan 2026 17:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F73040ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808141;
	bh=uKTJvs97yrmxvB+0W8B8Ck9LWW9leC4CDwN9rcmxNOY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XbAD1Z/2PMqjwgAmxA8Oo68dnVIoVSxZKLFty0NIcW2txJargugAiQPlOPfig0Nj7
	 VODpKIZQ7/q3EDYnmYsY0bzBzqZ8ybUjQwC9mQAcMqVqVSvjWvXOF37xgaMFc/ClM1
	 0g3u+tatlF/nZJtxqhEHv47QvjBudcFKQqv+ZGjVegh2B/TOD6eACir2NNwil3FKwd
	 eb2T7ui91zzgSiBGn33rHAYZE01MdugmLgnNErXSADtnsnMTExdDjocgo7rkxmzKDe
	 ZXVEuqO5WUyR+N8i29jlwLHu1qGsMUb94Iolm1OeKg4Cf7O53cge6jPhTBjFr6x8rZ
	 w35nRIma6bW9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F73040ACF;
	Wed,  7 Jan 2026 17:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 314099ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 211D4607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuqExaLYSYDq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DE206083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE206083D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DE206083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32CF4B97A596; Wed,  7 Jan 2026 18:48:54 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:52 +0100
Message-ID: <20260107174852.224612-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207130030.3668435-1-bernd@kuhls.net>
References: <20251207130030.3668435-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808134; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=CEa2YVirjAbDykoS1KFgscDlAi//fpDFjvIYs4/P27Q=;
 b=LrVmuE2sSXHzT27ji4NHcsenf6eg9SFVxolkF+O/CmaAQLz9K+qITCXYBu+YJQzpOCZdeS
 yh+g9dzW1UlRp1xBGPjMEwlHL5FaQYq2Y04K8Wy6HAJhpBJ19nQFs9WT6l1eW1hIDv2v+J
 b1apeZ3SV5FEwTS6xTx6aXodHfg+g6BrGWob9DqngS1hJG0/eU2c/SlmT9BmE7qnDcOSoY
 27+DhNUc5nSiSBFm5wwHlIb4EPCb+SHFXfKopDY7RptfTAm6ZOzncWpNEv/JO4kCuXWEWg
 Z0+KePv+Vwq4vEWoDMOL1CgiajpYIkoYmO6dHONQ6neqb9qLJbRBXxedkFHKLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LrVmuE2s
Subject: Re: [Buildroot] [PATCH 1/1] package/xvkbd: Fix build with gcc-14
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
> Fixes:
> https://autobuild.buildroot.net/results/86f/86f2ba051e864375bda620dd92e01cb7b8532ac3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/xvkbd/0001-gcc-14.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/xvkbd/0001-gcc-14.patch
> 
> diff --git a/package/xvkbd/0001-gcc-14.patch b/package/xvkbd/0001-gcc-14.patch
> new file mode 100644
> index 0000000000..6ecce1327e
> --- /dev/null
> +++ b/package/xvkbd/0001-gcc-14.patch
> @@ -0,0 +1,19 @@
> +Fix build with gcc-14
> +
> +Upstream: https://sources.debian.org/src/xvkbd/4.1-3/debian/patches/gcc-14
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + xvkbd.c |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +--- a/xvkbd.c
> ++++ b/xvkbd.c
> +@@ -15,6 +15,7 @@
> +  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> +  * See the GNU General Public License for more details.
> +  */
> ++#define _CONST_X_STRING
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <unistd.h>
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
