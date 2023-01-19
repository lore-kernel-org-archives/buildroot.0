Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E391C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21DEC82297;
	Thu, 19 Jan 2023 10:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21DEC82297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ojm3hQ9coQys; Thu, 19 Jan 2023 10:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C5882284;
	Thu, 19 Jan 2023 10:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C5882284
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 659011BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 327A7419A8
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327A7419A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpqgCx0uiVhm for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:05:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD5E41978
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FD5E41978
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfYQ8GEIfP6IsfTkDqH46Gt3Ftng/Mfe5+frWktK1ExdoCInRkdQMXgGogT1uV5RFZLexJFzt1DxekyT93CXJYyNWRK8rHbzIIxVfpi2MiMDQ777JMDQ9kAjREQgYD8WQFuS+JpjmCHgnGHiWNjkF4vvwGWfPDbOUu+PUQHU7RsuFXU0giovHSLf9tIAdyoEUyALsgkhHQolXqqzP6JhunMz9MwqNcwYbLqFp/ijuXTN/ztMAWE7YHnya3Ra3nio7/d0sN7/wGuXRB6oH80YZ6kz2LM8pvhf7RsgTeFC4gMEvB2qKP0pz1B1eMGrpPv9nGlTKJyntU1uo+JxuclP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASCwErdEcVvjTg53jaaRA0HTcMvdwwr4KE+7h6LisB0=;
 b=kSJPYFtfLTz16+K4y0C9Fl/LuHsOSUqpDbybaaF0PwiZHfgCWTLTm6xgKCVAOpBDrclKzYV1KaBVmDzoYeLwzVYXJo0OfIco7rCYVakvY1ZZWyZZjKAbgk5mLi0ngPf/XZIg6mwUaR0fc6ns/1r9RzJXWAHalAx4ncMMUTWuYynuzSeFZSPb+zsRP2nfqNt4/ekptnuxE+Y89Y2b8m1T5jwt61wBxAiX6bvREMZ+wZ0otSkN8wW4gk47JEvs+MK2dgz0Nu5TH+3R0xmAkEnxdVoHedbdB4qapMsR5V56T+oRVTtG/qWVCJcfrsgpNhpfUQdoaIMc882nVm4AkKoz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0604.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:05:27 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:05:27 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 21/45] package/gvfs: switch to https download
