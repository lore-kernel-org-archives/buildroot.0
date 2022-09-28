Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0479C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31D2F409EB;
	Wed, 28 Sep 2022 14:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31D2F409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcUbDcYSCbPD; Wed, 28 Sep 2022 14:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A95409A8;
	Wed, 28 Sep 2022 14:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A95409A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9265A1BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78451409A8
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78451409A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAgZXo4jLDA2 for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:31:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4919A408C3
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4919A408C3
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWDsLNGNNINzxFDUK12sC8i7iQYOQWzWdcV1cs04X71tuJKCpaempTt78q39L8Zb55sgNfUPAztU0sYey1Wnmtbu7FpPkfxXdfZIR+67ZAszCEMNyR7VZqQl3+3DKir9SA3C4lG7FuDxuL7WWhNE/q9W5s1mdVdQOW7VzdGwWySIU8Lj6tgcqoEDM86bXb7KpL7qI3GFz/rhj8Ad/hZQOsPJfFFGJZqRV1LSMr6NFBS/GZB4gh++hevwj93kQAqjM2RnWP/ftXcLf+EyaHdJ5QS4BtKMpP+bWW3O3QAEVFQ9YfWtz4CY+Cdg+0ZSbH6gFYCVfkRvZmmLVLWUl/QCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPLY1oYxLD2xS04rZEdfXAw/CbiflMGbo/+0dV3VbvM=;
 b=jCgmP+qjIx+nTRdxT2e3kcIVgvNr5azUV4UKLATGwz9vrLhnFBQQXSr1bCDvq9Js7tMCl6jpH/Wxuffeyh1tLy2Met4rYQzFTFDFgrv8LLtssIiYyXErn1piIxOu5PpUBmrBx5ncqASkKaxFRnQfO6DUPi7eroCVYa0QMEDT2vgx+mutM72XYO0XLHcYMfiNRe7pRf7xyYsoeLBOCPOpNooQd6XKPgpWadLf4Zr2VwOB6QK8m77UP6mdyE6EWiXsW1VxJvTjz6SIhh5SL2r3u5TBydRqqoYsEqKDX7LuqrO+Ucms/P7zjY0PR+IsFB5IqDrNx1dKf5vsv02mshcqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AS8P190MB1983.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:52f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.26; Wed, 28 Sep 2022 14:31:12 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:31:12 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 06/11] package/llvm-project/llvm-cmake: new package
