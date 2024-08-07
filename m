Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A5EC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A806B606A2;
	Wed,  7 Aug 2024 14:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFqdM58ifIWJ; Wed,  7 Aug 2024 14:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D7C160703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D7C160703;
	Wed,  7 Aug 2024 14:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79A261BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FBB40273
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1A00NP4hpAu for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C844A40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C844A40184
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C844A40184
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:33:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4280c55e488so6171755e9.0
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041231; x=1723646031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKCVYllVSDrnrGuYCkCdJ0vG4uLLFM+o6Cn4skHL6Ao=;
 b=RUBHwLBc6t+OkD+AJdwYNiuAEKOaR4yD8oNmMoBcSMCuFQqMf49U6xPkAnbJ81NyYv
 NVIDnI3RFYUEuLeb9VZPnQjDTrgaBKMe2nFYgJnubFeDGO6hHVUkgAYc4iS13FvStp64
 ROON95nhR407QXSREszXefaBl1Y1P7DCs65fFE6KmHrC7fD13LfJkddowRPOqcUsGWfC
 5OIBRDVUhf6vBALQC9/ykz3FBjDtY65PmUCKISfFcUixR3XLh5ohJudF0LiksthHDzCD
 KYLVMFWN3bOFYhTRI6VGwYV+zl1MeUH3Ifgnw4G0IA+VLdFVrb8qfV64N2nf54HReD86
 X0rw==
X-Gm-Message-State: AOJu0YyPVAVbMvkpmLJe/kVEgVf2lW+2N2HA1eqkDj4VMBz9FF0FJLoC
 OYCY12NME9nd+fR/DB53YYvM/Wkir8L0bMKgtaoq3jDugtvOE18ujLISJQ==
X-Google-Smtp-Source: AGHT+IHn1RFq70A1WXUQ4I0sL5oSOEPv16Ykw8adjGY8jlF5Zu2BRpX6V8QvaEQ+tQtdjcOvy658WQ==
X-Received: by 2002:a05:600c:46cd:b0:427:abfd:4432 with SMTP id
 5b1f17b1804b1-429052ed25amr18267235e9.12.1723041231138; 
 Wed, 07 Aug 2024 07:33:51 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:33:50 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:00 +0200
Message-Id: <20240807143318.439619-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041231; x=1723646031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bKCVYllVSDrnrGuYCkCdJ0vG4uLLFM+o6Cn4skHL6Ao=;
 b=HekkDAvSFPeBwUdi5fhRXHXTj5Nrz/tm9zSk7PW0uVoy9dBe2vtqHYpOB7UOA5kCoi
 jRuORnDQBx/cCxqeAQXplmbN//aAX4be43Lf+4i4c2s/w2bxauXM1FvGVGib9v+ftkMh
 A21ZsXDKPHlMoXC/pdGV3q3SA3KXTgV+pU0zX7sRhhErA2G8PW2YoikL4dCE5swxRBrt
 YUE2LR9LrJ2kr0hQY/ThHBs+HXypHL1B0RgMiLC8R0g2k9X7lM5Ucmh8vghjUv4zWrrO
 J1znVNQ55OgQpMS+pbD7SPonOX+HJPb7eTDomGFVyGEk0hc25h+X21QsLJsnl+SLJqaO
 4UlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HekkDAvS
Subject: [Buildroot] [PATCH 00/18] Update Ejabberd and its dependencies
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
needed by ejabberd 24.07. Take the opportunity to rename the erlang
packages that were misnamed so far in order to remove some patches.
Such patches were here only to fix the location of such packages in
other packages that expect to find them in a different place.

