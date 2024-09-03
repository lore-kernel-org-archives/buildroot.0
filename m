Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5513CD379F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6A060741;
	Tue,  3 Sep 2024 16:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYDCSRluv_Yl; Tue,  3 Sep 2024 16:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97CFA60725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CFA60725;
	Tue,  3 Sep 2024 16:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26C0C1BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14B9280F3F
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIEqtHyuEAbC for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6FB180F47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FB180F47
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6FB180F47
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:23:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C03B1C0005;
 Tue,  3 Sep 2024 16:23:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slWJ8-004g4q-0b;
 Tue, 03 Sep 2024 18:23:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240802175033.8196383B73@busybox.osuosl.org>
Date: Tue, 03 Sep 2024 18:23:06 +0200
In-Reply-To: <20240802175033.8196383B73@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Fri, 2 Aug 2024 19:50:00 +0200")
Message-ID: <874j6wpuz9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/bcusdk: fix build with host
 GCC 14.x
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e4109c1d2d28f737409dce2e346661cbf20084c6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > With GCC 14.x as the host compiler, bcusdk fails to build as follows:

 > configure: error: Specified CC_FOR_BUILD doesn't seem to work

 > This is due to missing includes in the test programs used in the
 > configure script to check the host compiler. We fix this with patch
 > 0003.

 > However, this patch requires to autoreconf the package, and autoreconf
 > would need the definition of AM_PATH_XML2, which would require libxml2
 > even though we don't have libxml2 as a dependency of this package (we
 > don't enable the features that requires libxml2). As it turns out that
 > the AM_PATH_XML2 macro is in fact deprecated, we replaced it by its
 > equivalent using PKG_CHECK_MODULES(), which is in fact exactly how
 > AM_PATH_XML2 is implemented in upstream libxml2.

 > Fixes:

 >   http://autobuild.buildroot.net/results/458880bd6c207e5bb7afce1a1186f204c30c0941/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
