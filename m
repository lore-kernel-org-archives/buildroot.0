Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E35C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 01:30:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4927060FD7
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 01:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4927060FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DCD460A53;
	Fri, 30 Jul 2021 01:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2Y6NETpfZ94; Fri, 30 Jul 2021 01:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5722C606CF;
	Fri, 30 Jul 2021 01:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0131BF316
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 01:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A07983B4C
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 01:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gXyk1sH9gpx for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 01:30:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31AE783B10
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 01:30:00 +0000 (UTC)
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16U1QsRv040618; Fri, 30 Jul 2021 01:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=fq6mYAfrDgrvNkkrF/48vnlHiJpg70gG5QO5XRlwQLI=;
 b=kBr5NFiX15SNXomMJC2a4eNg5CL8E1GCKSmqiEpLeErkrXhCu2Qv0yTc2liC3NqqHFGE
 u2ijG7nFSOAVTqNbQ82B8QgMVmIMcApZz8Ov8R87AgutfwvIanrT3OZDIQhzbuxLbEQ0
 CvoHQXfOqsyBA8ln6AYaL79eTzQYNrfI46eEC8FMLlL1D5nrd5+HIs7xlSTfK8zsHg4k
 ydcUikLGnKSs1nPVPCbQJsobWtOn30336MIB0t9bx2eqxYCgRTyoteFj4u8RtOT0mBBX
 irI7wv8u0L8LId/2IGYnokPYOZytyYzUbhO4ivo0HxojuyHsDx/D1UBZfg13Djo2kwDl hA== 
Received: from xmnpv38.utc.com ([167.17.255.18])
 by mx0b-00105401.pphosted.com with ESMTP id 3a3wrvddg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 01:29:58 +0000
Received: from qusmna5k.utcapp.com (qusmna5k.utcapp.com [10.161.160.133])
 by xmnpv38.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 16U1TvFw129690
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 30 Jul 2021 01:29:57 GMT
Received: from UUSALE0J.utcmail.com (UUSALE0J.utcmail.com [10.220.35.29])
 by qusmna5k.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 16U1Tuhc022835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 01:29:57 GMT
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE0J.utcmail.com
 (10.220.35.29) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 29 Jul
 2021 21:29:56 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Jul
 2021 21:29:56 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.149)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 29 Jul 2021 21:29:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=sAX3VUORa9TqbACBssKLvVUo6KlauZiEZBoARHEzqNy32NuGqJ/Hrv+X9SbGosmcW4aDhMh1dX30zdxlU5MHCUz++ZpbBpoUMNrXp39sWW1q/RzyiicCwqgFs4lUvvUJCiu+1N9KeRcn/Uh5RkJw777nj0yL37gOA/wCX8ZHN7j97zJFfz0Frd/Hmt1uJcvk9Vy/YkCKRVEn61GRsbkgm+9QouJHscfNN01+mpJsoxRIih79st33SbdX4JiLYavP38UCVULXVs5ZJ7DXmJWs5VJhjEVK1OZhBXnMdrubXfYwDnHd2E9gSZrVo0XfiQZr9uJBvq9xEr8knw7PLj3ECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq6mYAfrDgrvNkkrF/48vnlHiJpg70gG5QO5XRlwQLI=;
 b=oJwt5F+UM00Prb+oIB3H3hF71/jqFRV7uBxuBNzYTTrNc4JI6xykujAsi1MDzITOOmcOxWXiHPir3wp1s5TGbDisgsZIjq5LAZF//SV6Vs+VljBsQfJvVTero6u17nWy4ElQRuHinQd5f3yLDw6jtHS2z1nF+rRv4CByipvOoIhTjeNv5/2aC+/tDuL0QmUw8m+F69r5PpN8snnxwOjyQ62kaoIiKspDQcLHHinpVbhnKvGTmp7ek12is+Y4DYc79Gvk75heJKNYI/79whRP9tXMTpDJsxzv3CjNAxbwbduGonYwdHcGhhP0kjC2F/OjsFqc9QmI8V8OV9gGT5XoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM (23.103.22.148) by
 DM2P110MB0204.NAMP110.PROD.OUTLOOK.COM (23.103.25.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Fri, 30 Jul 2021 01:29:55 +0000
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) by
 DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) with mapi id
 15.20.4352.033; Fri, 30 Jul 2021 01:29:55 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH v7 1/2] package/libtalloc: new
 package
