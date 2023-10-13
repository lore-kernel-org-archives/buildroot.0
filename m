Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96486CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F9960FDF;
	Fri, 13 Oct 2023 14:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F9960FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTLgavGGpszt; Fri, 13 Oct 2023 14:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8886560F1F;
	Fri, 13 Oct 2023 14:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8886560F1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8531BF2F8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78EF1821FD
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78EF1821FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gc6ApvF5JfBQ for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:36:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1846D821B1
 for <buildroot@busybox.net>; Fri, 13 Oct 2023 14:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1846D821B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26C7F240003
 for <buildroot@busybox.net>; Fri, 13 Oct 2023 14:36:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qrJH0-007J3M-El
 for buildroot@busybox.net; Fri, 13 Oct 2023 16:36:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@busybox.net
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-11-herve.codina@bootlin.com>
 <1bc18a02-9cf3-0cd1-cf8a-e716ceb78b9a@korsgaard.com>
Date: Fri, 13 Oct 2023 16:36:18 +0200
In-Reply-To: <1bc18a02-9cf3-0cd1-cf8a-e716ceb78b9a@korsgaard.com> (Peter
 Korsgaard's message of "Sun, 1 Oct 2023 14:56:19 +0200")
Message-ID: <875y3a613x.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 10/16] Makefile: breaks hardlinks in
 global {TARGET, HOST}_DIR on per-package build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On 17/08/2021 10.39, Herve Codina wrote:
 > Hi,

 > Sorry, very old patch.


 >> Without this patch, a make <pkg>_rebuild detects overwrites. Indeed, in
 >> target_finalize steps some modifications are done on installed files (ie
 >> strip or TARGET_FINALIZE_HOOKS for instance).
 >> In order to avoid these modifications seen from per-package
 >> {TARGET,HOST}_DIR
 >> and so been analyzed as some overwrites, global {TARGET,HOST}_DIR is built
 >> using a full copy of the involved per-package files instead of hardlinks.
 >> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
 >> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> ---
 >> Changes v1 to v2:
 >> - Added 'Reviewed-by: Yann E. MORIN'

 > We have similar issues if you have a post-build script making changes
 > with sed or similar, so committed to master after fixing it up (the 
 > logic was in the mean time moved to package/pkg-utils.mk), thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
