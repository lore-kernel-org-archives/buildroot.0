Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782C6C38150
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 01:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224AF80E47;
	Mon,  8 Jul 2024 01:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6tBwl8tv2bx; Mon,  8 Jul 2024 01:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F2B480E48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2B480E48;
	Mon,  8 Jul 2024 01:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7731BF82C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 01:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 474934023F
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 01:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sisnTmMXWM5a for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 01:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.97.181.73;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9416B40142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9416B40142
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net
 (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9416B40142
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 01:38:07 +0000 (UTC)
Received: from ubuntu18.eswin.cn (unknown [10.12.192.173])
 by app1 (Coremail) with SMTP id TAJkCgDXauLdQotmaHIUAA--.34904S5;
 Mon, 08 Jul 2024 09:37:44 +0800 (CST)
From: zhangdongdong@eswincomputing.com
To: buildroot@buildroot.org
Date: Mon,  8 Jul 2024 09:37:18 +0800
Message-Id: <20240708013718.19051-2-zhangdongdong@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
References: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
X-CM-TRANSID: TAJkCgDXauLdQotmaHIUAA--.34904S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1fAFy5GrWrCry8JrW7XFb_yoW8CrWDpr
 W5GF1avw4SyF9Fka93Ga4xWw4rZ3ZYy3yDJFyIgF4ktFn3KanFyry5tFyYka47GF4fZrs5
 XFWvqw4kKF48ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4kE6xkIj40Ew7xC0wCY02Avz4
 vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUPcTPUUUUU
 =
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAgELCmaKYrgFWwACso
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=eswincomputing.com
Subject: [Buildroot] [PATCH v2 1/1] .github: add github action to automate
 PR handling
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
Cc: bonet@grenoble.cnrs.fr, Dongdong Zhang <zhangdongdong@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

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
---
 .github/workflows/repo-lockdown.yml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 .github/workflows/repo-lockdown.yml

diff --git a/.github/workflows/repo-lockdown.yml b/.github/workflows/repo-lockdown.yml
new file mode 100644
index 0000000000..a5f8bd6a93
--- /dev/null
+++ b/.github/workflows/repo-lockdown.yml
@@ -0,0 +1,23 @@
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
\ No newline at end of file
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
