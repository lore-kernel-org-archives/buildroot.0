Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EF8E8181F
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5326142C;
	Tue, 26 Sep 2023 06:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5326142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqJihetcReOf; Tue, 26 Sep 2023 06:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF36061438;
	Tue, 26 Sep 2023 06:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF36061438
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBF481BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B698141782
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B698141782
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S57RRPz11Edb for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06E8440545
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06E8440545
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB1C787814; Tue, 26 Sep 2023 06:12:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 08:07:47 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: bd5eaa7df8025a3d5afa94c495c1c4b34ad53bee
X-Git-Newrev: b391628d40f88537d2e2376656b51bcb76a32a97
X-Patchwork-Hint: ignore
Message-Id: <20230926061219.EB1C787814@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libssh: ignore
 CVE-2023-3603
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

commit: https://git.buildroot.net/buildroot/commit/?id=b391628d40f88537d2e2376656b51bcb76a32a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The affected code isn't present in any release, see [0].

[0]: https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/

The CPE entry for this CVE is
  cpe:2.3:a:libssh:libssh:-:*:*:*:*:*:*:*
We interpret the "-" as matching any version. It actually means
"unspecified version", which is the cop-out in case there is nothing
useful to match. We can't really make our infrastructure ignore "-"
entirely, because for all we know our version is an unreleased commit
sha which _is_ vulnerable. Thus, the only way out is an exclusion which
we'll never be able to remove.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit a34a370f4ea27981be43df817f49320a59088e68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index e770d2b924..ff4cddaf91 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,6 +17,10 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
+# Not part of any release
+# https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
+LIBSSH_IGNORE_CVES += CVE-2023-3603
+
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
