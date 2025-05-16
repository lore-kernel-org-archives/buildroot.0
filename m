Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F246AC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E1161352;
	Fri, 16 May 2025 21:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNL9D2nYf4na; Fri, 16 May 2025 21:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2113A61327
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2113A61327;
	Fri, 16 May 2025 21:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 786241DE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3BB40563
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEswqyApb5O3 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5015B40541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5015B40541
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5015B40541
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A22CB1C110E; Fri, 16 May 2025 23:14:29 +0200 (CEST)
To: buildroot@buildroot.org
Cc: stefan.nickl@gmail.com,
	Arnout Vandecappelle <arnout@rnout.be>
Date: Fri, 16 May 2025 23:14:29 +0200
Message-ID: <20250516211429.763211-1-arnout@rnout.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747430070; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=bCB3cEykszKwiWse1/NPZQv3NUgCqNoGI8gakDxYAQk=;
 b=fnVr9l1NDLjyZndRMPSA3vE05Zqn4UyLbL8k0eZmTEas89EkngAJODX2CZPkK6nh2ZG5US
 B9cnjEkejnVFAPK0tM/BE51IGPjWjL8S8a5rE9pApe5WtFDjbZpW8DwPUbVNbyPDJFBCOM
 a8GjsHcoCmPkU2OFZNwXK6n8i2nAq+EcoOx3FdhJXlOUS9/zkt04Q0g3WeJ/lxlTa20H7Y
 3phtVHicS8dVufgMFuhLn64Pyv6NuHalhRBMhiCcgeGy9AyrCa+RVu95wDbqPLZ2dHyDOG
 E5rCm80d1S5755zvKqA+KHe043Ms4so6pdMs1HU4oxupzXGy3JhgukeLM5mg/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=fnVr9l1N
Subject: [Buildroot] [PATCH] docs/manual/adding-packages-tips.adoc: add
 section about private repositories
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot packaging pretty much assumes that the sources it downloads
are publicly available. In general, however, Buildroot is also used to
download sources from private repositories. Nowadays, that mostly means
from a github or gitlab instance.

Although git-over-ssh can be used for that, this poses a problem for CI,
because the CI runners integrated with github and gitlab only have
access to the repository itself, not to other private repositories. And
creating ssh keypairs for CI runners is tricky.

Therefore, document how standard tools can be used to make private
repositories available both to developers and to CI. There are quite a
few alternative approaches possible, but they're more complicated or
less generically applicable.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/manual/adding-packages-tips.adoc | 75 +++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index 85400c0f31f..91888898a84 100644
--- a/docs/manual/adding-packages-tips.adoc
+++ b/docs/manual/adding-packages-tips.adoc
@@ -253,3 +253,78 @@ FOO_SOURCE = foo-$(FOO_VERSION).tar.bz2
 If there is a specific tarball uploaded by the upstream developers in
 +https://gitlab.com/<project>/releases/+, do not use this macro, but
 rather use directly the link to the tarball.
+
+[[accessing-private-repos]]
+==== Accessing a private repository for a package
+
+If you want to create a package in a br2-external tree and its source
+is in a private repository (e.g. on gitlab, github, bitbucket, ...),
+you have to write it in a way that it is buildable both by developers
+and in CI. This poses a challenge, because you need to authenticate in
+order to access it.
+
+There are several ways you can approach this. The following two are the
+most practical ones.
+
+===== Using ssh and +insteadOf+
+
+Configure your private packages to use ssh.
+
+----
+FOO_SITE = git@githosting.com:/<group>/<package>.git
+----
+
+Developers already have an ssh key installed so they can access it
+this way. The only limitation is that if they build in docker, they
+have to make sure the ssh key is accessible from within the container.
+Either mount the ssh directory into the countainer by passing the
+options +-v ~/.ssh:<homedir>/.ssh+, or load the private key into
+ssh-agent and pass +--mount type=bind,source=$SSH_AUTH_SOCK,target=/ssh-agent
+--env SSH_AUTH_SOCK=/ssh-agent+
+
+CI builders typically will not have an ssh key that allows
+access to other repositories. For those, you'll need to generate an
+access token. Then you configure git to replace the ssh access with https
+access. As a preparation step in CI, run the following command.
+
+----
+git config --global url."https://<token>:x-oauth-basic@githosting.com/".insteadOf "https://githosting.com/"
+----
+
+The way to use a token for basic authentication differs between different
+git hosting providers, and sometimes between different types of tokens.
+Consult your provider's documentation to find out how to access git over
+https with a token.
+
+===== Use https and +.netrc+
+
+If, for any reason, developers don't have an ssh key already, then it may
+be simpler to use https authentication. For this, every developer will
+have to generate a token that has (read) access to all relevant repositories.
+Some git hosting providers have a command-line utility that can generate
+such a token, otherwise you'll need to generate it in the web interface. The
+token has a limited lifetime so you'll need to regularly refresh it.
+
+To make sure the token is used in the Buildroot build, add it to +~/.netrc+
+
+----
+machine githosting.com
+    login <username>
+    password <token>
+----
+
+The +<username>+ and +<password>+ to use are again different for different
+git hosting providers.
+
+In CI, generate the +.netrc+ file as a preparation step.
+
+Configure your private packages to use https.
+
+----
+FOO_SITE = https://githosting.com/<group>/<package>.git
+----
+
+Both wget (https) and git will use +.netrc+ to get login information. This
+approach is potentially somewhat less secure because +.netrc+ cannot be
+password-protected. The advantage is that users and CI use the exact same
+way of providing credentials.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
