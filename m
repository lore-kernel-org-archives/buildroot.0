Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED806CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E5582183;
	Sun, 31 Mar 2024 00:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsKL74G9J0RY; Sun, 31 Mar 2024 00:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40EB58219C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40EB58219C;
	Sun, 31 Mar 2024 00:42:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F35071BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E01E360622
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCVsB_CBboaW for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE93660611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE93660611
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE93660611
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:59 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c8b777ff8bso97951939f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845718; x=1712450518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAQovp2pP9uWY1RKgs/JXJhJZs6eU+yRrbQmJYY1xY4=;
 b=JjJw61ZcvxEkiE/IqbiRaW0N59he9X5RyUOzWSALBNAfZNf06sKTJfiO5WJGBDmY+v
 1mIn4FHo5MMWAF3J24iIGZEXYBc3LTylbfSFB19LGiSPm0cKJrmjBc7qUzD5nuVAsvWJ
 oHciaRPKx5kv+ARfkJCpzDVVfQruX9iV07k08JwEXW/ep7Bdn6A48Il2uLHogp67fyr+
 be9A6Xu7ckPA1hEUcqWisbvBzfA59SaXXe1G0OuOnOeNaVxjdFaXZcqXMVyrECY1+w7z
 LeaRiXXJLjGpghPNoHh0zA2qvJ1Mz6nR15A2uEmmvJ0j1xxNYvb6Sgjy5OuahGB8yM1w
 mFMA==
X-Gm-Message-State: AOJu0YxcAuPKn23+XYdV2/832MGUEpxXMaE10jz+AHNQugEz4oWHxYMi
 uTrhvS/T4ntYnRCJ5uJM+6MDPTb4WiIlZ25v9zLFLwcCDdZHwd2P5IpJYFuJkbpPtA==
X-Google-Smtp-Source: AGHT+IFDQ6qWvQftRhTHnmKXZcY9iIgkqmGvg7+UP3oJSqbV5A2VCqZyJXchsWgYbyERmuNFOAJ4xA==
X-Received: by 2002:a5d:8786:0:b0:7cc:fbd:270f with SMTP id
 f6-20020a5d8786000000b007cc0fbd270fmr5564810ion.6.1711845718329; 
 Sat, 30 Mar 2024 17:41:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:22 -0600
Message-Id: <20240331004133.636618-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845718; x=1712450518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAQovp2pP9uWY1RKgs/JXJhJZs6eU+yRrbQmJYY1xY4=;
 b=asA8Qy93OzH2bcvmf4GHZ7FqFmx4j2Si7bneSOSX1kt/mooTKFcYtUowTzhPFnGurn
 kRKGdRWdR12dXnmq93/s9J0jpvMtHUEgGx927m6Dynfi+R+8DvZ5mlHNPhR90372qAjT
 H0Advq9qmy2o/33iCfPZdTEiFu8U91He739TVzX+0gL6kenwTSR8mlXUfaCp+fNR+SYo
 F2SL36Gxqx2W7oo5fLnjx37Qfl+ndAmKIqi76nc4+3WdhpglJnvc/cT21206qUqRtYsa
 taW06IgtVgnLKFSepFqtZSyPLAfCNi50T3mRIIZLCS/dIkU9RLMCwCsqSTfW7DMp3hsY
 55HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=asA8Qy93
Subject: [Buildroot] [PATCH v9 07/18] package/python-frozenlist: migrate to
 in-tree pep517 build backend
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with a pep517 frontend we need to use the specified
build backend as opposed to the fallback setuptools build which
only works when not building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
hatchling and not setuptools.

The custom in tree backend depends on setuptools and expandvars,
additionally it depends on cython 3 unless disabled.

As we do not currently support cython 3 lets use the pure python
build instead.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-frozenlist/python-frozenlist.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 9333598808..92670b3cbd 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -7,8 +7,12 @@
 PYTHON_FROZENLIST_VERSION = 1.4.1
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
 PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085
-PYTHON_FROZENLIST_SETUP_TYPE = setuptools
+PYTHON_FROZENLIST_SETUP_TYPE = pep517
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
+PYTHON_FROZENLIST_DEPENDENCIES = \
+	host-python-expandvars \
+	host-python-setuptools
+PYTHON_FROZENLIST_BUILD_OPTS = -C=pure-python=true
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
