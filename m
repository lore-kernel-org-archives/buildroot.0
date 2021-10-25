Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83019C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0486360230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0486360230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E89740288;
	Mon, 25 Oct 2021 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKvnFvr5EhVp; Mon, 25 Oct 2021 18:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF282403B8;
	Mon, 25 Oct 2021 18:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168AE1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066A880D4C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ow1Q7p4D018Y for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:55:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBA2180EE8
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:55:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5968620005;
 Mon, 25 Oct 2021 18:54:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mf57Z-00038o-B6; Mon, 25 Oct 2021 20:54:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
 <20211008212136.721533-2-thomas.petazzoni@bootlin.com>
Date: Mon, 25 Oct 2021 20:54:57 +0200
In-Reply-To: <20211008212136.721533-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 8 Oct 2021 23:21:35 +0200")
Message-ID: <87tuh5ue7y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: use the new
 'stable_versions' field of release-monitoring.org
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The pkg-stats script queries release-monitoring.org to find the latest
 > upstream versions of our packages. However, up until recently,
 > release-monitoring.org had no notion of stable
 > vs. development/release-candidate versions, so for some packages the
 > "latest" version was in fact a development/release-candidate version
 > that we didn't want to package in Buildroot.

 > However, in recent time, release-monitoring.org has gained support for
 > differentiating stable vs. development releases of upstream
 > projects. See for example
 > https://release-monitoring.org/project/10024/ for the glib library,
 > which has a number of versions marked "Pre-release".

 > The JSON blurb returned by release-monitoring.org has 3 relevant
 > fields:

 >  - "version", which we are using currently, which is a string
 >    containing the reference of the latest version, including
 >    pre-release.

 >  - "versions", which is an array of strings listing all versions,
 >    pre-release or not.

 >  - "stable_versions", which is an array of string listing only
 >    non-pre-release versions. It is ordered newest first to oldest
 >    last.

 > So, this commit changes from using 'version' to using
 > 'stable_versions[0]'.

 > As an example, before this change, pkg-stats reports that nfs-utils
 > needs to be bumped to 2.5.5rc3, while after this patch, it reports
 > that nfs-utils is already at 2.5.4, and that this is the latest stable
 > version (modulo an issue where Buildroot has 2.5.4 and
 > release-monitoring.org has 2-5-4, this will be addressed separately).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > This should be backported to stable branches of Buildroot, so that the
 > pkg-stats results generated for those stable branches also benefit
 > from this logic.

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
