Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEE0D13579
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D09C405D5;
	Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHtGi1oiW8e5; Sun, 27 Oct 2024 18:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F194405D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F194405D9;
	Sun, 27 Oct 2024 18:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C36AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 027A360621
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g754asIORLqY for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0230B6006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0230B6006A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0230B6006A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45A8EFF807;
 Sun, 27 Oct 2024 18:44:28 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194337.0da3e0f1@windsurf>
In-Reply-To: <20241026210544.2668585-1-bernd@kuhls.net>
References: <20241026210544.2668585-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLV1IhvKWCM3YzvttSEf0Ba8ch6UQDN/FMwHBFK2EJ4=;
 b=BJwa8u8mn0my+ckNj5Gp32LRqXZ2dbujglrk9R8CHZgUE+1zkELuNw78p54Olo33vdZPDv
 jvgdWtU2uPE6o22qzqroup5qGACZOhetj4ejyGIbY7NujWT4pb2jm4kjOD7/nDrMvi+6BM
 LfcpOhVku1oyBFQHEJGPTwWRbkNtOqJQvRLrWxXNkoEhVLVtA0Whlb19eJRLZRwWjVZjxy
 2I7Ayx6UOmKAgsrZ0U+8RwyGbELXMtqMORamVdViQdRo8DWD5cZjHFLdxo60IRNLRADQ3G
 vYa2CfKWDhR43YxcOF4DsIJb96NNpky0coG/aLmrAo3k68psLAM8o2L/ldLoAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BJwa8u8m
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Oct 2024 23:05:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/openssl/openssl/blob/openssl-3.4.0/NEWS.md#openssl-34
> 
> Fixes CVE-2024-6119:
> https://openssl-library.org/news/vulnerabilities/index.html
> https://github.com/openssl/openssl/commit/c47d9d7ec81bbab339d102bded809a558d0ebe6a
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
