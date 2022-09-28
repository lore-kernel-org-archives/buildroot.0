Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4635EC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66F182EB4;
	Wed, 28 Sep 2022 14:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66F182EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1YTmo3tSMsn; Wed, 28 Sep 2022 14:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C638F81399;
	Wed, 28 Sep 2022 14:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C638F81399
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5BE1BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 231B341738
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 231B341738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HHxUUAPkGZq for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0B9409A8
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2073.outbound.protection.outlook.com [40.107.105.73])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA0B9409A8
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+dJi/Dw7GEucCkVDUNp+BTdSFRq6Z29FVvcV6TV95TNPVKl2WZiJNsdSxIY1Whj0S4W1DjWQFv4P0x3OoKqwduGyQ4isdMcliwuKWJ8Y3NppGNB+zs6nLYoyzqT7ckzFV+KXQ8DuGpjNSJvqM7+mcfUP7LkIRdRU2C3MA9+1jSNdr5ihnPzA7Sce8mRO1jsC4fBPJUdYDhVhCOD7LhxCtRZNTuhQqhPmlFVNJDTOIJwtuAjT44x0Ct8eK+C4pFwL5UOBOj9Lobf+tGeyBKJ7IHVA0SlrWRffMkD5fE+m5c2Sx/wZJe5vdrFQOOJNmYauDbsMS1St4CY0XJ47nPx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aX5B4J1TeZFOzcN9g4A7PYn1paHzeKF9Chm2yE664U=;
 b=aNdxIhzbq8cWWf2S6pmIPq6bfH8AuzeKyNiLQOcAyHTV70+NKB8ccBYVkOLEfR26vQCzpC4rSpXxt0aDYqSI86MGgxy1cqQlDZzNEM7wpNTvXE0EtDZj2Yd2ucQ8IzCb3g6SGTFyWWwnf8RVCVodUK3ZQNs4X6mW1xkTrcsPy4Y/xoWz0saulq8MX0T4RKQL2xFzthmZ5eYi2v5NsVL21fizR1O5bVxoqF5XHg4W7qq8sGPsQePWbkiR/XsKhFQM/XATXCIbRXcHPnibm2vA7r6jHbVdHT6d3o65LKTan9MglZ9LCYFx3QIYi38TX78LvQ/4qj9R6M8w29xIAPiafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM7P190MB0776.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:119::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:29:10 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:29:10 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 02/11] package/llvm: move to llvm-project folder
