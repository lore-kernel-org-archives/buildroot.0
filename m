Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF0BCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4E26122E;
	Wed, 22 Oct 2025 16:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnulH7R5YSZ3; Wed, 22 Oct 2025 16:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E2106143A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2106143A;
	Wed, 22 Oct 2025 16:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F9F370A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 167A783D56
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZNekVnMQaYH for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18A8F83D46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A8F83D46
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18A8F83D46
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E5BB7B979192; Wed, 22 Oct 2025 18:42:57 +0200 (CEST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:42:56 +0200
Message-ID: <20251022164256.285886-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008101535.51154-3-fiona.klute@gmx.de>
References: <20251008101535.51154-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151378; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hruWTKldYhThLEuNotKBfLVoxyBlH2p3D0JjiW9HMSs=;
 b=Sf1sdFPf1Sdc+5xdSnokwH/ufnsa02prWEAmlAHuyuTlIHdorjAbT6E9zLW04yDs9z/hFC
 TtdIb8HZJOcfth/QS/OS5Jt6b3BW6DJIgo+l7cHeGYHhexav20FrdogC7pArTxLynLSCQt
 VcmtXqQBz6VwWiqJLHcbuCRFEAMH+oe2jo27kDxNf2pHrODykz/ysW5TQsv3B4YbK5gxA/
 QwvZ+5Z6OBwggfXlhbZANZz8BaEfhinqMjIAMaBHRZ3A71QO7zlOjWrT8Sv+0nddnz78yK
 +Q2YGpQjPtddQ5byq4B50G37XC+9kDUKMd3hRm5WmGe+aWpqcpDuO6FC+GG4XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Sf1sdFPf
Subject: Re: [Buildroot] [PATCH 3/3] package/audit: bump to version 3.1.5
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
> This is a bugfix release, the commit log mentions multiple fixed
> memory leaks.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
> On my (musl-based) build the most important bugfix is that ausearch
> *never* returned any results with 3.1.2.
> 
>  package/audit/audit.hash | 2 +-
>  package/audit/audit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/audit/audit.hash b/package/audit/audit.hash
> index 5743b3a13a..557ccd1f80 100644
> --- a/package/audit/audit.hash
> +++ b/package/audit/audit.hash
> @@ -1,4 +1,4 @@
>  #Locally computed
> -sha256  c0b1792d1f0a88c6f1828710509cbb987059fc68712c97669ca90eae103d287d  audit-3.1.2.tar.gz
> +sha256  660213bac2baebabfc32be4d84a4aeb94effbd3e076b1014b78678b4502cf6ba  audit-3.1.5.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
>  sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
> index c703acc559..eb0b74b098 100644
> --- a/package/audit/audit.mk
> +++ b/package/audit/audit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AUDIT_VERSION = 3.1.2
> +AUDIT_VERSION = 3.1.5
>  AUDIT_SITE = http://people.redhat.com/sgrubb/audit
>  AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
>  AUDIT_LICENSE_FILES = COPYING COPYING.LIB
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
