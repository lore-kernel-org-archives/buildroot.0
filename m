Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85804C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C9B440AD5;
	Thu, 19 Jan 2023 09:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C9B440AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eu7lmshfn2_n; Thu, 19 Jan 2023 09:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5488740591;
	Thu, 19 Jan 2023 09:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5488740591
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C92B1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC615404D5
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC615404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyEZrpn2wfFI for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:58:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3BD40222
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2042.outbound.protection.outlook.com [40.107.8.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E3BD40222
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jw64EShc+wFmvvlwgI3jGN3W+3imcSFuVWDw2MztCSybp4+Q7/iqPRVP8/NvMHi8vWEHUMAnWji5X5aXWD0MKYW0tYm1WMbk7Kdd+l1gGQh0T3dGZ5Ir/EgvE5y2odet3mgvBeq3J5DXp0KYSR1MbxuDmmd4PWhRwTwxmrFmZlF9vpx+qHjywxiFoPf/VjF0frmW6xSzBy4H0h/Ox62djfqb8KRzwkzFqIKZ3AYgdhQaveB6YOwjsCquyFLfTcMHCRn2NwPYJ6SonaeQd/shsLhcF8X4lcAVrsLyVZNfGvGZtBbPenr6j5dD/yZDKZfcAj/DoNAWVM28pgm0Vb3Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lt+sLCztfLtPZGSTjoN4ajvsjegZbdgKbnIuHGrl2wA=;
 b=hEB7LxtAyfyxg8cJb2N53Si+5x0gLRKD3J0Ss6gHQRLkaob6TsKwqqtPtZyPU5TUo5FAuKXLh08V24pCUto+DAmcCWmWLgm4fuKe5hMjSPJxk7Q7HqiEhrT9SB92MlSuFM2EPBga68u/u85bWZSa4NsKJbrlNjWWx8osWM7Z74DjGQblqnJJEffzkYI9qvxGG74r/6uR8AWEebgJWJ4KXZoMJxyOOlyv3Y2HIVmIiQEvPtM6524mLUoHXo+ayt8McjQJwCzqlMVEbab7/322lNdv0FGm3qg2LeyyZdBdIFZFisCaAFtzPU5uynh9dN6+QSV65nNV3pWQRbJM7zC50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1956.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:58:45 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:58:45 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 14/45] package/gtkmm3: switch to https download
