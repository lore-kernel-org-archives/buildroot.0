Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1542CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20689613BD;
	Fri, 16 Oct 2026 13:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skGN22sYFaCy; Fri, 16 Oct 2026 13:13:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C9C54613A9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156418;
	b=gIktxI5Wuu2+NCBcqqZJh+wRyx0H6jYJd5bH/97OxB0YcEapOVAe/fB/QJOAfGhcEecM
	 tMr5s0TorPEggNFQJxzV5cN2TN7Pu9Di+9/4vFE+jyW89idjpalSKADAXgsjidOx7xwPi
	 yK/X+vZGoRUAHmXSTriBE9VQ6HYa+HPesOfRQqOfV33KDFBavKwy2BGxmPmWhMEeDI2aa
	 921owT5zVi+cyKfbnTaKwtjglJc2d9y22h0fQEV+E32SrjSLnO2mhZeBWQKemY+OAt110
	 G8mW5GT+bd9+mupjga4mM2IEobXgSBl8gFLq+GnKCVCf6YRsrl1mwQV3wmPCrb1optQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lqVCnpaxmWSUl/3TJiMXXIoDGrLYaWsktVj6IPY/tEg=;
	b=H9tbJ3X+B78Fkf+VBDFWiXDGdF7Dh6yI1S9xYxvOiaPdtACcE6zfFP2GBs19f0uRtQLq
	 EcmgXZKCJ3XolSKcZ4XO050ZxXbG3iMucuPb5j3/jPXypF4xa9K714vwLinOT5MZz1Om5
	 5ldKyJK7IkiazXWfyC3qlWjlbzBAiR/GB/E+UDfXd+PFC/5FsY/0VHxOFbKmi60g+Fbbj
	 xOoF/Oj8nMKG/JsFAC67FBeNNm5bJIifBaJohyGCJQIra7jRdwh6jYDjCLuIVAbd5ylgl
	 hpBsUeq35QwX5Td+WMyqMZImJzxbx62H7y6GJBno3nyiLeJQjJyw2ZnR4/AXUYaGbMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156418;
	bh=lqVCnpaxmWSUl/3TJiMXXIoDGrLYaWsktVj6IPY/tEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hKKU0CWiZawNW92+5i6VQy7V7iMxNwusBDtxNngLnzDIr0oxuVJP7sR9Jb1l0VfZ3
	 YgqBfnDNgJAAY6PZ4PeQEq0ep8pQtlMp2tGrxN0L25OhFU3hxqTJrXpv5L1LJqjG/p
	 JW6S3gf++EWHFfwn1M1JXWDzQPYNpCLajzjVJdLEj1ne04aFgqOkDFUEYi6ah1OP6S
	 qO8wKQPNs98Yw7VIBCfIlRUeamrChtCbYusmMd+wIL/0Td0o3rZtuHxYPcs2vRJk1Q
	 O35DfNlv4KMG3n84zwRMbRb/WjhN8vDcH0vkz8ik9pSUwZL1S4hNuRx/eOVLEMrIBb
	 6RHXvjRfysRXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C54613A9;
	Fri, 16 Oct 2026 13:13:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D76769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B1FD60F02
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crkkuEXcLKko for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5BBB760F41
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=otgxdYPONahuHfvgJOYa2aR48dvR8Yld6KI8gu6yjcAi6vaU0Ho9sNybOt6arcciYUxW
 iZHySSP3S3sKBN7/duUgUbAFVszqd0HBQFAzdhrvTib9pjH8MKDWCRab9pSQDvAdBhn+1
 mA5Q7lrpsAngMYi8xgiTJWWXZUVpguzSSf7JIYXlLQ8ZId5QPfpRggHdSkpYeGhIAg1Nl
 4ZXMyciBX3EMNtx7sHLtuRUlW3WySRlSsla46rrY9BWGDfsJxrAKXTleeDSUy0XQED20o
 uksXsLDAfrQ+qk1T9NDM4kXBCv+kGu4kjlA1VkMbnz3+WDUsLVSTGSOyR/pw2s5ZkOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g/Ib90x6ghi09c//2o1P/pmkec+M64h7m96qzkQytkI=;
 b=LDfYVZ3V51J4bME2TFkHhq2CzxRxxksK1df5A/DHAb+7Hf0FW+gnVAKg251EKO37+Ns0
 BdBV6TRPMGN1XXAD+9AZ92LC/n9wr1jx8XCrd1shC+52s48+J3Ncm1ktHxi77RoC8Gw/B
 IYtRq+dT2iR2b4bhzwJeUNSZDjlaGamICSm9yx5Jk2Qy5sxdvKMUyhuKjNNUMgd8t64nA
 E7OQXkgbm8ZXPQfrFYNs1er3jmPdPI/52UqiDdIrL3nO3m+g9kY1biIr5NZehKmQ4j2pJ
 Uk3RJhO1QY+lpvB01CwjJSAi04v68Q+6uhJcYZmTZp4SHjiOXX3kYCBcCUmm7hSgdMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BBB760F41
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AB7C960CB; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:58 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 941072daedb73650ae2c59069c8efc79291951af
X-Git-Newrev: db245058c1cbb712018c30aa30a4b691d55ed595
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.4AB7C960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 testing/tests/utils/test_generate_cyclonedx.py: test scp-style git sites
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0206585209035367434=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0206585209035367434==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db245058c1cbb712018c30aa30a4b691d55ed595
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The commit [1] fixed a formatting bug with the SCP style git sites
declaration.

Add this style of link to the test case to keep a track of it.

[1] ebcfdb8b0a utils/generate-cyclonedx: fixup scp-style git sites

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 072ed8e5d62be96422c2b4625fe4259d1f5654ef)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/tests/utils/test_generate_cyclonedx.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index e6640fbd0d..b91add2349 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -149,6 +149,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "uris": [
                     "git+git://git.example.org/foo",
                     "svn+https://svn.example.org/foo",
+                    "git+git@example.org:project/foo.git",
                     "https+https://sources.buildroot.net/foo",
                     "http|https+https://mirror.example.org/foo",
                 ],
@@ -172,6 +173,11 @@ class TestGenerateCycloneDX(unittest.TestCase):
                     "url": "https://svn.example.org/foo",
                     "comment": "svn repository",
                 },
+                {
+                    "type": "vcs",
+                    "url": "ssh://git@example.org/project/foo.git",
+                    "comment": "git repository",
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",

--===============0206585209035367434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0206585209035367434==--
