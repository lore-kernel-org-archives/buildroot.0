Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8489AC3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F42E822ED;
	Tue, 13 May 2025 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWnrlewZrVfb; Tue, 13 May 2025 19:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F638214E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F638214E;
	Tue, 13 May 2025 19:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C92D153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3527411CA
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpRY8j9apVcH for <buildroot@buildroot.org>;
 Tue, 13 May 2025 19:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F125C410B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F125C410B4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F125C410B4
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:54:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9B5D45FFAF;
 Tue, 13 May 2025 21:54:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 21:54:42 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 21:54:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250512214759.443958-1-bernd@kuhls.net>
References: <20250512214759.443958-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <525ab9dc6a65e244195a756308a08c00@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747166083;
 bh=coHulgBgl3AR6LQREYnVxQUHlxc/JJCJqWrxBbsMKa0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FKU89IoR165MbYMU+h3XG6ILdalq3Ev/K4QV8yYJoWq5O/rynDgRBeLXNcRtnifpG
 Km8gUO3F3w54RSPL76vAlXdFv/BZzAmmkC9VUAU7nLXwN+Vn4zVSsrLb/jq/ABUkB+
 YRh/PS5V6ncybQEB06qOeZ4Zi6ZalHEPS3UmJ+hsyW6dBaYX10bUg4lqH9cGF6Qxxl
 HdmUofg3Bi6jLZ1GUtuLZ++8Os4MNgrqnjDCmM1cINxTNQckaB+IFClZp6FpruioJQ
 eKOKpaun24xFDpdBqifcIizNcGe00w/Zxn2jQkkRE7NldVHwdm/1YvRWY8d6/BjPZW
 l6a5pmde0CxFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FKU89IoR
Subject: Re: [Buildroot] [PATCH] package/unixodbc: fix build with gcc-15.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

Unfortunately, unconditionally passing "-std=gnu17" like this
introduces build failure in Buildroot. See for example:
https://gitlab.com/jolivain/buildroot/-/pipelines/1815804817

See below.

On 12/05/2025 23:47, Bernd Kuhls wrote:
> Inspired by
> https://gitweb.gentoo.org/repo/gentoo.git/commit/dev-db/unixODBC?id=b5629b3aefd8633d378beea7e955d66ce709bebe
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/unixodbc/unixodbc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/unixodbc/unixodbc.mk 
> b/package/unixodbc/unixodbc.mk
> index 28f1e5bc94..fa69776e04 100644
> --- a/package/unixodbc/unixodbc.mk
> +++ b/package/unixodbc/unixodbc.mk
> @@ -12,6 +12,7 @@ UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ 
> (programs)
>  UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
>  UNIXODBC_CPE_ID_VENDOR = unixodbc
> 
> +UNIXODBC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"

This "-std=gnu17" option was introduced in gcc-8 and is not
recognized in earlier gcc versions. See:
https://gcc.gnu.org/gcc-8/changes.html#c

Passing this option is really needed with gcc-15 (because it
changed its default), but gcc-15 is not yet merged in Buildroot.
We plan to do so just after the 2025.05 release. So we cannot
currently write something like:
"ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)"

So maybe you could pass this option only when the target gcc
version is sufficient and add a comment? For example:

# gcc-15 defaults to -std=gnu23 which introduces build failures.
# We force "-std=gnu17" for gcc version supporting it. Earlier
# gcc versions will work, since they are using older standard.
ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
UNIXODBC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
endif

>  UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
> 
>  ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> --
> 2.39.5

Can you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
