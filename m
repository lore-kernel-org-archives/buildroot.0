Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E764C3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 08:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B846F8121C;
	Sun, 11 May 2025 08:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZDWiwotqsn2; Sun, 11 May 2025 08:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7FE811BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7FE811BC;
	Sun, 11 May 2025 08:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8576717D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 08:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7657740670
 for <buildroot@buildroot.org>; Sun, 11 May 2025 08:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcCDjIYT9kde for <buildroot@buildroot.org>;
 Sun, 11 May 2025 08:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5084A4060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5084A4060B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5084A4060B
 for <buildroot@buildroot.org>; Sun, 11 May 2025 08:11:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07c5.dip0.t-ipconnect.de [91.58.7.197])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 538EAA4C0A3A
 for <buildroot@buildroot.org>; Sun, 11 May 2025 10:11:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42030)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE1mj-0000000082b-28id
 for buildroot@buildroot.org; Sun, 11 May 2025 08:11:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 10:11:45 +0200
Message-Id: <20250511081145.468544-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746951106;
 bh=XoySiLIr3JmJIw8rRYy8I1VCClmTsW2DAndWS7KDy5E=;
 h=From:To:Subject:Date:From;
 b=DBQ6ohwbXalm5oM5T6feh+tDrdulcQ79KAecy8OCS0bmY1JHkpEyFVLJGc+TikzdP
 D365acLFot6KpyBk2TY124pS6GUBtQuZQkFNw+QWyU+detYwk9PpPpqKn97E4NiILe
 HKGP7vePmE4fmNq61PSFJRjZhHzV079uQRl70ZhMKu39dhQrhRtZBYIREskuNBuY46
 l1pMyJrx5LKpzIuqIO7TDjSFmjlnSmZe0e8/pN/8Xytqxa39z9z6pMeuYW1pDDe6qb
 iaufMTdKiAzQCTKEbVCiJWzuz8FvDNtj5fmC07m2qjAVGJPzNOW4+fYNgRX/DwphfD
 J5Qe3UhU2EBCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=DBQ6ohwb
Subject: [Buildroot] [PATCH 1/1] package/openvpn: needs autoreconf
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

Commit 72657c6f57dd0c2c14cf2033a1e6c77fdc83ee8f bumped openvpn to
2.6.14. While the generated build scripts of the upstream tarball were
created using libtool 2.4.6 until openvpn version 2.6.13 now libtool
2.5.4 is used which causes a build error:

microblazeel-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

src/plugins/down-root/.libs/openvpn-plugin-down-root.lai created by
libtool 2.5.4 contains "/usr/lib/libnl-3.la" in variable dependency_libs.

Fixes:
https://autobuild.buildroot.org/results/ac6/ac60d29fbcd9fb8ddb21b76b3b185e45e580c006/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index ce916dba04..0ed1146a8f 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -9,6 +9,7 @@ OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
+OPENVPN_AUTORECONF = YES
 OPENVPN_CPE_ID_VENDOR = openvpn
 OPENVPN_SELINUX_MODULES = openvpn
 OPENVPN_CONF_OPTS = \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
