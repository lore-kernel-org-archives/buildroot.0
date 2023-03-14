Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF48C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2834180C;
	Tue, 14 Mar 2023 08:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2834180C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSo2qwBggBPC; Tue, 14 Mar 2023 08:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A445341484;
	Tue, 14 Mar 2023 08:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A445341484
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9D041BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF4494011F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF4494011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeSSzUjat2YY for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:09:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E9D400D7
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62E9D400D7
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9eFiFvM+ShBa/Xgozv0v0aJMIh7n8R6La9ng5JMuNiHTAzrrOD3N2pub8x6XFRLVUXo5Pxn6UAxzXqqBtbgOBWugFbhyKTh13KTpXGYf2ubR3DheqTAff7rOU+um7LSkjtUUYjgybk3ALzqXmBh61WaPASjNOb8phQDAVMn8pN4HJ2E5gqB0+LoXe3wg0bKOC+hz7/FUDqYDTsm4xO87telSr9PAnuJ/WwMBavpTJv6ll5Q+hk1he7lBPxtCRpeATFWL/mFeOR9p46jh/kZ0HKbMG9n6t2Q4DOUCkZ6m1A9AdZ8GJsWQMnzHZQ7156DSocoLkqhavHU8outRVvchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDyY2rc1egoIDkOx4NiHDj4pzzQHB9ifbJFuGypFDmw=;
 b=VUEJf9dcAKOYNFqq4ZM/3Ocq9KpKmoPnsWCg+QI53MMbMy958WqeuahUpyhGaddzgcLV8VaQUJgArVP9EKdJGFDpZ+GOH+kkUdIFQ0dmPeZJ8J7TrjNd/a+Z6bgSiswBjtPCRJDl62COFoE3O/GrzDaqTlIca0t9G5CSJQG2JumjH4w350ZxNwR5UxNxcxEZo9GsobtqJQUXi1Kjmg58n0htCB/IEWvjhPg0HgraK/L4WAUlYliT4f6jlC5gX5nuGJfpD0sEvDprT5VtaO2iB0eDVwARELDv46zncrXMpX4oVHjp34csD00PV0xFtDkGuzpBMZ2G+efaUOds+pppFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0830.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:09:09 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:09:09 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 2/2] package/lzop: use upstream download hash
