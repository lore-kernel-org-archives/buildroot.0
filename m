Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B9FC54F4D
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24EB8608A9;
	Tue, 28 Jul 2026 17:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPCbjecs7rTx; Tue, 28 Jul 2026 17:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC05760898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785260210;
	bh=4W5GYkHF5N1zOE7Byb1udbK7171ZKaTwZY4ZT5uaMpw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HKQS8AEmoE0d04bQIXE0nqfCqOC5KP9x76j3Q33KmxfQxpu30FASZ5CoeqhiEh7YF
	 s2nHgJTD0f8JpaC+oyUL2dUX0TpiD4C0dKD5jcEuGGBfMc4LyoXAVUU/hamrgh7DCZ
	 QHq2hDCUBbdrkZU9y644Qd04rqKjzk63K1r50WbkS0FOPTKFSEiwYBA+46WsdTQqYE
	 OuTxc4oIbdAo+QvwdIM+zwMjHS1gf0uBwmXsg3uOZFodCbqAajivWUkrGiDJV42Vtc
	 kJ+ANoi2d7rCaJagT5gzOq54ywrgAtlVkzmkGTGa8AWsO+YBXZp57nzSLuBxSAVqIE
	 WAKwTFqBR/CsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC05760898;
	Tue, 28 Jul 2026 17:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF5B82E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 17:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E151181415
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 17:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kxvZ0PUpv_o for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 17:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 614EB81414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614EB81414
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 614EB81414
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 17:36:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf42.dip0.t-ipconnect.de [79.214.207.66])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73F3AA4C4373
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 19:36:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47988)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1woljO-000000002YL-2R70
 for buildroot@buildroot.org; Tue, 28 Jul 2026 17:36:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 19:36:42 +0200
Message-ID: <20260728173642.3515075-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785260203;
 bh=NBaAKfHlOONOZE0AIHcH08TylRibPPPBodSXMPmPLiI=;
 h=From:To:Subject:Date:From;
 b=dOfZtx5M5nMQCggSbOQSSWZhe+k2HbP1k3h132bJYICCz6tp8Efsj8buuwIx+q9uu
 gjL5aKNYCGdjLSQMh/ogPFHjdUIAfy9yoW0027cv5z4wQHVuWb+ML5RPSWPP+PfClj
 +0lN59cOwn/l8jadXncpj1VainrpFZcYrtFSsYSq1iu82Dzy2EVsqt6irgOirhXqIR
 CaqtmKxUs45Lh6K+C5GXk6dA6KEZMtiyRlDngeHfku70aGDu2XZUN8sJA8Ahxr/FRM
 NR+cYMwOs7bzQsPkysH3mXNyy26Wj6jJyINrHhU9hp2VEsEpxMEAiKPfDR+9iC7hlq
 wnugNkbGQWmhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dOfZtx5M
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.24.5
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

https://www.samba.org/samba/history/samba-4.24.5.html

This is a security release in order to address the following defects:

o CVE-2026-6949:
  TSIG packet with name compression can crash DNS

   Incorrect size calculations when a TSIG record contains
   compressed names can lead to a large out-of-bounds write
   causing the server to crash.

   https://www.samba.org/samba/security/CVE-2026-6949.html

o CVE-2026-58216:
  An authenticated user could possibly crash a KDC process

   A kpasswd packet that contains malformed ASN.1 might cause
   the server to access 6 bytes of unallocated memory. This
   memory is not exposed to the user, but in some
   circumstances the server could crash.

   https://www.samba.org/samba/security/CVE-2026-58216.html

o CVE-2026-58218:
  DNS signing DoS via TKEY name cache exhaustion

   An unauthenticated user can repeatedly register names TKEY
   names, which floods a cache causing legitimate TKEYs to be
   expunged. This can practically block the use DNS TSIG
   signing.

   https://www.samba.org/samba/security/CVE-2026-58218.html

o CVE-2026-58221:
  Samba AD authenticated LDAP access domain takeover

   Samba AD low-privilege authenticated LDAP access allows
   modifications to internal LDB special DNs, which permits a
   domain takeover.

   https://www.samba.org/samba/security/CVE-2026-58221.html

o CVE-2026-58222:
  Samba AD LDAP Compare filter injection and trusted-request
   confusion disclose protected attributes

   An ordinary authenticated domain user can bypass access
   checks and query confidential Active Directory attributes
   (such as KDS root keys) via LDAP Compare requests. Due to a
   filter injection flaw and trusted execution context, the
   LDAP Compare operation can be turned into a
   protected-attribute disclosure oracle.

   https://www.samba.org/samba/security/CVE-2026-58222.html

o CVE-2026-58224:
  The CTDB protocol has bounds checking issues

   CTDB fails to do integrity checking of received packets.
   This includes failure to check field lengths against packet
   lengths when unmarshalling packets.

   https://www.samba.org/samba/security/CVE-2026-58224.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/dd2f625c6688cf48bdde48380fe744e2fdec5551

 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7c44ed747a..3931e55669 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.4.tar.asc
-sha256  df2c51ab4361ec626ab9988e5946efcca8465bc7afae834291d5558468265ff8  samba-4.24.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.5.tar.asc
+sha256  6d5d7ee82f5ce9da4135086c9b184e47a58b4b023565f58abbb1f8c8a922306b  samba-4.24.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index d481f9d417..79551e1ee4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.4
+SAMBA4_VERSION = 4.24.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
