Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210B0C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57365040C;
	Wed, 19 Feb 2025 08:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mafNNRp9ueCk; Wed, 19 Feb 2025 08:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8920650406
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8920650406;
	Wed, 19 Feb 2025 08:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF57127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA3260671
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOqCevziemZs for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BC2560071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC2560071
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC2560071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2874949f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955056; x=1740559856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FgVPa1PR5RjwYkrnyxO+pi3E0XI1VPul+rH92Ch+NQ4=;
 b=LgWhVW/DWGosEZ9YbryBwO0fKECz2PLOAt6DFmxFVkJi+r1H77cig8e1JnVGO2ov5l
 uNkOryzWgyBjI8nFOWHvCCRkBS96GRCKjbmhL/0+Ha/uXeb5fNWZNzF7IS3rX6U+Rgoo
 0HqvImPMLGzBt6PzfatZPF8TpQJDNN8FnJ5qkIH2b+gDdKnLJJZdHR2nlbY6H8uQe1qm
 6MtOZmGBz3Bfv9agG+dsqtc7BvSseSsL5ChYpLrV0my6v1zXHNX86qfWOxrffHxfhmH0
 FqHKMYzvq3BX3xrnL4BLWUUKD94bt7HB+VtRriUJjbjRc8U5uNm/H2U++P/Nzsu0GjbN
 3qew==
X-Gm-Message-State: AOJu0YzP2af2sIZf5zSd+V/WvsCgQCrliM10kPI2UsQbUWyutp4qZUkr
 nkQJnMPwGqU2krn69CGinCOGau2fLhYTKc36F186VtsczLHleJAOxDGsBg==
X-Gm-Gg: ASbGncu9mhRBeHj3XtvNzH9/9bkr2alk7rtOYrku3wllM6ZFiwEXoAjRH54jwW2pQWJ
 MoKNvGOg5ojfoVsmHs9Ct3deku9pV1/0ZOFRO8EJnapXGzWPtwMJGaG5XsOr0E8D9QFVlTCLK2l
 rZe154EGQkFtwlpDfHkZiU0WSeVnuhiVIlnBtWNf8f5zoo9ezn1CYqvpL+76RD39kNa67ib5N7n
 +1dkFuHkTYvFP7H7JkdpJ8zWiNZcqI8GZCdWNihrnlcyno82ToBbkrf/YaQuDK3KxqmX1ZygD5W
 2eIuhCrnmGtSghryPg2Y1h993g==
X-Google-Smtp-Source: AGHT+IG3byi0Z7ybjT1t9GoN6/dyKywRWd6PI9mnhfSS/0/i95Jkw31XEUHL49JqoJk1WmNiRDWgdQ==
X-Received: by 2002:a5d:64e3:0:b0:38f:452f:9fa9 with SMTP id
 ffacd0b85a97d-38f587833f9mr1903647f8f.2.1739955056056; 
 Wed, 19 Feb 2025 00:50:56 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:55 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:35 +0100
Message-ID: <fa7d9aa10a706ec7d64f59ccff0a0b69e47c9179.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955056; x=1740559856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgVPa1PR5RjwYkrnyxO+pi3E0XI1VPul+rH92Ch+NQ4=;
 b=iSHLzx9HAn9F6hgWzBdRt+k5lkHH3gcwzrUsUb/c1n4on/Fj4MSy2GQpQ3tXHmLfCg
 XrH+DRckXWxk/lhui3Az6eLev2bl+MsPWtmKRqt04zoR0UPOc1cJdhO/YI8611wLavcg
 +scD2cPeBGl9NSriXS5+ywwPbqPYTTDD41usO1XLXxnT0h5jYHhPBWb1dlfIumLdKLcY
 gZv1jgsHIPa5bDOg3VqPpwc7KxDrwAKDnENCshJBTVLmnQ6t9xA8GQOftGJhtymZhRuH
 u7/055BY/U87cTnZGjEEC90eIxdRbVFz2nXDJ2rOvfEfVvDaEiyhdpXmp3OUnGqPhHWX
 nLOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iSHLzx9H
Subject: [Buildroot] [PATCH 20/27] package/boost: check that known libs
 match Boost's list
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When updating Boost, it can be easy to miss that new libraries are
added, or that older ones are dropped.

We use Boost's ability to list its libraries, to match it against the
set of libraries we know of. If they do not match, we report missign
or dropped libraries.

To get the list from Boost, we need to call 'b2', it's buildsystem.
However, that is only created after a successfull run to bootstrap.
But then only the set of _configured_ libs are reported, not all of
them, so we can't do it as a post-configure hook.

Boost's bootstrap script also allows querying the set of libraries, but
that takes a bit of time as it will build b2 first, and that takesi
quite a bit of time. Since we need to evaluate the variable multiple
times, that would be a bit too costly to do a simnple assignment with
a shell call-out. Thus the slightly elaborate assignemnt, which uses
memoization to run the shell call-out only once.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e849f902f2..dbdf539092 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -142,6 +142,34 @@ BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$
 BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 HOST_BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 
+# Check that all the libraries that Boost may build, are actually present
+# in the list of all known libs and handled by Buildroot.
+BOOST_B2_LIBS = $(sort \
+		$(if $(filter undefined,$(origin BOOST_B2_LIBS_X)), \
+			$(eval BOOST_B2_LIBS_X := \
+				$(shell cd $(BOOST_BUILDDIR) && \
+					./bootstrap.sh --show-libraries \
+					|sed -r -e '/^ +- (.+)$$/!d; s//\1/;' \
+				) \
+			) \
+		) \
+		$(BOOST_B2_LIBS_X) \
+	)
+BOOST_MISSED_LIBS = $(strip $(filter-out $(BOOST_ALL_LIBS),$(BOOST_B2_LIBS)))
+BOOST_GONE_LIBS = $(strip $(filter-out $(BOOST_B2_LIBS),$(BOOST_ALL_LIBS)))
+define BOOST_CHECK_LIBS
+	$(Q)if [ "$(BOOST_GONE_LIBS)" ]; then \
+		printf 'Those libraries known to Buildroot are not present in Boost $(BOOST_VERSION):\n'; \
+		printf '  - %s\n' $(BOOST_GONE_LIBS); \
+	fi
+	$(Q)if [ "$(BOOST_MISSED_LIBS)" ]; then \
+		printf 'Those libraries present in Boost $(BOOST_VERSION) are not known to Buildroot:\n'; \
+		printf '  - %s\n' $(BOOST_MISSED_LIBS); \
+	fi
+	$(Q)[ -z "$(BOOST_GONE_LIBS)" -a -z "$(BOOST_MISSED_LIBS)" ]
+endef
+BOOST_PRE_CONFIGURE_HOOKS += BOOST_CHECK_LIBS
+
 define BOOST_CONFIGURE_CMDS
 	cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS)
 	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
