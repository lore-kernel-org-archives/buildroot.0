Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1366FCF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 13:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4CD60609;
	Thu,  3 Oct 2024 13:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIEF9usDvhTk; Thu,  3 Oct 2024 13:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF2046065A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF2046065A;
	Thu,  3 Oct 2024 13:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D832F1BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 13:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5D69407BB
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 13:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6KtIW-SoAf9 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 13:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0AD540735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AD540735
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0AD540735
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 13:49:26 +0000 (UTC)
X-CSE-ConnectionGUID: nYjqNd3GREu2Xc5smr/xPg==
X-CSE-MsgGUID: xgufWlUTTCe+W61OsuvqEg==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="28582444"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 21:49:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox2keBEN412ao/+mlAbB2McRpB/dg35qdYdEM+ScHveG6R1rcu81MszdG2bOGLP63ZqOY2WKx/fiCSV7xnf23F29MhilYYgZlbhcBFjwOJST/QDQRvMJsu/ElPaTYITZUjREU+W2jhXDvQubx4+iPzIUE+JTASYtCfwzHCZOOoPcVXaL81WXTk2WqWUqTQQN/Ty/asbsA4v1BkhFcN0pKhYkT1Nx/sYIEFCFqeukJp5kFzmUWzsY81MGpKJit3qOCDs2QWebB+6wnpo2wpbf+USqX2fx0FTGCXm5JJdFXRXFIDHoO1AjEHhmU2e38FIicptuVqkpoDH0IPdMnXipRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVIAeoyfNQh33Ts9bx6oPsPDh3bZRB6x8Ooy+32Ji38=;
 b=U3jNmykIR0uAsltTrhJYZLiKz6lRvW8qdPO7b+m72PY6NixlTQz2U/+LecQ/y4vsUaEWFOA6mPYmpy3tutq4tP5fW9I81dcN15SyvhCrq2bsCi80dHI4BumbLa4DTxnFrjHh7cfs90vuiBUYIexpKPBwDodvkU6Y0NO1KSijcaCM3K8oyzddeT61SFKfsHsqNnCBnB/lNJ5UdFb5LmqBqgYVNXMkkhdwVmNIEcqOMpVifpnlpqSdESbQrCyPsqpnZISMyuoUfKwTe0zjBzaIL3CqUPa6/kfLiKmOzaF8MjEHpUzunMujDbHzv1NX2ehMv3G4pq8atXwE867Fgoo26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6463.namprd04.prod.outlook.com (2603:10b6:208:1a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 13:49:22 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 13:49:22 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
Thread-Index: AQHbAuUc1CB3U8OPVUq64u+ENUXuQbJXwU4AgAPx8gCADVlKgIAMI8SA
Date: Thu, 3 Oct 2024 13:49:22 +0000
Message-ID: <Zv6g4RCi0pJWh0GL@ryzen.lan>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
 <20240914222032.3fee5e2e@windsurf> <Zuk_RMVJAzqVO5s8@ryzen.lan>
 <20240925222613.3f62ed72@windsurf>
In-Reply-To: <20240925222613.3f62ed72@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6463:EE_
x-ms-office365-filtering-correlation-id: 93349902-329c-4ca5-3b21-08dce3b22fdf
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XhStdN18Gn/h/dAeNiNKkKDY/B8qDxVc83lDep7LM+KVfSM6X+vQQqXqpOtP?=
 =?us-ascii?Q?a2vdnxq2Rk954oLVQmZ9LWQKdha+Ey6+udLVlt4Zhto6SSpSBaiuv/c0gK8b?=
 =?us-ascii?Q?VtPDw7qUPyoMYCkkk7OAKqJ2jGUAtk2jKZcW4VptSkuwb8gP9zseyN6aPfVR?=
 =?us-ascii?Q?m+oOx+ssYaq66KdfghACQot31thnXTlNovZZoaqBQ3zdW8v4WhlYPOolnsC3?=
 =?us-ascii?Q?ujRQlFzxOIUA9AkpaiaIHVfvC7rOqKskYq8NR/iDvKaFo1MV30iqCGnKYZ3J?=
 =?us-ascii?Q?iWwapm9ooWPefoJxw0iftx/EbrlOVCjHiPvj1dlA/kl4P0hb2X26Qenkf9SM?=
 =?us-ascii?Q?lCXrxzVSALrNMFHHHnoFEECmL44bxWUa7kiMuSpBNjG+kuf1J8/mxrp05SQd?=
 =?us-ascii?Q?b7Bks3MqSGUFvbzRXwu5RdHWUevSNvUDxe8d9WZqhuDefxffYtDABBw2R82R?=
 =?us-ascii?Q?DxYrje6gGO1XuneOb+jLsriF8NsyE1kGPz1iKi5vC7eDzRL/ZLNaRq5mPS4p?=
 =?us-ascii?Q?41VNaQjJB/0nRa+XmIY13gKGVqlIz0jRSMXkowM/IWyO30zD5u1y0VS7ZRwn?=
 =?us-ascii?Q?tEq75otzXRFLD3assg/En2V02d7FQvMpQGnbtcUR2Ro9AQAybohZnINQYf0l?=
 =?us-ascii?Q?DxyJOcbETMxcY5i4CxzKl9khDIQdWVIkPcAt3wJMjQqIdmoO9obS2pmiSWdC?=
 =?us-ascii?Q?CbcABSGlWs8ASyQW9aEsdjEDVDT5e4L5MCao8j2hmM1AmYBOkBIdJ0U44vs2?=
 =?us-ascii?Q?/QKkk0U1IZ645ZejdjGdny0My0BzLktj70goGTMQWY0NNk3mxC+Qd8JWjwmr?=
 =?us-ascii?Q?woEV484lE7nb21bSFaLF+mkVxReFx40CTmu6ngE1FXKNJhx1G83BSlBvnWdQ?=
 =?us-ascii?Q?mGGAxKzffJldJoIBzIp071xYQ5tjXtHzBax7SpE2xINzgJ+rpIX1xbz5GwiI?=
 =?us-ascii?Q?cC1TBMWjdUOdEGg9M5GkjRm+TXp8lZAwT2H3hJUKcW+Tkg3iT8TdTp9pP7mI?=
 =?us-ascii?Q?QFB7yEx27RxoKZ9r78dKe3gEJ5l5aWKMXRooPh7L2fahL7iRzFv6EA0/oTMt?=
 =?us-ascii?Q?ZjIWvL+/aYtiZ9BmBUiZb+GnGC90oC2DtCgbggxF/ax5XmC7koXWey2qaCLS?=
 =?us-ascii?Q?u/Q4WEEwr7iAe3WH1xWn+VRWNcqHASxgRnKAX3VqdJDeXKRvRdHf7S1fmURi?=
 =?us-ascii?Q?U6BRhHYdqlH35A7Q1K0eh7/IJmnCd0RmlzmmlpcUsUkitGlk/FHDSIq/aYPc?=
 =?us-ascii?Q?qbP2D3WmIeXSBFge23f6dUxEhcpN42bydbRnzfoNEX6+D1snyk9yNrQQ7JPn?=
 =?us-ascii?Q?2J8hc95H/IaanYd9ZUNXKUF7xZpdaztiKqYbCGEdxxiHdQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?seKgRrSN3B0iNCoglBLlWb9FBiKIRr2aa+lbeVesWaEMSZMpgr4ATF+q6oQV?=
 =?us-ascii?Q?XXGFw21OI+aChcLRpcniRfDypfGjlShSoHwi2yI7n7+o3J2AlRISgpogWa0Y?=
 =?us-ascii?Q?K1QtFpUlRK/um9OHlYo0Qenci0x+d3UGcQ4ojzwP0H8k7Cg9y+zsLMlLBgh6?=
 =?us-ascii?Q?yYusEvglTe6hxBHsEsWM2AeN499DYlmRyqEKGtHendTEk3jO0njoGEAd1Qus?=
 =?us-ascii?Q?lTNmPpFZHjedcFhMQss6NIDRyCsFNgBQsUxx4GMzCgUDNiUT8/Jb6VALFk7+?=
 =?us-ascii?Q?6ktzafGhfublsE1ZhwpI8oCfrD4DqGD1erdk/utVwbVj4XkmHU03TTUuvYPO?=
 =?us-ascii?Q?n7Aklnqe339YkoqyhEAzcl+CVo2rw1Kxt4gcHtz4W2QNq1YQuJ7yD1Rkqc0h?=
 =?us-ascii?Q?39EjDFlHF1ivFfXt58PzT6NYfWDZSJPYlDmMgVADAbKzS7GwGWAwMA31gLpg?=
 =?us-ascii?Q?BMrgdUVzWIPElUVbOUJ4ch0J7uVJDfpHhvC1O0l3MDaXjD85sYyyuDak27o5?=
 =?us-ascii?Q?adPV4gVFqSUsJ6luUX6wDUG9fS23WblU0X6BfbSQ5oiW98jDvJ1jWjA/C4IK?=
 =?us-ascii?Q?wTrIQO6z7DoIVhjhl6ycX74eYxOxxEt36WoonjMpf/qTDb0UyxFDWNDvWg2c?=
 =?us-ascii?Q?VSGOZ3x/wOr7UFWIUepJbS1zIeo+7pVxJXwb8GApfxiULtLmNwXHsd0iieMt?=
 =?us-ascii?Q?LgvJXuKQ/5cIRXYYaV4rAQ3VdoLPfoVIIxIUw6YSrfQR2+norSlJ6qwhEwjl?=
 =?us-ascii?Q?Ynkyd3Smfn/Gh9A5ipQc248qzwiNBcufG+NZCBFk331GA9912VWuNi38ntyx?=
 =?us-ascii?Q?gpEfnX+078xKrb+GHChqrK5ZfLmT8w2MjlAC/dwtvHL/Kw1ruolW2A/u5mMf?=
 =?us-ascii?Q?2PA/TgXcSjZF66iKVMIPl55bMBlZnijM9J5QNyuMr6GL46FzUtJOA8Kpajwh?=
 =?us-ascii?Q?I4S27SvkDbZT2L9alpeqJCrUmBRBS4a8ldZ8LcDKY5oex87OSQC8Ypn6r2/v?=
 =?us-ascii?Q?zbNYh5vCXxbe1GRfg1TjRwHrVVctB/fQlxqlGBmE4+1AJTY0bkpaslnxHjXF?=
 =?us-ascii?Q?rj8qc42tjSCzE++szxJ+I0y/yfOb5Xm/0DpoE40gus5NsDbKEqCHhdLZt7Qx?=
 =?us-ascii?Q?z/x7j5IZV9zpjic4FNKhFXcMNEmAiuCmmU+gIe/UYC8KM3zixmwUSgPXnlYS?=
 =?us-ascii?Q?K9MdjWiCqQqlPFxsacvs0f5xsi4Mi5IXCYk2bP2XbDERTEX9o1tpAcIvlYKV?=
 =?us-ascii?Q?fTYZdwe4KFABFcI7176n9zapuiAZe9LwoTqg3L8MXZMhwtueMCmC7eL1LHpg?=
 =?us-ascii?Q?/IqMz4TAnPoxX0cENMAwgEANvLJFGCfwggJV4wYyGlCF3jrziplrWmGFYAXJ?=
 =?us-ascii?Q?T3bvADU9EoZjm0ZRR//W8AOh0gDFfjOc7eZOUAmVKCyc6+HRTb5vzh3pD/u0?=
 =?us-ascii?Q?LGSlmpaSr5dIB8Ht1BjSNv/1SQZZ9GxtQax3uU21Y5LGp/W8DLtH/7MxEWxA?=
 =?us-ascii?Q?7FxvHYFHqXaoogGN47IlkAX+J3VTcil9MLlS3KyTC+O1BcVEPuU1VjKusCYC?=
 =?us-ascii?Q?kwDUILIjHd73UDE+7YnCV2i3vGhvyB4WLp7L8f0uEe4+8E7fhB6pohqYQHkl?=
 =?us-ascii?Q?Ww=3D=3D?=
Content-ID: <21EDA716626F1B4C8E9DF786F508B3C4@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dZvc9/ExBGD3jlrVRkIsrMR9Y+xAvbNu3M/5ndhc7BHZrUpyYFsiN7xTK0RcAU/peQUCrZwxRJgjjr6biNT6tZbPeFOSgsh7EF2WxMdwiiiXzgUWfIYr2c4u4ciS38XC8tiAGrcSBhnrHM+DQTO+Bq2PGDfThaXX3s8nzmRJEAhXO0b3ryK8p7woj1GuLzJPF8kaU0+34KCY3/EZaafP5DGs95gB+8LiiEe00A08f9KbxqWRqu3EC6VlubShZDFXkkTu48dFOhueYOxsjItoU5TLyOjDQPhvU+776hbwsdi6o5+avKVdZJyJU/7oJLE8efbJfkUdgWKr+vAU+kpm+RvOhhg5jvuX91+jturklzrPgojmp4k7AkS8nJsimCO4zsDeripFVLR7tsTpulgHIRlZkDA4Ip3zVjEiMDnXdmSrbq9yXMSsnI4raekUq8Fz6GOLaxEpPbwAoLm3kDfRPUMzZg1rFgOdtbCb8ttiUzmo9KbpRMNU8lQVRFrLKNN+tVookf+NtQjgBOOSE97wuglzRxynRRc2z1mcESOEOJKENw202qpZGvYxYwUx64jGzsc57DLWr2ANgzVUEmE9Px+r7p9Wwhjp/Yl+zdtgD7cZPfxpSwzaY3bPVQXekgEx
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93349902-329c-4ca5-3b21-08dce3b22fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 13:49:22.6144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BshzbcLGYMviKxJAR6f9cj2Pkv+n6JBs4BNnY7kkUapyL0fT1lyfQxUVBE40AhPIWMh6+WFtKdhTKeO/QQ80Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6463
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727963366; x=1759499366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=lVIAeoyfNQh33Ts9bx6oPsPDh3bZRB6x8Ooy+32Ji38=;
 b=ahJNgZFDwHgXeNETn9VaJRy+4g2XXLxciX4+mklf6KDbz0RoKs4TG8tb
 OFAdhjOo+Kj8S95PVslf0PDkDKB0pqRhcexpBF52Di3+ikcKkG0APFOpS
 OibjSYrWAqiQd4Oqnj6v8jyF8bx/Bo2epgaoe9MBPEd2EqjKe0vzM860k
 qj4XfUXX3jIhh7JITOsmXAsqOJ60LJnDPpb5q6MtCR43ppjakZHJanTdA
 jK/vhwEhoKz9rgMgN4eufWH9VMBt6sqfM7lQlTnvCrVCjHopDaOg/59ci
 sw62OxZCqqG+wzrZ1sSR7U7peWKBdTA1dMkCDCAAAUQ/RM+gatIwMqT81
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVIAeoyfNQh33Ts9bx6oPsPDh3bZRB6x8Ooy+32Ji38=;
 b=oVdX1cyogiNsRv/ZDsRZmPeND8LOr8x0vna2SnPNfy+ECi+xpWdmc/rJKonlF2aAyoc4qoxVhAj3vNr+7/aWI0yH7CnxovF+O3/t+geM85A8IsHRT2P7S65bzkxlAEJrUOyKZnmUDfL8C3tLdsXz0V7ykaW2uwrcaKTGAAezj0k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=ahJNgZFD; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=oVdX1cyo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Sep 25, 2024 at 10:26:13PM +0200, Thomas Petazzoni wrote:
> Hello Niklas,
> 
> It was nice meeting you during Linux Plumbers last week!

Nice meeting you too btw :)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
