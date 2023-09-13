Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D550BEE020C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5633C8137A;
	Wed, 13 Sep 2023 20:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5633C8137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_97NEy8CMAa; Wed, 13 Sep 2023 20:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962EC81369;
	Wed, 13 Sep 2023 20:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962EC81369
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7E561BF5F5
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDBE641DFA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDBE641DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIGBkOOhMy7o for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:28:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A868241D9F
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A868241D9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 970D486EA3; Wed, 13 Sep 2023 20:28:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 22:22:33 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 8075b43085a59ceb8800008ee6112219e5f547f3
X-Git-Newrev: 4c6f56ebbc0778bb8014a54efe884f7c88a9ef13
X-Patchwork-Hint: ignore
Message-Id: <20230913202851.970D486EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] boot/grub2: backport
 fixes for numerous CVEs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c6f56ebbc0778bb8014a54efe884f7c88a9ef13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Grub 2.06 is affected by a number of CVEs, which have been fixed in
the master branch of Grub, but are not yet part of any release (there
is a 2.12-rc1 release, but nothing else between 2.06 and 2.12-rc1).

So this patch backports the relevant fixes for CVE-2022-28736,
CVE-2022-28735, CVE-2021-3695, CVE-2021-3696, CVE-2021-3697,
CVE-2022-28733, CVE-2022-28734, CVE-2022-2601 and CVE-2022-3775.

It should be noted that CVE-2021-3695, CVE-2021-3696, CVE-2021-3697
are not reported as affecting Grub by our CVE matching logic because
the NVD database uses an incorrect CPE ID in those CVEs: it uses
"grub" as the product instead of "grub2" like all other CVEs for
grub. This issue has been reported to the NVD maintainers.

This requires backporting a lot of patches, but jumping from 2.06 to
2.12-rc1 implies getting 592 commits, which is quite a lot.

All Grub test cases are working fine:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/984500585
  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/984500679

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: fix check-package warning in patch 0002]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 65c99394ff2e6cd52a79366ad693c28daca07fb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   1 -
 ...b-mkconfig-Restore-umask-for-the-grub.cfg.patch |   6 +-
 ...efi-chainloader-Simplify-the-loader-state.patch | 126 ++++
 ...ds-boot-Add-API-to-pass-context-to-loader.patch | 165 +++++
 ...er-efi-chainloader-Use-grub_loader_set_ex.patch |  80 +++
 ...-Reject-non-kernel-files-in-the-shim_lock.patch | 105 ++++
 .../0007-video-Remove-trailing-whitespaces.patch   | 689 +++++++++++++++++++++
 ...rs-png-Abort-sooner-if-a-read-operation-f.patch | 204 ++++++
 ...rs-png-Refuse-to-handle-multiple-image-he.patch |  34 +
 ...rs-png-Drop-greyscale-support-to-fix-heap.patch | 173 ++++++
 ...rs-png-Avoid-heap-OOB-R-W-inserting-huff-.patch |  44 ++
 ...rs-jpeg-Block-int-underflow-wild-pointer-.patch |  78 +++
 .../0013-net-ip-Do-IP-fragment-maths-safely.patch  |  56 ++
 ...http-Fix-OOB-write-for-split-http-headers.patch |  50 ++
 ...p-Error-out-on-headers-with-LF-without-CR.patch |  52 ++
 ...ze-overflow-in-grub_font_get_glyph_intern.patch | 116 ++++
 ...veral-integer-overflows-in-grub_font_cons.patch |  83 +++
 ...ont-Fix-an-integer-underflow-in-blit_comb.patch |  93 +++
 boot/grub2/grub2.mk                                |  19 +
 19 files changed, 2170 insertions(+), 4 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
