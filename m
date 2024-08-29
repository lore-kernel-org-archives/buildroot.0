Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1577CC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0F040B37;
	Thu, 29 Aug 2024 14:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vVoE-15My8J; Thu, 29 Aug 2024 14:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9844A418D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9844A418D2;
	Thu, 29 Aug 2024 14:50:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43EC51BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3B14016D
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Pp5xZxFd-DN for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CD2540442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CD2540442
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CD2540442
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-371a92d8c90so466166f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943000; x=1725547800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MiN5tldJ/Twui1pKIxgsMItB4uYoX2bbQT3rR0ZuDj8=;
 b=En2uOMv8quNQ3d5JnR6N1r/dttrztXk1dT02IqXwLQgw+v8j0pkZop1gb6XbfqUTsG
 0IlkNkNjdgsBdH+X5kfME8expQY9Phr/b6uizHr294gM6hXa6QKMYTv9uEHPwqDmv2on
 inRhf5Nkaxm9j8eukcQsDoQtpMNgZIwiZoehjfmpnFeWCiBNW8KJuR2wu9+1paLbFJZr
 WmAuBNTQRCuJj4VvECzFKaecmgQi+Lj2UtfB6srkyZP9kBFky/CDQi25PqHq9ok7BMOP
 HwmffB46ijWCBC1kJ8xZFL1TkTM36peqXFbwq2hyZHwBwm3uJNEepoNIus85P4hLWCbL
 PQIA==
X-Gm-Message-State: AOJu0YxrYDb32hfSPds66C2soGIRq6vBEi7N6UIzZ/AfbZZXBxi3vqYs
 Zvcsfrc6I0Tr0pBghnLw7Ljo8DcWWqww54dia+dWq3MXT3vjDjTRWfDREQ==
X-Google-Smtp-Source: AGHT+IGzTBWo5PGzwZKu1tWo0ZaHzxZEmw6cJfR063jxI+GbXxa/Z9/qGS1V6phzaBRTeO+mf/tskQ==
X-Received: by 2002:a5d:4e92:0:b0:371:9353:6132 with SMTP id
 ffacd0b85a97d-3749b552185mr1928934f8f.36.1724942999907; 
 Thu, 29 Aug 2024 07:49:59 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:49:59 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:16 +0200
Message-Id: <20240829144940.209964-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943000; x=1725547800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MiN5tldJ/Twui1pKIxgsMItB4uYoX2bbQT3rR0ZuDj8=;
 b=VlQVEBIjTE7jgnGEPufyFOFZi1zFfTw8mUmbOkE0e9Geds1x3LHndMXnm8c8H1aWkO
 uWab9JuIIQ8xO1OQ5EBoJdd2UyqqCH1QDL17ChvA+XiiPqKuEZ7SdRQRFUaTrSvWG8Pu
 Elfl77tzp4PqznfM1vscVv8R2iFZ8GkFIvWvFUt03JIV7TbTA5lH6kT1/baSu4KVAjPg
 g9ALNHOL6VtjfTN34Lu7+BnRo6KNpyfLBF6WJb92g2Wz5qXvFoWCaSC60PUhP8t7+2f9
 F1ohY8nu4PvbJ2vUFiXcE8VrPRo6IUuSx+R3D1QIA0jE7zZWO54koZr33gU87dlLnA6J
 d2Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VlQVEBIj
Subject: [Buildroot] [PATCH v2 00/23] Update Ejabberd and its dependencies
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

---
Changes v1 -> v2:
  - separate the renames from the bumps (suggested by Thomas)
  - add corresponding entries to Config.in.legacy
  - separate fixing check-package warnings from the bump

Johan Oudinet (23):
  package/erlang-stun: renamed from erlang-p1-stun
  package/erlang-stun: bump version to 1.2.14
  package/erlang-fast-xml: renamed from erlang-p1-xml
  package/erlang-fast-xml: bump version to 1.1.52
  package/erlang-xmpp: renamed from erlang-p1-xmpp
  package/erlang-xmpp: bump version to 1.8.3
  package/erlang-p1-utils: bump version to 1.0.26
  package/erlang-p1-cache-tab: bump version to 1.0.31
  package/erlang-p1-tls: bump version to 1.1.21
  package/erlang-p1-stringprep: bump version to 1.0.30
  package/erlang-fast-yaml: renamed from erlang-p1-yaml
  package/erlang-fast-yaml: bump version to 1.0.37
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
  package/ejabberd: fix warnings reported by check-package

 .checkpackageignore                           |    5 -
 Config.in.legacy                              |   29 +
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
 59 files changed, 247 insertions(+), 2075 deletions(-)
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
