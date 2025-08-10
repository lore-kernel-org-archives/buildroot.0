Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5FFC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 13:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E74160E56;
	Sun, 10 Aug 2025 13:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7KnKboMjJF4; Sun, 10 Aug 2025 13:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FAF60F24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FAF60F24;
	Sun, 10 Aug 2025 13:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B870431
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E16A40159
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUHzn8qRiFaP for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 13:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC65B4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC65B4004A
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC65B4004A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:45:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-615c29fc31eso6800929a12.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 06:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754833507; x=1755438307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDlhrX31f3rpwpo/JNM376iWhUtmW3rzLlVRZbQ6vHI=;
 b=Ee4Q0IrdCalTK05e30PsrEq4FiLFvhQTP/jrtfFxgmgWwTinBE/LxJ4xyB6V+w01O7
 DPB/lFmCkkc1zGV5kSVTm/JLLwa8ds4xpr7fzkrZxCnx74KHSXHXs8LOrY5UMcPicztl
 adyr9ztd4bJ6opEA00yJnpCUOiD4XnqmMVA68T0ny6h79VCJI4JfLF8NGo5J3aJcDcwP
 +35rVTVEE2mTq2xJgaTtqDdrgpMtjvRy53Q1lSDAKYYjaNQz74hzodbXTHkEj6OwQ5fD
 WSnLNAoN7NUUeICznPXpVfC/kfZIPTK9DxKAWsQb8RfesWUYuJE8c7bxdpaKk7pynQK7
 pi0A==
X-Gm-Message-State: AOJu0Yz56mqpglwsSbeCdNEJuS8JX1K0wTFyTpZybZ9fELIb34UYBCZf
 uRBEPS02E68f9ENtCRrjueLXS8Qi6BWX2sn1ATKITjQuPAiQQ5Tqi+E4UQiOFzMpL+PJhHxfFKe
 oZvQo
X-Gm-Gg: ASbGncsTU9X4zPHsIFsviOeuFk5NCuWzxu74AbHfpyqvDGUrT4TTt3k58894UBSmmoF
 PJX52ZRGfq2jjZHG6MeRX+DtLHKSzc0xFqHJkrOh88Z3Vd7bymDQwZL4je+TsPW10a2PRMIQ4PE
 2XIPC/cuTiqPqD2yomOTF/f0nkqgGrAwhDnEumJTd62k+m7mxGUHWEKlfqIzM4UtJ+hUj0LVlae
 91Xyw6G6AixWerzwrgyrr5qAuGmC6onzxB8M61Ar45yilO3EoMTnKwPbD9X4MYXjl3j9bWcdW+z
 izSqvCTafPn3j7Gk6/ILld31c3sFGLKachSnmeifJ3IFhzLo4susD5vyhIO7u0nPUMNCjpdy0sM
 4VrQRp4+Wz6GGdw==
X-Google-Smtp-Source: AGHT+IG27tHlRT9fGZBwtAfRSAtRYrsV3kE0crTWBeT9OkU4XY/A7UWfX54SPekfIo8gc4bsLIk2Cg==
X-Received: by 2002:a50:8e54:0:b0:617:91d5:7cb2 with SMTP id
 4fb4d7f45d1cf-617e2c67becmr5314283a12.23.1754833507044; 
 Sun, 10 Aug 2025 06:45:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7a20sm16853336a12.34.2025.08.10.06.45.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 06:45:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 15:45:04 +0200
Message-ID: <20250810134504.489477-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754833507; x=1755438307; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=PDlhrX31f3rpwpo/JNM376iWhUtmW3rzLlVRZbQ6vHI=;
 b=gtKWp9pTA9XX/gVJ5sygEQD/1MIRscfCOwTVMh7t3p7QdH+jE3iP2vZ6jarYP3ENzk
 SALU+B0g00vaiRhoKmFkCd01WXBSxja970Sk37lGjvl6lZ8Z8eN8mpzrtuVNoK6Emquc
 ZD3Se5jlzd5luxZwZ1hQ2wMmgRWF4Z+nSaAEYSt1HV/ySl/63MnaONmMiiFvfGXgPPni
 zMPj3VsBitUcAxD+MhWSeeI5QF0r0hoD3lBK3BDSsKeadCoar3vi/3Fk23ICrJttgfDK
 COpzxEVh0GioI9iOZgGaKsUhmoui6OU5c4ExmsF9UT2mXeU1HyZFUOXUgFqtorQp7MeK
 DaGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gtKWp9pT
Subject: [Buildroot] [2025.02.x, PATCH] linux: fix bump to 6.12.41
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

In commit [1], the linux 6.12 version was bumped to 6.12.41 but didn't
align linux/Config.in to include that bump.

[1] 52f03f832f {linux, linux-headers}: bump 6.{6, 12}.x series

Fixes: https://autobuild.buildroot.org/results/6a9/6a9f7617368d71b810586e29081c5239831b597e
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8a66fd453e..b36f926c18 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.40" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.41" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
