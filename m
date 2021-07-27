Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F62C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 17:50:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E622D60FC0
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 17:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E622D60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E65606B3;
	Tue, 27 Jul 2021 17:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQlVZakbVuaG; Tue, 27 Jul 2021 17:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA8760683;
	Tue, 27 Jul 2021 17:50:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B431F1BF359
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 17:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C4840106
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 17:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="GXag7cBd";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="V7k2Is/z"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipRyANWf4zlE for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 17:49:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28960402FA
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 17:49:58 +0000 (UTC)
Received: from pps.filterd (m0266029.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RHmUdG013577; Tue, 27 Jul 2021 17:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=DEgRTQs9nlyoFOFnYsnYjwbDUtIvv7h+Y5IfLelSm08=;
 b=GXag7cBdo6uYem3s12McOqBDyaef61pCN3YnuizeFVREa+lJb46cbws7RH+9/ONG1C7y
 hJt8e8N8q5sfJewryvjIqPi1kOZkQ1zUPjrUr29P8Ao68i0sqU4M/V86lLFHn7+VoaHH
 r/1XLJzLZyr5FDssFw2u+uE5VPk5DDWim+GavCbJea95rAR9Ar10crnviTkY0DazuK9L
 ikf/Dc5J+dWqzWHAA49EMDOIJzRnYGyjtKYz3b25mHOFcbE1zedDKu5SLubpAsSbgmXO
 kbC3YNrxfm3KBgUu3siVGVKhPRhvGPtSXSiQgWxC1GTFSi8MwiMpIHZHNxKWBUw58s2H hQ== 
Received: from xnwpv35.utc.com ([167.17.239.15])
 by mx0a-00105401.pphosted.com with ESMTP id 3a2370d6y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 17:49:16 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xnwpv35.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 16RHmfG6129509
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 27 Jul 2021 17:48:41 GMT
Received: from UUSALE0B.utcmail.com (UUSALE0B.utcmail.com [10.220.35.21])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 16RHme6S017197
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 17:48:41 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE0B.utcmail.com
 (10.220.35.21) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 27 Jul
 2021 13:47:44 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 13:47:44 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.152)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 27 Jul 2021 13:47:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=cM7Sv93PpYwAYE/XpqbBiIqfVsORXjmFUIz+Ny0A65EH9qag4KYRV3tVYugsUxWFdlF37lBT8cTMthfIG2QJ6o+V/KKOtLIB8p90diE03tHzTKR3NXi9B05+n9Gi4Mf3VpYy23lYwu/mKZV5Bmmv9qn0Q9XkUR+/iFiZRV+hSRp6RYbA5UtGp8ukZZ1843tlvZ67ON27MV+/k+tegOgvERaySAZsCZn1XE34V2OIvaHCSfsXeNWr8PjVTUu7ldcG2DBPmOAcP/FEmoWaFDCNEnR411da9aznL0NyRNPc9L1PU6t3rvHwhNkz1XPwc9544IBJB5sFS+e3zUwgnXmlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEgRTQs9nlyoFOFnYsnYjwbDUtIvv7h+Y5IfLelSm08=;
 b=dLM5fdnH0we7yxFN7zpUUTkcnSeGr4wYPwI0qcQ36PG9Kr1ynG8vr3x5zUlVlACyPhbyoVcDv1bpV13E5GLcLeb6+5+U6Jkvvn2dw4Dll5Y1+mkSK3uKaIUckpJmLKiDxHeiL19FtI0fTcyKqgk0WhwrwduomlFOFIVnaWMM3Gi+vTLqh5/CoTNOUFWRQ3HME+47vBs5TtXU/xubTYxWlKFRcKUmbtL4FxnEwwHWJz1yF/uER1I9w6hOaiW0kPcQvybnxv7aMasMSaUZYQMeC8fjM8YjgoxYt0Hg1n5JMym1+rBFkpvoNPyOXaqe/RwAsZPH+D4aWR3eBcHfXaBAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEgRTQs9nlyoFOFnYsnYjwbDUtIvv7h+Y5IfLelSm08=;
 b=V7k2Is/zW8kpKw2Mx96GBaON5lmtziBJK6WoohkrVVKXPZLAbKPubkjykg/OTsS/BbVeJiLOnko9UDDNpR8ModQo78l2YCHxgZUz0+vcS/6BMHyv/t6LIxVdeWwpbxtI2NU1ME+NypueW7IbOLyPFn+K7cR3UnDsXSG5CM0XWB4=
