Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D1C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2424B81E9C;
	Sat,  4 May 2024 19:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lffvokTSsFIR; Sat,  4 May 2024 19:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC5F81F3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC5F81F3D;
	Sat,  4 May 2024 19:54:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A392E1BF836
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90762606BB
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyuDKNa2iYCx for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 19:54:37 +0000 (UTC)
X-Greylist: delayed 11120 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 04 May 2024 19:54:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 857F160667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 857F160667
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=contact@artur-rojek.eu;
 receiver=<UNKNOWN> 
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 857F160667
 for <buildroot@buildroot.org>; Sat,  4 May 2024 19:54:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC58420008;
 Sat,  4 May 2024 19:54:31 +0000 (UTC)
From: Artur Rojek <contact@artur-rojek.eu>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 21:54:03 +0200
Message-ID: <20240504195407.1409466-1-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-GND-Sasl: contact@artur-rojek.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=artur-rojek.eu
Subject: [Buildroot] [PATCH 0/4] Reintroduce SH3 support
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
Cc: Artur Rojek <contact@artur-rojek.eu>, Paul Cercueil <paul@crapouillou.net>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[Resending this, as the series got bounced due to not being subscribed]

Hi all,

this series restores support for the SH3 variant of the SuperH ISA,
originally removed in e543f5a10488. 

This patch set has been tested on HP Jornada 680, as part of a larger
effort to fix and improve support for the SH3 architecture in the Linux
kernel.

For the interested, both musl and uClibc-ng has been tested, as well as
gcc in versions 11.x, 12.x, and 13.x, with a range of command line
tools, constituting a basic, yet quite functional rootfs.

Artur Rojek (4):
  arch: reintroduce sh3 support
  package/gcc: reintroduce sh3 support
  package/uclibc: reintroduce sh3 support
  package/kexec: reintroduce sh3 support

 arch/Config.in.sh                  | 6 +++++-
 package/gcc/gcc-final/gcc-final.mk | 2 ++
 package/kexec/Config.in            | 3 ++-
 package/uclibc/Config.in           | 2 ++
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
