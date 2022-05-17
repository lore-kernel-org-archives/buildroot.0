Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88530C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 10:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D95C81B99;
	Tue, 17 May 2022 10:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id My18Xowd5wZ1; Tue, 17 May 2022 10:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8255181A47;
	Tue, 17 May 2022 10:32:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78FC01BF28A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64D95408CE
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatec.at
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcdN5qeb7q97 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 10:32:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::624])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F31D9408A7
 for <buildroot@buildroot.org>; Tue, 17 May 2022 10:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb+uiNNGHcsp4F7SXq+W20sG7INSs+7w82fdAc5qi6T7yzVfBUVvWWdPZ8wT7aUmeXZQbkz9gOvdqE5QZ+zWMycKCWpI+kYA73Yx3WQXoxFNBiyCpUB06KA3+YSTJ9ae8aFdJUQlAuwRVRWjuFbccbjxzmu7eTCNrLNXeYJU7yAX9mNo16LU3j1gEWWY28dTBVbfZ7voxJHCP/tM5Q5lXy3z14juBCllGOpgLIJiS7AnGfRvaUDx3EJ0jIwLIAB1PK5Ipx0TbbnVfbIaBpBhxR5xpH4hY2iEizkDfums57HZZlEF5ckXJxTwVixrixzO+MVkptZ0XPQnXp2wwwCtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSXTww3RXrZ/uFJmNm94kGufvKrvy5qRANyPoRrzrdQ=;
 b=KgdDxOlrQR+FLLrRSgHSu9pjBx9w48qj3xxT7SEiVutEsDA/pwIgnW2FyWGWcI2FDMx0/Bb10eUxJQjnUiupPcs3av/6EtJ3M8RarKxFVONBT0wIxjEESjIz3BsjIU2WeQrjEvsKzSVcFv5B+Haj9894SmIFdgZtWq38quGvQo8QLgdQfT5JtV0+TPagEkVdcKdAMExuz0XjLWzEMOpHMOaa1vw3Ki3OQVKAiBgEsWNFgHIiGHrVgg6rd+NGTeSIgwjxZYoyKfFBK/Rzrhdoiakv0/iQf/oAXTGyPl8x30K/1TcT1HCHAZd8M1KrI7BE+8ier/YmOBhI0HminYbWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSXTww3RXrZ/uFJmNm94kGufvKrvy5qRANyPoRrzrdQ=;
 b=t1HFFGSMCRi8bqpvGsYC9ODhBBdxBTd7/5FW1xKwfXe1F18MZ/+SgKhev2bxI5lYaksrfwWn5WoQKDVEwHuyAM+0BFSF2ZIhcgr8/iJSQP1CKinVkUe4SfbV6GDpG/wPSHd/XqWDuYDDYJaSAfUqS43EQQBeaS1LCS1bzxwT4rI=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by HE1P190MB0123.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c5::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Tue, 17 May 2022 10:32:18 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::7591:2c3e:4e7c:4191]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::7591:2c3e:4e7c:4191%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 10:32:12 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] toolchain: handle white spaces in sysroot path