Johan Oudinet (18):
  package/erlang-stun: renamed from erlang-p1-stun
  package/erlang-fast-xml: renamed from erlang-p1-xml
  package/erlang-xmpp: renamed from erlang-p1-xmpp
  package/erlang-p1-utils: bump version to 1.0.26
  package/erlang-p1-cache-tab: bump version to 1.0.31
  package/erlang-p1-tls: bump version to 1.1.21
  package/erlang-p1-stringprep: bump version to 1.0.30
  package/erlang-fast-yaml: renamed from erlang-p1-yaml
  package/erlang-p1-yconf: bump version to 1.0.16
  package/erlang-p1-oauth2: bump version to 0.6.14
  package/erlang-p1-pkix: bump version to 1.0.10
  package/erlang-eimp: bump version to 1.0.23
  package/erlang-p1-mqtree: bump version to 1.0.17
  package/erlang-jose: bump version to 1.11.10
  package/erlang-p1-acme: bump version to 1.0.23
  package/erlang-p1-sip: bump version to 1.0.54
  package/erlang-p1-zlib: bump version to 1.0.13
  package/ejabberd: bump version to 24.07

 DEVELOPERS                                    |    8 +-
 package/Config.in                             |    8 +-
 ...not-download-or-compile-dependencies.patch |   23 +-
 package/ejabberd/0002-fix-ejabberdctl.patch   |   19 +-
 package/ejabberd/0003-correct-includes.patch  | 1807 -----------------
 package/ejabberd/Config.in                    |    8 +-
 package/ejabberd/S50ejabberd                  |   72 +-
 package/ejabberd/check-erlang-lib             |   39 +-
 package/ejabberd/ejabberd.hash                |    4 +-
 package/ejabberd/ejabberd.mk                  |   11 +-
 package/erlang-eimp/erlang-eimp.hash          |    2 +-
 package/erlang-eimp/erlang-eimp.mk            |    2 +-
 package/erlang-fast-xml/Config.in             |    8 +
 .../erlang-fast-xml.hash}                     |    2 +-
 package/erlang-fast-xml/erlang-fast-xml.mk    |   18 +
 .../Config.in                                 |    6 +-
 .../erlang-fast-yaml.hash}                    |    2 +-
 package/erlang-fast-yaml/erlang-fast-yaml.mk  |   20 +
 package/erlang-jose/erlang-jose.hash          |    2 +-
 package/erlang-jose/erlang-jose.mk            |    2 +-
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
 .../erlang-p1-sip/0001-correct-include.patch  |   31 -
 package/erlang-p1-sip/Config.in               |    2 +-
 package/erlang-p1-sip/erlang-p1-sip.hash      |    2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |    4 +-
 .../erlang-p1-stringprep.hash                 |    2 +-
 .../erlang-p1-stringprep.mk                   |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      |   14 -
 package/erlang-p1-tls/erlang-p1-tls.hash      |    4 +-
 package/erlang-p1-tls/erlang-p1-tls.mk        |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.hash  |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk    |    2 +-
 package/erlang-p1-xml/Config.in               |    8 -
 package/erlang-p1-xml/erlang-p1-xml.mk        |   18 -
 .../erlang-p1-xmpp/0001-fix-includes.patch    |   16 -
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk      |   17 -
 package/erlang-p1-yaml/erlang-p1-yaml.mk      |   20 -
 package/erlang-p1-yconf/Config.in             |    2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.hash  |    2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk    |    4 +-
 package/erlang-p1-zlib/erlang-p1-zlib.hash    |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk      |    2 +-
 .../{erlang-p1-stun => erlang-stun}/Config.in |    4 +-
 .../erlang-stun.hash}                         |    2 +-
 package/erlang-stun/erlang-stun.mk            |   14 +
 .../{erlang-p1-xmpp => erlang-xmpp}/Config.in |    8 +-
 .../erlang-xmpp.hash}                         |    2 +-
 package/erlang-xmpp/erlang-xmpp.mk            |   17 +
 57 files changed, 218 insertions(+), 2070 deletions(-)
 delete mode 100644 package/ejabberd/0003-correct-includes.patch
 create mode 100644 package/erlang-fast-xml/Config.in
 rename package/{erlang-p1-yaml/erlang-p1-yaml.hash => erlang-fast-xml/erlang-fast-xml.hash} (50%)
 create mode 100644 package/erlang-fast-xml/erlang-fast-xml.mk
 rename package/{erlang-p1-yaml => erlang-fast-yaml}/Config.in (51%)
 rename package/{erlang-p1-stun/erlang-p1-stun.hash => erlang-fast-yaml/erlang-fast-yaml.hash} (50%)
 create mode 100644 package/erlang-fast-yaml/erlang-fast-yaml.mk
 delete mode 100644 package/erlang-p1-sip/0001-correct-include.patch
 delete mode 100644 package/erlang-p1-stun/erlang-p1-stun.mk
 delete mode 100644 package/erlang-p1-xml/Config.in
 delete mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk
 delete mode 100644 package/erlang-p1-xmpp/0001-fix-includes.patch
 delete mode 100644 package/erlang-p1-xmpp/erlang-p1-xmpp.mk
 delete mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk
 rename package/{erlang-p1-stun => erlang-stun}/Config.in (71%)
 rename package/{erlang-p1-xml/erlang-p1-xml.hash => erlang-stun/erlang-stun.hash} (51%)
 create mode 100644 package/erlang-stun/erlang-stun.mk
 rename package/{erlang-p1-xmpp => erlang-xmpp}/Config.in (70%)
 rename package/{erlang-p1-xmpp/erlang-p1-xmpp.hash => erlang-xmpp/erlang-xmpp.hash} (51%)
 create mode 100644 package/erlang-xmpp/erlang-xmpp.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
