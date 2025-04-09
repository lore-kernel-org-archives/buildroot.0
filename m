Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FCBC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA4861AD9;
	Wed,  9 Apr 2025 20:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_Q-qOtEJK5S; Wed,  9 Apr 2025 20:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3707461AE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3707461AE0;
	Wed,  9 Apr 2025 20:04:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13CB7220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BACBF61079
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IL47JET1i7u8 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E25C8617BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25C8617BA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E25C8617BA
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso884375e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229034; x=1744833834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pr1i3A061aCWfhMs+lIIHTdeuHVYDPEY+cur7F9xIbY=;
 b=lLG9+khpqhWAMd0NdyS5HMos/7nBBSeVv6S7SLEYF68Qr+crqa1/tqe2ozH76tonRg
 Z3HbPZfmOlfkF99S4lhJQrRV8g6Vlf+9ZA0G+WXp0x2ZocJTzZitkV3D8eU1rZyfXKXp
 B8O9aMXSYYMHAT1rQXhYdl4l2KGBxGVbKr8D22UULyPjH81vXxJkoxNGoAtFxObNhwJa
 VZDVgiZ7EbUM2LFghAr0D1E31PcrxjgU5Nl1V/K9M4J2797nm8b8Qqjv+yCMa3KM3EiK
 /Y92SVcdwM/exvWUE/qQrs+iTylBh5+Bfc1++sKjUb47bw0zgfroJUxAN3+r6+hAOjvK
 pC+w==
X-Gm-Message-State: AOJu0YxOPpaCfs9yxWmg8+0bcNDNKgYcSKoHUcOvwNbN5sVyxkQHWa01
 KcEzHOyO9GDcFonhVEhJHl523E+S5mi2YeTcWOOulUHn3CHXAlwbiJfjlA==
X-Gm-Gg: ASbGncsVSVXb/QuwZCLGKf+2UPFS1QAUMfafHJeAAUIk7mJcphPPpyaw58EsKbsWxhi
 BNkeGRz9bMXPwVsJTC5V8GnJAFk2AVPatTNvO8zKkdhb60gwvzrdLA92i4Xpb7g35M5U9Z6ZwLu
 A8MmWhw/RUAlLoqb//EDaQG3yCtdNE4rvTW1rOAGZkootF/u9ESVk7MbIFAnNfzRnc+VGUUNEBd
 gd3KVDEBIhlyGmGnWpY1kiDOdURKLPZ3PHWP88EOWGlIMD7q5EzBuJf/W43h96cQ8X6UcXc9+aZ
 c2O1846ZmXCbLEC1tVgNvKWmuCJE7kfnD8lsxVyZjyWUn59ndDU=
X-Google-Smtp-Source: AGHT+IF2GdIxRx3SqEFTlphXKDryTop50cYa+7sqIQbph4gU5keJJnwQo/44YQhFdrrKMxrWayVoQQ==
X-Received: by 2002:a05:6000:22c3:b0:391:4389:f36a with SMTP id
 ffacd0b85a97d-39d8f4f7f6cmr54821f8f.48.1744229033847; 
 Wed, 09 Apr 2025 13:03:53 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:53 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:35 +0200
Message-ID: <d30c3b1c6f4ea26432879b4495ebce8e62c3031d.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229034; x=1744833834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pr1i3A061aCWfhMs+lIIHTdeuHVYDPEY+cur7F9xIbY=;
 b=E2DcuC+GnGEH9lCxqgcBWlZSMpZ8nWqcJ6mEabl7T7BIZslp8VZOIWxInnaxvaSkxb
 NWyvImgqxLRTjqEJI7VPcf+h7rviJlwNJ+w4X1BlkZxbWC2REmCYvnoBj8ETRNVMN42G
 uqg7qnO5zYmQglFYCyDevDbqzFPkX+JBn7Jq7qLqnRy90B9nErdeHLTBqY+op/+vkARq
 ovV3fPoD0l2D62UvPWos9ILcOXuAIjjbAG+g1fybat4xhKnlqvUQKd1AnYZNcT6YSALx
 JuS7FCHglhxXvLd6bJeH41U8Qtbn0KcaFXy2oQiDnmOoUx6bZD6iGTykoUgW0NPHh1q+
 isDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E2DcuC+G
Subject: [Buildroot] [PATCH 20/29 v2] package/boost: check that known libs
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
set of libraries we know of. If they do not match, we report missing
or dropped libraries.

To get the list from Boost, we need to call 'b2', boost's buildsystem.
However, that is only created after a successful run to bootstrap.
But then only the set of _configured_ libs are reported, not all of
them, so we can't do it as a post-configure hook.

Boost's bootstrap script also allows querying the set of libraries, but
that takes a bit of time as it will build b2 first, and that takes quite
a bit of time. Since we need to evaluate the variable multiple times,
that would be a bit too costly to do a simple assignment with a shell
call-out. Thus the slightly elaborate assignment, which uses memoization
to run the shell call-out only once.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e849f902f2..7538dcb8f4 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -142,6 +142,35 @@ BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$
 BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 HOST_BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
 
+# Check that all the libraries that Boost may build, are actually present
+# in the list of all known libs and handled by Buildroot.
+BOOST_B2_LIBS = \
+	$(if $(filter undefined,$(origin BOOST_B2_LIBS_X)), \
+		$(eval BOOST_B2_LIBS_X := \
+			$(sort \
+				$(shell cd $(BOOST_BUILDDIR) && \
+					./bootstrap.sh --show-libraries \
+					|sed -r -e '/^ +- (.+)$$/!d; s//\1/;' \
+				) \
+			) \
+		) \
+	) \
+	$(BOOST_B2_LIBS_X)
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
