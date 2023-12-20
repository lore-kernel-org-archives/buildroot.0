Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C602FC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4967282896;
	Wed, 20 Dec 2023 10:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4967282896
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No9wjbBtb9a6; Wed, 20 Dec 2023 10:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5FB682BBC;
	Wed, 20 Dec 2023 10:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5FB682BBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D19821BF2B9
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B02274056A
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02274056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I12kRU0cczOk for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:28:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74BF74054E
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74BF74054E
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BK5j1Un024360
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:28:08 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5v9ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:28:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USNdRk14gJTwRIg8cbKi6TDO+th1Mrpdns765AsaIYSX2XcRr3su1CEJBqsvGidlgJUMW1D0+v9dh77hhn83ImU3vN7nGTWOUBprv4YU+5bD7O5zgmgN+Qe1fmhevt0+++pHEfrr0iptjKTKF88qKxNE6/5nx2lBy6Yx8GplJJJca9kI3RXBcZ4bNIMAu2W1BoIskt6l3rUH/lZC7FcbQsXmNriyuUrVmggw1kkTEp4NLVY0GiNGqU2isCOJurZ2vHrp/QZcXIVqUwNMxkGXSIrlM+2BQTpJ1RpYkqeZLmEaieYx+dRJU6zYY7Ry+CTISdPk7wUU+GM/H/ZaonM2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzMdH7sCB68f9SKa01L831gK7GD92Ez4D3GNlx2imks=;
 b=E6nO5IVmA9wmenDV3eg/D1QFhOb0Lk6hAgGQgE6gVb1Q64fL60yMMXSArUJ1+8QywbrgfbgTcTeUJqKUUvvvAfH35POxCoqb36FuOMjzkkskIfhtwQ+rPLl9TqBjc8XKjSNHn1rHUOVKzuW827IKEdSpm6I31wg4GAfLYxhc4bs0jhu0sBbPpsANIc/jeA/A76SB0NPhQdZM6OEK6CRP5f4q68iSVfF5yCzBqqheU0osb34Tu8pIOco4sMVjTjW6u38+2sdicSFljQDs3EWKsPnKR21gJxkVL2GJ6HO9/TGuBQBi/PxfHXQZUYBivhehC7w+C1s0rDsUrnqZ5lk64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 10:28:04 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 10:28:04 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 18:27:50 +0800
