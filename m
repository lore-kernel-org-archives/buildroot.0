Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F8CD98F1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF544E7D0;
	Wed, 17 Jun 2026 12:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juXsltBw5Ohy; Wed, 17 Jun 2026 12:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589E54EBBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781698799;
	bh=dc871XIKx5aLcXbhCPllYOLSwo34SPfS3DXRUdonI54=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jtStvLxL0jghbxGI/2M7EPoOm8hzT8m8NVtS3SYpD09Sd8/iEwzoFIKA/pjfp6cQ+
	 8j90Mjig7p4H9Cn6A/zrKNEpOqyHU5Qx+cyU8gbq7lufsKpf0EPAfUXBcf3mB04Jg4
	 FbIqxQ9mYnJ5Ml1KpntdmVd023DqSMFriIiRfqqaLFv3SrIvmtIddGDu3YjPJ7Ml/z
	 Pf4dn1aEC803tGkF0cUYnbLzzHVfvySwq8bgF6eCBahM9ZfgCWOjrxmBt6olY6k4dl
	 x+jC5pBcTCGd9bJ9fgA+0sd4INzL7Pkc2CAMa+1Isn4F/sg8MqcEh3irRDcM80sH/k
	 WSFWZAyDeXwJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589E54EBBC;
	Wed, 17 Jun 2026 12:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92630347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78F8685D0C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Sqwn9m46QH4 for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC42285CFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC42285CFC
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3249B811FF; Wed, 17 Jun 2026 12:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 14:18:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4884a29379ff8de6fb9d77eadaac8d905d9d1db
X-Git-Newrev: 3e2cc4e46ffd0d3a6a3ffa14bbe0645e7336933f
X-Patchwork-Hint: ignore
Message-Id: <20260617121934.3249B811FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc/sysv-rcs: fix shellcheck
 0.10 warnings
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e2cc4e46ffd0d3a6a3ffa14bbe0645e7336933f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

* Explicitly set shell type. Shellcheck doesn't know OpenRC, but the
  script as such is POSIX shell.
* Override warnings not applicable in context.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/openrc/sysv-rcs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openrc/sysv-rcs b/package/openrc/sysv-rcs
index 1564cbe603..1b24cc3e1a 100755
--- a/package/openrc/sysv-rcs
+++ b/package/openrc/sysv-rcs
@@ -1,5 +1,7 @@
 #!/sbin/openrc-run
+# shellcheck shell=sh
 
+# shellcheck disable=SC2034 # definition for OpenRC
 description="start or stop sysv rc[S,K] scripts"
 
 depend() {
@@ -17,6 +19,8 @@ start() {
 }
 
 stop() {
+    # we need to reverse the order here, sort -r would be no less fragile
+    # shellcheck disable=SC2045
     for i in $(ls -r /etc/init.d/S??*); do
         # Ignore dangling symlinks (if any).
         [ -e "$i" ] || continue
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
