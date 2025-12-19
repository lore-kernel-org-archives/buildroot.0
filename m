Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE80CE668A0
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C97A40F6A;
	Fri, 19 Dec 2025 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gu-gyYNwHUOL; Fri, 19 Dec 2025 22:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFC14030A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184618;
	bh=GxC841fVTgv9g83gz38PNU91vZqFadhk/C+oT2e5XpQ=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NLx+YupWD1HoHa7rYNs3C4fBoO7Y1WUuBGauPl94oWXp93xocXswUe0mNFQBaKUm9
	 9UfFCwRbrfRwSdBb/nsvYnFxDgMdwL0sHkMPW6lWsp2+WugRiMdWG6y0JppTHNi/Mg
	 XmuP+6nJLONExgRnc792Mt7A/gALTS9jSVG/CY0Ka2q6+DSa/O4uMPfQACEXlM58cU
	 aUacmzlNpG6NIGu8KSU3BZiIWmOeCyAzz/mM6YYFDUsUOaqmdKnacV7012a5NgHsdD
	 V6QFskUJT26rVjmEstDQoVl3C1yE1eEu9iXIcSMrqB6gq5a1B9zXku2JN2T4Xn4dMM
	 Wx780YUcaf2GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFC14030A;
	Fri, 19 Dec 2025 22:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F20119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C9960D89
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIDioNo666vK for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5D6C605FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D6C605FA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5D6C605FA
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so17349985e9.0
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 14:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766184613; x=1766789413;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xNHnDdAAvFwGQYhvgq1oL1QVX2jDLTG8eAsw4NTxDA=;
 b=XFHvJivIPd37mdGWcjwU1lFve1N9FVCTF1rRKp9DWrGZ8Nelo2bRmEfKiQf533t0ce
 LnNrWo1E0cZCeC7on+5Bz+lfs7BmkpklFMTmqD98Ip2N99PRirgxAAzOkxvliF8XNrpM
 n3/CCsjLP/FVdH+4d7khFLzCNOVWfAMTHOXEWZ6Q5celjzCzBZzUwtAk4DEZDeJ7qTqv
 BkjpI+araFbNKEhomQd/T/2xeS/sX5BMcqEnV2pI6pK0t8xPVy3qCabK7sQhV1ecSK6R
 i9U6rDbv4z5b6+j6nnutfGSKYx/W4YVLAabZf68bocf/FDgDqxM6DZq9zEHWGi2eAoEp
 Y3RA==
X-Gm-Message-State: AOJu0Yxrw/i16ygxI7PdHUcfz9Ku/8a5JY1iEWnyV/qv5ep2rpqcD836
 lfOqnxJalj5Khqtn6kaj6rjt+di/ovY0Dj0atB59vQpqyrm0cLGLTKCy
X-Gm-Gg: AY/fxX7pwow/UoMP2Hz5y1oPVvpaTnWMtFiQ4QGbyuCFtz8Sq3zQkNx0F9Cd7YAzitM
 5rGusvvudnbx3V6aKXPt/pkPDvHaHud3x+/vPVlGoZWCL7bxmzr2bL37F+2/clyvyMpSOYrzH9q
 Cz3Ft81FwjjA5kR7Kn/IB16oziijETBggOwopQ79LJq9CaJGfAPtqd4AY0D/iE0u3Uzyn7znNsn
 wJOFv3T5p65GurUJZhyLNH7S6x0wIA78Yu7nj098aOsCrFkqdBiS5MZiSvB2YgjYOKEIa1B6lqn
 1DRj7hZad8S7qFC6U+UU5w+0aDJpKCikJN68+wnKYabCt2jsAmFw8w4NS06/nCfRg+Eun1bKZoT
 nGHs9S6DEiSQwnXsNHYXlLKxSx9znqZuiiLEbp8nTeMUJm+Jt1c7ReBzLtb7FRfeVfyR+ENkOSU
 oahyVBrE7DuRj6M/21VW34MlKNOueJrRS/zJJpELorrbIOihnsbaXjQ1RE7OLwwc5z2SllO3M=
X-Google-Smtp-Source: AGHT+IHUtFE15vr145h/GByFsCkf5fFztPtFNOKeRrH7E1JjCywJaeAes1L+4NgBy11OvviDt3Wy3g==
X-Received: by 2002:a05:600d:108:20b0:477:214f:bd95 with SMTP id
 5b1f17b1804b1-47d1c036d6cmr26508785e9.23.1766184612489; 
 Fri, 19 Dec 2025 14:50:12 -0800 (PST)
