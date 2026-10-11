Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7181BCA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 18:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1364360606;
	Sun, 11 Oct 2026 18:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNmD1CSd9A0y; Sun, 11 Oct 2026 18:24:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E4ECF6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791743054;
	b=Ppq9spSOtfzYlw+w3BRaGCL4VH4YfM5LJtgAdIdd2+UCoM48z8K4vdWolXiLfKb4Iyml
	 6VW1YJc1//qdvFMIjA5yHPrzzr4YQSRVxgbwPKE6bUI7kg8C/+CSNaGJg17qHWnFGbQzr
	 eCcOYofK4xeI18seqetfOYc0D0av6Jon3HrUtW6/qNQxvB4SaBW/g9xnNqnBaOCp/wU83
	 aUdUpcI6QLs0kH8BcM6hgtKTW73VDgBUJP8osFprWw88skfBjCoN5x+pZyrVR4rUDUX2k
	 NW/VBWwbHTNG8DSqKhwizVjbNTMs2ciEmD3QM7mFzAO0p7u75PHoDwSLo3jK9KbPJnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791743054;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SswVZsjam7GePEQQfWO32dp3zJaim72OHSObnciOuwo=;
	b=KWoJdKI5eFaM2wVcjuzr7vfPC5iS6ImPYQLsG2P9dQz/qrN/yFv2R6J43XrzX8BhD3Ta
	 tTF4E+NWnLMOiOGhfddA2OfSw27Lms3f2KisWdvMm3FEnc6tTPIAoOcXglry2XFC1VXcN
	 BG8MbTo6ouKtBIgs005q/Il3Qfo1QQKhIqjiV/bNlav0rLnb4uIvUd0om8RvkJhRTEgkM
	 w7yVp5w/gZzA/RhtdStvXDUJsF1lHl8S4I7gDrWlnpgcq4rkYebbdSuoofwsCyetMwTU8
	 PHHXwWvQ94mY5E8mpr71VM2o0NOpJZwSS7YD4xdtZlMIey8nyAcvAdSF0vqIpoHeIHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791743054;
	bh=SswVZsjam7GePEQQfWO32dp3zJaim72OHSObnciOuwo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BqkmIRh04KYqTq/IsxNaq8U6uUlm1NRTRwg1nZ9CavpmVjrMpgZIWNZDJBmKob/dR
	 pxWJad56J2Ss2ISQgvOdDb/3BGn4aNO/OaE0B0+awpbl2b1oQbsM3dbIovsWUFVSpw
	 rR24e0fZ3RIknmg9xtsNmZTEgmwkgZYeRSE+C0S1y5QE4YMsq80o4R1C2XBel52bTz
	 IMbWCrY8vmF7eKdJ8lat9VHW9znDgagWuA/UWoJys+intx0l1m8sJb+VhnKlswMfwJ
	 KcEvFaEpNegunVnkvkMd+gaqnCw4ouu5UqtewfKuCFDAx842Kvjd5/kX0BQHbBetQX
	 tIMLR3QivSL6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4ECF6060C;
	Sun, 11 Oct 2026 18:24:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0E4ED5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C762D40075
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7eBqmxPvV_R for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 18:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E42414002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791743050;
 b=hChq3TLajQUPI0LItTgI4nIHHwdI/qTAIw/JMIeFbauJuceE2UN2bMBhZSMX9duY88FR
 /1zx7Xr4djtC9mCGwym+aT6vVkgZq0mRuZ3JAnhcG1UPNmxw/8mzSQ7jDWHMLHg4F+Ttb
 eDLwtq/4MhFQM0T64BzIEmcxJgjzl2EFoq9aY+aulUpCxmRRVaPcW7iJpGjyFQ6wGzX1n
 yHEc8CvD0ZAyduM9XlviDoExhyPRMhOh+1Ky4m5KYhDhjxejGUm5I7VQMTuidmgRRY96y
 p+wSgE4xPmAXZHCIw9hkBNvnYy+EKB6vUHrf0gNbSxEMVHZBMhwxDvoaePvPV870dMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791743050;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=58QOvT2qKy8eGcFAQxa1wXerdg0y4cEURMtI4k/IMX8=;
 b=m/gyg75hjVH+Dxzz6xCsjMX7V/OUacNblxtxx1xjPYKNH3HDS1gZs4i6GggTssjP9TS6
 baow7PMFDW2/zuMuSSJaOrpFEVpl/pg7bCt4HIqenP1azkWwDcuo/fUS4+ajYdwO7wsGd
 8azxrb85k3fbz/wWt/gp9nXt542q3ipr1E+HtpEFP2S7Szgms/ZI9pWvqauAQnMK33TuT
 /Ls1pcT5TlJRVLQLL3kxQwG/Uvz/gkW9BGcNWh7+iH4NwUUHZp+5DoQvFRtgpf7aWYyEj
 ZZeeQr0vuoKj+Vjd1oHUjhlg8NBIJE2/wU7kcPirevQy+T5qC45T3KnfhTDV87yOcEQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E42414002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 18:24:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 287C6951CE; Sun, 11 Oct 2026 18:22:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 20:23:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d7636eb72822d244ddd994af61461910d1155b4
