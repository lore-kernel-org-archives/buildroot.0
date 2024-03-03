Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD8C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7697D823F6;
	Sun,  3 Mar 2024 08:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Djx4grJbmcQj; Sun,  3 Mar 2024 08:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A87B83211
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A87B83211;
	Sun,  3 Mar 2024 08:33:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCBB31BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8469823F6
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrQTbAXgMQBl for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A62483131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A62483131
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A62483131
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:33:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4E5B6E0005;
 Sun,  3 Mar 2024 08:33:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:33:11 +0100
Message-ID: <20240303083314.156042-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709454796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ok5x+CuRZp7cnXnhc/u6YBtC5RK1N+VRj4rLNXHLsic=;
 b=U4jjhChavTPa/v7etuBoFHSpePl3Al98DYlamKLS1/lFOPU10tpZuWqt52tnNThLX+NfLz
 25i6PmpSnQB/CI959isMDIhmaCpMmOtYLJAW5cGAwfnCfUXb6iyyxPLgKGr5tgJ9zmiNy4
 cqY4AAPIC3OgfItFgApfo9GOGFFGHD1H7DqDIHaRqgoe/ktYaPq4AY0eJqKDxENvNRaDWZ
 1f0kFETf7TqJ4PTt1BxYHc+P6HotuFepMZOrwD9Ffl1UWqtr6C2+/evjsPdEXWyEPl1kdf
 1N4myMgcGk8Fu6C3GstOsujaZ4OnR55/jrFucvZwynBEzWaMeTGyfpRlMa3PPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U4jjhCha
Subject: [Buildroot] [PATCH next 0/2] Upgrade to glibc 2.39
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This small series of patches bump glibc to 2.39. The big visible
change is that the libcrypt library has been dropped. This required a
preparation patch for gcc, backporting some upstream changes, but it
is also likely to cause build failures with a number of other
packages. Therefore, I suggest to apply this fairly early in the
2024.05 cycle so that we have enough time, with the help of the
autobuilders, to address those issues.

These patches have been tested using the Bootlin toolchain builder
infrastructure: the toolchains build fine for all architectures, and
for the archs for which we have a Qemu defconfig, it boots fine under
Qemu.

Best regards,

Thomas

Thomas Petazzoni (2):
  package/gcc: add patches to remove crypt()/crypt_r() libsanitizer
    interceptors
  package/glibc: bump to 2.39

 ...emove-crypt-and-crypt_r-interceptors.patch | 140 +++++++++++++++++
 ...emove-crypt-and-crypt_r-interceptors.patch | 140 +++++++++++++++++
 ...emove-crypt-and-crypt_r-interceptors.patch | 146 ++++++++++++++++++
 ...d-with-mcpu-68040-or-higher-BZ-30740.patch |  57 -------
 ...shift-and-__mpn_rshift-for-non-68020.patch |  47 ------
 ...ALE_AVAILABLE-on-__mpn_lshift-and-__.patch |  93 -----------
 package/glibc/glibc.hash                      |   4 +-
 package/glibc/glibc.mk                        |   5 +-
 8 files changed, 430 insertions(+), 202 deletions(-)
 create mode 100644 package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch
 create mode 100644 package/gcc/12.3.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
 create mode 100644 package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
 delete mode 100644 package/glibc/0001-m68k-Fix-build-with-mcpu-68040-or-higher-BZ-30740.patch
 delete mode 100644 package/glibc/0002-m68k-fix-__mpn_lshift-and-__mpn_rshift-for-non-68020.patch
 delete mode 100644 package/glibc/0003-m68k-Use-M68K_SCALE_AVAILABLE-on-__mpn_lshift-and-__.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
