Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B24DC98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 18:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A5D680EAD;
	Tue, 22 Sep 2026 18:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZX9L6FIPLmZ; Tue, 22 Sep 2026 18:15:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2DA6680EA0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790100922;
	b=a/v7JdsxlaVS01Otx4xzt8gBvB17i4GcgKk2s+iF6D758em+8qAF8zD1zUBrOO4Uls+G
	 +uDxQTEiNkl54uwMzreubCJVeDG6ElQszQtetqn3dX7ESCOVZb82HWqeFdCpYm6pRUQAI
	 gYlHb5QnhT0ads54eS/dmohuAEL4kVrM9LM6hWsg9013ZKrDd0r0A2U4M0Rm+o58v/nL+
	 CITcJmOcqyVZrxi/mGM2VVfFurdJqynwjpm3aq+gp/uSNq0Uh9FCvx+0B5nRCeUYKEHRd
	 BLTz+XASuKHtPK+kxneuxHPY6MnxkXTPU6CODBJx8tsNMzW9T3w0mtcLYyyiuDHwO1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790100922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RcO0Jmn0p6VEYApe0MrckNv5HoccRp2a8ncltdUxnTs=;
	b=K9MnxAc0wFjOHkEsleCt80ZwARtrH+I5zXSRNJBgdirKNdf3dkCVFdAiqd8dHibiXUuJ
	 wFl4sUwcHimavd2OKKimHqhc5NUErdtiUjFSqz9FB1sZ10xbpce5olWpLTsdRMmc6Pb9c
	 7Hih4nKqNYylniTor6GItU8JwE9txAFVBMmeZLHw6xNd6oBscX0W9ibCLYy3zBk+tS0iK
	 Nmem6J8PhMJicdqeIpu6wcpFqSzJ3XSnCED+6xY4DZmTPva+2tI/A5R7jpRKUCQ933xGZ
	 Hz9yJ4TuXIdkoAMhjiZb/EiIqWsm+fSSp9UAkXZ1yxtKCh8wchDsYHVLbnyxFsEJ/cA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790100922;
	bh=RcO0Jmn0p6VEYApe0MrckNv5HoccRp2a8ncltdUxnTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FpaWQse3aBQ4xqz3aWFV0PDqZU/lO+Tgqu2LtiRWRdK3cbZ+eqOEggeIGmzU5E92+
	 B29kNhBJWMPu/vIz5VkRTPmfPpDmvOUGalsZcHaYzP+GJAxaUh4IpNiwKZzjHzZD5r
	 AoqTckN0Xgo1y9333GJs1+ZMDui5nc4YDaUPL1a5wBzC7cFN6EO8aScSpnHYZMCt2g
	 bwNqtOx4ACDU/f0vf9jelKnmVUczx5H4EOHLUqIwOaOve4K0QIqCHLtcoAQaxCmiOJ
	 FZJwnwxnyXLbePHTRmTetErLv94R6f/z1xyG5pNJeU0r5Ue0fPihw2GMWZpv9YT4dg
	 lBxSwYWrfjaRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA6680EA0;
	Tue, 22 Sep 2026 18:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C14D812C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B352C407FC
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNWX2jJ5w26l for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 18:15:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AA699407BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790100919;
 b=G559emxbEjdmk/8bcEG2aSqVHLECC6svw6s+bFtL+CmConZZMR/i7UeYhI7qsHaWSxlE
 d6wIWQp7P/tq5kS7kXdvhqqtUOvx/GJa0cNCQ4U4PkrqqZ5Jjkpf3Nb2BV4cDXd78FEmK
 69uwZXdZn7mO0iLOEWxc4QK+mGw7a+abASQOHvXntjsFGegUpqHibwvHiunL2nCUmxwOK
 AugcH2ldr9eYtqrdMFU+32Gv4odlvYkwPu//P68pAWOM0Vgfy1zj6mc/9vnJv/cpW1J5o
 gh7swf3ywLe+HpCO9iaemcIix7tpOkMIlezlhELzMR0fx9Z/NwQeeZkLJgmuFxc1RBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790100919;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rpfMBoWFrBfjP99NkSVYfwNNH4bcB0YD+vnACb/ZOik=;
 b=MWCspSC2BiDd6MwxP94d7J9uvXygEWs/8V6bhBhFIK3KNQ18hnbJek0EKpvTv5GoDPRb
 7gMK6a4IxfMbWR3YNbbMiJ7JMLkFzkPXTRg5HwrAXJKuZKeOOA+wfHY/1CKUOVLoGM/7Z
 A8WV5fxC8Yn7KWKwepnFiJbfZ2vtS1gFXnYUyYFZwc7frSVyMnrG2opdRn9QlpPI0Ze/E
 d9WKFCt4eVY+nENB7LWoLn1na40A68mrWt6Hu9mv/rpBLC/DbyVCxgSMrd5FWwP/qz5Wv
 0M+ZS3R06he1+1JluZP9d4xhkfXXS4m7Ojf6njNnlw1pcoKtl/ZCzmm78XHTOsj7ifA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA699407BE
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:15:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AF1A95DBA; Tue, 22 Sep 2026 18:14:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 20:14:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e62d0b0625e474513fdbd352b164cb177dbb231
X-Git-Newrev: e2b81003a490363bf249fc5a2ff4660f02333e8f
X-Patchwork-Hint: ignore
Message-Id: <20260922181410.3AF1A95DBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove entry for
 mrouted package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2b81003a490363bf249fc5a2ff4660f02333e8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 47e8dedb72..6d2a024e07 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -608,7 +608,6 @@ package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
-package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
 package/multipath-tools/S60multipathd Shellcheck
 package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
