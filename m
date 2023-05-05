Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECA0C77B7C
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 04:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B30360DA5;
	Fri,  5 May 2023 04:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B30360DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9takn1NCiJi; Fri,  5 May 2023 04:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5394560BB5;
	Fri,  5 May 2023 04:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5394560BB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0931BF39F
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8991083F09
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8991083F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWItKzL3yXdG for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 04:30:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9664483EF2
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn20820.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::820])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9664483EF2
 for <buildroot@buildroot.org>; Fri,  5 May 2023 04:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDhuFRBLPogdh03pcXXHNy0+8T1r88AXtbKHExcvGoq4ttVCJTOI64MhqoEGOdm25OcPd8W/GanUv5p6vka6olCzR1s+6BFYXiVwqQ5KC0bknNgGKP0WFjEHld6IMw8qW4t4PX3QicfmqKOEiUJkWGQXBeqwLQC4obsg1LLf7SKONL7X59IoChCWMlhr2I4zIZn/2YFxAiDwzUzelT/HIDykt3uvWaLEN5PLshMsdSY3hQLboMFLU9J9oS4OPdWY6Ibmd+iBaarkQC1PL9NRgKTTeypLadh1lR+pqS5QJeT/4/k5li2jYmpqdzgvtxET85jXb0QMQMrESSZyQLS0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tXXc2ajskudQ48HWuq+pnvHg6iNGoj/9zd5UJkf3WI=;
 b=HvPDEwS/RiTfm2bwBJ9RHc1aU0UOjGPJs0DdEXdLij1auKHXY4E14j5ziCF0KzVe4vp//mWuYAloDQyCAT5wxj2wPDk7IhmHhDLd0rods3YbvzogM3YySS+Pe6gToNEvMASrfL0fTY/EhfEnABkyfthVyw/noM2EoWmIbIKuXtyKXXI7S9PTJpzn1MTcf+IAKy/7NHNmltVEzhZQuD+DvzbTOcYUOsFoL5IOt//Ipm0Tf3om9KyR9sJHqP83Q4aU63zoZ5DkuE3XJe9DWVbhu8PBG60lRvnekKP8tSmDnwW9atPEAlpZtjSnymw2GyrhYnhcjScOKrvjD26au8qbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ0P221MB0739.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 04:30:41 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 04:30:40 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri,  5 May 2023 00:30:01 -0400
