Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99271CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 22:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D99684B12;
	Fri, 29 May 2026 22:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6l3WMskpzlyX; Fri, 29 May 2026 22:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7582684B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780092165;
	bh=tWvvwmB4Enx0OhZxhYf1KipIacyCr9UMomYYgwhhcA8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fARJ+wa74OJ48Lrq756aQb1UYBFIk92p0IsOl2EkBa0FPMWaGaQvm77yaGS89Bzfl
	 W+rmlwc/WVY/w69Z4J4LJmjXwc0X2l7+skOUHyHKbtaRd2t50wAdQG2s+Lv171CHsd
	 XousTLVvgzS/HbVTtgiorWid5nZcQCbNGvnjQZOWo/XeJAueHoZR9ygTPgXvRwh2Dx
	 eu3625lgiBm4ACrB2nbX5IZ113qLTX1dvD/50WwDOAy/gaE40AWISw1hnPAuZv6GKk
	 9XwcYuefA7cwo2bedZfLuy/XHwZd6Co3QOyhJP5b6FhQ2vkGdEM1ce7TrlWVoQzhsX
	 P4MuZVIYkghXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7582684B13;
	Fri, 29 May 2026 22:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 169BB288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05430428AB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fi_xHkRKMbPj for <buildroot@buildroot.org>;
 Fri, 29 May 2026 22:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FE3B428A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE3B428A8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FE3B428A8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 22:02:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so185143f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780092161; x=1780696961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y5HOYkJf+FsA2Hz11diiA+6r5SOERFaQ7VRkAMcfTYI=;
 b=KbKBQirXz4ZWyUQXWjTzO4ddBIoIc9mLgAllNiRuJrQK8nINI3jYSBumfzjiexZ7+o
 PEV5As+/KvIK4HNs1NQfA+icRrwrQGWkXKClFybAnchvctOnzhlfKinzEn7bxGTZCDod
 qCFWznDj77vNxUtYPZhqJD/TLlhcOXozUbW7ljRqQVSe7qbN0xFFpCnDUmrvp50zO0PY
 afpnj6+JShGgMvscsNmKlPuVmAmwvVrs4O6TDP3BdElm/afWWbDE2owfhCNw1mTArDzb
 ZVfge8mz/GaNQWnZ2ZOdOf6alUxxxtnLw3/236gkMgEmuqYSdzTR4/452o3rvRX2HU3r
 BGdg==
X-Gm-Message-State: AOJu0YxnIKOfZJ28Aj4rR1gZW4my1s+AZOaTZrOfWZXexNCsXjNbqXFI
 Tg4ftrz/UUsoF4u4SLhDC/XSI/G6fDdKTc2zx1YhHFEv9NAaQ09+wzr1DfkKinlJlk1tzp5lZ07
 HdRmHdWc=
X-Gm-Gg: Acq92OGMrUejqwLATKTxuJgrzFbljLDZFWvptar883hbXVJv82+ExrdJqcu5dFQfoRY
 EHQwuIfCihpIHZsFkXPir3MJM20eo2roUwBTxgVDlExZsxvlSyGD1U5GkgGGCVmAz6nGcArwoLm
 FhOBhZkkyuBWfureT8sQRYjGO5G8ONchJXZTj3w5UtF2u3m1WfGtQu3WNORoVmHvhHytOsFf741
 CXf2W8MvcqM/8EzVs9ABOPHbiokI4JVWiY3OG3kIuKZ6eXtmNR+xdTV1pGlMLf+GUrEptvDPze/
 xDpllfzWxaFbciyGvcaItSJUS32MFiS+DvJIsg4BjXnHqZXSTNQSYGJV+Q06jEHa9hR61Jq1MJD
 blMvbnL7C1srAXeTYotEaQYbNDOvpN3JtZ/i0wczYpsp0tbylR2xcVdJlbOsFh1npy6TaIFid5q
 uYqzF+qZ65S17MpXTDSZMhDxVK3FGI/wPNzWFNlCk=
X-Received: by 2002:a05:6000:1a54:b0:43d:7c1b:b8c7 with SMTP id
 ffacd0b85a97d-45ef6b4f243mr2106086f8f.21.1780092160996; 
 Fri, 29 May 2026 15:02:40 -0700 (PDT)
Received: from dragon ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35874b7sm6650806f8f.35.2026.05.29.15.02.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 15:02:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 00:02:19 +0200
Message-ID: <20260529220219.2526204-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529220219.2526204-1-titouan.christophe@mind.be>
References: <20260529220219.2526204-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780092161; x=1780696961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5HOYkJf+FsA2Hz11diiA+6r5SOERFaQ7VRkAMcfTYI=;
 b=Ww8FNB5PpyqP+RFq8c77qYpZ9GjkTRiMNMmWxt9TNO4zpPl6ur4oq2e1OVs983E0wd
 FehApX+QvxQK9YHZgJ2gi9rP+PEk/w23FPS1g6eRSTxtooykcAMzi83t/53ldt+cvYC4
 iw1MTgnR9rDuibph0RqAgTdpTFOb7t6p9aPy/DCjoWvQPH7dSv4m7igDqntwUV7V6XqX
 83xoPmztQncK5Vff0dRAdTOMVk8Wx+u1kWxK/BEOUzaOaxHkrmb6nhu4HodyIVMEYCAr
 NOmMWzSYNBS9145mz93JAolAJuUBAlJajmTfSbEmzUxzxBymiwklSq9bzqZmt/w8SEyD
 gVqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ww8FNB5P
Subject: [Buildroot] [PATCH 2/2] utils/bump-stable-kernel-versions:
 automatically commit result
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since this script is often used to bump kernel versions in multiple
Buildroot branches, it makes sense to simply commit changes directly
rather than letting the developer do it by hand.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/bump-stable-kernel-versions | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 6303bf4010..8da0c756df 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -25,6 +25,7 @@ latest_version=$(sed -rn 's|^\tdefault "(.+)" if BR2_LINUX_KERNEL_LATEST_VERSION
 latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
 echo "${latest_version} -> ${latest_release_version}"
 
+updated_files_list=()
 updated_releases_list=''
 updated_versions='Update the latest kernel releases to:'
 
@@ -94,6 +95,7 @@ update_linux_hash() {
 
     # We were iterating over this file so we could not edit in-place.
     mv "$HASHFILE.new" "$HASHFILE"
+    updated_files_list+=("$HASHFILE")
 }
 
 while IFS= read -r -d '' hashfile; do
@@ -101,7 +103,9 @@ while IFS= read -r -d '' hashfile; do
 done < <(find linux/ -name '*.hash' -type f -print0)
 
 if [ -n "${updated_releases_list}" ]; then
-    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
+    git add "${updated_files_list[@]}" linux/Config.in package/linux-headers/Config.in.host
+    echo -e "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series\n\n${updated_versions}" \
+        | git commit --signoff --file=-
 else
     echo '>>> Nothing happened.'
 fi
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
