Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB52C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8573D40918;
	Thu, 12 Jun 2025 20:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVJ5Y4U3kIZV; Thu, 12 Jun 2025 20:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9441140926
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9441140926;
	Thu, 12 Jun 2025 20:09:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3C431BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9EFF60AC8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBxudLUBJLhi for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5C9560A4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C9560A4B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5C9560A4B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:09:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAA1B1C107D; Thu, 12 Jun 2025 22:09:23 +0200 (CEST)
Message-ID: <e2d6598b-2cf9-42e3-b930-e3301d4c342b@rnout.be>
Date: Thu, 12 Jun 2025 22:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250607120022.719380-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250607120022.719380-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758964; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lC1K/Ue0OrXGW/ivr8YcPWDjGHz+7jtg4qOiXIuTETA=;
 b=g6nb2TKe7fZ9m/aKxCDNCRRj+08vX9M7b0HxsohcEwMvI+nb0Jkr41WSNMnl3D1hs88GQ9
 YayF+shoQF5HonSHPgVZWlwneuaIdDx/QyW7eMpZW9iDRnGLl3RTgs4dBc15tJhR9uYFs3
 xTOSfh4ntREVxvnygx2enxX5TSqNdUZcPARwj41ZbyHbmRoonN+DYV36GA0Xrq+OnwfGI4
 XXSjSO5GDUmFwOBwlwxYZVRlt4e9R56LhL6rPdTxQ2/tKexVB379ta9izIet1c8sJt6muu
 v/5sVyTN+oNM9sT1PEnugpsgGs+QUc0ZOef1YbIEujYwKzGJOWZMdKgSao1f0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=g6nb2TKe
Subject: Re: [Buildroot] [PATCH 1/1] package/yasm: fix build with host GCC 15
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



On 07/06/2025 14:00, Thomas Perale via buildroot wrote:
> Fix the following autobuild error that started appearing with host GCC15
> configs.
> 
> ```
> /usr/bin/gcc -DHAVE_CONFIG_H -I.   -I/workdir/instance-0/output-1/host/include  -O2 -I/workdir/instance-0/output-1/host/include  -c -o modules/arch/x86/x86arch.o modules/arch/x86/x86arch.c
> In file included from modules/arch/x86/x86arch.h:30,
>                   from modules/arch/x86/x86arch.c:31:
> ./libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
>     86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
>        |                                ^~~~~
> ./libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
> ```
> 
> This is due to the change in the default C language version in GCC15.
> 
> Fixes: https://autobuild.buildroot.org/results/d1d/d1d9a6e73c2ec278941dd90c6b07cce01b372feb/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks. But you knew that already :-)

  Regards,
  Arnout

> ---
>   .../0002-bitvect-fix-build-with-gcc-15.patch  | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
> 
> diff --git a/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch b/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
> new file mode 100644
> index 0000000000..684c8be042
> --- /dev/null
> +++ b/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
> @@ -0,0 +1,38 @@
> +From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@gmail.com>
> +Date: Tue, 22 Apr 2025 19:06:24 +0200
> +Subject: [PATCH] bitvect: fix build with gcc-15
> +
> +* fixes:
> +libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
> +   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
> +      |                                ^~~~~
> +../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
> +
> +as suggested in:
> +https://github.com/yasm/yasm/issues/283#issuecomment-2661108816
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Upstream: https://github.com/yasm/yasm/pull/287
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + libyasm/bitvect.h | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h
> +index 3aee3a531..a13470ada 100644
> +--- a/libyasm/bitvect.h
> ++++ b/libyasm/bitvect.h
> +@@ -83,7 +83,11 @@ typedef  Z_longword         *Z_longwordptr;
> +     #ifdef MACOS_TRADITIONAL
> +         #define boolean Boolean
> +     #else
> +-        typedef enum boolean { false = FALSE, true = TRUE } boolean;
> ++        #if __STDC_VERSION__ < 202311L
> ++             typedef enum boolean { false = FALSE, true = TRUE } boolean;
> ++        #else
> ++             typedef bool boolean;
> ++        #endif
> +     #endif
> + #endif
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
