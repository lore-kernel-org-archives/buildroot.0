Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A320C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ADD861155;
	Thu, 18 Aug 2022 06:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ADD861155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAs2X4gQJcZO; Thu, 18 Aug 2022 06:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BF161152;
	Thu, 18 Aug 2022 06:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BF161152
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB931BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9CB983E3B
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9CB983E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sD6XNMlGhQfh for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:25:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA0A83F54
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBA0A83F54
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:25:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4A2D240008;
 Thu, 18 Aug 2022 06:25:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOYyC-00Cftt-Sy; Thu, 18 Aug 2022 08:25:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220114105511.1010113-1-giulio.benetti@benettiengineering.com>
 <20220726171526.4abf4052@windsurf>
Date: Thu, 18 Aug 2022 08:25:32 +0200
In-Reply-To: <20220726171526.4abf4052@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 26 Jul 2022 17:15:26 +0200")
Message-ID: <875yiq83vn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104028
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 14 Jan 2022 11:55:10 +0100
 > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

 >> sg3_utils package fails to build for the M68K architecture with optimization
 >> enabled with gcc = 10.3.0 and it's still present in gcc = 11.1.0:
 >> http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/
 >> 
 >> It's been reported upstream:
 >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 >> ---
 >> toolchain/Config.in | 7 +++++++
 >> 1 file changed, 7 insertions(+)

 > Both applied, thanks!

Committed both to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
