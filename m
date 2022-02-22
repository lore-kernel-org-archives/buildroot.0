Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B77BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D4381A46;
	Tue, 22 Feb 2022 10:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlWB4PJsCDm6; Tue, 22 Feb 2022 10:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA108174F;
	Tue, 22 Feb 2022 10:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85B471BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 745864089A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0onG6vmLP8qr for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EB5B40892
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z22so35698504edd.1
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7AdkT2B7JDaw4OI2yekDde5Y9paKRklbRbLnYWbz0A=;
 b=GJOl+8mTt8ZhwH+agNVom3egZ2ejWtYDrYkQ06kpPZOnHI9sshzpErCHFp6Bn0yOtN
 tYkfB2dP0zMl+WCJyePmh1FTfJ8+HlofFF76Ghe91M/+c3cA+KYAuRYDgt83Q3Xz3XWc
 J1SBp9Zy083DRLQENdUcWWWm1Uzu9744i/mzKQHjX8ivQ0hCipMvj10kUF7qTmunq+yB
 uk495ChONtOdQTqmSetL/rtaEqI/Ne3MVXANITvDdHiJycBkQOR0Wwm5m/uHiIFKG8jQ
 RcZFrBP4IeedMw3il5VQgKZV9DVFWbL4x5RYsfFKY9ub1gp8IGsAm8FKmS4+7O8RzHsu
 2L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7AdkT2B7JDaw4OI2yekDde5Y9paKRklbRbLnYWbz0A=;
 b=dTQndnEgD7uppvGtgCe8Y0U/biYniCzVC4ZMzNDk1VmYGWCItR/XujzrbsClzZabsq
 gT8lEOj+CMXwXH0iy/q6Mk38ywUhpvBR7VbuyMBJun1rAHHJ9APiiilxTliADMZgMLEw
 PjaDKbDlG9zymaWHFjTyomkOsw9tycuMfvd8e7r1MOjPaSfismYOIbjgb+xK58MeX9az
 hrJDKfZhcEctkvAM02r4LuxeBrHGhkBATLG53ngFHQx9+AoORzOPzFzmPb4K4FX2+kgQ
 kl7mVKuuhyz1/DUgytU3TAe6OZyT1SXIVyTMFpS5LZqyytzPsAaFHaO2nKFdvlPPBb/Y
 MIyQ==
X-Gm-Message-State: AOAM5308UBzLfYb66MpM14xb1xBgYEl5dCzK9lgQPBRTgmIIPfIjgbd7
 JrHdvsKcuU+iJZGCWXxBLMGkPTVuTvtbbw==
X-Google-Smtp-Source: ABdhPJwVnX7XdXJHgnNGACdh71vVu3C1cssLBCeXsklrhJjVaE0t9/MwhCQZGVqxBOOBD8hYJQsFRA==
X-Received: by 2002:aa7:dbd6:0:b0:408:4a31:97a5 with SMTP id
 v22-20020aa7dbd6000000b004084a3197a5mr25995062edt.186.1645525340735; 
 Tue, 22 Feb 2022 02:22:20 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:20 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:03 +0100
Message-Id: <20220222102211.74573-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] Patch series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As is was suggested I pulled my patches in a series,
this should combine most of my open work.

It does *not* contain:

-   toolchain: support mismatched merged usr [1]
    recent enough

-   package/dbus-broker: new package [2]
    recent enough

-   package/openssh: improve integration for systemd [3]
    outdated, no time to fix it


Patch 1 and 2 set the runstatedir for CMake and Autotools (new patches)

Patch 3 and 4 are rebased and adopted to feedback.

Patch 5 contains a better commit message

Patch 6 and 7 are new


[PATCH v3 1/7] package/pkg-cmake.mk: use /run as runtime path
[PATCH v3 2/7] pkg-autotools: optimistically set runstatedir
[PATCH v3 3/7] package/systemd: use current tool for generating HWDB
[PATCH v3 4/7] package/systemd: remove hwdb-update service
[PATCH v3 5/7] Makefile: remove /usr/lib/rpm directory on target
[PATCH v3 6/7] package/zsh: Enable dynamic modules
[PATCH v3 7/7] package/zsh: enable static regex module

[1] - https://lists.buildroot.org/pipermail/buildroot/2022-February/637079.html
[2] - https://patchwork.ozlabs.org/project/buildroot/patch/20220109221650.777610-1-nolange79@gmail.com/
[3] - https://patchwork.ozlabs.org/project/buildroot/patch/20200611091407.12688-2-nolange79@gmail.com/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