Thread-Index: AQHY00WkdYCyLkNlgkKRe+cwuVK2NQ==
Date: Wed, 28 Sep 2022 14:29:10 +0000
Message-ID: <DB6P190MB0488F4943166CE4A4DA3D25F9F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM7P190MB0776:EE_
x-ms-office365-filtering-correlation-id: a6f63961-fabc-4195-bafb-08daa15dcede
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NThaelw75P/H2RYbF798+mZKlTIG0UIOVtnhPa/9bSlz218AL2BGFdqLqUl995BFjseRItayr9SQQWhLm8Sj7S1jTBv7pqNbT/lcPgNGCW/DRcdUALTQxSrBvik51iSB9HlStLqKoKObYAfu0H7iICg8wMJwsGMO0cDDst6xp1WUFHo6lTe5mVgyZg8ZYRQKlK2W9soh8INB4/TOTbBQHYFj9Fp7iGKedOKNkyIUZW37yc1tgi86uCLPN5e81PZYo1BE0bswcKYGfPnFJ4FEi28EBo6bZ1jBmFDvNYFjpi+uAW8ageEg6n8a1uzZYp8vLo1PXiMn2nEyHNoKo9sAeoyuY3saqXQzh+C9IoxJA9T4/oUd+bSqbq4ZIsnJQU1cihXn/Qk2571IqexUZOOcb1DHKyWyqgORsCRJ+pMGWHikppgL7nuF60HZX2HhZgnz4AM4BSVb2kh/Rj09go2IO9F9n4f6HHuMPTdFLGXQcoNYeGKKYy7hb+iiB8xgyDrhGA/ge5uPjEb+NLqdZXhXvOpTnJZnLvecAghyZESHbo7gR/c+XeVIN4MudkA/dJIOmIwpZDp+AaxsFcONhavF7Tu/s863pWXhHMFzQxx3qX1zyTG+UI+Wp8gcpYWeuB953PunaDem8ONVjZFJYFJZRivtbeaIuJrznegzVKtQbpA06ystpcNB/h0ZqfMH2UBRsEzAyiEoFvpW2fovSm8hfko0FYkfF9RwWhawIZrExlQpbkt1CoSFUKtNBkevqg3pwe9rjvdtuKFL26s1LQYGbYCV9uDOCk8kAXOhszgBu9U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(451199015)(64756008)(4326008)(8676002)(33656002)(2906002)(316002)(66446008)(66476007)(41300700001)(54906003)(6916009)(66556008)(66946007)(76116006)(91956017)(86362001)(7696005)(6506007)(26005)(9686003)(186003)(966005)(83380400001)(71200400001)(55016003)(478600001)(38070700005)(122000001)(38100700002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A2bvY8CFRia+MilLJBlbE127Iku71aY3LWnCa0lhCTmpvxVSaLA5NelnX/?=
 =?iso-8859-1?Q?llkcSx67Zk6zUeFTooPSrXW6lL+wJ6QFpexorDjZYBu6/W9ehm1ZK30f5U?=
 =?iso-8859-1?Q?nLPGfmtjIHGZvEdqD449GHLBtV4jRF7K3FKHHkY8hTqZS3/pZXCkagdM0G?=
 =?iso-8859-1?Q?wtBIDMdnn8Or0jC8qFCdFzvc9t/SXVecnk8EBcm+aPrsBJvxKlGfML5e52?=
 =?iso-8859-1?Q?meMPG4631Q39pZdD01RpcMXcgVRVKwu9VhKSAq5NoStopXDgdtSHxcd7/5?=
 =?iso-8859-1?Q?E481qw6k8urRbH2EslSXVyPD7KgEQTFJBLlr/u8mn2rBf3r7z4FQIH0hfZ?=
 =?iso-8859-1?Q?KoGdv/YZxLONH0FtgWdLvOpM/hsPbV3rHabvtTvR90uHL10pm9GfRUfY7m?=
 =?iso-8859-1?Q?V7WKISePxYEU2ZwJI7ZylCTm1InHgIRVvG+7lxAoMmU6h7e1X2eeUWOUoW?=
 =?iso-8859-1?Q?s0nYwF1DQFVrK5RomWHoLtsmaLbavfqeftvLKFfQd4XZyJDEEhdsyyOfz+?=
 =?iso-8859-1?Q?pRYazugGM6UbcDSs8H1ypK1kyEteI9m+3/kUU+oEBvTBVZii68GEqAVgk4?=
 =?iso-8859-1?Q?Ws5YAhIUSPJwv2sJkeM+C/riYlITieffsmZbBB+sOuViaeDYgnJPTk9Mil?=
 =?iso-8859-1?Q?rm6wbHllYWW+gvDtZ91t189ostpR+PRnF/iqB7bs7AnHaQgh4mLs2Ys3y8?=
 =?iso-8859-1?Q?DSSi6OIo+v4JCdpNpdlIuQ2DWgQFzvcRHU/uDkGu4GjIuJKq61ZooludB6?=
 =?iso-8859-1?Q?014cKOz6pNIpaQ8zm0hWMTrpHEhoaaMk1OK0oUkORZ2+zAhKLT+Tfg9Nwt?=
 =?iso-8859-1?Q?9in5uMOIPMkx/UJBmeG83VTNuYtiKOH0DgKjY1zO1sFsUhs1enih9Sz12m?=
 =?iso-8859-1?Q?6VQyFlVZx/nElZeMQIUHtDL19SyEyA+mBcVfXAzV4QxKLeIxBZGlAuNqbq?=
 =?iso-8859-1?Q?0qIRfha3c03MXvwqRYKGiV/1+ikoYIrPJpkhYDuqYGKF2LQXgciXFK9+20?=
 =?iso-8859-1?Q?V8gK2T9b3/GVcIvHYnd3KMYF1KnQfAwVx+Sd6Ojk9PH6yYGJmcIhG4vV6Y?=
 =?iso-8859-1?Q?/3MJeLKmuB0fgyc5AylH9nWEBJW/NqsD3X7k6u2ll1VKJYVrSijYUcXGSz?=
 =?iso-8859-1?Q?bnq/X45Ev7gjttwk1s2F42LVU3+261qcyJ7SXhEEk1xHjz08AMPj9Q9hcF?=
 =?iso-8859-1?Q?KebBiwvrr5t0NeD5dgW8+LOOUyX4IN3HA7W5Py2DPn/cY3eN1iawcmlT0Z?=
 =?iso-8859-1?Q?ncwdqAz0ElZsRgmVTIiGYRb7uzeUWFbPqVmZ48t8TbJ7N7ZVqEvleLmjSE?=
 =?iso-8859-1?Q?hiM82QkP65DnhHwNyooCMMBet6dWEhUEYRsZ/LQ4PGSxPNae5GsHoFnslZ?=
 =?iso-8859-1?Q?EPHgeY8WIWEnafS8JqEiVvox3Ak4lfM8B36/vYAvegLu4k5bUJfC7JELso?=
 =?iso-8859-1?Q?p4gHR8/9Z1tXu76SKdUyE+JTgxDTSuFkbQ5IfOXJDTMtTsMvNOu2zlakE/?=
 =?iso-8859-1?Q?Ltab36vDnYyvJR/79bk6bv6iLszfhz276WO0M2KDg51MzApTN+yH6aw9qF?=
 =?iso-8859-1?Q?1Zrct1HqN1asaqkZA22d2e8PnGfdvYOXsE52h6MvhbgarFeKrXqii8W31O?=
 =?iso-8859-1?Q?DvZV12MHGH+A8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f63961-fabc-4195-bafb-08daa15dcede
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:29:10.0767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQB6SJ6xu6EPbDV8WQeWAv6lRMNWzevcH8AdDoQpYDNEwIM17/1OwgHGhRMpyoHc148Wm0uWN6bCknDAddoSQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0776
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aX5B4J1TeZFOzcN9g4A7PYn1paHzeKF9Chm2yE664U=;
 b=OyAybANWyo5cORdFm8sU/jvpoVk+9OoFL6MkuiqdjBOHZ58YyEy52C47bO3NntduUA7VEBud64XLO6h77P7QZCIxfMMCQDsyDc63MqgZKuhfNWfxTfqfT1/HXZmT3ZN7DeIsvhrdK5IPSDON9dRLg7QM5gY5TG6gF+HFSBPf2vs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=OyAybANW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 02/11] package/llvm: move to llvm-project folder
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

