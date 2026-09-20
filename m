Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97045C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6246C40E58;
	Sun, 20 Sep 2026 14:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0CSvGgC25f4; Sun, 20 Sep 2026 14:45:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 82B5440DCF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915540;
	b=FkRA8mpb1Li6mD75i87JZ5s27CZYhXvvRWsvX9YczaNl3swQr4wgiteWBr0QLNGgXhe7
	 4pwYRXbLdMyvwBT856+2Evedv3Q4HqRxb31YtAO4s8iZaL1d08CwQuyoEevQXlX6Qm84U
	 VLrekoptHzgGEkjcR/KCkeGGIlQcCZUCCRmg7QXqeh1KP2Qjdvg1HonCLW3j2wwk4M6VE
	 9QR6nn1ncymc1keIVpFpGUdP/hv2piJEvhZ7KLOmTqSCl/4V8SJcot1eLLs1e8wfdmNOU
	 QXVDy/+mkLU81jgyyKeDhXAGdo9s/p5oZajt7bzd+rG2bYLS+ZO5FocNX21n6u5+R4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	b=ErTeX8D8lDFfcFJKy+iP/uiXpohsY6/hu1Ts998xE0slFt2NjMRNRuReblEGD2SVqyKT
	 jczu/gE78RkWsLcEuLvDnxRf6Kj4Rv1NrtkVryB9nl9Vezgp37fkMvTn4aHgyfzke7F6g
	 Zfrk08PRhR95yjMAwkbsTdal20aPAdnLV+XtiUzgNqpx4e27EDFKAPEbikPCGwky5RWw9
	 qJPf0tf29mzgF0lqLFvZq1Nggcdy5qVwUDrwzfwHT+0NmreiA+kVJr3PaLvb60WKeS0Jh
	 jYZgIrAOmZemGXoTlkqxHKxEDV1T0u9aThz00E94wJpx6sI6Lu0H0xdcaapWnBNWa1A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VD0WE2KV;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915540;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WI6/0q7P2ABHJkVxdabtai4hnGR8vXnDXM4ZtoApqk2hIsPHV+ss9cJ9cI7/q/jkE
	 34NUDXqcOiwe+TLBOvnG59WTKkNcXHUMPmMORX9OXrYyg4Dj2IqCDztWkGCCeqePGs
	 2j5O6UFN2z/Hddn8I3yxT2awIEg0/7vRGhc1Dc5VTGgcKGlUuvmBj2NpfRGzxRjW4g
	 UGtldyRQA4c1VkhL2TXoYGA504oy+P1uh+FhcbY/tGVqDt6fph0xL5t1qo4uR7fT7S
	 agu1OGd5uWhfpS5aSx2DUHmMpgqC5v+btTy9cD4ioD2WbQE3QqdfM+wAllD1IGpA+V
	 WVtHHR+JHIJog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B5440DCF;
	Sun, 20 Sep 2026 14:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 264DA24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1834240E50
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHR7laT1j0pf for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:45:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 34F1940D11
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915538;
 b=OntNMe5v+Hx/hkpf/F0nYsGFv0fpkX7LBdrNl2FTTYM9VYx0iwwuZhAdlKp6gtHqmRTT
 o+yJ5tD2SaIU/7MMvXyNabfd6QOZxUFTj+1ZQr6pgGFhaUmtxDAzCEUCeFnRWXbjsLxMk
 GtVfDuW0QwtDk8WfCyDkCCL+JvT/Tq+7ME8IEdQspn3geVVJcR5kAkRG3ZXzbObYDy6cz
 Bud+4nmvzg0ihIylxELjPEGdu6idVoC7Yc0iIpbmja5j7k7qrJgMDtd9XqIOo+qd7dEiW
 jq9OVusnQLzn1fW5XPUU0vsTel/jejHMlQiY0L5G6uy+qdwUfi5e+ZxtfacH6kWNc2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915538;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 b=Ajxj+AWYPXUpgVRyyOZyRily5eOLHtxpVM89JOHHq/GLrSRJnBnfGoMj58iSZkeMpKn2
 Fpd6hFUYOk+wYwYvHevxADtQ1WQ7GBo0ARGW24dmfN+hRwh8Q6q7i60FEfi7dvTQW6DAA
 Zg/CiQ/Ovx80PUsOwALeVYWemYmoKfokU+oGUj9BI4sRfaou37Rx2X+flBXDkUK8eqQZN
 zoReqAv1o4GC8yU2BV0A2HM9q7OVFRor36uDzl5E6APr2hRUeFltbaMTpKIjBcoQZoP7W
 wNpSRKKWAnDTYSQSwAn2sn2i73fwOR9QwBKvwCV2OYsUunVe9yWR5zkttl9NOZKY5Eg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VD0WE2KV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VD0WE2KV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34F1940D11
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915483;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=VD0WE2KV51WONOushVlMxyrLR3/nB0x0eGpVS/RsFTnOs8GBe/63m8co+48mCImkz
 F/TCVN0Iu9grEuca1DU74ycGDn+WKKUhEG1wJgrbBUzqkwKd4A4SHCyu5NniUKHFEA
 ww8d8/k4ZOwSokrNLl6lzEgS+0SPkci/oka3d3Sre58WR+SEGSqD5x6xyNxDoEkGMq
 y8d8IBWN8KPXYwwNE47hoHd5RHGDk0t3QOocdS3RXDp7qFI7tugWczvOrtHEpEGosN
 JBxv69o5AQzQOWLeHggl0+kwgjqz+R/tTNHb0oZ9uybv2j3/LQ7gFOWVAwHVC1V29I
 M77K31jBUJ02Q==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:d2lx4pmJM/3JXZZQUb1biJUXyoXPboP4jtcGTKV6SjzKpTdC7WnS0jmelhHn1rgh2yVk4yH3GA6Rinws0uHxSBTfJm6lkrdIFvmcIQEOdhjnGajBjPhai/B8Jxgmwz5yrNcyX2LZL+Cl3FSZTFhe2qlTjDZZipeaQ2wWcbsHLmRHyY9Q3C425pG2Lv8wJECyj4LfdbcXz5I62wEkT6OgtffjYOXo8oMX1Sf4SyStLlW19bS2eO4Yan6gH4Mp2bBGEbFVS1CCs92JeVkoeLMtGvD7Kn/siQ60ND9pGhdiUdRNzax8mMQjpC/fbLUtn+q3JNGTd8YRVnomd9I9voI7nl3pjCqMJSIKys8WGa/WUocrL7lGKqSLBjj6xk4pivtd98eEFJxQ7nm+HbVBAkvHq62vhkIEDhG7qU5KaoNE9paGP1Fijd0XhEMXjneccRhs5GB0uoQk+x7QeQBX+JhD0aqnH2/MyogJkLmoXi0XdGsL7E0Qp8STB7iBYUzsKSVqDx+n1uW7Hq1l1V413VgfUoU6cIB97s1nQIvdRF4keFQtgdVVHv4cR3s2l6BelCzDNa3m2c1jBDpwaedm4H17ufcmUmnhoYBGwVbEuqcr1r+5U3
 Fkj5161mxK+prx1Yc1GqJhcQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A37C9A4C47F8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8ImZ-000000000hB-1Vlm
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:28 +0200
Message-ID: <20260920144428.3009612-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 07/66] package/asterisk: bump version to
 22.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
