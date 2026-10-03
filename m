Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C40FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A2660F3F;
	Sat,  3 Oct 2026 13:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6yagtXDWj85; Sat,  3 Oct 2026 13:57:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 48E8460F31
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035832;
	b=GrT3eRHHQUrObodnZx8yWeMCoJ25zgFdfDwQb79XQ0cr5ZTV69R3r3d5KqH2GhDX2VOi
	 gkm/qkEI09/rWlgj9s9MnG5Lh2GDO/H+UW8oTuMCd+OmN4627bQot51KnTuxC3JITQz7/
	 SXHeiHD02/8hL0bYJflOIyGjXhQeDTkJJfvsnY+KcifGIcaTKpoGjgTzehCVMbw5COIF0
	 5zCV4rVYokroQLOW2XN93ojQatFb7qxRJrmJ6u2xo4KeMOdfILF0Rr8o9BUp5Ljyd+c8s
	 cii5YP68sq0+wEgwPvmPi0qcLHNXIgcfksHJSOkdo3t150N7Sh/HfPEgVjppRomuv6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t/bOpt0lQh0avZQ0e5+KgZE6drGnOWnR23G9ZRU0xKs=;
	b=UaYOfsOGregS5r0/edxaLvVBgNcjG2QwT82LD9+d2t+EHvEKDlFWqKvrDC2ZY19otAVW
	 slnTPg7PJg9Dag1jsu7l4/94hSoxsAbsBbSpQJ1WLWI9FarWZ9vbOR6h1vzXFcwvEqehB
	 F9oxAvxX8JTVFlW5bBqupNM32PY55cJFMicOvY4Ta8gEbveYypRCn9P6/X5zLjonD/Rpn
	 vBi1tgmjOD1qqHgN0kxHKYD98/f8971ZltWW8klm/98tCyi12UHX+NNrJO+7yRWbSEL9w
	 pvXcVBdGUukSbltVmOslht/tpOUCurnsRX3X0ZjNdXgeLCXYrt6qUqQ0rrts5WsjhrA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035832;
	bh=t/bOpt0lQh0avZQ0e5+KgZE6drGnOWnR23G9ZRU0xKs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OZw2k3kIFx4MRpBTkBhmNRVslyEqoTUr2OtycJ2tqAUAFX9ML46JSn2F42AWasuvK
	 dc8z5GM3zyYzULaRbT6hQ0IGYRDvxQGag2FagW+J9vARM6shL86gMM4D6HKguRGBlP
	 rQw22atondQ3oJTXv9e8k4PqaKNb2yKg/5QZElKfPVxScFZ7S5618logd6YQR5AXTW
	 ocp6DgubxXJNLG+r+jre0spueWkQ4N84ZWykZF10TaIfNdYfYqj1HacNc7XL02zrUs
	 zzIVn3nHpr8BxoTrykpoCgIMIZPre5oMzumjVi6nd59L2gW765nMiqNFvBXvuzcI+G
	 0uXiIwrm9dnqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E8460F31;
	Sat,  3 Oct 2026 13:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D2FD32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4029840063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvEJaxhI2iof for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3E23140024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=QMvBdvEPJum/FSmYnj7xJa+M6SL91VyLRsRFxJ/kaejwU4JjudSPvRIrrAfeTGzpZwC+
 vnHW5XfLzOs21lCmijtnSs7hTEeq0W7IET3SE4P7/kELZKZ/sTd9qbCdzj1ci7FTdc7DF
 QvN9RbidjA4kEcI4u1ZVnfh+UdDbbda2w+hjizEK6r1dvbWNHamynlujG9SuRpY7jGA+n
 fuRw6EdMnx5xkHraZyj8k5ibEWB0fMipG7BdmqqNAAv6wdbOAsLft/NTZ8qiGdyhhRDb+
 TDvGDE6ZIt+uoHPHnEXuWbb1iCC+KrSy9aiay2mJDPnsosIeR5fHA+oRCgU3hjZZTRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cDIUqbnLmqr6JCq8lM4V9/PGb8LqIQjjtoQhGM53J2Q=;
 b=AswA2FjPbDiNKhfu4kn8qllVelCfjKjD6CCLA0N6qKqKH3Bklvj0tufFbKhlku29TBg7
 TN4hXBRikmCjnr1TroNY0WeX5DhBR7qtyWwdsapuyZDIhNyjJRKj2zWX9HVtzogKNENFZ
 4n/KjQ3t0egqrtjay/WsPkq/tTqLIZPENM5j4YNNy3+eZnb9weTisayi9luDLPI8wsaPU
 ryvfHWZP2Gt/4dPQqnhe4ycUzq+VWB7Je/sVw0jVaemn5gf9HB0jEzdluQtH7N09ndcFA
 FxATFX4+WQ7bm9ZfeEtQafXFJFxr9BRKbJrm8bDbAOatSW8d26JmEStcxPa3GweWfQQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E23140024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 783A68A321; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 999c01f82949635a6f36a9914b8b2020126c5bdc
X-Git-Newrev: 7e73e8b7042eb58c4ad3f940736b588dd5ced85f
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.783A68A321@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distlib: bump to version
 0.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e73e8b7042eb58c4ad3f940736b588dd5ced85f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index d31ab90f09..8504366a0c 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  555fd6076016da3a89ff9b959677eaa6  distlib-0.4.0.tar.gz
-sha256  feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f401a4e0d  distlib-0.4.0.tar.gz
+md5  6a6a1389a42f24634f06ab6978d5d96d  distlib-0.4.3.tar.gz
+sha256  f152097224a0ae24be5a0f6bae1b9359af82133bce63f98a95f86cae1aede9ed  distlib-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index d71896237d..581c4ee4f8 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.4.0
+PYTHON_DISTLIB_VERSION = 0.4.3
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/96/8e/709914eb2b5749865801041647dc7f4e6d00b549cfe88b65ca192995f07c
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c9/02/bd72be9134d25ed783ecbbc38a539ffaefbf90c78418c7fb7229600dbac7
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
