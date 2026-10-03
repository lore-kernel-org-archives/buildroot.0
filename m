Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D057CCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F1E606E6;
	Sat,  3 Oct 2026 15:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CigWfVIINwJp; Sat,  3 Oct 2026 15:54:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 61DFC60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042898;
	b=dZ6HHCbzMLpj6O5YsbZ50ZNwgkPX7k5supg72+QqAbT1Fs0BlNhrEIcySsMjRCMV5Pi7
	 s1vyIz78LJbEKFaorS9j1WDxgYQRk7QvM+z/Cr7AxVFEEU+U71NvNUpKBgsthl5Ic8S+a
	 vq4Sf4q/36Hz7xv0RAgzbyQ4rtKfclYPVbOha3Nk+i3ObNPC0saUb44BVDLXvxPhbjPmV
	 Gz5p5gRPlqNsa+rI6s11BZrPiw5ykgPPgHTkE2HGZfVsWNKxuai+VE2LUIpJFfYKz8Ti9
	 ApX+uTqWOiAWEG+/JkaSJ8Vy5YZtt7bQvdAogYuIeAV7NmGWro+WZQ4ahf0wjcbbIDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=o5FIbaj812Enb9yjuuFxKmpa3KhnD+Mw1rzXbEJA4AQ=;
	b=iqkCXT7FSZeioArIoU/sDXYYO6Y2S6J3ID5b5nA247BrWcLS4C3pGU5j/V6m1WBWfL+Y
	 JPr2wrilsXbToHnRafsZgWIRdwPOhTlHauSqQFgfwAf5/ZJyY8U+GTIhz5iROOvED1kar
	 A5w8t2xgPtW3ZfX2u0g5fkoBuF/ljCEn3xs4y3sVo/cyQCPFzCt+3MCh0u9ak2DnqWoYf
	 3d1z51GDIFtXf2XeDmsywPjW13esch+JelGlIqk/s2AiJRg8XyZ1MCn28vOOFQlmLOvUK
	 kw4D08N12dvANSoTOh7u7fnq3g7Xn4In61S8SAIdBBWIjCYDrM16TjThQBIikcw+Mpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042898;
	bh=o5FIbaj812Enb9yjuuFxKmpa3KhnD+Mw1rzXbEJA4AQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GZbAiutK+LzuGDT6RYywZS0o7YJqCxcxL+rRZHyBWk0AG0EU7ytcJJ+lHMWWFNCXw
	 ipdqfcjZg86DE1sAJ0Y3amy0hOM/5k5KM+pjruR6D9h25jgSk8SjoiF5xs8JY9bIFG
	 UnofjN76XZ0rMr7Kmnrnqx3FTF2rCCxJeXzgWBIvMX2Vw1NzsZ/NrQ2uxzFW8GQtcX
	 VTdKZP8yqdLk2sjdKhWDmxq3EvPq+Dm3FKzcWGDyV+6ILuo7LdJe8e8ysiSCDUDicz
	 lMpkFfWL/HdDdfovgq1EyGx3EPUfK4Bc/AJxExAhyeY35XbUDP3Ye9yhtu/MbNp5mr
	 OMeLt2NTKoWYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61DFC60601;
	Sat,  3 Oct 2026 15:54:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F4361D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 370996064B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLaNyQNz7Lvx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6AF6060603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=kVylizhcupEYNvcGcecMTJ+XsWq8gtkCM5pr5XwWKACa5pQ5xu+gmlmuguKtnItjH5Cz
 RUAAkEZkZg9W4OvbYzYGJuypl9jyo8w7C12b9P76cpxUfP9q/lpI3JDVDoIqN/acj0vat
 1H6RwUt3+R/D86XI7dQ22x9DWpQVsKrYcA0Ael/mAUM7XRgGyDRheA9XgzIk+MHImI5m+
 UHrQWOAN+djHllweL3+ucJseXct4VjWov0iRqQmoZgtLb45dZYN21IJHEOhlyaWaUoIzx
 NjcL4pE4xe3qYmTobMOJxdjk4DWokrJ+EUdPVJXI/TDu0pF+PnNistppnSiuFq8nVbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0eGeBTBZO1nte2p7ZVovq0heL7qAjbcI3A8shS9ypjQ=;
 b=MGTEx2Yp7y6bxr3ORdtpyW3Ftf3gsF+v/BNOoRu6CNc6oKDnRgO7WfaYXD6WldVhHaeD
 SCh+gP1DzwT0+JIDnfe8GxmvqESNFdD0ibNYPlD3ZbeCK46TlRPwJtLsLh9iYJstX4Aex
 pTwiKrXKaWEzntikF/y2fibzTXLMC5TgLIT+agYyVV+T6ksmLmIOUUgdnbZtRefeX2pss
 pXcejSDhHK7GF8OAdzKwlPkF8epGUI0Hp2IqOyp6zqOIMO4AImwxe7FNOuT8sObs7woi1
 ttbaHI0chvavLgPeC85yDbg2dcqoL6lX4Xswptbvsxsa45AcAPsX0DFM8q3X99yr1RA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AF6060603
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC2A58A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36ff65db08255e48d29df030a53b4555069aacd0
X-Git-Newrev: 7349e4fd40845fd8cbbdb24c305aa8cc3e70b8de
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.AC2A58A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyphen: bump version to
 0.18.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7349e4fd40845fd8cbbdb24c305aa8cc3e70b8de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 4385fc0c9b..3bd71aa4e9 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyphen/json
-md5  ce57c010cca3a3b67275b393d2a8b6f2  pyphen-0.17.2.tar.gz
-sha256  f60647a9c9b30ec6c59910097af82bc5dd2d36576b918e44148d8b07ef3b4aa3  pyphen-0.17.2.tar.gz
+md5  b54265294e34995fa435ec9048044d15  pyphen-0.18.1.tar.gz
+sha256  dbae6fbbe4f01cb206108b43573d857c67107be9d0e38eb1b08d6fa2210634a7  pyphen-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4fd1c78fcec632bc872ba7b42ba04be330029cfffa411039b48a4f2262bb8240  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 8db0518aa4..5c4254610e 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.17.2
+PYTHON_PYPHEN_VERSION = 0.18.1
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/69/56/e4d7e1bd70d997713649c5ce530b2d15a5fc2245a74ca820fc2d51d89d4d
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/94/47/8430452269cd28863d73b903d07d329d058cf762527ff211b3864ba61fc7
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
