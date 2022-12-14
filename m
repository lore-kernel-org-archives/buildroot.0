Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12706C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 11:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D1154049F;
	Wed, 14 Dec 2022 11:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D1154049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9drGVw-d_Dbo; Wed, 14 Dec 2022 11:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99C55401FB;
	Wed, 14 Dec 2022 11:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C55401FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C374E1BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 11:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E3DE401FB
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 11:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E3DE401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8sWGni7vx8Z for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 11:16:21 +0000 (UTC)
X-Greylist: delayed 20:58:30 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38BE040127
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38BE040127
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 11:16:20 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 83146240002;
 Wed, 14 Dec 2022 11:16:14 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Wed, 14 Dec 2022 12:16:00 +0100
Message-Id: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-141d4
Subject: [Buildroot] [PATCH 0/2] package/cairo: fix multiple CVEs
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes CVE-2019-6462 with an upstream patch and CVE-2020-35492 with a patch
slightly modified compared to upstream (namely removing tests since it includes
a png file which `patch` does not know how to handle when applying the patch).

There's still one CVE in the wild: CVE-2019-6461 but there's no patch for it yet
(not even an attempt),
c.f. https://gitlab.freedesktop.org/cairo/cairo/-/issues/352.

Yocto does have a patch for it though:
https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch?id=a89bea9fed0005bc7d820a1fc6a9d6dd7c246c22
(don't mind the wrong CVE name, I'll send a patch fixing it soon).

But I'm not entirely convinced it's a proper fix? So i'll leave it up for
discussion.

Cheers,
Quentin

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

---
Quentin Schulz (2):
      package/cairo: fix CVE-2019-6462
      package/cairo: fix CVE-2020-35492

 ...gle_for_tolerance_normalized-fix-infinite.patch | 39 +++++++++++++++
 .../0004-Fix-mask-usage-in-image-compositor.patch  | 56 ++++++++++++++++++++++
 package/cairo/cairo.mk                             |  4 ++
 3 files changed, 99 insertions(+)
---
base-commit: d3d1d5a2dab19a954915c807e90ac74708b7e9ce
change-id: 20221213-cairo-cves-b0285617c92f

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
