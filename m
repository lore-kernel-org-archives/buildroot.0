Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D8C98328
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 09:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA3E606F3;
	Sat, 26 Sep 2026 09:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H-hLC5J0aLo; Sat, 26 Sep 2026 09:37:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 129FF6067F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790415478;
	b=qapT12MF1yMImmNwHupwxP9/g4Clq+Iou6uBiTBmFm9FWd9g/5//Q8IwDjEs4PBq2IJd
	 fb57MDKSQCCNUh33zkoix5NKOMyJe3IMN14w50M0ljMbNMBQDC7wdPUPfZKiV3oC4LYW4
	 i9Z85ObwueVQ8VdyTJucI473zxQekm24KjQTlNFw0ceq8MkA0XrK3jHzj68TCHsHDg2Uq
	 FJ5yI2QziIR10TqhJ4oNMypRN/H+Yoyuq+K+LO+uzvLUGTUBpl7cxRRChWqBXuQXPUAWU
	 l9AdmFJnABrVcQMVL93DI/75qHC8zN6bJ+GUobArw8h8UbSuAHKp1EoKK6NDqKmBsUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790415478;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NT23L6n79Rn7VCDtYzGWeu3tDT4zr4uaGExj462TjpA=;
	b=pu0QH9tbAls2CY9cDZi50EG50q7v69b/ra5Vz820D35Xe55TMO1CRP6qvGUv+XgfqTOy
	 dhdPmXkAE/9HBA14we7BAWZcK/tqtOsxpWLu2Qu0C+WqkMhL9cJbF6Sv5JHUur6q37c7y
	 l0ihx09S1+XyWv9KK/KFY0ThR3r8KueVfbwvjoWkIM5er5z2OskD1TdLYRKSIIifK0QLy
	 UrPR1PLib/UeqZTY4G1fWZZKgcTgcBrE5L8LQhytAV0Sw+tdk6lH2jqt1MzVkGyKE1xuE
	 U0ZiII6cFA1fPR4YCKZDMMmRrEAvT9H9OaUlQtJnIgfrbS4rvMxNtv+IX0B5W64A6CA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790415478;
	bh=NT23L6n79Rn7VCDtYzGWeu3tDT4zr4uaGExj462TjpA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WKmcE6Eky3S9pc7gyfJ9vXGn0f5qkFhofT81ba+IBhg/+Gc/SFcss3T+w/ZCehdMf
	 YY88kTWNi5yIU4c6TeTnB0HiG05GZjJvCsI5DalgP30AdRZlIM9XtUgWS/1qNvJ1K4
	 s8NE2Ezn+cPqGrYk4+57k7GGD8JimyEbw7SDEXmcuipu0YaF0dzl0YTzFLuyudniP6
	 GJtZI8iQc6jUEjsEfJQc7EmibkfZQTxdFbDS6KkDCaZDYyP1Q2wMSJhHE5+rGEzgb3
	 URn3vLYRansVMEFjDdtzjtWogir44ypMlDxdsDRddTI0rgeeQx3H/uWXqga5/W/2hb
	 GccczEGsMcArQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 129FF6067F;
	Sat, 26 Sep 2026 09:37:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EC9F329
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C87440549
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glwm5VM6tvwo for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 09:37:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C1DEA40543
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790415475;
 b=dMrkH9amx5LBEJ8VLl4o8/fXHNjznzHlkQbnNlxhyNHAXMO0tYpDLmi9eqb4/R1UYSBM
 c8uiI/dfSCikO+Vg1pspIIzqKWea1mchO5fTCNIDL3FOSu2/GLF2BIW0q2FZ+qrl1Q8v5
 v5gWw2UucXRVkkGIgk0y6bxXv/27gZhoMd+flQ+utKylO6K9cZooFLXSWHt+FGZvqW8NZ
 LweQrLgwW4BsY9xi/vCc9B4pO7wv/+fkcUEyaTjYi8CSD4IrJOeSZlZPdcnFLQC3Re0lZ
 aV53toVcSrqsELYdJoV4tlVy508Z5I/gWDqSwEGzA/YcOTomI96YaOyw7TEHUCydArA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790415475;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=53ZAFqsxRVcn5Od/pwa372rfUi2geiDJEtDtSFAG5Gc=;
 b=iTDZkqemfqSEyZwpxgDYUi2ag5rwnQfdQsYJ7Kzljbl+7NxwdbPyhQdScjUVifyraTQR
 HF8tm07aP4vLjrJdH06QsXlD/gC6RhI3rs46Ef8oR5PNMT+XT3wrm8Wrx8s8NvIIivTJM
 as7x2YMG6O+GsFg+Y5pD0i9nKz9MOcZcNbJ8IdHIEfUJntdXStNtFNOX2BXQq+1SU0dki
 looVLkIBGmxd2b8vqkhWCcUbVN6Mozn3e6Po6HXLg2By9MYqtio+9zSZ9tsXC7yKXfXPJ
 MoJk8Xz0MgY3JnyBCD8dGMCOTlBfo/786EJJU1loqloqdTdX1V77qXuS9MiX8Mlua9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t87BCJOB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t87BCJOB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1DEA40543
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790415468;
 bh=53ZAFqsxRVcn5Od/pwa372rfUi2geiDJEtDtSFAG5Gc=;
 h=From:To:Subject:Date:From;
 b=t87BCJOB93b3LMNjRzDGW1S9khzNosqSQqMcULGDHGrpfnUsH9tyPpmVNVaZRGQPt
 1ttQjAr3mJkKYyLZsP38CTuK5uqbHhF7nE2mrmKSERn1Dx9GHJhpzFZ1YsZNYwe3d/
 f5Y8Mh10m5FS92devahYhYaGAs7QVI2eZ22Lso1OSADWh1aUAQn6u6JlYLZW6R9O8d
 bdnU4MJO4FAao4IFFn3yUcA86ntyjLS7aXYPWteWUpO2ry1BjB0RJzwUPByN1hWqkg
 oKiBtBXJ6WKui0JmVXXgZ7rtwnZOlMOtqz6+FVHBvkf0Se8Kx2Px7+/2hXy2IcoAht
 WjpOwhUUk0Y3g==
