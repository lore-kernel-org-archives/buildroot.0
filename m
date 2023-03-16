Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9885C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 11:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46FD04192F;
	Thu, 16 Mar 2023 11:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46FD04192F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnFisg0oqH6l; Thu, 16 Mar 2023 11:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47B34193C;
	Thu, 16 Mar 2023 11:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D47B34193C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 863741BF406
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 11:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28080400C8
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 11:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28080400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5Z2nYtnesis for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 11:36:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FFF940385
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FFF940385
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 11:36:34 +0000 (UTC)
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GB6k8o028665
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 04:36:33 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3pbs36943m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 04:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4rp6HmSekUldqTaesjg+/93NgooLKftc8bs3XY5KPq7doD4i6KZLXaxD2JgPVrTn2DyPeqrJKlQfYXWGMB0uCejaWyugqmlLbmehHELZYgDrRPYIvNv6XobWnEOG0S2unvmBNz3GD4NAmDAdNe/bRUsvd4Yo578SAyfwLwHC1jljAtHFs8pRsnfw77iZut8QE2Isu5WhWlTURXjhb2UkpacB7w7oMWPrMkpVyOcE/4XVaqmqqj02BCOI1nuPZ0XnO8ZXB8/6tMl+0//fDK3vif80JHZd23+tfnHlL4AJKsJpzn315QW2e3aICZDpL66KidVZ3Q6l3FPPwF9kgmw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD9KIriYcNW2tWfcpGAY3Qd4FuYR3EI6kEaxEBFImuA=;
 b=Z4mJCTtZg/eON0HFxXDrX8DAYhyY6jIeAieI1MyE7O+lt89V8WIooRxzHWT7NVyOd31Vz1+CMjhJ1ljS0U/5ujPVPk8rUZFfjogET1MBggJNZOtGOJrQp6IvPUK6GjInZlk7MXlTOPif+xTQn15Amr4wxrrsgF6mU67FZ2ofyDNdPCLHGHJS6zhnBt1d3FwzM176aTCRddN/UpMRls6mm8q8v1b+IqvXO3d/q7j4wJLVFmC6ELIVSPtvCqYqXKYjiVwp5FS5ZvnQIBMBOmQCngFtzb+ZU7d+q3EHoxKdFIT+YJhmgH2F4WwDCB8GQWBreUiJRaqBTens9EF+lrke5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:36:30 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3%4]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 11:36:30 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 11:36:15 +0000
