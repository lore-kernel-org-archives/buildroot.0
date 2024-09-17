Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7C9CAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FFA614E8;
	Tue, 17 Sep 2024 21:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQGuozGTfU6E; Tue, 17 Sep 2024 21:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D986F614BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D986F614BA;
	Tue, 17 Sep 2024 21:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1696C1BF969
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36A8A60616
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCBfUbkQpPdo for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 698B2610C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 698B2610C5
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5556980584; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:20:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 82346f7c8ed987239e95e3778b87463709c0557c
X-Git-Newrev: 3dd70ef15bba55e65398a28ef72e8154a79b7d99
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.5556980584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig: fix
 fallout of dropping toolchain CSV
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3dd70ef15bba55e65398a28ef72e8154a79b7d99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 2f260084d577 (utils/genrandconfig: remove support for toolchain
CSV) kept the --no-toolchains-csv option, but in the rework forgot to
keep it as a bool, while argparse default is to expect a string.

Rather than re-introduce the action="store_true" which implies the
argument is a bool, explicit make it a bool.

Fixes: 2f260084d5771728f3340ff6a86a23391133a635

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4dbb87bb6676b82f34981f6adedccfa03a9667cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 06c26b0512..d13c7befc4 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -604,7 +604,7 @@ if __name__ == '__main__':
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
     parser.add_argument("--toolchains-csv", help="Legacy, unused", type=str)
-    parser.add_argument("--no-toolchains-csv", help="Legacy, unused")
+    parser.add_argument("--no-toolchains-csv", help="Legacy, unused", type=bool)
 
     args = parser.parse_args()
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
