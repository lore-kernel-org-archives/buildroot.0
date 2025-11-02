Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E69DCCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 18:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA0E41FFC;
	Sun,  2 Nov 2025 18:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GC_hucaAMrXN; Sun,  2 Nov 2025 18:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2809D41FE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2809D41FE8;
	Sun,  2 Nov 2025 18:47:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CB64436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FFFF403B2
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id um24-vc6MiFU for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 18:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B9014036F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B9014036F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B9014036F
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:47:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7780E13F88F;
 Sun,  2 Nov 2025 19:47:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 19:47:52 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 19:47:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251012164922.3447879-1-bernd@kuhls.net>
References: <20251012164922.3447879-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <125aa51c421ad58a7cf8a936c906d9ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762109273;
 bh=rWV4sYx72UCGDBSorLimlT0WXLH5VnBayTqx8LvN6P4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SdLzfdR4gTh8kbldgPhBNIFKq7+M53dfmo/7QF+goTT8SpX2IDAGsGXOWOno1K/NR
 Y0CVkGWBWJCnRp8aNqGqd5O2gMDRvGB/i0ZJjoK2FonkFQEtmR2KBIFkc4CXiDHulA
 tznNEa3SO4pqs0POGn+SovB0yJwcXJzagA98t//RRsOb+xgzJ3gQxfqj7e+X9iImYP
 nNV2KetTnjBeabcyc9v5GYslx5iHFOUUHEnj80TxP0EAngUaSNswkvTkmb6pK7uil4
 x38eX5lusMiRydcF7kbK9PpNt+aVZuXvLJj1hX0nnvRelb552Ybyo+55GT6BH+njI1
 tyLF4n0ZSwR2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SdLzfdR4
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

It introduces few build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2135499293

It might be needed to add "--disable-year2038" in _CONF_OPTS with this 
version.

Could you also add release notes or announces, since v9.5 please?

On 12/10/2025 18:49, Bernd Kuhls wrote:
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...001-coreutils-mcel-port-to-uClibc-ng.patch | 35 -------------------
>  package/coreutils/coreutils.hash              |  2 +-
>  package/coreutils/coreutils.mk                |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 
> package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
> 
> diff --git 
> a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch 
> b/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
> deleted file mode 100644
> index 7639509ff2..0000000000
> --- a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From c4e923a98f34fe5f5ec3b49543e90716ec2a45fc Mon Sep 17 00:00:00 2001
> -From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> -Date: Tue, 24 Sep 2024 18:08:31 +0200
> -Subject: [PATCH] coreutils: mcel: port to uClibc-ng
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Problem reported by Waldemar Brodkorb in:
> -https://lists.gnu.org/r/bug-gnulib/2024-08/msg00130.html
> -* lib/mcel.h (mcel_scan): Don't treat uClibc-ng like glibc.
> -
> -Upstream: 
> https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249
> -Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ----
> - lib/mcel.h | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/mcel.h b/lib/mcel.h
> -index f6f006c..dca4d08 100644
> ---- a/lib/mcel.h
> -+++ b/lib/mcel.h
> -@@ -221,7 +221,8 @@ mcel_scan (char const *p, char const *lim)
> -
> -   /* An initial mbstate_t; initialization optimized for some 
> platforms.
> -      For details about these and other platforms, see wchar.in.h.  */
> --#if defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__)
> -+#if (defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__) \
> -+	&& !defined __UCLIBC__)
> -   /* Although only a trivial optimization, it's worth it for GNU.  */
> -   mbstate_t mbs; mbs.__count = 0;
> - #elif (defined __FreeBSD__ || defined __DragonFly__ || defined 
> __OpenBSD__ \
> ---
> -2.39.2
> -
> diff --git a/package/coreutils/coreutils.hash 
> b/package/coreutils/coreutils.hash
> index 3455c95c58..2c353f0f6d 100644
> --- a/package/coreutils/coreutils.hash
> +++ b/package/coreutils/coreutils.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  
> cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a  
> coreutils-9.5.tar.xz
> +sha256  
> e6d4fd2d852c9141a1c2a18a13d146a0cd7e45195f72293a4e4c044ec6ccca15  
> coreutils-9.8.tar.xz
>  # Locally computed
>  sha256  
> 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  
> COPYING
> diff --git a/package/coreutils/coreutils.mk 
> b/package/coreutils/coreutils.mk
> index a6d193b49e..be7569ed99 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -COREUTILS_VERSION = 9.5
> +COREUTILS_VERSION = 9.8
>  COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
>  COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
>  COREUTILS_LICENSE = GPL-3.0+
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
