Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94846C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 15:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392E861213;
	Thu, 10 Mar 2022 15:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-GQeDMqnZYt; Thu, 10 Mar 2022 15:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 540B3611C2;
	Thu, 10 Mar 2022 15:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5591BF375
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E7FD841EB
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="iChWIs9G";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="0o1YOLY0"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRhkouV2sCW0 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 15:55:25 +0000 (UTC)
X-Greylist: delayed 00:48:50 by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ADD3841EA
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 15:55:24 +0000 (UTC)
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 22AF5iKp006758; Thu, 10 Mar 2022 15:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=jO4eJ0pw105ScAh+4uuzL+mlpyGZqZ5GvameatQYdC4=;
 b=iChWIs9Gj5CDuLm6sA09l4yt174pZWk9RoSSfX7pT/vXQ+MN/zE/XRxybXDRpG+gh4JR
 YTHAlfd+YvT6jEd8lEO9PGo/CwgCdNbvSl/onFE8TYPnfbTB1XqiCapz5Lr4XbCh10cO
 FKrt6BUIzu4oWC/FzGh+hLhfcNh8hLmKT7PDd1ZJd71r2GFiwXrA3dRyABHNxoB8pozk
 wZ9W9ab2dpJrk4wIvgVLoQ4aLOehufZiP3wNoOPQuN9DqW/yfSTMdbVql9YDBkkFFWWl
 v6J7z5wXOVoPZfnX8oNl41GWFNTA60PlUuURBx+BQuoBmCKP24mjkyBOgwP5QMDyUJXc Jw== 
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0b-00105401.pphosted.com with ESMTP id 3emhm64yqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:06:31 +0000
Received: from qusnwady.utcapp.com (QUSNWADY.utcapp.com [10.161.48.89])
 by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 22AF6U0k185959
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:06:31 GMT
Received: from UUSTOE26.utcmail.com (uustoe26.utcmail.com [10.221.63.40])
 by qusnwady.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 22AF6Uoa011298
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:06:30 GMT
Received: from uustoe21.utcmail.com (10.221.63.21) by UUSTOE26.utcmail.com
 (10.221.63.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.20; Thu, 10 Mar
 2022 10:06:29 -0500
Received: from uustoe1z.utcmail.com (10.221.63.19) by uustoe21.utcmail.com
 (10.221.63.21) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Thu, 10 Mar
 2022 09:06:29 -0600
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.148)
 by uustoe1z.utcmail.com (10.221.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.28 via Frontend Transport; Thu, 10 Mar 2022 09:06:29 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=gEH/R0ty8slyQiiq9S6FzCr5tTU0xMSWr/9ZvP+MBjSVe4k+cTGXHi/wGYsbmPoCSH/bxpQHytZfz7gqlgKRUTsU6FxWUhhuvi3vqpm+KRulnHUwn8n0W5caB2BxhP+EEzCe93bo7uiOyQ/+nPHIxsA9nKK7QOm/mx5IiaTdkp2Gfr62apOPBzoO3878J2iodgCmDutb5aa+JkCqVhh+4dcfBpziEG30RrUa5Cor2qiru+DfdV2cVdyMKc5yEGQaCowCJ/hkuZUpipTeik1zKBantMQCLYbnaTnsszJaXm06vJ5INxn13EktoaCn6DJ7y2Ul0b2ehFuhmJxH60wT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO4eJ0pw105ScAh+4uuzL+mlpyGZqZ5GvameatQYdC4=;
 b=vJWX9BP9GMqh9jzTyv6gkIlxc+DkX6aGSjK4FsbiHLH4wVHhaXz9aErS/qbsnqVaoljEoYuLpirJSm1P6BVUrYaxIMMLtEv1xy9mKHhrNT+yrTen9FMKlGcFNdZXuBhcqz99iyNwol/p+9u//1Dmc0DmRaE0fokkeZzblSW6DVWNok8XDNuU4hivCnEQHW4bpi2OLBu4cx/T7/O23RdtN2aQWH1+Y9Lb/cVHs+TVTaHyaTrKIkNTE9zDZkL4CQXi1Xo38iF6N9A2Qd15BZceszhDfg4HeZUKMwVMYOZB3WBlgRLR8RRkGRgcs9WOeX9EOXid/drBTxkIPHq20suO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO4eJ0pw105ScAh+4uuzL+mlpyGZqZ5GvameatQYdC4=;
 b=0o1YOLY0L5QEaK12tRFQEgwwmGsHS76xNT2yc+solU7efMYibr0rNKyRSy01BbKNlpNGUmRzxKGKXJF+/9sEms02qehkqXKbTvfxwrjlCJOA71ykzQ4oEav7eODOZ2lLtM7sp+ksa7MBh9aagcFKMYQJv26e/9X+360YHrOB+io=
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1602.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 15:06:28 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7404:6113:94a5:b064]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7404:6113:94a5:b064%6]) with mapi id 15.20.5038.015; Thu, 10 Mar 2022
 15:06:28 +0000
