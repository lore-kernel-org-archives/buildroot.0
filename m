Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F35DD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E2941088;
	Wed,  7 Jan 2026 17:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByTmNofNWmb1; Wed,  7 Jan 2026 17:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D4440BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808546;
	bh=CGAmDOm3ZzrKk1lDMrmwcnDQVX8xzzWtinYX58WKZbo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPIcof07phSIJxMSDiJWLHQkNiDslXeF/O4di4knKith8vAtZwAXpApKf/tg16BJR
	 ePG+4nxhtEQ66s0WYFOthYt0C8fOivJhCF8hPP8WgsbLLc0hzUZmw1ms0jw2vhH7O4
	 uxh/mDoNq74Ol5Pbeqmu8y6ODkzy/8p4Y8fGNOdw5JdDBV6P+5GNO2u4EOZF0Dj74Q
	 LAhg4ieD1Wvdu1eBvxkc2T+T/bpZI2MIqiRNLluEv2Vp4fuDrl/j+EGO/Vm2wSv+Ph
	 teZmK5czmCZ9eAyxYOXUyiPECrVnFUct+VeCsRfFHSo/tllczVH1y/jGrry9o44wDx
	 R5pUbB+2E+/8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D4440BBE;
	Wed,  7 Jan 2026 17:55:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F0FB25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5145A60667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YyJTfvWXYAh for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E0A260661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E0A260661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E0A260661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D653B97A70F; Wed,  7 Jan 2026 18:55:41 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:40 +0100
Message-ID: <20260107175540.230236-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215181828.3206337-1-giulio.benetti@benettiengineering.com>
References: <20251215181828.3206337-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808541; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=U9KKJLZzOz/HQGGeZzqb4zSNezn2kHVKYbnOKBz/S+I=;
 b=huh99Q8F1KBdfheJedjbEEPCtb9vzQ+D7uQ7PeFpfzuJ1h6+/QOSquSDfTZO6ti7pGqW9Y
 IUGdDdJHSaXwvav/LuwUtjf4PDJxoJZuofVLA++cb/JNPiy0/ugF5RDDs9ONnDpROVfpFG
 6EVypyOOFhyhhe2TJoDQljUgDdYrJlqScOO7QV2t2q8lrCua3U+GI9FjiYX7Prq+kB+Qt4
 Ic8v6EKl7ThZwrcGqowWgzabd6AYa9Hgp94x7cqRkxGBHlIvuZ5N9Zpqy/2KnNBQvD/sMo
 l4aa0z+kf5Qg2sKfcNVxelOgYT7a9BNuVDvwpn7jOK+Nnet4I7QSG8t4yy21fQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=huh99Q8F
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2025-12-14
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
> With this commit it builds with Linux 6.18
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/rtl8821cu/rtl8821cu.hash | 2 +-
>  package/rtl8821cu/rtl8821cu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
> index b9869303de..5ff86f439c 100644
> --- a/package/rtl8821cu/rtl8821cu.hash
> +++ b/package/rtl8821cu/rtl8821cu.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3e7fc5b598b81006fb07a5a3534aa4288cb387ed531c71f3734e55e6cae729b0  rtl8821cu-3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae.tar.gz
> +sha256  c471f8a73efb5985b4e880e40de439ac8837241c74d3b7f8cc06a1bbfcc85075  rtl8821cu-7f63a9da2e8ed83403f6f920e9b1628a37b38ef4.tar.gz
>  sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
> diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
> index e1ef396110..45d1da3750 100644
> --- a/package/rtl8821cu/rtl8821cu.mk
> +++ b/package/rtl8821cu/rtl8821cu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8821CU_VERSION = 3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae
> +RTL8821CU_VERSION = 7f63a9da2e8ed83403f6f920e9b1628a37b38ef4
>  RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
>  RTL8821CU_LICENSE = GPL-2.0
>  RTL8821CU_LICENSE_FILES = LICENSE
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
