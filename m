Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62759C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E68081213;
	Fri, 25 Sep 2026 06:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdoFzaNX_ciN; Fri, 25 Sep 2026 06:43:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7D638115F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318596;
	b=ODQDQ1zpt1uXqKXoAXXbpsCkP5LSBoPzmdJwkLYKyKzm9QbpdwGuzppPRAR6ozN1fVWp
	 P3LUSzOMYTPWlu1c6XKGr59d7m3t2FZF6BDxoISsRg0nOWgQ17GXsn6BOf6Ln/+f/Hry2
	 VFum3EvydgixskjVr9R22GRojK3KJiYtpIyD/mjNxh8iw+9cN+uMAUcu7Ba+EGvp5Kusy
	 FcHNK81IgFD4v4y8ep5Pc5rZx4uF3IvPBbIYamXpVpsmNwPbiBeE2vfajOVPwQgV7c/g9
	 JUmmsjYRqvgZh1oxtCxTP7mkffFTpqjGE82NFFhUpgYC6TTjmphF8xq3dlwwKqcMw7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=j9OBAhbG0JWdpI6ntnfQ5nvGfzw88eVDscug+Pvp7Mc=;
	b=Zccorm9wXeL0AvN5agJC9/F0GvyDY04sq7jlN0LnsFe67y4qwzzDU3Lhap7tdD8iZG/I
	 E0+r1TALkhv6JhDzJ3fn5F5SIcXh2Of/1Kc22MQ78gQesT4uGj/dE8oxY3r79sZXCGUnM
	 Xd8EXMpOOLzDFL8WcdKwPK2cnrzIpKvWRh36yF4uLqsnJpd00/FHuDwi1/uM0sX0/Cbo4
	 0m0YNUhlsVNubNSVWUmOd0kCr6HWPRwtGWAe5OnwNTpIPtsQQWZs3HQ3ALtpl924fpTB1
	 2NUQ5fLSvfBbhQHzB5ykvClJKdNp1m9vmwTuVJvXUtMHitbYjjqWa8PRV+bEgP8G1Nw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318596;
	bh=j9OBAhbG0JWdpI6ntnfQ5nvGfzw88eVDscug+Pvp7Mc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mpxbkG1aISS4q8PEMqBV37m1zdTBxy00vhJmrd5xB8luHFoIiNJFKJy14I8fBZ1nK
	 CASklTAQl2xyH57Np8R43WolwDZVrlFiCf6OG9kdokb3GrVgz1Pgibhwv6UuQuNjVI
	 /w0lohiKSBq3e+FB1GaYZSe1sach3pfdsKXNi6rWynV7FDyxDxZT0peOr9FKQH39+e
	 o8bfg14ZNuMCUI4uD6gtbeQ4PaBXMng+uEsr+75WqUGr4TJpv6DYZZTk0+sOp8kTsx
	 Tj7ZfMHZ8XQHT+r+SY3D9UdCxBa/uaSHNLCHrXj+y0eMmoL5kxefixAbUWaEDK9++X
	 BIJ+Rdjk62BHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D638115F;
	Fri, 25 Sep 2026 06:43:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ABE732F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C87240848
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIZrpsupKVXl for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E0BC84083D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318592;
 b=pjpcpZX9N/90OZ+xofmZZLv9uDtRrkB+IQlb23ZBmUnUxYArQPT8tKmxc14ChFxiXjsM
 W4itL8IXi0w1UM0/3V1SMOuDvYojhKA+o4vWcFfnppWS8ffuQaO/3OXy6afo4PtSXe5BE
 ApaDZ1Gj/yE10AuFY21tHl1ZykH7ZQxIAay5vv3joeqAwWcHPR68htzqkQtjwHMCpc5dL
 ebaifiyxS21xWDujqOg1xk39vNvM4KJLLpjv44JDQ6tu8H6T2TX2Fiu4iG76tD7eDrsfU
 CLkoku4hXgFMYwAFyeJlof989BEwTkGhHCK0T+dbz9rXqwdMas6JIh3NSKfpid4rSeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318592;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=20auQNm3uDX8WZ3w7I7my/2cXqw2hZACGqb8ZiB1RLY=;
 b=TgREk+c6BqTvesSq2TRm68JU/NS+KD14nwlA2n1EWd6d3nuesH0JMZe8dErLzvUK+Ugh
 Yt/jPPGoJ49blPzyOKZh/YSeOZvJpGGDu4T+hS9+hE2jL0+0RFKA6Pz3yRmZEQaKWsEgY
 bn3YF0JozlSm2KnbLJmfn62YnrhlXfndsxgIz1oLwF3pQU4d3YFGRNEvCEYiXsflnw+9R
 L8nsuQy0ot6ko1YYEqFvdpVHmfmU2nbTk4m2+N4ktX4NzeEAGF0OzF0/i9BbOeAv7VVvI
 yKhEALarRIa7T2R9R2kGufZSB6IeAbQxCPJlKPvYoQv5VABcwsZo3qmzMbAPQv76l8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JA1qjGRM; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JA1qjGRM
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0BC84083D
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:11 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso4299405e9.3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318589; x=1790923389;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=20auQNm3uDX8WZ3w7I7my/2cXqw2hZACGqb8ZiB1RLY=;
 b=JA1qjGRMzxY8z9mV6pzr3BJudZeq0D4CqonwTI0efwcjShrj65PXJL0xJmIUahKZCA
 06qatCyiM1bIHJbzUFNTjEgxYGfgsc46ctcdANno3Kkqyp4dkIZ7iIIIENznCR4g0TJj
 unUZ9onqi7eFopnNFHHbGCB6yv6j39TH1qw2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318589; x=1790923389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=20auQNm3uDX8WZ3w7I7my/2cXqw2hZACGqb8ZiB1RLY=;
 b=MGbDyW1EfxPR6UuPcO3fgPvBj65ybaRXLa0n0Ld8xAa+JbQw7DKu/M/sti9GF8uKGf
 xic/AxCgjOTosJ3XqKPal5kspm2jAPZD7txz4P/6VLFhW2VEyHA5MKzW3jL2WvVUYh8j
 JxkpdrsRXoyhXFroD2Js784iYKCrs6l4dVEfuIQAPkD6D0kreWn7Cn3VEoiACpcScF91
 NARbeWOh1/q5HCfHWOBCGQf6zcOP/sAq5A7+Eh2J0Peby/C2ZTObdrdW3lY8KMlzVoMY
 HGuXadrZ9oxHRvi4x+UX//euqkt0voPxdKPsDLNWtqc5Ph4ykHTMQSpBw71eGfDaPUlk
 nTWQ==
