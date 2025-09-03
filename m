Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44134CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 13:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15B814215B;
	Wed,  3 Sep 2025 13:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zc8tUVqrB-Xe; Wed,  3 Sep 2025 13:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256F642147
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256F642147;
	Wed,  3 Sep 2025 13:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3938E2BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 225B083FAD
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-ECLrdLdtli for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 13:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.17;
 helo=mail-4317.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DA7483FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA7483FA0
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA7483FA0
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:50:08 +0000 (UTC)
Date: Wed, 03 Sep 2025 13:50:01 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250903135005.1803497-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 6bf5a35be59e152ebf61cc9e7901982c73a119ac
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1756907405; x=1757166605;
 bh=0d1FGyKeHy1CfqZI1blu7uCcKkq6KaipDAtIbj/WI2I=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=CwYGoi+UunJMen0vgOdIKT4bFSFmo9aUzv1uvpvUNSDslSAYSacfoajp8mW7/lNSv
 Z68Z05yJflebx8mAZZyOQrzCMWIWnSRDEEjDm3ijCIIQro4jX+/5YQK9R1mpGejbK8
 sbSr8h+TuDQ+aMGojoJZGDm9EM7k5UntcQUKv63MFDqqoQezEXj+x4wAHXT2GiMTmU
 NpwDb5C+/UIz0y4rrEvf1hztPhfy1z8lrMoO1GHjz6pmCsJezYoygdpGEKVx4fjEjM
 LTLcFJ1hX4BhvqD4ddEyi+UnZnEHoscVwkAk7eg5pUjjlvt0LUXteiB8lAZYryg3ys
 dBc/ZUO3v33wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=CwYGoi+U
Subject: [Buildroot] [PATCH v2 0/2] Generate ADI ADSP boot streams
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Philip Molloy <philip.molloy@analog.com>

adsp-ldr is a command-line tool that generates boot streams for ADI ADSP
processors. It is required to boot U-Boot on ADSP processors. This series is
the first step in adding support for the SC598 EZ-KIT evaluation board, and
eventually other boards.

Successful pipeline for this series:

https://gitlab.com/pamolloy/buildroot/-/pipelines/2019460089

Branch containing this series:

  git clone -b staging/philip/adsp-ldr https://github.com/analogdevicesinc/buildroot.git

The entire series adding support for the SC598 EZ-KIT evaluation board:

  git clone -b staging/philip/support-sc5xx-eval-boards https://github.com/analogdevicesinc/buildroot.git

---
Changes v1 -> v2:
- Bump to adsp-ldr from v1.0.0 to v1.0.1
    - Replace autotools with meson
    - The version is generated using git describe and added to a custom source
      archive using meson dist. Since Github doesn't support modifying source
      archives use the custom archive added to the Github release
    - Remove GPL source code and add dependency on libusb
    - Remove _SUBDIR
- Squash PATCH 4/4 modifying DEVELOPERS
- Move Config.in to Config.in.host
- Add host-adsp-ldr as a dependency to U-Boot when
  BR2_TARGET_UBOOT_FORMAT_ADSP_LDR is enabled
- Add comment explaining $(TARGET_CROSS)ldr installation

Philip Molloy (2):
  package/adsp-ldr: new package
  boot/uboot: add ADSP LDR binary format

 DEVELOPERS                      |  3 +++
 boot/uboot/Config.in            |  4 ++++
 boot/uboot/uboot.mk             |  8 ++++++++
 package/Config.in.host          |  1 +
 package/adsp-ldr/Config.in.host |  8 ++++++++
 package/adsp-ldr/adsp-ldr.hash  |  3 +++
 package/adsp-ldr/adsp-ldr.mk    | 21 +++++++++++++++++++++
 7 files changed, 48 insertions(+)
 create mode 100644 package/adsp-ldr/Config.in.host
 create mode 100644 package/adsp-ldr/adsp-ldr.hash
 create mode 100644 package/adsp-ldr/adsp-ldr.mk

-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
