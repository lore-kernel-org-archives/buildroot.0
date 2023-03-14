Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE3C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730F9410C3;
	Tue, 14 Mar 2023 08:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730F9410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwALbzj0dIEH; Tue, 14 Mar 2023 08:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674C2410D2;
	Tue, 14 Mar 2023 08:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674C2410D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE191BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D0A813E4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D0A813E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izhhh5iAUk78 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:08:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D408813B1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::621])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D408813B1
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3g34yCLaURcIS6vuO8amn5q47plYeO6yi1hFxIR5REkhWQOd4OiyEtuwLrFzY3f5HRwFenYmqV16sfU8E4aNcXmEIf5Vm6KnNx9vibuV9siF3Anw5F+gFIlW1k9tyHeJ8+M0UQBIIiSfz1G0H/pXG348y+anviCICQLx9whOxaQyKHHW5vmrqREbY7Rl3INXojNaCMBgbpdtLiKfwx63kWI3uTvTut8xgCDcte/GSSjTJPi3L+dXdLm/2NHU++PFuOwIe8CGI5kwajc6nhUkgc491Bgmc8xD+PiTxQd226tR9DQIvyQIh1qTrQqdsEjuhoFJoANNiuZpmkw1rV0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtNtRnSVQL/FFLYRCm5r3huk7bYH5AVkqlo4yaTcDio=;
 b=aoNCkuZ8LvufEGYrk7gfXRDQ0L+2kWh5NQWVPE4k+gG+r753jx47yT6DjufnGUkMW41yMN82zMZXDYh2G92SRFvH8BJtk2yYHCaUs6hdhNpmj/iZZ3MgswHXHZ5ZHz28xY2/vK5eNtIGm7aOLONRSogF1Yn4dCXjh0FEQJDja1MppOWpW0SzfXd4eaTiD07AzHCnXyw/nnarjWiw0LmO8XeEglcfjct99+6sPnDfAGLiC4fOuJeWPSAHS4Q3U2BUXtoCauSEFP1PZqjSPatIJtFFLLyKWeAwvk8dMJSzb1fqCFvFaqPUvvQmyD6k+wSpi6uEOCpZBBOeYJUceSLZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0830.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:08:27 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:08:26 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/2] package/lzop: fix COPYING hash
