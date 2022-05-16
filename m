Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB30DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F2B41847;
	Mon, 16 May 2022 13:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUWJshgCjKoY; Mon, 16 May 2022 13:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99ED941839;
	Mon, 16 May 2022 13:13:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1E171BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 979FA40B44
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaJicCY3xBeT for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 533BF40396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so10900737wmj.1
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cf6KG1/8nnEM/64iQsYD54UXDqoBw7ryeW9KXjWyVFk=;
 b=pjBo/sZbDXHS+lVsfGXQetEX2kNwa2BzZ3d47AziUZd22c5A+PMtG2aulY11oIB7GI
 byzsOmkhy130qNUI3Dfh6yHPC4bBSs2GXQ+bBnE79/IF2TT1DXhTimegCwDrgFLt8uUP
 bZJp2x3kPVHuw5ekLF8ODe8DLIXXNc18AEliymn+lwKWB5Bw2AwbHhd4FqjcUO4PW2uJ
 1TWzRgYu9WGKgZXDpXsqyKHpGw3SEZv9sIaniDFD5iv789Ex21N9uzMLxz3L/MmzpRbI
 wwk2399epNQzdX+WniqybrwCq51+lmWy6UWjfVvo3hRZtX1aJma8Lm6cbHcCe7riVqBu
 wYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cf6KG1/8nnEM/64iQsYD54UXDqoBw7ryeW9KXjWyVFk=;
 b=XyvB8gAQEwtBkZ8kLnDMJkasenV5KRFFOZuLWw9fvKrGObkZnHCZ1FstfCprDs/PIK
 0mwHEZk3NXKYsBw6EL0WCQLkZvXjjXVEPiqR6JTtSQPNQ1JN1eRIWKF0smewdxW6cD34
 tjvR3+/LAA+a8qjiApYOskrXOOeE5Q6xuiMeiviJD4mVYuai59z9cNHm5UO8HtEWhf6I
 W/0dhPR/CKssJF0jk+mt3RSbAGntduXOMgaRvJrqqvze0WVCf32lZUmvVfBpcfzKks4y
 WF0KNuT1rrsX3xqG+nv7nScqGvX513MIbp/R0h4tpr/yKBeM6HSyFlDjUd5BvfxH5z1V
 9Fww==
X-Gm-Message-State: AOAM532/OtCpYfxtEwlsLUAgEbdzT3r4E4oGbglsqvgT3Q20Jntmrdqt
 +/Vs9+3DXmEwwcZT87LLS4wPFlOXglM=
X-Google-Smtp-Source: ABdhPJwJTKK/kvBixgbHJ2l2bAfjfCmHeuHkCQHWsVHSj3P4XUk4bOuu2u3tJQImR7s4PuA/VfxBIA==
X-Received: by 2002:a7b:c8c7:0:b0:394:9e02:baa with SMTP id
 f7-20020a7bc8c7000000b003949e020baamr26307027wml.26.1652706825158; 
 Mon, 16 May 2022 06:13:45 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:44 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:14 +0200
Message-Id: <20220516131334.1910858-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 00/20] Update Ejabberd and its dependencies
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ejabberd has many dependencies. Update all of them to the versions
needed by ejabberd-21.12.

Johan Oudinet (20):
  package/erlang-idna: remove unicode_util_compat library
  package/erlang-lager: bump version to 3.9.1
  package/erlang-p1-utils: bump version to 1.0.23
  package/erlang-p1-cache-tab: bump version to 1.0.29
  package/erlang-p1-tls: bump version to 1.1.13
  package/erlang-p1-stringprep: bump version to 1.0.27
  package/erlang-p1-xml: bump version to 1.1.49
  package/erlang-p1-xmpp: bump version to 1.5.6
  package/erlang-p1-yaml: bump version to 1.0.32
  package/erlang-p1-yconf: bump version to 1.0.12
  package/erlang-p1-oauth2: bump version to 0.6.10
  package/erlang-p1-pkix: bump version to 1.0.8
  package/erlang-eimp: bump version to 1.0.21
  package/erlang-p1-mqtree: bump version to 1.0.14
  package/erlang-jose: bump version to 1.11.1
  package/erlang-p1-acme: bump version to 1.0.16
  package/erlang-p1-stun: bump version to 1.0.47
  package/erlang-p1-sip: bump version to 1.0.47
  package/erlang-p1-zlib: bump version to 1.0.10
  package/ejabberd: bump version to 21.12

 ...not-download-or-compile-dependencies.patch |   24 +-
 package/ejabberd/0003-fix-includes.patch      | 1614 +++++++++++++++++
 package/ejabberd/ejabberd.hash                |    2 +-
 package/ejabberd/ejabberd.mk                  |    5 +-
 package/erlang-eimp/erlang-eimp.hash          |    2 +-
 package/erlang-eimp/erlang-eimp.mk            |    2 +-
 ...1-remove-unicode_util_compat_library.patch |   92 +
 package/erlang-jose/erlang-jose.hash          |    4 +-
 package/erlang-jose/erlang-jose.mk            |    2 +-
 package/erlang-lager/erlang-lager.hash        |    4 +-
 package/erlang-lager/erlang-lager.mk          |    2 +-
 ...ipt-remove-extra-dependency-to-base6.patch |   26 -
 package/erlang-p1-acme/erlang-p1-acme.hash    |    2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk      |    2 +-
 .../erlang-p1-cache-tab.hash                  |    2 +-
 .../erlang-p1-cache-tab.mk                    |    2 +-
 .../erlang-p1-mqtree/erlang-p1-mqtree.hash    |    2 +-
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk  |    2 +-
 .../erlang-p1-oauth2/erlang-p1-oauth2.hash    |    2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk  |    2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.hash    |    2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk      |    2 +-
 package/erlang-p1-sip/erlang-p1-sip.hash      |    4 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |    2 +-
 .../erlang-p1-stringprep.hash                 |    2 +-
 .../erlang-p1-stringprep.mk                   |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.hash    |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      |    2 +-
 package/erlang-p1-tls/erlang-p1-tls.hash      |    4 +-
 package/erlang-p1-tls/erlang-p1-tls.mk        |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.hash  |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk    |    2 +-
 package/erlang-p1-xml/erlang-p1-xml.hash      |    2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk        |    2 +-
 package/erlang-p1-xmpp/Config.in              |    1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash    |    2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk      |    2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.hash    |    2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk      |    2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.hash  |    2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk    |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.hash    |    4 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk      |    2 +-
 43 files changed, 1764 insertions(+), 82 deletions(-)
 create mode 100644 package/ejabberd/0003-fix-includes.patch
 create mode 100644 package/erlang-idna/0001-remove-unicode_util_compat_library.patch
 delete mode 100644 package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