X-Gm-Message-State: AFuF++kE4h4hlJ3ltcC/6/rNITuNkc5lLRWXen2tpYMsXmLsddgfCggY
 tmciwmH8uNmxjdeM0IkecELd7oPYPLfgF78DhS4xIXwnKPbq8JpAKFi2vqTIve3DdCZpgZGGZrX
 try3jhm0=
X-Gm-Gg: AYBFou2bXOg4WtHNRuOl8NT7XQRGGWwYrQE3+cxd+K/ModaH3BeTkzmJeDSlTLoKLyQ
 jJWwJCLH6odTxKrbIB8gyEcPF1g3lVhAjqJzof2d3JPqVWM9KFmN10eycb97KT701exSS/Gayo1
 77aKJWPy+xujU0BGukRJxrR4srplDZxH9pdMHsSKdJRZr8drTK00r5V7eXl0F+2KKvAG8a9zGJg
 p4jjAFbnwMih3AetuPLISWltP3CgYN4wsFxvLR0LSMJ4mW02BoT3r4CZl/X0uHwtZUpRITE+AvT
 2bPoq/GUvCdATL7JCjmRy23dP3ZH5WowHVNqlddfZLWYZTWwZB6sP9jdCPWE5Pl5Fa/X/9RQVbj
 0PtM/w9dgltrffwiwDL4kGc3HrmBRSjyIdwCk8s0zApIxiFjCjfGxrVPKsFx3MzvUgOGKS+ZkzC
 5cqvZSeR2uVbXCDNnbI+S0jeCJc5PUOqJ8gHwCprxSydyagdBZrzkYwGH02cyEuoT34DK8AMyKH
 uOK4dn5fm7uNrfOoSz9L1hEVqLGca7fRipPjDEiXVUH1pl3KiSH0EvZfDl0xGIWQF8TTVC5oJUj
 c1lr+u9CdcQlrPGw0LqlMDDi4zqKDQpFsju30yJ5ZbcS+yl5CNOe/sZQfKky7aAlvFXOCrxl
X-Received: by 2002:a05:600c:3556:b0:49f:bd3c:bc24 with SMTP id
 5b1f17b1804b1-49fe6708a46mr80091765e9.31.1790318589574; 
 Thu, 24 Sep 2026 23:43:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:52 +0200
Message-ID: <20260925064257.1162394-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/6] package/qt6: Add qmake functionality
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

The qmake functionality had been missing due to the new host/target
build requirement, to get it working the main parts of the qt5 qmake
has been kept, we're still making our own device spec which we use to
run qmake with along with passing some additional device options for our
flags/cross-compiler.

A big thanks to Angelo Compagnucci for the encouragement and testing.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Richard GENOUD <richard.genoud@bootlin.com>
[dario: fix HostData and add the target install dirs in qt.conf.in,
quote QT_QMAKE_DEVICE_OPTIONS, use TARGET_CFLAGS/TARGET_CXXFLAGS,
change the commit message]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v5 -> v6:
  - Rebase on qt6 6.11.2

