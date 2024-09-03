Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE6CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BAED80874;
	Tue,  3 Sep 2024 22:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfzilgA6tDd7; Tue,  3 Sep 2024 22:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5208380DD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5208380DD6;
	Tue,  3 Sep 2024 22:45:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D11571BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC001607EE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ung53SoJPZQp for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54FEC605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FEC605FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54FEC605FF
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:45:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 22C4813F879;
 Wed,  4 Sep 2024 00:45:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Sep 2024 00:45:46 +0200
Date: Wed, 4 Sep 2024 00:45:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <ZteRmo6jg7pubifR@landeda>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725403549;
 bh=IIfEaDo+cqtOkP3pYxbAsrL1wv/CLIH7oxmzQRLDGcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKWSnMgRfkm7THr0+xvwAGUuj1+dYc6iveVIalVva4cZbIPNgwyYtAMrEhAkq8/zj
 RZVoBqsr979cdCz/6WGoGtckQ8yHR/bCFoSfjycPIhIZyrfBL9EuYMCoAOrpv6k90F
 CB2ec8hqHy0jpxpIptN1viEWntLZyWO9/J5UfOO1kxj1vL3csukmRsVoNm5tMoX9kI
 hFm3THEQFKfR5W+3AcG6A8DZg+TslDEv4yIp98cQsbvJJGzO+cUO2SBNkMcgs9Fgof
 3gTUKLM1N0d+cE/Mm/VO4MVTh58fnYIUpHWWtIpHKr1SDqpZMVnbbZsPQKwIELThZ9
 VCl+XtR8TQ13A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gKWSnMgR
Subject: Re: [Buildroot] [PATCH v2 00/23] Update Ejabberd and its
 dependencies
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Johan, All,

On 2024-08-29 16:49 +0200, Johan Oudinet spake thusly:
> Ejabberd has many dependencies. Update all of them to the versions
> needed by ejabberd 24.07. Take the opportunity to rename the erlang
> packages that were misnamed so far in order to remove some patches.
> Such patches were here only to fix the location of such packages in
> other packages that expect to find them in a different place.

Series Applied to next, thanks.

