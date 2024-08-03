Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D617C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 17:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04523402E5;
	Sat,  3 Aug 2024 17:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyfO9x8Pp808; Sat,  3 Aug 2024 17:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9460040328
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9460040328;
	Sat,  3 Aug 2024 17:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1131BF3AE
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 17:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1584140377
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 17:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57CFBmnacSKP for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 17:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7ea9::822;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=james.d.knight@live.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B02B7402C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02B7402C2
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02olkn20822.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::822])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B02B7402C2
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 17:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wklmnc0nfi5HlqC/iESFUa51MoniFmF5jgGOOcXSJ/XBVfJ/Z1TWjGezKNg+Xx65K7lt/EXIspnILbzaNHteFI6Xtfi5HRmGvntEY39pZYQnjElRTJurfv8LLBauQpV0GtR3p6b64UpU/U8j2h+SoL/Ai4KV9mKJPMFcgPIIl0Gd7Qdz+Z/jZVfDLq6W23WwA81x7D28cRogRx1hz/8m0tB8msmazqZz1kJ6aAbrGou2mUTZAQb+8Daoa5iLh4v/X8vRiY2UPq5MPkfoPSIJ4EP9gKq1EHjhmNsBTuasToHTxGX2GTmRImba7aAIOgtM5G3ISoU97QxXozzStJtmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6fEfbJ0WZTdy1ulrQyRLNDlqgHDccCPthezWHSK6Ug=;
 b=TOxJ87O58nXHQE2YgVVab1qC49Y5XY/UoNuUI4Ubv9X8x01H1CnSbY14yd6W7GPl1ESBafE/UdHEDW5hlAxzQIhRRUK/f8AnWCodfrZOqzA1vhfrfQ16D6myb4Q2eKMfroCGsFTCntxZYYTv4YDrBhagpcti22Ls3/x0u1/96s3GwWald6NOKXeClgkbxSW5ORd/DJU0unXFgbhImVDX4emDoWlcoVDUJ23D7AzNLlU3dZH06ri7nJYFsoMQ49gFrBstg2l7rM4KImqEvWHf1nyHPZKF88hO1eieWyTse6msJIcbA/KWoJmXLBeFpbzqB+KFq/X73abzatmxb5dRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:c2::14)
 by CH0P221MB0599.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Sat, 3 Aug
 2024 17:39:34 +0000
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::9a91:a5b6:6154:5b3a]) by CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::9a91:a5b6:6154:5b3a%5]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 17:39:34 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 13:38:32 -0400
Message-ID: <CYYP221MB1140ACF0E0092617169683ECA0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0.windows.1
X-TMN: [UC0ns0a5cjqIb8zuc7h/ZZDIgmK9ey40]
X-ClientProxiedBy: YT3PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::9) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20240803173832.1893-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|CH0P221MB0599:EE_
X-MS-Office365-Filtering-Correlation-Id: b87f9b54-882f-4b88-4c95-08dcb3e33cae
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|8060799006|19110799003|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: eMBk3L3C7CEEvq95yGi99TrwIfuxgyqVdYV3hYzhtD74tip9+mQSIBQpBH0ky8KGOpB8+jfKFMWamZnTrWqTsrbzgbDdioJYS8P5PIsJdyC+aBbNmh8kiz416UZbDOO1v89zcaN6k4JnOFEJCIKiwEibW7AqzhvTCKu3trd7IKM04vth5w3pyAFUkZ04x1jl0lBDjZfiuPE9VjFyspeMCgnITwb8JN0NAcFl0whleGaUSPm7DqFnIowreDPxls6L3odGxB58df4NXrBHHHNpHohZgTeYZmlhIg0GfEA0cQCPoHNMDy71vur1DL4b0FbOLHMChkfxuh293wrQB6Oom6U50pUZwxc4wyTCleM62OFJzVwdqOcXiE1EdpssKbTS4qgODKrwMNaBBnWjygC0knmMY9wlcshePx+p8kItqerh/U4kv26Nv2BROy7P63USxJCwA1l6ZDr7UgabKwnxJ85h6LvwTV0hpRkK2AcWWTF+XjXX3mUJ/w+DDuRkJz7/JHgqPaZXKvAmsCdSpQP6+pMggEbTBh+y5dSPNaqZlTmClCpDNjK/8QfHcGsQ/l2RbCMK3mef4uOW7hsrPdLVaiTSTM0iIV/b1+X6x7dfNaXQYf2eLjzaeteJjfv4k73piqftifiyb2ERKhGN/unwku074yISjxJ8mtf3fV4auXL9zNhyFKOTxRa5oYJ6GQDYhQH4D0Oj32G9zXtatyBMLA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOhXf7yaRoPODrQ4Ssy3BuTQj3DURkAOkU5XJhKpqQIVLu/R8zfhlJUCSFxg?=
 =?us-ascii?Q?WiWvlGUXDSwzZuj9+hqGCpNisyhKyNgAzUKpXd21cqkW+h6d0Tp2xw992kWu?=
 =?us-ascii?Q?7ikfq+wAQBFP2CN4aL/vi/TX6Im/rv3LDZwngJRwtq4qc804YD7sx4HPGrig?=
 =?us-ascii?Q?NURYra5Bv2uyvZBKcUe061USbm4ky2dL5MhAd7Wth+aeFZ9ORsv5u/Rb4fQB?=
 =?us-ascii?Q?D/OPs9VO/hiUSjdgA5utmKhaukCKc3yQ5eBaB2Snkw0MdYYHWhoSjnKXE0HK?=
 =?us-ascii?Q?CMFwZaY/+l0a+ngA+4s6DiWQsnte/mXb+RDLUtp3/yJjznEcB0mcXFHIx+YD?=
 =?us-ascii?Q?XN/zGV8lxW4MoeC/7vX2PEwBZHqCJOWAs1UBfJHE67q5tm621nVqGpcKEYJq?=
 =?us-ascii?Q?8eQyg1lYibIOPP2i5JAMbqm0Jv75oxly+Botk4Oh82K1K+HZxhp/s9lr2nlX?=
 =?us-ascii?Q?c4kpodazlOuWTi13dnCrI/eWnZGaTnYJfMX6dWfl6vl0U6iuezmC/98Gkz1i?=
 =?us-ascii?Q?35mgbJksYDrSgONC+FWJUXAzo4VmKJhwxFhFe0g6MwUrVTMsZToFN7p1V+5R?=
 =?us-ascii?Q?mg75rBgny17x5QiRbHKGsW9VhZGa10K40EqUH9BFflnGkvewlva5AGXCEMMG?=
 =?us-ascii?Q?7cN5pLsf10qHXI8y5kE52yIomj4zAEeJ3VNw3CV5a7BOuSIvD3dJPabYyNBz?=
 =?us-ascii?Q?VC3cue+L8sNWIXEEgaTMqfIKNHwXXMOMuZ21k2+jv8uoH1S7ApZmbhPS7FJC?=
 =?us-ascii?Q?hBjD/x0GDlEn1CEOHE/m5+teb0d3poBpChI8VnhkF2SAcKbRwSPyg6LBzRsP?=
 =?us-ascii?Q?5H92WMNeWIXvzr8HnxesDz3XGiDxvgRBaBtkqAoc8PqPQkX0pg3fhEBB08OV?=
 =?us-ascii?Q?3hxbqJYICy3TVYOuc2vAtRZa0ycdFz/s8ucqZb99kxzzXraHSI5QltIlAjvS?=
 =?us-ascii?Q?2XikmAxo28PDWOVV2LCtu0MlmiQRtXlDsffuYXfvCzTDz/5+fD8+3H6JnhqQ?=
 =?us-ascii?Q?71SHTlugxTb/oMRNsQlZaPoNR8K7BwtnGuU28dRlY0fp+pvAXSoCijhsFpl9?=
 =?us-ascii?Q?xcu41NYcDwmczF54zqHF2jsMfyVvp6VWbAy8HbwOJn+YaAxUcPHCcaUwQsOw?=
 =?us-ascii?Q?+DPL4l/Aw9XZujx5hs2P5NziIykhggR9b3HfloQLuQNk4EiMVAOI0/D4ihXb?=
 =?us-ascii?Q?xP04keKV/sjxRansPgMMeddLXL9pQs58CB0U09S0/N+e8IGfkopMErh6uzU?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7762-17-msonline-outlook-7d150.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b87f9b54-882f-4b88-4c95-08dcb3e33cae
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 17:39:33.8885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0P221MB0599
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6fEfbJ0WZTdy1ulrQyRLNDlqgHDccCPthezWHSK6Ug=;
 b=I2cbxg7bD61++yzdGSPZaqKS/2JOewIiZhGnXArHamRAnUzUpc+Rd3Pf4Ai4YcOP7LQMq9tNJFeNO9kosjRHk9B397FbsSc3hMzoeGUyGhcIVWzXZsWmrWPzpmzVM8hl5D2mEvn0Jn1hJoHWFz+/5dB42SNMv065YmvM1XqTxuSaYs+oMUFnRlPvIMX87wxim0MJ0+8tiTv9CV6TcW/XlAaHubvbbEpqDDqWRTXZBS6CosqkZo51OpkC03b7nCp+NYqs3e3MwFPzDFpYrICsEHfkeoeYlP9/ZuJ6m09XyDMN8olVUSwSk9K1zp8EfzeXaSkPVm6+svAQkQnjLhv4yQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=I2cbxg7b
