Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EACC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8993140B77;
	Tue, 20 Aug 2024 21:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0G3wBEZrsuy5; Tue, 20 Aug 2024 21:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FEBD40B82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FEBD40B82;
	Tue, 20 Aug 2024 21:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 291781BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1623840B77
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_pUWmyC6SFz for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DFA440B85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DFA440B85
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 147FF861B4; Tue, 20 Aug 2024 21:23:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 23:22:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c06d8be7e324ff3ec69db9b2fdca5305dbc54bf3
X-Git-Newrev: 4dbb87bb6676b82f34981f6adedccfa03a9667cd
X-Patchwork-Hint: ignore
Message-Id: <20240820212316.147FF861B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: fix fallout of
 dropping toolchain CSV
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dbb87bb6676b82f34981f6adedccfa03a9667cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 8e60fd3f9e..ae1f0f85de 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -611,7 +611,7 @@ if __name__ == '__main__':
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
