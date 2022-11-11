Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5737FC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC7C740204;
	Fri, 11 Nov 2022 20:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7C740204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SlTLwURe9yg; Fri, 11 Nov 2022 20:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 205224017C;
	Fri, 11 Nov 2022 20:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 205224017C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B62861BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91F6B607A1
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F6B607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fH-b73emkQhU for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:53:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32FE605AD
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F32FE605AD
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:53:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1A26100004;
 Fri, 11 Nov 2022 20:53:22 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:53:21 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221111215321.7cfdbc46@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668200003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iux88aiKI3mHsC/O1jVTcWGqquyYO46c5LdT+jH+H2g=;
 b=dHJDm9r8QZAAnHoJ40x1iW+W1RErabhKIy/fKhSl/loYWGDzsIRWcysR7986KwhB+IJ9AO
 rf3mLG/NzogV1eAjJLfSQ5izC/JkbKBTmVKopJthEAPUX5n73G4vqiozTkFh4bkcalKHKH
 L0+LFisLblYxZfFLN0Vfr9toXdmzet+DGDPVKCvQPDA80wZhRLGPjIrWzeDM6vrcph1aLQ
 GiqwjlQPW8flUv0LT2tiXuVPQXevfu1SDl/qJ1vJnQmCPyfermlxOtMhxC0jp7GI0uKU5q
 zcJHeUvr0ayDfJw7sUx78HXCMiJGiF4wgjIFH+pabAA49INOjASCzzNhWCbJpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dHJDm9r8
Subject: [Buildroot] Remaining issue with Dracut runtime tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

Even after your recent Dracut runtime tests fixes there is still one issue:

======================================================================
FAIL: test_run (tests.fs.test_cpio.TestCpioDracutUclibcMergedUsr)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/fs/test_cpio.py", line 105, in test_run
    self.check_dracut()
  File "/builds/buildroot.org/buildroot/support/testing/tests/fs/test_cpio.py", line 60, in check_dracut
    self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
AssertionError: -1 == -1
----------------------------------------------------------------------

See:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
