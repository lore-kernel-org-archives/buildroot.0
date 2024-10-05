Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1AFCF34C4
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 14:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8EE81274;
	Sat,  5 Oct 2024 14:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id turNqFYbCGnh; Sat,  5 Oct 2024 14:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C84A81778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C84A81778;
	Sat,  5 Oct 2024 14:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 372681BF588
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 14:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2629F81778
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 14:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nifeZKmM_Vd for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 14:15:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com;
 envelope-from=alan@londelec.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63DDD81274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63DDD81274
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63DDD81274
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 14:15:52 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6cb37b34a87so21743296d6.0
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 07:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728137751; x=1728742551;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+YuSIyJV5tE2vXjUiFcWey62cjJnaJl8XqYZUVe4880=;
 b=dtcffISAuwy5s7+V8Ugi8SpIQj4kyS8HPSp+eDA+7miCVpK31Y42te6qu+OK+MToTh
 oTi+/v7LCumXM0QisinZQ6dKq6/Waf36NaH/oIOWclR8FNog9QqzV0Mea5u91FBjwfUY
 InVSSFAORF9cRw0gGglO/HwoJT2B0X1MXpYUruS/+uFSg77iUqlozYb8gzWrnuZySQvq
 vIX/ho6KPW+YdgartIIG/ybb/lnrfnvZwHvBou9zwwA1B1xCPjft2Ptzsq5LdgW8S/5O
 86zJLsCaacs8tj5ANTcswPO4QQNigkLVdihlBIrEeYmm/9sZlCiS8891JFG7N8Z8n4JY
 fs+g==
X-Gm-Message-State: AOJu0YxfflD5Z6xYDuUwQhOOygWQCba+M89NlE3iLYcIZbURu1lyrdDe
 UMMVzQqQaVF3OMeRKLEMUEsbIuJM8kwk0XcQW++euGiNEuIV+7HZJINqL0dHqNgIQDScHjb5I32
 5Jn7vKmgxFH2MpAf4+NSRyQKtPWMcpELpae2zbajjyngTWMiNeEDc0w==
X-Google-Smtp-Source: AGHT+IGUGQgpKimp/mYJiVa2PcsPfsHO5cRRepROubJvPGsjFtzTYep2KqjE3iSUxM1DN6dE3FKVrAljZemmSHOEngU=
X-Received: by 2002:a05:6214:3d8e:b0:6c7:50bf:a443 with SMTP id
 6a1803df08f44-6cb9a460a78mr81833976d6.30.1728137750906; Sat, 05 Oct 2024
 07:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFQdmxKcoojruP+5Cebkm_oqCzBx657NddiTJ+nJi_u0AChJzA@mail.gmail.com>
 <CAFQdmxJ-p8TV4wK=TJxUb0D8hGscODzXApgZviemrQiUEf+y1w@mail.gmail.com>
In-Reply-To: <CAFQdmxJ-p8TV4wK=TJxUb0D8hGscODzXApgZviemrQiUEf+y1w@mail.gmail.com>
From: Cody Green <cody@londelec.com>
Date: Sat, 5 Oct 2024 15:15:39 +0100
Message-ID: <CAFQdmxL-C6cxpEaOJmfWzxB80W2deVsiu5mJ9J-rgHZO9zVnTQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=londelec-com.20230601.gappssmtp.com; s=20230601; t=1728137751; x=1728742551;
 darn=buildroot.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+YuSIyJV5tE2vXjUiFcWey62cjJnaJl8XqYZUVe4880=;
 b=LkwnGiRYVofmFoUWXnKyfg1ybLoikgYhyXfqkPRT4IgOUf5rLQF6FmUlMbRcwrF5r4
 ROQ0dsSfi/ijCJBVFsFmFO7AKGEaoPTUxZ7MJzGRzyINnJhNrjkvuNetpyp4GnGDJQYC
 CNRmG3k6SgtNETVA73KI91a1e7BLpi+ZgyzVLFxK87zaHfj/jzxBWU+AKyZ4Kv9qCcXj
 i967ColKiFJzYdon+caziarEO2KqJ6AwHn4FlAj1au7bRJ/6mtpXgkZAV5AEvbI1MzRP
 US/4/5rw6UC0fDeCHr8WVeZeO7t8nIi0QEO4+M6wstg2IVFqnGzd6Hzeu2HRdaHRI2RZ
 uemA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=londelec.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=londelec-com.20230601.gappssmtp.com
 header.i=@londelec-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=LkwnGiRY
Subject: [Buildroot] [PATCH] package/sysvinit: add version number to
 SYSVINIT_MAKE_OPTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version environment variable VERSION=$(VERSION) is set in the top level
Makefile of the sysvinit:
$(MAKE) VERSION=$(VERSION) -C src $@

Build command SYSVINIT_BUILD_CMDS doesn't use the top level Makefile, but
src/Makefile instead without setting the VERSION variable, which leads to
undefined VERSION macro in src/init.c.

Add VERSION=$(SYSVINIT_VERSION) to SYSVINIT_MAKE_OPTS to make the VERSION
environment variable available in the src/Makefile.

Signed-off-by: Cody Green <cody@londelec.com>
---
 package/sysvinit/sysvinit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 7f37cea131..e05a6dee38 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,7 +11,7 @@ SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
 SYSVINIT_CPE_ID_VALID = YES

-SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
+SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR) VERSION=$(SYSVINIT_VERSION)

 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSVINIT_DEPENDENCIES += libselinux
--
2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
