Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DDEC432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 19:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC8D60724
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 19:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FC8D60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=carnegierobotics.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F024606A0;
	Mon, 30 Aug 2021 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrlVqQKDu71l; Mon, 30 Aug 2021 19:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BEE1606CC;
	Mon, 30 Aug 2021 19:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78E091BF40A
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 19:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7591A80DAF
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 19:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=carnegierobotics.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_BmY9pUJIO6 for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 19:55:45 +0000 (UTC)
X-Greylist: delayed 00:07:46 by SQLgrey-1.8.0
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EE5780DB4
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 19:55:44 +0000 (UTC)
Received: from 014.lax.mailroute.net (014.lax.mailroute.net [199.89.1.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by 013.lax.mailroute.net (Postfix) with ESMTPS id 4Gz1812G6Rz2mGkj
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 19:48:01 +0000 (UTC)
Received: from localhost (014.lax.mailroute.net [127.0.0.1])
 by 014.lax.mailroute.net (Postfix) with ESMTP id 4Gz17y5ZNqz3G019;
 Mon, 30 Aug 2021 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=mr01;
 t=1630352877; x=1632944878; bh=MOUpn/kxlKtOQqtgd/a9//+s4MkJMwtB
 4JsXcFh5GxE=; b=M8a3P6VZkhW88QUcgIGBT/A+xqQKNRzJVMtSde51VOGnApMA
 VyoAe7iYelLZuENNvTdUOZSdzeHxDvn1ezHnBtlnVIw0HrcMJuJbhK/FyWYpNLh7
 LaVcHZGgAo1M1ZkZiESx/jnwSatUb8fFGQTnOqh4SElxqQocG10I4J7VmeoVXS4x
 Me7sJwW7nFK62AeEs6GeuUf3CyxnN0AsM8kYZdNAKxJAN8SyJvQkK33JUia4xi84
 wt11KJ7ybEDZ8QFnL65UxGOWzId6brB7DLFMNEJ50GjL0AMkpG0nzPPdUHrqqNa1
 teclnV4q9kFH6+nYi4f+fO9VMQnJo0QU72QgRw==
X-Virus-Scanned: by MailRoute
Received: from 014.lax.mailroute.net ([199.89.1.17])
 by localhost (014.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id IHKZAmZLbwHU; Mon, 30 Aug 2021 19:47:57 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 014.lax.mailroute.net (Postfix) with ESMTPS id 4Gz17x3S8Sz3FytP;
 Mon, 30 Aug 2021 19:47:57 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 30 Aug 2021 15:47:56 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c]) by
 CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c%7]) with mapi id
 15.02.0858.015; Mon, 30 Aug 2021 15:47:56 -0400
From: Woody Douglass <wdouglass@carnegierobotics.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/pkg-cmake.mk: allow cmake packages to have a
 configurable install prefix
Thread-Index: AQHXndftA46igh3hz0CD2SfLXFIKQQ==
Date: Mon, 30 Aug 2021 19:47:56 +0000
Message-ID: <291e9206b766be40d6d9c49cc8d2ef388ca8f5d2.camel@carnegierobotics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [172.30.0.99]
Content-ID: <EEF500B8FB40E343AB5B655D363F5B90@crl.local>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: allow cmake packages
 to have a configurable install prefix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "s.martin49@gmail.com" <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>


I like to organize binaries on my system so that proprietary stuff
is put under the /opt tree. this patch allows for that.

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/pkg-cmake.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 4ee100a0c6..da57a4fe8d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -56,6 +56,7 @@ $(2)_CONF_OPTS			?=
 $(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
+$(2)_CMAKE_INSTALL_PREFIX	?= "/usr"
 $(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
 $(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
@@ -93,7 +94,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/to
olchainfile.cmake" \
-		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_INSTALL_PREFIX=$$($$(PKG)_CMAKE_INSTALL_PREFIX)
\
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
 		-DBUILD_DOCS=OFF \
-- 
2.20.1
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
