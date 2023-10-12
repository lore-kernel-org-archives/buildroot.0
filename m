Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87514CDB47E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A72A60E19;
	Thu, 12 Oct 2023 10:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A72A60E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPjXdCTkXn90; Thu, 12 Oct 2023 10:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F5560E2F;
	Thu, 12 Oct 2023 10:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F5560E2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B74BE1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D7368223A
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D7368223A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ItrOPLwp9rZ for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:25 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2981382211
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2981382211
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so158264666b.1
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106743; x=1697711543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n+nJ0re5f7vC3XxPovunTt8KaEtQduLSQXitPdzIShk=;
 b=d0s3Ggo+L7Vy0Wo5Fr0MwleeBbgL4SRNG6VsaOvDlhdiL/kvuIRhm2BcPvMbu2QLUp
 ynzqddYcAhgM8IFW92lr202yLFOj/DQsOVc3oq8GMnn7yNPGZg5Mdje5EjFlp9FJRDfw
 OkdWmy0FhcBgFFNTRb1DJjYAjNDK5KgyxwfjWxii/LlEiADTgJDZaxw5vF87ahy0Wmcp
 FqwdDVfsMBuhnvxwS+dmZAQQ+SPAWkEMRrIDMNoKWmmlZW0fr690Arq7D/eFir6SytCD
 DzYb64RrjgYPCi/q5Nfrzev42NIRxkeHBB3k9zz7a3WtYnG/KViDsua8Z0kNrK7xay23
 Tejg==
X-Gm-Message-State: AOJu0YzYBBCkBA3BV+8UhNNMFydZZD5gJdZ4uOVJgI7b3CMXzgx2w07z
 9TnITtN31iTzIwYY6RygJvfrzyijmkfx4PmwPlr0rQ==
X-Google-Smtp-Source: AGHT+IFUKp8JRs0oair0rTpgqaPhY4H6IBwlwgS/PGjK7gz9pjrHQVqlxU4Iu2NNV00/9P9aVWFvJA==
X-Received: by 2002:a17:906:3097:b0:9b2:b30f:deb with SMTP id
 23-20020a170906309700b009b2b30f0debmr18836330ejv.4.1697106742720; 
 Thu, 12 Oct 2023 03:32:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:31:57 +0200
Message-ID: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106743; x=1697711543;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n+nJ0re5f7vC3XxPovunTt8KaEtQduLSQXitPdzIShk=;
 b=TIPkCn2Cm5xRMXAvborhzMI8tDm9HGTuKxyjP3X+okjTrD5XNPCAII8oJtKP0So7ss
 Ar15Fxj0y/IHp4MGQ2sVC2vZJG92/ID91W2nxBNrSK/t/ss1dHpCXsWDO6SfVTEwvPu0
 FcktQR3j8tNulse2S9zyDmZHmhTny01tK8Pao=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TIPkCn2C
Subject: [Buildroot] [PATCH 00/12] SELinux: Basic config enforcing mode
 support.
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SELinux support in Buildroot is currently outstanding! However, one last major
issue remains: Enforcing mode needs to work out of the box correctly, without
denials, at least with a minimal defconfig.

This patch series seeks to remedy this problem with a basic set of policies in
several commonly selected packages to allow a user who wishes to use SELinux in
enforcing mode the ability to do so without having to spend several hours
writing the same policy that everyone who wishes to do the same thing would
have to do.

The packages I have selected are based on the pc_x86_64_bios_defconfig with all
of the selinux packages selected because it was the most straightforward option
I had to create a small, bootable system in Virtual Manager with ssh support to
quickly build out a policy that didn't generate any denials in
/var/log/audit.log.

I want to address Yann's questions from a previous discussion on IRC:
  Q) What will be the maintenance effort?
  A) Minimal after this patch series. As you will see, most policies are only a
     few lines long!

  Q) How much time will we invest when we bump a package or add a dependency?
  A) Usually none! If a package bump/new dependency requires new permissions to
     the SELinux policy, this is a good thing! We should step back and question
     why a package previously accessing only files and libraries suddenly needs
     to (e.g.), change permissions on a /dev/ device!

Note: This series depends on the following pending patches:
https://patchwork.ozlabs.org/project/buildroot/patch/20231009161817.2832969-1-adam.duskett@amarulasolutions.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20231009143440.1776155-1-adam.duskett@amarulasolutions.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20231009170428.2836853-1-adam.duskett@amarulasolutions.com/

Thank you for considering and reviewing this series!

Adam

