Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA48ACCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8FA660B71;
	Fri, 16 Oct 2026 13:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6SvRH5Slu7X; Fri, 16 Oct 2026 13:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C33F60B58
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156140;
	b=GkKQOaPa5hCN3QbH1oRDC3xvsOpyqFSLEmLqpQrA+K9/BHkEq0KAAYBSZqgRnm40Nilf
	 hGzFFn00D+Mx8dguJWEE+af/2OpbP/zbDnXSAwY5ujOklNF5L4QIi3myspMGj5R9bviL2
	 Tt0L7tsCw4bKwkuJXQuCa7UBqzKeP/NKZdW6c3HBkEFV0Q6SEl8j6s4XkRJh6fJr+y70u
	 3bpsn9VfKoaABfB54dDErJjzTi5IvF/YTflj4xqA/heIivAaXLHk/bnkmSiT5rMDxLPu6
	 b9tvGrO54ABvwQQgna3zW9otXUdQaOwpW28jejVoGDDuN88AwjYQ3XoqSX4vxrBUuyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=aSLilU9il772CcvuLQjOzPFxDJUhxPdWooY1uICMcyk=;
	b=aTvg4YxtDXlJHdhFiD1r587vY91ZdlaClkCCCKG8WSYTqLE3Dyu/zdnC+V3sX2G0BZQp
	 GWWKdx8gpN36ztq/Hv0dKgkfxTLaJeOUNIvzG9bpMb1je+RqmVn4ndpp4x7DvveFDfkyx
	 OZ3UP7LgSGDv7jWz0asAHpceWiotItlL96tpqtEd7O4DAtHL5nadY21tD3WQnjWlHspJ5
	 YlKHpr4f7aZc9xfdJViV/omSnuQyAtvEMQtaS0kc9yPvXFrcUUSdMWd8lQPcoJvXqDGH1
	 L94DfW3EY4vnGJCbw3JVcJ1VEqDznbAAqHABFDDvMRulqQuYJYridYR7XhuElvJXQ6g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156140;
	bh=aSLilU9il772CcvuLQjOzPFxDJUhxPdWooY1uICMcyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mS88mZKWEKNNttX390ZM9DFL8Ef/SUk7QqDeAeDhJNHtIWtA6sspYjqvDjP5Rsogm
	 c++gnGB8Gl4CYZ2EsYIgrgtZ89a4Jv6obbBUvHywi7/YIq827V/lV5mFZT7SJxtVXT
	 21QJeEHt0xnbh4CACJIPJ2SdVHfhoIVnyowVN/KQAA+CJejer3JmjIokMdF1VBiEoo
	 vlyS/CxQj4FDgT5LFxizwVU77/RpZ1RRxYO2anQBnEsxnUcL3Zr0Qj1rvSFIDmfC5l
	 FHeK9XyOntefxDD4E2Z5Nacax8Yk6pGMC2YPqCbDUbfcjyY9mTSwKzNrppeT3VjNGQ
	 +TL3ebsu5T9Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C33F60B58;
	Fri, 16 Oct 2026 13:09:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A96AD920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B3588150C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGBt7Cp5_N9k for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 472F5814C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=OCc6d8VKiDU8HnLVB/LU74vxLGCXC6IuPOM56ucBNSeajNm9Wio4WPFJzbzJ9tTFTwIh
 TPcdj3jy6lLTnFeHOsM/L/uzRO2jtr0Njovru9t1U+eJWQdb+iU8dySLAMP+EQcm3lTD5
 QVQ4uV4pK9XrzpHmJr/xKf5yRCx7XCJ0NXwE1hseAr88XzL0fRhX9q6FYwOphTO6Rwlpq
 j8d5PrEmYvurakl7ljb19KBrfoxG+/M1AcSd4dCAO0s/Sy2I3Bs19IJaGKPA0zsOyUEhj
 dyCp0wzPEBpWWdbJvqkoRnzENtyekurz3AFDmUuj6vKeaQIzDjUGaHtMzRdfG3T2/lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1CiiXyboLw17UnSJ80g/vF6H54TKqXZ6eKOdi6BTD94=;
 b=L0wu1LMnTPsG/InHI0foPUPZavyx3ZfZUlYeX4NDcWXVIslIFqFlcYcPpFxu0LTh6MBF
 pxxDmTWP6fZzLYJpYVaTjGvDLyw2U/OeU4LkTTN1lSVDKvPoZyU6e8GdDMZtX5CZdxV9I
 UGMnoFnXoKncyJ5kYxbVdBb8Q3LnXPMb9dRv7mWCNfoBgAmhakwLBlyfWrFCV10vV6Xul
 cpmitE4BOOwcAwBqPbkBF+eB21Cty1q/EgC29eh7WdT7rB92H5wTUG1j4nh7ia8AJTtNo
 AA63v9828VZDGCww0lAyjKi64THp6S3G6CiVgpoSyWLQbV1PaqdejAlNWUwGO9aGbyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472F5814C3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38216960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f3911673339161ddc10edca37bd60c5c1db8be9a
X-Git-Newrev: 082d4c7d5345067d3b8fdd733b0e0fed9f5f5956
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.38216960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Joachim
 Wiberg for firewalld
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
Content-Type: multipart/mixed; boundary="===============7222179991935417798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7222179991935417798==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/082d4c7d5345067d3b8fdd733b0e0fed9f5f5956
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 161391871082c9d363d7a4ff25d68b8f6fda9807)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d24722f58..bebf875499 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1591,6 +1591,7 @@ F:	package/rtty/
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/firewalld/
 F:	package/inadyn/
 F:	package/libconfuse/
 F:	package/libite/

--===============7222179991935417798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7222179991935417798==--
