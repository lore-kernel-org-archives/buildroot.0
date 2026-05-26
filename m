Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8379BCD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D2C81248;
	Tue, 26 May 2026 20:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9KnVnD2Q7FS; Tue, 26 May 2026 20:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C0681247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826034;
	bh=4p3rG6Xp385NkXuvoh2PfWxG1q5JbY18l4Xf51eFiKA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yw6h7UJDUShh6Wwq9G6n0a5vA0eb+XF4oKDj1D9eFT7QkkessZbg6+Cv5tez+DvFn
	 Zyer60PSJe+gvBguoAeUuTDGCKxNZvkNy9W9TdmgwMs5pwJWR+e78g1I8IHjfrpGuy
	 70cNlZIDdzbgxPi98sumPAsEtGT/74PGjTZ7LEvcmCPrDm/ln75tKb9kLZFVkOdL9Z
	 dv34vMRDSA4l7xCbhqOavExTyCYWrTkNyqyXtXAKDvJpB6fhzIk2h4lN2Wz67OXRWr
	 YwGgSyVhLEzg3oX3dBUGm7IMvfgahequs/bmFkoaKVOJS8wkUKOqHcyAfcs7/G3wSw
	 TnKpI9BM1IjdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3C0681247;
	Tue, 26 May 2026 20:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7647923F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C7781247
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcNad13UNauF for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF9DF81240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9DF81240
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF9DF81240
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62160A4C20A9
 for <buildroot@buildroot.org>; Tue, 26 May 2026 22:06:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39036)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRy2z-000000000xj-2bB8
 for buildroot@buildroot.org; Tue, 26 May 2026 20:06:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 22:06:38 +0200
Message-ID: <20260526200641.939539-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779826002;
 bh=2M37e6b4TpJ/kBJoefO8RZjB5Esu1jrhbtiUxoJsxeE=;
 h=From:To:Subject:Date:From;
 b=QWyQm1DJjI3Fk77KeMqGmQjXkclDYwkZrpRjVQw+T4XTlnVxFXa8ofzLU9BjFH0q8
 aMAG+WZvlX+OQ9l8bgCNv3nW7LtN+38ewoHLNkrzcQ7N5Mo8aCK6YNeTMzoZfH138u
 ybCN0WAX0yVKQHPb3usHPwxGudzJ+m+kp7UxKsfDNuI9TEmbVvd27x0BkcVGA1QlYJ
 wwVoNo8CEFl4IXSsm5OyUwjP4psZy8uMFcpzsTnkF0meVZfMVe6IFNnercu1JfmYOx
 Ya0IJapNZUt1pIbHwGO3QimiKRFUfA6JcLgqt71h9r0qgOAx8/PTHl3W2pZAlk0tEX
 po4Pv/AMaPwuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QWyQm1DJ
Subject: [Buildroot] [PATCH 1/4] package/libde265: link with libatomic if
 needed
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

Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
package to version 1.0.18 which introduced build errors on sparc:

/home/autobuild/autobuild/instance-21/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/15.2.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 ../libde265/libde265.so.0.1.12: undefined reference to
 `__atomic_fetch_add_4'

Fixes:
https://autobuild.buildroot.net/results/605/605dc19e86f113662cc35fe055c64c52698d70b4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744

 package/libde265/libde265.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 8c2fa4a3c3..d7e3df83ca 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -11,4 +11,9 @@ LIBDE265_LICENSE_FILES = COPYING
 LIBDE265_CPE_ID_VENDOR = struktur
 LIBDE265_INSTALL_STAGING = YES
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
