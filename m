Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924BCC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F20440D3B;
	Mon, 29 Jun 2026 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giZxnEtt66o0; Mon, 29 Jun 2026 21:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8B140D3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782769638;
	bh=9HSQF3Tu9GL2Ms7aHHuoPR2Q5AzayfRfKN8FU3CZEzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ar+PAgIpM6jreqZ7jh1oc9vxXg0GU5Pm5x9Kokn8FMsEua2lLsKsU2p/qfx8jtJnw
	 I+Rh9PgCkidVlm3SM4XmwE0Pqu+ivRSug6GLRL3auaj+8RmsT8y/BP9uaGOHcTYzjQ
	 K8krBHXiUXFNMXU71gc7/KOLOjI92FegkA8hEhMGh2YiiNc9qAY8QtuEneGl2f8lvJ
	 qFvau/I8KAaJhnaC8f85YtKxjgYy/Fhm5Zh8E0zcDqmDfhTwmKMRsBTwDP6fkcOFwm
	 UNbYJDC+cEWmzKgb5LIEuyKcSEvWzRh0LRD0OWEPjEoSuH6DF83QYjeOUNxnzhXutq
	 /Z/b5iT187uiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8B140D3D;
	Mon, 29 Jun 2026 21:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 725C734C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57CB840592
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jc6EVaK9d8NJ for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30A0740092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30A0740092
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30A0740092
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:47:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so3841609f8f.0
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 14:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782769634; x=1783374434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=CL44RqU/O7pacMPQu6V+shIRe023waPnEXpOkJnTLHQ=;
 b=AaMpwEVQzYtaBHWT70spp/7yzpK2lCkMh6opejHlwH+wPkxgHc6uGktSR1xi8+ko9R
 sOveAlPmX+wz+1+gbE1PuYKlpAfHRsbWnfe+Oo4dnZStbYMi65b1HL8BJq1Y3MEPKsHy
 PSLWQC28XTU6VhN+hfnb7WDQ/eeeTNbpoSdBF5TXQK3bcPHxHVjzKMwjM+Wj/moinOGl
 wBIVfbjF8YmxTvXQRSujC8fd1j6cdQWNrjSofxxkmz8K3GYPeyHm9zUw5KgxYASUfayU
 Aux0uN5x7nMNEcLgdXXoYIEE9OpzRGfV7bNeMu9uPvOcLrCi+KhXWLKzWpQ98Mgb3d25
 Bi7Q==
X-Gm-Message-State: AOJu0Ywa3h9FH1FDRgbZcsXDTB3yFaa+Fln1gT9kLFQS2ZLMU84HmR9g
 e5lq2/XaNtnp/TMgHurXy/0C0jwyP4DGe6c63p8JK93teDXQvZMZmMHw8ea7w7mMkqOGkysVqyO
 Lw5RW
X-Gm-Gg: AfdE7ckHlcLqUQNhk7njTspi8a0L5oDeJ9rs5svbugb5b5q27ydKq8PoUtYh2QDI9mY
 tiIlsA1AoW9OyvOjkMuwIVQC1ewtemjxP4YZNq57V32ldKB0o666QvcQxNc0JeofYig80f0kUiX
 ZdsmP8bTrfb2aEYrp4EIg9FlEDbEJ5CZTv+Pd++AXnCfwEE3yTmHCXTWSByGU5flieFCXPsjjzF
 F7N8UiYEy+XhQ3m2QKfiprutgard8bLFT8LSsn5HtvnzsuQ83Q3Fk7CQHmSQ4Arw3QiQUTSGFdB
 f1TvJ5p+/kPUZDYAqb6k8Fpebl09hX6AbkbLcMyij9GSkfpU1rmvB8iAxgnKSlbuupbmPr2waAZ
 vicnansRyCYZVW0ggN+9JUn1H9z0jqtV0Zn2Y96WER5jIsKcJT7PwHOfjShw8HWxyu2Tiy1U/O7
 qPzsBx
X-Received: by 2002:adf:e882:0:b0:46d:d6c1:8383 with SMTP id
 ffacd0b85a97d-475535e730emr886339f8f.44.1782769633606; 
 Mon, 29 Jun 2026 14:47:13 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cf98sm952109f8f.22.2026.06.29.14.47.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 14:47:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 23:47:10 +0200
Message-ID: <20260629214710.736022-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782769634; x=1783374434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CL44RqU/O7pacMPQu6V+shIRe023waPnEXpOkJnTLHQ=;
 b=aE2uxBPyc+o7esCGrcBX8kYXLkAc2E0j8zrjWsg22MqIg/2E2zVmfiaBxdhNRJsOKm
 W0Ip/FP0KNXjBh9znsxQvq1LP0HkBnV5FU0Q+XnIYkAGCpUzWx0aoRl1wEYEAXsahkV8
 1SaIXVotE/qYMZNXfABPS3jUksGHpQUWi2XGnpZzJaeva11khXuXO5vgqZwHJ772Ea5u
 SXi7K5tD14E2oS9uduf2P7TNYAs0FhmlAYoBk+6UtCtL+BPEN52EtasE6PqSjfQz77VR
 ivsOtQNS1C6Nfj2xsRkTr/3Dq/IWvKAbIQHGHtEuYBp8pRc0xxXKiSEgpeE20MmZilOY
 fGHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aE2uxBPy
Subject: [Buildroot] [PATCH] package/mariadb: security bump to v10.11.18
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the release, see:
  - https://mariadb.com/docs/release-notes/community-server/10.11/10.11.18

It fixes the following vulnerabilities:

- CVE-2026-48163:
    MariaDB server is a community developed fork of MySQL server. From
    versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
    to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, during the SST
    the donor node is interpolating parameters that the joiner sent into
    the command line. Not all parameters were properly validated which
    could allow a malicious joiner to execute arbitrary shell commands on
    the donor side via the rsync SST method. This issue has been patched
    in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and 12.3.2.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-48163

- CVE-2026-48165:
    MariaDB server is a community developed fork of MySQL server. From
    versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
    to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, a high-
    privileged MariaDB user could've used wsrep_sst_receive_address or
    wsrep_sst_donor global system variables to execute shell commands as
    the uid of the mariadbd process on the galera joiner node. This issue
    has been patched in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
    12.3.2.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-48165

- CVE-2026-49261:
    MariaDB server is a community developed fork of MySQL server. Versions
    10.6.1 through 10.6.26, 10.11.1 through 10.11.17, 11.4.1 through
    11.4.11, 11.8.1 through 11.8.7, and 12.3.1 with  `wsrep_notify_cmd`
    enabled would execute shell commands embedded in the name of the
    joiner node. This is fixed in 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
    12.3.2. As a workaround, anyone who cannot upgrade now should disable
    `wsrep_notify_cmd`.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-49261

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index ca23b36a38..e2c13e3302 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.17
-sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.18
+sha512  45fa3c746138aa51b55d61efe11d44b0476fdcb104d5a40929ca2910145668ae749664e2afed7f9d59825d5b2b14e920c012513a4efa4eb0f8af1607d44ae31b  mariadb-10.11.18.tar.gz
 
 # Hash for license files
 sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index c718c1ce7b..7d3c505ada 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.17
+MARIADB_VERSION = 10.11.18
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
