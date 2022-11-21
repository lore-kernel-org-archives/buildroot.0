Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3250FC433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 09:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AC5408E4;
	Mon, 21 Nov 2022 09:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AC5408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHAGyGcfhwaJ; Mon, 21 Nov 2022 09:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88D14415B9;
	Mon, 21 Nov 2022 09:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88D14415B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5501BF3AA
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 09:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D532E4088B
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 09:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D532E4088B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueeOffcnoZzz for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 09:12:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A60CA4087A
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A60CA4087A
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 09:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRmk0KhITmqO6SxSHX4/D3Vd8v8lfRabcuitJBzKb3lmLAaRAmePgbydezEfPzOr5ssqlVxALysJNZYlrRMJLPkQkAQhvI3VVFjvDlbbPmhgQY1lNaqsVBSaZe9fKpito1T9xeGzhNnVLXw9qaG7trRbBdO98BQWMtdDiP7bgLaxN/I0bRcSrvavPQw4l/iuCwPweirqhvN8xs9xr81fMeFeizLgl8LlXGcvVaIlAx/FEauzOPk9FcXzlC0PyMWeAl4kCKim91oVygd3XXvaep0Vgh9NHIpodf9/9YkCN6oIWyN+dtH50sEO4qpm9OGInOILwEj+SvwsZsxwTCEkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfpaPt/wGGiQdGGBzEECp8oCplvF2S4Z6TfVgFRblz0=;
 b=CgB2vaoQTRJtUVsYCUII6/o1uiDemWruhHsj7HUmd/26kwxt+4J3szokl5VGg+ukG6JveoRI6hYgKvkCN983UipMzKbpMUbnFXhHvtq54UkdJoZafbcLqI8a8tNF1zcnRYgmPMiI6nitWmAPCOxwnwFLPU7bYYv0bwrjMFakhn4VAEHeEWzXLnKMNYNvBZzd9aIGLt/thGIevIRmBFfdkNrhZ3slih002EVk1uvz+RRy63VGbzQyULYZBPj9q2aqzOjbo7T2UoALAwFbKzyJ+EeU6zexgbvvSwBlZxWbr8wkQgp//E1OcWtEfb+2IagaFV6d38VCs1lv3n0Qheh1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 09:12:05 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:12:05 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] boot/uboot/uboot.mk: add stripped u-boot.elf
 support
