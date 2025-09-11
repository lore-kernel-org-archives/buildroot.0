Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57334CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24905423EE;
	Thu, 11 Sep 2025 18:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZV30zRC9z59; Thu, 11 Sep 2025 18:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49589423DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49589423DB;
	Thu, 11 Sep 2025 18:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64DA0443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01C4641E9D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqJpnrT-4f2m for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A55040896
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A55040896
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37A7F84108; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:38:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd4299e87a87bffee4491fdd30c9c23dc75fa7cb
X-Git-Newrev: 1a729cbf5c2c392c83636d50bb6a244aafd3eea2
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.37A7F84108@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/firewalld: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a729cbf5c2c392c83636d50bb6a244aafd3eea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
