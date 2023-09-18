Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58ADC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 640D2415B4;
	Mon, 18 Sep 2023 20:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640D2415B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51ORVg_6eS5H; Mon, 18 Sep 2023 20:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F696415B6;
	Mon, 18 Sep 2023 20:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F696415B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF5F1BF3D8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FCE041598
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCE041598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vL2UW8toDy9H for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:31:09 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B2EE4158E
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2EE4158E
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso3928251f8f.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069067; x=1695673867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Up4bJXoIYyNRd2UAODrHv/8T3OsjgOYrnidqNx7dtvg=;
 b=jQQEp+9U3csEpXCjXgHIe9QcLlI+kUhKT6lB8gzRgvNRspo6QxeEbq5xvXKmYwc1OK
 Ex4Yo7f2yQwaV0p6vuarXma3heFbiGffUXSgpheg7NosA9n9XCUhl8IJHB7NLCA7YZ2W
 V8xKTSKjSgVI4fdEwZBUerjyvrbIXJs0sV6JNCWFO8psrOHrMyb6DDCMx0P6gKhA2+Ue
 e3Fb+g3eRrOar+7UKgIxWhC7EhJ2qipi1abLyCUJqcUPke8XocDrCboEYaKiEOXkMxpn
 GBrB1DK0xmaiRgoxAhUhvudaN3AO4MCZpDVgpROJMczyhSF1y5ntdeRUdg7NR9ebs3+k
 FO1w==
X-Gm-Message-State: AOJu0YxBh6vGnHOYnUqBCNE0rTuSTpmdGy6YB1nodhdP4A5aeensX1zk
 DKJyQKQLGs0PknpbSvw5w/fMQKkFKHw=
X-Google-Smtp-Source: AGHT+IFT2iRVxUr68qhXIxV/zeIujKgsHmv6+cBB0qDlcaAtxPHzTOWbRYzGYEhMvSoQu2H7QGveDg==
X-Received: by 2002:adf:f30c:0:b0:31f:c89b:91fc with SMTP id
 i12-20020adff30c000000b0031fc89b91fcmr549084wro.7.1695069066992; 
 Mon, 18 Sep 2023 13:31:06 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:9624:48f1:9fd0:3d3c])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b00401d8181f8bsm16238956wml.25.2023.09.18.13.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:31:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:31:03 +0200
Message-Id: <a18eb5b69ceafeeccb94bb9dba1aba227d5e25bd.1695069059.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695069059.git.yann.morin.1998@free.fr>
References: <cover.1695069059.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069067; x=1695673867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Up4bJXoIYyNRd2UAODrHv/8T3OsjgOYrnidqNx7dtvg=;
 b=Nw8xwhaiZ6/4h6hfCiha7h5Vq6jj6VEgDwdr5DiOD+qZ8lj+dhCwjz0FG/twH+Kh6G
 SDI3iC+eCE0OLM799Jn63rAgjJaA0dN/49U5qHLHo1va2l4f7AcPjxG3nW8FeCJzfUE/
 WB8/dbWnOYBTZPvzy5MkEC0i8rIkyhf1MxBDLJWKGP11YsFm8ELJdJBWZbV9ClssB7/m
 FLByTpm8lllJddVFf/qwgBcMcOAwdUhM9NaK5WGBjclUpA8E09RUV4S/g5FbimWaY+NK
 qoUVRblwF+Lg4NESKtZ+QWfgbjWu2raIgZ1JjB4Hz+/VRzQPXhVTrxzt8faMaUIzyN/l
 Pjdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nw8xwhai
Subject: [Buildroot] [PATCH 6/6 v2] docs/manual: document git backend
 handling of export-subst attribute
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the changes about export-subst in the got backend, to the migrating
section of the manual.

Reorganise the section so it is more digestible.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/migrating.txt | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 2667aeab96..f95112e84d 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -90,13 +90,18 @@ An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.
 [[migrating-svn-externals]]
 === Migrating to 2023.11
 
-Before Buildroot 2023.11, the subversion download backend unconditionally
-retrieved the external references (objects with an `svn:externals`
-property). Starting with 2023.11, externals are no longer retrieved by
-default; if you need them, set +LIBFOO_SVN_EXTERNALS+ to +YES+. This
-change implies that:
+==== Changes in the download infrastructure
+
+1. the git download backend now properly expands the `export-subst`
+   https://git-scm.com/docs/gitattributes[git attribute] when generating
+   archives;
+2. the subversion download backend does no longer retrieve the external
+   references (objects with an `svn:externals` property) by default; if
+   you need them, set +LIBFOO_SVN_EXTERNALS+ to +YES+.
+
+These changes imply that:
 
 * the generated archive content may change, and thus the hashes may need
   to be updated appropriately;
-* the archive version suffix has been updated to +-br3+, so the hash
-  files must be updated appropriately.
+* the archive version suffix has been updated, to +-br2+ for git, and to
+  +-br3+ for subversion, so the hash files must be updated appropriately.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
