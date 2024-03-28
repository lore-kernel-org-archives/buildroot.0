Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC55CD11DD
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 19:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254EF40144;
	Thu, 28 Mar 2024 19:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YGlolqJal1b; Thu, 28 Mar 2024 19:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EBC4016D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EBC4016D;
	Thu, 28 Mar 2024 19:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25FCF1BF83E
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 19:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119FF40144
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 19:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kp_tnaW8PlpE for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 19:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3068C4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3068C4013C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3068C4013C
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 19:53:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EEA7A13F8A9;
 Thu, 28 Mar 2024 20:53:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Mar 2024 20:53:18 +0100
Date: Thu, 28 Mar 2024 20:53:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZgXKrtfSjahxswtP@landeda>
References: <20240311160323.3015689-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240311160323.3015689-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711655601;
 bh=kBhIf0EkOlW12T7g5KbiMcHobO4qiVyHwEPi0eMItPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PrgYAn0oNkVk5nU9OXgRSbzWY/3/7ScjOGeVSWDkUh/K6ogDoBThslhMUspYmRvLp
 3QQQcP05uLQXozzY5M+L+c+fYOw+3Vvg4FHiNzlPK9TKeUutsVUoOcE1Aroo5YkNUf
 5eXRhxBXCFgv/hcxJtplPxV4mqj1bIItCy2K3Zduj7HkZsGTfWO/hskJGtUQtSsXud
 FQy5uG+xrKsOINsrcxI2oqRhgPekdjZCPlBu10MKiFfe73cYKDFa5HMSQz2YIuDuVp
 p8UJ5Psux6Ccm86BLnXcDc7Y3H12AWezfi9ilr2pfC267n4Ay7Bzfy4pepitu0WRUR
 pPdTHzXKsEcNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PrgYAn0o
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.46.0
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

James, All,

On 2024-03-11 10:03 -0600, James Hilliard spake thusly:
> Drop patch which is now upstream.
> 
> CONTRIBUTING.md hash changed due to details added:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/5481ba156804f979cb2d585df3dc012ff3002755

Thanks foir pointing this.

However, I wonder if w ereally need to keep CONTRIBUTING.md in the list
of license files.

It was added back in 20129 with a1d95ce2f448 (package/network-manager:
fix legal-info following the 1.20.0 bump), on the rationale that the
only other license file was listing the GPLv2.0, while NM also has
LGPLv2.1+ files, so CONTRIBUTING was added to the list at it mentioned
that fact.

But a few days later, with 402ad9fe5407 (package/network-manager: bump
to version 1.22.10), a COPYING.LGPL was added to the list, making it
explicit that  NM is also covered by the LGPLv2.1+, and thus making
CONTRIBUTING irrelevant.

So I think we should drop it now. Care to send a patch doing so, please?

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-curl-timeout-callback-non-repeating.patch | 44 -------------------
>  package/network-manager/network-manager.hash  |  6 +--
>  package/network-manager/network-manager.mk    |  4 +-
>  3 files changed, 5 insertions(+), 49 deletions(-)
>  delete mode 100644 package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> 
> diff --git a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch b/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> deleted file mode 100644
> index 8e25805d0c..0000000000
> --- a/package/network-manager/0001-connectivity-make-curl-timeout-callback-non-repeating.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From abc6e1cf258ab332bed161036a358bbe9c2d1e90 Mon Sep 17 00:00:00 2001
> -From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> -Date: Fri, 13 Oct 2023 16:46:09 +0000
> -Subject: [PATCH] connectivity: Make curl timeout callback non-repeating.
> -
> -This reverts commit 05c31da4d9.
> -
> -In the linked commit the callback was made repeating on the assumption
> -that forward progress would result in the callback getting canceled in
> -cb_data_complete. However, this assumption does not hold since a timeout
> -callback does not guarantee completion (or error out) of a request.
> -
> -curl tweaked some internals in v8.4.0 and started giving 0 timeouts, and
> -a repeating callback is firing back-to-back without making any progress
> -in doing so.
> -
> -Revert the change and make the callback non-repeating again.
> -
> -Fixes: 05c31da4d9cb ('connectivity: don't cancel curl timerfunction from timeout')
> -Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/abc6e1cf258ab332bed161036a358bbe9c2d1e90
> -Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ----
> - src/core/nm-connectivity.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/core/nm-connectivity.c b/src/core/nm-connectivity.c
> -index 92de44f17d..d8b0004c38 100644
> ---- a/src/core/nm-connectivity.c
> -+++ b/src/core/nm-connectivity.c
> -@@ -406,9 +406,10 @@ _con_curl_timeout_cb(gpointer user_data)
> - {
> -     NMConnectivityCheckHandle *cb_data = user_data;
> - 
> -+    cb_data->concheck.curl_timer = 0;
> -     _con_curl_check_connectivity(cb_data->concheck.curl_mhandle, CURL_SOCKET_TIMEOUT, 0);
> -     _complete_queued(cb_data->self);
> --    return G_SOURCE_CONTINUE;
> -+    return G_SOURCE_REMOVE;
> - }
> - 
> - static int
> --- 
> -GitLab
> -
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index 0196d68c55..8a3c3895fe 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,6 +1,6 @@
> -# From https://download.gnome.org/sources/NetworkManager/1.44/NetworkManager-1.44.2.sha256sum
> -sha256  4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab471d8bb2c9a420e1  NetworkManager-1.44.2.tar.xz
> +# From https://download.gnome.org/sources/NetworkManager/1.46/NetworkManager-1.46.0.sha256sum
> +sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  NetworkManager-1.46.0.tar.xz
>  # Locally computed
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> -sha256  e7cf3d92bda8e5365eaf4514d572146a19e93336f7a966493778d0d0c4476fae  CONTRIBUTING.md
> +sha256  9f7f0d40116e5a0f1566b9da71e9c95738c99364e4b5437d8115aa614490372b  CONTRIBUTING.md
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index f6ef923d55..09bc6aed02 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -NETWORK_MANAGER_VERSION_MAJOR = 1.44
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
> +NETWORK_MANAGER_VERSION_MAJOR = 1.46
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
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
