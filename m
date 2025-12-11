Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404FFD43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14AA6835C8;
	Thu, 11 Dec 2025 19:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4U-W8Zy0YX9q; Thu, 11 Dec 2025 19:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3D8835A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481460;
	bh=sZVw4vGXRCOY9zRhXykXSs4kn4FwkgBnlNsCexZpL1E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=li0sLkO1S5d8qiN+rV5SdWPairk6ffKqzn/yXsab4PYAT2UBcCupVp2BYkvIZOsGa
	 EQhpk/FikB+zhHaUWchOO9GtC9K081aw7ZtuYY8NBoEMEq582AFOHbQdBMkr59/INP
	 Ngo30Qn/KRoaNeyOq+tWqpQ7nh+Eq7+ec5UzgvqHpg1Xbd9Px7bBBsWIQjDhUgNbFr
	 VvB+kEcneQTfUgKZQVB5+IXA37qivJ9+tzCGAUPcM1p3CDQ5n7aRWxVcrOFi7IQEyS
	 iINJraxENydG74YIzekt1J6a4t8ELWYu1pph5/IWmaF3lpFaPlmZDl7mvI74yUQE13
	 c6SHw1chktKUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3D8835A7;
	Thu, 11 Dec 2025 19:31:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDC02C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1199460614
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-1pJmo19vLo for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD10C605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD10C605D2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD10C605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 001B6B97A082; Thu, 11 Dec 2025 20:30:55 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:54 +0100
Message-ID: <20251211193054.1099380-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206214530.2307283-1-bernd@kuhls.net>
References: <20251206214530.2307283-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481456; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=U9kmAvH9lH+6COBFqRUEO3ZRsA7xv32cWiPxxDoHL6w=;
 b=fR9EetH0ql8vSbm+wlyJAc4YAqkcwgiy5dGFeQwfwkOjA9I9S0A+Zcsy7YB+J9cx1FnNVh
 6DKGyn+KpfJV65TuXrZa1szxBPG8hv5wopBQx1kgmJ5BxvY/yMrEeogRrso10D9XFtMvZj
 VsjF/lj6q8/SnY0GFWlRqrMl0MuH3mGHvBiwvIzKVfCQ2JizFZHnSCf1msWQnpFAqEiEOs
 gR+PxsAd8p07mTa3Hy8qnZGyzZk+tlGsvrX/+YSfUwmFJaqnE3jNqvfXVo/eMO0jCQO0VN
 uEFMzVXVRso7yhd/ppmCk9uzlk9WJCqmNw5L2WFkZEUMordJs9jXD1sYNQwmhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fR9EetH0
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: switch SITE to https
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
> The http link is broken:
> 
> Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
>  failed: No route to host.
> 
> No autobuilder error recorded.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/audit/Config.in | 2 +-
>  package/audit/audit.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/audit/Config.in b/package/audit/Config.in
> index 6e5761533f..e9bdf346da 100644
> --- a/package/audit/Config.in
> +++ b/package/audit/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_AUDIT
>  
>  	  Note: The z/OS remote plugin is disabled in this package
>  
> -	  http://people.redhat.com/sgrubb/audit/
> +	  https://people.redhat.com/sgrubb/audit/
>  
>  comment "audit needs a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
> index eb0b74b098..499cf1cee9 100644
> --- a/package/audit/audit.mk
> +++ b/package/audit/audit.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  AUDIT_VERSION = 3.1.5
> -AUDIT_SITE = http://people.redhat.com/sgrubb/audit
> +AUDIT_SITE = https://people.redhat.com/sgrubb/audit
>  AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
>  AUDIT_LICENSE_FILES = COPYING COPYING.LIB
>  AUDIT_CPE_ID_VENDOR = linux_audit_project
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
