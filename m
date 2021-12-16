Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21612C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946164167D;
	Thu, 16 Dec 2021 14:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxVCuuV_RMQ4; Thu, 16 Dec 2021 14:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F298A415E4;
	Thu, 16 Dec 2021 14:47:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 117ED1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 14:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C3E60C0A
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 14:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGUmTtYLSL7k for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 14:47:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A94660AF9
 for <buildroot@uclibc.org>; Thu, 16 Dec 2021 14:47:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1481382213; Thu, 16 Dec 2021 14:41:56 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 16 Dec 2021 14:47:15 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wojciech.ziniewicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14461-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14461] New: Qt5webenegine does not build due to
 fontconfig/freetype dependency problem
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

https://bugs.busybox.net/show_bug.cgi?id=14461

            Bug ID: 14461
           Summary: Qt5webenegine does not build due to
                    fontconfig/freetype dependency problem
           Product: buildroot
           Version: 2021.08.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: wojciech.ziniewicz@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hello,
I'm experiencing the same qt5 webengine build problem on x86 64 bit
architecture with following combinations of gcc and buildroot:
- gcc8, gcc9, gcc10
- 2021.08.2, 2021.08.3, 2021.11

It seems that qt5webengine requires freetype2.pc file which exists (parallel to
other .pc files). Both pkg config/fontconfig and freetype are normally
available.
The freetype/fontconfig pair is compiled prior to qt5webengine and it does not
really matter whether I explicitly add them to the config file or not because
they are included via FONTCONFIG dependency in qt5webengine.


-------------------------------- the error:
ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned non-zero
exit code.
    pkgresult = exec_script(pkg_config_script, args, "value")
                ^----------
Current dir:
/common_cache/nerves/artifacts/rzjb_system_dev-portable-1.1.0/build/qt5webengine-5.15.2/src/core/release/
Command:
/common_cache/nerves/artifacts/rzjb_system_dev-portable-1.1.0/host/bin/python2
/common_cache/nerves/artifacts/rzjb_system_dev-portable-1.1.0/build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py
-p
/common_cache/nerves/artifacts/rzjb_system_dev-portable-1.1.0/build/qt5webengine-5.15.2/host-bin/host-pkg-config
freetype2
Returned 1.
stderr:
Package freetype2 was not found in the pkg-config search path.
Perhaps you should add the directory containing `freetype2.pc'
to the PKG_CONFIG_PATH environment variable
Package 'freetype2', required by 'virtual:world', not found
Could not run pkg-config.
See //build/linux/BUILD.gn:24:3: whence it was called.
  pkg_config("freetype_from_pkgconfig") {
  ^--------------------------------------
See //build/config/freetype/BUILD.gn:10:24: which caused the file to be
included.
    public_configs = [ "//build/linux:freetype_from_pkgconfig" ]
                       ^--------------------------------------
Project ERROR: GN run error!
make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 3
make[3]: *** [Makefile:79: sub-core-make_first] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:270:
/common_cache/nerves/artifacts/rzjb_system_dev-portable-1.1.0/build/qt5webengine-5.15.2/.stamp_built]
Error 2
make: *** [Makefile:23: _all] Error 2
--------------

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
