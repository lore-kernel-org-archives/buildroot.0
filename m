Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09B2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82EB583E40;
	Tue, 11 Jan 2022 20:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTwZ33UxC2_j; Tue, 11 Jan 2022 20:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE75F8349A;
	Tue, 11 Jan 2022 20:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4DD1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 486D440517
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCSxxwpBc0CE for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:32:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E891F4016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:32:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 71977100004;
 Tue, 11 Jan 2022 20:32:55 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:32:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220111213254.0073693d@windsurf>
In-Reply-To: <20220110225200.2000095-1-fontaine.fabrice@gmail.com>
References: <20220110225200.2000095-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix musl build
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

On Mon, 10 Jan 2022 23:52:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since bump to version 5.15.1
> in commit 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359:
> 
> In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
>                  from ./kerncompat.h:31,
>                  from common/utils.c:42:
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
>     7 | struct sysinfo {
>       |        ^~~~~~~
> In file included from common/utils.c:27:
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
>    10 | struct sysinfo {
>       |        ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nst-h-to-fix-build-with-5-12-headers.patch | 43 ++++++++++++++++
>  ...-sys-sysinfo-h-conditionally-on-musl.patch | 49 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
>  create mode 100644 package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch

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
