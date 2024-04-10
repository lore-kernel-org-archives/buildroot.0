Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C998CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A39605E8;
	Wed, 10 Apr 2024 21:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZn1Pa--JWRU; Wed, 10 Apr 2024 21:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F91E60E8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F91E60E8D;
	Wed, 10 Apr 2024 21:33:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 660B61BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9A940473
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVpX2EMMiseL for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E80B54046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E80B54046C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E80B54046C
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:33:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D14640003;
 Wed, 10 Apr 2024 21:33:53 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:33:52 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20240410233352.72bb3737@windsurf>
In-Reply-To: <20240328165000.16191-1-nicolas.cavallari@green-communications.fr>
References: <20240328165000.16191-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712784833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVj4LN9gZr6bJV7StA0gZj+RpPfsr3q4FJaPpmfUJSE=;
 b=A8B/gzlQm7oCidguiOjhyCegKrFYmmE2Vxl8CvUk8F7lfbp8Nt9FEAbxl0vv1dUTdwUH7R
 A6xv7vKFGbQMAOuMI82Tm4HWyD0dkywGFSZXzeyHBYByjGvjdfa4pvO7//pjJQPCulagg8
 dVKHguz9zxe2CgczeVklMsXWuc1C7yCo5V7eQZFcnophxNofnGO/x3KcDFGaMi0bdhilp2
 EKFqukqBmGZM1D8p+4bPwZE7xnrrMeMNlWm/1eLq1HXmOcv2efkrUJmku78Ovg+15UJLuS
 4D9lMZU+gYGGpQVpNbRpQ52cf9/r8sytMck8bIJgeba3boMiBn3lylajVmIc3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A8B/gzlQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump to version 1.8.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Mar 2024 17:49:56 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> The license file was updated for two reasons:
> * This version now bundles ntlmclient.  NTLM support is disabled by
>   the buildroot package.
> * The bundled zlib version (that buildroot does not use) was updated and
>   its copyright years changed.
> 
> This version also adds support for using the SSH binary (at an hardcoded
> /usr/bin/ssh path) instead of using libssh2.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/libgit2/libgit2.hash | 4 ++--
>  package/libgit2/libgit2.mk   | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
