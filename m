Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133ECCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDFF841F51;
	Fri,  1 May 2026 12:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nb4RzDeR37YN; Fri,  1 May 2026 12:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AAD424A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639044;
	bh=r0N03XxwRlryIsUh62ipKb7ZA/XVpRwtdn0F6viyRzc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H0oAX3KaKN0HI32IbrS5EgU+KXlPL8k3uf+fBiRXazk5Zmrm0jc+EKcjcTpNkXCoU
	 Rl/Xyg2AVEQCuCGNI7ZHLmXt/BblpKeucKmpAIpfKh5V9Gk62PD6YC9zIjb9P5BAxh
	 QQLIOajcD7mJf9tBRFmLvfG8pNQKq/aoFKuQX8CsotRs0RnQGwFx50VUE9AmJWnjHt
	 EZ5I3ZhfN8ISpTcp/JBnZ/gLRUGPWu+dmdOyJTLTTI/e9QHumZ4rhukdPW21libRXr
	 QHD8LF8iNgHo5pPNKcNosQZ87l+4046zUM10o58UoTs5sFGwDVWwNVQHJDownVqNtz
	 INa08rjUOgQMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04AAD424A3;
	Fri,  1 May 2026 12:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F0A8293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20E5E61B89
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxPYr0F3R71Y for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 112A26176F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112A26176F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 112A26176F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D62BA4C2EC6;
 Fri,  1 May 2026 14:31:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-3wnO;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:11 +0200
Message-ID: <20260501123100.1918951-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638665;
 bh=NPKHVMAp3siakpqVR2BXJf/7nIx8U8kBv6QsLvWkHUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kOv5Bzk8onx6q1GF01V2UyiBbeCfmbKVoYmn7VfrtQqpwBzjpYOBi6aYbkKhftHoG
 7CW+ITsejF/Wlhn0KtGPfyYO3pgMELAk2oXlRBC62sR5VJEFeKB8Lp0xV/Z8H5kkU2
 Gd7aBwK2/3bVmD2mWYTGS6y0Eci0VpG1HnGOd9gpHxisxr0gUAMvyFjp7lwtNzaxMG
 7hFwSFTOKLiUBS65Zmp24MIDdn4N6+VDnS9xT6BzBvsZiqYLJxG17FjVNH25BvXpXD
 DepYIG0lD2Edkvji8k7MSUYWDC/EBmSLiNXxFtSMS/RzjKenRbLZsW7HcgN/CFAYQc
 SlNjEkghSjBvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kOv5Bzk8
Subject: [Buildroot] [PATCH 26/75] package/python-lmdb: security bump
 version to 2.2.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jnwatson/py-lmdb/blob/py-lmdb_2.2.0/ChangeLog

Version 2.1.0 fixes the following CVEs:

- **CVE-2019-16224**: heap buffer overflow via `MDB_DUPFIXED` without
    `MDB_DUPSORT` in on-disk `md_flags`. (#429)

- **CVE-2019-16225**: `SIGSEGV` from `P_DIRTY` flag set on mmap'd disk pages,
    causing `mdb_page_touch()` to skip copy-on-write. (#429)

- **CVE-2019-16226**: out-of-bounds `memmove` in `mdb_node_del` via corrupt
    `mn_hi` making `NODEDSZ()` huge. (#429)

- **CVE-2019-16227**: NULL pointer dereference of `mc_xcursor` when
    `F_DUPDATA` is set on a node in a non-DUPSORT database. (#429)

- **CVE-2019-16228**: divide-by-zero from zero `mm_psize` in meta page
    header. (#429)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 679d552d1c..ad111605bc 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  de895e4a88eeb179aa0c185a08523d62  lmdb-1.8.1.tar.gz
-sha256  44ef24033929e9cc227a7e17287473c452b462d716f118db885c667c80f57429  lmdb-1.8.1.tar.gz
+md5  f6f491b825302966f63b3fdee2ef80fd  lmdb-2.2.0.tar.gz
+sha256  53020e20305c043ea6e68089bc242d744fba6073cdb268332299ba6dda2886d4  lmdb-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index dbdc80bfda..ba3d257fdd 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.8.1
+PYTHON_LMDB_VERSION = 2.2.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/23/19/392f028e7ebcc1cc8212fe8a315a909b7a556278456f0bab9234d3a3b665
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/21/44/d94934efaf8f887b6959f131fde740fcaa831edfd13eb5425574637cddd5
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
