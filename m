Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4EEC79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 20:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06D060643;
	Sun,  6 Sep 2026 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bSSgnlIDJ12; Sun,  6 Sep 2026 20:14:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 824A060608
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788725640;
	b=MwVxLlhKuw3sTbczoisXFDFWvVw6d18V3SFZZvb9Ryz6WQhiprZzdZUeQ5tOfD/9hKiL
	 84RIfGM8w9q1HxH7xI3nLru6a54LUBaMzeqZVnJmES+QCtniuTSfr8qMW/YJ5YoeINsAv
	 5aL5d8mc9qHM0r1MVMJqYyavgYSn/i06saXvtOnCEeAmFuMqWdmDFPuDgODQWZxmOgW8v
	 qvqO5Lv/08RLtGqrAFvZ4SxnT/q/NF5Chhsj6lCu0yMZTTScnfAQAUKaItATXOSXE1QVZ
	 +VTkePe72M26qsJ3ZhEyLMvVc6G7IIkAwBTaawBUEol2IVPUCRTocjidYyzg/W7eYoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788725640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JQxSHcCbvS3c+fmXr7CbcHYxdBAueAJR6C6N37F57No=;
	b=FO11JGERy676nb9vM5V9nb2YvpKm5F+KG3kgVMNuG+OmQ5HiaH0GmABq2dI8rL6U4gdg
	 7/hZMUMsvHl+daz3K5vWH8OPc8rbR7AwSqdEHnRJH0jvk/URgCzk3H2aJcwFcjLTsvKdx
	 5IWO41XETM4KKQd8THQEVpWZ3tfGFulBs/n2fmRfqSzBw6ybpjmznZk+SFlWARL/56bGz
	 9NdIVfhRrDyFo8PrPH8xWH/drk+QQMGcVLHxNhDSUoRidgG4dzgIVtC3MRQx7sMDL5r3Q
	 wtOPSy1t14DNEVYCWhO2ic3LSTq6V3WVn3A1CUEx82qXa8QtE3fuZkgjquCW82cJvDQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788725640;
	bh=JQxSHcCbvS3c+fmXr7CbcHYxdBAueAJR6C6N37F57No=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HxiKGoZkRYeXiRLLEyr0taWDo/Iec70/QSmMABlIe5sRhRZMGWXje4N6Mer2kQR42
	 bwm11lbWWfMRc5P2q/G1MT+VUqx4t0VIetR0hQU7X1RApFqertamEgHgCf9HMMzroV
	 iiSbOoVAq5BYsUsgpK7Sg2fyVuuc5P6IiKD8XA5O2JBJJyM1SXdoeL+RgCWEH8X8oT
	 FMiIBCFEqXFi3jNojAr3HIZYrb9hA6BPQU8/ZC81NVUIRxqnIqfI6NcuJDE3C9Pw6E
	 2SupGuhHNaSuq+3CPQn/v39p07+Kqc4ByzmaVryeMo46CaDRJd2H8v4+V9QI9oBzSu
	 vQaaFO5KSTV3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824A060608;
	Sun,  6 Sep 2026 20:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38BE4388
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F221400AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGfq3K7k0KfU for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 20:13:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 06A7740079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788725638;
 b=BfcuASqmpc0ZOpbTkCm9mwUM818xkYBF8M5DoDb1/x6Tin8xx/uY9OrQfknjpRb7cGV7
 5j2n13hhwSBgNOP73lmY2ctlsNXiLwcGYHKHPQcsYUijllph7DnR4qhmOLMGfs1cacGP8
 HY45wI2SWHI5KmOZrsYv1/Es4BgB4cHMwajkVB4/WHSkarF9eyu808r5zACqHWHBD9hcN
 4hnV27NFB4oyrE0xD0MS+ARtktpPo1IdK5YDJBl3RGGrgr3Pu/bVn1YaueZ9E373OF++D
 offa6tONlUlp/vx6L+Cl97jahIKvytrH7Fn7BsbGC4b4AsPn6lFtmdaNlN8OezmrovQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788725638;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AP0Zr15/r2zEhUiQ0ksr2Q3cQrlAyAOb2gzBIjsyDHE=;
 b=Z4WoRCbmG8c1s3/qVMWzD243xEssacABvTYoLYI48probylFAAj/iElP1yBr2MiTwigM
 mh1nIoy+nnAPe1LfE1qnTVpsT04a7P9Fc0umY30zKiIxX1qBK6qhvOoqCbunyylTaaRfz
 fLZWAbyQ07fpg2DUjkWffELjL3JyFoQVtBksnp3TbgSS6qEjpx5ihUsGr5UFHgQJr3LST
 Y1Au+D9xFGNkh8FC2d3hDUx0TV/NbROuYU5Z0abbggcVQCsjnao77PZQ+FrmQnHvEswO/
 9EMNEzu92Oo0MbofjYZG1rwnZjLz1eT0DVifMYg2UdG6IzUK0DAZGuYfBKAt4MmifwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A7740079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 664E295471; Sun,  6 Sep 2026 20:12:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 21:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a2e1177f9349af33a32b00a90501cb76a17d394
X-Git-Newrev: a0c5a20073a8899a29f6e27ab191a36c56196ebb
X-Patchwork-Hint: ignore
Message-Id: <20260906201256.664E295471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: bump version to 7.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0c5a20073a8899a29f6e27ab191a36c56196ebb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/squid-cache/squid/blob/SQUID_7_7/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/squid/squid.hash | 4 ++--
 package/squid/squid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index fe362e9a2e..556115f80f 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,4 +1,4 @@
-# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_6
-sha256  852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992  squid-7.6.tar.xz
+# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_7
+sha256  e3bd613b91b1c498ec2992276063342a85cd6edddd5521294e04f44bc055da9b  squid-7.7.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 627fef0b9e..dbade52fa3 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 7.6
+SQUID_VERSION = 7.7
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
