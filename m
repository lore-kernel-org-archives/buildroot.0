Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CDCAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C986561B01;
	Mon,  8 Sep 2025 11:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOpQIYqxFUVU; Mon,  8 Sep 2025 11:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F6561B74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F6561B74;
	Mon,  8 Sep 2025 11:52:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98146CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A229421EE
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waXOxn6GZzqc for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.102;
 helo=mail-244102.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCB9E4184A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB9E4184A
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCB9E4184A
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:08 +0000 (UTC)
Date: Mon, 08 Sep 2025 11:51:50 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250908115200.3295727-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 14ec7c69656d8b4044859926579e7df4bce93354
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1757332317; x=1757591517;
 bh=gV7dmsAAULw7CYuLsGkbzgERGkIsorSe1rD28yDZnuc=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=EeQDABHOMkqqjlJfzXRESuJfKCayB+kfCP85asABwc6emyERBXI3x13KOGwEU5u9Q
 rQMrljy/ajqXbz8D8imMF7ZZ35d/25g0Us0BIhypm2b+7SOcN3GwM169egqVbc3Ms2
 7rPXXciqr2NutO6q0ckbEsToVhNS1Z8eRVdM4kwg20qjFaDfg+v+UGrSu1ktWocdgF
 W+7c3nV3StKEUgyHuVEGaXbcWBFOM19pewgGx4f4EosNjqx4glrFQ9eRKon4P0KU75
 BYpAeAq93umx8zF3AHOJsioN/p97Tml4iJ4fzmKLj2mzPyMh9kp1OHafhTzP5n1WAs
 hk3EDvngoc+Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=EeQDABHO
Subject: [Buildroot] [PATCH v3 0/2] Generate ADI ADSP boot streams
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

https://gitlab.com/pamolloy/buildroot/-/pipelines/2027407298

Branch containing this series:

  git clone -b staging/philip/adsp-ldr https://github.com/analogdevicesinc/buildroot.git

The entire series adding support for the SC598 EZ-KIT evaluation board:

  git clone -b staging/philip/support-sc5xx-eval-boards https://github.com/analogdevicesinc/buildroot.git

---
Changes v2 -> v3:
- Consolidate BR2_TARGET_UBOOT_FORMAT_ADSP_LDR conditionals
- Add help for BR2_TARGET_UBOOT_FORMAT_ADSP_LDR
- Update comment in HOST_ADSP_LDR_INSTALL_CMDS

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
 boot/uboot/Config.in            |  8 ++++++++
 boot/uboot/uboot.mk             |  5 +++++
 package/Config.in.host          |  1 +
 package/adsp-ldr/Config.in.host |  8 ++++++++
 package/adsp-ldr/adsp-ldr.hash  |  3 +++
 package/adsp-ldr/adsp-ldr.mk    | 21 +++++++++++++++++++++
 7 files changed, 49 insertions(+)
 create mode 100644 package/adsp-ldr/Config.in.host
 create mode 100644 package/adsp-ldr/adsp-ldr.hash
 create mode 100644 package/adsp-ldr/adsp-ldr.mk

-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