Thread-Index: AQHY87jHWjHNXbEjYkae9yD8kT5zUa5JKvKQ
Date: Mon, 21 Nov 2022 09:12:05 +0000
Message-ID: <CH2PR12MB5004C153A3109B9BC5400F46F00A9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221108200704.23955-1-neal.frager@amd.com>
In-Reply-To: <20221108200704.23955-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6766:EE_
x-ms-office365-filtering-correlation-id: 0358b42e-e1d6-4b15-c2f6-08dacba07588
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jwNJyn/tSxSi9NFIYCHt+tx6Qq4XVSVYICelY2mO5yV7SKuv5t73GDwJ/95l8oLsn0UC7+JaVB7iBB2A4EtpjuDIaUhasA8LVBaTF9Bw/my8wVdInzw5pEWNodbkktnC4webzb/7EL9r4rZ8lIdWVglW2uv6/hEqOrYCOdonDBz7NjU+0s1gAn4t7aUbwHO9aUE3yd6bcwTAKKBcgxt6iV8qTO449ApQpnQOO4fVw2pQeBDPqXMe8OA48f/1bDmd4QU/6eqm2UM9YAHPkCdrqtdYTlZaVoF6rGIcbNcbkdzMwFwt7wE2sZPH8n0uOKS3iPCKyJhmQogowfRarZE1ALRrTOaoP1N8uIthQz1Dhy8Z+3/pr2FqMbckQRwuTAXav57Uw3RVQA47/y6ZCJH1XAd+Sxar6gcg0X1AwucWyVPiae2sdTsoEr0ucG3ag4GoKkfDwA9Keyf7Ah+zx44BPDgVIBaQSA7KXYxOJHIS2dOAx0wAoEcG1f8kwBvBzWHQjUU1IZceHS5mpuNC4Ti2zim6rT7ewz6roLan7VsDTs/vm/TA+Jq/3j63k9MqQcI3oV8rPoXUC0CSOxxJYqvVkn0SAZVihbvpkT6pGxFuEDXVh4XYg8FaLge58LFV3dFAYCWkYA0S+3sqh5zyXE5CbhI4iAAWAusWztKqH7pBurUmZWgWVJZ84SyFGGGeI63FRfvrLm6vWEMamOfghJ3MFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(38070700005)(110136005)(2906002)(86362001)(55016003)(71200400001)(6506007)(478600001)(83380400001)(38100700002)(122000001)(9686003)(7696005)(33656002)(186003)(4744005)(8936002)(52536014)(41300700001)(76116006)(64756008)(5660300002)(66556008)(4326008)(66476007)(8676002)(66946007)(66446008)(316002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dqe7v44q2Lql2JvuFKzhNOMuVxb8FD1jGefnZsu7n8fTzNKmEMe7Po9Koqod?=
 =?us-ascii?Q?/PZysXcgKbSTmZd+BAy7U23l9rQ8CHb3ayjPMKdJq13ZQe8cn9WuxFsowO+8?=
 =?us-ascii?Q?01+hPd9tREYniFyPUonXIm31Mu6R4cEZdrMVj3xVKulvWUcXAmJR/UBtYHUm?=
 =?us-ascii?Q?PUolxaf0T/2A8D7hz1WBXopWw05oaTVkhpCReQfLpUGg2wEfI3/UqJwtYXgi?=
 =?us-ascii?Q?Ac9DPaGzblViDYKT9idQZrRKlvuwqUDTc80qheyOW1EQCEOd+9G9UJIaqAKm?=
 =?us-ascii?Q?E7qQ5C5B01H0zeHHD4FU0aUJvz7J2WyudxifLxBZj8CnnngqsL2fVLRUMI1n?=
 =?us-ascii?Q?SrCWrzHVIHF70duoPqr+JaDd30Pe7YyAw0HVK9Uotgvks7UCraxSxywE2523?=
 =?us-ascii?Q?drw/QeGRJP+RDmE4A9LR0wLnBAIpl89b74D+vXcV+F3KdKphLf9sFD3YYUKd?=
 =?us-ascii?Q?h+alfIt8tfy6fVp7xkiSxwTpmizqNOIqgO2ELJr9jHgN7sz37disHcu7PxnF?=
 =?us-ascii?Q?3B1WAMlfrZGGK23kflw5raWVhx5NI7CL2Gf9lzkGkSX/ludjixk6eotGtZGM?=
 =?us-ascii?Q?MJW2ItRV8T0RBFm+QQFsYga/U7PvG0OiIJ381XbnceyKZjEQCkbBlW0KhPFq?=
 =?us-ascii?Q?cbMa1Kiic8Wwa51tlfdpQ60xqq/OOPjHLINGmW7QbQ3i6PtVGZkF9clZs9Eh?=
 =?us-ascii?Q?IM9tgFcUWz+pVJIq5GV0V8V8NL7O4X1ri24feszXx0qBNrwiGomzf4FD4qKX?=
 =?us-ascii?Q?90Q7Jvil86mn0SPMhA3bTxhqXkE8WVbuaj+OkRlEB4U5NMw7jNwBPUXcvD2T?=
 =?us-ascii?Q?h/5wkobWKMEGaL68w+ClygxgdhpZUd9dtr7BNf7spuynDeAuhyzIQMoFAoyp?=
 =?us-ascii?Q?rVD99XkhDdTUnbAo1Tij+NmV0AeG/umKIKbKRNjmrBFodsDY/SAKOHbOqyZf?=
 =?us-ascii?Q?QcXVEzDl+++2lX3M1fQ3WPfZ7CwfHWsfMgqGR6rY2dGYy1Xo4JVbs50sgKUJ?=
 =?us-ascii?Q?iiryF1u0tqK63uqqFHbS71SFN5xc7O6SLp8rXCjM80LHOHcxZvifO8IXhmPH?=
 =?us-ascii?Q?9EEMu6Nf35d8u72vQlOy5hSilsrUGiSIB1gR3xPPsPqATobclaRyPhg2eWlY?=
 =?us-ascii?Q?dJJftY/PQA/+oUM6Y8nqYRePZrV8aslbsc4I2ITAjkj+ylXgjKAdpKFIoCp9?=
 =?us-ascii?Q?DM7/eo1OO6TNL+f0qEEFIZaQ3SA/tcGufTefgJPr6Zu+YheJuG0POv29Lj3F?=
 =?us-ascii?Q?K463AaVRVMOj1EIJnzi+vpZ3P0myS0L4fRwjrvEIaLSbZkTORGWtI5yYosuP?=
 =?us-ascii?Q?pS0ZU+LEK4kIo37OA0377RyGDYAARSMTI3KaY9aWmhbUxvB5zNriUh567z1X?=
 =?us-ascii?Q?iaxPd3SiQ0jOYwiAfFST0YNz33rFXP48ljdc8QRjIaYCiTQ64PD4cHwwuE6h?=
 =?us-ascii?Q?XgHy4AGHBgYHp/AvdOV1fu1Ys1pv95wSQuLHTUFz5dJSdXrK+TLfddAbYdnL?=
 =?us-ascii?Q?rYtSjAGj7BUndmPtXiTDY+CQpCoWWaZx83bX04eON2e7+3bKWJv5Odz2wg5U?=
 =?us-ascii?Q?SgUmt+W7dXiXgGoQRcnqUmr5oDCEBnl/tz6zkOn0bQMAK0vprwKgKQfClY10?=
 =?us-ascii?Q?ACv1IgkBPcSuUoVCYXSvoZg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0358b42e-e1d6-4b15-c2f6-08dacba07588
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:12:05.3293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUxh58Y27D4/dPLjtRI4JCTOdhz3B3gBsMRwF15naJcNqiYo8v8zrwOjlD+sPTA7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfpaPt/wGGiQdGGBzEECp8oCplvF2S4Z6TfVgFRblz0=;
 b=4ULN/KwuBXD8Ck/gbxfzMRA5ZKmN4aw+EnV5esxwDlbMZ19++eR4DSATHB1AYePTeymHzr9j087udT+0JxD59ymAZ2EaLOU63Rgz9m2NH1JVqxo3x+OJuQmdY8BpPmXDTAex5JYTFuRtOrSu4YqkV0WGm1LBGFnJPet209WppzA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4ULN/Kwu
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder regarding this patch.  Any feedback?

If a user requests a u-boot binary in elf format, they may actually want the stripped u-boot.elf version.
This patch provides the stripped u-boot.elf binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk index 0439ec5e4b..216efc5a13 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -53,7 +53,7 @@ UBOOT_BINS += u-boot.dtb  endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BINS += u-boot
+UBOOT_BINS += u-boot u-boot.elf
 # To make elf usable for debuging on ARC use special target  ifeq ($(BR2_arc),y)  UBOOT_MAKE_TARGET += mdbtrick
--
2.17.1

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
