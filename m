Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A80C41537
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 15:00:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6EE461247
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 15:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6EE461247
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656A0402AC;
	Mon, 23 Aug 2021 15:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9JObK2LFV6I; Mon, 23 Aug 2021 15:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC3F74016B;
	Mon, 23 Aug 2021 15:00:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC291BF2EB
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 15:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26992400D2
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 15:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQ6sUnriGZbj for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 15:00:16 +0000 (UTC)
X-Greylist: delayed 00:40:53 by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5822F4016F
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 15:00:16 +0000 (UTC)
Received: from pps.filterd (m0078137.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NEAcxP026682; Mon, 23 Aug 2021 14:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=UaFpPzTJgwrsqn5RSzeME6VVLbiyRmTigMhTwt6PQnc=;
 b=avYZL+SdOPa4/j8D9ANcyfUBTUPRAHS25pEh7L1bdusMUE8EbxKdsjHgPH6g2unF0CKA
 Zna88E9xoE53UfBLHYZ3Pj/we2aQgXSvulN0tZ36uFvMbcTKP2araaQYgVodUMJI16Er
 UtyuJZrjfTFDqy719+XtEuxQzvDNSc2mhC4OLGQzLNbFVvHtXPwWVIddUgXVPi0E+NGz
 +JAo2r0B7ERnydvnE4LUhF6gVYyQNfi1+GMSaQ0pglW4VBcyCZLHTExCZYPDLHARsGiF
 vSZ/qXozqSd8o7b43nVAx5ukdkdNX57rx2sIk2Co+nvEtdQUvauOIqGgUHJdk9iOlOlg ow== 
Received: from xmnpv37.utc.com ([167.17.255.17])
 by mx0a-00105401.pphosted.com with ESMTP id 3ajqm3p421-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 23 Aug 2021 14:19:22 +0000
Received: from qusmna5k.utcapp.com (new-mailhubs.utc.com [10.161.160.133])
 by xmnpv37.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 17NEJKBo006209
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Aug 2021 14:19:20 GMT
Received: from UUSALE0J.utcmail.com (UUSALE0J.utcmail.com [10.220.35.29])
 by qusmna5k.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 17NEJJ93006892
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:19:20 GMT
Received: from uusale2b.utcmail.com (10.220.63.21) by UUSALE0J.utcmail.com
 (10.220.35.29) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 23 Aug
 2021 10:19:19 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by uusale2b.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 10:19:19 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.146)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 23 Aug 2021 10:19:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Pmr+lWJ1xefqXia7CRklhHNUhXSW5Ny8Ba6A3X1lcOlT30N9V58+RnDydgWiyUkA89l2zdpyO4oquatuUTKuLX2UweOX07JO+e21MCr8Qm6MmLXz05vtLVjNJTi42zaOGF5+zKttY7tx5X1JpcbljwXROiG+FC2UEb/pcllP8jlyUqy+n/yH/NrfP1vBoKZSzCCUpPJfv6W3G4+qyb0XfrhEir1J4cvm1VWK48tNOh7B17vXleMscu4ld9c4Ji05s7ps+OpQ4dDI0X3o+L0CTz6X6A6NlgDSHH9jKBWYRPxgjBcJvXNbCz52mRzpaUhwAgBMKZh2pr4e7arlFUathQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaFpPzTJgwrsqn5RSzeME6VVLbiyRmTigMhTwt6PQnc=;
 b=u5ZaE/Y5qyDdg6nwL3xkdM93AqZEvnEgGb2PMhbGLTUJn5RKqJn64vAOJPFPKq3XjFbFKIDsVH9Vk4sa2+MK5gW+0fmSpLq4oxrsgTk1YpJYVEI1jW+3lTePzrGdoosDu+99UjKATfMk4woDDd1gDocHhfuRnIudr2G3AGsquqT3e9LUjwTyWWe8Eg3vAsh/ejc2zDu1vdCcaEdmbaDeDrJzrcsPja8uvwfvf8SszjAGs/lKBWbFHrUvOFqMuC1S9ttnrFczxf3EL1f8Sftj/NU7z7UUiR3cSnybWbmgFWlRkJUIkjLAPf0GjWy+9b9evVgjg3MkEpins3DfTW+OPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaFpPzTJgwrsqn5RSzeME6VVLbiyRmTigMhTwt6PQnc=;
 b=qjzy9SHgh5KPSYPZxPnXQ+6YOrsa5iR2jtpWG3eJ0pOVEBzaEB+9ZqdoKXgxkP5VE60hgMuBZLaRLNpEvR8nUj8VzAQfHSKU9NX1hbn0dDXBcUgTTzHp1bevj3bucNS/BuSeHE+bxAcBIQv5vdgQ8h5wpmE+ppwFw7jWx9NbZGA=
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM (23.103.22.148) by
 DM2P110MB0220.NAMP110.PROD.OUTLOOK.COM (23.103.24.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Mon, 23 Aug 2021 14:19:18 +0000
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) by
 DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) with mapi id
 15.20.4415.024; Mon, 23 Aug 2021 14:19:18 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?iso-8859-1?Q?Jos=E9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH v2] package/libselinux: Add
 autorelabel for first boot
