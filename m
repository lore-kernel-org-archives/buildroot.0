Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A26ACA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E1B405E8;
	Sun, 11 Oct 2026 13:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ_3qu3XM8fI; Sun, 11 Oct 2026 13:38:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E6C62405DA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725918;
	b=N1xFgdzz7bzGfuXEDqbXXQ8R916VXdQVtmU2mj+XDOsL6dcC8jTCxZAwIBL98HX7I/r+
	 Vh+hPeDO/KSg92Kj4skBgR2oZllRX8uP/iPwHXCRaq3x2jIrqrIKEgf/UhWXk8bMPx1Ue
	 FdCHSEOczU95i1hFNIA+2ZnWs6TRd65YCtHKUxSWFNycHzIonzggB9vprpZyDZ8muhROW
	 +JkWzUd6zk3U/T8VtBVoz9UmHbuS8FTdfOXBWyu+T4WeUszPOmcWWo7cTZWaBkBxxdsZj
	 AlEh3z5iaGdqtxTbJNSOsHSGV9RSX6TfFZFLHdn+sey//hAH3kdmHxceOYSToC1vduQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aYZTDROR9EeIX13RCfMUsJdfhBsWzuuyh7GW98AZAxA=;
	b=Vkgd70nSNqq0vwjEez/qlUy2cTT8y6xHOo2FnKHDP0rcydUmMdc4Enzg+3pSqIjnXHQG
	 f0RLoe2IHcWeIWXylkjfAEjiJIUm2f1RFdA94ghOZjqWFx9uTuXEm13m4wkK1vWD1LOPQ
	 cGrYLkxlJ8UM67u+469MK7GN7yt2pSWQVL1/6gMNK+3Zs1l2LH/wCrbUeYDlbllxTmzmI
	 04hxbmoCH/OpET6DHopBDy9CvLQ6vu7Jjz1ghzkrPYIgMk8kinZtlSD44WoYbCXl94tdn
	 Mnd8DhssWkqm2J8MzgPBTU4P4I9y7GIxPI+kAk81rrHM3wXrDWTf2oMIcsTaay9ZyXQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725918;
	bh=aYZTDROR9EeIX13RCfMUsJdfhBsWzuuyh7GW98AZAxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A6WfGvtC3fJqFMHdLG8wa+aAwST8ghPAYyuBLCfB2xoYCiHGpDM/3PNVK//93oWgA
	 6E0hLiP2yp9oouBKxChKJeaR6vxNTIHO4u/1sxeup2q7z455/zRg0zVCvp41olz6WB
	 7qOQF5x0LKLFRIM0aUWzJHQ//mI0cA4kg/2ZmplHMhdIAM9lzWBxZFW9bc/6oey18R
	 oQ9HUSu1Bo/qPnTf30T0/14Uv5wHjDt/s9ewL3ShOq1l7aA2h104/nxSJoP6qJuNzy
	 qqprMoI01R9xmtHqTkmDatIYLJGk95VUAm5/tDwxypbyeyV6Nu3p8h6+P3zqSZQQl4
	 XL7L6ixq3Q6sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C62405DA;
	Sun, 11 Oct 2026 13:38:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FFD75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59A9780DFC
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92MF5xTyjfEM for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:38:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB8FD80DFA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725915;
 b=ViUoqDrG/xR5Hxw/GuTK4PKgzBB/Pv9+hkip66j8ZQOxbyl+lWTCkGaZBczoPx3xU9zh
 afvwVeG3K10cOwBzILUf27z0XEvFyWjDIfYYwNxeRJ6YVqjDYhdtMUMS6ifFs67mr3I+8
 7YZYYoALb56Oha/+dn9Q+cOWm3V8oQ1zC9UBvH69mFeQUJuUjgRFp1W9rjkhd9Fxkjpv2
 H74EZEnQhQPkruIs/mxiJqFGtpYlGVkK9EF4gLO9iaPKE7ezu+j69yvMwn5Mzp1JryMPg
 /476RAUsHOVTTaEog4A7d4Zo6g38mHmZaxmVBv/TnpRqY8ZW14VWt9/EVPOHyxHAT2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725915;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MZtwm5d5eMueB1m9VZ5Cx+QuFtVw8F+xiL2jASy+1UM=;
 b=Y+geqdtWJ/qyxNwHAHpCBUNIJREL2LRWNE6IrkFlz00aBN8Hdzi0hEryX8o3r/wc4nrD
 VmS0DGezK/U/u70eskHf0menR6bnUYIOq3foqJzibuEfynmlLQlgvHi+JlZ1Gmxqvb5FV
 FheynZnNdOXWfpXMvvR5MK+KhHa9HKiYoJW3picvJXwnib+dBAvqf5W27srCW9qfPN262
 Pz/quTnZpqTwhjQNp9O8Na/lYYgH+sjEurFw+2KwMm6ud8AvZj5PxhjuqjgBHgROCMvwQ
 gaTUK4Z6L+X+wW9udMlPo7KC/VSUHi6D9adgeTFQ8CknRN4gg6rhWtTLrExTz0rZGpQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB8FD80DFA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDE6B94A88; Sun, 11 Oct 2026 13:37:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:38:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1fae6867b5a5b4ee2c7aad97330a7b9dd8476d9
X-Git-Newrev: ddd4788c1f1f047398aa028954381372b5ce47be
X-Patchwork-Hint: ignore
Message-Id: <20261011133716.DDE6B94A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddd4788c1f1f047398aa028954381372b5ce47be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
