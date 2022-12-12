Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCFBC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E1ED410B5;
	Mon, 12 Dec 2022 15:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E1ED410B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ABDP3-_NSwV; Mon, 12 Dec 2022 15:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A3A410D7;
	Mon, 12 Dec 2022 15:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A3A410D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57EBF1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F07B817B3
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F07B817B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Dpv9AoS0gSG for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:41:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A74817B0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30A74817B0
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:41:35 +0000 (UTC)
Received: from pps.filterd (m0078137.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2BCFdTBd046613; Mon, 12 Dec 2022 15:41:31 GMT
Received: from xnwpv35.utc.com ([167.17.239.15])
 by mx0a-00105401.pphosted.com with ESMTP id 3mcg80ugs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 15:41:31 +0000
Received: from qusnwafg.utcapp.com (qusnwafg.utcapp.com [10.161.48.103])
 by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCFfTur116600
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 15:41:29 GMT
Received: from UUSTOE28.utcmail.com (uustoe28.utcmail.com [10.221.63.42])
 by qusnwafg.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCFfTKu000601
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 15:41:29 GMT
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE28.utcmail.com
 (10.221.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.20; Mon, 12 Dec
 2022 10:41:28 -0500
Received: from UUSTOE21.utcmail.com (10.221.63.21) by uustoe1z.utcmail.com
 (10.221.63.19) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Dec
 2022 09:41:28 -0600
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.181)
 by UUSTOE21.utcmail.com (10.221.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20 via Frontend Transport; Mon, 12 Dec 2022 10:41:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vYjd7Srs08odbqv5zFzEp2OLv8OimsQxgcwn+kns9Hnkn1mzrToM0ALW6EjCtbhHIslta7fIjhurQPtc1UEKldjaqeX/IYSHPTdY+eQ+0zgC6pnmHA3SK/AXs6I1n//83PL//uRJgiYFXNuESmHrWdS55yFCAWgpCG5myecieT5WktO9vNIsPbptqBXyJlLfJ5IHg/lYnMUZ/mh5guuaeI8DLCs6N3AnrgEFk3fSGnSzQAM78JNkzUeL5aHakdwRCB9bS34/GcJwge3lMNKXz9rFY+kbYUo7tYefem53xd0Xo4H7BvJbU1pUjUxNS3aendFzyJnReeyVPnRCg+aGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3u0dgfvj/WYhJwIUyahkJkEnDovkEBBDZfVxb6fP3Q=;
 b=XAJ8wG93P+Bnf/qrnqgdQowBT8wsOb1M3chrwnBhYxAiCl6vHZNgqeG+nVShbXivT7Tdu6QmxqZCwzOYf872NxPhLdUoXrOq5jASO9WmD2lwRrSZlOuQcHTdPpWFu26avBExL6cABWnzKjWdG6KBBNenq3Zwjo9Dv2snmgcy/SE0QVhIuwq8SGqXMynac6+GBvF+/x6+EiCalLXDd1vrMIbnpcn/z4YqTOXwTaSP0VeHCT+uiSToaJKZf7tLpsmQjCbz1mYvlqvfoT9dYDQVSoihAxNHbbRx90DLVTFknbFR343koUYdEUeqJM4GGjPCBgZ8GLtZmSrfa/H3JGKbvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1626.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 15:41:27 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::f8c2:f75a:3187:98ad]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::f8c2:f75a:3187:98ad%5]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 15:41:27 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [External] Re: [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
Thread-Index: AQHZDAYlX52Df8I7WkmSYEeBw46mAa5qAQIAgABiU9A=
Date: Mon, 12 Dec 2022 15:41:27 +0000
Message-ID: <BN0P110MB16733493900DDC40600F15A2EBE29@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <20221212103136.71c0a850@booty>
In-Reply-To: <20221212103136.71c0a850@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1626:EE_
x-ms-office365-filtering-correlation-id: 7670501c-eabd-4221-4c02-08dadc57550a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KAV9YINgYuPlxsYoX4QKryHhLrewDcs01lgq+7yjoc7IFn0lGgICaxeufwBPrtnVpChv5jREDrjYudM7XWUaFXThfhpMbYhbDn/gi+VUy/+dLvhzvP0cojsrT12rVb15Hi0O8jLw0ZDSs7yehnkaw3ZZN0iRs5hGbPW+QTjePRe70+EIexs5rAfJD99ymUVDc484qYHr+pamn0wTyRr0HNw4LcK48qvttumPGq/F3cqPKBnC5pTUmCifVAid3Cd/IxbxO6UIQVw+IG+bZ3PccQoV7EhohfENVJaGj0nM2niv9/wmSV8JWP/dm39v+rSj8xlTzfQaNZRoONNHq5r3V7bIK/DTSt7/Ged59VxXdauhJjSVq93iLr/28ZPrHd/OriZczs0SjiIC/VmPZtxPSkO8VK++kX2v0vURgpUsbhzutNGbM9T4XkFAfGH+Qu94LnSxjgWF6auvVcOypBeRUQ6VhW8nKL2rkhwODeWHq6NY/p+2R2nTbR3oBNl4MoP6KTUMXBwYgY7z/0U0196nZApT0AcredYguq7PaUmBY9l3R6+75WUrQSAT8ecMJTgnpEazsh5bzt7YTPxL8TZgA4/XyW9DFcH8m0/n7YFRAXFAocdEI1h93/l+3t9qtyyJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(451199015)(122000001)(66446008)(66476007)(76116006)(66556008)(64756008)(54906003)(6916009)(9686003)(6506007)(38100700002)(7696005)(66946007)(33656002)(186003)(83380400001)(26005)(71200400001)(86362001)(498600001)(55016003)(5660300002)(38070700005)(82960400001)(2906002)(4326008)(8676002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Nx2RyeDro/tg5cz/1DvWu7L/BOArMBL+zyOFtLlgPg3PoP0TUYIqMFD1MNfRcXjBhb53RClHBL9+Y+v8tDXcukBo0NvowqUYa2jM6mMhxbAzAmRW0st3NL5JsKpUoFudpvc/TUfSwHqAmO3cHhnR475Q2DBvx7l1UZbBwYy3EPNttIbyni5Sy0ea9Xc9Dz1fSrgC9/ceeK79PwCkQXFjp0mBTJ/zUxyHb2UroXTmeqkGJ3ImKFYrmr+7LRv8sTI/5rQ5P/z5469tN7kDtNmjaRbvqoIVh9x74smSDNASWT9A+HGmUesT+QJJSvNPksXmeYfj38vtH64HQpFWe1nSdhvT1QzTMtERdp0isuDZFY9JeOX/5G+RRAViXPmedbL5lrJG6H+RF+8jSWLlKx7L5J2T1mHwd1+UHSic1oMdwLc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7670501c-eabd-4221-4c02-08dadc57550a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 15:41:27.3193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1626
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: v8iFye8jVkr6peyohTNjuhZD55oQtLCM
X-Proofpoint-GUID: v8iFye8jVkr6peyohTNjuhZD55oQtLCM
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212120142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=o3u0dgfvj/WYhJwIUyahkJkEnDovkEBBDZfVxb6fP3Q=;
 b=Tiz0dnhUr/20EhmZ1WK2kOY948cQiUAhN/eoi1Y6cdBplcrrMDOrUDZep+/tw9CLo60m
 DMYlPzLdhyf+4Muf0qHrmRRJdhzcfMwkEwcNjzO/Cqdrgt1zrUvTWv8aTOi1rNRpXn3Q
 1Pqszv5hu0jPRi7H8IzGIzBBZHWYHYt4G/EPTIoCuUMggIytYVs4rOPKbsgjafQ6rWnm
 VhovWl5iNNON5Mbxk5ohfs6LuKkTwIygCrkjDupQU1J65S+HizH0bTfbdmyqrJj7W2C9
 lBXlr/NNcCxoh2CIiY3v76p17SQwfm4yBzwoq8BVcq4c4AZM2FCfLxoW6dEjSDP0Ge+x tw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3u0dgfvj/WYhJwIUyahkJkEnDovkEBBDZfVxb6fP3Q=;
 b=LjKYaDrGQ3VfzsTuvjnI9ZaeUwt+vUOi2C41YBfbezHeF+yKHRzqIHOefWsHFZhC31DI2hMGh6+lKGnKa1hIE0b1jLBjza+Wng3St8JIC2Aux5gRoS27OqFe2yum04oxvfgmpa7jbUpHhx7kudswIb1y8GDi1pte21B1LlGtMBs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=Tiz0dnhU; 
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=LjKYaDrG
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] boot/uboot/uboot.mk:
 support binary pm_cfg_obj
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> Can you describe a use case where this would be useful? While I
> intuitively understand there _might_ be some, I cannot find any good
> example based on my experience.
> 
> Building the pm_cfg_obj from source code is very easily done by
> Buildroot, unlike building the PMUFW. Additionally one PMUFW binary
> can be used on multiple zynqmp hardware, while the cfg obj is very
> likely to change across different projects, and a somewhat readable
> text file is way more understandable than a binary blob.
 
One of our developers was having issues getting their pm_cfg_obj.c to compile with zynqmp_pm_cfg_obj_convert.py, so they decided to compile it manually instead. This patch set was the result when they asked why Buildroot wouldn't accept their bin file. However for our team this patch is now moot, as I ported your U-Boot fix for building Vivado 2021.x to their U-Boot and that fixed the issue ;)

I decided to send this patch anyway, as I already tested it and it seems like a reasonable thing to support anyway.

> 
> > This mimics changes done to the ZYNQMP_PMUFW which had a similar
> issue.
> 
> That is different: we now support two different binary formats, not
> binary-vs-source, and detection is based on the file extension.
 
I meant they are similar in the sense, they are both detecting based on file extension and then either preprocessing the file or passing it directly to U-Boot.

> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
