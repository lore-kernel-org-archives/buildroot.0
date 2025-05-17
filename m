Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3628FC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B7070E72;
	Mon, 19 May 2025 11:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3Re34psdJ0c; Mon, 19 May 2025 11:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B8470FA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B8470FA0;
	Mon, 19 May 2025 11:02:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4707EE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB3F40F4E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCidXvk1TbSI for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C7141DEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C7141DEC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3E2580FD9; Mon, 19 May 2025 10:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:31:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3502bfe7a5d6b56748bdce5d440d8f2419f07c0c
X-Git-Newrev: 1026abbcf9b3ea18c39b7641f393264d0108f5ac
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.D3E2580FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 docs/manual/adding-packages-tips.adoc: add section about private
 repositories
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1026abbcf9b3ea18c39b7641f393264d0108f5ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot packaging pretty much assumes that the sources it downloads
are publicly available. In general, however, Buildroot is also used to
download sources from private repositories. Nowadays, that mostly means
from a github or gitlab instance.

Although git-over-ssh can be used for that, this poses a problem for CI,
because the CI runners integrated with github and gitlab only have
access to the repository itself, not to other private repositories. And
creating ssh key pairs for CI runners is tricky.

Therefore, document how standard tools can be used to make private
repositories available both to developers and to CI. There are quite a
few alternative approaches possible, but they're more complicated or
less generically applicable.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
[Peter: Fix insteadOf example, capitalize SSH/HTTPS]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-tips.adoc | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index 85400c0f31..c243e7b75b 100644
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
+===== Using SSH and +insteadOf+
+
+Configure your private packages to use SSH.
+
+----
+FOO_SITE = git@githosting.com:/<group>/<package>.git
+----
+
+Developers already have an ssh key installed so they can access it
+this way. The only limitation is that if they build in docker, they
+have to make sure the ssh key is accessible from within the container.
+Either mount the SSH directory into the container by passing the
+options +-v ~/.ssh:<homedir>/.ssh+, or load the private key into
+ssh-agent and pass +--mount type=bind,source=$SSH_AUTH_SOCK,target=/ssh-agent
+--env SSH_AUTH_SOCK=/ssh-agent+
+
+CI builders typically will not have an SSH key that allows
+access to other repositories. For those, you'll need to generate an
+access token. Then you configure git to replace the SSH access with HTTPS
+access. As a preparation step in CI, run the following command.
+
+----
+git config --global url."https://<token>:x-oauth-basic@githosting.com/<group>/".insteadOf "git@githosting.com:/<group>/"
+----
+
+The way to use a token for basic authentication differs between different
+git hosting providers, and sometimes between different types of tokens.
+Consult your provider's documentation to find out how to access git over
+HTTPS with a token.
+
+===== Use HTTPS and +.netrc+
+
+If, for any reason, developers don't have an SSH key already, then it may
+be simpler to use HTTPS authentication. For this, every developer will
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
+Configure your private packages to use HTTPS.
+
+----
+FOO_SITE = https://githosting.com/<group>/<package>.git
+----
+
+Both wget (https) and git will use +.netrc+ to get login information. This
+approach is potentially somewhat less secure because +.netrc+ cannot be
+password-protected. The advantage is that users and CI use the exact same
+way of providing credentials.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
