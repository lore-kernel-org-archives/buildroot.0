Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F20C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 18:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBB54191F;
	Sun, 28 May 2023 18:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCBB54191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_EMKmdcc5-y; Sun, 28 May 2023 18:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E5241913;
	Sun, 28 May 2023 18:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E5241913
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC911BF836
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 18:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 540368266D
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 18:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 540368266D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiZbD5wgwvLx for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 18:38:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8390E82640
 for <buildroot@buildroot.org>; Sun, 28 May 2023 18:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8390E82640
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F478869DB; Sun, 28 May 2023 18:38:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 20:36:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ac6713cee7e683b08234df14fff652cfbfef91b
X-Git-Newrev: 742258fec06df18782e4bd75b00ca530120312cb
X-Patchwork-Hint: ignore
Message-Id: <20230528183849.6F478869DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-message: add missing
 perl-clone dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=742258fec06df18782e4bd75b00ca530120312cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perl-clone was added to perl-http-message v6.44 as mandatory
dependency by commit [1]. While updating to v6.44 [2] in
Buildroot the new dependency was forgotten.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819252
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819256

[1] https://github.com/libwww-perl/HTTP-Message/commit/6b89d6b2cce67b540ade87fc6fdf88cdede20b46
[2] 79e8aad721099eb05e60b449432136691275022f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-http-message/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 82538cfce8..3c6849487a 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
+	select BR2_PACKAGE_PERL_CLONE # runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_IO_HTML # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