Message-Id: <20231220102750.2717274-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: b01e4461-66e4-4afd-3492-08dc014659d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4Ekr7nW/pHCjyeliOLdb0akahBymvy6mIivlvsFy5WWWfYHrnA9ko+YfrQzosONpiZz92PS8Um43VVu31NCb6ZncAAY/hrsJdy9xtUVYSdFRtD9ICiW0Rkt2C8CqNKaTDJV6MYqYXRWzCFzmwdo/+wwVvpQcIj9DXaN0Vx0yQUQzM7C0PEpCsIGJhXIWmaB+K64aI9JfZ1BC2IZMvPGGe4pH/zgyJanRBQy9RLQVTYfP49QtW8PI+653K2u0r7Bnu5CwaiJFS8Ra4WiNCUnpju9MYybu1MpU/a4Vca7O9xRu12T4acuipCKJ1vdI5rAF6zS2Az4sIHa7nT2qTKIl+hlpj5Cnz3xkb0P6sFLNYSlMlZnCbuRFGie4Vjp6uO72rskHd1S/ZBMIBuXuxO100VgQ6o1jwQKaFPTB7YG97IuFdzSON8Rd1LWSUxk4epHdQ6+guQQvWIZ/d8+7p2tbgx304hj42k+tB3pDkubm8rUvIqz766ciMgzyyrEXoaD7ZzepCaFdcqHx/riqAVnAldcaZxSqVEjLi2n25WTmg2Ikju2BrUDzAA2hSly5X3RqI20Fd6V56EHUmzvKPbqO6cb4QqeFzADPTDQp6fn+mI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39840400004)(396003)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(2906002)(8676002)(8936002)(83170400001)(5660300002)(38350700005)(44832011)(1076003)(26005)(6486002)(2616005)(41300700001)(966005)(478600001)(6506007)(6512007)(6666004)(66946007)(52116002)(66476007)(66556008)(83380400001)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tJTdowHg7dJMTJC0KxUpDzo396Glt8suqpBX4pMmMz5NTj6MGcB6KbBYqkvQ?=
 =?us-ascii?Q?RYnGcIYM57ZNSwH3LVwbzeVN4Olj9UiBcSn3aQA4s4ms9jkICD8j1b26Iva1?=
 =?us-ascii?Q?h/52xoe4WlIRnekCPqz1m6E77co688CgbRItMIN1emYOoEABeRYVQBUPyWj3?=
 =?us-ascii?Q?z2DXMBXEIrjO2zfWsv9kLC5R0NAhcbeQdfkanwYU5VAS+dcrEaCUzwCdIEGb?=
 =?us-ascii?Q?RppwHaWfxI4WCcFelP/2+LBil07WenFW1BzShehik7GX60WJ4+4HlyQADJ/5?=
 =?us-ascii?Q?lV9fK5pNGL12GeRMN6v3qwvS5tt3Tx98rLCmIcsPmzrAAzUc8q7DXRUVuE1F?=
 =?us-ascii?Q?tI/srsVcEjNqCPu0hA8HO+OZTklA2vzPijURA1PUktZIL7YpbFQ8jXXZH75M?=
 =?us-ascii?Q?8bXsJslirAATJKaaGTqG7AM6/gQ4O6Qdu/xy4QJYZB52GWsnRXTM3ztLvzQz?=
 =?us-ascii?Q?SwpfPaQKhRG2qWslXef2xgB3U1lHNPnP/FwSDcYqg4akseCkZuTZQuO1HHlW?=
 =?us-ascii?Q?S2+SNQ1b60kvflythU2ZSI45513m/69L62w716w3Nqeogm7DzOXgY2C4YRez?=
 =?us-ascii?Q?5cndRXryCiEwDX9OEQsIRpUyQyIk83u3u77uVOglZ58LI/VF3tGpTO/AIf9J?=
 =?us-ascii?Q?asrk1pdebAjwtvwnQIY3/+QBodKbRQtVLRgTqLs2Fe+ODFuHRt/fg3staEve?=
 =?us-ascii?Q?IN5+PfvTFyMYzvYRW/wXEHW8y40XTgk8YQML5XllBfCWF/aBsEpAOBHpCvLZ?=
 =?us-ascii?Q?h303ttMPcwlR8EGx5JPWfA0v602spx0WeWdBe24fxgZ6gsWUuyjoqgReDQS2?=
 =?us-ascii?Q?F4Gf2Q0tHdO3cbWwVToL3pXzwuteV/yMqqwwBknGOBx4E/UihNGiAO1EgzW6?=
 =?us-ascii?Q?Me8e1SbRvTUs3MJ5PRMFxpp0WY8TNrcjh9q6Oi5xQ+cQ7pdBTsRWrNIjiCZQ?=
 =?us-ascii?Q?rd4k7tvrRPqrPfZhudXE4vZE56jmTJSqSALkr9PjLnFWlRhMIiW+f+WwJTsW?=
 =?us-ascii?Q?Lv2W4rfY4v5T/wMSNHBBgIc63KCccTOBHR+UWcAwl92YEKC2JW+YShAvftTZ?=
 =?us-ascii?Q?ibeD/lcQyjPBccE1U83QZm4nKvpbuV1Ru7O1XK1P1G4OtUtkzn7eE9w6269l?=
 =?us-ascii?Q?Jkl+B14ybrR1AVPTxwPSgc+QfH6P0G/mSQ/O/UqsZ2i4UmobOLDXilBVRH6w?=
 =?us-ascii?Q?HxTskho3xtAKejy1YkFA5vCHX32tXJNRf+pKWxGv+ldVO/SpfGSPZDAm6c95?=
 =?us-ascii?Q?oBsqHGxV8nSjpwx7zykM/GWnWtt685K9GYM7zPUUGbrVihIWC/iLgJytlQLZ?=
 =?us-ascii?Q?HeTAlmGOsgyOjFBoK0jOzaovo9sYT6V4BmdmsQXwdiAQxZuehSuE1mJBpAjT?=
 =?us-ascii?Q?kDIwsaUJvs+eoARzGWki/H6amUGnxPgFxKbriVeAMUsIkaQ8qfIsoE1mE/2Z?=
 =?us-ascii?Q?9fJyn2KD9UHZmXs1qssYoZXR8+q31cj/WCUwWM+MNyQtiPNBcWFh9bKf/wq/?=
 =?us-ascii?Q?kCOfC7907D+qApcagYrClmggwux67bp8MxJf+KDMW9/rYxtpK5UjiBUsSYn4?=
 =?us-ascii?Q?jEUA+ouUMdGkV9ctawYgLVvthOCywoiRR6h37V91YILw0TtuG4WpbREUHhER?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01e4461-66e4-4afd-3492-08dc014659d3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 10:28:04.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCzi8F6BeFjlKxDYQAfwlgYJ7K+k/n9+Be6DZjs+XnWxgUr/84163WhskSMjjRouiHWe6tmvy3Fymi4XY/+KLpXplNwDcyyrnalndAIDVOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-Proofpoint-ORIG-GUID: 8bFuyL7Be8kNRjdF_34SslOwbNaQGQxM
X-Proofpoint-GUID: 8bFuyL7Be8kNRjdF_34SslOwbNaQGQxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312200073
Subject: [Buildroot] [PATCH] package/gawk: bump to version 5.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changes:
https://git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.3.0

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 852a815d04..3ff0a90030 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  3c1fce1446b4cbee1cd273bd7ec64bc87d89f61537471cd3e05e33a965a250e9  gawk-5.2.2.tar.xz
+sha256  ca9c16d3d11d0ff8c69d79dc0b47267e1329a69b39b799895604ed447d3ca90b  gawk-5.3.0.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 62270cea9c..ff1b9920af 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.2.2
+GAWK_VERSION = 5.3.0
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