Subject: [Buildroot] [RFC PATCH 1/1] package/pkg-generic.mk: introduce
 pre/post target finalize hooks
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
Cc: James Knight <james.d.knight@live.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides the ability for packages to register hooks in the finalization
process before and after Buildroot performs its own final target
changes. The pre-hook (`LIBFOO_TARGET_PRE_FINALIZE_HOOKS`) operates in
the same manner as `LIBFOO_TARGET_FINALIZE_HOOKS` did before. The newly
added post-hook (`LIBFOO_TARGET_POST_FINALIZE_HOOKS`) allows packages
to perform target modifications after Buildroot applies changes such as
rootfs overlay updates.

Signed-off-by: James Knight <james.d.knight@live.com>
---
The following is a proposal for adding support for post-finalize hooks
into the Buildroot framework. Been playing with using external package
definitions to perform some post-build tweaks to some board
configurations. While post-build scripts are a great way to perform any
late-stage target manipulation, it would be nice to be able to define
packages and register them into the menu system to make it easier to
re-use shared tweaks across multiple board configuration (versus trying
to add/stack post-build script paths into each configuration).

While `LIBFOO_TARGET_FINALIZE_HOOKS` worked for most cases, this occurs
before Buildroot performs additional finalization changes (e.g. merged
usr/). It would be nice to allow packages to perform their own
finalization changes after Buildroot does the bulk of it's own
finalization, but before post-build scripts are invoked.