Thread-Index: AQHY00YBrEFZa3dr1U2L1UGoH1VuLw==
Date: Wed, 28 Sep 2022 14:31:12 +0000
Message-ID: <DB6P190MB0488EAB6A07B59C603A70F099F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AS8P190MB1983:EE_
x-ms-office365-filtering-correlation-id: 69c86c04-f01b-402c-df1b-08daa15e17b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B576jXWXe5yXFSf/GEPHwSoejIJukUAuHFrAEV8XaqHonnpO4YTYAQD8Pq6iel/XV/UMXaBpLC2+yYwXIQql7Pr3Gkm1J6jpa2M/MpUxJRkQHp9QqkLG22N0v8uE9yDnv/aru/24kryuPeIKbVMJSIwuXNVwd7CwHLmLXEvHlpDTbQwmm/TUGqa+osZCn9L+id4mOr606P2eeW0UQAkkkZOpcLm0cet1bMkKi2lqZLFzP0qoJrMGJaJufISqhrmnnZUJoHdZQpPYOMb61Db2B4GIFlFGKPK5f14Dlb6/1ff25g+2fSgeplkbUlCizHZwhcdtIp/5N70H1oFP6jx7zTTdH0di/4TgHvTerxkxzjanroijIOPZ0nxVfm8VxJ3DkXyUfy0lZfSAI3SNbbdI49xS/QdTSoULugPUu42QyK+LA2jpg7N5vhMXcftfCw8Al1C518dr9xJvQlXRHgF0BccN0C8PLNqDyyTZ6QV6Cuo1lPZqsdu21gZWREuayYFh2R+Ato8A3rrN5y7deObQUVS0XU+rc94mijjNdfu7g1ek2tX7yf3QD1az9Q9gkW/O0xjuPKs+DLZOSrwuG99eXsMufRsBR+lTu73b5eJ/ePV71Ssl/UFqpDPxJt3+E5hD3Tq+aVcLX6by/Ausdr85azrX0Iakcv4jKFlPYt/SAWxlQappkyJkzjI3DUBDZbcW2XsBLfn4ccsYK0Yb24PhEiz3KhfD6Ji6ifKgSnqruNk05I3ZlDBDTyx76avflhkvgLKCUqdCHOK1kD/F9eiG5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(366004)(396003)(346002)(136003)(376002)(451199015)(41300700001)(5660300002)(478600001)(52536014)(33656002)(8936002)(38070700005)(2906002)(4326008)(54906003)(86362001)(316002)(91956017)(66946007)(66446008)(8676002)(66476007)(64756008)(66556008)(55016003)(6916009)(122000001)(186003)(76116006)(71200400001)(26005)(7696005)(38100700002)(9686003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tvs0Kmh8cjvWD/Pj/jLYrYcmxwm1Zso+1y8VM01N9OWyWxBSlqWjtnZcQi?=
 =?iso-8859-1?Q?ewXY5ZyZmJgUJ/i6NgukgKN0j9rWM9jdCF4Pyo14bBi6B5U1x4TIhXC0tK?=
 =?iso-8859-1?Q?z1d5CMjE+RmqJW2I4P0/xqGqnNCXF8iZtnhhp0eJyH8Nb/EYuy56OP/Ztn?=
 =?iso-8859-1?Q?rXX3jYRv06WmqDJDSQRWdAYMbXQbFoMXPCoDZAmwM9bhLCEee8KtwiGIXM?=
 =?iso-8859-1?Q?81vOuj2KEZ695hSu4zT/2b+rv055Bia1qMGm4eEMqht49E5BbF+TJI9+i3?=
 =?iso-8859-1?Q?sgCuKYcu/6H/0nY0Ga8DEbVCFLjrNp0quEkul8lttd/Pu6Nfj49Ogv0eJW?=
 =?iso-8859-1?Q?h5N+rvqHCkG38JTCOGY3llWxyFozE3koYAtvBLP4mFTj646jBc22/H/xzV?=
 =?iso-8859-1?Q?l7E4GpUffhy25aRPe+wDZrCRJDATWw0cxBon2zNky7w5FYuh6QtGypivae?=
 =?iso-8859-1?Q?Mn219fKlf/h44i9qq2bvSOtZyV06XPQ4Xib2/xQMkgbegJfQf1tudmyCVE?=
 =?iso-8859-1?Q?QQc+paSTnNvHbqeHqrskkQvOJdLo9Z66pFcijcxphwzihT6SR80eLT270p?=
 =?iso-8859-1?Q?L5mujWM8EJpEXyaCIJrYuC4nPb+1y29s7CAD5tSi1AFfkOawOyp1khDu6r?=
 =?iso-8859-1?Q?9X0AJhzYiTrodJLl1Dkl608ZpWbrv4oLa8QthQFieqbFfdzovoxBADITuV?=
 =?iso-8859-1?Q?HxhxIrX9/ij08yNsNu0QrSfAhx8SZGZQnn4Df8Y2nSSutyZdMNJ3yY6RFk?=
 =?iso-8859-1?Q?p1Wh/w3ZRR03NDe0vsWtHc8QnQp4dEHjhMwB9bbukVBBiW7gu1Ib2GDWLU?=
 =?iso-8859-1?Q?ta6cauf5dQSXPqDwd7Gpsvs8S26865rwO03HzzvYc7Ojx2upI60/O7CJj2?=
 =?iso-8859-1?Q?PK526HxCgTlShweV0gPa8b13ir4W7zFbZRhtLPJeoO2PS0QfDQyIkz6Vb0?=
 =?iso-8859-1?Q?B5KEtMjwrVHKfytky7B6zsIqKfUgz8CEa9NAXwhBooNBe7hquUp60KbBuT?=
 =?iso-8859-1?Q?uyZZ5aOf1xcwCp0KfiX20M1CwU8xwzR+nsor51ZDuB657gzZ+Il9aDu0us?=
 =?iso-8859-1?Q?FanZmMcNkvBNcavVoHneLpRnPeubBakR29kHbTm8jGWbC+tfwo626UW6XA?=
 =?iso-8859-1?Q?yNvjNDKaXcHsbq7HKrOpDXNNlXmM+DeuBYGAjipt0vpmc5yCNILVnYDRQ4?=
 =?iso-8859-1?Q?s/aIqR3E/14SiG+96+HkeL6Xy1tRqiMVSkslZsPc996FIAouEB5bvqAInW?=
 =?iso-8859-1?Q?phJ8v9OdKrX11X8yGSAhUdaxBgZz7S5iRM+lgXTfpxJwE0fYrI+qKtIzZA?=
 =?iso-8859-1?Q?vkb9nlwcIDdFO105WIWkgQfRdYcYZEdoYrlcTGiLPYkmoDVy4f60/ksx05?=
 =?iso-8859-1?Q?exENMXDEDAmIuLWIC2pmudYtab+iLZXs75Og+oiIjM9AQ2zjF/vWR2xQLj?=
 =?iso-8859-1?Q?1V/WVkoUC+1FbueHDYigX/FySkljlIUcQ0ZOVA6ssMLwgS6/mUQUNxVNJ1?=
 =?iso-8859-1?Q?cVhChs/CYLrI2p3vKbTkDkv3hWFXoDiYh++U4oXDBRTyWUE6RyvtiISkfD?=
 =?iso-8859-1?Q?L/R5wg2uQZnr3eBH3t7SzArBWENa4wlvU+XQPdWciZrVSr7M3KxanKfmou?=
 =?iso-8859-1?Q?bKQN6va2PO8ms=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c86c04-f01b-402c-df1b-08daa15e17b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:31:12.2867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtxRqaHbrhuTK8i+UC6GnJqPPPFz/JYaIECE24cdwOkSaw9Eo/7a8x3964K8wZ643bjcn190g0qolFp+wdsM4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPLY1oYxLD2xS04rZEdfXAw/CbiflMGbo/+0dV3VbvM=;
 b=0glke2piWs8FtHrHvTD7iwSuxrODblpSPIwBVZF+S4MfOCX7wOMI8b1R4pRdZ9+0ReBoenoMR65Anh/rOMrGXyz5n1ccowRAX3jF6CUK5dJLCa1J+lOsh7pFnWC+5fO8SEGErcNUcTqgYlLkM6RSp6ZRhT9a161h9IB3dZUZIw0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=0glke2pi
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 06/11] package/llvm-project/llvm-cmake: new
 package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a small host package containing shared cmake modules
that are needed by various projects during configuration.
For example llvm 15 needs it.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/llvm-project/llvm-cmake/llvm-cmake.hash |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk

diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
new file mode 100644
index 0000000000..b76013e810
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  a660d1b7d4d2ef9759de6ad360d5fa9eed3625a6548068a97df2dd706edf2dd0  cmake-15.0.1.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
new file mode 100644
index 0000000000..2527b95063
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# llvm-cmake
+#
+################################################################################
+
+LLVM_CMAKE_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
+LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
+
+define HOST_LLVM_CMAKE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm
+	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