Thread-Index: AQHXlT4IA7L+fc6e9kqkCRe7S6syL6t8UOKAgAB0gwCABFkC/A==
Date: Mon, 23 Aug 2021 14:19:17 +0000
Message-ID: <DM2P110MB0105551AC77B57173ACEAAC0F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
 <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
 <20210820191656.GS27036@scaer>
In-Reply-To: <20210820191656.GS27036@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: free.fr; dkim=none (message not signed)
 header.d=none;free.fr; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.80.23.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dc7806c-b984-4e9e-868f-08d96640fe59
x-ms-traffictypediagnostic: DM2P110MB0220:
x-microsoft-antispam-prvs: <DM2P110MB02208C3F9736767554DE0076F2C49@DM2P110MB0220.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zwEaJH6O5c7xz/sK8tjMiRLNJoJiSW03r2rauQVS5phUEJH1kwxfd0QNRRg1Di48Ewin8L+d6LTsqfO8+s6I+2tQuttLezMF4v8VWJPkFZjf32uX0/qwWMTgnnQ80T1gJGKHVEpVZj9o4BcFiFc1pNMb4X3i0C/WfysP/1Q8xHJss0JSUkwNaUI92j+TbRtuHphlGoYX++hXBQGVOLqwoA/b4Qz/PCrAhS/M5AUCFtwL63TNrhhVix7OrE+C8gdDtgLGxJM8eEEOE40SwyAR7EUcuqamPFmyIDyKzGPT1wH05sBxrdS+2PpurAjZNZ0F63Olv5JxFpE6ISz1HdoYXpUr4Wddv7jrqZodqgBOzo5RiTgxhZHhwTWdb7abVQZGwQekoiXHBExpS580d81RwfRnvwVtz4AMcRHcxGv71rsf93W8BPVJJMHX+A5iNEFmIevnGllKMlhSB7saX+iNBRtQLFZha6pJQbsa0u9+5hNYXyj8QKrTbC2/C9eDywFmcxaHWpcqzgiS8oN5BhyvAeDckRe1w92IBsMqKtbgjGz98h15voNsM1qvYw2xZlwig2q2dmZakqIRGFpIl28Pum1HcbSSHhdfAwCxbwSjI7wdCCWhzHR4Y5hCLV1ODLmt314n7N2iws/zyl+YZDM06uOcSG+O6W6Crc17qVN8Zztc/jHdYlpyIGjQnNNXnwfbcHay/+vBuRFY8IbVfmp87hwXHPu+pk2BcKDt1j1UW9y2LLgMU/XYMuX8Said/4X6dgkkOgC2rWfUY+J1xlIv2nA/MHcZviuLFcaImDmspI9ntSdbn0iId3BcmGFJJLTx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(346002)(376002)(396003)(8936002)(8676002)(52536014)(71200400001)(5660300002)(966005)(4326008)(83380400001)(2906002)(26005)(9686003)(7696005)(38070700005)(33656002)(956004)(6506007)(53546011)(186003)(66446008)(38100700002)(86362001)(110136005)(54906003)(122000001)(508600001)(66946007)(66476007)(66556008)(64756008)(76116006)(55016002)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VXdjAEoktzS2QpuvNC8nc0s3kc3b+3W2z+3T3QO7t5r5x9MczfLfsc753f?=
 =?iso-8859-1?Q?b+mhrX8XWrY99/TYDqA6AoLMw4Iqwe68W+vvgPfm7UQuuPoyGSE78UyV3i?=
 =?iso-8859-1?Q?LKzyaTVdIcefnYbPhMJdfH0u4eFeifT4HG2lX0HROUECOQ+XrSlkWAzKbm?=
 =?iso-8859-1?Q?nmuyuH4Q2ESkVHLBw2Rqtbd62KVew20JVDIe7rh3wJSHQfgbhsTGuApcsg?=
 =?iso-8859-1?Q?kwIszK1ZtF3ayTEcZEjb84tnUXQSzotC/ZqyKxi3wgC0S24zrFi9X3C2qS?=
 =?iso-8859-1?Q?xIBWuTthhHK92Sjo70L6oj4KLSFl7yN4aOVZMxMCxYCOCXZeHoxjftYhia?=
 =?iso-8859-1?Q?SJpGKANvBuyejOUwCKmJ7opoAymyomFhpd9NKSviV01Bc8DLpRAiV8a0Sl?=
 =?iso-8859-1?Q?+aLnGCj9GHTRlgS256wqOQK/WAWZAnjrXBc0G8eNYDDkZmAeZSByiH+WUK?=
 =?iso-8859-1?Q?680z/W6ReVhC3ifemcNZfcooknz9kC/EeT90nbAYS/neY7h4scbyIjyVEg?=
 =?iso-8859-1?Q?V410aboXz7god1eTxXZYwKGuY/7cegpvmWLBHGnxokWgjsXUsfYiqgo2jD?=
 =?iso-8859-1?Q?h6aRj3hLKBwagaB7TBQU8v31/0QfmaKCwXLSBlZf/fC1pj9/wRaKgWlAEJ?=
 =?iso-8859-1?Q?k67NY+iSYEQoO+JqtUHPJPag+FHOktw11Xm3Rl/l+hmIRIqDjjKRwqvZ4X?=
 =?iso-8859-1?Q?y9ywW/cP6J/QbZXCeZjmJMzflYmUEjEK9tdJPmNqcWcC/mwhNQTEIASjBi?=
 =?iso-8859-1?Q?dsJ1Kr5gZ1JXx9SOSBEIuv3vSjQF1LSR4zEXAjC4r3GxyNmoz6ggf4Cg9U?=
 =?iso-8859-1?Q?/UgCsVk6OOp0TLQlM0g7tUVMfZH0OdCGEaq0GknnGU/Z+TW06TEOxU+fGW?=
 =?iso-8859-1?Q?Bee//1I12TiZsuFQoxWO2t485NuUlVIVxRL0qh+ds8chSn3/zQ5ydPi1Xb?=
 =?iso-8859-1?Q?BWshFYjU14SrKYJsuIEleC5gE7qXSg+9FHdr4ECSZN4D/rDI2yonHyENYF?=
 =?iso-8859-1?Q?jk01wysyg2jXGERsUSuHcSsw/txtIUuru1LZBaylsOmeMdROHfQc+BxD1Y?=
 =?iso-8859-1?Q?csHUbl+n3aT1zIeEzf24blAYR7i/uO9coLKIgDwgTMtEU+t7Kalovma3Bs?=
 =?iso-8859-1?Q?tOMAv6UObBe+BB8dJyFbLHRxn7xblU43RmOL1tkeVox0xn7gdxs2KXt3JA?=
 =?iso-8859-1?Q?vrxeYs9SEoNEgS+5esaAMYzy0rX362vppteExBH3Y4LSuyOotbDVQolmFc?=
 =?iso-8859-1?Q?j6oGz4d+MP/TtimFRJPJTCmKeEKuZ5OOtjhAIqui4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc7806c-b984-4e9e-868f-08d96640fe59
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 14:19:17.9226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2P110MB0220
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: 0YiaMG1fxc-NMo8I0RKyQzPYJJ844GfM
X-Proofpoint-GUID: 0YiaMG1fxc-NMo8I0RKyQzPYJJ844GfM
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108230099
Subject: Re: [Buildroot] [External] Re: [PATCH v2] package/libselinux: Add
 autorelabel for first boot
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

