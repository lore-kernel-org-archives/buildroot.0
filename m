Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8149C79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 18:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B7CD40B7F;
	Thu, 10 Sep 2026 18:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8xgHo2oOJG8; Thu, 10 Sep 2026 18:46:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 39DE340B7B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789065988;
	b=OLvhAOO8aD+/V7wbTYebzceqHDMf56v49x+s7g8l1M/YzzoFtP8mHtcpIfMXRoDobpB5
	 d3uYZwi07ISzx6W5KKao6OQX3WgVaCOM1W0ruH6qZ+tj2LXrkxsXBN735H7tmgUXF7shi
	 MZTgjnxilqHsbcBQoFEEawP4OydIvWBTiq9xUZNpAYvKnFXrQYNim/i9giwoboXuJElme
	 8HXKfij7PF3axc8ya8yNOOTCRKaoldi2qgqbMBADLNsVcrxdY5g3tBeFJpcCtxgCUOvwP
	 DEdErArxeq+bg/ikRFaQtvW6ar4+hD5wEyQYAtusNB40Q0eLelCDsOLHEuFpzemnzlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789065988;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hq209ZSwoVuVQHeMYNxYL29yJE1RM7SgSCY1Xuf44Hk=;
	b=sT0qxLSBvuvIR6gQXB8/BtfpcLlXbxT+VyI8bmUo69QfNtJ3GijKLjZRxgxp83hU03MR
	 BBl6kCGcwMH7FMkfXJFJERG69ZsuH7RhmiSZwnzpGysbhEFKNVjd9FkJzhM3atgafjplr
	 aCTmluTft+jgwOBJXC80h47+6ls2QR6NpRBw5thzwVRXOvmf6CkgxCvELcQ+dc7P0xV0d
	 AZVfChdlZViAjtwWdeKUXLII50/7Yw2ldyw4Z5McTV53/iehKTQxg7FwS5doZFay2pQI9
	 Z1PoN+wV74f462GqT1NoXQOHLRZKLW6XZR3MZTCNsf/tIkgbX6BUQB9gvL3ZC3XCZrw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789065988;
	bh=hq209ZSwoVuVQHeMYNxYL29yJE1RM7SgSCY1Xuf44Hk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IoT/ZAy2mbqUNHQl31n9VpHTuPHsdCivDJzvCvC2J8J8qth9HKawXko6CTRIPZr28
	 YP3BQCMQ9wpb8u4z9w7W9Xgbs0tQi/uwwlcf+oHyb+DFd1DQuSRRcA74tTzxsZTEPJ
	 50Z9ojJd9N5Csi3eRPG/58p5LrkUMnfpUKGLQMz0N/hasIrw/6cHS8yTeupkmwgsvc
	 0mWNvovYTFNOzTkFuGndP/tQXUf8PwkE4YjNxifVwZ4Emy2QxqSHvrp+0+6PYDFkTl
	 FEu/wDql9O3vwgTlcJNMK+hLhOpGeLww7POeNRtwb2b0Nv2j1yfhgpgHzSQ6ilm2Zu
	 h69MvddXqImsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DE340B7B;
	Thu, 10 Sep 2026 18:46:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA80149D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903F58114C
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqX1w26W4Rcp for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 18:46:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7816A81184
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789065985;
 b=mktejpXZUvZq/cnRt2mXXylkKxWEj2RFTVL6vWN/lhHg7AK2X9DYtJbBErpGWCqxdfeP
 HsWXuyS9hn3fvzAP3FR5aYGVGc58Q5tywL0qpxl4EdFafwdsRZRry+9S3VJpBLZ9bu71V
 ruLQVoH1e+FOPR2fqG428x4tfj5HJobpNRxXuiiERO76KSDaAacTKiounqszSo0HL2Dfv
 q7L2EsYsXIZ5tqXUQi3TF0XC1C9WgTDrDWoKC0qoIKIUT+jrxmbkmRMox2mBkMXu4te5c
 2H0083o9JTS5xwprAfVniNLzvpoGBPx0ptzLumrIOexMt7GK1phJpPHUBhIRf2jiQ5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789065985;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=S/Td6s/lYErxihrPMc7AHJ5sxPftllzTLYeEpLMjotE=;
 b=o45Ng6GCf4rtdZTI3w24wd7QtNVPrksTkb97EIrOnTZ87tQA4yKyVGbBGPwqQ4QrIeZ5
 J+H0z4P4njwS+XlA6N8MKiubqgY7trfi2Ym4DP/ZCSaSSMFwkPwU8+7WVaNP/6p+MkFEv
 +CtjVpPF9HLNxFH679I9Qes9ihHL6HiplvwQVS/CdLkON4tTCrImk83Oa4pbcFsyghLcH
 hU5hjiUA1DQp/DHLNVYFSQr13eBLZiaW1OIJPzwS3gqJYnUKcM6hWPi68XhIc2yUm3FYU
 Bjoo6sHzKxgqa2G+erzHS5uRbRlXfdPO2LSVqQyn4TxsKra1kt9v+kVF5rcnhaUj4lg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7816A81184
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:46:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEACF93487; Thu, 10 Sep 2026 18:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 20:43:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95649c547b178837852bb3a34227e15f6aa37cda
X-Git-Newrev: 664db5d62c952f69f5cefe91a88ba9f107cd0b5b
X-Patchwork-Hint: ignore
Message-Id: <20260910184521.DEACF93487@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: security bump to version
 10.48
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/664db5d62c952f69f5cefe91a88ba9f107cd0b5b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.48

Fixes the following security issues:

(Security fix for specific API usage, GHSA-2p8c-ff85-vh9x)
 If pcre2_jit_compile() is called with options for some match modes, and
 then pcre2_match() is used to perform a match for a different match
 mode, an out-of-bounds read can occur if the match is attempted against
 invalid UTF input.

(Security fix for pattern conversion, GHSA-q8g2-wprr-34m9)
 If pcre2_convert() is called on untrusted input on platforms with
 32-bit size_t, an out-of-bounds heap write can occur.

(Security fix, GHSA-3r4p-g7gg-ppmf) Fixed an out-of-bounds write in DFA
 matching when using a heap limit; also fixed possible integer overflows
 which could cause under-allocation of the workspace.

(Security fix, GHSA-fmgr-6ggq-9859) Added bounds checks for several
 integer overflows while compiling patterns on 32-bit CPUs, which could
 cause under-allocation followed by out-of-bounds writes.

(Security fix, GHSA-9qww-pwc4-77qq) Applied lower buffer bound to
 prevent two out-of-bounds reads while scanning backwards through
 invalid UTF data with PCRE2_MATCH_INVALID_UTF.

(Security fix for specific API usage, #937) Fixed a leak and later
 invalid free when calling the fast-path pcre2_jit_match() function with
 a match data object previously used with pcre2_match() and
 PCRE2_COPY_MATCHED_SUBJECT.

(Low-severity security fix, GHSA-q7rw-r7qq-2hx6) Fixed exposure of two
 uninitialised bytes from malloc() via pcre2_serialize_encode().

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 17f15c0fdc..90991322a2 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
-sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
+# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
+sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index f2b5608150..ea841f482e 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.47
+PCRE2_VERSION = 10.48
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
