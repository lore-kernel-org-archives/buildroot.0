Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F50CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D0380F31;
	Tue,  6 Oct 2026 20:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6-GEcuvqI7S; Tue,  6 Oct 2026 20:36:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 128AF80F22
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791318998;
	b=l9WDnt+nFB0DOC8oXZaMfimRyizr15Q7Sts8YJcdAMyRPOBUL7G2q/pdVrWpyJuYRLAB
	 Rrsq5Ir0GxV4TJ2/qWEjo6xF9++SEvIMkoCgYknFdDpSrFpDCh3PInoA0/AdRWNTbA0A3
	 +shzJatUEr2VBzyCC233MW3/qiEJR4kXpj+b5pVRsUcUC5BYjt9nc3V1c5K4CdeLwI1ZT
	 b1eYaHz5hTt3yyBtleGXCqLJv3mywwCs0qAmsFMkrgJvBygFysEWaTeM+P6aIIQC2UrA5
	 vNcgxvQZBZ5MVTbtjF7NYxEMmewH3tTtKL6JLAroYGavV1m+ZZAigBiFy6jsthb8f9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791318998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A1EPlgtwXngRD9XwIWG3nVu6Jya+n6Rs8hdyf43B49s=;
	b=BU3WFoS1JQE/xpDWarD5VJ8nCPcziVrSqN347HC4W1ARrnPZcvOJ/iOe7nRf9frOdOJB
	 LfJnBF0E0jeuL5e46RwNW6/1GEcKJyJ5p2VYlFRpA0vJRjxo+acWO3gMliJdQ5IfR726D
	 WRaoGqZTwasIYV5f7SEs+9fCjnNKATKpAHWDlxMd8kovPwqlMCRF2FRNVbTx/wTZ3gJfO
	 gBPxRMES0iOjqRxt9O4gIwUi6jdMQnCCxfQc9IcDOQYFKbjM+BOZmGvjX7sbHgmK5kF5d
	 oizpLHFuHnLM5RUPTUS7SSev87zyK6gwdmjYnt6dB/OO5u53f3Es8vyRhnPU/7wkqlA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791318998;
	bh=A1EPlgtwXngRD9XwIWG3nVu6Jya+n6Rs8hdyf43B49s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ioq1hm1h2xPAnsAQlYqYQGcFGmrtYyRusPA8JAjs29EZViWS4bTjVokaBjSuqc2uz
	 aSxbrV+4Khl8wcAiMGFS+NxnXUHh/PZI7APeMmtpZFfKSIDz4935a5usqg2ZLgF6qN
	 41EIkCYdfH3H5kGR+qZGncXbzQNSx8TZkM0uhLJ9TF64VpngWVHWflEOVq1R/V+ODr
	 NH4odF09KXyWQoxtzWgh/ubHKauyijXipYL31l000BZSoRItRPdGNBCg+OeQonFT7N
	 432+ThEXeNd+FLc0BvMKVEuocMOds2+iXwl2xYsxbW1xkEQsWPExRj6jQ+sCtLCjAg
	 wD7V/jSThG1VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128AF80F22;
	Tue,  6 Oct 2026 20:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82A2C2AA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68793402E5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08457vrsl2uk for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 20:20:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 96213402D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791318039;
 b=SJetL1+VYkMJLXNmOnuKzUvKsdb12crjBXZH92fL8v2xgV5mghPmLOsEshXNgzb6Z6rI
 SZTxlMdmPf6hlJ6zylmYm61iw7IeUWUzNq1Q/elEQo2FgXcekQnZk7K87YPkwUoY1py6g
 CYdL/ib8/9279pryvR/Hi2qsLJ0+OAa5SbnxA9S4W05r45PWfnSPDPpy9YPTzeyv0Polc
 1Exw8++Eg64yD4KDn+PWSPVv8QY3Ei3KXxdtTaxE79JHfBXIa+/uEDg28tMrv4bBTvOAg
 Jtu5AKq7pSUDonNXM/Foi0QI9YOzGpd5TCsN3j5OQp7u0J6xAlsbYOVCWhdhaOuQxpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791318039;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=K+8+Qqoqo1gMfx1L2h1JGoOVAR5GlSIiVRPtHgSnjK4=;
 b=f5uj+jh3ZeoM0P6oYQokAuNRI8Vdpncyd2eAoVykHJOIebVadpWlcmCc5wvuEFXx+SbD
 gv4mSuv3SGfQiA5uouVnFaLD59wgGW0qbj/HqT0hi3W0SXbsjzCIoAnyABTCyOkyZ5BSZ
 hoY2oIyGgPaPg5pKTQtZ7igQUiS559152+OS7msrdFrWZOnsZ4POQFSdyo0DD4Li9QPV+
 8L5JEqD/FS1ots+hRWwZ0OhZz0CiJX4e9i+VJCOjOUHJnVG+teX1yTCznnOGjSDidW49X
 aVQ4DQ5ZIzsC4i9eRqv8/h1CGCS1uepiaS+iteC52jONvPdguU+mYYBMim5UCtT35Gw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96213402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:20:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 245548191A; Tue,  6 Oct 2026 20:19:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 22:20:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd28a8cb99f88618e118238328d3a11f9e50d94b
X-Git-Newrev: f51bf05d245a73d61d9a419f44de40de8c1d7424
X-Patchwork-Hint: ignore
Message-Id: <20261006201923.245548191A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump version to
 10.6p1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f51bf05d245a73d61d9a419f44de40de8c1d7424
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 10.6p1 (for details see [1])

[1] https://www.openssh.org/txt/release-10.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index aa84d011f8..a53ae817a4 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.5
-sha256  d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11  openssh-10.5p1.tar.gz
+# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
+sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f2e1f235c0..6808db9962 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.5
+OPENSSH_VERSION_MAJOR = 10.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
