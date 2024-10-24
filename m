Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC2DD0E3F3
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4834660B0B;
	Thu, 24 Oct 2024 20:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngMP8v4m_Dmm; Thu, 24 Oct 2024 20:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CCD760B11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CCD760B11;
	Thu, 24 Oct 2024 20:02:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A560159BD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9209E40E10
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2ilwKoYcYYQ for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:02:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1E7940E11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E7940E11
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E7940E11
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:02:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0D0EC0007;
 Thu, 24 Oct 2024 20:02:00 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:01:59 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241024220159.51c62f54@windsurf>
In-Reply-To: <20241008180241.336214-1-ju.o@free.fr>
References: <20241008180241.336214-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729800121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QcrWcyVe13Xk2yWMXZzhma0Lr8tD0A3T3pa06MQgWI=;
 b=HS8cJfh/WNvdD+ycqX1ELxBbpztGxVeeYw/7dLRhtmTzMc1qiGnVNlCCOvkg5a0SsIWdjm
 2Rh4cXvVuqt/u/E4/fOUoxBf/CWlwQYjFgLgM11t1DfnALv6nJ1SjlxuByrht1/LDCPL6x
 iadPKBRZIXsN4VcusXCMF2Wla2NRPhsnNeABhUaS5JC/X7JydeGoaM9QsTHhm7t26207FR
 vcICuy8YavoNLFr4V4CEgucnbdHb/POoKEW91ipTGzUIwXlQAz2hj5I4E5/ulp2dzsHGR5
 Ta+DSGO2Vj/S/2bRC6BGIEa5wfSAS+R4iO75tlsW4Q+nZqZeZsM15Qw0f1PKGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HS8cJfh/
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: bump to version 5.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Oct 2024 20:02:41 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce [1].
> 
> License hash changed, due to url updates from http to https in [2].
> 
> Package patches were reworked for this new version:
> 
> - Patch 0001 is removed. It is no longer needed with upstream
>   commit [3] and [4].
> 
> - Patches 0002 to 0004 are rebased to the new version, and are now
>   named 0001 to 0003.
> 
> - Patch 0005 is regenerated to rename all occurrences of the renamed
>   header file. It is now named 0004.
> 
> - Patch 0006 is removed. It is included in the new version,
>   in commit [5].
> 
> - Patch 0007 is removed. It is fixed alternatively upstream in
>   commit [6], included in this version.
> 
> Also, the patch entries in ".checkpackageignore" were updated
> accordingly.
> 
> Since upstream commit [7], included in version 5.0.0, screen needs
> wchar support. This change is reflected in the Kconfig Config.in file.
> 
> Since upstream commit [8], included in version 5.0.0, screen needs
> a C17 compiler. This support was introduced in Gcc 8.1.0, see [9].
> This requirement is reflected in the Kconfig Config.in file.
> 
> This new version also fixes build failures with GCC 14 originally due
> to implicit function declarations which became an error. For the
> record, screen 4.9.1 builds were failing with error message:
> 
>     pty.c: In function 'OpenPTY':
>     pty.c:338:7: error: implicit declaration of function 'openpty'; did you mean 'OpenPTY'? [-Wimplicit-function-declaration]
>       338 |   if (openpty(&f, &s, TtyName, NULL, NULL) != 0)
>           |       ^~~~~~~
>           |       OpenPTY
> 
> Fixes:
> https://autobuild.buildroot.org/results/d33751d88af521f0e09d74e86d94d3ce20976c20/
> 
> [1] https://lists.gnu.org/archive/html/screen-users/2024-08/msg00000.html
> [2] https://git.savannah.gnu.org/cgit/screen.git/diff/src/COPYING?id=f66377f9927bf5a1857b1106b28008f3802e1f7b
> [3] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=46df054064dce87049eca427b7e778a42674a85c
> [4] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=725d8ee4fd4fa75cf9d2d6c2f9c7e13920f6c41e
> [5] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c76f1fcef4b5958bf828a63f53426b6984
> [6] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=84092e65f95dd2a00aa4cc2ba75682297f33dfea
> [7] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=9e8e20596f508da866a1e1469b7e6216810dd7f8
> [8] https://git.savannah.gnu.org/cgit/screen.git/commit/?id=35f50657c2d09c9995ccac6d68bfd9e2ee7109b2
> [9] https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/C-Dialect-Options.html#index-std-1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> The remaining package patches are still kept in ".checkpackageignore".
> My intent is to try to upstream those, in the future. This commit
> already reduced the number of patches from 7 to 4.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