Received: from localhost (host109-150-127-3.range109-150.btcentralplus.com.
 [109.150.127.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b749esm116081685e9.14.2025.12.19.14.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 14:50:11 -0800 (PST)
From: Christopher Obbard <obbardc@gmail.com>
Date: Fri, 19 Dec 2025 22:49:57 +0000
Message-Id: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJXWRWkC/x2NSwrDMBBDrxJm3QHH/fcqoQs7nriixTZ2+oGQu
 3falXjiIS3UpEIaXbqFqrzQkJNCv+lovLkUhRGUyRq7N9Yc+Y3C2XtXw8g+55llwi/jUytGwgz
 34HKPfA79QXbenrZTIN0rVdXP/2u4rusXu5Ydk3sAAAA=
X-Change-ID: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=/QGbfUCJ6N/pwrH/2YtU3ogGh3wxKMhTdacSefqgRoI=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpRdaeMxi1GYptopOB5nEHhZM18OCDmvQ7Q4fA5
 IQKS5FDIoWJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaUXWngAKCRBjTcTwaHBG
 +O1mD/4i3KsuXmiLTEamEKE87zN5Ju8IZV0eEheykSp7NquWhYBAyqwgYjeSZ/4Oxx600GuNnwx
 WAKZBja/3gwVuI8/uSYzHWX7aB2RjNkc1/i4lJjIgKS4Yuvr+zwyVXrRrI7UYTkmAxq9jHiiOGF
 3TNA0tzjW65gtHH2zvzQ3anvdAVbvqQPbsHd6rJZ84pgTDrPIJqVJpPOlpBYUp9VQb0WPMcnS1T
 jccA7qyeJ40NKWl8FMLvQHLYWhaOEWnDzKeMUvNM1w33mnYKJAZ4CpsiYHoIgBvan+w947lXE1U
 WjZDy247IOC0/ZLEAzGeeiTD9eJ5DO/FDENfBJEktyxfp5bk75r+mYPod/tnMx9OH3VA0kbNovd
 51T1Wt+acB3KcRrMV9rf6pd5iiiRNWWFBoKj4dvBDsWx0u4BoQv1hI/u+Eu/jpvEuH4JnIKjH7U
 9O/eM3J1cKTXJQY+0tIfLoehL0DhAoKzZL/c5aDlRb7tpBeNKV8kblhqiGQpSsx4RiPSmcexaH6
 zBQ6Yfqt/2uT7a4l2pVxNAcfpFtCTehAigOVURw4QC5ov0ez6pYjPMXE3GhK6vrNwlpXv2vPosX
 wwLQBmvVCRmz9p/8mSBqH234XzcYwM64I+8b6Dw/nqIu17qKiwd2jDPTEK6IJhyvGPxnXqwvLWF
 U+HBNiS6wwa7ZJw==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766184613; x=1766789413; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7xNHnDdAAvFwGQYhvgq1oL1QVX2jDLTG8eAsw4NTxDA=;
 b=nkVmp3EmnAKBNa6+gwwmnDszcujZZUGNtN4qHbFeNLqSElVuBG6aYNQHB/nio2WSfU
 vS/ytd40O4cROFGi/hRigJFKZkYcZy5bFb9nF7VDxzVSHuFU4A/jdyFScZw1FBdZA7Ey
 xYgtLXlLXQaEl5MfJBEiRwGpzozAUKCG+05U6kkuJApkKkAEc0/Og+FkOTfzFeVN5WJI
 c4gQO0dAKxDARSyogkRM8T5+XCQUUUFvNGjNwz9vg3CFdeHUm450IkJJX/LsSWzUJPB8
 tCmzGLsBdYSab5jV/iebPyFz/ti/GTBUfmm8nBOztghNWJymIYWPXy8CyILwqYF/qseO
 1K/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nkVmp3Em
Subject: [Buildroot] [PATCH 0/2] Add efibootguard bootloader package &
 example recipe
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for the efibootguard bootloader
(https://github.com/siemens/efibootguard) to buildroot. efibootguard
can be useful when designing systems using A/B slot-based upgrades.

The first patch introduces the efibootguard bootloader package which
builds the EFI application, user-space applications and host
applications.

The second patch adds an example recipe which demonstrates how to use
efibootguard in a typical EFI boot scenario. This may serve as a
reference for users looking to integrate efibootguard into their system.

efibootguard can be built for multiple architectures, but for now this
patch series only builds for x86_64 (since that was what the project I
added efibootguard to used). Support for additional architectures
(including arm, aarch64 and riscv) will come in future follow-up patches.
I expect to do that once this series has been merged.

The example recipe has been boot-tested on QEMU with OVMF firmware and
I have confirmed the image boots & runs as expected.

Feedback welcome!

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
Christopher Obbard (2):
      boot/efibootguard: new boot package
      board/pc-efibootguard: add example efibootguard recipe

 DEVELOPERS                                         |  5 ++
 board/pc-efibootguard/genimage.cfg                 | 59 +++++++++++++++
 board/pc-efibootguard/linux-efistub.fragment       |  4 +
 board/pc-efibootguard/post-build.sh                | 35 +++++++++
 board/pc-efibootguard/post-image.sh                |  7 ++
 board/pc-efibootguard/readme.txt                   | 30 ++++++++
 board/pc-efibootguard/run-image-qemu.sh            |  9 +++
 boot/Config.in                                     |  2 +
 ...e-segfault-when-building-with-busybox-ash.patch | 38 ++++++++++
 ...-parsing-and-checks-to-also-support-gnu-e.patch | 88 ++++++++++++++++++++++
 boot/efibootguard/Config.in                        | 37 +++++++++
 boot/efibootguard/Config.in.host                   |  8 ++
 boot/efibootguard/efibootguard.hash                |  3 +
 boot/efibootguard/efibootguard.mk                  | 60 +++++++++++++++
 configs/pc_x86_64_efibootguard_defconfig           | 51 +++++++++++++
 15 files changed, 436 insertions(+)
---
base-commit: 11d6d10debc81a64de901ec0217b8103c0f366b0
change-id: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
