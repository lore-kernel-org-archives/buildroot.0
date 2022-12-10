Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1524C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 357034047D;
	Sat, 10 Dec 2022 18:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 357034047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTAnRog-4xNK; Sat, 10 Dec 2022 18:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ACA840376;
	Sat, 10 Dec 2022 18:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ACA840376
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 879A81BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61900410E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61900410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-VXaOdQxXa1 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27AF84097B
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27AF84097B
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:28:34 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h15so1467414ilh.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E4vF064v9lXWF9MLu+cyyCUl3DKD0wvVd1UdwhHKL+M=;
 b=mvFcVyFoU+aeLieqrETfHXaKdq+wgWc5FiCNPC4Q90RrR7xeYEu55vExrHYW0J8bUQ
 Vce2R6hQxCy7+F2EvT1Ftho99hwCH9pu6DRqTgr5XReSWPXuhtmTv33aRn34UOM1litu
 ZlakszCs0SYpfr5wjRfXaZxRRVRdBarg62KA9+AAIi/yystn9GA3ki9JvOn53o053jfG
 U4h0gXvn7GbeJxMsfeRV2eYxGl8bll6oual4atTfIIu8+UkO9gEtNrKNdEhRNPVYVuRo
 tqvMVbIy6HhCPF30GP2GKTaTHYPedGOzdfcohRfrIc2nL8eN5P+wrXrRzIfnNhYciIPg
 1VFQ==
X-Gm-Message-State: ANoB5pn6dZ/FOU0ghtrr7hwtuWQVt3khdxgCWgaTP1U5KaMz+m/PWdOm
 mgjUAEE9TXd3BZ9dmCDKRlLJV16viIyTAw==
X-Google-Smtp-Source: AA0mqf6KPdzKX5RZireWw+dJCV46oZ1ek3vBXpgW1db9LeKBh7rD22GFk7ileoYmAgFN/VMOEf0Wxw==
X-Received: by 2002:a92:c6c4:0:b0:304:ac69:f9f6 with SMTP id
 v4-20020a92c6c4000000b00304ac69f9f6mr930656ilm.22.1670696913055; 
 Sat, 10 Dec 2022 10:28:33 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 s4-20020a92cc04000000b002f9f44625fbsm1524407ilp.52.2022.12.10.10.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:28:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:28:31 -0700
Message-Id: <20221210182831.2901317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E4vF064v9lXWF9MLu+cyyCUl3DKD0wvVd1UdwhHKL+M=;
 b=GtQiRpwxf6kNHXEHu5iRjUIV1EQUcjSORRBMt9tJaq4uLDZbM+zNqseYzFWf86Hskx
 6Yc1LcBwP0LqbZYf326dRI+XmWiQZyPNhNaxQa2DoRuMkg21Be/pXVEiZgBtXUYKAlzA
 KkLiinavw+8ZrryoOHYDcE3uXB9MMKORuL601AVwsPTnItd1EnpacWuhxcpZGg62gvLF
 5EIEMQzrroiE/j496oUf2piWJwBvKhkleHfZknyUyRy15OYXNizxJ3YBrSV+UQXCtc9/
 KzjFw742iGoS1YMdREdDpx316vqdilKpRNG9YR0vb7DHKT67v7f81WC09BSosmP5dKwe
 fO5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GtQiRpwx
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version 1.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index e50c35df67..c8137ce4c0 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  3c955c49be10a7a07a2fcd54d180c3af  lmdb-1.3.0.tar.gz
-sha256  60a11efc21aaf009d06518996360eed346f6000bfc9de05114374230879f992e  lmdb-1.3.0.tar.gz
+md5  230103e2cd8efbca8ee7cf29151afd0d  lmdb-1.4.0.tar.gz
+sha256  39f6c4ee145d28d17025d350720abb6f95db816514e868db57444fdef51cbb47  lmdb-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index fba168d340..071106605f 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.3.0
+PYTHON_LMDB_VERSION = 1.4.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/ed/61/41f3c7cbd8a67202ef24fad3375ed936093a0547dc645581dd11c09581b7
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/fd/78/4cdc5927d5f3c3c86c4da0108c2eeba544cd67e773232164d59f3e442ff0
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
