Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17635CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D237D60D91;
	Thu,  1 Oct 2026 14:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svBHK6wLq2w9; Thu,  1 Oct 2026 14:23:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA08460C1C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864582;
	b=mimg+aFpscTE+dppF12LGPZMZuzlJouhaP99o/J4sznuPnMbEeOymVhfdHB3FuyaLiYq
	 yH6ZLymBC3dGZVJZJ7QiaE0UQPOJvz+OadagQHUth++KA7Kqrn2gUS9TgBEhMM+hlGG3b
	 NL5GnHOZ4/w00e19lPXobsOzrA/pbHH41ldRaC/jIHQckcxijOf3fBfqHdOPGeFifxQzO
	 OKDlkN79trtbIjEraAEqdJFnna32/SiDyUKO8MNa1jmXGAiAQ842zo6CGtqZMLIkFqt5C
	 QW2e19JHUbEBnL7+G+6zIgeBp8JbDxtakQ5TiRUK8hJj4dyXTFG0iC/f4v9o+vwMeog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864582;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Gv62FLeqklDMnS1EpJKoNYn+yMzltRSY8q8byBpfK3k=;
	b=TMitNNOvTFFiEgVct6fWQ+QDpFjc/dOC0JykiJc6g9QDVeD8XK0Gxt8/p1mvR3EnVw4f
	 8KUXyOAtVQHgPHgUzfMhyYU3migW1R7gpgZoAW7WbWiLff3RGy/dgMs1AER7H/sJjowjV
	 loiFyRh6WZP9JluYk/4tBGPeS9Yo1qRJY+3ppraxtzpb4UG+W5To8DRxhlNTJ2QEFLs4L
	 VkbKpV9kRmNdGm156Am/L6JBAg+EUikwLeobk7Wik0FfGm6SSb3qFoZ+26NEhhcdD4ken
	 W0j6u2ia1G0T8F7cXfL1oEDLtgCzNrTC3Sy89EfHtxbAIw0SYugcGQlBvvuaHRvbDyw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864582;
	bh=Gv62FLeqklDMnS1EpJKoNYn+yMzltRSY8q8byBpfK3k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=POK/7HbhzUK5jRJNZNLBaiTrtbJ88tz/Lig9tBwXu4yqCWl9EMauxg18wT2wNDY8o
	 e8WQD4IyAB1jeUsFlmpypRU3D1FNgCWFzuqc9wvERJMOSLYvctFNCkW9QAc7P3Jf0p
	 VVXATtlzENQK6uSn4c91jKSMPuSQh5zdkmYbo1qUAmq+fuUWxUKdh+UAPQc/eWfvo8
	 caHUylTUCaX8OnDGh2bUkxukZXZG0YvJZzRcXFyOYUuxiFJiTbClE4oikB2X44Z2uM
	 700zvSHl3C4pR6+Fos6fAQERUfV43Sl6mZGAYXccwXJLvVuPxfT7gkSFmuqtIHSMHF
	 uvVfJjSsytl9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA08460C1C;
	Thu,  1 Oct 2026 14:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D434A1FF0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8154607D4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POXtWJFnoqj8 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 95C60606CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=IpHmsdDaq4H5AnWMLNHoHMaMAzIalienl3Hm8xQDM+gJaaY7XGpfZuKebn4M5BKgIGUW
 UcFsOEThRVR5LWm3H94FW6pVLS/ZTLHVKwOh8s+JSRURYSEi3tbtjn0ZEdAy2cRpUOBER
 7nowb+yl2yPxMRokpKsV2lb/HVvfN2/KY69S1Ktr2xsW/hUerJGbXSjcbgr1InXo21vHF
 RelCD/88MGqQdphSEYEq//IWa9TGYWj+abZ52QVkf9JmH+m8EJ7jcOVDGHuFG6g2q70ii
 OHDn8fZvjAjYwckw8IFUrdcgGB1N457tC6StN2RPk0q6Mf81XAlELFSRIkp6uYK/oNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=puh/1TW/kb7TYP6j6tZXW33KNLG7tUfrtA2TWn2lLoY=;
 b=QydW3uE/exhAr8RrC+st7kY+OJRmUeSW21UtTCxQQRwbnigEwQ2oGDFwMZA1kt7k3rA8
 pO/pNwGamQ2OJ5jSe+Rt6DaVmBooXL2uj1s3aTqitAQ2vF0z6JJx/uZcR1oVH47AuVEss
 kjHrXoUBfM1JvUzBi/84ABczkj9k154ao936RKH7IY5nSE2L+nDhIxPpb6svasAaOGpDI
 Rq7TqMWzrebtXXaiZVgoZf8pex2U0JCEUihahjYqkjs8iClrFWGOLjE+JiMf84rnNFqMW
 OPA1FYTUV8Ie7e0aJ8jZ4NxMKiDaItYlkKFHvLuA6yjERL0ZGKYHDjSSCWQa/PaQG3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95C60606CA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF6999844E; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 01b162ff939da94cb83f49c548d8f81be73e8957
X-Git-Newrev: da5160950c994eaa8a2a6cb61d8b3f71fa41c58a
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.CF6999844E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] .checkpackageignore:
 remove entry for mrouted package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4513879761242255230=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4513879761242255230==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da5160950c994eaa8a2a6cb61d8b3f71fa41c58a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit [1] (package/mrouted: fix invalid daemon path in
S41mrouted) removed script execution permission but forgot to remove
the corresponding .checkpackage entry.

check-package is reporting the error:

    package/mrouted/S41mrouted:0: NotExecutable was expected to fail, did you fix the file and forget to update /builds/buildroot.org/buildroot/.checkpackageignore?

This commit fixes the issue by removing the entry.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16661195972

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d8f408b1f16d067d2e676f3db91e7b337aebe160

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e2b81003a490363bf249fc5a2ff4660f02333e8f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4632d9e8e6..441db0f32c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -738,7 +738,6 @@ package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
-package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
 package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch lib_patch.Upstream
 package/multipath-tools/S60multipathd Shellcheck

--===============4513879761242255230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4513879761242255230==--
