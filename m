Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8B2C25B06
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 07:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D12781B01;
	Sat,  6 Aug 2022 07:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D12781B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfCRnN05RZHs; Sat,  6 Aug 2022 07:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E4AE81AF3;
	Sat,  6 Aug 2022 07:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E4AE81AF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E70361BF4D7
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 07:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1E4281AF3
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 07:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E4281AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLXORaRdYShK for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 07:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAD381AEF
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CAD381AEF
 for <buildroot@busybox.net>; Sat,  6 Aug 2022 07:05:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j15so5408842wrr.2
 for <buildroot@busybox.net>; Sat, 06 Aug 2022 00:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yboOXHApBFT7fIHlHQMPoggIRurgFm80lBQr0FScJGQ=;
 b=RLxG05+ELmk1JZYNki+IkNtddZcTf8/nCfWdK8tNK0yxXYP2SVUJ+2/bbx7olx1QBY
 AHFkBjnQdcb2KcIk+ffJEPcwYDQLb+B8hJvnzHgTwizPFIcGGbT14vFzDOnmlVLR55Ko
 ZX6cmPoyQpMt7vk7hv/4bXUglNzZgTpkZa9oaGP9mGD5MqTqtJKwsbCU11CLpU3kOPae
 YaQi4I2k9Ml7hBrtKJK+NG0UFDdi6qckkT30oaes2mswNxoklpyZze6vBgPI+7JnXVya
 t2FyBdtf2HyiJOMZLmY+7kLikCjRflfDythJMP76GostKJYxeg9UgClKoTncE0hZBv4k
 +7HA==
X-Gm-Message-State: ACgBeo3uqgCLxLKKOIzlHpctwnFyDTlITnRZB7upi/6h62A5pPiP52dn
 5mm3mA9ihV6pCoCNTumzIVTR6kz17mI=
X-Google-Smtp-Source: AA6agR5eIXdHRqagk6SF7j95DF1aUl+MJPvYN5NhpTDwlt4r7r7Uy0Vfl2f7zvakWRXCTbHf6OS1WQ==
X-Received: by 2002:a5d:6501:0:b0:220:5f19:de73 with SMTP id
 x1-20020a5d6501000000b002205f19de73mr6117059wru.713.1659769500299; 
 Sat, 06 Aug 2022 00:05:00 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05600010d100b002206b4df832sm5550514wrx.110.2022.08.06.00.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 00:04:59 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat,  6 Aug 2022 09:04:46 +0200
Message-Id: <20220806070446.14508-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yboOXHApBFT7fIHlHQMPoggIRurgFm80lBQr0FScJGQ=;
 b=pVMUfSMaU5I+8ECIpRsk0aZqg2TpAg15WnXNAPsLOywxfsbsUR17uJ++fBtnoay5QE
 BrHCZxYY4Xdy5PPjkXzEaJIFwizn8tU5T3ejUfuiN4tpak5Q2xOW6Zi1JmcgIqlKG/q9
 idoY0WdgQnHKI5/ICJqZfv0s+dKzNL7cZjsX4hBAuu6lMEjvFC1uA4UZ3xwzJznXWuG2
 pq2jdVdjNjAsShJVTi0HGVjdGaWcWxuNsd/r2fIV531/qqPL7BrBXBAbQdhKyVWpja7f
 oINmy+VoyqyHBvhsCNT3XthbgDZ5Qb2eAf/3sf30YEG0hlDbkQ2Avd3seK8F6jMZaBwp
 DdpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pVMUfSMa
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: enable refclock support
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable --refclocks=all configure flag,
to be able to use several synchronization sources (hardware).
Pps tools is needed for PPS input (include/timepps.h)

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
Refer to the official refclock documentation right here
https://docs.ntpsec.org/latest/refclock.html

Build script is very powerful. For instance, we could have --all
without proper pps-tools support and the configuration gets dropped out.

Resulting configuration:

Enabling Refclock Undisciplined Local Clock (local):            : Yes
Enabling Refclock Spectracom GPS Receivers (spectracom):        : Yes
Enabling Refclock TrueTime GPS/GOES/OMEGA Receivers (truetime): : Yes
Enabling Refclock Generic Reference Driver (Parse) (generic):   : Yes
Enabling Refclock Arbiter 1088A/B GPS Receiver (arbiter):       : Yes
Enabling Refclock NIST/USNO/PTB Modem Time Services (modem):    : Yes
Enabling Refclock Generic NMEA GPS Receiver (nmea):             : Yes
Enabling Refclock PPS Clock Discipline (pps):                   : Yes
Enabling Refclock Hewlett Packard 58503A GPS Receiver (hpgps):  : Yes
Enabling Refclock Shared Memory Driver (shm):                   : Yes
Enabling Refclock Trimble Navigation GPSes (trimble):           : Yes
Enabling Refclock Motorola UT Oncore GPS (oncore):              : Yes
Enabling Refclock JJY Receivers (jjy):                          : Yes
Enabling Refclock Zyfer GPStarplus Receiver (zyfer):            : Yes
Enabling Refclock GPSD NG client protocol (gpsd):               : Yes

To have more granularity, --refclock="a, b, c" is how to describe
the configuration. I don't know how to format such a string in our interface,
I did not find similar thing is supported packages.
Commas have to be properly placed and it must not be terminated by a comma
---
 package/ntpsec/Config.in | 10 ++++++++++
 package/ntpsec/ntpsec.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
index c81673481e..d31806c886 100644
--- a/package/ntpsec/Config.in
+++ b/package/ntpsec/Config.in
@@ -29,6 +29,16 @@ config BR2_PACKAGE_NTPSEC_NTS
 	help
 	  Enable Network Time Security (NTS) support.
 
+menu "Refclocks"
+
+config BR2_PACKAGE_NTPSEC_REFCLOCK_ALL
+	bool "refclock-all"
+	select BR2_PACKAGE_PPS_TOOLS
+	help
+	  Enable all refclocks (hardware, sync source and discplined
+	  clocks)
+
+endmenu
 endif
 
 comment "ntpsec needs a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index a0d0662947..3822b40dbb 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -53,6 +53,12 @@ ifeq ($(BR2_PACKAGE_NTPSEC_NTS),)
 NTPSEC_CONF_OPTS += --disable-nts
 endif
 
+# support all refclocks
+ifeq ($(BR2_PACKAGE_NTPSEC_REFCLOCK_ALL),y)
+NTPSEC_CONF_OPTS += --refclock=all
+NTPSEC_DEPENDENCIES += pps-tools
+endif
+
 define NTPSEC_INSTALL_NTPSEC_CONF
 	$(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
 endef
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