X-Git-Newrev: 4738cdae83bccd1f98ddc57589cedd3221c5a1a5
X-Patchwork-Hint: ignore
Message-Id: <20261011182252.287C6951CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/wrapper: move -ztext from
 LDFLAGS to toolchain wrapper
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
Content-Type: multipart/mixed; boundary="===============5036564391000653024=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5036564391000653024==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4738cdae83bccd1f98ddc57589cedd3221c5a1a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Passing linker flags via LDFLAGS is notoriously fragile: packages either
use LDFLAGS with the gcc frontend, or directly with ld. This means that
care must be taken to only pass flags that are recognised by both gcc
and ld, which usually proves a bit challenging, as bd035872be99
(package/Makefile.in: Use "-z text" instead of "-Wl, -z, text")
demonstrates (later amended by 3a39e706a91a).

It turns out that we already have a better, robust way of passing
LDFLAGS via the gcc frontend: the toolchain wrapper, which we already use
to pass relro for example.

We can revert back to using -Wl,-z,text, as we're sure this is going to
be a call to the gcc frontend (the wrapper is not used for ld), which
makes it consistent with the other similar args for -z relro and -z now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: J. Neuschäfer <j.neuschaefer@gmx.net>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Makefile.in            | 19 -------------------
 toolchain/toolchain-wrapper.c  |  3 +++
 toolchain/toolchain-wrapper.mk |  9 +++++++++
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 229206d393..a55fdf8a7c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,25 +163,6 @@ endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
-# musl's dynamic loader doesn't support DT_TEXTREL, which results in a runtime
-# crash if it gets used. The "-z text" linker option issues a build-time error
-# when DT_TEXREL is used, so we capture the problem earlier.
-#
-# See also: https://www.openwall.com/lists/musl/2020/09/25/4
-#
-# NOTE: We're using "-ztext" instead of "-Wl,-z,text" here, because some
-# packages pass TARGET_LDFLAGS directly to ld rather than gcc, and ld doesn't
-# support -Wl,[...]. -z is supported by both gcc and clang, so it probably
-# won't cause us problems.
-#
-# We're using "-ztext" instead of "-z text" here, because some buildsystems
-# (like scons, for gpsd) will reorder and/or drop LDFLAGS, causing a lone
-# "-z" to be passed and the "text" keyword to be dropped otherwise. Both
-# gcc and ld supports that, so it probably won't cause us problems.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
-TARGET_LDFLAGS += -ztext
-endif
-
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.
 # Therefore, we need to pass _FORTIFY_SOURCE and the optimization level
 # through the same mechanism, i.e currently through CFLAGS. Passing
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 5b306190bb..72a540ca56 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -477,6 +477,9 @@ int main(int argc, char **argv)
 			break;
 	}
 	if (i == argc && found_nonoption) {
+#ifdef BR2_ZTEXT
+		*cur++ = "-Wl,-z,text";
+#endif
 		/* https://wiki.gentoo.org/wiki/Hardened/Toolchain#Mark_Read-Only_Appropriate_Sections */
 #ifdef BR2_RELRO_PARTIAL
 		*cur++ = "-Wl,-z,relro";
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index cbf46f15fa..d605e41f2c 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -83,6 +83,15 @@ else ifeq ($(BR2_RELRO_FULL),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
 endif
 
+# musl's dynamic loader doesn't support DT_TEXTREL, which results in a runtime
+# crash if it gets used. The "-z text" linker option issues a build-time error
+# when DT_TEXREL is used, so we capture the problem earlier.
+#
+# See also: https://www.openwall.com/lists/musl/2020/09/25/4
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
+TOOLCHAIN_WRAPPER_ARGS += -DBR2_ZTEXT
+endif
+
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \

--===============5036564391000653024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5036564391000653024==--
