Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6FBC3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8494D41520;
	Wed, 14 May 2025 16:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2hRwGueDo8m; Wed, 14 May 2025 16:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B127E41548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B127E41548;
	Wed, 14 May 2025 16:58:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C11153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2C3A40288
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HlIJ91YjcLU for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36C35400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36C35400BD
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36C35400BD
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a0b9e2d640so6446950f8f.2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241912; x=1747846712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8nnhPMKgGjwQ+CycIjogCNQTVK5xFfqWdtAMqiKSUgo=;
 b=vc5h1rn2rx/KfV4dVagVC7C6YYIjecYph/2gDaHvyxuFZe8cxitLhJHT3e/EV3XoaC
 7l0RTlz7urhphu0j/J51ZMAaVstY7zBHZTLqZIvQvRaG1uOi0tsoopdlMxhwcw5nxGe8
 cCqHDdvQ20qhOW9rHx85YA+R5UNfTg3Nr6kmOGCQ0sF88y8qUKbg08C+30xqX6Z7XelX
 kcpgrk/H3Am0nOj+GihNBvu27Ufjjr46LwW9s1XEwdU/nW0Uz1UtAgl/t9KmwkXNn46U
 BSjjzutAocMR7s8gTYPJGHTA02dFmwv9GmrSzdtXlrdV/ecrFy4wGH9nnP25bCW2BPGc
 mQcg==
X-Gm-Message-State: AOJu0YzEwLtwU7Ij0jiKnYfKaOWzNX6L//4ETflUB+r564VmMt+5oT3X
 7H+ZaODABYl/zsOKlH70kbqp78oGYLKbk7R+qnW8+E0tMyvMAKzXjkg2gQ==
X-Gm-Gg: ASbGncs/nhYX39l4BT/wJoAJjd5EbL/KOMq1n/5vTToVfWYUZ4Sxf9cNtyIOcpjbvdD
 CVSCXuivUMUwZsGG5V0hg1gmxYTkB4vuril3//YvPr5IXeEDH5uY5vFNwvu/a8Ayq0Lj84lVxen
 RObXkVRxq68EDPie6WEir4BQzlYbPFPDof516ZjnK9ht7j1VSC2LJlJwGwgtAUG/IkdSKVSZL1K
 oZvdTe/IeDu42NEhIHHMmxoa2NgT0V6T8Ix6e/ZEe96Qn/0gp0m944Sk5JBUR/tXDpbVMqCT+jv
 YSjZWAbtu7US8JxWKm3ghSs/Pzs6kScC4PZw45CpjohTLclVLGARRGLphdVKug==
X-Google-Smtp-Source: AGHT+IELp+wavUES78F5wfISzQGDY2Ry7Y9Md5J23JxQonmYc4CWqHCoWb3IsGoHcAlBo8chsSKKUA==
X-Received: by 2002:a05:6000:4304:b0:3a2:416:5bee with SMTP id
 ffacd0b85a97d-3a34996a66dmr3732005f8f.58.1747241912023; 
 Wed, 14 May 2025 09:58:32 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Date: Wed, 14 May 2025 18:58:21 +0200
Message-ID: <3d35742af4e065dd031c35c85eb86a1a65a52e1c.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241912; x=1747846712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nnhPMKgGjwQ+CycIjogCNQTVK5xFfqWdtAMqiKSUgo=;
 b=ipmFTZ4V63mGVmGwSuxOb+mME7anaRX7TVCwgWwoDJfPse6QNo6H6eJc5F4RiGruYk
 kp7puajzlwcm/E9l5zLzaWxUNWy44a9zpEi7K4i87bh35WajFrRBfQbBSUSMvF07T5Lo
 9igvsEBUxNEHVg99FFLoFLRKvRkQs5JL2Mrtnw51lWNS/Qrg8nl1Wz55wYrfwMGNo32k
 6O2KnB2AbPv2i5TZOjAjVrQawYYgU0wrJqf+YqQKJhnU1mEW5r5JpfB0RKZIU6qQIj05
 /oY9hH2Mh3rsXpvcPbcPkRG4ivMSAVLk9FEHSDpGUdemYcyep1IddGE8sjVFS3vYSjw6
 305g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ipmFTZ4V
Subject: [Buildroot] [PATCH 09/13] package/systemd: require merged-bin
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

Since version 256, systemd will taint the system if /usr/bin and
/usr/sbin are not merged, known as merged-bin. Although this is
not yet an error, it will be in the future.

To be as ready as we can be when that happens, forcibly enable
merged-bin, like we did when we initially added merged-usr.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index fd7671480c..5eaa092444 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
+	select BR2_ROOTFS_MERGED_SBIN
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