X-KAS-Sym: v3:f51bdf72230551df:LlAPysI8K1NTIfd+9mnKJLwsfpXoJDKfGxFmNMiVtLZau
 lreMxOIdSkZxzwAUSY5lCL91DpMwBl0KRIU43ZfXcZ3dsnbVAgXD4hRAcXuQwKRPdh7d9DfRYRM
 5aVn9Xf82bkkGSUN47jEZKeq2WUMt1iNUvh0Pr7aonX7d+ymnvgsgbhrNDM88JQ7j9j9lzkj+y4
 xu2Kv11zDadpVL1pcxIJodYKdeTDh3OxPhpSDAcV5Y0l0JEv/wn/4LKfw205ZQhGSm+jWxVFhIA
 R+ASiUta1JQvHqUE0Gq/Jc4dbJLDlVXIwa+kEeKfJgAYG6Rugge2qPUN15eyvRIYusySRuIQ==:
 IaYBCwg1NojhPzi11ILCTcsQdH6tiVKBPCLXOeu/Mj0x5Gh4/baMM/Rsudawnis/06ZSP6e+ue0
 QTfYU8j4SXnMQ9+9V6z4ZrSwC/z2JdXw3q7RF1HKMij8Yjlo7ZfKQEN7jkuvfuaQcV2hogbfGNo
 hMhn6HnYig+8qpiZLOT2m889rtCVLNgY7t4TmwTu1XzrDdmzbUz/Si0II6zE+crp++LE6TODvxo
 /qns5Yvxbd5iZ/pnMSK2kFBvKAhWnpTMv2YO0gfdl5HeOpeXBP9ECO5fcJ4AwJXLWriA7/RLiQA
 j20yMsBALQjP5/GqZY8ja/5ObymmtTwIOSWa/BU7ewWGXnBNmbxAV8TVgjnvh6CvvWkRlQo8kFX
 XJ39Ir2UQbkgIzvsYhxohwMoKbOI9xcyCodiXnm7d+0sqZlzCyrgzW5G+xdUB1q79hcM4Q+pvt6
 fgxuEDXb3YgIShn456PdcTZt1yzviXRfEFfprvv4KTuuZTrPkUBMEn+bSeUmQ1otgbw81b89SjN
 2XfLA45KoHhdnkR8ZWD6hFGRv8AAaUqJscgNBvQyqMsn0dpikLbh86xmwfnCGkHOrPxMIS1sBBE
 DnIEvLcMzVI5ZXUBEYnCVMOi12ISQBCRTp4oyNxfHCWP
Received: from fli4l.lan.fli4l (p5b3a0325.dip0.t-ipconnect.de [91.58.3.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C49FA4C4B99
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 11:37:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44746)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAOqq-000000003he-0XZ2
 for buildroot@buildroot.org; Sat, 26 Sep 2026 09:37:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 11:37:48 +0200
Message-ID: <20260926093748.73670-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.25.0
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

https://www.samba.org/samba/history/samba-4.25.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8ff6ce57eb0eda3888ae9ebe2a8571a9f457ef6a

with the same exceptions as seen with the bump to 4.24.7:
https://patchwork.buildroot.org/project/buildroot/patch/20260910203818.2550925-1-bernd@kuhls.net/

This bump does not introduce new build errors.

 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d62e325f82..10d881b093 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.7.tar.asc
-sha256  45b7747a47452eff2b2159a44cc63eb43690d339fd1069088e023a015fed06c7  samba-4.24.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.25.0.tar.asc
+sha256  2e2cb7296833b35b8f7a7fb76045e0c57adc0c2cd03264b37df5d58e40f28437  samba-4.25.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a9e1577e26..88d2c598c4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.7
+SAMBA4_VERSION = 4.25.0
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
