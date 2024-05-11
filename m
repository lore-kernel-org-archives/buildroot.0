Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B97C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9155D61632;
	Sat, 11 May 2024 06:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McoBPaoDDqOe; Sat, 11 May 2024 06:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956B36168C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956B36168C;
	Sat, 11 May 2024 06:56:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79A561BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 666866168C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuXQRCQ4WFFX for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A2DC61632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A2DC61632
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A2DC61632
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:56:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3999B60002;
 Sat, 11 May 2024 06:56:20 +0000 (UTC)
Date: Sat, 11 May 2024 08:56:19 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240511085619.304cff8f@windsurf>
In-Reply-To: <20240510235510.2454216-2-brandon.maier@collins.com>
References: <20240510235510.2454216-1-brandon.maier@collins.com>
 <20240510235510.2454216-2-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3XpEgZuWP0U80p+pBKkOPG88kCfjADCUQM62+e/3b0=;
 b=D4dtOjCAYJqQ84PviEcaQfZ03ZePhiwHX/P1+LKYnROdYT6lSCkiolEQSKR8CqHhNucTJ/
 2LwhgAwMUmeTbTTdknxXKXfZbRwG8Ieh6dC+yNv+e3k1xWSHVvR+Aa2DaMiarYpDHjAbVH
 jQUxB5Ucvdbz0IxJrkFmn1ejWe3gmcJTIJrc4fLTWpO4sRdyzHyhuumXCOlFogdLUQUETY
 o4U360Is66JzPoJUUF5crWs6h+AOpNo0S3P0VKKO+GHAlG3ZKxIFLvd11G04KDyBLs+7SX
 gtOahwY1fJOTwdbouoJq8/p33KdTZOYTJkTXYU8TaNYgFD0+qcwMt+Vn+l+OVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D4dtOjCA
Subject: Re: [Buildroot] [PATCH 2/2] package/zip: fix build with GCC 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 May 2024 23:55:10 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Builds with GCC 14 print the following error
> 
> > zip.h:726:10: error: conflicting types for 'memset'; have 'char *(char *, int,  unsigned int)'  
> 
> This is because with GCC 14, Zip incorrectly detects that the memset functions
> exist. Which enables the ZMEM flag and declares its own version of memset.
> 
> This is because the ./unix/configure script attempts to compile a C file using
> 'memset' but it does not include the <string.h>. This was allowed in gnu89, but
> in GCC 14 -Werror=implicit-function-declaration is enabled by default[1].
> 
> We forcefully set '-std=gnu89' so that Zip will compile everything against
> gnu89, which suppresses the warning.
> 
> [1] https://gcc.gnu.org/gcc-14/porting_to.html#warnings-as-errors
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/zip/zip.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

My first thought was that this should be fixed with a patch, that we
send upstream. However, it seems like the zip 3.0 release we're using
dates back from 2008, and despite an announce of zip 3.1 on the
website, this still hasn't happened. As it's not clear how active
upstream is, I've applied your solution that doesn't involve a patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
