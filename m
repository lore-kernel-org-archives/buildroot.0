Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F906C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E7160F59
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0E7160F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF3740474;
	Mon, 18 Oct 2021 19:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyjGmYKp3DED; Mon, 18 Oct 2021 19:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C154047D;
	Mon, 18 Oct 2021 19:42:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE081BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BF22402AB
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPgiNqLnkxPy for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:41:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 382A7400EF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:41:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1C8C720007;
 Mon, 18 Oct 2021 19:41:23 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:41:22 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211018214122.244d983c@windsurf>
In-Reply-To: <20211015062208.201342-1-fontaine.fabrice@gmail.com>
References: <20211015062208.201342-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/shairport-sync: fix build with
 automake 1.16.5
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
Cc: =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Oct 2021 08:22:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with convolution raised since bump of
> automake to version 1.16.5 in commit
> 446d9f510255dda094d2ea89ad4f24a334b0ecc7 and
> https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:
> 
> configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
> configure.ac:6: the top level
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
> configure.ac:305: the top level
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re.ac-fix-build-with-automake-1.16.5.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch

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
