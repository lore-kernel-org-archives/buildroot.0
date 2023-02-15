Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9D6C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0304D81413;
	Wed, 15 Feb 2023 09:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0304D81413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0oaybCmTr-e; Wed, 15 Feb 2023 09:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A8C812B7;
	Wed, 15 Feb 2023 09:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A8C812B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1A741BF255
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADE82402FB
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE82402FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btNQrLN3i_z5 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:58:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F124021E
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::61f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22F124021E
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpNAUyP3lXfl+kQqQY7x0b6zp1c6ydjMnEJyXV3wIjBpDWUqvoubTDKfKIGqdoqaFlu2toUcVKYvjHKZlDBhl5gCdSSNjadZz6c79gQITIY6I6UrrYcZ0SMoNjsu8sbebkBYS6fjw0pBvZ7JjriojeBQe5HKjjHuyclGSQrfC6dMvuh/f47UT3D0SRC+OJ3KJZ0Q4iCW28OR/kD2868VKJWDrAktgVwXZaIX+ERu01PTE7wtZwtjBOaZx2bkP7Xct4eQh/BIoJ8c5+lDB29evxm5uu02X8xUPG7/Wya/mWaBMAG83c8uMIhcU+R5BDfXhqV4ah9tF/Sy9rbw2pLK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoehV9K/h0BKaGKAWyxDtXl7HFcczyg5zJ9yEzqhaxA=;
 b=iKxqP8SDNKmLYR+hjLyjBzcK02FzG2hzE58SZFCyPJwZMKfIHhBRXuZRj3FZhQRdbwYJ/7dQjdOgRGXZ8RgWJhrcms5mqVtCcrix47B+tLDe2A8Swv3yWiOOFJc/O6l9GExawdwbD4xGGo+VEDgTcWC/6OazS19lqK5Fkf8WF98nt3mOTcITQNL/cYM3LswCKy5cUF8x4scCQ/nlBCioIT1zfI9akrjhROLxKRCZSdgcGqGNCWjJgu3pIWOjiAFEnJj03maEJJKT3lg9HYu8lIJl0ecNgsWMLu7NWoKa3lvv0zf5MmqyPIQoujjOdBSQdKPg5bQyUNSXCoHQM5qh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0702.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 09:58:39 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6086.017; Wed, 15 Feb 2023
 09:58:39 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/2] package/libbpf: Don't remove bpf.h