To make updating easier, move llvm into the llvm-project folder
and use the defined information.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                                                  | 6 +++---
 package/Config.in                                           | 2 +-
 .../llvm/0001-nfc-Fix-missing-include.patch                 | 0
 package/{ => llvm-project}/llvm/Config.in                   | 0
 package/{ => llvm-project}/llvm/llvm.hash                   | 0
 package/{ => llvm-project}/llvm/llvm.mk                     | 5 ++---
 6 files changed, 6 insertions(+), 7 deletions(-)
 rename package/{ => llvm-project}/llvm/0001-nfc-Fix-missing-include.patch (100%)
 rename package/{ => llvm-project}/llvm/Config.in (100%)
 rename package/{ => llvm-project}/llvm/llvm.hash (100%)
 rename package/{ => llvm-project}/llvm/llvm.mk (98%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6a54..8fe8ca6997 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1610,7 +1610,7 @@ F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/
@@ -2541,7 +2541,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/mesa3d/
@@ -2950,7 +2950,7 @@ N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..3b7d4a9448 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2069,7 +2069,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
-	source "package/llvm/Config.in"
+	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
similarity index 100%
rename from package/llvm/0001-nfc-Fix-missing-include.patch
rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in
similarity index 100%
rename from package/llvm/Config.in
rename to package/llvm-project/llvm/Config.in
diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
similarity index 100%
rename from package/llvm/llvm.hash
rename to package/llvm-project/llvm/llvm.hash
diff --git a/package/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
similarity index 98%
rename from package/llvm/llvm.mk
rename to package/llvm-project/llvm/llvm.mk
index 977c0a08c2..1adad17b16 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 11.1.0
-LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
+LLVM_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_SITE = $(LLVM_PROJECT_SITE)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
