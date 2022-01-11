Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A545C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30494415FC;
	Tue, 11 Jan 2022 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2eoocU3zsAI; Tue, 11 Jan 2022 21:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9673E415F7;
	Tue, 11 Jan 2022 21:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1761BF427
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49EA040904
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FId4H-MQbiVU for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 451D5408FE
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:09:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C8AE9C1C1F
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:01:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 94ED9E0004;
 Tue, 11 Jan 2022 21:01:48 +0000 (UTC)
Date: Tue, 11 Jan 2022 22:01:47 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220111220147.2aa99684@windsurf>
In-Reply-To: <20220110174411.1761440-1-fontaine.fabrice@gmail.com>
References: <20220110174411.1761440-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: fix build with gcc 4.8
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

On Mon, 10 Jan 2022 18:44:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump to
> version 2.28.0 in commit 0f8aab08e762742d753d5920718f31c629d0f8d7:
> 
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c: In function 'mpi_select':
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c:1994:5: error: 'for' loop initial declarations are only allowed in C99 mode
>      for( size_t i = 0; i < T_size; i++ )
>      ^
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c:1994:5: note: use option -std=c99 or -std=gnu99 to compile your code
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/56ac0a8726d09eed8f45f865934fa7781a0e667a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbedtls/mbedtls.mk | 1 +
>  1 file changed, 1 insertion(+)

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
