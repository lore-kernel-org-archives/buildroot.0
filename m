Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE922D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24D88317B;
	Thu, 11 Dec 2025 19:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0RbGIOVsLBi; Thu, 11 Dec 2025 19:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3694830E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481446;
	bh=CrcxTuMV0d4NIKktLQIa3EpKPw5l35wnAehCzDBesU8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gFrqd6pOHPMjkp5Wuo2+N4Navj3ndK5q7KJkNKeJdTaXiPQHUrD2hUIcTYjzCnD8z
	 AnYS1WJiIdOIqg0rpluSi7AuNg94eHRCmpUyVO6G3KJpZF+dXwJwbKR1xnKWPEtcw8
	 JuR9t2SynS9wg6zAK8KTjC/49WRGbXSo0wW2elf7G87kDud7opNrZJTIsmW1c4282H
	 fTnWnd6ritZy5mY2eHI7UVl6v5lgkh8cheNWMKhk+YCgc3zZ2LGp60ABPhZhYz1X0O
	 XKDy40Sp61ughqfwqeV8+Ufg0+4I4CsJnGxgRJQ6K7tStCe9WfZCHgMJ3yhuvL/GEr
	 CYsfy4EMvf5hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3694830E3;
	Thu, 11 Dec 2025 19:30:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B81C2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D067605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v8oubJwnfWL for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5597260592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5597260592
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5597260592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7597CB97A098; Thu, 11 Dec 2025 20:30:42 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:40 +0100
Message-ID: <20251211193040.1099089-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205183916.1783507-1-bernd@kuhls.net>
References: <20251205183916.1783507-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481442; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eb1xmFtyqHFwvAaPfF5YCmBCbhjTw67m+KZf0fLoRfI=;
 b=lwMjKY+/EjJfshqsRYMPNPqquP3gVQ/oW7wgfnxzBYvYjSs33wrzD+PagMpOd+zgnj1Oy+
 krJGkSx52/Wnr++rhpcNXRVhhS1EkJledLCFKDHqLqt0KZtF5SGEKajE7ltCvwd9txb36M
 49z1275sc16oiIkf5daaEO9HFOeB06ZzQb8Fw5viW3PW3yvz9qIBPzc1IxE01RHHgK+sE7
 JrIM6yUixUV8JzwOU1gK4Z5ZoBkqGp9YLeREMhfs7EC26guUr833fIgMARMYGK7n7E2uHh
 os4Irc2mlZDGC+roAThc7PLqWOR+aRlxPjEDzUuTQYYz0PASnd+LcuQh0zy5dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lwMjKY+/
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.66
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
> Changelog:
> https://downloads.apache.org/httpd/CHANGES_2.4.66
> 
> Fixes CVE-2025-55753, CVE-2025-58098, CVE-2025-59775, CVE-2025-65082 &
> CVE-2025-66200.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 5b0aab0af2..53fb05a5c8 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://archive.apache.org/dist/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
> -sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
> -sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
> +# From https://archive.apache.org/dist/httpd/httpd-2.4.66.tar.bz2.{sha256,sha512}
> +sha256  94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a  httpd-2.4.66.tar.bz2
> +sha512  49031a3465d956ee3b755e65810b6c35561ddd5fac2c624a273b733c238e115b914cd7b246837e5a3090ccfded6e0b8b3059bfd1f8ce4419081c805a38d05a4b  httpd-2.4.66.tar.bz2
>  # Locally computed
>  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 500a45bbca..06f964b083 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -APACHE_VERSION = 2.4.65
> +APACHE_VERSION = 2.4.66
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>  APACHE_SITE = https://archive.apache.org/dist/httpd
>  APACHE_LICENSE = Apache-2.0
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
