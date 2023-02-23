Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B295EC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287454094C;
	Thu, 23 Feb 2023 19:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 287454094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcIHb3JZ4zNl; Thu, 23 Feb 2023 19:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 190AD4093F;
	Thu, 23 Feb 2023 19:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190AD4093F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6616F1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C29B4093F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C29B4093F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KazdVtVpvKj for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:02:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C5BD40937
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C5BD40937
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:02:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3899720002;
 Thu, 23 Feb 2023 19:02:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pVGrQ-008Hm2-1H; Thu, 23 Feb 2023 20:02:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20221122203130.184496-1-ju.o@free.fr>
 <7b2f79e7-0880-f210-5c35-d58f7dfaf367@othermo.de>
Date: Thu, 23 Feb 2023 20:02:31 +0100
In-Reply-To: <7b2f79e7-0880-f210-5c35-d58f7dfaf367@othermo.de> (Marcus
 Hoffmann via buildroot's message of "Wed, 21 Dec 2022 23:21:26 +0100")
Message-ID: <87zg94p5mg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next v2 1/7] package/python-idna: set
 _SETUP_TYPE = flit
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > On 22.11.22 21:31, Julien Olivain wrote:
 >> Python idna package switched to pyproject.toml in commit:
 >> https://github.com/kjd/idna/commit/2a00e518efe55d2eeb62cd3f88ace7db41338603
 >> which is included in idna v3.4.
 >> 
 >> When using the old setuptools infra, the package is incorrectly
 >> installed as v0.0, which is then incorrectly detected by other
 >> packages when using setuptools pkg_resources.
 >> 
 >> The issue can be reproduced with the command:
 >> 
 >> python3 <<EOF
 >> __requires__ = ["idna >= 2.5"]
 >> import pkg_resources
 >> EOF
 >> 
 >> which will fail with output:
 >> 
 >> pkg_resources.ContextualVersionConflict: (idna 0.0.0
 >> (/usr/lib/python3.11/site-packages), Requirement.parse('idna>=2.5'),
 >> {'hyperlink'})
 >> pkg_resources.DistributionNotFound: The 'idna>=2.5'
 >> distribution was not found and is required by hyperlink
 >> 
 >> This commit changes _SETUP_TYPE to "flit" to fix this issue.
 >> 
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>

 > Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
