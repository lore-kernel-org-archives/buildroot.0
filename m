Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3276D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B995F81919;
	Wed,  7 Jan 2026 17:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYt2duzCYFcY; Wed,  7 Jan 2026 17:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEAE8822C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808134;
	bh=Gxye6vXhwGU6+oBxu84e+6HE1qpHYxZW/1fJa4Cr0XU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BZaLdc1/Ay3TQGrbKBtzdt/itsa2Z2eQj7KUarIyaqXXPoHapmQLBSPARdsDTbgmK
	 sY+etD1Zdqy7ssYQ/knKgoWeBhWRFT43XESevnfJTPAjt0sF35/PrnjtRT18Zq54mA
	 aXiRSkkq8bdAU07CclutKQQhlGbDpOn/ZZ7i4VQ8P/s6+r3hp3D9lXhjDjOMZ471EX
	 4lJ26jk5McoAwf/CIfg8NmWG+OHa8UIsGxkh+TyGnuVhpmOKP28SVDjDa5/UXwzvli
	 FBhqdHHtNkO9eDQKsK+7lFdNgOUju1Ua7ynFh4ldWj10RjaRQO9hKr2ExQst/YdiNK
	 dgKY+I+o+ZRbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEAE8822C5;
	Wed,  7 Jan 2026 17:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DC6D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F39B6083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4H-9kGFTwN7 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09AC6607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09AC6607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09AC6607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 099C7B97A596; Wed,  7 Jan 2026 18:48:22 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:20 +0100
Message-ID: <20260107174820.224342-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205190034.1839192-2-bernd@kuhls.net>
References: <20251205190034.1839192-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808102; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=F0NbnQHGNeF+fJOppqIGUciV19SVxEdUej4hKm1ZGeo=;
 b=YX7QL8wJFAqc4ECvkw+7yRjJ98lPEi5OFpPNa4jTwVXjpP4Ic+LEXfywHe3uk0+0gPmVh+
 mLRDU9ZRbsNexFUpIbRg6lEKO1NSWML141q7MHYnua6g4LrIu2rhpJDyVHH1Mjcw76OWXb
 7D+G4lE/aCbHGvfmNBXOFYEU7J2WWH//PHLqckgAYPfUSWI+Yms1Tdx4Ai92UvCCPS0d7b
 fZqHFehLI/+swt7AwxjwLXCldCLhQeAgPX3Fd77GGceSddvwXsi6alpVoKVGKXRfJMGyB/
 bPImSXvNfTp0M7pwJPwmIcgi4fhOfWHszJ7QDeXloTZcUZOjliWfJcsHij9e1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=YX7QL8wJ
Subject: Re: [Buildroot] [PATCH/next 2/4] package/matchbox-fakekey: switch
 to gz tarball
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
> Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.
> 
> No autobuild errors recorded due to previous download error with
> matchbox-lib.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/matchbox-fakekey/matchbox-fakekey.hash | 2 +-
>  package/matchbox-fakekey/matchbox-fakekey.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
> index 3627b13913..03fcfef6d3 100644
> --- a/package/matchbox-fakekey/matchbox-fakekey.hash
> +++ b/package/matchbox-fakekey/matchbox-fakekey.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4e2fdc9bc20df469d53885c40e104122140131e06d4c184902070ec0b0f2ca9f  libfakekey-0.3.tar.bz2
> +sha256  d282fa6481a5b85f71e36e8bad4cfa938cc8eaac4c42ffa27f9203ac634813f4  libfakekey-0.3.tar.gz
>  sha256  3271662131760e9b30dd92495a0ea0b598fc457798cc67948947365299dd607d  src/libfakekey.c
> diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
> index 99921ef8e7..4f32cd9378 100644
> --- a/package/matchbox-fakekey/matchbox-fakekey.mk
> +++ b/package/matchbox-fakekey/matchbox-fakekey.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MATCHBOX_FAKEKEY_VERSION = 0.3
> -MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
> +MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.gz
>  MATCHBOX_FAKEKEY_SITE = \
>  	http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/snapshot
>  MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
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