Received: from CY1P110MB0102.NAMP110.PROD.OUTLOOK.COM (23.103.22.213) by
 CY1P110MB0104.NAMP110.PROD.OUTLOOK.COM (23.103.22.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Tue, 27 Jul 2021 17:47:43 +0000
Received: from CY1P110MB0102.NAMP110.PROD.OUTLOOK.COM ([23.103.22.213]) by
 CY1P110MB0102.NAMP110.PROD.OUTLOOK.COM ([23.103.22.213]) with mapi id
 15.20.4352.031; Tue, 27 Jul 2021 17:47:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v7 2/2] package/freeradius-server: new package
Thread-Index: AQHXPDyL3sN6LDCMaUWI2PnbGLaAI6tXpOku
Date: Tue, 27 Jul 2021 17:47:43 +0000
Message-ID: <CY1P110MB0102BB73C6B6D71B1DC0C277F2E99@CY1P110MB0102.NAMP110.PROD.OUTLOOK.COM>
References: <20210412164011.16681-1-matthew.weber@rockwellcollins.com>,
 <20210412164011.16681-2-matthew.weber@rockwellcollins.com>
In-Reply-To: <20210412164011.16681-2-matthew.weber@rockwellcollins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.80.23.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94347b8e-e79c-4310-cb0d-08d95126a316
x-ms-traffictypediagnostic: CY1P110MB0104:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1P110MB0104633492247FA7C064A638F2E99@CY1P110MB0104.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Adc8wNWQh1eF11esqW1ZLzQ0ywRoXa7vOJgfITtuUDqTZOw40q7a+Y0UF6Ns/W4V8qEPzkZ8v7gOZnDmK06tEaeT+FN1YcaTzpfEpoFqjSbKB3g23tF5fXGjdGNfmJiAKDcpVg51uaz0WbGH0nLOw7QDqLvL12tuo4KHP/t92zlgVSjExPGuD0Rz4WUrUNgAAxEEvpqA4RuHWkAddc5H1TYlfSY1Ve5/B6vuK6FcMZqyW0ZjwcNwL3Svzd3BPMi27kSR8r+Uq/t45uCoFc8/5fi3HfNEWUO3Af0UGgCOIL4dyL2Mld1Vtil1gDLlY3IhfoPyFHe9VqCTzRYRtYQOjiLV0xC2msBJN/R5Vru1tFQlCe54aYXbA1ZJtfrFfx5jbJ5AitKLJO5DQt67JklmN4Xm0nk2sCKFnDoMUO4SXGV8MRAZPybupwzUzWhYdQbMk1a1x3AjwWfadCC6KtqSUhvrFiiqCT9PPpgZ/ihbA4JwqKCvg0niXsXlYUPGjP8rlVTwdGU9QP4iLLbZEYVj5q+vR4VV3U3ztrBT3u48NFFpmlKtjnwhm7jEhg5Tmm/ZslHIS6BqREyBMKXkHYRdh45UOwRfUeGIzS/cPgYdZr1TURmR/rRI2fITjFiwRPmgswHCTt2/aSvMEVxXLMDdO8eb/fKCUFjYutsxeU+1ea3JLGvrb5z2xR8C6j0iPt0j9Z2UsjmyEzghXFGIvM22CQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0102.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(2906002)(54906003)(7696005)(76116006)(4744005)(86362001)(33656002)(8936002)(478600001)(6916009)(83380400001)(107886003)(66446008)(53546011)(66476007)(66946007)(71200400001)(55016002)(64756008)(52536014)(66556008)(38100700002)(316002)(9686003)(6506007)(122000001)(26005)(4326008)(186003)(8676002)(956004)(5660300002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4ZPUdMBFv0luwGJnDe8H1dIcTCjE/b7d+EFG0DsVYLJG7nMGk9Ko8rWhuS?=
 =?iso-8859-1?Q?jvl5BxkMIRvlV3ZLqREsvrwQct2bj1LpGIJAmvrl273LgvSULIuxHR8eK4?=
 =?iso-8859-1?Q?ljLvTdCoL3RPcwvdDfw4CiW1jtugtuialLM7/IpUxQAnpiOsR+MSuID4s5?=
 =?iso-8859-1?Q?fOpwCETy3eQ9+HYsB2/u7s8M4HSHwKxSjiWxRmXn73xMLxbgIOa5vgu8Ou?=
 =?iso-8859-1?Q?vIucwXN8aFzwh+EsGdR+iV8yheb855QssvOi7BNpEbMU91r60sFcmqdGO8?=
 =?iso-8859-1?Q?3IAz/+qVEYMDJNh31Bq84heW3k1b7Q/HSqDOvqWS4pWGJVfrwPBglNYdAa?=
 =?iso-8859-1?Q?+NKBgeyz/3QFxmdr1M+taN2pozypQ1wcsVu90QPWT2mlFhnmUAWMiEj3KM?=
 =?iso-8859-1?Q?/6W1S/Toogehyy57pL9LKFF6USN6m57JW2kOIhTECcdR4HoTcLPdU7xXTe?=
 =?iso-8859-1?Q?DBiaVIqHBKgniBk3p3rSKhvVyB05b5LrER6jKPDyVtC5pkBypQT7v7WL15?=
 =?iso-8859-1?Q?m9M0WZVUscJBah0FbZ61Er0g0qyEijC3LsHvaLxJJL2tAzrRpuvjeFwaeT?=
 =?iso-8859-1?Q?5FHCvVHsyNO5Ty00+JfpdN7rEUijEm7IKOkrVyGLO07PSrRDihYTqkeCRB?=
 =?iso-8859-1?Q?G6/CcoyF3bco3DxjFu7F978IqfVyA3We7pl4KyydHncAOj/m65OfpFtSny?=
 =?iso-8859-1?Q?+ix5tpQf+oJOTmhmcSA8+q9UDFiHhGaxZ2JskYmY4ALE0nVicIL+wn29oD?=
 =?iso-8859-1?Q?XJTdTUXJxN0q7VRmxfmg+2L1uOCa0nIDzr5+Ym5EzJ0Y2yrri0noyWiMEz?=
 =?iso-8859-1?Q?STjv3WROnaDJpoq2pdhfsloX7krNkmDw+zFSNEDT83ukcQzWa5aUfJiywK?=
 =?iso-8859-1?Q?t7HEKPCrb/Xbz98JWabmGKTfGhtXQFWglLp9An4q/NTTkVYFEoG3dw9Ppg?=
 =?iso-8859-1?Q?cgn1Rkia2YIgXFCFCXKCBUdGgqRYSW5CxdKSd/dT8ta5LhN1rb5upBZp7f?=
 =?iso-8859-1?Q?A2BJ9qvwstFCqr1UiS1+u29K6QoMHKGR88YGpQGJKgkUWeA3m7k4ANUIOM?=
 =?iso-8859-1?Q?KumW+L+zC0I4x8ThukN2OowIfeEfYi4S88b34KxWAgOHkfsTdXkPtRLDHG?=
 =?iso-8859-1?Q?dwrmIPr7WWyva9g3swgYPxNtIQdxW2Qkz/BIoea4JJW2qqPLG8RaZTCNaC?=
 =?iso-8859-1?Q?RTNOlYmrajhZI1zFawqWpmLp5PW4BOxh0pz4SfyfEZ19fwfbB3neQX+XRl?=
 =?iso-8859-1?Q?ax5tFqn7WA8Rd/BAGObE/M1CbU7pk4hsVW92v1XkA=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0102.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 94347b8e-e79c-4310-cb0d-08d95126a316
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 17:47:43.4993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0104
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: 32NXYI9enb8FyxghnfoeZ0XvR-apjQEb
X-Proofpoint-GUID: 32NXYI9enb8FyxghnfoeZ0XvR-apjQEb
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 mlxlogscore=897 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270106
Subject: Re: [Buildroot] [PATCH v7 2/2] package/freeradius-server: new
 package
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
Cc: "Ratschan, Conrad T
 Collins" <conrad.ratschan@collins.com>, David GOUARIN <dgouarin@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

All,

> From: Weber, Matthew L Collins <Matthew.Weber@rockwellcollins.com>
> Sent: Monday, April 12, 2021 11:40 AM
> To: buildroot@buildroot.org <buildroot@buildroot.org>
> Cc: David GOUARIN <dgouarin@gmail.com>; Panchal, Kalpesh Export License R=
equired - US Collins <kalpesh.panchal@rockwellcollins.com>; Weber, Matthew =
L Collins <Matthew.Weber@collins.com>
> Subject: [PATCH v7 2/2] package/freeradius-server: new package =

> =A0
> From: David GOUARIN <dgouarin@gmail.com>
> =

> FreeRADIUS is an open source server which implements
> a protocol for remote user Authorization, Authentication
> and Accounting.

[snip]

If someone respins a v8, we found the dependencies also needed to explicitl=
y include libpcap or add a conditional "with/without selection + dependency=
" when BR2_PACKAGE_LIBPCAP is enabled/disabled.

-Matt
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
