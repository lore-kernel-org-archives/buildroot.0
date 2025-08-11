Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC4ECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 20:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38AB4827F3;
	Mon, 11 Aug 2025 20:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu5Lbb1ZIHSe; Mon, 11 Aug 2025 20:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48847828D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48847828D1;
	Mon, 11 Aug 2025 20:59:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07AAAD98
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED5B3615EB
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD9alo33twGQ for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 20:59:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D90AF61594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90AF61594
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D90AF61594
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:59:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so2800400f8f.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 13:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754945979; x=1755550779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFZSYkdP/3T0QOfAoAczkJ9+NkDFFdguxaDnvbIZgHM=;
 b=jvLjuHN2lmu6tT8z+ET0tvhiKMppQnnc3jTy5URghWVAZwYP7YXC83I7YQQZ1Ti2xT
 q4/T6oYtZfb/YJ7YHaF4hC73O2DS61TiYc7B4zNY5UGXx8cuxuJqJ4lcgkxG6NA/Yu7R
 IAVJ5SGdHu6Hfhe/Ge3t6QYR5l7PE9+sprCeA6N96Mmf0E+rGsTcLnSXHR8RXgUhKRZ0
 wx+LBUdQR55eo4xiVS67pQQAXjizKOohUkdRb0Zkx/NZyglLZPvwqT6eTx8RRCK3Kjum
 XPTmUiXco6Cys1Y4HUCIlHFbRnkEjKKKEzrMT5MbTAYhvL64U62gIYCqMRCmMmthkM7w
 6CcA==
X-Gm-Message-State: AOJu0YwlRILO3nkBDy+X7OCduxQF71TNoBwOVVganSqaZoht7Y7AsYn8
 vbWBigQZNZXE3f5/+Ur0qECdsD1TOsD49197YNmDk0tBPxKzsvM6nz/Dbca6nm/iqU4uCgny3im
 9fklv
X-Gm-Gg: ASbGncu4bjX1Uqxybv7+YptOiWYyTrxelX38LO2djxzaJuW7gl6daGubg/CzHOPGWIf
 mPYlJHK3y7KL7YgGBlhuVZsJNU62P/V3i7/ZoZvuM2zUAKMQ6519jPgljS3EGdQB91nz+U9qcr4
 XTzq/QCul8XnMryKHruhqWA+2ZRwZQ07ms9I/0BTg3fC+wAw9b7FZHmqI721SoyGDmn56RngIEh
 0meuhqqdkKzrLVxy+XxsnPDrg7q7jhu7D0DJM8DB2o+EGBCH8BAg8gf8rw/olJ2BScdsmK876Nq
 EiLy7AFBGNW7vKnO9Vv9TPgGZBrQ27gfotkHD+grxzM7f0ED3EUHOZZAXGAuq3pBYmq+RXS1lav
 vSX/7Oo4ITjfxng==
X-Google-Smtp-Source: AGHT+IFH4Wl8ZS2vWxOA6CLDEAlCG+Ix0eMTBXE4phlq4jimp/dkxLSO7iuS/xDnmCjtFw2vvuodlg==
X-Received: by 2002:a05:6000:220f:b0:3b7:644f:9ca7 with SMTP id
 ffacd0b85a97d-3b910fe019cmr911684f8f.25.1754945979366; 
 Mon, 11 Aug 2025 13:59:39 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm41948565f8f.27.2025.08.11.13.59.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:59:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 22:59:38 +0200
Message-ID: <20250811205938.784904-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754945979; x=1755550779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=gFZSYkdP/3T0QOfAoAczkJ9+NkDFFdguxaDnvbIZgHM=;
 b=IJbXASi+fZArke50ss4LOVHiNMUX9PD2JKChVZnwtkQ45z8QbQJgI/R6ix66PxU5vW
 /6Hb6mkLev16m47DfvxVmkGjE41pL200B9nj+dv3m2427Mb5yWBu0Wlizk9B7LqRLSAi
 JRBY/IoOavhUU0Q7LeCs5/ZowyQITFbur1STRhN/3BYp9u3eD6F2UDVVODFiPE7P2ZeF
 OVHfpuhx7dI0qVJPEMzHgSRYq1w6x06vvT08f9UTi/ki2qGaCfouqaxklzrN6DSBj5yt
 e+Lu/8MdlfpjViQSMuuNs7vCQ5dR08kLCa83nqYe+sgqrUb6GkLrj8BbEGHuwT7K/gjB
 IUXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IJbXASi+
Subject: [Buildroot] [PATCH] package/mariadb: fix openssl RMD160 requirement
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

On the autobuilder the mariadb package fails to build when the
BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 variable is not set.

See the following autobuilder error:

```
/workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c: In function 'ma_hash_get_algorithm':
/workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12: error: implicit declaration of function 'EVP_ripemd160'; did you mean 'LN_ripemd160'? [-Wimplicit-function-declaration]
   40 |     return EVP_ripemd160();
      |            ^~~~~~~~~~~~~
      |            LN_ripemd160
/workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12: error: returning 'int' from a function with return type 'const EVP_MD *' {aka 'const struct evp_md_st *'} makes pointer from integer without a cast [-Wint-conversion]
   40 |     return EVP_ripemd160();
      |            ^~~~~~~~~~~~~~~
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBOPENSSL=y
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
BR2_PACKAGE_MARIADB=y
EOF
make olddefconfig
make mariadb
```

This patch adds a requirement to the RMD160 crypto for the MariaDB
package.

Fixes: https://autobuild.buildroot.org/results/f2b/f2b749cb7019856c5434c27987e8bfb2dc179cda
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Tested building by removing all the other crypto except DES & RMD160. It
builds on that case.
---
 package/mariadb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index acedd1da9d..142ec815ed 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
 	help
 	  MariaDB is one of the most popular database servers in the
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