All,

> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Friday, August 20, 2021 2:16 PM
> To: Jos=E9 Pekkarinen <jose.pekkarinen@unikie.com>
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Adam Duskett <adus=
kett@gmail.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Subject: [External] Re: [Buildroot] [PATCH v2] package/libselinux: Add au=
torelabel for first boot
> =A0
> Jos=E9, All,
>
> +Matthew +Adam, our resident SELinux experts: questions for you toward
> the end...
>
> (resend as I acutally forgot to add them)
>
> On 2021-08-20 15:19 +0300, Jos=E9 Pekkarinen spake thusly:
> > On Fri, Aug 20, 2021 at 12:05 AM Yann E. MORIN < [1]yann.morin.1998@fre=
e.fr> wrote:
> > > On 2021-08-19 12:29 +0300, Jos=E9 Pekkarinen spake thusly:
> > > > Currently buildroot ship libselinux without triggering
> > > > this option, which often shows inconsistencies between
> > > > what the refpolicy defines as a label for a file and
> > > > what the actual file has. Triggering an initial relabel
> > > > would help activating enforcing state right away without
> > > > requiring to enter it once in permissive and tweak the
> > > > labels.
> [--SNIP--]
> > > Isn't this going to fail on read-only filesystems? Relabelling supose=
dly
> > > requires that extended attributes be added/updated/removed, and that
> > > requires a read-write filesystem...
> > > Can't we do the re-labelling at the time we create the filesystem, i.=
e.
> > > in fs/common.mk?
> > > And it seems we already have that:
> [--SNIP--]
> > > So why is the labelling wrong? Can't we fix it right there rather than
> > > at runtime?
> > It's is not wrong, it was just unnoticed by my eyeballs,
>
> :-)
>
> > however, there is a case this is not covering properly and preventing
> > the userspace to run right away in enforcing mode, because at
> > this time not all files in /dev are populated, and running it in
> > permissive mode multiple complains from selinux to the serial
> > devices turn up. If you have some suggestions how we can
> > improve this case, I'm happy to bring more changes.
>
> What I understand from your explanations, above, is that we have to have
> some labels (i.e. extended attributes) set on files in /dev, or the
> policy may reference objects that are not properly labeled.

