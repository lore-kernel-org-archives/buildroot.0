Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B40C79FBD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0446A6062B;
	Mon,  5 Jan 2026 19:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKu2d_Xp3PF6; Mon,  5 Jan 2026 19:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2178A60631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642498;
	bh=KNWD9iIl65/LClc8oqXkZVVsrRJDnZqDv3orwR1bzK0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dQQtVmHpv8XqoZTUlwVWzE79BuAVysGOsV8hXhIpKTVlVgEPqzScmuTQw7Ng9T8Xn
	 bh84iHWw7qlfihYWeGJZTxAiIUF1cc2Z0r1prgns2hdJjKPglRBST+b9USAhYhuzL7
	 KtQOHNgwE9sF0YN95pQW0vFI4VxZkVJyJdsUKEEEDeujxxVHEpDZvUfC1o6lQIUp4F
	 rlTETJ7xOa0QKEtxv9KidC2DuK5MPSKwZzyidGOA2YHr3MG0J4EdzoB/bjegyGzDzW
	 5ajToNRfeiG9sca94cHWapQyAsI7GfNLYTb4Mp6H5mkm+gXoMklxmckIUOGnJfRA8x
	 8FriuQrbpX/fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2178A60631;
	Mon,  5 Jan 2026 19:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB686E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A271F404B8
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGmHAI4Ck5IM for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB7FD404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7FD404A8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB7FD404A8
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:48:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E31D5A4C2EF2
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:48:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40420)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqYn-000000006SQ-2Nwk
 for buildroot@buildroot.org; Mon, 05 Jan 2026 19:48:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 20:48:06 +0100
Message-ID: <20260105194813.2157401-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642493;
 bh=6QWKd/xBRy8CP1yzzj9o+Gi+HCOEtbD8AxwKN4V9G9A=;
 h=From:To:Subject:Date:From;
 b=kT/wsCcvqTeAjajsIsuPHHYQMjF0ZCdhMb3C6340HG/VpI8ZDK2owxBCGYcRMX+gM
 ibBB6ioSqTVi/MP/P3nqX/u/PRCQMrPXbtJTZ3glsQW5jnGRL1T3YjE5q5Cqs/1Vzg
 VlOf8AqjsbyEy1iBV0ow1Mm+CG0woD4GTHav9qxZgJvTdbuGjJUHycvgcRpA461XdO
 Pgv3ElCcTcJugB6qj05Ejn0jmIYXfU1YWyszWhOB28ryMYlBBTJAgUCOl96A+EBgxd
 NYcnWVD5VNAgwfYGCFJoVPikqi9X77Ar46WAKhyVwiQlyZi3bQltXo+kG/15ETt2/m
 rxfZVkZZ1maow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kT/wsCcv
Subject: [Buildroot] [PATCH 0/6] Remove packages
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


Bernd Kuhls (1):
  package/dbus-triggerd: remove package

Thomas Petazzoni (5):
  package/libsvg-cairo: remove package
  package/libsvg: remove package
  package/gconf: remove package, broken
  package/criu: remove package
  package/cvs: drop package

 .checkpackageignore                           |  2 -
 Config.in.legacy                              | 45 +++++++++++
 DEVELOPERS                                    |  4 -
 package/Config.in                             |  6 --
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
 package/libsvg-cairo/Config.in                | 11 ---
 package/libsvg-cairo/libsvg-cairo.hash        |  6 --
 package/libsvg-cairo/libsvg-cairo.mk          | 16 ----
 .../0001-fix-expat-static-declaration.patch   | 36 ---------
 ...fined-symbol-png_set_gray_1_2_4_to_8.patch | 32 --------
 package/libsvg/Config.in                      | 12 ---
 package/libsvg/libsvg.hash                    |  6 --
 package/libsvg/libsvg.mk                      | 23 ------
 24 files changed, 45 insertions(+), 463 deletions(-)
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

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
