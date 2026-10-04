Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD049CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 931A380EAE;
	Sun,  4 Oct 2026 08:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqeGu5jm7xRB; Sun,  4 Oct 2026 08:11:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B236380E75
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791101517;
	b=SMS/iARAw1T3DYVlEdOHfTrkABX2u7/KgET51oNc4fAjtQvSO/TzVfD6lBWBa5z7pfeU
	 oxA0/HNWsBpzSfB6MODxJX7fjPaE4j/NcAVpHJj0jTvSPCmHOyzviix/oHLU9ng8tYbRR
	 ka54NV6ykpO6qG3PkjF3c8CTOYDSGoE1Pi61dM+3cjRX41pJBOW6H6eIyf8V5kBEFAN9G
	 CBrO9sKhwjZcyzcfAx42MUsqUKxxVWAUgpKZ2CvWnt7A/5BkUFinSZbqTjRNVrb0f0xWO
	 PlHcq2LvOU6At65zOyqBbac4jPAMrEjdvL9kh3eV1sWgLlU6i6eNR8TmasJFFHLLdTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791101517;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nuBe+WJHxUR4f/Fiy2YhyhrV68Qmoa7HsN546AZVUas=;
	b=Ok5ZKgJ/lkqaNI6TdNyJlH2ChstSMuBldT9TRej/aFSun1U8JQWKYYtugtziPTjMDVlB
	 gBf6OzLgrntOm50/4xO6tc4aZich+0m4/3FEMvvRUUZe/ks+HqlH95+rHxQ0mbdIkEBhC
	 w3ifgaAis0/6O1IN7a4kRjwDES501m0RNuUHhXRsBT07YUW2NowMzcGS7yT+/QC0cZAg4
	 Pb064GMjDW0jAKhO0vJRbZVxeSGsMPR8vvyEMa1kKzrDZoYOOTNZN70XvihC62e/qrEih
	 gmcuEo57uut6aewNNkQzWaTsPr+++ZzEqaIVO7BhrkP/iwzp69CChKCMKOD6WzyXQ2g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nzeex6Yr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791101517;
	bh=nuBe+WJHxUR4f/Fiy2YhyhrV68Qmoa7HsN546AZVUas=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z92yBwsoPurX3L6VdzBQlz0XLU6N4fmqApYXYpPDxp1eTE7d1KN8u8QDmAM8PbuR8
	 gi+gLqeUj1+S3S4WXoO6ZonQZ+WAC+BIJ4Hh6pbJ1GUBASHkq5Es2FQENCV4OUbz0H
	 n4mXGok1S9aMjsMkfnPUZKPwvwdsAIdoFSnmmT3rvV+sBOAPO1GF3dIT/3wUhnoEKD
	 uk8ZgvPZ5JWcic1Fcfm/ZI3tYqZHPTFNwuBDw3Tf+cr7npVaErGxmR6AIfmOvzE5ae
	 zZc0o5BuIj/vnMA/RtnlOGxPMTFipknEVDokvsDfUtrF3oePzjnfJAGJkJFk9awOyX
	 DjcYSxoYwnGTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B236380E75;
	Sun,  4 Oct 2026 08:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBE32E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C611B80E75
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y36ykMcoIH_n for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:11:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DF18880E2E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791101516;
 b=OI9VGURB1DO4cPkwNT+ZhX+Lueh2o/ifYoS344hdPYH88CvVxfy/9ngCvYzpntUc1Na8
 q3QTnmI8EVDJ5q7cK3HtXog7dBuIMNKEsPuEnHQMMcPYcKBKmqkUaciz2GhOvwctxTqmA
 ourfbEupVg5LzPf1jb+p5GBq7I7nESa4I+LMGq4hDhC1gDrcumELovGrXBpzT54d5W5RU
 Ze6Sedv6hvh6eZvi41RlQyhoFcFfSskS9cn5mOZr7m5M/e290dok52cpSkKogUFMwdp7j
 xQXwIZfiHepFrnBT3cxVKLWrH7F77BNWFZEZro8NvfdIJ150KiLgKkedihbdO6bxRTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791101516;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4ZY7cBp4Rc9+EHgDRGdYlNsT+jrhaeSAacgxQ2xNe7I=;
 b=dCNytxCMTZQxZ7FgqO7oOJ+4ZqV2a1vhQ7MyyJ1C7YpSeQpe16m/+LpJBDgWY1zC/mTo
 eHD4gzPI1b3uCZtYTqr+GOGjlAVhC+SPku5k760MuhGeV06ZLo2wer5d2UzoexVShubpY
 h7XQQO7LRgCbPS66F+bjxHThgjbHYSK8KUfaRtG+uwSVJcVjEnigjkcjwc+7U+Arr3xJU
 MmQaogchUGPLMu11oyafs0BGRYC5Ss/24iaO/iVuW/X8sJ32uVe1Nv+M2xOgs4xl/2xND
 YCkj8fCPJUG6VEbHsGFuaQbtk65Wm888JRICipBv21NdSg+J34r0u1OQrgR8hASNDbA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nzeex6Yr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nzeex6Yr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF18880E2E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791101512;
 bh=4ZY7cBp4Rc9+EHgDRGdYlNsT+jrhaeSAacgxQ2xNe7I=;
 h=From:To:Subject:Date:From;
 b=nzeex6YrGJVDwBXC8wom/Ep+dRAAqtEMoZ9HqEWhiCSKS0A7zcz8Q5+EEeDKzZVtU
 DUra9ZjSqfX8sQdbsKZ/iKWVaT1XNm5mkaiyVwvJsgXCKzoDaMDpyTZPg1O88m4zSL
 K32Fy+nC1f3ufEvauFtvDHSxLanXaohvxV2GddXWUY2qp1iqWIpIE8GQLnwUVr7m3n
 6vDYQ36yJpRrAyPsV9u5TVIVi7BUOTTj/MAxuPG7nw+/r/K9Abd3Uqf3PMAgzFBCMW
 C7NsnSy5hWyTuZkkr7+gTjo9sx/L11yPYVFpG2aTl4RuGu46zTcEDr02JIHsdFklYo
 AU8U9+vSiKJLA==
