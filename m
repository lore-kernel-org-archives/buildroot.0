Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF7CC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833AE40B41;
	Tue,  9 Jul 2024 09:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMXXVj6w-LnL; Tue,  9 Jul 2024 09:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 553BA40B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 553BA40B42;
	Tue,  9 Jul 2024 09:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1BE1BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034D440B42
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrkY240KzSBI for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0983540B41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0983540B41
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:44:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7E47842ED; Tue,  9 Jul 2024 09:44:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 11:43:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c87964564e130bb8eb6140c66880e4e489aae8bb
X-Git-Newrev: 38dbdc18a8bcd348905f326c53e2a891480d755c
X-Patchwork-Hint: ignore
Message-Id: <20240709094424.E7E47842ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .github: add github action to automate PR
 handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38dbdc18a8bcd348905f326c53e2a891480d755c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the Buildroot repository's GitHub configuration to better
manage incoming pull requests.

- Added a new GitHub Actions workflow (`repo-lockdown.yml`) to automatically
  handle new pull requests.

The new workflow:
- Triggers on new pull requests.
- Uses the `dessant/repo-lockdown` action to:
  - Comment on the pull request, guiding contributors to use the mailing list
    for patch submission.
  - Lock the pull request to prevent further discussion.
  - Close the pull request.

This change ensures that contributors are properly directed to the preferred
method of patch submission via the mailing list, maintaining consistency and
streamlining the review process.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .github/workflows/repo-lockdown.yml | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/.github/workflows/repo-lockdown.yml b/.github/workflows/repo-lockdown.yml
new file mode 100644
index 0000000000..45cfd2867d
--- /dev/null
+++ b/.github/workflows/repo-lockdown.yml
@@ -0,0 +1,25 @@
+name: 'Repo Lockdown'
+
+on:
+  pull_request_target:
+    types: opened
+
+permissions:
+  pull-requests: write
+
+jobs:
+  action:
+    if: github.repository == 'buildroot/buildroot'
+    runs-on: ubuntu-latest
+    steps:
+      - uses: dessant/repo-lockdown@v4
+        with:
+          pr-comment: |
+            Please do not submit a Pull Request via GitHub. Buildroot makes use of a
+            [mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
+            See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
+
+            Thanks for your help!
+          lock-pr: true
+          close-pr: true
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
