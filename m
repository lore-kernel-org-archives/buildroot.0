Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0169AC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B49CA60705;
	Wed, 16 Sep 2026 18:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yRWieb-BYRh; Wed, 16 Sep 2026 18:50:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0721260626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584605;
	b=lyYQ8r8a8t2IdXx0WBmV8nFayz31bOlwARMCTeVE750YOWkrO3hH2Ft0SJ09SRFAQWeB
	 x6Ttpio38CSvcFRFym5i/hBxfkPMW34dERquOJkfFERTgkGa+NpEJ++rmHfvk9nQcthao
	 pZT3PDcmuM0xz1JDyoaX9XO5PpPPYAT5plXX4enWok3S7T4CNsavkKstVhZv5gq1+9zG1
	 EJcw5Ke3zMrCDtpdnOEy0oHPZ4wqYyHjiU28n6BXWV9c9FyJ/NMr1LhP0vfPwuoPstWQa
	 Km/VKjcmaGqrJbUZUbdd91BAEAYzIE8hNguUT1zhgrFCMYcgKvvB5bCNoDYvhwU/jcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584605;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=88HZPfm3IO/KBXYqjhf4vb3UzUSYnAZ+3m5rTIYx0AA=;
	b=JFOuC0ZZY+yGCAtFhqA3AOug2j+dFEQXSP1nuoYVQOltEYLxtvyC47jw/VfWrwERCwTm
	 N3scP5Reedsm9HARI3HyDU3dSB9vn+9SLZmOBUxjrmVdOh8bDZPAPLmMn0zAJ1kh+xTpV
	 /vIik4oaXdQaaD0XFDEEEse+a88YgYI8fbBwR2BXxXqjQgcfkK3XldD2krV8mE6ZRJxvD
	 1NUT8QHGYzIiOPTMmt1xtkkfj+HbesEKMHJ361V8kbH+1SE7Prau/N+h0B7DIL/kNU8IV
	 Lm1ZtBxV0217P0ZYSuN0loEhpiYTXry1IKIrjPwdzkW8h1Azg37iOCtaV+sTW/wOj8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584605;
	bh=88HZPfm3IO/KBXYqjhf4vb3UzUSYnAZ+3m5rTIYx0AA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RE6IOhftnmI+jyXuGNCV2MYuBrcOAoZ1EqwvWCQjmNr6vTi4e+Ws2MhnP0TqlXnMe
	 vqmq1vIOcHm0+BHsAaN5GBga8FRYJ9VSVK8SOfwWYngcz7V8dgDRrJf0FjKAbJWmZf
	 SqSuW/EKSQc3U2WzOdG22OqBl6fBQKR2i9YaCivGd02aCTZGw1VvnG6xW7jX6DnEQz
	 aaWHHJEp4xBYy/yjAWlQPX5TchM7RMIfAa4mixhekaYqwYqcZfcsS2FbOBMJckmLzr
	 z2kefrOO+kwIt9WoQQxxv0bhofvbIy6HmrB8rfY//e5J4jmZTToCuFhs5e9rucgxKi
	 piLfKIFnBjM3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0721260626;
	Wed, 16 Sep 2026 18:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA85724D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C816880C3B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zd7x908DSCyQ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0D6DD80CBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584603;
 b=iT8jldRyL2ENDNfIlDc6h5FJ4EydCNeXN6VEvKNlvONMJzJmv9fX9bFaWt5CDJhUsCww
 xlYhc+kxV29jN+7s0d0nXC6KcwtR4s+7XovfQo9sK8Lqb/yzc58a/jY27pe2KAr6Qej+u
 yoirp2k7IgjdYl5TbO4jl9PMGvq+F2q6Nnypgt9YfGEv04a3diEsxWJIiAej6NJArk8QA
 9Cwlbi2RAg9nQVZPOScjTIoQ6MSR57sbCJp5DTyKtvE7J3a7jHhKIDHQSkfMNgbKHgoG3
 hMic/lS+TgQPSfJM2qQosRc/OVpFRXQ3iTYr7Ndez48bYwXzxmzK0mE5SimhUDf/HLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RMzsIqagZk2ati9bZ4kwBLQZsD2c4Y92gf6qZob7gT0=;
 b=FrsbtkvVqfBBEDOURYBlIZDniXhQQxsykbbO/BuC9b5MMATs9LBXQywGZxWUmLkHSXlV
 F+kDFqDOh+o8mPBnPLzTptZQF/m1YWr/GSIX5G3H9SIceGFjWeJo6nl8VY8/Gt7Xn5war
 RmkYkeUgKMyB0nZy4h3CmodFfWu6cDcF3knaMD2r4l+LRTThDd4CIQBLaXMVUjW8Ci7br
 fWW79AmeRGnBF6ziuJdvjykj9YzbNftlEYDoD4GYrzfdIB+Rr4HAXjPrTZd9OxgX2eHfY
 3R7tYSFLg1MkEBF8GzQKUXcdVTxGvj31rAY30vy1HKqo4vUOR4F7wx4X7CSSzvAODZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D6DD80CBA
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97802960DE; Wed, 16 Sep 2026 18:48:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:48:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84decc3a1dd8ac5ed44fc2123dbe1620780c86b0
X-Git-Newrev: f2e4fb9093c2eb6f9d1b02baa84c5c82bc292842
X-Patchwork-Hint: ignore
Message-Id: <20260916184856.97802960DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.3.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f2e4fb9093c2eb6f9d1b02baa84c5c82bc292842
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 3f4486aa0f..037b4d4760 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbe4deb0d2f72e5c58adaf17f87b7a11bf639446d99bf4193a116d0588647a97  intel-media-26.3.3.tar.gz
+sha256  94558a167cf863b190aa83d02b69c2d67227cda15ba320541b30171fe3fc4f26  intel-media-26.3.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index f1a6dde392..90cd4189fa 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.3
+INTEL_MEDIADRIVER_VERSION = 26.3.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
