Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C53CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB4A40578;
	Sun, 11 Oct 2026 21:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7PG_sL4GujX; Sun, 11 Oct 2026 21:04:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D36A640541
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752686;
	b=RvSkqOuDelqn86JhZfkj07beWthA6RRMVPr8kDQSRQhpVOsXe+UsbsC/WgMxllvsFuOX
	 5Ivu0GCRNZ7TpCtw4qe7+IxuK5fwy2qlUzD2F5bIUYVLOesE1w6AzqqlP88hbKNM2mnT6
	 3dPprLw/hWaCH+0p1xRIeC1u2bmax/uw4R+7nNYkkoyyYeRtBHx4jIO1cIlNHzA+TrBZ9
	 hlKxARoKsQxVFwFRB08VUcexq3Ol9y3zDXCX4EI9JcjV/IIfAtt2kG+tgoZGDZLaqS0st
	 yU4SK7mygnWNHqjaFAk7ukvdcfzaBepYLHG7zaAFsXnlt5D7qbvDem8vjLF0cMi4Qfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752686;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=auqeDgyqyiQNS88ktMKj/sMZZV9vSkzOUTiFOac4Ico=;
	b=gF65mjKxLBZ5ZZ3skVCUIWWL0YDbR99aiqSBw4ZCFIqxKDeWfK/hjVaGcXdOadW6oUOs
	 cRgIXL5X4xzJ3BPTahttvFS4kcYnFqORh5qcm/3DDkmQHoi16fEX48vKPaJRb1madsLvX
	 OkyojwKEZiMShb1lWYUZfAY/A10wLsjL0fB1lo4YetEGI+9ufA3elQV7UsjynDMJvbU2O
	 qBeJ327lQSuuFXCncP8ME0XzfCZ4JhLHlHLoohjCAivWdIAVXNXmHlddYO8J/OufkXY8q
	 Zp2FGowvu995isYv2U6UWyTOa2npg1HffQhnGNjs9VErXmL4of6EJ3Mjrk/FMcbDp7g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752685;
	bh=auqeDgyqyiQNS88ktMKj/sMZZV9vSkzOUTiFOac4Ico=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=owvmLkViDmPhTXn/txOk5xArwWXqQ3qaor+EBStZJaRru+Ff/Q3vrX5xN/kRgyB8l
	 gcvyin4jzyi8xUzB2n2YM1nxUWM12FYmwI5WwIKZUAyZCSLjtGKMHQxtDS5dFXsgR8
	 g5TCik6Bq3IIrioytdDBOBteZWYLI39ocgC1ZW1FSJ0g4wpWQ7E33qIBg8W8sGiHb6
	 z2eMDO8hKy11w42ZBxIV78nZC/H5vptzqhv1jeWeb3bZ2Gr5yg90nrECWeyoy8IzML
	 pRkS5tYU2rlBR41WZGGkNipuBv7DU0b7Cr9TtExGg2vrfHz/1l5ejpq5AFdxh0AoBz
	 BsL1NMCxOfJAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36A640541;
	Sun, 11 Oct 2026 21:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F8281A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB2840541
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMTo4MNplnmH for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:04:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9BEDC40525
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752683;
 b=iAwm9+0E0B0RSOkwvFG//hSvR6fePxAv3LytktQSyCGxng4Y29pHAI4TkOAO5rRpngI7
 8A4ADOmKDsB/ZaK4g1V27JDCjtFXG5pNYlie3S45H0gqbQu6d+yj0YMUZDTLjU9QB2H30
 v/idk8gmfO6mOdmYJGiCaS3cWoe477pO0LGGdDZZgBSMi9EXZoUIMQtJplAJ0+Kd8cmMd
 IHQON7RQokHaY0SVUL1cRdUY1S7SKf7Fuv+rSx9exqwam+//mVWweS0wCKOBOScVH3EsE
 2l6khaQ4j6sGlzgzkPGL8wvVwR5474KCSNyoBZcOUaS4uxWAGX+6mbf7vTxermxFzIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752683;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KG7bgMWpgDg7WJeN3BFUNCV4pHEOvqiKlGRQpWI76xw=;
 b=cvEGTkPZGsc2hHaWEHzhu0Du5HvZU4dwYVcsjF7LL/nNS8jZUVA9kYkIsxLaXq6kyNyk
 gHHAWx2EZinDRjZRVDw3nVp58bxcpkhwk83vnlAnCnqfQKKNi7nr53WhT54kvB6TAPxp9
 bCjvw7R9T9bYPrQwKh4gMVCC/W9KwwghQ8vyUDcXW+HZYQLXFWGnnOtq3dT7pldtoE/CZ
 CrGnK1dqy+2r/hWzTjXVUlu9K3moJpCtdf/PZcGvFIqNBDFOQUUIPQ/hY77eLv30EcKtN
 5KWCLUJ/BLevI5KyGVsEYmmYP28ndW+XuCA9zGEjdsHOyWKxL77Xt21h07PsMCyv/6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BEDC40525
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC5FF95276; Sun, 11 Oct 2026 21:03:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 22:59:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f0aacb6346083db480478c59711507263455aed
X-Git-Newrev: 4422d99a4e1c7676def18ec700f3beebea26b1bf
X-Patchwork-Hint: ignore
Message-Id: <20261011210324.BC5FF95276@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: also disable internal
 ccache in the build step
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4422d99a4e1c7676def18ec700f3beebea26b1bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

WK_USE_CCACHE=NO is only passed to the configure step
(WPEWEBKIT_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/wpewebkit/wpewebkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 1f5f4aa5e6..c424a3c4b9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -24,6 +24,7 @@ WPEWEBKIT_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell wpewebkit not to mess with it.
 WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
+WPEWEBKIT_BUILD_ENV = WK_USE_CCACHE=NO
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
