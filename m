Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1659EC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEBDE41DBA;
	Wed,  5 Jun 2024 17:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd1Ca52cDwPC; Wed,  5 Jun 2024 17:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B642B4238D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B642B4238D;
	Wed,  5 Jun 2024 17:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7B0C1BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D9608464E
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8u2psLUEe7eX for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 389D181F56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389D181F56
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 389D181F56
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35dbfe31905so25433f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610005; x=1718214805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vW4DRTSI0BWEtGbLD4robrFLCZfxpaSCOavddTcgAqA=;
 b=Ih5Qctqm3iOs+UVWsJ066GY1wAGKrn1AxX1Sajw2iaHjig+h9BuP/yuXiEU7aYXUMO
 rNe1D1I/mUGT3Q0NnQmLjs06rlwXGNrRuNLl7nemztg3IXOKwcxMPwuc6k5cbgMOW3fy
 4svHLPISdSw3yr0GgeAUE/61c3GIm39MCcPptkrS6i8wHKlGZiExbhEMgifZ49i4/BC2
 mve7GXXb5WtQ5hu8782pm5+wdqZDTFoiUg4N5h84MfR2zBiIT4IVainIb8NmTioNm7oW
 pEC8haMt1gYQWEGStviYfSq+DIRBRCLLOcXFrRszwf5WLlJhX+lOW+zm9AhzK14+19W6
 QhWg==
X-Gm-Message-State: AOJu0Yyp9xdbt1ld6ATs6Ee9RIhtsiRdVJ+9SnJNamA1HcM+tOznhdtQ
 D/L7YjImUZWjf/NWYovn1Y/ErtkW5i6DorRo1+Z7ArGBgEDkqMlxmW4RSQ==
X-Google-Smtp-Source: AGHT+IEmq4u+6VlGU3vK7MBXvThAfusRsop6DiCnvInlAjxkQouWiwxPz0ILsc4ZyUgVURP/JWHRFA==
X-Received: by 2002:a5d:49c5:0:b0:354:c934:efa1 with SMTP id
 ffacd0b85a97d-35e8ef888camr2267940f8f.56.1717610005073; 
 Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:24 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:19 +0200
Message-ID: <24eee82d7cade44c8ed6fc1675ea739a1ec70a18.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610005; x=1718214805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vW4DRTSI0BWEtGbLD4robrFLCZfxpaSCOavddTcgAqA=;
 b=Z81asUSwMHlfCxDN4lQlDorMkJFg3RLcMf1OT6upaWqW5w0afd/zC+N80UHkEIOl+m
 J9y7zcHjirgQnJxCsXydlxckS4R6KdsV51kBBP4OgcRpfRYXajyv35caXfjORtvzt9yw
 ds1RBSsLPjOsepwRUPDv8Mhq90udfQJfeNG29oULyskh5e11XT2B/NayJAdyacIUM2Y0
 TXre60tp15ULy0bg7CWWLkr69bYLg4bNYGJeNnuSGVd3K70pPAQrGbx9XZOi1LfQQgEv
 5sFgh/RpgCtGiZzuLA7csVfkBUEIBxPcOhLPy9z+da6eSi4J/HSS1qSZj64xiKTsHRDl
 8Owg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z81asUSw
Subject: [Buildroot] [PATCH 07/10 v2] support/download/cvs: fix shellcheck
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore  | 1 -
 support/download/cvs | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8825d644ab..f8c5837e0a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1653,7 +1653,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
 support/download/cargo-post-process Shellcheck
-support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
diff --git a/support/download/cvs b/support/download/cvs
index 0c079e2403..b771caf280 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -40,12 +40,13 @@ shift $((OPTIND-1)) # Get rid of our options
 # 10 minutes should do the trick.
 _cvs() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
+        printf '%s ' timeout 10m "${CVS}" "${@}"; printf '\n'
     fi
     _plain_cvs "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_cvs() {
+    # shellcheck disable=SC2086  # We really want word splitting in CVS
     eval timeout 10m ${CVS} "${@}"
 }
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
