Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E588E71094
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 17:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4382A81F0E;
	Thu, 21 Sep 2023 17:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4382A81F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoNQgesAKuKC; Thu, 21 Sep 2023 17:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862A381F4F;
	Thu, 21 Sep 2023 17:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862A381F4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 875411BF239
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 17:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FA1881F4F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 17:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA1881F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOxrZBw0NI7l for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 17:00:30 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 514B381F0E
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 17:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514B381F0E
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LFwltC007745; Thu, 21 Sep 2023 17:00:27 GMT
Received: from xusxph009rp040.rtx.com (xusxph009rp040.rtx.com [128.13.125.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t86aet363-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 17:00:27 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph009rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38LH0QC8027638
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 17:00:26 GMT
Received: from UUSALE29.utcmail.com ([10.220.63.19])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38LH0P12003913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Sep 2023 17:00:25 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 21 Sep
 2023 13:00:24 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 21 Sep
 2023 13:00:24 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.151)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Thu, 21 Sep 2023 13:00:23 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1724.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30; Thu, 21 Sep
 2023 17:00:23 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c6:5f95:b1f4:b67]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c6:5f95:b1f4:b67%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 17:00:23 +0000
To: Thomas Devoogdt <thomas@devoogdt.com>
Thread-Topic: [External] Re: [PATCH 2/2] unifdef: add target package
Thread-Index: AQHZ6x39PLLFPa8jkUGDIs3DK1ktY7Ak73eAgACS3wA=
Date: Thu, 21 Sep 2023 17:00:22 +0000
Message-ID: <BN0P110MB167302996032598F1B2983F7EBF8A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20230919172300.9901-1-brandon.maier@collins.com>
 <20230919172300.9901-2-brandon.maier@collins.com>
 <CACXRmJirVYUH98cf9d-g0DnNo+ubMgWUOhRa_V6_0A3Fh-0oyQ@mail.gmail.com>
