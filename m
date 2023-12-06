Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F4C10F04
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 08:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C62E81769;
	Wed,  6 Dec 2023 08:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C62E81769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5aDb0uFfzCT; Wed,  6 Dec 2023 08:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82DDE8176A;
	Wed,  6 Dec 2023 08:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82DDE8176A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77A1C1BF32A
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 08:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D77760B49
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 08:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D77760B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lz4JX7fmYGDx for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 08:15:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED2A660B13
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 08:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2A660B13
Received: by mail.gandi.net (Postfix) with ESMTPSA id 341604000B
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 08:15:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rAn4L-00DEOa-1R
 for buildroot@buildroot.org; Wed, 06 Dec 2023 09:15:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 06 Dec 2023 09:15:45 +0100
Message-ID: <87y1e7sq4u.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Talos security vulnerabilities TALOS-2023-1844 /
 TALOS-2023-1845
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

FYI,

Talos recently reported a number of security vulnerabilities in the
package download hash checking in Buildroot, and these are now public
at:

https://talosintelligence.com/vulnerability_reports/TALOS-2023-1844
https://talosintelligence.com/vulnerability_reports/TALOS-2023-1845

A small number of packages did not have a .hash file, meaning that the
downloaded sources were not verified - And for aufs + aufs-util they
were downloaded from a http:// site, so conceptually vulnerable to a man
in the middle attack.

aufs/aufs-utils were changed to fetch from https by:

https://gitlab.com/buildroot.org/buildroot/-/commit/f2a590750f5bedcee48ce7beb8f35356b42eda11
https://gitlab.com/buildroot.org/buildroot/-/commit/99d525028f969220719a4e6bcd694f7d9cfd5b67

The fallback download location on source.buildroot.net was changed to
use https:// by:

https://gitlab.com/buildroot.org/buildroot/-/commit/05296ced369bab8877efa624f3d9b4d201ba5b38

Hash files for riscv64-elf-toolchain and mxsldr were added by:

https://gitlab.com/buildroot.org/buildroot/-/commit/58d7c712d7d1ef5b439ead455a4ed2ca659b60fb
https://gitlab.com/buildroot.org/buildroot/-/commit/fefcfddc5e6a265c66adbdff615558f99133f148

Which are all included in 2023.02.7 / 2023.08.3 / 2023.11.


Some packages allow a custom version or even a custom upstream location
(E.G. Linux, U-Boot, versal-firmware, ..). For those custom versions
Buildroot naturally cannot provide the expected hash, so instead we have
added support for providing hashes for those files in the
BR2_GLOBAL_PATCH_DIR location and added a
BR2_DOWNLOAD_FORCE_CHECK_HASHES option to enforce hash checking (and
fail if missing/invalid) for all downloads. This was added by:

https://gitlab.com/buildroot.org/buildroot/-/commit/5d36710e36fc4698c8fae71675bcff7395246006
https://gitlab.com/buildroot.org/buildroot/-/commit/e091e31831122b60b084bd755e94df4dfe7188d2

To make it easier to manage these custom hash files a
utils/add-custom-hashes helper script has been added by:

https://gitlab.com/buildroot.org/buildroot/-/commit/4984d0f230d0962270beb195966603f1d5a56300

Which are all included in 2023.02.7 / 2023.08.3 / 2023.11.

See the documentation for further details about this feature:

https://buildroot.org/downloads/manual/manual.html#_adding_project_specific_patches_and_hashes

Notice that it is up to the user of Buildroot to use this feature to
protect their custom downloads!


Finally the toradex_apalis_imx6_defconfig fetched Linux and U-Boot from
a git:// URL, so custom hashes were added in the BR2_GLOBAL_PATCH_DIR
for those by:

https://gitlab.com/buildroot.org/buildroot/-/commit/cdc9b8a3a75c4c39f23feb4e3b0e296786e0132c

Which is included in 2023.02.8 / 2023.08.4 / 2023.11.


Thanks to Talos for discovering and reporting these issues to us and to
Yann E. MORIN for implementing the custom hash logic.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
