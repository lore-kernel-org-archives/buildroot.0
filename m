Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A9BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 17:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0895F40982;
	Sun, 20 Nov 2022 17:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0895F40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSpsrdB2c_-Y; Sun, 20 Nov 2022 17:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF0F740934;
	Sun, 20 Nov 2022 17:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF0F740934
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2251BF3F4
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 17:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ADF781D16
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 17:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ADF781D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfCBLhNKX4A8 for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 17:38:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566CF8144D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 566CF8144D
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 17:38:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38FDA60009;
 Sun, 20 Nov 2022 17:38:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1owoGW-00GUCT-6n; Sun, 20 Nov 2022 18:38:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Hunleth <fhunleth@troodon-software.com>, buildroot@buildroot.org
Date: Sun, 20 Nov 2022 18:38:00 +0100
Message-ID: <87ilj97chz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] rabbitmq-server support in Buildroot
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

Hi Frank,

You are listed in the Buildroot DEVELOPERS file for rabbitmq-server, but
it has not seen any updates since:

commit 27df8b7b0d7c6c331d2e4fe7b6ea2bd1596acd75
Author: Frank Vanbever <frank.vanbever@essensium.com>
Date:   Thu Feb 13 16:14:14 2020 +0100

    package/rabbitmq-server: bump version to 3.8.2

Are you still interested in maintaining it? If not, are anybody else?
Otherwise I suggest we remove it before the 2022.11 release.

The 3.8.x series looks to still be maintained upstream, and 3.8.2 is
vulnerable to a number of security issues, E.G.:

https://nvd.nist.gov/vuln/detail/CVE-2020-5419 (Windows only)
https://tanzu.vmware.com/security/cve-2021-22116
https://tanzu.vmware.com/security/cve-2021-22117 (Windows only)
https://github.com/rabbitmq/rabbitmq-server/security/advisories

rabbitmq-server >= 3.8.16 unfortunately requires erlang 23, so udating
is not trivial:

https://github.com/rabbitmq/rabbitmq-server/releases/tag/v3.8.16

What do you say?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