Message-ID: <SN4P221MB0682E582104B524681EBE0C9A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [iG/bnOJ7TMosKS1WJFG9aq747LhSHbFp]
X-ClientProxiedBy: YQBPR0101CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::22) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230505043002.1956-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ0P221MB0739:EE_
X-MS-Office365-Filtering-Correlation-Id: f575fe9b-2104-4765-15c4-08db4d217b82
X-MS-Exchange-SLBlob-MailProps: ymJijV9pwJly3uDYnFBNbzC3iPLdNm3DBIOGbL73jwQNfy6bOpevi3wnf+5xMiaPccS8+UgvFMkD7PfFWNomjygtjqz2kRFnfWcOFt8jRkz/ssbBadovRjfJ33+nmaD5hq5BuzMPZ5qR6BxOUUngvPIBARt+H1Mo2V+chqxDCwoIfv0zisM6HFmoGqPu3qUVm9ErHKSdrPl9iorMUNcdFuYhWZ0NQm/QuDDkpo0Enekap69Zsbu1/rf21YnCs9IThENsUXtAfJQ8IxrbjMVmo9JzWP91MA+15uJK9B4r/Bx0O22/aICA4y15APBYLu9DGsja8fZQ4rvUgXnXSU8XcRmyIIGF3l4W7FSlh76MKGPKO7QUkH+ciXLYsCx+g3yl258uM1tRiH76hqwqNfeprm5YTk3jruK5UGUw8BpJ5MmXcx+EYTN6dEA7QKdAo17tpNbtn4dHd7ndggbABUA2iKIJQr7aHlyjmj9FpjmLUmLnVh57KgZrfqs9PsqEWvKo4tSEeLjMWGU8CLws5KeP2s7jJ+5fJZZ+SLffaK4hX/Nu64HcUCYgX0Q2Td6ERVa3SJ2o+RKWKULEh6IcpS//KxGd0qpkB99U3/W7Pyk4meG1HYmpn3vVXY4ebpQHKoHOgMsOWkaX/KkPVzfznEF6teqDXi1yjG2DPVMtYal0MSdMf96lvoboP6wtyW6K3HDkmxuSui3YSA+3109f88TS6i7xiwjnG5pIUgMNtlgCNberMzH3UVXxzj+yqo9GifqwV8mgkTYnKbEVoUprNHz+FNOLpgwH8A2Z6ehLklWPoB8py+ix1OJyHsH5Nc2OYCpK
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dE+/atfkJ+zBNHaGvhLAchaQYaemSUNXDxi1yOT8k0Bz9lLlNjQTXAw8Qu3WbAIU/7UfCXDfRq+rfCWSx6bVnyoZ5MSdkgaMy617nVgCzs+tCCoOf1/eJGuKo15daNbYL/2ib+YoenVqhBMZUewDdc3cTsWwG+7a6EVXJ+F3Gm7QMYVYqobudOJ/UIe6ENmgs1MgXj+O2OomEnOLgrR7+faSmKVe6rFqZxBYdq695rHFfp2Q14jF7G/U0plde4vhguZFyaEMDGMYfa6BOHHYdmWIuht/Y4ZD1X8dNiA/FDLE8wWDRMRiVmkzdAU04fsV1Ntp6k1MhbbiGsc+qYP/Jzw9eHeoLx5FRlc5pJI2JfpDffe+iDegZqymwaJWKrrwZqnwcvftbCENaDWocFKxJs5IzkNPM3dcN4Ny1mTfggGvUocogQNbIHlgVSE4ixkNPEJQgFvb0INuQ+0sC6Y5UIfN7r59e5Z3RwJOqytpxuag8f0efsjAo5dGf8uEdty6OXnJWK9ciN4FnuQIbius5pELNCaf+fcNUNYBc8Qizj2zX65hTjUtTrNS83wruWet
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8z41StuwifVYkZutbz5fK7Su8WLwam74qBRH6ko2ZoRG0zvp9vvSyFoe3TGB?=
 =?us-ascii?Q?aB0+arSNyITtFO+hasg/FClOvG+4v/qNe1bhqP/CyE4sBNPzk+7YLjlc3TJh?=
 =?us-ascii?Q?Wz2LapkSsy9Yn4oPEH2nGSaZkpzYJFRvpwTLlZXWja6YgVT36C0mZJdW38RT?=
 =?us-ascii?Q?gdBMT0wTJvJ+9nl2zR9Gpdj3aTw6xITvUBaBPHT1gGmE4a8d6s21IH1uyCyt?=
 =?us-ascii?Q?cqThgYtfKRq+GrbA+hqKYjMusLHfByU8lsXQSDHSoOAJDxReGFaLKa54qyHm?=
 =?us-ascii?Q?eW7pnnbCQ05iYbUIfTwWpDVO2kK/cyUeQl6lZ4MdLLRuxv8h3KnIdUY1oSLB?=
 =?us-ascii?Q?OiKCtQjXuAJeV9SbhuwaAveLrblHVHgMoKAiCUeeeSsVlwck7eY5N2E0rhZ2?=
 =?us-ascii?Q?sOoiToCujRng1MqHymQ8/wFN3pqWWnbXXABjUGuUru/HQnDJk+i7kNGN0rdO?=
 =?us-ascii?Q?aO249qVQIsxsGH+y3c7kYvA4vsKtkY2gLnFkVDpx5CqOGANKprdONk0NEdTC?=
 =?us-ascii?Q?iBANbAANw+3gtkTq6hbXebPSErcbcPu0Vz52+hru9DkiW6mJmSR2LHzpSxJz?=
 =?us-ascii?Q?nzYKXKijxxhHXeVbanPWalGAwEiWZmR/fooprF5cN/bhprZlvUIRpFJj9Rqr?=
 =?us-ascii?Q?rT1bitc0nqro1oH4BWQiBxN5kLYkWyOIxwErHOxF30p9F+N4mbBU3LynVyem?=
 =?us-ascii?Q?8eqMA1dQ7SlXoCaFk90CXD00+ROGLX/EwIZKPQfWN4cfOqTEgu5TLNn8h4zC?=
 =?us-ascii?Q?CjSW5sN54xafcvWpUzqXsC54/0oTPQq5TnxZO5lq9tsj3Qfx6ES+4Ph763yD?=
 =?us-ascii?Q?asYCYwc560baVDkQ9PaXX7cqVEyUlDOQYSN5pjG7rcrN2bX2eJLPF/AVQPFL?=
 =?us-ascii?Q?/H+QUeRUWbg1MEV/9usC/aX0YqhUizXEJah77tk+trTac9Jyf8f33KtSBfeH?=
 =?us-ascii?Q?qsPmqF5h4WaK7NWcO3izec3t6ThsCjx74YdKfI/3EoqPn6MAzyusmirhi9TU?=
 =?us-ascii?Q?7EqPTib8vesp8iMI8ooUiygBztSEPcWUJ3aC1Hk/CEJDaJExXRDkor1LuBGf?=
 =?us-ascii?Q?zaC9f+9bqr2GinKgzFzBw/t31XfM8qEjIUvHez4TNPR8eRMTl+4aYXz6pt8E?=
 =?us-ascii?Q?kls4DMRjoH7r4nx4kYLyBh+FlN76ap2TUJmupDzRXzBzW18fm6rbDym68Z+Q?=
 =?us-ascii?Q?3mXa/D1qgpJNR+saATm5TZ9yesaG6Qs16Ul9yi4CQgjhcMITqetpPQUZ4Pc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f575fe9b-2104-4765-15c4-08db4d217b82
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 04:30:40.9261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0P221MB0739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tXXc2ajskudQ48HWuq+pnvHg6iNGoj/9zd5UJkf3WI=;
 b=ix0d7VcPJ77WNBsLQGe+/FoQ3e32fqLNG0LZSBVnPlgdK4HXgIIzor6PVqaluAr+zUGde0TztFw+EavYqjYks4xaNpKR1/detangZefwtKn6yCQLGhuvdST4qkfByxIva8cQhNp1y2jbFXGFtLsmf/jdONvSBc/KATLrbBjB5MsMrLb7GemZgkslAUXhW8BsDfaSLSmw+Rig/xVlHjaWG38M0tmk8qIDszpu+XkokekY8H+q9daibmKW/NQdooMw/3X3it0biKKll7BnIE1YXoVDGX5wxaEr8ybU/PpmeDNMeYPL813PPaWqljwSs4r+/+hX9gtp3s4aiR+DezNhzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=ix0d7VcP