Thread-Index: AQHZK+t5gZYCEWo8J0i8aeSOzwa9LQ==
Date: Thu, 19 Jan 2023 09:58:45 +0000
Message-ID: <VI1P190MB049334D508278832D69269219FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1956:EE_
x-ms-office365-filtering-correlation-id: a4609fee-4a19-4948-1f29-08dafa03c0c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y5TU68nVw5F6bvaMCFzlrFLoarmLjNCNIwrtymylq8xO4kEzhTKfv6y6346Kqcx6aGcPdXBM2lhEsK3cBobMQeJI9aXCGqH4uOalob4YIpCdSwtC/rrGq8ty2PVWksznoys8e47d1g9k2ekogkrVhkPbZmhaFmR/8Tz2F4pOlOqo7oBO7A1cfYBPEn8Eskb8dX/hwxQ9pZ59Hdbw2jhLhhON9tQ3CqSzcqWYjR3wPYRqtomRznTvjqHwbVFJwQJmN1E4TkDS2cn+l7x2idzc6RQ3FpjVUA7YotQXT0N5/syj3HDWaiu8/+d8fCrdo6I11AX3LZwH7uGP0FxSRsuz2CvvCbWXwwLa3rCO/uNuwLH59LFcOLGEUBBu9Ze767KyHbn5b6CbZD/MgAk3htBffYuZBsyUMBYmkyMEg6dWedLA+6Y1uHYCLXd4b63J0MTBtEj4G2E9lzMxNbjmGKQflalE27Fp0VUVOYqt3PKOrgQ61JX05vQdIl6SPuKNNAiiOwUtl1G4ZGhyFB/mqU1doN/Y6CEWoTi3M7YPYZBxtYu8F+H90heY0iYk321NUojBBaLBy+aE5th8+i5LDaIlYjiDaVJYbRH95S9NwuYUkilplp/LlfLEvj2S95fuZuL5C0FpeefKgcGOTTBcwFMgEzUinKxz0Te3bAWXvzYv0QTlxF8L+eeY8kBBpRwjkCBsMLkkh5iKPW4gMQKIquqRNuXhQbgdPuL0Vt+kX32vFQmuRUwnS7llasTN0hti0WVgasEXO77JVTU2oUgM4zH4lw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(346002)(396003)(136003)(451199015)(71200400001)(8936002)(316002)(122000001)(52536014)(5660300002)(33656002)(86362001)(966005)(7696005)(478600001)(6506007)(2906002)(38070700005)(55016003)(83380400001)(38100700002)(66476007)(66556008)(8676002)(66946007)(6916009)(4326008)(76116006)(64756008)(66446008)(186003)(9686003)(26005)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PMBh/9eKmIP+3zIYS9+fVVCe9asZZ3eJCFMKeNF5XGpXwsH/gS+NbaT82C?=
 =?iso-8859-1?Q?RTSdaNrskxt6jkUfCQ9mXCx5QQVVXXLshR0e59gM7D3btxUD93zN9o3DXE?=
 =?iso-8859-1?Q?QusERKu3pBN/9e06x4p5kbnj7jtWKPJgbhdf4c2//6fM6OfiyB7CHtOVUJ?=
 =?iso-8859-1?Q?s23gtJmb8nEuAmoN3a9a8mpdpq9s7dl6IHZZVLyfJsXus/aRYzxHbpr831?=
 =?iso-8859-1?Q?GCUHa9S8eL7ay3UJN0cwCO89CZGCZUrt7+FlCjD/KWSmWpwzcXZuzdvzpv?=
 =?iso-8859-1?Q?Q4gV9DClqysRkWD/RDDa94d+2XZhZPj8JDtDqBpo7qb2M/xH66kDoHUoWs?=
 =?iso-8859-1?Q?bxBTpzjno7p/6RmG0GwKUYmKK49TM93seBGD/CpSoayNQF/0Q/B6V8C+0a?=
 =?iso-8859-1?Q?I0magOfP+iRSaplHOdaH0UMgNxbD2bI1O8CYgCXevPHNLga8EZvQS2/WAF?=
 =?iso-8859-1?Q?60f9ZYfuEVkw9xBw7TMva/ulUQOx9b04+Qd0L0ZFgu6MxkvElzyik7Xe3h?=
 =?iso-8859-1?Q?Qkaux3sHeV2ulKdAqouQyAzvjlCXroO8y2Z1fv0lmis5OV5i8TpLDgzAw4?=
 =?iso-8859-1?Q?sVu0pLMvrVMSkKwBnV4pfTd0dVhBfFQKzNmKhfBX/PHXBIbU2atUcnN9Sq?=
 =?iso-8859-1?Q?5gi3u3SAx3hHq/b7CaEoau/BWRcyuxmEyiWk0tbeICCTIPPkrG8KHnDlcT?=
 =?iso-8859-1?Q?wiNjMHF4XoRVcWqL/hFfgeP5THINmm9gclkEkQwCXb+lPIb0HLgnMshcaF?=
 =?iso-8859-1?Q?IitaNiaxDi98L1Ugm6JV6j4U9Nr9iXaQVPaT8IWJ2epvmdZnVh8t2aJogI?=
 =?iso-8859-1?Q?Cn7N9/Co1zz+JIHLHlTQUQLsLZLkQTKfCMG5BZTCEi4/l2stSkLfB77nU2?=
 =?iso-8859-1?Q?3FLgJ7+Q6kAot6iJ1c+SLESq3Q4elMgWf9xu62sKDexB5E4Yti5mOGTVeA?=
 =?iso-8859-1?Q?hSv38MjuoZRdO3IjfiRmGbyRuPhy1hczYys3ILp+PEG2Ganks1Ev4syT/L?=
 =?iso-8859-1?Q?2PfkZL1hLn3swdauBIKCqzSaKqMoSMV9Ht08A7AbDgu7jeiVjo4/zG/xXN?=
 =?iso-8859-1?Q?0Qo6RRI2uXTstLMLg7UxY2VUKHGUcA9WV8qP5y3WV4MyK2arohBqgLUwYV?=
 =?iso-8859-1?Q?/Hzti+crwUwff+eO7fRwt3sqdsqDEjZHhQNU/eQMbpdRNERBszBHPlnTGb?=
 =?iso-8859-1?Q?wF2zZ77ZCs7hsWF1PZIzira6JwWs/iWva4CsAi2J8uk89aCqJmOmPEnwbt?=
 =?iso-8859-1?Q?3NoRL6Xzj9OyBi4kK6l8y3EWqyxzYDi4lObvJIB7Luf7/0oQJvATOF+f0V?=
 =?iso-8859-1?Q?RQtcE6ya3XqU1Eg668l0PTuYDQKZ49OqPKf3eWbBLO4+e5JlWVaMosDE37?=
 =?iso-8859-1?Q?dvo0RxXs/vCjf2/ZDxRFFOGeGAroKA44ytzzDfJXR/47Hx0Tomn7lR9wxO?=
 =?iso-8859-1?Q?so7bo+QXzsBjPYXrXIkU8rOLc742b+hd7ZD3y3RnmKJfxUMLq9elJvjYc7?=
 =?iso-8859-1?Q?rIkFKysmNQRjQsloVe8lLX2x4CenbPDbYPujTzc9i27U15rQSvqGoW+yoj?=
 =?iso-8859-1?Q?DCPsbAQNiAVHR165ssaVRRmu0uP4xaCVDr919q0KqKVNjZsVzBNmd6mj7Z?=
 =?iso-8859-1?Q?CViAVlYe2mzCE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a4609fee-4a19-4948-1f29-08dafa03c0c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:58:45.1918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVEgsbJi7GeFlxRIXXg7ZcHXwMT0d3T/n/hxavgTGvM8Lp6cP+/37Zo8v1lPWq69WjAgFJoCpragekK0jx7q/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1956
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt+sLCztfLtPZGSTjoN4ajvsjegZbdgKbnIuHGrl2wA=;
 b=a5rzFq4MKTBKw5yVLbW8P1aWiZ0jPbk7dO9mNaJdTU8bl7yWbdw7L24dsT0AtFybsupBXHCLIXgiz5EWhsukqHTmZJMHcGPyJVcvuuBc98BLv/Pup5BxIm6WNBlIGii121ixnoL8+3dEzD4wTQGEoabspmTiDCHtCLbYhOzFKP4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=a5rzFq4M
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 14/45] package/gtkmm3: switch to https download
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
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gtkmm3/gtkmm3.hash | 2 +-
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 26687507f4..fc7e33339e 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
+# From https://download.gnome.org/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
 sha256  05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5  gtkmm-3.22.0.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 009889142e..d717c08bd8 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -7,7 +7,7 @@
 GTKMM3_VERSION_MAJOR = 3.22
 GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
-GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
+GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