Thread-Index: AQHZVkw84X7FJ6196Ueo7HF3WZNEKg==
Date: Tue, 14 Mar 2023 08:09:08 +0000
Message-ID: <VI1P190MB049341547CDC0B6AC3EF8F599FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0830:EE_
x-ms-office365-filtering-correlation-id: d42f36d1-7b57-4abf-0572-08db2463635e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wYhu8Cbjk/hKnZDqc6UrVX5m811oPHHI+zN1t8fSfkeI8yprnO8B0YER4xbPwgg1fxe1HJAedjgOdUDNZrmruK9bjK2fkhMqFYVH01gP4XAevmFTxeWC2TbtlHLTfYzBfm3NepSbHwACpPDLLaRZCJ9MtAVbtDhGK9YEm3GMaj29bMWbh0mNDyN2Pi1+SaZXmdBIaL/wcTq2c6ANR8t7TnICASAC4FmuwzrIeq3IoEkMxUiKSbOxwBfD+mu6cduQT43tESRz+AVF4JO4oCOvRQTgARzD3niftN9t016ura+oRp0c6tuKLn1jquMrO0wevGXcJDcxpWsRcIb+r1csn19AR9Y0gtOkTyvW5MskrYDJVGcHupWf9ZbnqMMwgULolsX/PaffYw5leQiweIPCwXq2mIn7pGAlqSJ4DvhsBo4K8vp3jsjlKRLqbarfNbEh3QnUFh8t8emI9/wWy7t6a+Tl0BMOshuSJZMcxVBePwJvFLmEANmfl5Hi1/OS+WzmbBt0vfliTJ51dAXg2KxW7SDG3OX8vxdZ2UCgFSLtFCxqzmn4G7p8A8vT51OIlapQhYNxbrQJ8fZ85bX5z17kAGWvCXsPnM+Ln5GpvVDS0ZP5rMCgcBXoOkF9jWmuE2tFAWryK4+ovh/64+mXeedJpnjeoAd0lN4GgopeE9TwbJkyfcOt6kn5yGvgSwE5k4EK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(39840400004)(346002)(451199018)(2906002)(52536014)(83380400001)(55016003)(966005)(26005)(6506007)(7696005)(5660300002)(4744005)(9686003)(316002)(186003)(38070700005)(33656002)(71200400001)(8936002)(86362001)(41300700001)(8676002)(66946007)(64756008)(66446008)(66556008)(66476007)(6916009)(38100700002)(122000001)(76116006)(4326008)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6fFbd+IlM64/O3XRqHMvWICC/nMtLlJl52gQXa58PBhqOgpZ+38jISybFm?=
 =?iso-8859-1?Q?LE9e1fJ7M4wfFsagzILttIhSPNEvLafLDrnu04IgJYmjXaRppfKydk16fo?=
 =?iso-8859-1?Q?VEWv48Zd/wiKuu/1yDOfqgBxnPNnSPY3a399k8WioeLk92QwaNdjoDpJo+?=
 =?iso-8859-1?Q?CAWk3EG7juJd+BWEAuK9OHF+YgE2UjvEsqSVRJwUzowHthVjULkioXZgBw?=
 =?iso-8859-1?Q?lrDDvSGv8PyoZA7rHhcQ8J+U90fwAGDs809QtpWDkvvjRazvv4PA8SvSjE?=
 =?iso-8859-1?Q?VTQZrH0VtTgZeRj3dGbazodVkv8Lm6WcGUaOaB0qg6WGeeG1VYPKXnjxau?=
 =?iso-8859-1?Q?Sb4WqWGM1kqN00I4JmbQW9vDNM9COKohaKG6mTDTjVW18owLaIHo8oH058?=
 =?iso-8859-1?Q?xIzerWbB76wDYkpLP1ZJa+md3j4SQBsX80Nq7jv4E85sV1A7kHDuc3QgTA?=
 =?iso-8859-1?Q?0W8ZbiNGL+VStkrSzP5QqEtD4Dekdm+OM4oG19BcnGoo4Twbxjtn4UYebN?=
 =?iso-8859-1?Q?/EqtFy2IPs9aM9OLHQd7JvOYo4TJ1iyJSxAxA+s/DoEQnUcIpw4V4bsx0+?=
 =?iso-8859-1?Q?1ZPM4ATNXvEtwS3tjyYoiacSQ1Yt9WxTp73tMZnYH3YiG/UeJ/MhmXAJ09?=
 =?iso-8859-1?Q?+tJ/VgH4RU2YzuLLJzmzzoPnBLNbMTafNmXOnoKrQOV0MSHimtEwTA2PKt?=
 =?iso-8859-1?Q?qnvChhPbeVX2aalcXfuwu1C0HPegeSGYTJrGX2VVAu4VIIae/Jg/JST3Dx?=
 =?iso-8859-1?Q?IQd+wFDP++fjJbH7AKeY67FsLfUmtWayvN5taCM+gw75cta3jpG/Ox+owW?=
 =?iso-8859-1?Q?QiOi1ZI1/SOnvrlM6+CM9BsLeGStMWs1Z5yjzzsVRMdqby6SsOPPxcFx8h?=
 =?iso-8859-1?Q?ilVCJPtR4iFYxllCgocQtXU9+sd00EOUPKnTaGqI3jgnh5oCjgPIDTzYi0?=
 =?iso-8859-1?Q?YTw9BFVTPD3oDUIjgvx/nH0kpclAWtOaDd30LynSFo0p9kJfYUGHPgCZxS?=
 =?iso-8859-1?Q?8M/LjWOP4K25GkpLRx0QUilIUGQ+NFFElrBvmCzrmvGXlk3k3QIi6bsnlU?=
 =?iso-8859-1?Q?wg/ZyMVoLvXs0n8iZG3qWwRDFtF3LXhN6cKE5XpVtA+FfyYgiF1VspNaEh?=
 =?iso-8859-1?Q?Ol49p63uKpjCpNrG1wcZiSzbUfb5d4a7zOBD9NqXAhEJNtvAF4oYO/NMRz?=
 =?iso-8859-1?Q?+B68kP+nUdp0wiivrR/WjkOwqhOTf9Ma1VnDmkRZ0ZKJJv3MiYfB0g50FX?=
 =?iso-8859-1?Q?bDQuinpYT6gUGSgvLXNgqYXo8AX8fGGuPcMB1B3RbA6TPkwua1mmNDFJE2?=
 =?iso-8859-1?Q?aVfdDiCZ9qQFm0nXoR3iGEpjXgiKK2CCiyHzjke7gMipWWF36W9fssoE+G?=
 =?iso-8859-1?Q?kDsQ8WaPDYSLbgKt+FpEjVnVBqbzHth1G04/M2A1tvQXU7piy4HH8pzuBT?=
 =?iso-8859-1?Q?/5GV4HT+Unzq1OvP0DYb2QUm3vRonMj8p/WNpC8HVE6e6OyAG0t55plGqk?=
 =?iso-8859-1?Q?8xdhI6oxFrPkboWkiPa456KCoVUTlbRIlQKi38oF3CKT8Af+p4brlsq/SC?=
 =?iso-8859-1?Q?dxlh2AxX3XFDc3uSK77vD37dORb1U9j9C9CPW46NMEgKDfrbLIHWes77c/?=
 =?iso-8859-1?Q?XsW0f8xo02Blg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d42f36d1-7b57-4abf-0572-08db2463635e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 08:09:08.9900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69PeLnxNyp6ifhs+36hOiKrVoPnXth/p9E6a7fBPnLIl/JkjOP6QTUUu+OqAunBKWfBBy/eY7PCPa7/4J/olcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0830
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDyY2rc1egoIDkOx4NiHDj4pzzQHB9ifbJFuGypFDmw=;
 b=xmQCEw0p4Zd6lCzneZ/YRmVYnEqxOPJsdkL5Z1Wmwo82I5kANX+euaamahcA81JPvqc4sLkiEKopsIqP4wwXxH+d7CCRtMhIbEOBpNTIauo+/cNcj33CyF02u7oSiwLXlgxAK1l8M1h3P/1xePpeYexAv9pjAYO4Br8L933zjfo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=xmQCEw0p
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 2/2] package/lzop: use upstream download hash
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

The official website includes a sha256 next to the download link.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v1 -> v2:
- Add Signed-off-by
---
 package/lzop/lzop.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 31849aa0c5d..c7dd3d2fe8a 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,4 @@
-# Locally calculated
+# From http://www.lzop.org
 sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
+# Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