Thread-Index: AQHZVkvv2yflQluSxEqJMv7plECicQ==
Date: Tue, 14 Mar 2023 08:08:26 +0000
Message-ID: <VI1P190MB049361B7F42628BA25F562D89FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0830:EE_
x-ms-office365-filtering-correlation-id: 079761af-7c67-440a-f69f-08db24634a3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /K7MRA3ITZ+OyKqYFL9l4QgwbitK03cCKC+7ztzLaN280EPB0ushcLnsnYOi/PNWcjTavv7CtC6ZFqK8yqagX+On/dxGw7IE8lNdhNCcyzGx7lpLsgJn4R4yBqFZH43LbEuJh7i+eplTy0FqOmQ8Hac4gMywtlww4zKHSMhlb4N5w9TTUd+EJT6ueMiTWt92bo7NsC6V4CtJeDt4hRF3D4Ssbxd201IUHGcFslEc9p4be1QWNGShkaoM64P2oXtKQmhCDvfqD8dSn2fz4+rLc8CbkcDmZCT+7sCayasY74I0ErwhcD84tI6XBv0nl6Hxy/5J7rjNZCduYyDwt4imIdP99qAyR5LCCf8XmKzQMfXDtl9cA/HD4x10EKUytkbAfn34hGXkF/W7W2q38KnTqQLaepZACKln4MPw8TGLzspB9MuVVZ5eJm93so3391lTYLZnnTlVPoJM/spL+/8C8+o71nLMSmG5LxstYHKQMyCfmiwSxnbvBLe1U7hIg3YzHRZi4kqNblnJMV1mVajSoUyGctGBSEbG+J6CF3UtLoxEBTpp/PfocXdlvqv6ArZTa9EMHAcoALX9obCAopUMURNH1eKS4E8lZw5crR9amY6Uv6maHR+mUmnTvu8z+FgPCEcwvLqEp8Aa5I0mBc2Lq1dQQRZnNqElk7vBSDIYkp8Zndn2zdIR67tJgy2XeiNKNxDzV3RNIs9USINP3yb8IQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(39840400004)(346002)(451199018)(2906002)(52536014)(83380400001)(55016003)(966005)(26005)(6506007)(7696005)(5660300002)(4744005)(9686003)(316002)(186003)(38070700005)(33656002)(71200400001)(8936002)(86362001)(41300700001)(8676002)(66946007)(64756008)(66446008)(66556008)(66476007)(6916009)(38100700002)(122000001)(76116006)(4326008)(478600001)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WgwKzOvgAPTuoUuiUYNJ0sLuYLhXu7K/f/AdXtjuHTqiqECf1OVMfFhivB?=
 =?iso-8859-1?Q?U/+a9eWjsr0Rbx0JLsXiRdfBjOFieoxwk3zbwyKZlF5Z8dC+0o+edTMXHs?=
 =?iso-8859-1?Q?WuJFYy8WEam1SwImIFcEUqwQgVCt0Z6LCZmxwDEm6yA3XdrKjbZfvQGF06?=
 =?iso-8859-1?Q?iGWSi0twpLWaaYojmSJGusUEUwCwfluKK7if/DbCvP9sjBOTbb0YVuWO1A?=
 =?iso-8859-1?Q?yUPp4KhX6FhG1NrCVXm7Ddb+D+aPcfFqmRnRLdUN98M47Nlt57ksec2LL6?=
 =?iso-8859-1?Q?wd6VZFgQ4lP5SWKe9d6ClLKulpEE3+w73jvvUOZV744BiHOdfkTw/5kt8b?=
 =?iso-8859-1?Q?LefWbvEgJYOSCCjDQoThMbM6eBOkzuidLxpw8pqFBY0+WBAsWt/8k5O/BO?=
 =?iso-8859-1?Q?WTUN4HeGY2Y32LYlfzAmuRjB0XQpybTBes/qXoHe+TKR8UbH4T0jRNNqwR?=
 =?iso-8859-1?Q?e+9Osr5JG9pUpQ5fuLOECSZ7XSDe3sx4C7R/GQjcSnZ1/xudfQFRASO+xi?=
 =?iso-8859-1?Q?J+kN2ol8p9+W5qrtZi1mKuxHWMcfzUbXj2U01IoptiN6Fr0dKyU/DiyhUG?=
 =?iso-8859-1?Q?pT9D+fnpczwpwjfDAMs06w8rES2ZeBlJdSwE+PNHe3vZoph+/zE9u16ZUW?=
 =?iso-8859-1?Q?OcEFWyFOSNKeEh0RTX9IQaGh8W7rYMgvDOA0rrxjyOGcyL8UOyqitkycyM?=
 =?iso-8859-1?Q?hEhqh2TRyAmln8450JtJ1jxbOlQAOxlRRL98DBeVKG4pqhHR6aDYhoVQ6t?=
 =?iso-8859-1?Q?JWELqjfGOO2uGCC6CKbgd3ILiCB8gKS61CRp/Om4l/ucIyf+XrzDPTf0yR?=
 =?iso-8859-1?Q?L4edCPnWvx6oWpsU0ZP9/MmH9K18TQC5ws/6RgE4WbS77P8ycVNf4Yodjk?=
 =?iso-8859-1?Q?EbyIcQFe98g5d27wog40f5xbhdi7gQPis1iJXt6F23QOEUnQL6gl4+SY4X?=
 =?iso-8859-1?Q?AXmvpPmf46sU6o3dWjaRtlFNL5N3IQDBBI4WxmJ+pDuyHyHk2fZmteHcfk?=
 =?iso-8859-1?Q?eCQya6WLZLRXPyHr6+NW8ZZTBOtdVB2NTM54oiCAgvIcLQT1EIw2caJzrt?=
 =?iso-8859-1?Q?xWnQzMqmqInITWIFl4K51UnuS8pnSgkhdMM0Jgn68KM8i1cR6p511wYuOy?=
 =?iso-8859-1?Q?U15zeKiYcWrwldpm2cuVt3spgNk2XBGX3NBygP7kSfJ26Mmb4pBmCtpMwY?=
 =?iso-8859-1?Q?0Wopir8S/PM069P/LbxJqCJtDVf11svXGX7Ogl4VsOIJqOWuwDDzo5vgGj?=
 =?iso-8859-1?Q?+xMxJIpIMCn4FRp/f7xOjKmtSAtMA01iLPvA3cACNHo2Y6vmEBEOWw92xY?=
 =?iso-8859-1?Q?jc4HrWo3uZPj1byRMUKrutxpJMSTGvIKWpRscWNBITDIG+rPHdc2uqp59f?=
 =?iso-8859-1?Q?A2UzHhBCR1C2icQQ8sjJqudU/A6YeIHwDGJCtf+kyNH9SiU/1ti+JQ3Po4?=
 =?iso-8859-1?Q?LjCpmji4xUqafcEScAy78KJF6Iwrsv80zp3IoZkcnt7zS3oJgksWqaAj0C?=
 =?iso-8859-1?Q?qgAglZ6wHYIhf2jMTlROs+lewZnj+oXmUIDMVQwEFFyY8yV/lKFw07ZHaH?=
 =?iso-8859-1?Q?km94kAS2P2NC++l7adeVXowTSttKbaxv8mvCGDlZwjqPcMp4DvrWTLqGN6?=
 =?iso-8859-1?Q?5luBLj6zlY/SU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 079761af-7c67-440a-f69f-08db24634a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 08:08:26.8681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SLiOqXXYY6nKAzrQlF+X1oPwKKf9vFr2+XzAPulT0T2MlZfmu2kKlgS8Wz1xJkQ14ht0jIImqtcXr0IiBcqkVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0830
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtNtRnSVQL/FFLYRCm5r3huk7bYH5AVkqlo4yaTcDio=;
 b=PVEES4/MB1EEKc4Qfh2M9CECw/iOABwj8AFFatu9XhJJgOA3nnpIGCBglwJduRA/+MyLlQmUrtF+iF7nhXapMNQJFB+nJRgm+8hZUdq6QDU0As3Tg0B42iTIWZl2Q4S8D0bPRYE/h9Cmvt+lsb167XnGXPUplFSqLjk4n8rN7KQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=PVEES4/M
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 1/2] package/lzop: fix COPYING hash
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

The version bump in ce95217 forgot to update the hash of the license
file.
Changes include a new address for Free Software Foundation, Inc.

Fixes:
 - http://autobuild.buildroot.net/results/c8a/c8ab973077067b2aa57e4f3ab51bd41ca1543d6f/
 
Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v1 -> v2:
- Add Signed-off-by
---
 package/lzop/lzop.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 99796dc8c93..31849aa0c5d 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41  lzop-1.04.tar.gz
-sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
