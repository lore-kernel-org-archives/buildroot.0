Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9A7D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A6E81F7E;
	Sat, 26 Oct 2024 11:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KP0c9wFXt3CI; Sat, 26 Oct 2024 11:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF0C81FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF0C81FB9;
	Sat, 26 Oct 2024 11:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A355C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1C88408D1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T9W3d1os7Ja for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 012E040701
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 012E040701
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAE1F83984; Sat, 26 Oct 2024 11:37:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:37:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0346de10e3b32b2e1dfeff46c0ad80034985684e
X-Git-Newrev: 68de69c4d7f61ab5da4dd9cad221fb82e9e1abce
X-Patchwork-Hint: ignore
Message-Id: <20241026113753.DAE1F83984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-tips: mention
 check-package requirements
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68de69c4d7f61ab5da4dd9cad221fb82e9e1abce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Call out the requirements to run check-package and mention that Docker
can be used to run check-package without installing dependencies.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-tips.adoc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index b04b42b51f..85400c0f31 100644
--- a/docs/manual/adding-packages-tips.adoc
+++ b/docs/manual/adding-packages-tips.adoc
@@ -64,6 +64,19 @@ The tool can also be used for packages in a br2-external:
 $ check-package -b /path/to/br2-ext-tree/package/my-package/*
 ----
 
+The +check-package+ script requires you install +shellcheck+ and the
+Python PyPi packages +flake8+ and +python-magic+. The Buildroot code
+base is currently tested against version 0.7.1 of ShellCheck. If you
+use a different version of ShellCheck, you may see additional,
+unfixed, warnings.
+
+If you have Docker or Podman you can run +check-package+ without
+installing dependencies:
+
+----
+$ ./utils/docker-run ./utils/check-package
+----
+
 [[testing-package]]
 ==== How to test your package
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
