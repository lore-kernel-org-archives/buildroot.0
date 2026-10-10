Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8295ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4804D811C8;
	Sat, 10 Oct 2026 15:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eybpdNj22wDa; Sat, 10 Oct 2026 15:19:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 636C981126
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645545;
	b=L3mDR8QXQ5DgbxsDkV9HIMzQzIrxDFtjx3P1Kv4aitS9Z7h2CaY7PlcK59Ho5rQm5WR+
	 mcxdUTIVufm/VwE7I1FDLRihNQ9owyFVYDx+1pTZcwXasx0RPBm2GugGHuMxjNzKsj6d+
	 FWoJypYJm6GoXBzJXJ/seTVN+gCOcea/CJq+v10+LuSrCvUTyKFrdbuEKuTrIsR4ANn/V
	 0aN96mitF3X4YDq7GkrDwsv+Jw/2yAz8k1qzNRTvP/EYPmSTMIvJ28JBGOSMk1HMrcexW
	 4NZerKKoFztxxMVLLmMlpAHyIDEni7S4gvjNEYwZ7uRv3NGJ7ZbD0FwwS9xe3oLvgIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mBbpDxjAVkm74G5GSlPrrelbnLfx8AcqJZiv3HG1aT0=;
	b=JDxE/JiJVkruB/ect5Vvoh0WMxL2PMvHz0ywqQ3l87jyfpxEseqA94m1yGRL9Z4ZcPBd
	 rJXK7NBXsOOBcfcmkXljN7u/Nvtv/PQ6B/TI1Iao5gjMSvgjXBTmQ2tZ12jwmIOKX1vkk
	 M6hNrQhP6vCgp5jRG3FsTiRjwS51RUOYKiaTy9DmtrfuWhRerD/QJTOkj9R3zl1S3XmUV
	 WG8yS+9E7/hnR2w9b6MNDZha1u6r4DJRtw/d5M7jZWYSGiOy4hd3vpV8K7IlY7iqz795U
	 4l7BWHqRo6P+5jBkJS7Qw+U48YvKXXOPh8yr59qIMnXuWKvG+13XrQn3En4HTTVQx2A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645545;
	bh=mBbpDxjAVkm74G5GSlPrrelbnLfx8AcqJZiv3HG1aT0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pNYlurs5DtCiqkxLqvA86Mhdi+FM6aY/dIm4dEYXduDiH8PsntR6qfPawicH93hd3
	 ko0rt6eyAX0c/zepzBXl+36w4Inhtl7qv4o5kM4ZA7N9OiyWSQl5UzVYZUF0yEl8tD
	 Zvy99kO6iuGyYMvn/BGY3JA9vNBb/DumhU+L/riHgI7cX0Sg11Zngwd+OiJ97nn5sl
	 eCTPyZNkpDkpsLCyIex0fdB+3rh+AqEtLjfMC2i10uvGF9C+zam/VGCWeB2pJExxcL
	 g+LBGkoDuzWr+APRClVClcGt3QvaDuQ/ti94lGtBwimzQ2+0aB73RJPUEul2TBGjIa
	 DGS/TKGJWtgQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636C981126;
	Sat, 10 Oct 2026 15:19:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD4FFDE2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A661D4093F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_oeB3VKy9ly for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB74F408AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645532;
 b=Xqip5ScuC3seLY+ejrAa9OKYMP7PG9Tr6mLI5ZFbUCvqekhQS7aBknE78btn0GJHtXAa
 UEEIWMNB1Bz/WgLagB7L8Dhej64expHEBAeCKzWViCpZt1oaWLc4mBXVFSCVVvbg2RHb0
 AyX97clc2h1EWYxoWngT4iKqbq6+7efvxg+j3YY0v1WuL2LNRtKosI/JFbMZIrgV6uwcC
 XVHSVwBs8c+Tebz5Bc0vZlCT0gp4fm6/hxpeVGF7YENqc3BYMYnjTAKSRzSPxbi93kO9q
 zdC8+iSw7ecHXUYCKDSN/S9epwXCkooXU3E+JnISZj0cYhBr6vcDtcT18vrulHP9J+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645532;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=enmPIHU4RQ8BxryeSrO02NOja53M8yJXemReSP5nCEw=;
 b=MqKlQnABrfvO5wje9gIijNFx53+pMOoydHRE8p/wSGJk790kj1qBWW+xef6FehRFLB5e
 O1oJ32dU6DxwpjnlH6nd4bHFLIh2FVGfquibMV4Up2V64bhSjlcZAAd+C8ujhjzH0pxVs
 VBsvYj0Ot7RZh9HXOtrQf6MTrfTrcLfe2j1dJSTSQwYsfJCNTIfTjXclaLfpiREp1f3/L
 mBPfkuF340UOz0tYrwn1vwOLZ/zmq3ZWQRbbPmDtFpThIaXHaSeOZKBH3KIlwnC2i3lXP
 48zC9FfvFCWYdNt5ekd0e0xhibY/JmOrZFqruknZ5mCt3QoglWA87sNDG4gIiVl7UWQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB74F408AC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AADD9222D; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ee591714dec4ea3921e2da33c8022447492f0bc
X-Git-Newrev: 32d08d194509a454c80fdffa7657c9564fdddec7
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.9AADD9222D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-initial: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32d08d194509a454c80fdffa7657c9564fdddec7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

gcc-final already had a CPE.

The resulting CPE ID is:

cpe:2.3:a:gnu:gcc:15.3.0:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2019-15847

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/gcc/gcc-initial/gcc-initial.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 18d5cef0f8..3c484c901f 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,9 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_INITIAL_CPE_ID_VENDOR = gnu
+GCC_INITIAL_CPE_ID_PRODUCT = gcc
+
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