To: David Laight <David.Laight@ACULAB.COM>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] fs: Change default fakeroot shell to bash
Thread-Index: AQHYNAqChieJC++GMkir+huuw6Gheqy4PD4AgAB7CnA=
Date: Thu, 10 Mar 2022 15:06:28 +0000
Message-ID: <PH1P110MB160388F926087482E0CA0238930B9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20220309230745.143885-1-clayton.shotwell@rockwellcollins.com>
 <28b7bbc57970469eae07f1e439fdf1cd@AcuMS.aculab.com>
In-Reply-To: <28b7bbc57970469eae07f1e439fdf1cd@AcuMS.aculab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5c4c286-6b17-4a2a-8eb8-08da02a78dca
x-ms-traffictypediagnostic: PH1P110MB1602:EE_
x-microsoft-antispam-prvs: <PH1P110MB1602DE1BDD1EF0C0FADF6F9C930B9@PH1P110MB1602.NAMP110.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SZcvTAlbiCWDaWpmWxX6bpnCG/9Z9tZftmiUJ3U/jatRHL8tIWv3czjjwKrx3zoobn00+zH/lujoWmBy/QW8CSQN2pxsk1ViVmcLSLHacUnP+oq5sbgaknirOEY/uJZRf8h6X+EFBUjQBP/z47WRw9kRAm7Yx5fGTThCTQ/5u395lcR0DjH16VPYkOtj0oSlQQ4Zhok+d15NPM4UobVycpR2VAxsH9Dq1G0pmGXPwlMD1Kke8INnsc++qKSh2NY0cGmYcfjZ0KGAEDnX5zElyQtHvVbN+VN8K3ExwdgIydGi39VpaYN+x4IV8SWN7fye3RuR0e2sAGttCggSiGKwCmGI0axVXhMsIrQkTxYWWkG/wI6+i2D8QMGiTkGFFrvA7H9P0uWiPYuquhWznAKL63ThsiCHIvcD8OILvi054gF9bFjkfr0o3r93/6VB7MZnpPdXVTMr1SzNvDF7XZ2n1Eu4z9770UE9uXaulpjQ/GYPqeMbex/AZC4ulCAYRVFoj6vLFrDYO4/gIAA3zAFFfCiNby7EHG1Oz9KAWP70o1KI3uEwsxDfQ2s0vnOxe0hbQL8pyrd97C2vdsobmUsUMM7nENqbDRv0IWCezB+yqbmTd9LWlD8zlrNPPRvirCzufdPAjnrElMjub8jeyLfXuG2v3mbGg/Qsl2J+vOxChA59OLhqhNMCEoPB4BYYkcm4ddXxAfJ82abu7l6m6uSiVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(966005)(8676002)(55016003)(66476007)(53546011)(4326008)(107886003)(38070700005)(71200400001)(8936002)(508600001)(38100700002)(66446008)(52536014)(66556008)(64756008)(316002)(186003)(6506007)(7696005)(26005)(9686003)(86362001)(76116006)(33656002)(2906002)(110136005)(122000001)(83380400001)(66946007)(82960400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: +E0sLUqRiA/SEQsjMrUulmDOnVOXQQcXKDTj8/7ugJYXyNAOopwE3/Y/sAGnNWjvHJHnB8OZDaRk6bthJ1klMQHUBYgiDlzWuzMLVJT2MyR/yRJfnJ63rL51jZ0ULe6oijEbNmQ/zUDE01qomIK8sQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c4c286-6b17-4a2a-8eb8-08da02a78dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 15:06:28.6440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1602
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: U7A-giMDNutpLZokTX4pNHD1I3dQtihe
X-Proofpoint-GUID: U7A-giMDNutpLZokTX4pNHD1I3dQtihe
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1011
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203100082
Subject: Re: [Buildroot] [PATCH 1/1] fs: Change default fakeroot shell to
 bash
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
From: "Shotwell, Clayton L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Shotwell, Clayton L Collins" <Clayton.Shotwell@collins.com>
Cc: "Weber,
 Matthew L                            Collins" <Matthew.Weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David,

> -----Original Message-----
> From: David Laight <David.Laight@ACULAB.COM> 
> Sent: Thursday, March 10, 2022 1:41 AM
> To: Shotwell, Clayton L Collins <Clayton.Shotwell@collins.com>; buildroot@buildroot.org
> Cc: Shotwell, Clayton L Collins <Clayton.Shotwell@collins.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Subject: [External] RE: [Buildroot] [PATCH 1/1] fs: Change default fakeroot shell to bash
>
> From: clayton.shotwell
> > Sent: 09 March 2022 23:08
> > 
> > The addition of the removal of the /run and /tmp contents using a 
> > non-POSIX pattern causes the file system creation to fail on systems 
> > where /bin/sh does not default to bash. Switching the fakeroot script 
> > to a bash shell addresses the problem.
>
> I'm not sure you can rely on /bin/bash existing.
>
> Better to fix the script to not need bashisms.

Bash is a required tool of Buildroot (according to the manual anyway) but I agree fixing the bashism would be the better
option. I see others have already pushed a fix so I will mark this patch as Rejected.

https://patchwork.ozlabs.org/project/buildroot/patch/20220310120256.GA11974@parad0x.org/

Thanks,
Clayton
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
