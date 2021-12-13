Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA63C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628536F48D;
	Mon, 13 Dec 2021 16:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0aKUchR3lNs; Mon, 13 Dec 2021 16:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59016F486;
	Mon, 13 Dec 2021 16:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1CD1BF361
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 16:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29A9B6F482
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 16:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHOvfTALPLJQ for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 16:27:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C60E6F480
 for <buildroot@uclibc.org>; Mon, 13 Dec 2021 16:27:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2EB1C83824; Mon, 13 Dec 2021 16:22:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 13 Dec 2021 16:27:52 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vfazio@xes-inc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14451-163-JEumuKJ3XK@https.bugs.busybox.net/>
In-Reply-To: <bug-14451-163@https.bugs.busybox.net/>
References: <bug-14451-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14451] nodejs won't build on Fedora 35
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

https://bugs.busybox.net/show_bug.cgi?id=14451

--- Comment #1 from Vincent Fazio <vfazio@xes-inc.com> ---
Certain parts of the build invoke "python" and aren't using a full path to the
bin to do so. While PATH has been set to include the host built python3 and
PYTHON is set to host-python3 built bin, the build process is not respecting
that. We do not have a symlink python -> python3 (afaik most distros do not
include python by default, just python3) so when the build stage gets invoked
it's using the "python" available from PATH


 
LD_LIBRARY_PATH=/mnt/development/buildroot/output/build/nodejs-14.18.1/out/Release/lib.host:/mnt/development/buildroot/output/build/nodejs-14.18.1/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p
/mnt/development/buildroot/output/build/nodejs-14.18.1/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated;
python ../../deps/v8/tools/run.py
"/mnt/development/buildroot/output/build/nodejs-14.18.1/out/Release/v8-qemu-wrapper"
"/mnt/development/buildroot/output/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator"
"/mnt/development/buildroot/output/build/nodejs-14.18.1/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
