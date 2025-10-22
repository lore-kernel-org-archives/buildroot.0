Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F624CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2927660DC4;
	Wed, 22 Oct 2025 16:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlQpdkVM-5nt; Wed, 22 Oct 2025 16:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45BC561511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45BC561511;
	Wed, 22 Oct 2025 16:43:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8311643F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80DE540888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ThIALGQb7j8 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A2F3400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A2F3400FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A2F3400FC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 769E5B97918D; Wed, 22 Oct 2025 18:43:26 +0200 (CEST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:25 +0200
Message-ID: <20251022164325.286581-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010162053.238542-1-thomas.perale@mind.be>
References: <20251010162053.238542-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151406; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=nXJcJ80fJA1JJyTVxI8xHlqeeg4aTmZgdKS/ZoLoOq0=;
 b=kBOhJw4+x3qTJAt9KEdilF0LejsedzFSCu4twKcQhb6nphUz7P+pWC6ZBVuYyKklN6p4CK
 1fId57rkuyLrpXi9l469AQkGCmci1iMQTIeXtiEge5mLI3bZfen2UqXEoMO4lunlnAFGzX
 MijkvMaEExP7nrdsjR+IOvSTb1AlAUrPaBBV5BQQP+a1r4xk27f/IcRlNi7M697X41xCoD
 BZ/UGpbtkrSvJcnk6ubKFNVIdRRlPIYltRqCK8zdTpzGGcrFpCLTGcya/f+hfMBWjjSp/g
 EFCRGP1RPI5w8aZ9aGBwxEtgr3JuPKfiCbNPYrYyRmthNiXZ64UCqONmzrfSSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kBOhJw4+
Subject: Re: [Buildroot] [PATCH] package/zabbix: security bump to v7.2.13
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
> For more details on the version bump, see:
>   - https://www.zabbix.com/rn/rn7.2.13
>   - https://www.zabbix.com/rn/rn7.2.12
>   - https://www.zabbix.com/rn/rn7.2.11
>   - https://www.zabbix.com/rn/rn7.2.10
>   - https://www.zabbix.com/rn/rn7.2.9
>   - https://www.zabbix.com/rn/rn7.2.8
>   - https://www.zabbix.com/rn/rn7.2.7
>   - https://www.zabbix.com/rn/rn7.2.6
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-27231
> 
>     The LDAP 'Bind password' value cannot be read after saving, but a
>     Super Admin account can leak it by changing LDAP 'Host' to a rogue
>     LDAP server. To mitigate this, the 'Bind password' value is now
>     reset on 'Host' change.
> 
> For more information, see:
>   - https://support.zabbix.com/browse/ZBX-27062
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27231
> 
> - CVE-2025-27236
> 
>     A regular Zabbix user can search other users in their user group via
>     Zabbix API by select fields the user does not have access to view.
>     This allows data-mining some field values the user does not have
>     access to.
> 
> For more information, see:
>   - https://support.zabbix.com/browse/ZBX-27060
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27236
> 
> - CVE-2025-27238
> 
>     Due to a bug in Zabbix API, the hostprototype.get method lists all
>     host prototypes to users that do not have any user groups assigned
>     to them.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-27238
>   - https://support.zabbix.com/browse/ZBX-26988
> 
> - CVE-2025-49641
> 
>     A regular Zabbix user with no permission to the Monitoring ->
>     Problems view is still able to call the problem.view.refresh action
>     and therefore still retrieve a list of active problems.
> 
> For more information, see:
>   - https://support.zabbix.com/browse/ZBX-27063
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49641
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/zabbix/zabbix.hash | 2 +-
>  package/zabbix/zabbix.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
> index 979b6c8e3f..787a0acfe9 100644
> --- a/package/zabbix/zabbix.hash
> +++ b/package/zabbix/zabbix.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  0d01b393dd22b2a60b36fb37a98fcf1081c683ad98832a2ddd87943a1200839e  zabbix-7.2.5.tar.gz
> +sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
>  sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index 3e685f1ea2..caa69fda38 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ZABBIX_VERSION_MAJOR = 7.2
> -ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).5
> +ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
>  ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
>  ZABBIX_SELINUX_MODULES = zabbix
>  ZABBIX_LICENSE = AGPL-3.0
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