Thread-Index: AQHZQSObGRZ/Yli56k+ECByh1USi7g==
Date: Wed, 15 Feb 2023 09:58:39 +0000
Message-ID: <VI1P190MB049337D5ED854877354F01D09FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0702:EE_
x-ms-office365-filtering-correlation-id: fc37c169-9f78-40e6-3b81-08db0f3b368d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sF7bYq4kuHjX7UFQ8xG97jcUL5ax3ZXdpMFL32q6HHRnlNTKhQmK0YLn7cZL85JkxmVCzjfXGtKrD6W39A5+bD0QaLdtshjZmg/dcH+r7K9+9qAdPy0ITa36UiIw33XZhyhy3uXphNJE6Ow/tTfLm6h80KPeJAynzYA+2wTTuW2vgrzSL2zYvhmFriV/XpzIkSuAgbGdqOxeGcQP27Kl0/9g9bb3yjsf5tNbpPZRhWW8IB7nwu65dbdYn1XkkvnRC44rgmMlNrsljHbNn3PFV8JxaDxkv7vGQVnx+lZZPlQ+4m16JfStAENYwiXs3eDpKou8Ka7ua8/kFEvucfV4Qzt3kDw075jqpmd04dsR63M3UufR6HxNWCwc8v8BE3DBjHsAk7hvGl8g8Y5y9PJ0vCGhAdnxi2aro6CFefxWoLUGPSsdVtG7wSCUu+OUeCpUov5P6UNfBHDl7tyrIFYHA3NJAIyNQJaywqvfSMdvVNjjUachPQrweLEhY8gidIlsOv5Q3AEW+WaILVZvDiQmrDIMGEy8+UlZ+tWnjRN17lX3aZcAIAiRK5MlLIHWWmRUB+2WfnXodfU3V1/EhD7NJj42dTaF4Egqwh1EueHaBix7OqKcDaJviKOGq36luzCgW99h6cZ9WB45RZr2d/dMoWjUt39YRewWW2xBzZE3AV8J0eDSPyVF/Q3bZMrCcL1j
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(346002)(39840400004)(451199018)(2906002)(966005)(478600001)(6916009)(52536014)(26005)(9686003)(5660300002)(7696005)(186003)(33656002)(83380400001)(71200400001)(55016003)(6506007)(41300700001)(8936002)(86362001)(64756008)(66556008)(66446008)(8676002)(38100700002)(122000001)(76116006)(66476007)(66946007)(4326008)(38070700005)(316002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tlscBCwFT/gSDI3O7yl2hrFTklX11+6G46meDjsiUKAHhZiuwtnHROaR4L?=
 =?iso-8859-1?Q?jfIL5rHmtRDAnXf3jhkCXX7o5SXb9drDzpglxo1itbVqzMoQ62/OramfIe?=
 =?iso-8859-1?Q?NkTWqT9i9z+CmtMmwMiQKCyqJ+amDxme/rtkIDryLv4U5dDGZz/G2fv7y5?=
 =?iso-8859-1?Q?jjDWpZbEN0u2AEegLwmryLsA7hhGCzCvMbTw4IJG0StONcRZo2/SyJkZHb?=
 =?iso-8859-1?Q?rimM2mXYZEl4fMVxzUlv3bJdZjW6ZV9flQZscLhLywrxHHzJfW8nr/bXgr?=
 =?iso-8859-1?Q?VibeHngi4l53LjsRj9hqai2ISwK2X1eUL6bvDPPSnT9LucmO3+8X9aK18q?=
 =?iso-8859-1?Q?mqAvEusQtxxqOJwpPrBi5dG3I4ibD09qYV0428k4G7Rx8YmaH+v4jsp0wI?=
 =?iso-8859-1?Q?yXry/csWu66nyZHICyaK7PrZRuOtzx8DBkYtqQTX2T36rTV2drszIShG2f?=
 =?iso-8859-1?Q?qmKDMXpjkO/trQvIf/2dpQ8Iii+t33unecz5exHaXdVSQr2wgOvHVlnEwP?=
 =?iso-8859-1?Q?Sx4PqJqnkdtE6y+EdVr+RgYYSj4LIQJwFv8LyytV5Ht0AihSgycjQW3Z3N?=
 =?iso-8859-1?Q?7qpP1P/WIg4C6Dgr1Cz/cSi7mb360o7QymneJnY0LjQ7MNl+M6ze1ufOvb?=
 =?iso-8859-1?Q?ixNJ0y6IhgGAvdygFNIRoo1v8Nrzms6xyjWwMHziNtr+fL/9zEFUYoqBEX?=
 =?iso-8859-1?Q?VlJuVBadpCVjks/wiY+JHF84nj2apd8dI9Ke74xIbjJWRi18eQ4rV3timd?=
 =?iso-8859-1?Q?lNFYQ06Cu14ncnrzDbXVkcG75787z1EBI+wn4NAAweKoLM74TCoWYMpR+x?=
 =?iso-8859-1?Q?lxzpSujps3Dr+JqcFqb/AmYIutnKq5TQtm5XSPjYtEHUhCOuslpu2LEejg?=
 =?iso-8859-1?Q?Wxl3VVr7DwIg/qvUDug4pgWXA4GliTaNJbDFgWWTe/EKBUO99fCS+DZccF?=
 =?iso-8859-1?Q?3fxw9oBUTWOQh7Np4Go1Rg6hyH8Bo5QHVLSGavYw/ZDwNjX9B8YJGIYLSV?=
 =?iso-8859-1?Q?8T9shGMhu8BWes+OkuI19wAkswd6iEhFxlHGVl+DABnfeglEgyx6fB6eyB?=
 =?iso-8859-1?Q?kQLWLE1cTS65hF9PHCNlkEtc55hO5QfUF//SDvQ3NZrq2XMlINzGtpiU1v?=
 =?iso-8859-1?Q?kt6aljGEqU6RjkZZJXC/xdLzkxbVfWmO89Kvr0650t/r6mav8lNtd1y79R?=
 =?iso-8859-1?Q?ffI5rsZ5EjGU2BXPBfH1KM1Wi6hzgl2TUFHCJ37wFcYyXrDw/VfJe/DlWi?=
 =?iso-8859-1?Q?ZWSlegnR5R6sxeCItrHL8kkJq+M7SEEAaKxaqwG78KEfdlFzFtKnK6opyQ?=
 =?iso-8859-1?Q?BGMK2XyB5yB3VXbR7hqdD+jSKMqBmzfjEySEYt3hbCc+v4k3/t0hOwBk+9?=
 =?iso-8859-1?Q?uB9qzZPIvqYq92gP/01Bzg/ug98hBfUitNbmxSD0QpyfN2QMejC7dpa9Ac?=
 =?iso-8859-1?Q?5O7Mv8slIj7WmCUSoElg1+e3OOyCIDSwWoMKAvbI4H64IFuAZsSgcMcwNG?=
 =?iso-8859-1?Q?PqO4BrGqH7LNbt/qdxse1RmpjLGkyx2LEUvpKVz0bsSgVHIJSObRuIp+2h?=
 =?iso-8859-1?Q?3Zn0X+aMJWDXioupwfHEEOKXFg2cy8N3RaZUAf/rLy2eWgbfsVZ6scPZ/R?=
 =?iso-8859-1?Q?t1r4WoDoy9tSg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc37c169-9f78-40e6-3b81-08db0f3b368d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 09:58:39.5301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rV7+zVrujKCmY6wLj2fPvf7t+v2qcziLTr8+hGUbP66iyEs0W0GxCV3QDeCHDPxd6dYs4cnb0qsmKTp1IUUn6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0702
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoehV9K/h0BKaGKAWyxDtXl7HFcczyg5zJ9yEzqhaxA=;
 b=hxCYEBmQ2YaPOCrhRZy26ebgtJfC3Arowvt9KVpJdhivbpQAL1pM8OSNe/lLM6JyMJv9mLTw6SmofeJ8OQ5vGldnxBgZFfJDBY1pw0GasJIFPPoOcJbMCR8Uq26lwe0xz3A1fQPXhqLfDZUWdqGvLsn7/1yfnRVutFT73eR9P84=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=hxCYEBmQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 1/2] package/libbpf: Don't remove bpf.h
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libbpf >1.0.0 defines libbpf_bpf_link_type_str(enum bpf_link_type) in
src/libbpf.h, which is included by host-pahole.
bpf_link_type is defined in linux/bpf.h, therefore the comment stating
that pahole doesn't need bpf.h is no longer valid.

Fixes:
- http://autobuild.buildroot.net/results/d126a4b6eca786402dc362c86f8df3addec3d217/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v1 -> v2:
no changes.
---
 package/libbpf/libbpf.mk | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index b498136ace..670dbee87e 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -39,26 +39,9 @@ define LIBBPF_INSTALL_TARGET_CMDS
 		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
 endef
 
-# We need to install_uapi_headers so we have btf.h to compile
-# host-pahole.
-# Nonetheless, this target adds bpf.h which generates a conflict when
-# building the kernel:
-# In file included from libbpf_internal.h:17:0, from strset.c:9:
-# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_kind'
-# enum bpf_core_relo_kind {
-# ^~~~~~~~~~~~~~~~~~
-# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
-# In file included from libbpf_legacy.h:13:0,
-# 		from libbpf_internal.h:16,
-# 		from strset.c:9:
-# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note: originally defined here
-# enum bpf_core_relo_kind {
-# So, better to remove remove it now since we do not need it to build
-# host-pahole, the only user of host-libbpf.
 define HOST_LIBBPF_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src install install_uapi_headers DESTDIR=$(HOST_DIR)
-	rm $(HOST_DIR)/include/linux/bpf.h
 endef
 
 $(eval $(generic-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
