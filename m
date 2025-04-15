Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865E0C369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5410460E4B;
	Tue, 15 Apr 2025 20:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPqdMGlM0pQM; Tue, 15 Apr 2025 20:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749EE61102
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749EE61102;
	Tue, 15 Apr 2025 20:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A78108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586DA40B8A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsXcnwyelBTI for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FCE340BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCE340BED
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FCE340BED
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:15:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 68DE819F73B;
 Tue, 15 Apr 2025 22:15:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Apr 2025 22:15:44 +0200
Date: Tue, 15 Apr 2025 22:15:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <Z_6-cAmygof3BN5v@landeda>
References: <20250415200047.2256467-1-peter@korsgaard.com>
 <20250415200047.2256467-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415200047.2256467-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744748146;
 bh=m4NADRyUunA/ranFXSEre4MbYiRUzJ4SfRSygXb4Czw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dVbVsehj1/xXY+WkvVZg2VX8bmn7xMOi4uimQWZBUs2NjH0pf4kUJBvSrAhOdoU5l
 iHi3hWros+lCLgXHvaD9Fnttbl3Pq2Bed6u7HWWzu+ebjLNjJ03GTTW3r0lWVqkQgx
 2kWkoMHar+aY9Jij3vaS/DGkoJfC+CJ9s7p5J4jgqPO8lZO8MwUQsWmmNG/2SQ3pF0
 MfYvPlVjuJNTJjyVWyVnGYQty71YNZgJSpDVLb9Dmtf/8u5qIePZu8NH1wR0W31X66
 95T2iyyOp/ZZE98AbPiW6zUF3R2K245EccdVFdKWV3HoBDKKWCCV3quPZr8VswKIND
 Qp+CbfXfMO82w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dVbVsehj
Subject: Re: [Buildroot] [PATCH 2/2] Revert "package/libopenssl do not build
 in parallel"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pter, All,

On 2025-04-15 22:00 +0200, Peter Korsgaard spake thusly:
> This reverts commit 27ab880ebb9a3efdec15733841f7b88063604247.

I don't think this really is a "revert". Reverting a commit is for when
that commit was wrong when it was applied. But here, the commit was not
wrong, so it should not be "reverted". Even if the change is technically
undone, that's semantically a different thing. But oh well... ;-)

> With the (proposed) fix from the openssl developers added as
> 0004-Serialize-install-process-to-avoid-multiple-make-dep.patch, the
> workaround can now be dropped so openssl can again be built and installed in
> parallel, significantly speeding up builds.

Yes, that was a shame that we had to lose parallelism...

Note that I also hit a hihly-parallel highly-loaded build (not install)
issue that is still not fixed. Alas, that one is also very, very
difficult to hit. We can probably ignore it until I get bitten again and
get more traces to inspect...

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libopenssl/libopenssl.mk | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 663e8d9b9f..c1c5b818d7 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -132,26 +132,24 @@ endef
>  LIBOPENSSL_POST_CONFIGURE_HOOKS += LIBOPENSSL_FIXUP_STATIC_MAKEFILE
>  endif
>  
> -# Parallel build broken: https://github.com/openssl/openssl/issues/27074
>  define HOST_LIBOPENSSL_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
> -# Parallel build broken: https://github.com/openssl/openssl/issues/27074
>  define LIBOPENSSL_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  define LIBOPENSSL_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
>  endef
>  
>  define HOST_LIBOPENSSL_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
>  endef
>  
>  define LIBOPENSSL_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>  	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
>  	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
>  endef
> -- 
> 2.39.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
