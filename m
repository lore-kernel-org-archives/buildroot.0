Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD968C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 20:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2844342A51;
	Fri, 27 May 2022 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYx227WPdfQf; Fri, 27 May 2022 20:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 117DD42A4F;
	Fri, 27 May 2022 20:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8BC1BF834
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 20:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 135576F4B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 20:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtF4ytVCv409 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 20:30:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 175E46061B
 for <buildroot@buildroot.org>; Fri, 27 May 2022 20:30:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k16so2977543wrg.7
 for <buildroot@buildroot.org>; Fri, 27 May 2022 13:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=orf1Bz6O0y3IJIqjbSjSMXO2JHp1h7dfa+9dNhCtAsY=;
 b=H0PqaHKmCJNB/x9VHbAxA5U8kfNwttmKZEzd7gkdaX57AdlO+UZlPgCLpzTJDrNFoJ
 eA/ZK2DFIYDqYKQR0sr/j+Rc3Ryp2kHN/QpXe6crQdf/5I9cruIYBPxF8O8OMqV2wXe7
 3VVtJskDxyUSqk5/uQ2zBy+uk1fkjNM86D9ZpKGoU42OAzx/06Wi+qp6l3RVRdwOyDrU
 SxjqmUxfoWT1iYuATmeBOoPyjEQ25siINKckaesdiCSm/6L079BhruUwjDQBwcd63Po5
 I+7IFXnHGUTLZsqDf9k0myUZGhzA8+bpjNzobVrzYPejnLTroadh8rSUQaLZsxlsFg7P
 Mj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=orf1Bz6O0y3IJIqjbSjSMXO2JHp1h7dfa+9dNhCtAsY=;
 b=k02FT9jGhrFGQBYgsgJA27FK4iLUfyT3RcaUnk1uNNU/YJaa6hK677Fl0/I57BbEYp
 VWVOjMT4aTPEyeW0pC/lw6kEFRP6K2K9Qo0mZvhF+SzJUfo6t9DuFVYy+iAcI+x35UJa
 wH2RmsIDUmsk+U2SJPka/VpHXThAy5a3So03kfFP/osK4BK70hkjppGdmd8Zm2lZikPI
 nS6CCFb7Z7t0rJ1Pmyaa5doFsJE6J084rDvlP7yhxNXF0Dj3/5Si2eqI610TD55liEOQ
 2VR5Z6R65zgml0DH9DFpKHjxvV5A0RrqKBB9KXIfgVBQm17lekRaItxGPmxWKhmgr0r5
 Y17g==
X-Gm-Message-State: AOAM531NkNJt7GBLg6cV/FfdEfn3ijMvw38MtWb16YomBrZVgXp+TgeH
 9yiJ9Cqk5YU2GKN/cNNAj9n9l5BVvCw=
X-Google-Smtp-Source: ABdhPJwj5bHhw91ESKbKMg593qivD7/lV1FF3GRFvD7R1cxhp638aJYErpGbncLrn9KhdaV/dJf3QQ==
X-Received: by 2002:a05:6000:1f0a:b0:20e:674a:ce2 with SMTP id
 bv10-20020a0560001f0a00b0020e674a0ce2mr36008616wrb.450.1653683409699; 
 Fri, 27 May 2022 13:30:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d58ef000000b0020d117a4e00sm2418411wrd.105.2022.05.27.13.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 13:30:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 22:27:07 +0200
Message-Id: <20220527202707.1747842-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libodb-boost: fix host dependencies
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
e2f1f28efd4236431b333fabe6c75aceba9678bc:

make: *** No rule to make target 'hoost-boost', needed by '/home/autobuild/autobuild/instance-8/output-1/build/host-libodb-boost-2.4.0/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/b7acb03dfc7c7ce27db5536d337f4d61a8cc7a4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-boost/libodb-boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
index 6deb67f943..996759a03a 100644
--- a/package/libodb-boost/libodb-boost.mk
+++ b/package/libodb-boost/libodb-boost.mk
@@ -12,7 +12,7 @@ LIBODB_BOOST_INSTALL_STAGING = YES
 LIBODB_BOOST_LICENSE = GPL-2.0
 LIBODB_BOOST_LICENSE_FILES = LICENSE
 LIBODB_BOOST_DEPENDENCIES = boost libodb
-HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
+HOST_LIBODB_BOOST_DEPENDENCIES = host-boost host-libodb
 LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 HOST_LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
