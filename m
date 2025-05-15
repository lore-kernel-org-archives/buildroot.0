Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA84C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D65610ED;
	Thu, 15 May 2025 12:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iboG1ydJNi70; Thu, 15 May 2025 12:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DFB26112D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DFB26112D;
	Thu, 15 May 2025 12:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181ED119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 140E64154F
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3YMNqlyft0u for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF6C941516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF6C941516
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF6C941516
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f8e07cb4c4so159212a12.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311030; x=1747915830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jpJbfrq1xtF0aS87db2z6tQz0ubzzayc7HAFk+j6emk=;
 b=SI+gM3AOY5R+uF15SeT3ptqOm6HydlZGIqhswxDDUccs5/XOL8kdA+XIyK6QazF7XN
 tYoWxcPZ3aMlbZd7w8MnOGQpQvhP9IG3MKvUJbFH3njk4R6E3IxNvmv7KAGxtAE/pF5u
 w8Lr3tsaIRCX70U+Jgk3Z/wSJKm0WPdxeDzSX/CdBb8OFKQkocrIW2MF3CmySALWsDXM
 EpDmWRMvEHwJCcZuVMv912yaanX131dcO+Clwax64+e321/E073XFkJta7cRiGb6rr5L
 sgcYgJ2zdPynlAw9xXZYSvhJAkijiUJCMjL3Ix/bayAJYj+PZ/djQ/m5CSrRj6ezewA7
 KnlA==
X-Gm-Message-State: AOJu0Yx8dA6Bg0ioAzM8mQIkFAILt2Ggw1RrrrGefxw462bkluf2ifTY
 PGE0iEeWFQ5Lc4fU7eioTaBBjUOvHdBaGNSoizPHQDW6plyRe2lD20Tim+MhNOPtnXq8gVAoLAP
 x
X-Gm-Gg: ASbGnctnfK1zwf5nISQdgyFhVsNOeVSK+3EkKQxPplv3PBx3K5O4Sckky7BbiQUkLh4
 rOHqNhQgC8b+3hgoVNLMv5eoiMUrd9cU0e/0kSoZ+AVuEU7Pp9Wl3A2UlgkBCyR/wKuPS4pQklA
 38oOfBEV6LY9WcxUmF84Gn3zDrxcWUdX8vQwe4D7O+wuGSXXbq9h/UTIICNc+jpcelyHHMrzPXf
 pYQ2rl3ARSi5y8WH2Fib1TxwzTJOQWAP5ZuzB7XEnWV63Jw59+T+m6wVTn4iWBJgevYV2EkVsey
 wPwAsh9KbvZYJ6NHgg9omqGGd4Q5zueFkD8rsizovl0hasWrV0WgOfY+7ufJpgpy5yTkpjPj/pV
 hhJvGpuz7TV6Ygls8zh8l4jcb6BWmyAVvIe5CdWq8ePUZxSdvDs6c+uZ7EIzkjRuAzysF74xX3g
 xo4YfAf2hsehaa6ix1mco7hX6UkLgg6c8=
X-Google-Smtp-Source: AGHT+IGElE3IYD0WqEhHinG1cJdAWJ3PHZ/r/KTaX4GelGNWNiwKmOhONIUBQatRyUERWm0r+YYKXg==
X-Received: by 2002:a05:6402:3513:b0:5f8:3c1b:65f6 with SMTP id
 4fb4d7f45d1cf-5ff988e7118mr2460851a12.10.1747311030539; 
 Thu, 15 May 2025 05:10:30 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:30 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:17 +0200
Message-ID: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311030; x=1747915830;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jpJbfrq1xtF0aS87db2z6tQz0ubzzayc7HAFk+j6emk=;
 b=FADCgdWWg7+o0W0VVfY1CwMb7UUpJuzGRuGiW3LQnE7+xebxQrb7ZOnBXpPxPMMuie
 Agi4heBee0df0+2M1G6dWYi2i/Em7DZEoSyoXXEB8I4Q4TuyEHIhj7zkDvZLYdws9WtO
 Z6o+aqiqQMtI4C9o25euVHxhYsWFDIyZ62KSA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FADCgdWW
Subject: [Buildroot] [PATCH 00/10] SELinux updates
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the SELinux packages.

Of note:

Refpolicy:

Added a dependency on dbus if the selinuxutil module is selected on
commit 523b279. This seems like a mistake, and I raised an issue at
https://github.com/SELinuxProject/refpolicy/issues/906.

Due to this commit, if the dbus module is set to no, refpolicy fails to build
with the following error:
```
policy/modules/system/selinuxutil.te:102:ERROR 'attribute
dbusd_system_bus_client is not within scope' at token ';'
on line 155976:
```

As a temporary solution, I enabled the dbus policy by default.


libsepol:
Kernel 6.14 bumped the maximum policy from 33 to 34.

Full release notes here:
https://github.com/SELinuxProject/selinux/releases/download/3.8/RELEASE-3.8.txt

Tested with:
./support/testing/run-tests tests.core.test_selinux
./support/testing/run-tests tests.init.test_systemd_selinux

All tests pass with Ubuntu 24.04

Adam Duskett (10):
  package/audit/S02auditd: fix shellcheck and check-package warnings
  package/libsepol: bump to version 3.8.1
  package/libsemanage: bump to version 3.8.1
  package/libselinux: bump to version 3.8.1
  package/policycoreutils: bump to version 3.8.1
  package/checkpolicy: bump to version 3.8.1
  package/restorecond: bump to version 3.8.1
  package/semodule-utils: bump to version 3.8.1
  package/selinux-python: bump to verson 3.8.1
  package/refpolicy: bump to version 2.20250213

 package/audit/S02auditd                       | 66 ++++++++++++-------
 package/checkpolicy/checkpolicy.hash          |  2 +-
 package/checkpolicy/checkpolicy.mk            |  2 +-
 ...T-and-rely-on-the-installed-file-nam.patch |  2 +-
 package/libselinux/libselinux.hash            |  2 +-
 package/libselinux/libselinux.mk              |  2 +-
 package/libsemanage/libsemanage.hash          |  4 +-
 package/libsemanage/libsemanage.mk            |  2 +-
 .../libsepol/0001-support-static-only.patch   | 39 ++++++-----
 package/libsepol/Config.in                    |  2 +
 package/libsepol/libsepol.hash                |  2 +-
 package/libsepol/libsepol.mk                  |  2 +-
 package/policycoreutils/policycoreutils.hash  |  2 +-
 package/policycoreutils/policycoreutils.mk    |  2 +-
 package/refpolicy/refpolicy.hash              |  2 +-
 package/refpolicy/refpolicy.mk                |  3 +-
 package/restorecond/restorecond.hash          |  2 +-
 package/restorecond/restorecond.mk            |  2 +-
 package/selinux-python/selinux-python.hash    |  2 +-
 package/selinux-python/selinux-python.mk      |  2 +-
 package/semodule-utils/semodule-utils.hash    |  2 +-
 package/semodule-utils/semodule-utils.mk      |  2 +-
 22 files changed, 89 insertions(+), 59 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