Changes v4 -> v5:
  - Add ArchData, LibraryExecutables, Plugins and QmlImports to
    qt.conf.in
  - Quote QT_QMAKE_DEVICE_OPTIONS
  - Use TARGET_CFLAGS/TARGET_CXXFLAGS
  - Drop the redundant mkdir in QT6BASE_MAKE_BR_SPEC
  - Add Tested-by of Richard Genoud

Changes v3 -> v4:
  - Drop QT6_QT_CONF_FIXUP
  - Drop -@EGLFS_DEVICE@
  - Update the commit message

Changes v2 -> v3:
  - Drop package/qt6/qt6base/qt6base.mk.save

 package/qt6/qt6.mk                  | 12 ++++++++++
 package/qt6/qt6base/qmake.conf      | 34 +++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h |  1 +
 package/qt6/qt6base/qt.conf.in      | 11 ++++++++++
 package/qt6/qt6base/qt6base.mk      | 14 ++++++++++++
 5 files changed, 72 insertions(+)
 create mode 100644 package/qt6/qt6base/qmake.conf
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index cff9f5fbc73f..13482c33cc4a 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -12,3 +12,15 @@ QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)
 QT6_GIT = git://code.qt.io
 
 include $(sort $(wildcard package/qt6/*/*.mk))
+
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install paths
+define QT6_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
+endef
+
+# Variable for other Qt applications to use
+QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt6/qt6base/qmake.conf b/package/qt6/qt6base/qmake.conf
new file mode 100644
index 000000000000..e0d53d755d41
--- /dev/null
+++ b/package/qt6/qt6base/qmake.conf
@@ -0,0 +1,34 @@
+# Qt6 has a mechanism to support "device" profiles, so that people can
+# specify the compiler, compiler flags and so on for a specific device.
+
+# We leverage this mechanism in the Buildroot packaging of qt6 to
+# simplify cross-compilation: we have our own "device" definition, which
+# allows us to easily pass the cross-compiler paths and flags from our
+# qt6.mk.
+
+include(../common/linux_device_pre.conf)
+
+# modifications to g++-unix.conf
+QMAKE_CC                = $${CROSS_COMPILE}gcc
+QMAKE_CXX               = $${CROSS_COMPILE}g++
+QMAKE_LINK		= $${CROSS_COMPILE}g++
+
+# modifications to gcc-base.conf
+QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
+QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
+# Remove all optimisation flags, we really only want our own.
+QMAKE_CFLAGS_OPTIMIZE       =
+QMAKE_CFLAGS_OPTIMIZE_DEBUG =
+QMAKE_CFLAGS_OPTIMIZE_FULL  =
+QMAKE_CFLAGS_OPTIMIZE_SIZE  =
+QMAKE_CFLAGS_DEBUG =
+QMAKE_CXXFLAGS_DEBUG =
+QMAKE_CFLAGS_RELEASE =
+QMAKE_CXXFLAGS_RELEASE =
+CONFIG                 += nostrip
+
+QMAKE_LIBS             += -lrt -lpthread -ldl
+QMAKE_CFLAGS_ISYSTEM   =
+
+include(../common/linux_device_post.conf)
+load(qt_config)
diff --git a/package/qt6/qt6base/qplatformdefs.h b/package/qt6/qt6base/qplatformdefs.h
new file mode 100644
index 000000000000..99e9a2792329
--- /dev/null
+++ b/package/qt6/qt6base/qplatformdefs.h
@@ -0,0 +1 @@
+#include "../../linux-g++/qplatformdefs.h"
diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/qt.conf.in
new file mode 100644
index 000000000000..d1d2d9490fbb
--- /dev/null
+++ b/package/qt6/qt6base/qt.conf.in
@@ -0,0 +1,11 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
+HostData=@@STAGING_DIR@@/usr
+Sysroot=@@STAGING_DIR@@
+SysrootifyPrefix=true
+TargetSpec=devices/linux-buildroot-g++
+ArchData=/usr/lib/qt6
+LibraryExecutables=/usr/lib/qt6/libexec
+Plugins=/usr/lib/qt6/plugins
+QmlImports=/usr/lib/qt6/qml
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 01661b7f01d4..032947417259 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -436,5 +436,19 @@ define QT6BASE_RM_SBOMS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_SBOMS
 
+define QT6BASE_MAKE_BR_SPEC
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qmake.conf \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
+endef
+
+QT6BASE_CONF_OPTS += \
+	-DQT_QMAKE_DEVICE_OPTIONS="CROSS_COMPILE=$(TARGET_CROSS);BR_COMPILER_CFLAGS=$(TARGET_CFLAGS);BR_COMPILER_CXXFLAGS=$(TARGET_CXXFLAGS)"
+
+QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
+
+QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
