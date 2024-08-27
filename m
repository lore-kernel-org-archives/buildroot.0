Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB2AC54736
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B08F40680;
	Tue, 27 Aug 2024 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odPWRq59bZ1r; Tue, 27 Aug 2024 19:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A4340679
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A4340679;
	Tue, 27 Aug 2024 19:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4691F1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C32608D9
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 19:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eO0cyhB5r1KG for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 19:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBFA1608D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBFA1608D6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBFA1608D6
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 19:51:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 65EF613F81D;
 Tue, 27 Aug 2024 21:51:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 27 Aug 2024 21:51:04 +0200
Date: Tue, 27 Aug 2024 21:51:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Zs4uKEilwEr3sSd6@landeda>
References: <20240824103634.1955431-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240824103634.1955431-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724788268;
 bh=h+z1pSafGRnsCQ3+PY5AnmVvzkOSgjMOn41VU0xHQ7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+Ht0kOos/gbrnHXpbjU9Ljt32hDfOkIG0NR6nI4iXAWLh5uSyRmbbWtI3uClMX8I
 bs7/qGACj6tJZo4wJ7oR5q13JWUXO0gKr2Va3ww6U4wNVkLinKjphp2b2b6xO5dMog
 V9CX/6KnYafDpseZ5RlOOv9kYH8D09j65NZtX7Mbqvi/jkZBawsGaafOgRlfOqy+Ft
 Si+Sh/7ugM50HNajnIpMsAVVbofnOiGhiW36YIMaUPMj6UxJDKQKEzM48yp4tDguMR
 g7bDMjTwycnKSKx7xxrk0bHv91VasN334R5zmZccLDPYEFVUKa9MS21WCoL7jPENgy
 41hGlSGYsjbVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o+Ht0kOo
Subject: Re: [Buildroot] [PATCH RFC 1/2] package/pkg-download: set
 BR_NO_CHECK_HASH_FOR properly
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
Cc: linux-amarula@amarulasolutions.com, Vincent Fazio <vfazio@xes-inc.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

+Vincent who last looked at ipmi-tool wrt PEN

On 2024-08-24 12:36 +0200, Dario Binacchi spake thusly:
> The hash check failure highlighted by test [1] reveals that
> BR_NO_CHECK_HASH_FOR in package/pkg-download.mk is not correctly set
> when the BR2_DOWNLOAD_FORCE_CHECK_HASHES option is enabled.

Quite the oppposite in fact: it *is* correctly set: indeed, if
BR2_DOWNLOAD_FORCE_CHECK_HASHES is set, then we *do* *want* to check
*all* hashes, so we do not want to exclude any downloaded file.

See commit e091e3183112 (pkg-download: add option to enforce hash
checking) which was done to actually close a set of CVEs:

    https://talosintelligence.com/vulnerability_reports/TALOS-2023-1844
    https://talosintelligence.com/vulnerability_reports/TALOS-2023-1845

> The test
> output shows that an attempt is made to perform a hash check on the
> enterprise-numbers.txt file even though the ipmitool package has
> excluded it from such verification:
> 
> ...
> IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
> BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
> ...
> 
> The setting of BR_NO_CHECK_HASH_FOR used by support/download/dl-wrapper
> cannot be overridden by BR2_DOWNLOAD_FORCE_CHECK_HASHES because it
> represents an exception that is required even when forcing hash checks
> on all packages.

Thhe thing is, there are other packages, like the linux kernel or uboot,
that do set BR_NO_CHECK_HASH_FOR for custom versions, and for those it
is possible to provide a hash file in a br2-external tree, in which case
we do not want to exclude those when BR2_DOWNLOAD_FORCE_CHECK_HASHES is
set.

So this change is not correct. But see below...

> Applying this patch shows that in the specific test,
> the hash check is performed for ipmitool-1_8_19.tar.gz but not for
> enterprise-numbers.txt

The upstream URL provides a file that is not stable; it can change any
moment at the whim of IANA. So here is what I propose we do about it:

 1. make the default an empty string, to not use the data by default;
    ipmi-tool would report "unknown" in all cases, rather than the
    company or product names, and this is not very critical, as that
    would always happen even with a PEN file present, so anythong that
    parses the output of ipmi-tools should be prepared for that.

 2. add the original URL in the help text, so people know where to look
    at to find the then-current data;

 3. only accept paths to a local file rather than a URL; indeed, people
    who set BR2_DOWNLOAD_FORCE_CHECK_HASHES will be well advised to grab
    a file and save it to their tree so that the file is stable;

Additionally, we should also:

 4. ask IANA to provide a versioned URL (e.g. with a serial number, or
    with the release date, or even better, in a git tree).

Regards,
Yann E. MORIN.

> [1] http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/pkg-download.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index ca01ff67a59e..a41bd9d4c0ad 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -118,7 +118,7 @@ define DOWNLOAD
>  	$(Q)$(DOWNLOAD_SET_UMASK) $(EXTRA_ENV) \
>  	$($(PKG)_DL_ENV) \
>  	TAR="$(TAR)" \
> -	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
> +	BR_NO_CHECK_HASH_FOR="$(BR_NO_CHECK_HASH_FOR)" \
>  		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
>  		-c '$($(PKG)_DL_VERSION)' \
>  		-d '$($(PKG)_DL_DIR)' \
> -- 
> 2.43.0
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
