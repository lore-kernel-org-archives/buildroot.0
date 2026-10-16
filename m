Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726EFCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37EF160DAD;
	Fri, 16 Oct 2026 13:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exHNcXO5EfCp; Fri, 16 Oct 2026 13:11:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 252BF61063
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156262;
	b=XNeC8m/pFb83SXgV9yiUsmhylrWY+ymfJ+6B9MarP8SzzqwiqKwOgntgadbTW01uWLc3
	 3JWehTMsZilVqmjiwYrbYsAnTUIiGDkyUjsDF9szc4H/ZqgfDomossLwE6Cc0+lI/95ZD
	 hR+AdnOMjNlaMsDF/2Oo54kVNP0nrRsittOTQtYlvHaN26zrqVHae5ViVce1do0jHVbnx
	 Xoaog6KqRtHuyHjw8dcU8YXPr9tSB7KIWPLsvKVSeAENsHqd9sAt9TuUmDetFcfvVhVHG
	 3+0hQd/Eeum6zYaKtAr+xFg+vmzCO2MgvsazJYlKJnWgmWV0d4kLRBq4PCfFhvLiyYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=GFyNxbKZFrF+iwGVE9h0XW3UjdduTzYA4UtQj74oxL0=;
	b=nPjDlS8PR4wALViiXqN894nk77sHiH1hugbBT4xCa495qJE9gD86DtNDM1D5c/Utce0d
	 m6ondZj4lLEckfKISUBCJJtXBULX2qBD4i6Z6bPcpPlu0GDNeywI8MyV/4fWotIttxSEd
	 RCVQ/am+OXWnQhMgFY7hWrTAfSqUGzROamCs0keyWDsd5sz4xRWswGRgta2ajFhR3zOYB
	 RsRFs19M069RaSm7nh7o/vLJhNXPomo0yWENielIoLLLNjvMcrhokbQqZEyUvMxWi6sFH
	 y1qk+cHphRXhkQ7WeUoCOi2Da0TYoqgfV5RY9yms1UIsRpU6MZ/tW0UVv0+j/eGh29A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156262;
	bh=GFyNxbKZFrF+iwGVE9h0XW3UjdduTzYA4UtQj74oxL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WbHgNRvjfzcTcqNkEaoULkhBJIJ9jkkJJ0EZIHCz3BpdKPhUNDW6N7DvhHNmwUP06
	 fFJ077tO7iQgGg5op7mXJzrPwHRiqXtytt3Lt2HJW6JZKXomOYxuLnJ7WCsecG1FHF
	 1wvkoRqWNesnYHxvu+RJF3ChtM7NA44TAUcfjMlTfkhKwrD4Hig1MfCaWkj1czxoWU
	 gghqrOqtcmruLMn9msT1vgY6LSpe9S/PC4nhifB7a4iE2FpNbuXBKYF9j23HvZIG0X
	 bqm7pxQZQibzy3Wpy8GpS05SquVyUm5tWLUAWwRnsnxhcauOHen+c5sGHymVpBIRlJ
	 XR9pg3VlDiWGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252BF61063;
	Fri, 16 Oct 2026 13:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF5D1F6E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43955814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDjsDfWD7oEY for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2FAEE81510
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=HHyosTBpfxu6bA9YYMohgew9oKHVhsWY9oLoIlM5l8QwLFV/OJk+aV5QH+1yrLEPCjmj
 Qd865enOAk5fhdmBzUr4Iy6WrmrREbmbYnI7ChRpE/Gi+VZUHoM3hUElw1h5ZMjIdycAv
 mjMLijd3BfUC61GXq3bwNqeGxvnwoC1hZpu36q0DuIyzsHX5M0ff5OatYSEdspcKqSfJv
 5okbaIIYT10rG58JAx2VY0t7ePskTYyx3Jsh5NM1IFwrTmBvTB63YsiIZL3X5EkI8ZGm9
 MOOkh0tyY2/06ciiLkWERU8KEB3nNrOYTN0adXpwNB4p4sH/xFp3GkxeAIIoHbYyfEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qn99zUskNEKSxkGvD3AhqmC4Ds+OACv99vgfiK4RnqM=;
 b=Tjmbn6Q+QYVPQk15oJkzUhLM6bFjnpqdBw6yQYdzCBp3eifb5X+UUc2E6tXN+P1JAkmC
 diZXCw8odIRO0u9L5w48LEB1x3bsWWYcbyhCQwDStEwsB+eFOSaPrTFb3nK6GQquYuoR2
 x84gFMWZ3M92VxmmsxsLkXWDyADDPCUuxpEG0/+H3T/tyuL6le1nC+C/BdEzCg+WFLpE1
 PNdImQ1MBNGCLPgqHr2lVcDKk3bxC/78L8PzDEXyr1g0yCjTkdBC7UzWL+62rL1v3ro8L
 DmEvyDJGzGQp3IZS6hM/NbcFuUzlXCJ7pTPJQyyKK6kaF9wiYVlG7GFIfLUHTycghlg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FAEE81510
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FC42960D9; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 93978d91e18c8ae864e9e73b78eca8baf1a01b18
X-Git-Newrev: c7d027a85889fb972dc9c9c23264ba832b3db59d
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.1FC42960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/docker-run: mount
 and pass BR2_EXTERNAL dirs
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5376049494913533795=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5376049494913533795==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7d027a85889fb972dc9c9c23264ba832b3db59d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The BR2_EXTERNAL environment variable is passed into the container,
and each path listed in it mounted. This allows using external trees
when running a build using utils/docker-run. Testing the existence of
the variable instead of a non-empty value allows passing an empty
BR2_EXTERNAL variable to disable currently set external trees.

The --mount option needs an absolute path for the destination. Make the
paths absolute the same way br2-external itself does it. Do not use
realpath since that resolves symlinks and would make it different from
what is in the BR2_EXTERNAL variable.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ddd4788c1f1f047398aa028954381372b5ce47be)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/docker-run | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 8cb15c9c48..675e945193 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -97,6 +97,17 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi
 
+# Testing the existence of the variable instead of a non-empty value
+# allows passing an empty BR2_EXTERNAL variable to disable currently
+# set external trees.
+if [ "${BR2_EXTERNAL+set}" ]; then
+    docker_opts+=( --env BR2_EXTERNAL )
+    for br2_ext in ${BR2_EXTERNAL//:/ }; do
+        # bind volume source paths must be absolute
+        mountpoints+=( "$(cd "${br2_ext}" && pwd)" )
+    done
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )

--===============5376049494913533795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5376049494913533795==--