In-Reply-To: <CACXRmJirVYUH98cf9d-g0DnNo+ubMgWUOhRa_V6_0A3Fh-0oyQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1724:EE_
x-ms-office365-filtering-correlation-id: c978c967-f715-45cf-28ea-08dbbac43ea5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JaSXTpjLFYmGWVYAeapdCJr7goWzbgT4MJ0rSITHsAZdr/zjll81Fxmea9Sxu8crxsyKJj8uoyDLyfbtiqEQOUvaG0KFqJNfex5sU6GcRZK+anYoEoFIPpitIXBrI6muI3iNRbIykEAKFkENuKDjPMRAw60aoG7svmYI17TvNsq2bPltNs0UvPz98XVu0GdJEG9J9HfHCCYaU0h9O6K+9kTG6T/XqEb06CQJu7V1Bem27ZBDgu3eKXrfSkhhgrSQHjsAgBJep2bBk75/oWFrzMPV3k9kW6I19myKoJ0uBqI+d2B33HsIB/0hmNLoyL96BAaUuoP8GVekFvyxJ7/j77BJ65I5TmU7qYuQ3R274SxFozp8WOZlp4k6jCfJeO18WqbHRK3HGeblHd3bdQTxtGGtx0McGfzE0THup6xSCCQ472tyGepI5xbJTeDkZAy64YIFt0OjvAXI4Os75yBZnA20sYpBDC/+edJtZ77eQT7zdL3RYqYkmkx7zY8qHTS1ab3a4aZ9pIxgsxrBuQkDfd6rSSRvK6E66jxEZ0+aIXFevLI75m6x8yFP2QEsfiNVtmvc65p/4KK7TuudpGASkVz+TOGKKplzuiVDpyvq0akTiGZ5+f8ERk7QdRjKEXII
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(451199024)(186009)(1800799009)(7696005)(53546011)(6506007)(122000001)(86362001)(33656002)(82960400001)(55016003)(38100700002)(38070700005)(2906002)(9686003)(71200400001)(498600001)(26005)(83380400001)(52536014)(4326008)(5660300002)(8936002)(8676002)(66446008)(66946007)(66476007)(54906003)(76116006)(6916009)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: bIqoI4kgOTCVcrVhbf/8KeDFaQ0LTiLxNPzrlxhPNsXCmCtjgjmiq+I5oFBrheCJ2gf+ZmeN+yVMC5tn6+yORNAsU1cfL736sKkPcH/diPoal4I5wKW0+U9nEajaT/1vRHmhh0W4OCTMIXjTnQqmubX2Ql5J9bpoN5X+vGky3zHoBGAJ/Ggr0Bi4mEVSYGrhBaqtWLFgsPyVjnY6UPGcd8KUWF4Z3Li2qJDt15avbIThaxIYO2geZP3+lODB3yHFWBf03L4KkIoyHPqa0gK1jkB6wCj8Tns33NIKDWQWLy231wjK8vKoeEPbTgM7YCqWu8w9xDc4+aLFCDsQ8Zo6+RcCzL16AXd3nNol8PP3732tWqscC5Xq6lkeZyrZSIO6q+1y5LrRfzXEFWFM/PLB100+2pkHd4Dnoni7QMUO8Cs=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=q3zeeN7MM8Ll3CtY61rAPNr4S4xg/7OcTmJCCuYLmNoBCQxjujJczaLspNmo1SCYgPIHH4eepWWrfcl8I0mzjU5iu2qiSE1bWguxASunZrIa4XoL8nScDd1uJDAsRxytA848tjX+T2WQUyvGborEhdeu9AscpGVfofduwJa6ku1JPdzZ+VWzjtoJSDIbKLgeBGP9N9ROnsn62y/Fx0DQCYbbfesx37tKjEHEIMOI+9j8CiWJ640Pv7zCf2qa8VwQjlCxiy2F6WkC1boK4MCWOE19bB9sB7gqjzks0uv6S+evypp7qui7yjV/f2iUQ4L4jYjJLc0wLqj+ta2d26OuSw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ez9dUa1AvwLVxj4iHmedXsOWZ+eDFKSC0nEbkGhaU6w=;
 b=ijNvS+NONyWdvNAUHboR5TB90h3Bm7Nri9HDeHkesetEOJM9cwweioNUMKTti9kzy+wFxhn/DdQPg4b5FkEQZRdTVvi5uJhtS05LYPpF4YcXXKmldR9OqgskFTV3vPmZVC8G/ysSO+IgJweJyWDkZxE/IYcMhkjifGSm/GUQZYmVR8Jog7n3qUo0fjOghD+kvmLFn/t3UP7WfRuRZbGoXa+nw0KO03lCH0/tuX9UzeVuW+alrvdkh0wi2d5sqGkVEcYl2XN+eARHl4skna6snaOJpOkauQ04H1acA5DTVzqfPdCwXLMr81fX+cg3wT4Gwm7SAPtXREAzyf9tSIVdPA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: sUy9v6pf671URlaDfEaiqIQylfP8q8smpZgG6hdkWFwU/AsMZr/4nz1TodiDWlg/BRMSOGAsa5Tyox3uv6b5HvYrcE+xJTdeBGuDsI/r2Jh3s0njcKP1xa2h1XFe8ydWThFC7nI6bS0T8qN2Wat2RL+OzBHE+gqunLx/frJzVCe7DbgroFv37ZnsulhHxkH1C0tQUM86O/y16tzVKIro3u/5j2D5dVDhzYmtDRMqACZMbJ1NFJ93PKGeaHqDdhJ46NEILzKZuc3WfdyC8SCje68pNTbQ9WXMxy12at7yKfjm8KTuwDfrsOQt9tDg+oT7bZTrCewb4/8sexisCJubZ0NQXihlJNb7lgFhicFPJlbbvU7XcJqG77u2fDAYAfmlOu104jKpYxj+860UrVe2d0a9v4SyhfSzQV13DN4w3c8mGO0i1RfBBOGCpNddKmIocTrYdqXdLqmiHjNZ+6yNv0gBmAe0pDdgb4+PmxZncpeDqtnnlHEmvS+/NPGcSmdq9u6FoJhB+p49uq8th5nFDtMaxsTThmZG9ma7cLKlmwOBlU3xWZ1Xcv6/SfVGscpHzgrWtjiffZYLavYU1Oq79WOfRu9CmXh+1ZPQXWmoU0qaRHO5hoocsQCxUWtnlWTCDWfwOHCu/E2MP9k/V2NsxJ3KUl80+VwPt+fiaw6kmGphzWsaPf1avL84Hk6mO60IHBhqvJ7pZ8OV0UIhOVuge115IKHTkj8kvxW6tmUG4d9U3WxD91C9zL27h9B3DGL+LqNccD68RfH5RzCgfYpI/STcdWUh11/CfnTzEqELGj88/1CGLR/M1QqILnqHyS3o6h/bWBnM95MXIo5LmUHzwg==
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: c978c967-f715-45cf-28ea-08dbbac43ea5
x-ms-exchange-crosstenant-originalarrivaltime: 21 Sep 2023 17:00:23.0057 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1724
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_14,2023-09-21_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_14,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309210147
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309210147
X-Proofpoint-GUID: hkMYiay_Ey4col5lR2YB6oY5KAjyaQ1l
X-Proofpoint-ORIG-GUID: hkMYiay_Ey4col5lR2YB6oY5KAjyaQ1l
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309210147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=NRq1oQc1MzGdLDEE9uI6IMdFjr6PP12huikrH2Uj9D0=;
 b=tL+etulSvbDpj/wju00DFUyNn3Ky1oBjkieIcH42EediMg//HQaLmjGbzDMToLFeA5FP
 /rPfrl5ndmb2ZJq9NP7vEwWWs6fm6muTNgSDI374+TElM82dhnacG62vSbmmOKSLlmMz
 01Bz7JMiOfhhChlcM1btnCqSwu/P5yn06JmVX/8UX+Bc0mnznqP8xHbW0KXXrareJcwL
 +Aj7M/nLhJiM1sz0EM3yIpDTrLehLvFkmWs2l3T/pxWto+WKecMKyWIYPIu2BDlRdtcT
 qHDq9LoIbHRwQ0QQ3ynIQ/bG1bzYpc7wWFOwhiI1dC68F7GElBHjBx4t4I2W0AkPZCZM Kw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez9dUa1AvwLVxj4iHmedXsOWZ+eDFKSC0nEbkGhaU6w=;
 b=F1e2d8LCF/dpbuLGQlS3Heznsr3b6z8FWtz+Ez9cV4fYICLkvmRkn+wKe2PtWekeo44M3+Bg1MdYp/Hlm9lfSpDxpVyOAsy440mNg3Gw8cK9ODWK6cXf59XWxhj3j8KkVnUXjY3HQ4H5z26A3Wvi3Ur3vNucPnXkoiEI6VeHwVQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=tL+etulS; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=F1e2d8LC
Subject: Re: [Buildroot] [External] Re: [PATCH 2/2] unifdef: add target
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> -----Original Message-----
> From: Thomas Devoogdt <thomas@devoogdt.com>
> Sent: Thursday, September 21, 2023 3:09 AM
> To: Maier, Brandon L Collins <Brandon.Maier@collins.com>
> Cc: buildroot@buildroot.org; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Thomas Devoogdt
> <thomas@devoogdt.com>
> Subject: [External] Re: [PATCH 2/2] unifdef: add target package
>
> Hi Brandon, All,
>
> Is there a specific package, or reason why you need unifdef to be
> installed to the target? It's a host utility, used e.g. to build
> WebKit, but I don't see why it is useful on a target.

Our application team uses it to preprocess some configuration files on target, so they can ship one config that is mostly the same and load the correct one at runtime. We've had target unifdef in our BR2_EXTERNAL, but now it causes issues because the same package name is in Buildroot. Since there is now host support upstream, figured it wouldn't hurt to add target support too.

> Further, I would
> move it to the "Development tools" section, not to "Miscellaneous".

That makes sense, I'll send a v2 with that.

Thanks,
Brandon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