I'll reply independenctly to a few patches.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - separate the renames from the bumps (suggested by Thomas)
>   - add corresponding entries to Config.in.legacy
>   - separate fixing check-package warnings from the bump
> 
> Johan Oudinet (23):
>   package/erlang-stun: renamed from erlang-p1-stun
>   package/erlang-stun: bump version to 1.2.14
>   package/erlang-fast-xml: renamed from erlang-p1-xml
>   package/erlang-fast-xml: bump version to 1.1.52
>   package/erlang-xmpp: renamed from erlang-p1-xmpp
>   package/erlang-xmpp: bump version to 1.8.3
>   package/erlang-p1-utils: bump version to 1.0.26
>   package/erlang-p1-cache-tab: bump version to 1.0.31
>   package/erlang-p1-tls: bump version to 1.1.21
>   package/erlang-p1-stringprep: bump version to 1.0.30
>   package/erlang-fast-yaml: renamed from erlang-p1-yaml
>   package/erlang-fast-yaml: bump version to 1.0.37
>   package/erlang-p1-yconf: bump version to 1.0.16
>   package/erlang-p1-oauth2: bump version to 0.6.14
>   package/erlang-p1-pkix: bump version to 1.0.10
>   package/erlang-eimp: bump version to 1.0.23
>   package/erlang-p1-mqtree: bump version to 1.0.17
>   package/erlang-jose: bump version to 1.11.10
>   package/erlang-p1-acme: bump version to 1.0.23
>   package/erlang-p1-sip: bump version to 1.0.54
>   package/erlang-p1-zlib: bump version to 1.0.13
>   package/ejabberd: bump version to 24.07
>   package/ejabberd: fix warnings reported by check-package
> 
>  .checkpackageignore                           |    5 -
>  Config.in.legacy                              |   29 +
>  DEVELOPERS                                    |    8 +-
>  package/Config.in                             |    8 +-
>  ...not-download-or-compile-dependencies.patch |   23 +-
>  package/ejabberd/0002-fix-ejabberdctl.patch   |   19 +-
>  package/ejabberd/0003-correct-includes.patch  | 1807 -----------------
>  package/ejabberd/Config.in                    |    8 +-
>  package/ejabberd/S50ejabberd                  |   72 +-
>  package/ejabberd/check-erlang-lib             |   39 +-
>  package/ejabberd/ejabberd.hash                |    4 +-
>  package/ejabberd/ejabberd.mk                  |   11 +-
>  package/erlang-eimp/erlang-eimp.hash          |    2 +-
>  package/erlang-eimp/erlang-eimp.mk            |    2 +-
>  package/erlang-fast-xml/Config.in             |    8 +
>  .../erlang-fast-xml.hash}                     |    2 +-
>  package/erlang-fast-xml/erlang-fast-xml.mk    |   18 +
>  .../Config.in                                 |    6 +-
>  .../erlang-fast-yaml.hash}                    |    2 +-
>  package/erlang-fast-yaml/erlang-fast-yaml.mk  |   20 +
>  package/erlang-jose/erlang-jose.hash          |    2 +-
>  package/erlang-jose/erlang-jose.mk            |    2 +-
>  package/erlang-p1-acme/erlang-p1-acme.hash    |    2 +-
>  package/erlang-p1-acme/erlang-p1-acme.mk      |    2 +-
>  .../erlang-p1-cache-tab.hash                  |    2 +-
>  .../erlang-p1-cache-tab.mk                    |    2 +-
>  .../erlang-p1-mqtree/erlang-p1-mqtree.hash    |    2 +-
>  package/erlang-p1-mqtree/erlang-p1-mqtree.mk  |    2 +-
>  .../erlang-p1-oauth2/erlang-p1-oauth2.hash    |    2 +-
>  package/erlang-p1-oauth2/erlang-p1-oauth2.mk  |    2 +-
>  package/erlang-p1-pkix/erlang-p1-pkix.hash    |    2 +-
>  package/erlang-p1-pkix/erlang-p1-pkix.mk      |    2 +-
>  .../erlang-p1-sip/0001-correct-include.patch  |   31 -
>  package/erlang-p1-sip/Config.in               |    2 +-
>  package/erlang-p1-sip/erlang-p1-sip.hash      |    2 +-
>  package/erlang-p1-sip/erlang-p1-sip.mk        |    4 +-
>  .../erlang-p1-stringprep.hash                 |    2 +-
>  .../erlang-p1-stringprep.mk                   |    2 +-
>  package/erlang-p1-stun/erlang-p1-stun.mk      |   14 -
>  package/erlang-p1-tls/erlang-p1-tls.hash      |    4 +-
>  package/erlang-p1-tls/erlang-p1-tls.mk        |    2 +-
>  package/erlang-p1-utils/erlang-p1-utils.hash  |    2 +-
>  package/erlang-p1-utils/erlang-p1-utils.mk    |    2 +-
>  package/erlang-p1-xml/Config.in               |    8 -
>  package/erlang-p1-xml/erlang-p1-xml.mk        |   18 -
>  .../erlang-p1-xmpp/0001-fix-includes.patch    |   16 -
>  package/erlang-p1-xmpp/erlang-p1-xmpp.mk      |   17 -
>  package/erlang-p1-yaml/erlang-p1-yaml.mk      |   20 -
>  package/erlang-p1-yconf/Config.in             |    2 +-
>  package/erlang-p1-yconf/erlang-p1-yconf.hash  |    2 +-
>  package/erlang-p1-yconf/erlang-p1-yconf.mk    |    4 +-
>  package/erlang-p1-zlib/erlang-p1-zlib.hash    |    2 +-
>  package/erlang-p1-zlib/erlang-p1-zlib.mk      |    2 +-
>  .../{erlang-p1-stun => erlang-stun}/Config.in |    4 +-
>  .../erlang-stun.hash}                         |    2 +-
>  package/erlang-stun/erlang-stun.mk            |   14 +
>  .../{erlang-p1-xmpp => erlang-xmpp}/Config.in |    8 +-
>  .../erlang-xmpp.hash}                         |    2 +-
>  package/erlang-xmpp/erlang-xmpp.mk            |   17 +
>  59 files changed, 247 insertions(+), 2075 deletions(-)
>  delete mode 100644 package/ejabberd/0003-correct-includes.patch
>  create mode 100644 package/erlang-fast-xml/Config.in
>  rename package/{erlang-p1-yaml/erlang-p1-yaml.hash => erlang-fast-xml/erlang-fast-xml.hash} (50%)
>  create mode 100644 package/erlang-fast-xml/erlang-fast-xml.mk
>  rename package/{erlang-p1-yaml => erlang-fast-yaml}/Config.in (51%)
>  rename package/{erlang-p1-stun/erlang-p1-stun.hash => erlang-fast-yaml/erlang-fast-yaml.hash} (50%)
>  create mode 100644 package/erlang-fast-yaml/erlang-fast-yaml.mk
>  delete mode 100644 package/erlang-p1-sip/0001-correct-include.patch
>  delete mode 100644 package/erlang-p1-stun/erlang-p1-stun.mk
>  delete mode 100644 package/erlang-p1-xml/Config.in
>  delete mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk
>  delete mode 100644 package/erlang-p1-xmpp/0001-fix-includes.patch
>  delete mode 100644 package/erlang-p1-xmpp/erlang-p1-xmpp.mk
>  delete mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk
>  rename package/{erlang-p1-stun => erlang-stun}/Config.in (71%)
>  rename package/{erlang-p1-xml/erlang-p1-xml.hash => erlang-stun/erlang-stun.hash} (51%)
>  create mode 100644 package/erlang-stun/erlang-stun.mk
>  rename package/{erlang-p1-xmpp => erlang-xmpp}/Config.in (70%)
>  rename package/{erlang-p1-xmpp/erlang-p1-xmpp.hash => erlang-xmpp/erlang-xmpp.hash} (51%)
>  create mode 100644 package/erlang-xmpp/erlang-xmpp.mk
> 
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