I've included a few background references on file context (Yann your assump=
tions on IRC were correct) [2] [3].

What you guys have described is a feature missing in the current Buildroot =
SELinux support.  A user would need to add their own script or call restore=
con manually.  As a side note, the runtime tests only cover a permissive te=
st case, so it would miss (PASS) that every boot "/dev" and other dynamic f=
s will need to be labeled.  Starting in Linux 5.13, there is a feature call=
ed "genfscon" (thank you Android) which can handle this via refpolicy filte=
ring out  (proc/debugfs/tracefs/binder/bpf/pstroe/sysfs/cgroup/cgroup) moun=
ts and doing the labeling dynamically without a restorecon being commanded =
from userspace.  However, you can see that "/dev" isn't on that list, so we=
 need an init script.

I think the fix is this proposed .autorelabel menu option.  Plus, we need t=
o include an old script [1] I had submitted which has been tailored for Bui=
ldroot and handles memory filesystems, initial SELinux setup, and .autorela=
bel.  Sorry, it is in the middle of a whole lot of other patching noise, se=
arch for "b/package/refpolicy/S00selinux".

[1] https://patchwork.ozlabs.org/project/buildroot/patch/1458128701-14841-1=
-git-send-email-niranjan.reddy@rockwellcollins.com/
[2] https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/=
6/html/security-enhanced_linux/chap-security-enhanced_linux-selinux_context=
s#:~:text=3DProcesses%20and%20files%20are%20labeled,to%20make%20access%20co=
ntrol%20decisions.
[3] https://flylib.com/books/en/2.803.1.75/1/

Best Regards,
Matt Weber
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
