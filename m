Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DFAC5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACEF80DC7;
	Sun,  9 Aug 2026 10:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxwOMs0z9HkU; Sun,  9 Aug 2026 10:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD0480D74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786271785;
	bh=tJasta1By/ss1Kt9cITbYmZt+0rl3c0+fSnbNETxqko=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fdxcytPeyJ17Ay0qb1E/2eIYuWOl+/2Enp1WCxD8VEn6OQTAdtWIvH0Yn4dGcJAec
	 ttOiSyQafmYp5BWYaMhu915BwA9stH9c+lzOWFO61MLMEu+ZB6APgZNLOd5g0AOKOK
	 G1WDbpyVfzOM2TAnbmel9/3WGDMVI5zJDP/TyFg4iwqxlf8IKCPe59QQ6/BwIntDst
	 96zI18LGAOm38cNs36665w6sJxd/1n2o3FUVWY+sFGaraGiNkPm9vZtvW2Bi4XjSsY
	 AWelHlKPBID7vuIC+GlzrBCK6sjoHrn94NbKDZpMLnXOzNbYsBxAu5r40DUNO2V4dS
	 x1V7sodnlV1Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD0480D74;
	Sun,  9 Aug 2026 10:36:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C94198
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F62400E4
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkNNMcKrR6aP for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08F1940101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08F1940101
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08F1940101
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:36:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bda.dip0.t-ipconnect.de [91.58.11.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20A7EA4C4726;
 Sun,  9 Aug 2026 12:36:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40046)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wt0sw-000000005Yy-00SJ;
 Sun, 09 Aug 2026 10:36:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
Date: Sun,  9 Aug 2026 12:36:04 +0200
Message-ID: <20260809103605.907605-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786271766;
 bh=4cLn2KnAC3IHKnXvGNNeAFt330WoUpt2MQLkjEDG8ks=;
 h=From:To:Cc:Subject:Date:From;
 b=VBS9S69aocHOesmN4BKrzBywPvvhLXYCyJCvWGqDE3gIVSsRDhyQp10jTdf4cb9bd
 rhsbtpIxy5T6dNr7bRPQES4r0wx/roncHy8S1ZJQNpoelIcvIpemQB1/bQWgucnHGq
 EXjn5N03QiRSLu3jbuYManYUrigt1GuOk5q8VNu6C1uH2mnbRYeUGJR2+1BIv63P6r
 QJDJV4D+RO32GkxYB91pAJWp2xLOzwmZ+zNE+u1IBHgv4+UeoBBgaTcAGl/AhlUn+l
 vy1C0/26fkeBAWdqyCyJTpDVTfeyVKhyhaMTmVY8/tgdQlKJsbMxDX/yDtU9XN8bSY
 +9I2IBcaKoSUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VBS9S69a
Subject: [Buildroot] [PATCH 1/2] package/syslog-ng: needs libopenssl,
 not libressl
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

Buildroot commit 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d bumped the
package from version 4.8.3 to 4.11.0. Upstream commit
https://github.com/syslog-ng/syslog-ng/commit/dbe9fb306929168172062a6bc985eb7e38201dab
added the usage of OpenSSL BIO_ functions in version 4.9.0 causing
build errors with LibreSSL:

lib/transport/transport-tls.c: In function 'BIO_s_transport':
lib/transport/transport-tls.c:125:3: error: implicit declaration of
 function 'BIO_meth_set_write_ex'; did you mean 'BIO_meth_set_write'?
 [-Wimplicit-function-declaration]
  125 |   BIO_meth_set_write_ex(meth, _BIO_transport_write);

lib/transport/transport-tls.c:126:3: error: implicit declaration of
 function 'BIO_meth_set_read_ex'; did you mean 'BIO_meth_set_read'?
 [-Wimplicit-function-declaration]
  126 |   BIO_meth_set_read_ex(meth, _BIO_transport_read);

because LibreSSL does not provide these functions.

Fixes:
https://autobuild.buildroot.net/results/117/117b3b38098df075d96167863d9f6b933a97eb64/
https://autobuild.buildroot.net/results/a39/a39ecc88a9342005b75660ee0ac60a1025fa6fc2/
https://autobuild.buildroot.net/results/6b3/6b3eb910ccdb67827f0c12cea0e3a63c5e6b68af/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3e545dbf07eb3c7f4ed0e54b50b7d072c03d217e

 package/syslog-ng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 1302e6ac46..0bdf0dcd27 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