If this change is considered, it appears the `luarocks.mk` package would
also need to be updated (in addition to manual changes).
---
 Makefile               | 7 +++++--
 package/pkg-generic.mk | 5 ++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index f51e8f690fcb208c021b8169cd9db287d1e3e0ec..d97b5d7e492b8a4ba29103ba4ba6fbfeec1775d3 100644
--- a/Makefile
+++ b/Makefile
@@ -668,7 +668,7 @@ define GENERATE_GLIBC_LOCALES
 		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
 		Q=$(Q)
 endef
-TARGET_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
+TARGET_PRE_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
 endif
 endif
 
@@ -706,7 +706,7 @@ define PURGE_LOCALES
 		done > $(TARGET_DIR)/usr/share/X11/locale/locale.dir; \
 	fi
 endef
-TARGET_FINALIZE_HOOKS += PURGE_LOCALES
+TARGET_PRE_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
 $(TARGETS_ROOTFS): target-finalize
@@ -731,6 +731,7 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
 	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR),copy)
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
+	$(foreach hook,$(TARGET_PRE_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
@@ -798,6 +799,8 @@ endif # merged /usr
 		@$(call MESSAGE,"Copying overlay $(d)")$(sep) \
 		$(Q)$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
 
+	$(foreach hook,$(TARGET_POST_FINALIZE_HOOKS),$($(hook))$(sep))
+
 	$(Q)$(if $(TARGET_DIR_FILES_LISTS), \
 		cat $(TARGET_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list.txt
 	$(Q)$(if $(HOST_DIR_FILES_LISTS), \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 171163dcb4401683bf2b8c7751fe261efa811081..17ddfcc4084ef522c693115623e20e14f5574fcb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1240,7 +1240,10 @@ endif
 ifneq ($$($(2)_LINUX_CONFIG_FIXUPS),)
 PACKAGES_LINUX_CONFIG_FIXUPS += $$($(2)_LINUX_CONFIG_FIXUPS)$$(sep)
 endif
-TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
+# note: 'LIBFOO_TARGET_FINALIZE_HOOKS' deprecated
+TARGET_PRE_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)   
+TARGET_PRE_FINALIZE_HOOKS += $$($(2)_TARGET_PRE_FINALIZE_HOOKS)
+TARGET_POST_FINALIZE_HOOKS += $$($(2)_TARGET_POST_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
 KEEP_PYTHON_PY_FILES += $$($(2)_KEEP_PY_FILES)
 
-- 
2.43.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
