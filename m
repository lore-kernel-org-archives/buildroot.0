Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B217BCCF2C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B8D60FBF;
	Fri, 16 Oct 2026 13:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svrjmu_3P43x; Fri, 16 Oct 2026 13:10:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8345C60FC1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156232;
	b=Mm6SSS3iXsGzmZftcCsn5diC0vYzI8b7dLhk6pr/RD++89aCe412bzczVITuGxU93Hen
	 dku0/v8CjSjUKt42PYSIdrzmwWBRPISX3WQcdjrehicym/wf3Pkl7Ryz/xbBTYS4L9+Eu
	 aujDIH0VFlIFN+qa/Ms4EGHVPeN4JIC96H7IHvpFOA/N3qAziwo2Tgzh4BlOo/fLc84bT
	 58X+CPjra2A7ksHwMTyD7XUWRR7Ye+pmk9xGwHhQ2ZGWgHfq1dg/wzOFYk+i5Q0nD/A64
	 +zTZHkqCawjBhEi4Upwrdt11IHd2mQUmQ2JnRh0TIa89KV2OcVDc7/xvEZs72YJKRTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7gW0A6fVtwCdQIH0RDvP96AuFuKNCnKf9zdAKuJqxsc=;
	b=gMMXYPO9IcXYbWWvIcBIvR1CHyiGCa2/le4nVQNhH4DUmYf2IGlF0sjEC7OKC00GIQDL
	 hYdsVwrqexZbiT7ZlWinXDr2l3z18BQoLEudcMnGmFiOGYMuvcwRNKzgVsMfIM7lqNbjI
	 TmDXJAkI97OIsBw9bOEp2XfGjDWHR3sIttldj4D7sprgIQlOWD/Z3mKDbviQ+Tu0l3/kH
	 bIiLbH8YV99IGK3Y/GDNhXV43fb4g5Ixr/MJOoLmxCenMFnzKvKsq9KyoLVwHG1wOQLbW
	 zNfkKfU1sJDgwq2HjwE1dF4FZvT+MC7IkUXSanQSE6mvR+8U8BmD+VyP+W0LTJVtNVw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156232;
	bh=7gW0A6fVtwCdQIH0RDvP96AuFuKNCnKf9zdAKuJqxsc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yn67/+ipcZuig6fCHlvT80KvPNdcxh/pdu+so6dEwTUv/RD7rpLfJ3+WgtTVM+qwN
	 h8X7bqiI6vzaK3JTM7In0462taSJ/RRysAf/A0qHz6zFtFN0cAVWTlfrfjRcI51oKz
	 A2zk8foYulMbDgajd45EzRS5isS1136Jvftl3ftzAFHd39v2Ge2kkt5fhtqPV1uqIR
	 zT670yQ+nPIa5fKLaAkYfBvETQPhxv6JqcCRaqygP0hUk1YRXBCb3TpRALvJjmdM86
	 52VUyUdyx/wNTlZBz8H4zkylGScTT/7t/D/Nyj+Nn2vCZ7lqlrWPCqr8WsZTwmLxfe
	 NorjfZIICHP9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8345C60FC1;
	Fri, 16 Oct 2026 13:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50BB21F72
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35ECD814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dd6QNwvIgcjh for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6F0D881509
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=XPSiYuLumhrmlHcKlTYiw3NQINnxLtJpEexLh/zP8delCIXoj+TdwqNfG21P/PNcJVif
 JgqQmBBOAEgSHE0HTh1w5fD6nFniF6QMgSbQeL7NsrzXeoRed5nDIotW1EEHzwvsS+7aC
 CFtYj6B8D9PKCKN9FYBwxj3+3EaMZ8UJED+jH8b0cPJhil08rTuaoDvqjvoTYo7N13Olx
 Skl+1hCWXBynjd9pXK1dUI2L+7t3CS7N6bGhbnFmblRWPJqkUdefzYPHzOuwLp98/jqkp
 BaP5PaoJAN4uH6OZAmLVrVaw9nIWK063a4oBsS3iNUoA556DQE2/pOgDc/TI3HXqVRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=296HG6fURORULXjkC75HRi7BlRss72Fn8XBcrI2/6Tk=;
 b=TLWR0o1reoDhSU/K9kVC3q75oaS7xI8bHGxkUg18Qaw3YbbFYzk5YSsHNCHT81ABD6MQ
 nU743ZIUKLz0j7eoDiC0jgEkI/y7VdDy+8WVZpRKlQ05VgqgZ16zpRd4XW4/VwrpgDoGZ
 WQwXcsvRvitmGcZfqW7vdocM2faBOG9GvX79H6mC0XbsAvZidQkhCg+1LUHGH5m2YbSfJ
 CdbkOeNkSOJxyPSw0GbJbgjRpB3Tna6UZI5PbFF3/3ntH4cH5i4u8a+WbT6p+Bu7m7f7T
 HRVUVGBngjg2BC2TzFH5RtNSfh7juJUMLvd3ka5rzEpPGWpf7O9926ybAAEOzKch55g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F0D881509
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6010A960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9887b3020f3a516adc8cab6d5af9005804ddb1dd
X-Git-Newrev: 72a91798dc0e3fbea87183fb2987e53399f18342
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.6010A960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5630645577993846678=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5630645577993846678==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72a91798dc0e3fbea87183fb2987e53399f18342
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============5630645577993846678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5630645577993846678==--