Message-Id: <20230316113615.138847-1-simon.rowe@nutanix.com>
X-Mailer: git-send-email 2.22.3
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To DM8PR02MB8121.namprd02.prod.outlook.com
 (2603:10b6:8:1a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR02MB8121:EE_|BY5PR02MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c80a4d0-2628-46a3-ca98-08db2612afd9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOC4SJhor0ldVRbsgbFcg4UO4tT3+nlLXvrLScFm60voSEEBFOa8v8ezNj/iud289sK9IFNND2j7CM+FN+6C7PCNoO0h6s6XOiy4CVf1/OYkb1T8apL1niDu6r+j6krN3pHPySig3gp4pdoxnW3iHT8AT9Sg7JaQr4kV03BGZAaMmdARU4fGOTkCEdOBC/3UAomTCMFYBXL3tGKlR81KskJdCBmCuTaL+kZ0ba2FCNYUf1z5ge7LxwiOYkdVBKBvIea7iXenH56F6YOfpQVVJY+QdscKF3xjLbQUMvteSInHBJZoUeE9tYxTLAmk6L7Ut+KzsCe65vqu0D+SYC46V5sTRrDh7jU1qOcCsB5uvraOLruJs2mK5KMvl433/4vCMsug9X1dn30Eim44ICqQcuHuFpDI47Zp+vyL4zVlTQSjnctJRFqXksD8A/9RKgsGksr1/j+tXAJBY3gQy94QZyP1N+umRthUXmFbB3hjSYucLS1iMaNEa/Z3YHBmkAOnlWS0ng+EY1OKpPDChoWRhg+jV9/WiZNMXMgyM03o7KAkbM+QQ1UoCRcy3I6OcIj2NirG/RARWaOHLkQcVCezARlC3scr6Dq+75W7pXWSKkjKBOAyuyYaD7ikpW6pm+TvMtd35BhdSlXDN9xVROXBvBlrnqM4on0fsuKs4aaB1RD77wsGfux7B2b5+c245vKB9359VnIjZLK8VA8gBdrYZmSMO2gH23Ug6xO6Ymi4paQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39850400004)(136003)(376002)(366004)(396003)(346002)(451199018)(36756003)(86362001)(38100700002)(38350700002)(2906002)(41300700001)(8936002)(44832011)(478600001)(5660300002)(4326008)(966005)(316002)(186003)(1076003)(6506007)(6512007)(83380400001)(26005)(2616005)(66946007)(107886003)(66476007)(6486002)(52116002)(6916009)(8676002)(66556008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9PlTOToadSw8tjD57HZffE07Ytx3aVabGi94QbClbuvDvJSHSMJqumVz163E?=
 =?us-ascii?Q?El2aHiVMVlrONeZFWdnF8zI4Awd2E20xXTcaK+4b6VDR0/wUI/zdcJnhtSA1?=
 =?us-ascii?Q?PojWeXk6QT7vBIxo0kqC/KsRgki2Ql9q/TOU1pdlZSRy7c52cfbl90pSi5IK?=
 =?us-ascii?Q?2vIosmYiaNNkIZRNyEODL5GYq85CKdZhAWvPBuDyQ5PMpQawm1n6bRdfhnvt?=
 =?us-ascii?Q?0Wp/CCgcQjDLId0nUyCFM3GtfUJjIqmK1tjm/aaxJLbhJ8egNVHxdjoDA/ph?=
 =?us-ascii?Q?GGMIVoKWNDBo4W4b/LQvym9/4pRXH7evpuW2WkDeVjC4oJgInCyN9idNoCw3?=
 =?us-ascii?Q?WUDpg5RS7jn7XJkjinFs+qrJXwp3PnmX/E8GfqdY8PRLZm9RkhgObvVDXzKJ?=
 =?us-ascii?Q?8QzXbeQIswkzdq1ci3qNrAQiy+nAdq0aXnN40QBEPY2QeaOiwS37ou8gkGPk?=
 =?us-ascii?Q?poLcvu3cWKH26VXGf/0lyyMq9MJ374HfT1zSymbYaMVM+AyDTPtjVEMvjvnU?=
 =?us-ascii?Q?PFIdSGAmiaqeVAJ5IkIcZVTGaq6t7RqvMWzSmxMr0cqr8q9rHcOHEW3dgNV+?=
 =?us-ascii?Q?Eu3NiiTUAW4dlQMsIaIrauW0aDPqk8IJJXrJ0DfvfynItpxEzIcg+QcXFX0f?=
 =?us-ascii?Q?xB+jOeOO88QpnlXPI3kSZ4hT/mn1sbOqYpht8byOS3tOhHKs2D5+c1+CNHT3?=
 =?us-ascii?Q?pZP+yO6UyAt8EmVWvGyJteBpd9PW/nOCOxFuN+bAJMJrqIASykJRbZdOPAME?=
 =?us-ascii?Q?uqrfoYjf5hLvJiw56hA8LpScdOnrXZ8LbQTaEPbx8nfqBDi0Br82oHPC4+9v?=
 =?us-ascii?Q?1M+S3yh9t/k6Rb/+nGdJHD6ildnNowKshi3Y+lluvm7NsbM5LSDm+ylcIPE0?=
 =?us-ascii?Q?CFHpQJwZbVc3fZvSE8Y2I3uSA6w5GgYndI3SsocZ6e/sz032+cUL7VZW/8ZY?=
 =?us-ascii?Q?q0QdxPgSOR4/usQ2Umtpglhu74rs8JGzbtSC4wfYEe8y9lMV6LBK924dDVIO?=
 =?us-ascii?Q?RpoZH39z1NvYf5wQ79jYn7PHIPD6xTQGt3mEEPFJH74OWgX8Yc18lDEnPBvZ?=
 =?us-ascii?Q?bSf/Nqh1tzcnX08Qp1T+EEsCYQOBxbVb4BlsEQ8zntDtJuencIU8r4LsnOrM?=
 =?us-ascii?Q?Sc2LLXFWzcWGSvhnMt/3GJw4gd9NJ2JahmLmqjTqeauOteeoNfSPcY+7a3be?=
 =?us-ascii?Q?ihK6qCydg8GihAz3VQTDXJMSmZXKBwf2LN1DWEAIzWgRAKfudx/xxi/eSrBq?=
 =?us-ascii?Q?+w+kNYWqBCfTOUMCRv/AwdeGP5I+fDtGXFU7Z+/gnW0UCYX/7b8hGsUelv0U?=
 =?us-ascii?Q?GbXWzV+eGX9F67nZZcQtXlauMF+h6bkxSyZC4nQpSnZBzYKHdJialue26dvf?=
 =?us-ascii?Q?nWT3uHi2f0l26OPNcXnc4yi02BU+k9UzTCCKR+LKf7khXxt/LUS1xKPGrJD8?=
 =?us-ascii?Q?phHJc+O97dmEjW7vP++SBE9EdYVfM4HWOd7o6nGJ3Ul4stOqgUnY8KZDBy7W?=
 =?us-ascii?Q?6pdjfeu+fJGebYNzyqS+uJ6Gb4XUEFw9tqR7LzmRP1gMCXXK2Li209w4yqUH?=
 =?us-ascii?Q?3kmYm3a58P6HaTBvMUI03q4TDf1xu2oFqdYwHT9p2OR/GkqH45UOVuo/c0g4?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c80a4d0-2628-46a3-ca98-08db2612afd9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 11:36:30.6797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30r+qfEmKGUzEInO7DynXDQHSfjXn/fdBvzeCu6vZZ9+2IfexXFFAlmzvSnTJOKnnBL1qYEs4eQx79U9ysxyiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6772
X-Proofpoint-GUID: OMYrVMKfi6HjIlHpjBFLcx2l4dE1Bxof
X-Proofpoint-ORIG-GUID: OMYrVMKfi6HjIlHpjBFLcx2l4dE1Bxof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_08,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=FD9KIriYcNW2tWfcpGAY3Qd4FuYR3EI6kEaxEBFImuA=;
 b=MjP7o8NfzTsC3rJXH6Pc328MLGqLLni9mxBCmDmf5/RG6hYhVT40m2N/j4hgTEPVcBj7
 8dQvzGBX5s0keMo9d7K6QmkJHaIq6g9DCYUiLTTQFO4z4EstuasYC+SH90MplJs+SCQD
 GnEeF8JcQDZRNKC6YiKeMaJakRmeQaA8yQt5EdlYhtLFu+5a5HPJwP5Yje6no4IYHSM4
 SBhX1cL9d0TStceMKpir7Rh/qB4EGYZi4IISNk5J+hVBjdSZI0Cxp/fCOSE+PPoV/kyW
 o+4RCE22fxyudAmPjVc6o4gusMgc1vGdOpvdCmoWOlrGcOA6iSFfHWxUfMlGFJpIiP5T 3A== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD9KIriYcNW2tWfcpGAY3Qd4FuYR3EI6kEaxEBFImuA=;
 b=Pn3XfF4XRkUPUEHtmoK8aA6CZUXL23th/uoMQMMI9T7JB3qpqwannaAvmGXQiU5sGNUgt4erAEu9eststMZ8nmwna84Ul/tbrwJOFaUcPUVHhzcwGaXmaHWS2XmInp+wRAsy2lPh5N9+74e+Zvm7nPCW9qEEmRo737YiFi7VkvYWURvE/3xxvNzQaak2cHbdTr5tn1IRcV152bYJGpdjIZgbpeXaaAjTJ8P+vo2VcTJLOS90QFAY5gMK7nGm/8LmXg6Ia1Jw69Oi2iPKdEBuM0U+b2LlPu3VmXvyMyiWyCLN6BXckSid1AJyMZ8aPSaMkPPus8ha5FO/HDnguom6uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com
 header.a=rsa-sha256 header.s=proofpoint20171006 header.b=MjP7o8Nf; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=Pn3XfF4X
Subject: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
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
Cc: Simon Rowe <simon.rowe@nutanix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LVM uses some glibc-specific functions to try and control locking
memory in RAM. As a result the package is currently disabled when
using musl.

Apply patches taken from gentoo:

    https://github.com/gentoo/gentoo/pull/25883
    https://github.com/gentoo/gentoo/pull/26024

and drop the prohibition on musl in Config.in.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
---
 .../lvm2/0001-lvm2-2.03.14-r1-add-fcntl.patch | 25 +++++++++++
 ...002-lvm2-2.03.14-r1-fopen-to-freopen.patch | 44 +++++++++++++++++++
 .../lvm2/0003-lvm2-2.03.14-r1-mallinfo.patch  | 20 +++++++++
 .../lvm2/0004-lvm2-2.03.14-freopen_n2.patch   | 36 +++++++++++++++
 package/lvm2/Config.in                        |  5 ---
 5 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 package/lvm2/0001-lvm2-2.03.14-r1-add-fcntl.patch
 create mode 100644 package/lvm2/0002-lvm2-2.03.14-r1-fopen-to-freopen.patch
 create mode 100644 package/lvm2/0003-lvm2-2.03.14-r1-mallinfo.patch
 create mode 100644 package/lvm2/0004-lvm2-2.03.14-freopen_n2.patch

diff --git a/package/lvm2/0001-lvm2-2.03.14-r1-add-fcntl.patch b/package/lvm2/0001-lvm2-2.03.14-r1-add-fcntl.patch
new file mode 100644
index 0000000000..14b3164c3f
--- /dev/null
+++ b/package/lvm2/0001-lvm2-2.03.14-r1-add-fcntl.patch
@@ -0,0 +1,25 @@
+https://bugs.gentoo.org/712336
+https://bugs.gentoo.org/549506
+
+Adds fcntl.h into daemon-server.c to define fcntl and some constants.
+
+Fetch from: https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=515ec4557c56cf0e82b95873056c40d8c6269694
+---
+ libdaemon/server/daemon-server.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
+index 88905a7..771b021 100644
+--- a/libdaemon/server/daemon-server.c
++++ b/libdaemon/server/daemon-server.c
+@@ -28,6 +28,7 @@
+ #include <sys/un.h>
+ #include <unistd.h>
+ #include <signal.h>
++#include <fcntl.h>
+ 
+ #include <syslog.h> /* FIXME. For the global closelog(). */
+ 
+-- 
+2.35.1
+
diff --git a/package/lvm2/0002-lvm2-2.03.14-r1-fopen-to-freopen.patch b/package/lvm2/0002-lvm2-2.03.14-r1-fopen-to-freopen.patch
new file mode 100644
index 0000000000..1d47fdb283
--- /dev/null
+++ b/package/lvm2/0002-lvm2-2.03.14-r1-fopen-to-freopen.patch
@@ -0,0 +1,44 @@
+In musl stdout, stdin and stderr are read-only unlike in glibc.
+This patch changes std* = fopen(...) to freopen(..., std*).
+
+See: https://www.gnu.org/software/libc/manual/html_node/Standard-Streams.html and https://wiki.gentoo.org/wiki/User:Sam/Musl_porting_notes
+
+Fetch from: https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=515ec4557c56cf0e82b95873056c40d8c6269694
+---
+ tools/lvmcmdline.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
+index 1e12bed..19da1e5 100644
+--- a/tools/lvmcmdline.c
++++ b/tools/lvmcmdline.c
+@@ -3384,7 +3384,7 @@ static int _check_standard_fds(void)
+ 	int err = is_valid_fd(STDERR_FILENO);
+ 
+ 	if (!is_valid_fd(STDIN_FILENO) &&
+-	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
++		!freopen(_PATH_DEVNULL, "r", stdin)) {
+ 		if (err)
+ 			perror("stdin stream open");
+ 		else
+@@ -3394,7 +3394,7 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDOUT_FILENO) &&
+-	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
++		!freopen(_PATH_DEVNULL, "w", stdout)) {
+ 		if (err)
+ 			perror("stdout stream open");
+ 		/* else no stdout */
+@@ -3402,7 +3402,7 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDERR_FILENO) &&
+-	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
++		!freopen(_PATH_DEVNULL, "w", stderr)) {
+ 		printf("stderr stream open: %s\n",
+ 		       strerror(errno));
+ 		return 0;
+-- 
+2.35.1
+
diff --git a/package/lvm2/0003-lvm2-2.03.14-r1-mallinfo.patch b/package/lvm2/0003-lvm2-2.03.14-r1-mallinfo.patch
new file mode 100644
index 0000000000..d593dca171
--- /dev/null
+++ b/package/lvm2/0003-lvm2-2.03.14-r1-mallinfo.patch
@@ -0,0 +1,20 @@
+https://git.alpinelinux.org/aports/tree/main/lvm2/mallinfo.patch
+
+Patch from Alpine, disables _allocate_memory since mallinfo isn't defined in musl.
+19:17 <@sam_> your caution is well-advised, but it should be safe enough given it's only affecting the non-glibc path
+
+Should be looked back to!
+
+Fetch from: https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=515ec4557c56cf0e82b95873056c40d8c6269694
+
+--- ./lib/mm/memlock.c.orig	2015-03-09 11:18:41.560028850 -0100
++++ ./lib/mm/memlock.c	2015-03-09 11:19:54.504373309 -0100
+@@ -137,7 +137,7 @@
+ 
+ static void _allocate_memory(void)
+ {
+-#ifndef VALGRIND_POOL
++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
+ 	void *stack_mem;
+ 	struct rlimit limit;
+ 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
diff --git a/package/lvm2/0004-lvm2-2.03.14-freopen_n2.patch b/package/lvm2/0004-lvm2-2.03.14-freopen_n2.patch
new file mode 100644
index 0000000000..d19bc99b7c
--- /dev/null
+++ b/package/lvm2/0004-lvm2-2.03.14-freopen_n2.patch
@@ -0,0 +1,36 @@
+In musl, the standard streams are read-only. To modify them we need to
+use freopen. This patch does the same as lvm2-2.03.14-r1-fopen-to-freopen.patch
+
+https://listman.redhat.com/archives/lvm-devel/2022-June/024203.html
+
+See also:
+https://wiki.gentoo.org/wiki/User:Sam/Musl_porting_notes#error:_assignment_of_read-only_variable_.27.5Bstdout.7Cstdin.7Cstderr.5D.27
+https://www.gnu.org/software/libc/manual/html_node/Standard-Streams.html
+
+Fetch from: http://listman.redhat.com/archives/lvm-devel/attachments/20220621/3594a4a7/attachment.bin
+
+---
+ lib/log/log.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/log/log.c b/lib/log/log.c
+index 7b4d537..897c183 100644
+--- a/lib/log/log.c
++++ b/lib/log/log.c
+@@ -207,8 +207,12 @@ int reopen_standard_stream(FILE **stream, const char *mode)
+ 	}
+ 
+ 	_check_and_replace_standard_log_streams(old_stream, new_stream);
+-
++	
++#ifdef __GLIBC__
+ 	*stream = new_stream;
++#else
++	freopen(NULL, mode, *stream);
++#endif
+ 	return 1;
+ }
+ 
+-- 
+2.35.1
+
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index cc740dd40c..577a90656a 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -27,15 +27,10 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
-	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
-comment "lvm2 standard install needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
-- 
2.22.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
