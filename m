Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EE7C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DE30611ED;
	Mon,  6 Nov 2023 19:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DE30611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIuQz-Naos5H; Mon,  6 Nov 2023 19:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955A461187;
	Mon,  6 Nov 2023 19:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955A461187
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683861BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A2A941FA2
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2A941FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaBCOmRDapmV for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:09:16 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5ED140876
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5ED140876
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40853c639abso35705515e9.0
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 11:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699297754; x=1699902554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gw9ydOBLIdFwQfM9+FhUTvf1+7iwP0vZS3DtI8gFQCg=;
 b=Q6VAegrh0YcMjQyUjNHiZ98HJA9Wv8DKtWFcy1/jn9zxuXfmaCR7YpMABvZ4RUQQ3h
 nWLU7hhGgm+qoWSfB7eR5jO2k6Bq10iXLH6OovC7krr93i3GcFgRNNowlIUvbBK/J8xO
 EXo6f5EQAV4VeVeqiVbOmeHsypay/cLPFO3qRhH8KEkfnASv3dHOWqGEZ6ANDRBfKRQW
 ACYvANF3ZOx8C+Po6/PQD4Ek2p6g3qF66CFhu7fjDJEbKbJD+bB+iP2q/i4o7U0b/WmI
 8FffOptVPQYIa6xQb7z/94MIjxID4tLEh8a4iIczyBnbjcDu6Z9WYpmOyEJftdzz1Q+v
 s12Q==
X-Gm-Message-State: AOJu0Yx/YxyhtYkxnr+kcrKPWFWMQrlZGB7YDJAVhxQOUqC85dOsqhDW
 QhJxqMN73CQbHT1nP0Jp7RsvxcuRSqk=
X-Google-Smtp-Source: AGHT+IFow+41YMpMYPy1/ufw1sKbs2NukOvRWMMB/Rjr+5FoOXXDgMGUVr28Yy/OetaJjfaNl/0+yA==
X-Received: by 2002:a05:600c:1393:b0:40a:20f3:d127 with SMTP id
 u19-20020a05600c139300b0040a20f3d127mr471419wmf.35.1699297753489; 
 Mon, 06 Nov 2023 11:09:13 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 by smtp.gmail.com with ESMTPSA id
 dk11-20020a0560000b4b00b003197869bcd7sm359631wrb.13.2023.11.06.11.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 11:09:12 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 20:09:12 +0100
Message-Id: <cover.1699297749.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699297754; x=1699902554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=gw9ydOBLIdFwQfM9+FhUTvf1+7iwP0vZS3DtI8gFQCg=;
 b=hBpeCKmhOEtpFOIJ6pwgDGsfj6HPCoQXc1prUYcl2TYAASJAlyW8qLxg+yRxgIxNHW
 Ojq76rj9iK4mgGDI5YLF4RAvhP6QDFvA938unbT20t8DQFlY9I3VPpDnkQzzSavkErGO
 vadG5Tz/dury+U2YUWjJRuYVj+DkHrHPxf/TV91MWEDWI1Ts5FRaMfhX+bkpHSnxM2mc
 To+fm3B6BafJrH9T0/JZcbW6P/Vqc6He71cl4bEvcq8AzsHwR530PhvxyOBkMd3U0GRI
 ijl2XKPyhvmQjA3dL/WlQTsb0inHL7VF/CI3rh4wz72SujQ9GOonEy5lWd4iD1nCVXhS
 48sA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hBpeCKmh
Subject: [Buildroot] [PATCH 0/3 v2] support/download: accept user-provided
 list of extra hash files (branch yem/multi-hash)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

For packages where the version can be specified by the user (e.g. with a
custom version string, a custom tarball location, a custom git tree and
changeset...), Buildroot can't carry hashes for those, and thus does not
check the integritiy of the downloads.

Add the possibility for users to provide hashes for those, by leveraging
the global patch dir setting, to look up extra hash files in a way
similar to how extra patches are looked up in there.

Users who provide such extra hashes will most probably be interested in
ensuring that no download ever gets used without an actual integrity
check, so also add an option the requires all downloads to have at least
one valid hash (and no invalid ones, of course), rather than ignoring
downloads for custom versions.

Changes v1 -> v2:
  - restore legal-info  (Peter K.)
  - drop all.hash

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      support/download: teach dl-wrapper to handle more than one hash file
      package/pkg-download: lookup hash files in global-patch-dir
      pkg-download: add option to enforce hash checking

 Config.in                                  | 27 +++++++++++--
 Makefile                                   |  2 +-
 docs/manual/adding-packages-directory.adoc |  6 +++
 docs/manual/customize-patches.adoc         | 24 ++++++++++-
 package/pkg-download.mk                    |  7 ++--
 package/pkg-generic.mk                     | 14 ++++---
 package/pkg-utils.mk                       |  8 ++--
 support/download/check-hash                | 64 ++++++++++++++++--------------
 support/download/dl-wrapper                | 10 ++---
 9 files changed, 108 insertions(+), 54 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