X-KAS-Sym: v3:f51bdf72230551df:myykiwQpj3FLPW64/Ntu2vKiNNLe7h4q+kSldFuaHzl1U
 Yv1u2/71b0paelbikvmI3ditghOJdUNrumRYjBGZDzqF27Dvbk6KYNirDSp8VtlEzRq+2uzGQC7
 87dHyl7YXitnz+w6gi3ZXDYQzyYnPwMCmENqlZUK+WXqFKEVwWzMils1bj7EvDKEJ/VGNjMfO0H
 TgJd81j6+D74lFKt+v5w2M0JkecqAt2H8TeUefP3/Z1koC2qV9c5lSZYezLw5uJiXRGJFcp3Pll
 71PwNc8PCAAqgL35a29yJyL0i3OE1wBDs4zl6fo+EF8Dw7qS6wN2X5e62cDYj3LLXld8Xhhw==:
 qz23oIIcg1OvcIsMKmGcCUsrrn/f5roO/UHCD2QDCWCV+VM8lmfAfY8mkbHD9wrGhgUYY5E7gIx
 Btt8F9o7rEfDWqDXeIk2rdNxyzpv1VZBrUUar5jw9UOxtdH+lxEBYEiXrxT/8nwqK8zqoFdaerY
 NL/ByHcdAV6AFsamJ39lCR9oYNsF7FRce4iUVMX8N0d2D9LXqX3ALsnb04oCGrixw1q0cKqJ9RU
 Uo/AXzQxQM3P+OTD5kbPv/GS0ZINOxmCALQymbL4xLBWqWnML9sKcT/38dX30eUoJm0smVXXdWm
 gmZjWAsTdqka/0o4HQi9Bz/3wZYBPOHOM2usRtDeEvNkBvIYoFqcdC57XHF0litQt9jdVYYimQB
 F2c5BU0QGh+la1sX68EjqLitzUCkPYCVgOOnV/sTI7sNi4qusIpjPCgCIPxYGKXAy25aGby8wfP
 4WzRGdhatP9n1Lkub6EiSv6thPuY9sRmj0tGU4EKqtLnrhRb1S1YkN0KnSTCZkNT5WYY3jYu71J
 81WqjRbaz9JhELao8GtbzYZqQT/OPgDzHcWL7mQSrsA3eNBLST7FSrvzclpQFH2f3EenOyvADnh
 Zm0p2xmjKBkS7IYToESyOim9lZrjyDSu4t3bxyBGemVBTrA=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76749A4C49B9
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 10:11:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36842)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHK4-000000004XB-1ncG
 for buildroot@buildroot.org; Sun, 04 Oct 2026 08:11:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 10:11:51 +0200
Message-ID: <20261004081151.3091813-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/iperf3: security bump version to
 3.22
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

https://github.com/esnet/iperf/blob/3.22/RELNOTES.md

Fixes CVE-2026-101283, CVE-2026-101276, CVE-2026-102253, CVE-2026-71217.

"The iperf-3.18 release notes were updated to reflect that a code change
 in that version addresses CVE-2026-71218."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/39ff4c67ae5fa8383098d8db23dc57d5cb615fa3

 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index cce50581e6..92246b6915 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
-sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.22.tar.gz.sha256
+sha256  1c0d0fb02c52626111d6e132db80edfbf27bbaff8bd9245df2a371dcb0b35a92  iperf-3.22.tar.gz
 # Locally computed
 sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bff9a40865..2e9305692d 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.21
+IPERF3_VERSION = 3.22
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
