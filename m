Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6BAC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:05:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784FA61184
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 784FA61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C8A83AB2;
	Fri,  6 Aug 2021 21:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2_rb_cH8QqN; Fri,  6 Aug 2021 21:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94B3B83A79;
	Fri,  6 Aug 2021 21:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B9B71C1162
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EF640544
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bz_9n14t-0kD for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F72D402C6
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AF35686DE4; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:13:29 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 2d8ba74fe3172395c4a62f1afb79c3eac6abd7e6
X-Git-Newrev: ecba2d0b6c26f20f34ef648504497bca401200fc
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.AF35686DE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] utils/scanpypi: fix
 flake8 errors
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ecba2d0b6c26f20f34ef648504497bca401200fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Commit e43c0509442c746bea305aa2b0a5f7ff5adfd142 introduced two flake8
errors:

utils/scanpypi:300:26: E231 missing whitespace after ','
utils/scanpypi:302:9: F841 local variable 'setup' is assigned to but never used

The first one is easily fixed. The second one needs a little bit of
explanation. Before commit e43c0509, the return value of
imp.load_module() was used to be able to explicitly call the 'setup'
function in it in case the metadata was not populated. Since that
commit, calling that function is no longer needed, since setup.py is
executed in exactly the same way as when it's run from the command line,
so if that doesn't work, it's completely broken anyway. Therefore, we
can simply discard the return value of imp.load_module().

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f982f7043419dea2d21ebe20c1b383633a517674)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 04c43f9311..9dede4e119 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -297,9 +297,9 @@ class BuildrootPackage():
         """
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
-        sys.path.insert(0,self.tmp_extract)
+        sys.path.insert(0, self.tmp_extract)
         s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        setup = imp.load_module('__main__', s_file, s_path, s_desc)
+        imp.load_module('__main__', s_file, s_path, s_desc)
         if self.metadata_name in self.setup_args:
             pass
         elif self.metadata_name.replace('_', '-') in self.setup_args:
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
