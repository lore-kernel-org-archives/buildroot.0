Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675D9C77B6C
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 18:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BCC4027E;
	Sat,  8 Apr 2023 18:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BCC4027E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8O2W_1Wrlkiz; Sat,  8 Apr 2023 18:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933EA4033D;
	Sat,  8 Apr 2023 18:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933EA4033D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAD6C1BF325
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 18:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1D8B4017B
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 18:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1D8B4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QatsjFzagyiy for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 18:53:09 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C79400D7
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1C79400D7
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 18:53:08 +0000 (UTC)
Received: from localhost.localdomain ([146.241.106.178])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lDZYpw04Qf6VMlDZYpSbUy; Sat, 08 Apr 2023 20:46:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  8 Apr 2023 20:45:59 +0200
Message-Id: <20230408184559.84189-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCxLPxfI0oVdCq3jBj8nxawlIPYL/8FzJ3g1sVNybVoeRsArWsIlPR1jt2sBJydFC0W1/nk91J19ihSO9+MAFVZ/Q6edvFpgTuaXGfb5vtqtMqPEiw+x
 2qfLM9m4Nwuyp1llL89QaxpTturMwNKSTNODMboIZtvPHxNSx+EoG7u0r78iMMEZ5xofTykNVTJm+6xeyY+zAp+4OmUJXgBZhZ5nMrBnJB5dJufaWT/zLuLI
 5J6qRMPHMO3DhjCR5r9uMmzubOyaWbUeoklnaNsx78SU/I8b0wp4LQjpu89uHZE5HxDTZr8cukt8M5S2jHH5AwIlzcK7usjtqVZv+qy8HrQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1680979560; bh=yOSzsF901sYGpx6gTMn3vmQdLkVEBcuNIv5qopx7HQc=;
 h=From:To:Subject:Date:MIME-Version;
 b=W+x7MNG7viAd7AYhWPRqNg8B/a1n/Z6CNq58N/zhilIKvW0pECisbefWw0QQEGL+u
 SJp0g6N2+OEBy1dcC2sdYiL2b4n/NjB3Y5wRAh98P37TAIFQCO5t+SHPx2cDO5UZFm
 lWg4RGvYAmNL6n6Ara5XGBUMtCkJYq2pc/KhXv0+5EZDda9yu57x2ZiSqvvAa/ScUM
 4MQobzmymkVw3cQtc4CE9//nl4nKBlA5R1XWYAYa9oKWqn+dXmf2KOAVaWNuV/zxDS
 5+IU1NhrnxnyL004hnAEIlj2E8Pj0cRTIZpGeZr6M1OMq1sBgj//jDi4G6/KuoZO7T
 bBUiqwriits9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=W+x7MNG7
Subject: [Buildroot] [PATCH] package/matio: fix build failure due to gcc bug
 99410
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The matio package exhibits gcc bug 99410 when built for the Nios2
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_99410=y.

Fixes:
http://autobuild.buildroot.net/results/971/9714160b80a0d1a01983d29af38a95049c07b4d3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/matio/matio.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 5e09f4e6ce..2ba9c8f568 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -15,6 +15,14 @@ MATIO_INSTALL_STAGING = YES
 # va_copy()
 MATIO_CONF_ENV = ac_cv_va_copy=yes
 
+MATIO_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
+MATIO_CFLAGS += -O0
+endif
+
+MATIO_CONF_ENV += CFLAGS="$(MATIO_CFLAGS)"
+
 # mat73 require hdf5 (not available), extented-sparse take 2KB
 MATIO_CONF_OPTS = --disable-mat73 --enable-extended-sparse
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
