Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660FBCCF2C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01DAA60F43;
	Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mypFOGxJk5Xb; Fri, 16 Oct 2026 13:10:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2FC760F18
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156200;
	b=VUCpDFSTDGRVA74xBB9H1tsRQFZF+eD6TVIqgK608kKxiknyPThl5wxPY4nadwBeixTj
	 CpSSwhWOqXYk9WgMiLJF7QWFe5FK5w6K4UsXnN6XulmoIT2PGJZp4KmGCCucqLb61E3oJ
	 ZlrS9UX6MvWLdmKMKL7W4rfn8EgDH2F4sdmRBRP1IRaoNKQ7YupJuM7vX9eUZP6lS1Gms
	 AqFCV4Qi1cbUJPfNsPBkbhk5zrAieXSO7T0W6ORuWw3manEZeuz5T0xTQp2mT6WYcK3Ul
	 fqkXu/W/YW6X0q7L5w5seBp/iVQu0f+s9bi6JVgNF8nucKPKRIlt66ryifZr+g96cfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=c5a6uoZA6YwWaLBdvY0hbOW+46otHaw3+N6oJ1dzG/M=;
	b=gpEr+laoXT4C6fXq2JYvzfuChf7xH2kFghwgS5RtXOzhsTpQ7nkd0fgvphxWURiTe4fu
	 O2DbaYAdcBnSNkMg9ny1HzqsNTMXsyf+N3qaieoIduxJnrFzCsCId26gzjzF3Dpor+Fjs
	 SdRMW25HHpbLpOGonb6q2R94ahZ+QinE82vN0gP0oE/vqjA8kDs560c9H2rU6sQ3TCNFh
	 kIylHZ1pLhuSqiUayIaAI5iXJATqdg2d+A3HP3+jsLWEGeDiWJndNfdkdbHh4XEHt/uR9
	 k9M1nGnizd9Byyln2tVooTzKCxm76SO+DmCTSwcLKN1oOjE44e4szlpuzgkpBjIdabg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156200;
	bh=c5a6uoZA6YwWaLBdvY0hbOW+46otHaw3+N6oJ1dzG/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JcJL2XXUQefbh5OqC86NNAq2NObScqAFIKp+9tx2l3AO3ECCs1Iygf/z8NQtWfUyN
	 975PbGbxVET2bFcBSCnimbZr1B3ITvDHsUN0suxOsFK8tEpAgNqBJnZAjqnmyh/uIT
	 YqLh4JBzDOSPm/HNqPUpoUa5GeH7tqB6/QON1k0/bJdOrcz1MYYOSczgTKkGzAow6Y
	 4ibF7jTMhVxCYNafvLVLAC2g4LXo4HNQPoDvxNbCZTbi62G5tNG/ibx2IBGI3monII
	 vx/9Pp/w2MaCQa/eGMbIRZdEV06npzCFp02dk2LN6iIenvnuEYkxrZsNXFKrTiDNkS
	 OW/cg2/WErNmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2FC760F18;
	Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5B8151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4249409F6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3QtkPqh-8NL for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 09293409F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=LcSDBkNOo9E+JO+bTqQIlJ64LFJPElaCwThhNzZIrwcXAZHrD0psQ0FEHc6cblzNmFqH
 kU43rIAiLQgWIno/yKu7GmiTrUw80/u6RoEB9w+7v4DVcE89ncn+JqO2FpzlzXcHIiIpJ
 oTYRPsxiVR0k9hzd6JObCGQpoLlefeYQFKiAYYpkXRrIaqyr5pMs6gQ8iYlSqmJChCTMg
 0WZEWYW/+WBcScs/lA9+cqVPsaAHJIOZm5+9L+J4HA1BYLdwXr20Twfjm+2h2WC4Si8et
 Gt3bJEugzAxR7KNJqeYXJAxP8pJaiR32RWIPC5UZLehvLN9OnaYQ62Vo+uGYYPg1Jtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sRbHo9qSZNzSg4DIdpm9NfqLnz9PvURDijv+qM7TuC4=;
 b=oJH7w2JEMj4V6IdyzcDrdrhm32lcZkTQnS/bseYhXwvvJa9YllfVtsR8hL1BCe0kxhS0
 MXZ96uSmUR3u2YN90NoR2p5nGR3iAMHOr0kuxnUR8v+JvHUopCfF/5R1bJr8YCUxjgbU4
 qpICiIwPo1DJeczeCXGvOBGOZOtUHwaSLkIoob1LDK9cGBhOQRll8zH8ed6DOB/YNrcX6
 N1BcweZf+3hMk07xUR2ucZ1f6+A2eiE4dqfhcLqRb23fHU7MVTWgyaLWO6UPkzK6H+Za6
 8mv+Z+7+eDEFjkUDx6qr/1MG7qrT90mu7BfS/s4bEcGEXEAXa15gKCWMiEqHIUptoyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09293409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE5F9960D9; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 51c583748ac5bf3c15086ddd2eb9a7209d5ef26a
X-Git-Newrev: 36aa234a0130f21e295d09eb3c4d776d6d5145a2
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.EE5F9960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 use argparse defaults help formatter
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
Content-Type: multipart/mixed; boundary="===============7295211465567079246=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7295211465567079246==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36aa234a0130f21e295d09eb3c4d776d6d5145a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The argparse library documentation [1] suggest the usage of
'ArgumentDefaultsHelpFormatter' in the ArgumentParser declaration to
show the default value of every arguments.

Use this to avoid declaring this value ourself which possibly gets
outdated with the actual default value.

Note that this also adds an unnecessary default: FALSE to the --virtual
option, but that's a minor annoyance.

[1] https://docs.python.org/3/library/argparse.html#argparse.ArgumentDefaultsHelpFormatter

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Suggested-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 358f22680949692a4fe503e57802f3043f8a3169)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 98009cef98..c292ef7840 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,23 +529,24 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-            description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-            '''
-        )
+        description='''Create a CycloneDX SBoM for the Buildroot configuration.
+            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
+        ''',
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter
+    )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
+    parser.add_argument("--virtual", action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
-                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+                        help="Specify the project name to use in the SBOM metadata")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
-                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+                        help="Specify the project version to use in the SBOM metadata")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
                         choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
-                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
+                        help="Set CycloneDX version")
 
     args = parser.parse_args()
 

--===============7295211465567079246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7295211465567079246==--
