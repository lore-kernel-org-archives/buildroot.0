Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126F3C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 21:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6302E847D2;
	Sat, 16 Jul 2022 21:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6302E847D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xyNUVDWE7ud; Sat, 16 Jul 2022 21:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9E98418B;
	Sat, 16 Jul 2022 21:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9E98418B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF251BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 156A884168
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156A884168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edDHt8AK070B for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 21:30:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A85484100
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A85484100
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 21:30:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v16so11610007wrd.13
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=momSzj9RjIBsqz1KvwKgheYLYKCUUE4lAAaG7MqIaWQ=;
 b=aGOiKG9QtVbVxEZSeS2KbPwZk0bi+TwO3S66Q+0eJJyhZlImtrnlsbYd6B/7sexVVZ
 AYqzjXjQduiDQClWW0WU+Pgocb6r4BtYSWrcyIpz+wvZ1Ga8yzOtmiBn5k2/mlsK46Fo
 xZ5IjTQ8hOKtNKLXJPEwTp8QxRZSY3ouqjs+fvJPD0ioQwW6BsK5w9VVV7ceT5H9MR++
 HFciCmGDOCNfaDXEkD5Vf/VqkKYCHU52idmabWgrwdYDTjZSgw0IWsgLxCQbb0x/E60Q
 doJeuHtS5D0QqmoLFmNzUN+555Ak9i9a/LMFLp3UxT5xpQtI9WJXmlzI7gyNROL63USH
 PdBA==
X-Gm-Message-State: AJIora9RBL39Jt/LiOV7lQx252Qg4hSM4wjb8btfJS4ZqKeV/Uv5ylyH
 6JzO8PktISPl0g5c/YSnQdJSwzjWfJ4=
X-Google-Smtp-Source: AGRyM1u5Kku46WDPAH3iANt4PC1ShuNikvN+NFMB2YJi+afpRsfJN8QkjOXGDCQVMkwqQQGVSv7oVw==
X-Received: by 2002:a05:6000:156b:b0:21d:9daf:3cdb with SMTP id
 11-20020a056000156b00b0021d9daf3cdbmr17713417wrz.492.1658007003425; 
 Sat, 16 Jul 2022 14:30:03 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a1c4643000000b003a30c3d0c9csm6869988wma.8.2022.07.16.14.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 14:30:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 23:30:01 +0200
Message-Id: <cover.1658007000.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=momSzj9RjIBsqz1KvwKgheYLYKCUUE4lAAaG7MqIaWQ=;
 b=M0f8zI87U0gIFlaU/89vJ/P7QdhOo06qgp3u0D8Pfc9S2tbX4u6TvNrjefXyk4QamD
 da3Uzbbjvtawx95ow2ysdn7efG+4lzJqqmxtReFg5AxaliTmhRuXtef+bOebj/+QGplW
 nP3NLwryGsWcPh8tQgvyzU85v7nqwitxp5o8wOPcrbD5AzbmaY2JxTrjeuM/395zVFmn
 c0a+V+yrOfBCvvz4in31370HZWX+VWSQW6ah1uhWm0fWn7ApdCf4Hz/yasAHZ5Lt2VFl
 Qs/SwzwDe19dMg9rrNnmqSZyE2R4G/Xf8HIcZGkqJDfWkf7HGQaZG/L/T8f+VFe0PxuL
 XDew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M0f8zI87
Subject: [Buildroot] [PATCH 0/2] pacakge: drop remnants of $(HOST_DIR)/usr
 (branch yem/no-host-dir-usr)
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Vadim Kochan <vadim4j@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Back in 2017.08, we dropped the use of $(HOST_DIR)/usr as a prefix, and
just installed with $(HOST_DIR) as a prefix. At least, the migration
information was added as c8f51a00d8ec for 2017.08.

5 years ago.

And we still had a few packages that installed stuff in there, or used
stuff from there.

Fix those.

In the process of testing the change, we noticed that the conditions for
the rustc tier-1 and tier-2 platforms were incorrect, so we fixed them
too.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      package/rustc: fix target names for i586 and i686
      pacakge: drop remnants of $(HOST_DIR)/usr

 boot/grub2/grub2.mk                                               | 2 +-
 package/abootimg/abootimg.mk                                      | 2 +-
 package/bind/bind.mk                                              | 2 +-
 package/compiler-rt/compiler-rt.mk                                | 2 +-
 package/dbus-python/dbus-python.mk                                | 6 +++---
 package/gawk/gawk.mk                                              | 2 +-
 package/gettext-tiny/gettext-tiny.mk                              | 2 +-
 package/go/go.mk                                                  | 6 +++---
 package/jimtcl/jimtcl.mk                                          | 6 +++---
 package/libapparmor/libapparmor.mk                                | 2 +-
 package/libva/libva.mk                                            | 2 +-
 package/lua/lua.mk                                                | 2 +-
 package/ola/ola.mk                                                | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                                | 2 +-
 package/php-apcu/php-apcu.mk                                      | 4 ++--
 package/php-lua/php-lua.mk                                        | 4 ++--
 package/php-pam/php-pam.mk                                        | 4 ++--
 package/php-pecl-dbus/php-pecl-dbus.mk                            | 4 ++--
 package/python-cryptography/python-cryptography.mk                | 2 +-
 package/python-pybind/python-pybind.mk                            | 2 +-
 package/refpolicy/refpolicy.mk                                    | 2 +-
 package/rustc/Config.in.host                                      | 8 ++++----
 package/zfs/zfs.mk                                                | 2 +-
 .../package/python-pybind-example/python-pybind-example.mk        | 2 +-
 24 files changed, 38 insertions(+), 38 deletions(-)

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