Thread-Index: AQHYadkWqxFJBE20SEaWLcpm3s8gFg==
Date: Tue, 17 May 2022 10:32:12 +0000
Message-ID: <VI1P190MB0493383AF3C4D4BA08C5CDC09FCE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a74598f9-b80d-42c0-31a3-08da37f08118
x-ms-traffictypediagnostic: HE1P190MB0123:EE_
x-microsoft-antispam-prvs: <HE1P190MB0123DF990D841CA58F9853639FCE9@HE1P190MB0123.EURP190.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 33eOiH2JFKu+DoUic7nYf1P+u61zOzwnhuyUfZLc5chTBT4Pm/8a+tv9zgKEGr/nyekPgeBXgHvUVzEJnlui7A+c2+Bg5bH5ezl0JAk15zRjmBb3vKtwEQHArFSLDkSdKwXc7Idln+ZJLKLSXDbzsVkJB86GJXhSjLFb8mwreUACwZ1FeaEjP1Ot4+UMIDFCS1z5DKjTqhsleIyyvB3/JdxaPgwfrFVtP6FW8JNhFahGjT/kM1dFDgU4xZXPiEJw4to+LorRw+BKLOLyosQ4VthF2SjQqHCQHckqwknN7QaLTowqJY6inTFscY3F34Iy4i+SpEe7henqSxT+nCkCyx9kkaNg7gKsD1WGqDYkUWf8C/Ao1ctba/SuNNTWXlR8sO9mbemoxPPUjipBRJX0f0TM2Q/Xy9sVgltm6c5JknD01a1iir3UTBuldQBcYGHO8Ttq2x3SOCYlFD+Tq6Tv519sOK9YsgnWdWtfkxzZMxpUyfwuIQsiZvG7uTSSHNpYWR34KbAjXdB/4GBOiGQvetvySxRf8jlKvAZoc+xOeJUcl2HmHXcXmACk2BFyPHLcJ1c8/nOqOQVyKkX2m4LKfY7/QHRxTCJBj/1R18wbykItM0PqnxTHaGNPYJlW46V1N3VZszDkTCwZsiHdnUz2+HzvWrg+PCsdtKnVoKG2QVBacYGZG6+DJy353pbMbyogizIcCL2YaNGDgYKXD0XfBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(346002)(366004)(136003)(396003)(39840400004)(376002)(71200400001)(6506007)(186003)(38070700005)(52536014)(508600001)(6916009)(26005)(9686003)(2906002)(55016003)(64756008)(76116006)(66946007)(66446008)(8676002)(66556008)(66476007)(7696005)(33656002)(122000001)(41300700001)(5660300002)(8936002)(83380400001)(316002)(4744005)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hmdpYzBlwCJ3PbV24uIEQp8PSLV1SKWTRzLaRH8DAbDCkIztSJGIT82dhR?=
 =?iso-8859-1?Q?F4SnUB269oXdm9xTn5DTitRXyXAHjv1cxcHbzNl42/iDNg1hm7lG0DtX3a?=
 =?iso-8859-1?Q?JNdpxNabjL/PB5ul3CHQfeXWQOhzeAFvQZV8j1j88W4KU13IxkmApMMmhP?=
 =?iso-8859-1?Q?KflqqSI/bbofn0TbW5meaet4xHsxFvDEvahQFSaY0DxtcpJVW29Ca/qPTJ?=
 =?iso-8859-1?Q?H0sKdNOeIECFInXvMkdbysLYj6o5U13G7L+Qm+CqwiJ1D07Nl7Pee6e8H+?=
 =?iso-8859-1?Q?tr4B1nJ9Db1ac9Y6sP6AbwclYv9yhKVfR+/j+TlzB3cs7m7cMxP+ZjgQyr?=
 =?iso-8859-1?Q?2gGBmU+w868PqMFtESSBfDwOrlLc/USlzRrgSauGkM31D+GI2FKK0OBiDx?=
 =?iso-8859-1?Q?N+8qoA+IP2xoSDcIGhKfchCCm7Cb07pL6dyZ78YSjfziFvuzuEhwNRQB9a?=
 =?iso-8859-1?Q?LNOoLAEDUU1ZpuKmVlVs1LyLoNvYqEl3WpAdHpAzx4P4Q73eDbTOP9Lb1a?=
 =?iso-8859-1?Q?n6A3pbDJPsAkl+XLyblCl0TWNfXajBtfOmyWJ8PCg9+ncLZzNrEQ0zEndw?=
 =?iso-8859-1?Q?PhXLc7WFtNokv4RaaRpYuSYTJr12UhvDt83THCGivFz7f8rHVoSVRK1uxN?=
 =?iso-8859-1?Q?YJnz354bBNmZzDkiN2oFNcizyFWdV6owwBcUY1sgt4ix0CpY3znhhvFg4z?=
 =?iso-8859-1?Q?hpY/qevkLu1BYIT0lr7pUylXB0Cu/zQpySynURkQXaDj0l2fPUw1usSTN8?=
 =?iso-8859-1?Q?psdSSQyJddx9qGe3g0GkQI4dJ60RUofMzAr4tRIKMtw/Ffmt+Y+7Gk6FL9?=
 =?iso-8859-1?Q?aQm/X4H2GC65wmNOzaT8RgQLrsnm+mTWjvav8UDvCuwtw8VTlnyKmH/zrx?=
 =?iso-8859-1?Q?Tpo+jm6BXrwxTOLsJIKnCdgCKEPGEsPjo3BxQoH+lWnRaCU8Y5OsLtz4fq?=
 =?iso-8859-1?Q?gwLrQDj9uivOF+kDTZgeyVPniAoaI6tniZYl9Mxm00HorWItWv3ejUwTRL?=
 =?iso-8859-1?Q?MiMg1NqN/lGaTafTQLrwLHogxRtKQpK0DE/d3pbkF6dqXhl444rKgRUuOR?=
 =?iso-8859-1?Q?2LPeA3pOnPOw54izG9/5msHxsWhfBxtI0goxmlOJc2hunvyQJ3bU9APjQi?=
 =?iso-8859-1?Q?5lb6mPXpVGAKCJLzYrxATlzNBXETaEM/7HPw6pOos9YmOcsjucSVYsmCIU?=
 =?iso-8859-1?Q?k8V9uVhuleBcepg8gXqgt5dXPmBzP395/KlIQb266ZZ30BQgW8QdHGp+Rb?=
 =?iso-8859-1?Q?NycUhjUQTdWEpTD17TVCnUIDjgfz+9Ze/yralB+4mLwCljXV+KlaiQath2?=
 =?iso-8859-1?Q?sGVonM4QyhCfgmf5DuvPA6dE9c0QHZfyRY0xOJxi6pM335CtbcP9BJB5ws?=
 =?iso-8859-1?Q?WlTYR3zzyr+zFqyPFZ0ycL3ydVRItWtjJDLK4goD2ZhKJ8mdWBJbhx7bYI?=
 =?iso-8859-1?Q?flErd+UYXYElAuwHHT4eHTgEtyOeyCH3Al522EUJz2MdQZ4zWEWMpu3Be3?=
 =?iso-8859-1?Q?67zCbLzwKB9mCykidWItUUUNid5PqzJkdea47azV1Q/e8QNCGzrMooO1ig?=
 =?iso-8859-1?Q?3EaxxM8egST7/BL2NKq0u4+udcgknSaiJYRSKVjGuTjsKK/jL65sFQMgt3?=
 =?iso-8859-1?Q?s87GAh/QAk4vWnhgekGpfB+Cn0l8XAw90n+SO52IcHs9c5a7G34+LPJyOg?=
 =?iso-8859-1?Q?hmT94ngndUaM+T2xIQzyAMBDNy2/+Yf7yELWuMZqmIiSKDKQUHxsvDvk1P?=
 =?iso-8859-1?Q?PNeLBe4MD8qYuqI4eDi8+YwhY2Yz2k5RiO1Kd57MTA3f6e?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a74598f9-b80d-42c0-31a3-08da37f08118
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 10:32:12.3402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmmdtLeV1/jSpn63TmKFJcR/WxpZAPT2XbR7RXXaP7KK2cI0JNhc1rCJP1R4MCAlqsGB2l+lo5Ggu4TPWyHkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0123
Subject: [Buildroot] [PATCH 1/1] toolchain: handle white spaces in sysroot
 path
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

When changing permissions on all directories in the staging directory,
after copying sysroot, paths that contain spaces break the call to chmod.

With -print0 for find and -0 for xargs white spaces are correctly interpreted.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Backport to: 2022.02.x
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ef8e9a5f64..eec46d44c6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -150,7 +150,7 @@ copy_toolchain_sysroot = \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
 	fi ; \
-	find $(STAGING_DIR) -type d | xargs chmod 755
+	find $(STAGING_DIR) -type d -print0 | xargs -0 chmod 755
 
 #
 # Check the specified kernel headers version actually matches the
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
