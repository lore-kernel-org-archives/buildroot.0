Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C879C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 03:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6F561064;
	Wed, 30 Mar 2022 03:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_GzCVG6DglX; Wed, 30 Mar 2022 03:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E946105B;
	Wed, 30 Mar 2022 03:18:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57B681BF3BE
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 03:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44FE140142
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 03:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6zdEqGQ8WsW for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 03:17:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50E44401B1
 for <buildroot@uclibc.org>; Wed, 30 Mar 2022 03:17:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6161285F94; Wed, 30 Mar 2022 03:08:45 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 30 Mar 2022 03:17:59 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emile.cormier.jr@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14721-163-UE8AK4Uz7F@https.bugs.busybox.net/>
In-Reply-To: <bug-14721-163@https.bugs.busybox.net/>
References: <bug-14721-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14721] python-argon2_cffi no longer works
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

https://bugs.busybox.net/show_bug.cgi?id=14721

--- Comment #1 from Emile Cormier <emile.cormier.jr@gmail.com> ---
TL;DR: The new Python flit setup infrastructure seems to be deploying to the
wrong destination directory.

-----

I see now that argon2-cffi now uses the new flit setup type. The argon2-cffi
package now gets installed under

    /lib/python3.10/site-packages/argon2

whereas it used to be installed under

    /usr/lib/python3.10/site-packages


Here's the output of 'python -m site' on my BeagleBone Black device:

sys.path = [
    '/lib/python3.10/site-packages/argon2',
    '/usr/lib/python310.zip',
    '/usr/lib/python3.10',
    '/usr/lib/python3.10/lib-dynload',
    '/usr/lib/python3.10/site-packages',
]
USER_BASE: '/root/.local' (doesn't exist)
USER_SITE: '/root/.local/lib/python3.10/site-packages' (doesn't exist)
ENABLE_USER_SITE: True


If I add /lib/python3.10/site-packages to the "real" system-wide site-packages
via:

    echo "/lib/python3.10/site-packages" >
/usr/lib/python3.10/site-packages/extra.pth

then argon2 now appears in

    python -c 'help("modules")'

and the following test command works!

    # python -c 'from argon2 import PasswordHasher;
print(PasswordHasher().hash("correct horse battery staple"));'
   
$argon2id$v=19$m=65536,t=3,p=4$CZO2H3qcZr/Vp9w0qVpLxA$eAz24Ry+cvSdRTJaPYDcf9HTc/Zyq/PmoFkFFPcQHm0

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
