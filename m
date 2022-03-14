Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C23C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 599DF405B0;
	Mon, 14 Mar 2022 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRUyQ5fcVbvD; Mon, 14 Mar 2022 19:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E66D401B1;
	Mon, 14 Mar 2022 19:57:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21E2A1BF318
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BB360C21
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 19:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jR785uJTW7mo for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 19:57:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCA8660C03
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 19:57:13 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id kt27so36647081ejb.0
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LG/sbvoRnPEgCflDWjiTb9e/jAQb5pnKS5ezzk1wml8=;
 b=Mxgn8AJmcZkpSUJKuDpYwLSxzGC60tvr9vWOCyVc6YxKSDNDuqM9KHV0r2A87qM9MO
 16GGVwQThlm4QrEtSJE6oGYskHpXTdHI0bWFgwkSqPNSZH7OIPk5nvau6/OhN3le5RYs
 +l9hyneCQL6ES0ZKtdZMXNuD3nFOzD43aGcJFPmK+sqqroWn8ltQtFAzNPhJD2oPDgUW
 icH19jxFoBi3OXycvs5FNazI7iBygyPO6tEqoLcHTMi/SCoEVYSnwgyqEFZHYqoJecGv
 qnz7xBnHvjBdQ8QTajDEsC0CBY66/Wyptl+46kx7UdKK6zQtRVBuhQJqjwz9VeOh68cQ
 /Ztw==
X-Gm-Message-State: AOAM532BNbSlaosRp3yVYTZD/dIStzv69Uw/v2Y5R6+VWcrUxhp3agNi
 oSzBRpst63joMVKpGhNKbJQ=
X-Google-Smtp-Source: ABdhPJz8+hOTeeDk8Li4S+osAJBCjbxdnOlQh8IFvvpJUhn+azXT0GiCPR8LnKZQcPKcIf1bSUBXBA==
X-Received: by 2002:a17:906:be1:b0:6ce:c3c8:b4b6 with SMTP id
 z1-20020a1709060be100b006cec3c8b4b6mr19776987ejg.617.1647287832068; 
 Mon, 14 Mar 2022 12:57:12 -0700 (PDT)
Received: from localhost (tmo-098-218.customers.d1-online.com. [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1709067f8500b006da68bfdfc7sm7310281ejr.12.2022.03.14.12.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 12:57:11 -0700 (PDT)
Date: Mon, 14 Mar 2022 20:57:09 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Message-ID: <20220314205709.0024bd95@tuxfamily.org>
In-Reply-To: <20220310221908.30588-1-fontaine.fabrice@gmail.com>
References: <20220310221908.30588-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: bump to version 2022-03-08
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Thu, 10 Mar 2022 23:19:08 +0100
schrieb Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> - Switch site:
>   https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/commit/?id=f271e1b630a1b8b5f4eae2331654fc1e70abfd66
> - Update first patch
> - Drop second patch (binutils < 2.23 is not supported by buildroot
>   anymore)
> - Drop third and fourth patches (already in version)
> - This bump will fix the following build failure with powerpc and gcc 11
>   thanks to
>   https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/0c111b370ad3c5a89e11caee79bc93a66fd004f2
> 
> /tmp/ccSlivNE.s:348: Error: `lswx' invalid when little-endian
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/746e87892ac545e8fb97c17d4bfd7bd7bbc9d8be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Huth):
>  - Drop second patch
> 
>  ...emove-Werror-to-avoid-build-failures.patch |  17 +--
>  ...vm-unit-tests-test-for-rdseed-rdrand.patch | 110 ------------------
>  ...3-Makefile-fix-stack-protector-tests.patch |  36 ------
>  ...issue-with-the-linker-from-Fedora-32.patch |  61 ----------
>  package/kvm-unit-tests/kvm-unit-tests.hash    |   2 +-
>  package/kvm-unit-tests/kvm-unit-tests.mk      |   6 +-
>  6 files changed, 14 insertions(+), 218 deletions(-)
>  delete mode 100644 package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
>  delete mode 100644 package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
>  delete mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
