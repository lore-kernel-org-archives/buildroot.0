Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A0AC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4CD80DC0;
	Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_-TOj5B1GKS; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CF080FB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82CF080FB5;
	Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42C01B10
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 308A5610BB;
 Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hr9kd0mG6CPg; Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44FEF60AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FEF60AEE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44FEF60AEE
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so10350555e9.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178983; x=1752783783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DnKPBLFS7AdZIW3ExZU1PhfB35yQomCS+AQPnE8t5G8=;
 b=CidBn5AsfCzcLvWcTN+VJQWe+EKFmce9P5k3yp/bce3Mf2JD/hGgF8hUxyZjTKfZpW
 4JQphBIbdRxo/rUaH876P6d+8z1HN0TPxyOfA5cpX72IjGtA0hGRcPfW0JM2C2iOprOq
 rowlZjZ7uHO+hMkSJQ0TIkNFjSKo0y4AyhWMCxHxEAuju6VStmhwY67ZW6BH6+8+8s1/
 9HH0/xFYSjl/xmKTviiQDmQl/CEZ8LSThMLqojSJ/+Nf4LG64gM+uwhc3nt2okEyaV+Z
 jKAG36SG5YyXa1/QbnaRqYs3d34jCbTtHjQk3k+s7ap2aPgjSoEl7Z3hIWIGagTZxYi1
 XslQ==
X-Gm-Message-State: AOJu0Yx7+WJdXZn6hR412aYlyY4fugfYxPSx7q0GZwtBVB9S/x0UTI5g
 2CbAYoWpFDXVrLNZnZKiNa+8ZqLYajNGkCzjLbRKsg+0tqPjeEY30V71Yzng+Q==
X-Gm-Gg: ASbGnctRgOpSxixue1mJEUt7Lqys1pQnFInR2lv4Q3fKKhHM5HXA6PG5U+WOVhlc/Ud
 fdJXGAL6p17JVsH1wjzyMfTKD7X5PHhSfkaYzt8GhWTsLU+NsIAc9tmn7FjlBgBAaAzD2l+axSB
 v662Z/P5yl+UnbaWgpuWA7U98sGwJ+SCqq8csTQVDUIT6YB112+lbViubjQ0EFUkgC1akxQgp9Y
 PhUzO5Q5cndksViqB21Z5havGufFMzPwEQjQJ2lDDh3+fkTY2IJGL7WKjD6LkMJuQIDU/15ZZ4Y
 fCPJzrTG8liOUH3zDoiZAbbJY+pXb9itku/s53ZK1e2SkNA8JvVY0l7XiC44p2QjXf8kiYptvX9
 7mhvnfeQ=
X-Google-Smtp-Source: AGHT+IGKZotHm68bSG+Om3UyWiezdh/Xc785iT6aJs2ofCgC6a/A2MYND2ut8JAADLwWfmmTslaOyA==
X-Received: by 2002:a05:600c:3b03:b0:454:b97b:cabb with SMTP id
 5b1f17b1804b1-454ec283b2cmr1566945e9.28.1752178983281; 
 Thu, 10 Jul 2025 13:23:03 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2025 22:22:47 +0200
Message-ID: <aa07035185ebf12d43c8c433f489e5c8fe9dccb8.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178983; x=1752783783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnKPBLFS7AdZIW3ExZU1PhfB35yQomCS+AQPnE8t5G8=;
 b=ekCx4Wv27XUZ/yKZ9K1EZPK0/xBAcbTDjvfNd0LE1jGiSvGUv+zFsVTFXMyKwltc5l
 S8uCh2ZB6R/YBfpjVvKvuTFNv+xb/Uc9+v0pbdC/bFFLaDxxKft12u++h3zkfvTvOzvq
 MQutBfTUagKAOT7w9UFlgGXhxxGyKF2ZOMTNcAJduQdIwCsDOEd7W0Vp0F2lpShtKzZH
 pWZOdz1rz0tLFGGl7eNvgmazjYginWSJ4hGGBF4vYU/owLgx3JCK8RSJxquCeVNAi7VO
 SQ3G1IqAujoTTOqgScpM/qjFGtIhFk1d2DFJ9FNDCNpfb/72U/1oCSjQhnXNbh3l7PeX
 kMLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ekCx4Wv2
Subject: [Buildroot] [PATCH 05/17 v2] support/scripts: prepare for a more
 complex check for merged directories
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-merged-usr.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index ed0c58e9b7..ac676185dd 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -26,7 +26,7 @@ root="${1}"
 # each of them.
 #
 
-test_merged() {
+is_valid_merged() {
 	local root="${1}"
 	local dir1="${2}"
 	local dir2="${3}"
@@ -35,9 +35,17 @@ test_merged() {
 	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
 	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
 
-	test -z "${inode1}" || \
-		test "${inode1}" = "${inode2}" || \
-			printf '%s\n' "${dir1}"
+	test -z "${inode1}" || test "${inode1}" = "${inode2}"
+}
+
+test_merged() {
+	local root="${1}"
+	local dir1="${2}"
+	local dir2="${3}"
+
+	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
+		printf '%s\n' "${dir1}"
+	fi
 }
 
 test_merged "${root}" "/lib" "/usr/lib"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