Adam Duskett (12):
  package/refpolicy/selinux: Add buildroot base policy
  package/busybox/selinux: Add buildroot busybox policy
  package/sysvinit/selinux: Add buildroot sysvinit policy
  package/systemd/selinux: Add buildroot systemd selinux policy
  package/openssh/selinux: Add buildroot openssh policy
  package/audit/selinux: Add buildroot audit policy
  package/polkit/selinux: Add buildroot polkit policy
  package/restorecond/selinux: Add buildroot restorecond policy
  package/acpid/selinux: Add buildroot acpid policy
  package/network-manager/selinux: Add buildroot network-manager policy
  package/iptables/selinux: Add buildroot iptables policy
  package/kmod/selinux: Add buildroot kmod policy

 DEVELOPERS                                    | 12 ++++
 package/acpid/selinux/buildroot-acpid.fc      |  0
 package/acpid/selinux/buildroot-acpid.if      |  1 +
 package/acpid/selinux/buildroot-acpid.te      | 10 +++
 package/audit/selinux/buildroot-audit.fc      |  0
 package/audit/selinux/buildroot-audit.if      |  1 +
 package/audit/selinux/buildroot-audit.te      | 13 ++++
 package/busybox/selinux/buildroot-busybox.fc  |  1 +
 package/busybox/selinux/buildroot-busybox.if  |  1 +
 package/busybox/selinux/buildroot-busybox.te  | 16 +++++
 .../iptables/selinux/buildroot-iptables.fc    |  0
 .../iptables/selinux/buildroot-iptables.if    |  1 +
 .../iptables/selinux/buildroot-iptables.te    |  5 ++
 package/kmod/selinux/buildroot-kmod.fc        |  0
 package/kmod/selinux/buildroot-kmod.if        |  1 +
 package/kmod/selinux/buildroot-kmod.te        |  4 ++
 .../selinux/buildroot-network-manager.fc      |  0
 .../selinux/buildroot-network-manager.if      |  1 +
 .../selinux/buildroot-network-manager.te      |  4 ++
 package/openssh/selinux/buildroot-openssh.fc  |  0
 package/openssh/selinux/buildroot-openssh.if  |  1 +
 package/openssh/selinux/buildroot-openssh.te  | 23 +++++++
 package/polkit/selinux/buildroot-polkit.fc    |  0
 package/polkit/selinux/buildroot-polkit.if    |  1 +
 package/polkit/selinux/buildroot-polkit.te    |  5 ++
 package/refpolicy/selinux/buildroot.fc        |  0
 package/refpolicy/selinux/buildroot.if        |  1 +
 package/refpolicy/selinux/buildroot.te        | 67 +++++++++++++++++++
 .../selinux/buildroot-restorecond.fc          |  0
 .../selinux/buildroot-restorecond.if          |  1 +
 .../selinux/buildroot-restorecond.te          | 13 ++++
 package/systemd/selinux/buildroot-systemd.fc  |  0
 package/systemd/selinux/buildroot-systemd.if  |  1 +
 package/systemd/selinux/buildroot-systemd.te  | 66 ++++++++++++++++++
 .../sysvinit/selinux/buildroot-sysvinit.fc    |  0
 .../sysvinit/selinux/buildroot-sysvinit.if    |  1 +
 .../sysvinit/selinux/buildroot-sysvinit.te    |  8 +++
 37 files changed, 259 insertions(+)
 create mode 100644 package/acpid/selinux/buildroot-acpid.fc
 create mode 100644 package/acpid/selinux/buildroot-acpid.if
 create mode 100644 package/acpid/selinux/buildroot-acpid.te
 create mode 100644 package/audit/selinux/buildroot-audit.fc
 create mode 100644 package/audit/selinux/buildroot-audit.if
 create mode 100644 package/audit/selinux/buildroot-audit.te
 create mode 100644 package/busybox/selinux/buildroot-busybox.fc
 create mode 100644 package/busybox/selinux/buildroot-busybox.if
 create mode 100644 package/busybox/selinux/buildroot-busybox.te
 create mode 100644 package/iptables/selinux/buildroot-iptables.fc
 create mode 100644 package/iptables/selinux/buildroot-iptables.if
 create mode 100644 package/iptables/selinux/buildroot-iptables.te
 create mode 100644 package/kmod/selinux/buildroot-kmod.fc
 create mode 100644 package/kmod/selinux/buildroot-kmod.if
 create mode 100644 package/kmod/selinux/buildroot-kmod.te
 create mode 100644 package/network-manager/selinux/buildroot-network-manager.fc
 create mode 100644 package/network-manager/selinux/buildroot-network-manager.if
 create mode 100644 package/network-manager/selinux/buildroot-network-manager.te
 create mode 100644 package/openssh/selinux/buildroot-openssh.fc
 create mode 100644 package/openssh/selinux/buildroot-openssh.if
 create mode 100644 package/openssh/selinux/buildroot-openssh.te
 create mode 100644 package/polkit/selinux/buildroot-polkit.fc
 create mode 100644 package/polkit/selinux/buildroot-polkit.if
 create mode 100644 package/polkit/selinux/buildroot-polkit.te
 create mode 100644 package/refpolicy/selinux/buildroot.fc
 create mode 100644 package/refpolicy/selinux/buildroot.if
 create mode 100644 package/refpolicy/selinux/buildroot.te
 create mode 100644 package/restorecond/selinux/buildroot-restorecond.fc
 create mode 100644 package/restorecond/selinux/buildroot-restorecond.if
 create mode 100644 package/restorecond/selinux/buildroot-restorecond.te
 create mode 100644 package/systemd/selinux/buildroot-systemd.fc
 create mode 100644 package/systemd/selinux/buildroot-systemd.if
 create mode 100644 package/systemd/selinux/buildroot-systemd.te
 create mode 100644 package/sysvinit/selinux/buildroot-sysvinit.fc
 create mode 100644 package/sysvinit/selinux/buildroot-sysvinit.if
 create mode 100644 package/sysvinit/selinux/buildroot-sysvinit.te

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
