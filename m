Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36070C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D0C140308;
	Mon,  3 Jun 2024 18:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOwSdqSS49VI; Mon,  3 Jun 2024 18:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC9840574
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC9840574;
	Mon,  3 Jun 2024 18:09:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 636441BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C87540574
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbO6QpeoU-m6 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D8C040308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8C040308
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D8C040308
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 18:08:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDECB60005;
 Mon,  3 Jun 2024 18:08:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEC76-004O9w-0x;
 Mon, 03 Jun 2024 20:08:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240509172325.1493586-1-thomas.petazzoni@bootlin.com>
Date: Mon, 03 Jun 2024 20:08:56 +0200
In-Reply-To: <20240509172325.1493586-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 9 May 2024 19:23:24 +0200")
Message-ID: <875xuphpaf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: really make
 DL_SUBDIR inheritance work
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > While bumping kodi, we figured out that the kodi-texturepacker and
 > kodi-jsonschemabuilder were both re-downloading the main Kodi tarball,
 > even though they contain:

 > KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
 > KODI_TEXTUREPACKER_DL_SUBDIR = kodi

 > Both are host packages, and turns out that changing those variables to
 > HOST_ ones made the download sharing work.

 > Commit efa7712b092950c92f994e2ee30c120a64e5451b ("package/pkg-generic:
 > host variant inherits target download settings") introduced
 > inheritance of host variables from target variables from a number of
 > variables, including DL_SUBDIR. But it missed the fact that earlier in
 > pkg-generic.mk, the following line was defined:

 >   $(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)

 > So, when this later code kicked in:

 >  ifndef $(2)_DL_SUBDIR
 >   ifdef $(3)_DL_SUBDIR
 >    $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
 >   endif
 >  endif

 > In fact it never did anything because $(2)_DL_SUBDIR would never be
 > undefined. This commit fixes this issue by properly adjusting the
 > logic to inherit the value of the target variable when it exists, or
 > defaulting to $$($(2)_RAWNAME) otherwise.

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