Thread-Index: AQHZK+xzsF+I49DXoEugJhg7cUxq2A==
Date: Thu, 19 Jan 2023 10:05:27 +0000
Message-ID: <VI1P190MB04935AC9F81E5A7DA395A20E9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0604:EE_
x-ms-office365-filtering-correlation-id: 8ed1203c-e5e5-45fc-2de2-08dafa04b054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6jR2AaXMk9jMAig5g9cWvliFGJg6bA50E13LUQrFcRuxWTcuC4o8v99Voh7xqx2r1wStzH0aCViWi4IIvVMy8IfF24Lp3H05ueFWrIn07ugtIbtQ85R43HqMCrosggUK/1Cmn88axqtgC7BACdXy39Er40CeAdv9RF163+UaIC6IGze4EMOvMOM3iQqOi1k8WjSat07UfPUUMFr/5DAqDdoc2U0vcVaBApJmTlFfpxbDf1uvSRp3cLj8zyTpdaaGQi567/JkmtKExrUz+E4MgLdrGjkSnuuml5QoGjMnLFwXipD0pSn8lTc6NdbnfxiLLq8rOQyBcyzQh/otGaAJ+2pvtMdJ4DmktRhOHauHv09spthtkI6xLZX74aQhSeQwK8cwJlPjI2PWReHqC32m21ZWjf/Sca8B3szVmVrE6GzYhbOR6UYOYJ55ToaU0Hm+7Nn9jz72iR//T+ZaseN65O5EPTerbYLpJpjYR2rlLVuGFUhjmSdwqWWt2PLJk3MgDXGOobwpwlc7YZU0Le+chhLLKY7RAmL3dArPROU/Os8bPpvg3mTfx1OVbYIdDMM5VWYJ4wdEFkeU+lcjk4hbWSq9T7cMla333rDqMuaUzsHndMCdr7AFdwinrWYimevKXVidDOV+XZZgoJ+KF0L3tmZbkUqmzL9KUHn8sl6h7CzW89BaaAyz27ku0k0OAmaD2vHDXWDWGIEDoSqwd/gxADlr58uA/5W4PfRGW4D3ls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39840400004)(366004)(136003)(346002)(376002)(451199015)(8936002)(52536014)(6916009)(5660300002)(41300700001)(66446008)(64756008)(76116006)(66946007)(66476007)(66556008)(2906002)(33656002)(8676002)(7696005)(478600001)(71200400001)(966005)(86362001)(38070700005)(9686003)(26005)(6506007)(186003)(55016003)(316002)(38100700002)(83380400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+/3Y2Ma2CTLqpTxOqgGeldOoJtCCx+ZdAOjZMiWLRmh2j3ywWKgKzGbyyx?=
 =?iso-8859-1?Q?YN34lhWnXOJ5Bguf2yTu0gYvn5OwxtQ4RjwSNq1MVdZxAGt/lMJ+dnmfQu?=
 =?iso-8859-1?Q?a9YXeFktjCeFyLErWBh4geeMCylnJiCDWgs+7JbrlzT4iDg4KEqfE7miUW?=
 =?iso-8859-1?Q?WiGXusgZnWo2wjml+Qd/vq7vnk4hhhEIY0BEUcmNhxRXW4QT5ug19hSCrd?=
 =?iso-8859-1?Q?u02noGZRxJMKYCFIiXwOrddafzlHa/RMAfjg69LS2SFTsf2mn3kQb41od/?=
 =?iso-8859-1?Q?KZp6wU3K1vIc/6VXRWTVdHbcjDwIeTtOMGqYX2sBfhBLba49BDaHMwupQD?=
 =?iso-8859-1?Q?x+O7iDtwOtX+xMqD++UvdFiisc4zRay93RQ2yXvkMiNyokYwsguoapYJ48?=
 =?iso-8859-1?Q?SFOcHY8AQHx/jUFT3DeYkK5krerO0WjEWgT6QbiOvLUoMJR02vJ5h2UL6k?=
 =?iso-8859-1?Q?FOkHT0wsh7+8sPGb8ANxh8Jj3S8MkijUujo1DCYyVPUeqF8IwpfIHp6NKW?=
 =?iso-8859-1?Q?cLYaJwiLha/NoDHzMLzSt1baH06uYjiWXRYepn5y8AsrpBlgNQG1ettiup?=
 =?iso-8859-1?Q?TtLL7c5F1L485Jno39Cx+3ORHy/wwjoWgv44WrMMd50zHy9/UEfGS3tcSq?=
 =?iso-8859-1?Q?75vaUIC5gnqnD3pXdYCx36WhaIycRvstNfoj7wjzctQribPHfm4R2T2A3Z?=
 =?iso-8859-1?Q?yKYUNjvqcUXIj0/zeFA6VDRnVbk5nROUavxO8i8ZyMfl7bFDbKn/aTbY60?=
 =?iso-8859-1?Q?unYFSYXNWVVjNBUePeYZkZnGgQ+R4IVi/ClpUWietbyuFrMeIjDMJOGKYB?=
 =?iso-8859-1?Q?+miMWY9qiNbV8RCZYoHNDY0/advwZjjFbtmMJihbLK+d1GeZkbBWN/ujoL?=
 =?iso-8859-1?Q?fDpbkCwX9NeR7l2AarpcMd7QdekFnnE+XwiWCXFwh2tEP3dZCPaopBQ7Sq?=
 =?iso-8859-1?Q?MJBRVbVukzq3112odFFkYyyTLsfPXIvBDF1vSMS8cptWAQhkmkg1QIVO9R?=
 =?iso-8859-1?Q?c6F+n21+E/7sN653p9Sqy2rNuppBQs00dFIoO7X6eJgAbIgJMc3WpNYj44?=
 =?iso-8859-1?Q?0Er7Dt+qLCt7GLOIuQ2UZgF3+9DFzzmwcI/Oh4IDUNvEBNOqKd6uM26tuD?=
 =?iso-8859-1?Q?kNQWi1aPHxPWx+sIWhyYsOA1wBWurGklP2BbMRQUUu7Vogynpx+zQs2U3D?=
 =?iso-8859-1?Q?GNoeW0Wxc3KE8aMoUrPc9uhKX6AeX67YCTpFJTIlo3aROvBscDxsPjcHvp?=
 =?iso-8859-1?Q?LMW5nsZTxLbEfzEWROLAyCF+Px8X3xWBrkU7FyDljjw5Fp0MQGhFWnytDP?=
 =?iso-8859-1?Q?/YC0i/VothkkPjyXkiVtMQ+2PcLOkOyMVIrFQNOXVh+xIAHOP9UXjnrqj1?=
 =?iso-8859-1?Q?WR1wrYL9noqon2Q4y+5pQbVCcXFNTwN1voCQtlXQ2yx1rlXYUmLSfernti?=
 =?iso-8859-1?Q?imYrRKEiRLJTCuci7XVCXsGHr1Y0Qm5EVcc9AlwEPTCIWgs9B5AzMJF8MN?=
 =?iso-8859-1?Q?YzgOhZfU+VpPOAGvV/CUs+89Thdzo2ZHtZJOa6mNzvhtjUmFOwYyYZRKPm?=
 =?iso-8859-1?Q?X4ne9M1r5D1tLxlweXlmH5Hwt3UP6EfbMy3tEdAnw2vPic3PdMJDuMUz9U?=
 =?iso-8859-1?Q?OpAIuJoZw3VZc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed1203c-e5e5-45fc-2de2-08dafa04b054
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:05:27.1153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VwK+r4ijOyAXooUtrDT/phCtFCGUzINQ23P0H8f/tSBG7bdfe8bNG4SKFjCtlbbJNEj/mDosdYsf2iTy6N/X1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0604
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASCwErdEcVvjTg53jaaRA0HTcMvdwwr4KE+7h6LisB0=;
 b=MqnVxbXV59KGSG5o3DCFmu3icjnyf0Jm4DjlfyDjdupv1kDEmqffkNIDSYwKhK/tyOYVOc4DXDsuE4by8pihsdRCkWx4DWV+WOVwKJQsVhtgHpqCgXRwM8mrUno6ln7HkcMSLbrI71/v3dt+1fotkG7fRX7p3+wlM/2weZ6g0GA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=MqnVxbXV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 21/45] package/gvfs: switch to https download
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gvfs/gvfs.hash | 2 +-
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index f4a5364f1f..fc068ddb94 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.48/gvfs-1.48.1.sha256sum
+# From https://download.gnome.org/sources/gvfs/1.48/gvfs-1.48.1.sha256sum
 sha256  b2ea4f271aad2711f16b43c03151e2ec5a9874ff1a21142ef6d6406486a19dc2  gvfs-1.48.1.tar.xz
 
 # Hash for license file
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 4174592455..50efed1abb 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -7,7 +7,7 @@
 GVFS_VERSION_MAJOR = 1.48
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
-GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
+GVFS_SITE = https://download.gnome.org/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
 GVFS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
