Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B326DCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED7C60ED1;
	Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAARaofIY9hP; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B134160F13
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156189;
	b=oqA/jBE5mPn/AF4DA4TvIsxdnZisIno37DXwTdzR/iJ2UTC9MOxBR6ggxxlAi6qX3EYF
	 RCvUvrRh+/D88mB7p6EioBcA9E4MEH+zBQuxJsbGLLtG5y59FMvwdVPKbj2Ixf/3ppSzv
	 qkyt8ljYYEDlSFLGIrT0CIwFuDjZERh1iDas4+PLMg5wGamQlpav+sW6m4kiLuQ2/EyEX
	 5BV0qubIrqOl0/AlEaC+aVknwCZ0ZpqBx00DJIKwJpQA/ET1hJ87XhehcCjUnmlnoD+8l
	 SQ7QtZmGJW9j7FXrrT4Y7CJAbPln3T/Htfby6tOdl1vmrkyIe/it/j3FBmdl7QcYtPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=f0i/avrrG+kJ/V1zZh1sYRP6s3zc5APUyA8+IQk0o10=;
	b=H59g5X4YUYEZhpEfq1vS51uYssF3eoyHHJeYGcft9cHBjEyvGn4pkSsUz5E30vFBCIZD
	 1atNYA1Zp+jO6e8djri6fNl9PoI8OvqyLoTVBQls1Ya+KavFiRIdsBsUYwOmXhLdCc/pk
	 e0NL5PRhLhJVwiBHDT0AQIJzoTKYH1gO53FMNI4fITBvCB8LAaw0H/ZsMXk+jvg+TizBU
	 VP8DrQmVOvwwgiMMaBQBvkc2mFT5SUu3GzjjVneMbWKB/VQCoJFaZ42OX2ukf4Xippvwv
	 yg9+G2QXxQgkqC41MfLOIQc+uYWEUztQQb3ws+yedNDsJEXAYEWHGGtmYgdcBNav7XA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156189;
	bh=f0i/avrrG+kJ/V1zZh1sYRP6s3zc5APUyA8+IQk0o10=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SgaLVmQIaxBylw6q1oAASaT0A/wdc+4fNh8dS5q2+0pTVrVJ/lWni8SwEZJ9Nbxdb
	 cVRX73Ip+MNGdR4wr9x5S9UdocNAs8GCr6sS48/WPZsQ4yzFwgtkUi2oDcWcQDIOcS
	 hqCVsv6/bMAOS3ujbBsv5bfwhDoQZbVYVRVsgOXdDUCB+oYC9gugnNY5u8CDDQSoCD
	 jCtG0GSLYoPdUo2IXBSaiI2kKAa+sMt+7ugvGp9gYFdHJIC9KEC3i4MKYTnIUa3j5f
	 oCh2458yGzgW9kcAwJqlUE6ZbVzm4BbDJkfGNFkw+aROYJsq/0uWlKpYGRQPuzLFwx
	 WaKYM3X0WyGRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B134160F13;
	Fri, 16 Oct 2026 13:09:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B255D1EE3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F13E814D6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIGo5Ei_EDeV for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B36A5814DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=NfNaveyM+BkWPI1ItMm94eubYE9NTGqLLGV5l7BhvxvZM0dAWEZI4jCb/dM5HMKXmSRR
 1XhPpNHK8KkLPrmtxRcJTXzk/oLpiInrQOSYUnXFWuWfwkUA5rkN59CGuF9OqOMTmw5V6
 TXr+f2dayNVW6pASkN2pvqq1d7qPs15K12leA4e3nVEUfjzAkEfXNm2lT1cJo+ORfWRDX
 +nQYP+M4ZVm4BDg7zP+qNp00LoyFkG9BVWD/ptLrr1HHIWM4/ADs9Ow6mxxe+hsCEBc4s
 JbbasM7pa8j6GgjuwDLytGdj0tn2+O3bGvo4T/2aJeoRIthfTFFPMyio+ckZ2geMOtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=N074+Ix84EFk/clHZbe0GhrLmzkQ+/9vy3Tci8ROc+I=;
 b=Oaf70vDGvWoHC6kQwrCkD7ghySdwhM45DjQ/FKqEn39Guxm6sdRX7qRs+XkZJxBtihNP
 xPN4u2xhwMm8TcZ+gEeBAKCSaY9l9JxRQWw/cNDBJN4Y/uXnt2+yYvKvtmAaEPlY0M9Gc
 qtVOaDrERjBIDJHRxEC0FBP/FFWIE8FiG9xc9CV3B2KAFTj05gcOPoeqQsh8KgTceOsSR
 UyVSVYQvkjdwA3YXUq0vBXgjJr+o7PV4AveUudGK2rogt96Rq63dYDDigbHRxrt8O/XKi
 hMS+dtoA+xejXoooJrbGqRsO0F0k7VDTjVicwYluf9XDbRnvi5+l+554EFtcpqymtZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B36A5814DC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A488A960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d682aa094d7a8452ef7dd5e37895eef49cdc176
X-Git-Newrev: 03ef11f0b9c6d0e590406f1aca8d4d23e0738ecb
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.A488A960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/htop: add CPE
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
Content-Type: multipart/mixed; boundary="===============9073285015412398759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9073285015412398759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03ef11f0b9c6d0e590406f1aca8d4d23e0738ecb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:htop:htop:3.5.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2008-5076

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 444d769c0a575916767f54238c4e01dbd56eeb7d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/htop/htop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 4fa8e4fb5f..405d3481fe 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,6 +12,7 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
+HTOP_CPE_ID_VENDOR = htop
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.

--===============9073285015412398759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9073285015412398759==--
