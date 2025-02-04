Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BB4C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9E485A54;
	Fri, 28 Feb 2025 17:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfLkZmtpnV6r; Fri, 28 Feb 2025 17:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6C585A49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6C585A49;
	Fri, 28 Feb 2025 17:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 039881DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D71041143
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUybbIZqJtPD for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2402041800
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2402041800
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D31F86A4C; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 11:56:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dad34a1a22a3b52d3ef2f014640e5155f84db0ad
X-Git-Newrev: 4bce3270d68074d397b1ac9726f5c970eb517fcb
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.1D31F86A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: timeout earlier
 when connecting to download servers
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bce3270d68074d397b1ac9726f5c970eb517fcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some sites have broken DNS entries where some A or AAAA records point
to a nonexistent machine. This causes a long delay (~135sec here) before
a fallback to another IP is attempted. This is the case for example for
sigrok.org, which IPv6 entry is not reachable (at least from the few
locations I have access to, while other IPv6 servers are reachable).

Add a relatively small timeout on connect for the few download backends
where we can easily drive that setting:

  - for curl and wget, that timeout only applies when establishing the
    TCP connection, i.e. the three-way handshake;
  - for scp and sftp, that timeout also include the ssh handshake;
  - for svn, it is not explicit what the timeout is about, but the
    documentation states "Timeout for HTTP requests in seconds".

In modern times, we expect that we can indeed establish those handshakes
in less than 10s; anything taking longer is in practice an unreachable
site...

For other download mechanism (bzr, cvs, git, hg), as well as
post-processing helpers (cargo, go), it does not seem possible to set
such a timeout.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index c0c1a6079d..a543091d4f 100644
--- a/Config.in
+++ b/Config.in
@@ -114,15 +114,15 @@ menu "Commands"
 
 config BR2_CURL
 	string "Curl command"
-	default "curl -q --ftp-pasv --retry 3"
+	default "curl -q --ftp-pasv --retry 3 --connect-timeout 10"
 
 config BR2_WGET
 	string "Wget command"
-	default "wget -nd -t 3"
+	default "wget -nd -t 3 --connect-timeout=10"
 
 config BR2_SVN
 	string "Subversion (svn) command"
-	default "svn --non-interactive"
+	default "svn --non-interactive --config-option servers:global:http-timeout=10"
 
 config BR2_BZR
 	string "Bazaar (bzr) command"
@@ -142,11 +142,11 @@ config BR2_LOCALFILES
 
 config BR2_SCP
 	string "Secure copy (scp) command"
-	default "scp"
+	default "scp -o ConnectTimeout=10"
 
 config BR2_SFTP
 	string "Secure file transfer (sftp) command"
-	default "sftp"
+	default "sftp -o ConnectTimeout=10"
 
 config BR2_HG
 	string "Mercurial (hg) command"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
