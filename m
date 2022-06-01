Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F703C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E97416C3;
	Wed,  1 Jun 2022 12:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m73qIc6Xu6BB; Wed,  1 Jun 2022 12:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F50416AF;
	Wed,  1 Jun 2022 12:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 839CD1BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FECF60BFB
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A55vZnis78Pc for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:34:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CE0760BE0
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:34:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57E8820000B;
 Wed,  1 Jun 2022 12:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654086866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuM/cy73JNAZ6WnOAr2ocDtctOEs+5KD0ksUto39ZpQ=;
 b=cfRZfQhPWb2CobrTrSKK7XFmd1juiWnNsYClXb5F7beFJw8smffciQobI4Si/tFD6vQnOX
 LYMHUcTGysOsx/ddmpWhbMhhcXgwujgQONwzrOn4LwFkjwEZ6NMXzFAjyQvXRolulWuiIL
 Na+JId0EeK1UEomqjYR6IFfPGjGgTa4/xd54a52gzfU3r1KccoTST/uMzhlyVMaSPVzNno
 PZxQdxLCFIELHczOyHRWcpvw9YGmeCynlVsRTg+O4//A+O2JPlgGxDl32Pzk5rCnifW7/v
 2EYZWwnSpjCKbUqP4cAMeIpWLNV4cuvyUONU8cStZIIUAur0rtaSf9/ylVILkQ==
Date: Wed, 1 Jun 2022 14:34:25 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220601143425.78b3001f@windsurf>
In-Reply-To: <20220531194615.468956-1-fontaine.fabrice@gmail.com>
References: <20220531194615.468956-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: fix build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 21:46:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 1.5 in
> commit 41bbe8df540e2c630ad04f8db7383a7e7705f368 and
> https://github.com/rauc/rauc/commit/be55282d71d967dcc0cf48303f8245cbc8fff053:
> 
> In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
>                  from src/verity_hash.c:26:
> src/verity_hash.c: In function 'verify_zero':
> src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
>    69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
>       |                                                       ^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...src-verify_hash.c-include-inttypes.h.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch

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
