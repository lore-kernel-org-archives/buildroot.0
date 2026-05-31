Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A5CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 12:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CDD42BF4;
	Sun, 31 May 2026 12:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqXD2ZoQhgcA; Sun, 31 May 2026 12:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C08E42B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780229142;
	bh=iz+rf0pfZPxjVGRv3ky8nyKQbCsUXuiqr7dOmmfvz1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cu1tbaXYWIebEPo9onetJ47NewPyDsk+bfGNojNrqUZQipOpTnUe3WiCyx5ueaAo3
	 xD8lbhgICR1doUD3p4k8pcTgM+h2DHbcDWaRaMY768TVdLgzz+MdNG04hqONjiBJtq
	 1BxMo36O3zy7nLzkd6kB9qVAt+635h2XX0JICGNrhdvbmRLeNEKUKCAzE/JlQ0u4Fu
	 WAeVDw3Ni+W+HZ85oeLR9/JuvFpFxogFj/ZIUKVxtrmvaKIDLc6vf34KYzWT1Tw6jl
	 wvyAXvNxpcws2JUOfilwaL9Ark/9m9dADhk1r459w+t0FNTD8DKG0c2QahdzdWTvjt
	 nvNL4MlkAcrGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C08E42B4A;
	Sun, 31 May 2026 12:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE006F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF17A40567
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36LttdrBQYgj for <buildroot@buildroot.org>;
 Sun, 31 May 2026 12:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07333402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07333402D4
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07333402D4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:05:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45efb698ef2so411839f8f.3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 05:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780229137; x=1780833937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJ+R2GC8eFkSWp9S/HV3+rdMo2R+2CPDAFqRB5s+6zM=;
 b=mxe80pnymjX2bWSapUm2LdGHPk8DlYA54nwsjUIRq5QyAWObYaEq+dfdmVu3lHwjsa
 Xtyk27pscE4nhJl3qjRsA1G1T5hcXxfgtnk+azLXhpVRAtJKYCvOQFS4ukqw+5f2sm9Q
 guLZr/jl85WBFXPQxmMMdscSvijLHfe6I4vOjesX7bSzLhkeUk5Le136JeoKGbPAE5hu
 t2AQh6UVbrApCZ5klXWVRz3eIp1CbGeEiPm4zbdZiiVBl8VsWChhG5mS8ka2W6uzIc5l
 zE1fVy2uQ/zXfnLyiQ99LBgsMQTTmuRMX4uiutV53o0+je2zfCr5uS5j7LGk13cCl4q3
 hkwQ==
X-Gm-Message-State: AOJu0YwIZdNOk+XF2Cct7oDXd4DA90lp5rySTBSNPryE2PUtteFkgYfu
 mS+BX94NzI2WuchPFXJ4cNqelC4uxKHenxyAhemmJls2YKh0T5XL99TFQp3LR+5NupY6RDGMhL1
 1xiyrBLs=
X-Gm-Gg: Acq92OE+M/2OX02ffiNw3SSjTNiMgJ28SLjTswQX11BRkjqHmUMF59cT122PSVanPdh
 3CTH/h5+0WygY4EQteY4GQwzgbT+1GzrOW4/4Sk/wSv8gIpgmC+ZhvoKJXE2w87X0iMbUvrYISH
 J6IvCP8BMhHS+gMIvfbsPopVLFDDlHNr7fC3wbt0XKNSmlNkY9UCdCuYJnKeznJJfHKFYlrsYEj
 JRxJKp+642MG4hDJPwK/fwd8g/2dkluownBlNEmzG1cdlb4WzYsU1+AZOzTWh+bd/E3TqUODoUt
 ORA6OunbA81PbwqXMgMQinZKMByMCycYVXK7mn26cEaugfoi7xj9OHLFveP8h0JDgr/3yuG23XS
 qBrKylRM3j6aP4A6kWmAI6EMliAJHe42DnI8mKFDuMmNuJvvDz/oPuQfxQSN77tY4oz8Slr0jPv
 X/06HbtuIugPLKq7USYKZByMuP06bgcHHLoqYQx7JXi0g5p4VBmYxSukHwaM5zS5o6v9r3FdB+1
 L0oSzXhjzWrRHadsx/u+GG/sJnpWplp
X-Received: by 2002:a5d:5cd1:0:b0:454:35b9:803 with SMTP id
 ffacd0b85a97d-45ef6b78b50mr9901545f8f.30.1780229137074; 
 Sun, 31 May 2026 05:05:37 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm18503655f8f.7.2026.05.31.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 05:05:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 14:05:22 +0200
Message-ID: <20260531120522.2310476-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780229137; x=1780833937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJ+R2GC8eFkSWp9S/HV3+rdMo2R+2CPDAFqRB5s+6zM=;
 b=VqhNa3rcB3wQqp/rX03r7y8gwamPuMOYESfTAO0aqMPhLeiP8kTvindIyhiJjKNrnf
 UMo+QCEnf8kTXKuOFR8UWrPU8mRt+aXbuakcvgd0asUJ7MD1k79rKFkjV+PMLYAoFeYY
 1c6UAauXh7QioRZrRQ6+8i1eLKkP3poq8yntUq5XSWS+4g+Oa39IkhmE8NtWgd0Dv2Z4
 LJiLvt6IDlA6Gpip5KpiMArIWmGSk6sd5TTLjNyRJZf8HH+jtDobJYwQiLkhKaIv6ZsS
 j48dT+I/8LwoQzGnN0sihHBqt+zDJoCHMbBCqbWkn1aa8aNTK5J7MDD1lkWz+wcGsERn
 kgFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VqhNa3rc
Subject: [Buildroot] [PATCH v2] utils/bump-stable-kernel-versions:
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
Cc: thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since this script is often used to bump kernel versions in multiple
Buildroot branches, it makes sense to simply commit changes directly
rather than letting the developer do it by hand.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Open text editor when committing to allow the user to review changes
- Avoid using echo -e
---
 utils/bump-stable-kernel-versions | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 6303bf4010..9df2debd5f 100755
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
@@ -101,7 +103,12 @@ while IFS= read -r -d '' hashfile; do
 done < <(find linux/ -name '*.hash' -type f -print0)
 
 if [ -n "${updated_releases_list}" ]; then
-    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
+    git add "${updated_files_list[@]}" linux/Config.in package/linux-headers/Config.in.host
+    git commit --verbose --edit --signoff --file=<( {
+        echo "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
+        echo
+        echo "${updated_versions}"
+    } )
 else
     echo '>>> Nothing happened.'
 fi
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
