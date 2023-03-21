Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35BDC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 13:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7834540BC1;
	Tue, 21 Mar 2023 13:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7834540BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwdc6466w092; Tue, 21 Mar 2023 13:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B14140BC4;
	Tue, 21 Mar 2023 13:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B14140BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDDE1BF327
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9B060BE1
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9B060BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nVMBdI5T1CD for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 13:39:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C50660B79
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C50660B79
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 13:39:18 +0000 (UTC)
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32L8lthp027084; Tue, 21 Mar 2023 06:39:16 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3pdbdkx0rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 06:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLO/HiFkDwNoxNhOhNJrCXGKtxmolXvoILMrAC20Lh3htnr5ODK99ef17I/iaBKeebhmC6aNY2SIyNlfoUCI0O5Q3ZhKmgq3JnESV2qogZ1yDN5bbL/KThKLibonZt1hbtOvGfRWaFsupStsBWL45n/LUy4kvbDuKcAXfT28yqts1W1yDNyhoiLcOaLz9zwvNJFgWYBzQKidK9xhQ7vva3QJN4cqMZrbnmaPLCm8N9oHjtWRk33oXHN2amNxpf6bypCNnNQ2oHblqS8Zqhl4ebZm+6V9aYvidfQWQGIqX0PchRE8vpSFXFYXVfw/Q4JDU6YKq1+Z/AgGZF1/2wafog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mhXTMA3jxG8obFsM2nAeaBfG4saYqFChUYAQC4vSRI=;
 b=lRkMxx4VTm5YEY1UeZLE2+oGulVFuGsf2tmh0r2YsPM9DLeCIy56Dd1GuawH9ApiIMJKieG4YPVNBealFH27oYkyTepepovYLWvWRF7mxumm1InxfMuWzUSRdg7OILIj1EhNNdB4LTRgFCqjX+a0UBPhtSYwAsbj8OgzmNWTgC/5AiGTKsvif7uvoQpfaU8RFHo4mnp3390L4K+0JqGDIua0JcET9O9W4chjmQUj6VzL9OMefFpJCOA22x3P5KACNpPOXgy2Rm61E/0931SE4ePFJbfTgNXdcgeGQKKWAVGJ5Pt/pFAHwEoXiGnIwmzTX7xThaEm/9kajwfy694KDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 IA0PR02MB9437.namprd02.prod.outlook.com (2603:10b6:208:40a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:39:12 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:39:12 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
Thread-Index: AQHZV/uNTZxCJmjV6k+ozJeAjpxo8K8CTv0AgALrHqU=
Date: Tue, 21 Mar 2023 13:39:12 +0000
Message-ID: <DM8PR02MB81219477CD31D864F078BC8493819@DM8PR02MB8121.namprd02.prod.outlook.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230319172554.0d5ea60c@windsurf>
In-Reply-To: <20230319172554.0d5ea60c@windsurf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8121:EE_|IA0PR02MB9437:EE_
x-ms-office365-filtering-correlation-id: 8896fe1c-4779-4911-61fa-08db2a11a81a
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3hbX64fmY01YTeIx0ur9JjLwLnieghmKxEZ0vIRa6Pvki0BPEkLIbVdqRVMAPXaLf1VwI5Q3xo7Nts6+aJYpGbs7sfMXSWQJ4m8AESYZJcv8re+O/euKOpPwJaiG6yqZAYAtq2Po7WQgM8whDDs33oATCMZIiwSWKCWSvjwHaCZTprzf0ed22HeBiP0pDonJL/IxvgldsM+MXXoVFq40SF1P9zu0/9JpABzfaZD5GSur4L/N/ADSecO3OxP154hMNoTCSkvWgYKYH6ufPPL04aS/YK1NVAZABKqEVqs4yafMd+fjGYT+LDhdBFbyJwnVscO8ec8934vRPIq2WxlZhzatDlVIPAhN1ObS9vKVYVp1+2KnntAscKYGuxkkyfbkn+Dplf5qMDNsDMMuGOUqcOP7gtEqE6Yt4ZgsYt97wG872wsS5OhnA3md5NunYP/mj0V5VrdOuMiXyxMRcg8eAnA96Porldd4LRPrIDJqhsh/CLdgf4WeVFEGHTNxTTzQu2l4qAgkpi+kTrER0Q3ZzPUYDgpwMtjAbIbI4IHrYDoVlWcswWp7jdyWkbmz5gDqLif00bc5yi8oEwvChDw3dx21btfshQA+9yg3sWLimgWi4ZnA5oAo8AwMQ1knSeUiLx527pPTFjqcrSkJp5AMhOlw2ynRNkR9u++uedyeKNXKxsVePfEDAQ7fQWicEDnG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(38070700005)(6916009)(4326008)(41300700001)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(8676002)(66556008)(38100700002)(2906002)(55016003)(122000001)(52536014)(44832011)(8936002)(166002)(86362001)(5660300002)(6506007)(26005)(71200400001)(7696005)(966005)(33656002)(9686003)(186003)(83380400001)(478600001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?y4qR/Z73d9nYluFvnJprQjjwxUM97cyu/k2iHl+B0dzcIwdOIixuND07?=
 =?Windows-1252?Q?DZkMjTHdn8+nfk0GSyH3zE7vOX8m/anWoS0kKA5+9AO0FtriTYQbeBfA?=
 =?Windows-1252?Q?SqVV4KqRXQIZrl22NcRQzn9kdjJS+jjoVFV03P/OsWrmCjHtF1/6+ms2?=
 =?Windows-1252?Q?47A7QzLolrP0YjpOIja3/MZmi2DX+20FQw/ABwZciwgm/X7H9EQGLah9?=
 =?Windows-1252?Q?rB6XOvB2iEXknOOt4VpjB0VD5SCr1GVIIkfpkJRO/vK/Bhy3zBDtP3S0?=
 =?Windows-1252?Q?n1w+etXu9qn6WCd1w9bUiNMfadI9bFFHgR1DjfJH8AeS57jgFyfHIh2u?=
 =?Windows-1252?Q?bbcvujF1qlk/ToVNlksBLoiSgfyWs+Az10zOqw/zevnljH3C+NVnShi4?=
 =?Windows-1252?Q?pwqSHlAviw/rqV9IhffmfZhqWuGOO+vVkBtx1HkYeUyHUsyH3fbgZbl+?=
 =?Windows-1252?Q?yHJeRRwHQicwz5VvbEgpzYWyA2AeKhmwAyP7/ywjYiD7uETejo88aB9q?=
 =?Windows-1252?Q?VcVRl5eRQYDwfO0E22EnVY5lw+ODUHKwL+/P2eGt5an7hKrzIURe/JZX?=
 =?Windows-1252?Q?1Wa/W4Q6wUp0RPkfzlOP3wMDntILILClXLvBWhCkW5f/Bu5Y5I7a50mT?=
 =?Windows-1252?Q?z5TMrm8QsuM6e2nUqj+eMo04NT1Eg6ObztM9B67JO3StjNiu2Lo45tpA?=
 =?Windows-1252?Q?4knNmThtZ7fY1/zbX56SGE39SK8MTPKj9DWYdOWFxbzzL3/OhMRfC5/D?=
 =?Windows-1252?Q?o8BWsjU7OypipaJq202E+039rA3OwBEsFDQw3bOV3qUMOEbCT8hgL9yB?=
 =?Windows-1252?Q?EKi3v+/QsJMbdY/pbCYPflRKkVTpwjTwrjcg9kBAD6DQir7xi1V4UEUL?=
 =?Windows-1252?Q?M1M1tsctjR+6IbC4sjIh70rJkTvQIpGpJ/i8oyO+PCvDGFllcT3jdEHz?=
 =?Windows-1252?Q?03pULYRTXUVzzzwVGPOP3qK97Xu+iTHLNXgW/dY4wI665Flmu/doVYeW?=
 =?Windows-1252?Q?GkP+8YI6kYrJetdqM4wNyTLKL65sePLlFZ6Jq65cipZBsPCGPW3S1fkK?=
 =?Windows-1252?Q?pKtOSvdZ5r7NTGQSzKYnDD9Z1nEXnE2WCPvPOXXgIwL/xR1Rmq6LECEe?=
 =?Windows-1252?Q?Egc8MNRfNcuu+a59KqQr+189K7Ulf9spYOEsZWlJWE40Fr+cNhQvg2fV?=
 =?Windows-1252?Q?aN5wjwy3gwDNoMj1UpPen3wVPg6faGuGsStiDp1hIQ/cTbsp8GUqIqZi?=
 =?Windows-1252?Q?8dKwvssQ1fSbJZqdKilliGQrS3OzeUo57qJoCnwNa/GghGaOh2vRm4xD?=
 =?Windows-1252?Q?mw/Jtz3AA8/88qsnns4No91EYqJ88exQS5wv4KaOtogQP4B48QZt54yG?=
 =?Windows-1252?Q?SksOL42Uthxsb/x1I2Z6Xlu+xACLHjYHkzvL5OZ92RyB4Cutf1bMCLT/?=
 =?Windows-1252?Q?3NtNoyaC9SJfaHfhTd/jdrqIzxBi0FthQx3TjPzryUqtkVNjVehmij4F?=
 =?Windows-1252?Q?wotB6Fab2qUY655tZpnQXec8wgOdIH8nLhiqAYn0v5XTacHtVeEyEZIv?=
 =?Windows-1252?Q?YgdsSSgnkrBtjL7ENu3vQhf6teqmJzfG35tinWpEgzWg+0aguDy/QP95?=
 =?Windows-1252?Q?5188cG3rcBSCX2LsgqSJJIHlHFQiYLrV0nvAH4g+oymPZHVAr0BEBKWi?=
 =?Windows-1252?Q?gyhCvh7g9E75ISVkr8yIU0NngfigdGOEJIo3JSZhHB8QH/FBP/hINw?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8896fe1c-4779-4911-61fa-08db2a11a81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 13:39:12.5700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TI0uftc3N7LRQvhXVaS9kn8w6QHp8v8gHUJQsCOs9WfLj3JhRgn6qF6QPh6u6FKY3ic/dxeJLSc+QTijQ9gIAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9437
X-Proofpoint-GUID: gBdDcKkm5HxKI9ytY_Vic-8ZrPTf0mjt
X-Proofpoint-ORIG-GUID: gBdDcKkm5HxKI9ytY_Vic-8ZrPTf0mjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_10,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=5mhXTMA3jxG8obFsM2nAeaBfG4saYqFChUYAQC4vSRI=;
 b=dMq5L/0TlWz1qnONA/8KNc6/sYBTrK4s6sck5GTeJyMZVFtorsoK09tVi/xbpTtsfCwl
 3hY8wW6iPttofaOYs+tzJY3jfWlqnJRa3Numl4WxUCbM19cEbSC8C3/D7rzVUHkpP+om
 shduZoS08n2LFWFI2hZ4NFYi7UznEpLgRIn8LeCc1OtPcVxObbVVxVcu5hMOkKOxD19l
 RA3Qv0eQM97DmP7zIa4Vg3oQyUpSneba0GpwrLWEK09jCpMGAWxFRuUjohckx6V42u7Z
 eRLIyxpBl2xiFPtBJA0BI5wATkQA8gb+ETiOPq1MVErkbDzDb5dWvut+KkcklodZnf6f oQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mhXTMA3jxG8obFsM2nAeaBfG4saYqFChUYAQC4vSRI=;
 b=h7PfAPylYG8+xaSzKRU6UQDdKv0O28bolRusecDwoRY5UpcEZZqgq12PHdNNiWF6zarxn47GuxiilCjbCFewurh6+zZPl/ip6KJenWWrV8WVLrv3sw4DR40/kdgfQpgWkPwd28JlDxISUUKT3Ku5mqN6V7rSAtnDVJZurWQSnCLEyfuVSlScOCnle1jZEP5rs9LvlAilQk0V4ogJyUPh2IdlMD/oATbU1zIDAip/ea3aTD/bggwZUc607xSmCPA8Skvu85J0u0gUi1Dn+dcTgDoPW09/UkS23P2iiNLxOW+ppyxahQGtufLoblg5cgL2cq3KgJ3/vhKjqYVWCKJZ0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com
 header.a=rsa-sha256 header.s=proofpoint20171006 header.b=dMq5L/0T; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=h7PfAPyl
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6203478763729222812=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6203478763729222812==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DM8PR02MB81219477CD31D864F078BC8493819DM8PR02MB8121namp_"

--_000_DM8PR02MB81219477CD31D864F078BC8493819DM8PR02MB8121namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On 19 March 2023 Thomas Petazzoni wrote:

> Thanks Simon for those patches! Could you rework the 4 patches so that
> they are generated with git format-patch and have your Signed-off-by? I
> recommend that you take the upstream Git repo of lvm2, checkout the tag
> corresponding to version 2.03.14, apply the 4 Gentoo patches, each time
> turning the changes into a proper commit.

I am not the author of these patches, which is why I didn=92t add a =91Sign=
ed-off-by:=92. I followed what I thought the process was for patches origin=
ating from elsewhere by adding a =91Fetch from:=92 to each patch as mention=
ed in 19.4 of the manual. I can regenerate them if that=92s the correct app=
roach.

> Another thing to look at is that the multipath-tools package is
> selecting BR2_PACKAGE_LVM2_STANDARD_INSTALL, so you need to check
> whether the depends on !BR2_TOOLCHAIN_USES_MUSL used in
> BR2_PACKAGE_MULTIPATH_TOOLS is still needed? Perhaps thanks to your
> work on lvm2 it is now possible to build/use multipath-tools with musl.

I=92ve not got a use case for multipath myself by I=92ll check if I can get=
 it to build with these patches.

> Another question is the upstream status of the Gentoo patches? Have
> they been submitted for inclusion by the upstream lvm2 project?

There seems to be a suggestion that was attempted on the ticket

https://bugs.gentoo.org/549506

but that was some time ago and there=92s no sign of them being accepted.

Regards
Simon

--_000_DM8PR02MB81219477CD31D864F078BC8493819DM8PR02MB8121namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">On
</span><span style=3D"font-size:12.0pt;color:black">19 March 2023 Thomas Pe=
tazzoni wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; Thanks Simon f=
or those patches! Could you rework the 4 patches so that<br>
&gt; they are generated with git format-patch and have your Signed-off-by? =
I<br>
&gt; recommend that you take the upstream Git repo of lvm2, checkout the ta=
g<br>
&gt; corresponding to version 2.03.14, apply the 4 Gentoo patches, each tim=
e<br>
&gt; turning the changes into a proper commit.<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am not the author=
 of these patches, which is why I didn=92t add a =91Signed-off-by:=92. I fo=
llowed what I thought the process was for patches originating from elsewher=
e by adding a =91Fetch from:=92 to each patch
 as mentioned in 19.4 of the manual. I can regenerate them if that=92s the =
correct approach.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><br>
&gt; Another thing to look at is that the multipath-tools package is<br>
&gt; selecting BR2_PACKAGE_LVM2_STANDARD_INSTALL, so you need to check<br>
&gt; whether the depends on !BR2_TOOLCHAIN_USES_MUSL used in<br>
&gt; BR2_PACKAGE_MULTIPATH_TOOLS is still needed? Perhaps thanks to your<br=
>
&gt; work on lvm2 it is now possible to build/use multipath-tools with musl=
.<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I=92ve not got a us=
e case for multipath myself by I=92ll check if I can get it to build with t=
hese patches.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><br>
&gt; Another question is the upstream status of the Gentoo patches? Have<br=
>
&gt; they been submitted for inclusion by the upstream lvm2 project?<br>
<br>
</span><b><span style=3D"font-size:12.0pt;color:black"><o:p></o:p></span></=
b></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">There seems to be a=
 suggestion that was attempted on the ticket<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><a href=3D"https://=
bugs.gentoo.org/549506">https://bugs.gentoo.org/549506</a><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">but that was some t=
ime ago and there=92s no sign of them being accepted.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Simon<o:p></o:p></s=
pan></p>
</div>
</div>
</body>
</html>

--_000_DM8PR02MB81219477CD31D864F078BC8493819DM8PR02MB8121namp_--

--===============6203478763729222812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6203478763729222812==--
