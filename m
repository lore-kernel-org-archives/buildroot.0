Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28A0CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE266F53C;
	Thu, 11 Sep 2025 19:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55VasIICmovd; Thu, 11 Sep 2025 19:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE2F6F539
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDE2F6F539;
	Thu, 11 Sep 2025 19:01:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D722735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2C7841EC3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMt_PlESKMPz for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F338B41EBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F338B41EBA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0982842A4; Thu, 11 Sep 2025 19:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:38:35 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e7669f94b50927ed23dd9b42ceedda678ec28280
X-Git-Newrev: c50fff54b262570e3ccb2fdc7cb85622cff3c7dc
X-Patchwork-Hint: ignore
Message-Id: <20250911190108.F0982842A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/firewalld: add
 missing nftables json runtime dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c50fff54b262570e3ccb2fdc7cb85622cff3c7dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Now that firewalld has been fixed for Python 3.13,
TestFirewalldSysVInit still fail at runtime due to missing nftables json
support [1].

cat /var/log/firewalld
  2025-09-02 21:34:50 Traceback (most recent call last):
    File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 649, in start
    File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 613, in _start
    File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 510, in _start_apply_objects
    File "/usr/lib/python3.13/site-packages/firewall/core/fw_transaction.py", line 133, in execute
  firewall.errors.FirewallError: COMMAND_FAILED: 'python-nftables' failed: Error: syntax error, unexpected '{'
  {"nftables": [{"metainfo": {"json_schema_version": 1}}, {"add": {"table": {"family": "inet", "name": "firewalld"}}}, {"delete": {"table": {"family": "inet", "name": "firewalld"}}}, {"add": {"table": {"family": "inet", "name": "firewalld"}}}]}
  ^

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422467 (TestFirewalldSystemd)

[1] https://github.com/firewalld/firewalld/commit/1582c5dd736a11177ec320eb4ecbeb09fcae313a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6e9ede1d79513f4b54e35be557968f63dbb3aaa9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/firewalld/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
index cc8411b34d..407f57c604 100644
--- a/package/firewalld/Config.in
+++ b/package/firewalld/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_FIREWALLD
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
 	select BR2_PACKAGE_NFTABLES
+	select BR2_PACKAGE_NFTABLES_JSON # runtime
 	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
