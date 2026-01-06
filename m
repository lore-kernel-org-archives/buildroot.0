Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D440CEFCFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBBA280C80;
	Tue,  6 Jan 2026 20:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZnUQzYW3c2W; Tue,  6 Jan 2026 20:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128E080C88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729681;
	bh=fppkVaW+e1dnyYIMZFIThNlTutAC9i09eCECxxSczD4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G2FLY4SQdNeTLbw/rS5B7Vj7dG6PjOMSeHZvm6D7lcD3UBGdszyxoClFXfMLV9ZBa
	 dP5tAyPnZ5Nl8nsr37TSjVdx/Zr/ZI8ElBZYgDCoRBYJtenlmhjaSf9+S3JexlKlHi
	 xftBLGZ6313Kq2qjyUH6q7aMyg37jm8CP59EWEFk8qbHKbWUfE1z5xapnmJy2QS1Dg
	 O8C+BO5+/WQ9qu2kIaQGR/+HxUCU4ALSO7d3sxnDXSE60c0caK5jANOyhcYRG95IvC
	 vszU8YlH3Xgd+jIwm2vw4cKg8GbquA5JoejUjdb5xzoJugJLfr5VCls7LsPfgbQyLo
	 ABacXrZFHY9Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128E080C88;
	Tue,  6 Jan 2026 20:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B85870B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C47408DD
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NJ9C4A5IO57 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:01:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5660140859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5660140859
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5660140859
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:01:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42DCAA4C35E1
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:01:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDEx-000000002Vv-3ix9
 for buildroot@buildroot.org; Tue, 06 Jan 2026 20:01:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Jan 2026 21:01:05 +0100
Message-ID: <20260106200115.1985522-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729676;
 bh=Jbx7HKh3EX7Vn5Mh5seP6owqGkfwZqYmxGHzkzhpSJU=;
 h=From:To:Subject:Date:From;
 b=Y9sImx/bpXMDdxgVztcHckRFD2LDapWhGMpfXSfUhow/oqvHdIGy0Pi39zqqJvNg1
 MdXOGGDbEi15TJPm3Y19LmTIr2g+bIsbXDUHz2Af3b30YOTN0tgC2dYizXwSwqQKvg
 SrU1F28zZfS908wOydFuI6L7+EhPl65MCZpWGeHThF+YuMRMAOiy58IJ+hmhX0a7Hx
 Dz5sP0/pL997ZZr3+ce3szxrAknXwV/B4zy77fqJMfArIuKw5zoP6UOLX0wa+tfz8x
 zsnAZU42+UkmwIs2DSu1a8y/p9rVZjTp2/GMPPElHVNPyDwaiNFvFuUMngtVXA0RWg
 aaIDkE2ETDd2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Y9sImx/b
Subject: [Buildroot] [PATCH v2 0/9] Remove packages
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

Hi,

this series removes broken packages, see commit logs for individual
reasons.

Regards, Bernd

v2: added lockdev removal to series


Bernd Kuhls (4):
  package/dbus-triggerd: remove package
  package/libcec: remove optional dependency to lockdev
  package/libgphoto2: remove optional dependency to lockdev
  package/lockdev: remove package

Thomas Petazzoni (5):
  package/libsvg-cairo: remove package
  package/libsvg: remove package
  package/gconf: remove package, broken
  package/criu: remove package
  package/cvs: drop package

 .checkpackageignore                           |  2 -
 Config.in.legacy                              | 52 +++++++++++++
 DEVELOPERS                                    |  4 -
 package/Config.in                             |  7 --
 package/criu/Config.in                        | 52 -------------
 package/criu/criu.hash                        |  3 -
 package/criu/criu.mk                          | 77 -------------------
 package/cvs/Config.in                         | 24 ------
 package/cvs/cvs.hash                          |  8 --
 package/cvs/cvs.mk                            | 58 --------------
 package/dbus-triggerd/Config.in               | 15 ----
 package/dbus-triggerd/dbus-triggerd.hash      |  3 -
 package/dbus-triggerd/dbus-triggerd.mk        | 21 -----
 package/gconf/Config.in                       | 21 -----
 package/gconf/gconf.hash                      |  4 -
 package/gconf/gconf.mk                        | 23 ------
 package/libcec/libcec.mk                      |  4 -
 package/libgphoto2/libgphoto2.mk              |  4 -
 package/libsvg-cairo/Config.in                | 11 ---
 package/libsvg-cairo/libsvg-cairo.hash        |  6 --
 package/libsvg-cairo/libsvg-cairo.mk          | 16 ----
 .../0001-fix-expat-static-declaration.patch   | 36 ---------
 ...fined-symbol-png_set_gray_1_2_4_to_8.patch | 32 --------
 package/libsvg/Config.in                      | 12 ---
 package/libsvg/libsvg.hash                    |  6 --
 package/libsvg/libsvg.mk                      | 23 ------
 ...-static-library-and-headers-separate.patch | 44 -----------
 package/lockdev/Config.in                     |  6 --
 package/lockdev/lockdev.hash                  |  5 --
 package/lockdev/lockdev.mk                    | 58 --------------
 30 files changed, 52 insertions(+), 585 deletions(-)
 delete mode 100644 package/criu/Config.in
 delete mode 100644 package/criu/criu.hash
 delete mode 100644 package/criu/criu.mk
 delete mode 100644 package/cvs/Config.in
 delete mode 100644 package/cvs/cvs.hash
 delete mode 100644 package/cvs/cvs.mk
 delete mode 100644 package/dbus-triggerd/Config.in
 delete mode 100644 package/dbus-triggerd/dbus-triggerd.hash
 delete mode 100644 package/dbus-triggerd/dbus-triggerd.mk
 delete mode 100644 package/gconf/Config.in
 delete mode 100644 package/gconf/gconf.hash
 delete mode 100644 package/gconf/gconf.mk
 delete mode 100644 package/libsvg-cairo/Config.in
 delete mode 100644 package/libsvg-cairo/libsvg-cairo.hash
 delete mode 100644 package/libsvg-cairo/libsvg-cairo.mk
 delete mode 100644 package/libsvg/0001-fix-expat-static-declaration.patch
 delete mode 100644 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch
 delete mode 100644 package/libsvg/Config.in
 delete mode 100644 package/libsvg/libsvg.hash
 delete mode 100644 package/libsvg/libsvg.mk
 delete mode 100644 package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
 delete mode 100644 package/lockdev/Config.in
 delete mode 100644 package/lockdev/lockdev.hash
 delete mode 100644 package/lockdev/lockdev.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