Subject: [Buildroot] [PATCH 1/2] package/skeleton-init-systemd: copy over
 etc-factory content
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The systemd package will prepare the folder `/usr/share/factory/etc/`,
which holds a series of default configuration files for a runtime
state [1]. For example, the etc-factory repository holds the default
template for `/etc/pam.d/system-auth` which is required in a default
environment configured to use systemd with SELinux. Without this file
prepared, login attempts will fail with the message:

    ... buildroot login[242]: PAM _pam_load_conf_file: unable to open config for system-auth
    ...

To avoid this, when preparing the initial skeleton structure for systemd
environments, copy over fallback configurations defined in etc-factory
into the target's `etc` folder. If a file is already prepared at this
state, these template files will be ignored.

[1]: https://www.freedesktop.org/software/systemd/man/file-hierarchy.html

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index fb15552f99eafcc90bc5fa9dfcee3ad465492b81..4076821c0c0429cf90681f4b16be114c44bde282 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -68,6 +68,13 @@ SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_CREATE_TMPFI
 endif  # BR2_INIT_SYSTEMD_POPULATE_TMPFILES
 
 define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
+	if [ -d $(TARGET_DIR)/usr/share/factory/etc ]; then \
+		rsync -av --ignore-existing --remove-source-files \
+			$(TARGET_DIR)/usr/share/factory/etc/ $(TARGET_DIR)/etc/; \
+		rm -rf $(TARGET_DIR)/usr/share/factory/etc/; \
+		rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/factory; \
+	fi
+
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