Thread-Index: AQHXPDyLG5tJxXhg7U6wng7Ap/1bGatbCAGAgABDjJk=
Date: Fri, 30 Jul 2021 01:29:55 +0000
Message-ID: <DM2P110MB0105AE9FC5A2B61265D31337F2EC9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210412164011.16681-1-matthew.weber@rockwellcollins.com>,
 <20210729232523.01ee6848@windsurf>
In-Reply-To: <20210729232523.01ee6848@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.80.23.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d2f9c54-61bb-4445-f3bf-08d952f98947
x-ms-traffictypediagnostic: DM2P110MB0204:
x-ld-processed: 7a18110d-ef9b-4274-acef-e62ab0fe28ed,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM2P110MB02044B4AA89DF71C5ADE50ACF2EC9@DM2P110MB0204.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FM/PeToMoU+WrFjKYIJ4mHXqeHkZn+0rXSgkmVfl4eUCqBjql/ZToVrMVlAiuLfxvkJe/FRu9xzhU0XzSBxgQjuW/N2AhNcAOgh1kcBnMHd2jFKUd8PBXttaxgThW6wDKPah+BNbw8Eb9BRowdndRVXlb612rTNmWKspoCeLtoUPWBOt5k9a0NHf9+IFbEH6TfQh5Jga2E+PTSNbjVQebdZj6gDHH+zbv61bBC34YOGBp2ZNam24Gp/118RawNov3XZfXcddLpz3nZfIyUfmBLPZKSpkENqV5ZJrYX7SYaB+c4PtDUg06enlk339yKZDUq3WbInkzR5sMvZ0cWmIXA2GjsfCrpImKbL8OlWjNEbmPwcQ5yrLpiCPtEfKO9rS/oLiDUXpQcPHAWGhvGTdOym5kzxAhF/CyQWjy32DND/ikPx2b54N5U6Nowg7wap+MesQQAZ97m6XKiNR4FUnwBx3kzIswyEx7XbO9+Dw1jE/tIb90mjbsVeuMbtOas/SdUml1djutdi0wzMo6vpJn6VT6rAeZQUSuM3+KHySH9ZiwnRTLKUk7MqVv5bgA/EUdfb6XAiTMtfyRXvnj5Iu3EB4QjFpVHtv5Ddxw7ZfjOAePJm+erbSf8bfC9hMhIUTeQK10fdikhvzkTj5YwsGGrC8OgKfNhJcitY0byrLQ5YI1x6nmpSY4HzcifJFULzDi9lLvOLtPdO2dRYskkCGjXgg56oojZUBRZshNCfHGqWB6fr2e5NsDC/bEEv299LNhTdrMUuw28+6scue47WM5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(396003)(136003)(376002)(7696005)(9686003)(8936002)(316002)(5660300002)(966005)(6916009)(8676002)(186003)(76116006)(38070700005)(33656002)(71200400001)(53546011)(38100700002)(6506007)(122000001)(52536014)(478600001)(66446008)(4326008)(66476007)(64756008)(26005)(2906002)(956004)(4744005)(66556008)(55016002)(86362001)(54906003)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q+8vmjBcNGqqujwb8rQxHKotcc7/qGh3uRopJbpASMYZ3guBm0kHijym0E?=
 =?iso-8859-1?Q?Ek//iQX/9eBe2zoUZypeBoAG7jHX3/vRs3XiYxWDOo6iWZXfTW9mKZwei5?=
 =?iso-8859-1?Q?XHeHN9SyEkyuPcwSoAY09DXYo89VTQ5JEyZS8kUxIP4XJykNJ9J+xOkkLu?=
 =?iso-8859-1?Q?jzPdN7orEdCNOHi8xPL3z+icFOFDssFsRMzTDvU2X6V02ZwiBUfM8Z2PRL?=
 =?iso-8859-1?Q?VjnjikQiuUzqwLYzZhP4UZZtdxARdvqa16x/Ea4sNMg+EPY7PfRkcSPh4s?=
 =?iso-8859-1?Q?9lPmY7SQFc9o34SKIdJXmAn4XAY3HAsm7xG7wEc9E852JOoS4of2CXT0rv?=
 =?iso-8859-1?Q?qEYGO594A+XlKuNWSXqk1OQ7J/G/LyhifkpIh7V73F4vqJqoVoBzJimlHS?=
 =?iso-8859-1?Q?Ejwdqw5gZsLA7FeYyE9HxUILgwOJtWGMi+mXmJ78Uk+jGcnRoxJghzyxqQ?=
 =?iso-8859-1?Q?C3bjY2LtHvOk78yk2C8gTtPtYGpbJt3PfQF3NMNv8zE5JPJ3nLYwLZ0Opa?=
 =?iso-8859-1?Q?yM49ERgbmVD8M/Qhh6iaiMihnFpPr0dqKo4dw8h0pjTkFcwnf0WEA3Z0Yn?=
 =?iso-8859-1?Q?MRRp93hF6TvcXmF6BBOWr/7euFHybcvEjNZeQiTj+gMCDEzwyiC6hUT6Bu?=
 =?iso-8859-1?Q?6BpIkU+14d/p8RF/s1MApmKOionripo/el5qWKZafitUG9GsSeSp9eTz30?=
 =?iso-8859-1?Q?NJGaUnv1ZO9g0AGS8nmbzWs33+hqr9NwX3TeI9X9lMzwLZKYvOQIw203UJ?=
 =?iso-8859-1?Q?Lf+/RmkgLHxQnGwiMGcnQ+/QQ4g5NaTZc7znULx+B6sJuDuQ/F6Io+WtgD?=
 =?iso-8859-1?Q?c+dEqn9UiXw5+B6+VL2GJrPuPTH1GTkOscFrZu+9foJCcZLQ2YF2I3fATS?=
 =?iso-8859-1?Q?uhiIrEt2lvRMa5stvsRqDYzX04FUcVBrhQZmytO1wRI+ddrkGNzDUPzVZz?=
 =?iso-8859-1?Q?NXEHArIFm2eGxi+OFEih9DcAajAyt/P1p4ZkXK9xBA0CSibpgnj8/kTk6B?=
 =?iso-8859-1?Q?wrdZtYD9zEZnapVjCGzlUmSbG4l2Nm6VeRX50UxWSDtRRQZ8qwRNlalE1l?=
 =?iso-8859-1?Q?1rYjm67sSOnGS2mAMzG2inr5gVu7CPTNEpIYrTHQKCXTX2H/nOK0pOxb7e?=
 =?iso-8859-1?Q?hLI7ha9nhxyNz5HFKcTdO2gC+B+D6HTvOZ60AGChGSoHBQLW9QQiAiyi1o?=
 =?iso-8859-1?Q?WtnI0el63iVXvBcWBzuqV+nhNYe/FShPEogrgbFMFoSNL2ZJUlD/lxXnTH?=
 =?iso-8859-1?Q?8X8o6iQgdmySaKc/3640sQB53QEh+l9r2FrMapyDE=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2f9c54-61bb-4445-f3bf-08d952f98947
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 01:29:55.2854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2P110MB0204
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: H_ypsl8mB_fVr0UQPWhwQ5p9M1o17fkG
X-Proofpoint-ORIG-GUID: H_ypsl8mB_fVr0UQPWhwQ5p9M1o17fkG
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300006
Subject: Re: [Buildroot] [External] Re: [PATCH v7 1/2] package/libtalloc:
 new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Weber, Matthew L Collins via buildroot" <buildroot@busybox.net>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Cc: David GOUARIN <dgouarin@gmail.com>, "Panchal, Kalpesh
 Export License Required - US Collins" <kalpesh.panchal@rockwellcollins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas,


> From: buildroot <buildroot-bounces@busybox.net> on behalf of Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Thursday, July 29, 2021 4:25 PM
> To: Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Cc: David GOUARIN <dgouarin@gmail.com>; Panchal, Kalpesh Export License Required - US Collins <kalpesh.panchal@rockwellcollins.com>; buildroot@buildroot.org <buildroot@buildroot.org>
> Subject: [External] Re: [Buildroot] [PATCH v7 1/2] package/libtalloc: new package 

[snip]

> According to OpenEmbedded, the license really is LGPL-3.0+, GPL-3.0+.
> There are some parts under GPL, some under LGPL, but it's clear what is
> under which license.
> 
> Also, what bothers me a bit is how can freeradius be under the GPL-2.0
> is it links against libtalloc that has bits under GPL-3.0+ ? Shouldn't
> freeradius then automatically be under GPL-3.0+ as well ?

Oh good catch, I would agree as well.  I sent a note to the freeradius developer's group to ask for other opinions.  I also found this dialog [1] that suggest a similar compatibility issue.

- Matt

[1] https://softwareengineering.stackexchange.com/questions/238748/can-gpl-v2-code-link-to-an-lgpl-v3-library
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
