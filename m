Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE38C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B3E61175
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49B3E61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226E0607C4;
	Tue,  9 Nov 2021 10:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxelcVQPAh3c; Tue,  9 Nov 2021 10:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C0F607BA;
	Tue,  9 Nov 2021 10:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC1BF1BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77F64033A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AR4HXE_zRxlk for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:19:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC8AB40320
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:19:16 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODimOaBD; Tue, 09 Nov 2021 11:19:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453156; bh=75DUUfUIqqConlf+INrsH+DdA/6+RPoT1awsY5ZXakw=;
 h=From:To:Subject:Date:MIME-Version;
 b=KUwxA7vAsFsdOkDrTdx+zagEypzi1gKwSjrTzPdJmG71tKepBeNnjOARHiiKOT4JK
 cuHFasp5AQxqTPv2iPT15gouMo2G3LfWnkWr+V15ZcK+pncK6LBfRlC5iZUXkXUTfe
 4eLEjAZ0x9RpCnLhckYQ3rnPF4nRn906Gceouvrf5AwvvIdbzAwpN6zMdmRqlFeTKq
 pyyJNANY96RH6CDgcn6Jp9h2HNgKu9lFmtyYJZJzvq/wUEBQZ2CbUHVbBLx+hde5Lw
 P2taLBQQ1IZmtjMexM2q6clpGXnhoL7j5eVj8ny41dz//4LBXC5bQZySwIZkpcw3ed
 NX0IOgicABneA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:43 +0100
Message-Id: <20211109101844.1132067-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDz92Ap8x23wjkgIB8FfBsc2TIiij7+ooYCTPaAI358u/ZXieB2H/90XsO9tCQEyapWEIowtG4xrVjTECe9ZunJp1WO2StjetezmAixyHZxZUodqyWiJ
 Ld+fHLdIZCMC9fJZcPUaJcYAwxEag5ZE+v6JGbjJCz/hlJlLQvPc2gZCvvXwjiKqw+vLIB1dfcs9S6XDBWDk2ArgXpu3AVHjZPPdNlgmJ2KXMROTBFNw0ifD
 OOjOyUKqpsSGugt3SvF9O6t6XFO1/JLy01Y1tbKU8Mdo6YKiiujTU1ozgJ23iFydvRqVoK6F4FoJWbBuih5Niav2Wa+KrcRH4yHYKkIJu07Sk4PaeQ02QU34
 o5sDdh42RqjWG3efxdMVEd38Op/M0tgpX+z9janbGm/Dep4MFg1DyduMd15xtePU24LH2uOQJeKzGepiU/TdKU4gpzNDRMgF2ui5alOtVsfQyvDwLe1T2ZRu
 iIve0mOx3766nWPWEtdF+p08OIp51IqFCJnPydXkRrMdf7aUw5xZl91R7rFkUP696g+DENQv5jfau8HvCs2AMof6RaJWSqsfPqgbKEEd+7olt8p3gdsezU+2
 BJY=
Subject: [Buildroot] [PATCH v2 8/9] docs/manual: add allowed notations
 section for genimage.cfg files
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
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add allowed notations section for genimage.cfg files by specifying the
accepted suffix or prefix. Note that "K" has been decided to specify
KiloBytes as 1024 bytes. This has been done because in Buildroot the 90%
of the cases were using "K" and not "k".

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/writing-rules.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 28cb0fe4f1..138c39db14 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -192,6 +192,11 @@ image sdimage.img {
 * Filename must at least begin with genimage prefix and have the .cfg
   extension to be easy to recognize.
 
+* Allowed notations for +offset+ and +size+ options are: +G+, +M+, +K+(not k).
+  If it's not possible to express a precise byte count with notations above
+  then use hexadecimal +0x+ prefix or, as last chance, the byte count.
+  In comments instead use +GB+, +MB+, +KB+(not kb) in place of +G+, +M+, +K+.
+
 The +genimage.cfg+ files are the input for the genimage tool used in
 Buildroot to generate the final image file(i.e. sdcard.img). For further
 details about the _genimage_ language, refer to
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
