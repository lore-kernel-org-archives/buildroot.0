Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E7C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 17:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B9F3610B0;
	Mon, 31 Jul 2023 17:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B9F3610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOOZa5nI9Tk8; Mon, 31 Jul 2023 17:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7014060EED;
	Mon, 31 Jul 2023 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7014060EED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CBFB1BF47A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A3B40236
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 17:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62A3B40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8IbAQJejHpO for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 17:53:59 +0000 (UTC)
X-Greylist: delayed 1023 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 17:53:58 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DDC4016D
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2DDC4016D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 17:53:58 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36VE8mJ0015944; Mon, 31 Jul 2023 17:53:57 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3s5csss2sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jul 2023 17:53:56 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph008rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 36VHrr7V025380
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jul 2023 17:53:53 GMT
Received: from UUSALE29.utcmail.com ([10.220.63.19])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 36VHrESs000629
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Jul 2023 17:53:50 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 31 Jul
 2023 13:53:50 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 31 Jul
 2023 13:53:50 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.176)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Mon, 31 Jul 2023 13:53:49 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1031.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 17:53:48 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7dcd:c63c:231:5ee9]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7dcd:c63c:231:5ee9%3]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 17:53:48 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1] utils/docker-run: fix
 support for git-worktrees
Thread-Index: AQHZwZsBSNsxfnMeyUKb9AlC1aXtGa/Q4L8AgANGsNCAAALOMA==
Date: Mon, 31 Jul 2023 17:53:48 +0000
Message-ID: <BN0P110MB1673CD7AFBD6CF8F5D8848D3EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20230728213218.3893857-1-brandon.maier@collins.com>
 <20230729153310.GA229077@scaer>
 <BN0P110MB167326D5720C0DDA05377E90EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB167326D5720C0DDA05377E90EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1031:EE_
x-ms-office365-filtering-correlation-id: c2cd7166-6c69-4e28-29bb-08db91ef17c1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5MiO7Gz7Jgsl6nnXMOQXMXIt8br12hXbNup68U4d69hDOb3SZdfYUVYheaT++jlf5KIjLDi9b9ZJyFYjj3/xqWXFpwHYzeduOrPnJKrTKK9ZV9zfBnCmGp6oY0Ph6ACcZMGSzOfMfB3vZdl2lWgHIA+5OHFKCeTZxzTEAbxKLxx++YgjI1y6KtNsCbRWG1ukAKjIX7y8aTa55YOnSbG4YeNs0oK1lMQBU4JSsePmKxDmQ/Km0TlqNXm/8xy08grEaGY3GHVCXUcUwr/Q4YFFLuRQycGyeROc7qaaJz9AvCeKJiGzlD5n6pfNHkzF1Kg1KhSAF1ubM9wWLeeFttgXQgdif8FFMaxSIWZ3BlIy9LJBrqlaZ2tHhBQo1IcShmzY3aTTqDo+0lWILzOhhh5LpM1cOZ5DXRGUK6FVhWvcEGZJRkOZHJWBbMfwnMEOQW6o9p3oLWOGTQKAr4Jm5RF5T4efJBwg7o0vR3QwuPHebzPcsHXUzGS28z4QXCB31mzShKk1LDIfOW+JpLngxaEUQRrL/0j2vG9S/EoS/4cG8RgR23FPOVbpJ5M7C8XTVMObhfRNzenC10CuLC7lb2TsAzD7ci5Jd24uoRucomF6Muz5C1p2b+Kkf4N/4e9pqY2mjnxWxNUcAmFWGszhh2XejGbP7+tRx/olTB4k/TYegV8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(451199021)(5660300002)(52536014)(8936002)(6506007)(2940100002)(186003)(8676002)(83380400001)(26005)(498600001)(76116006)(53546011)(54906003)(4326008)(66946007)(66446008)(6916009)(66556008)(66476007)(64756008)(7696005)(71200400001)(9686003)(33656002)(38070700005)(55016003)(2906002)(38100700002)(82960400001)(86362001)(122000001)(84970400001)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: CiNIz6HAIZU1IIaHcZ/N9OxKJAWsu/r+KdWnsZ32w+o4rKSsyMF4YgzQBr9ujXQtKWHaAgHkWTJxBBPHIocunHEC/H+StUolFgQhWbN/Ei+QNbRrEluuhqccmY8goW0LtGfMcOxIA/umUPCWLSiQsvqKDHqcKNh3QimLbl1BUIWQQlbynd08JtaZC+HKgrzJX9Sl9UW8wg2BbfXgvoCBf4ablzpKuuv7npfy7T81hB/nGZxK0hse/Rw9lYVy9J36yRn6vyKzfXh7V6c6tve//7pgLhqvIhy2LGfJQv3CTX0R2YrlaKfwi4+Qadfr3tS2EFgumjEE+h84OoGLm69RMu/hInEPVhy8rEkuwdS/jjzyBB4DJxHYXO4qXqYf3uNe15irqQjnWd0b6A/0xfEX0I9iQsy8ctQmAt3FhE1W/R0=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=xkRWPwdBvmmA7QqyO6ZwLH+sH2PfXxR3BRmXuosTD78meeLbtG7IrGBu61WpxNBPqmO9sIkZQx/oD2REZQm5qqrrHyqSMGIJUD8wyK2mJT+1nj7GwLiL0NyOuHDdOlJaGmXdxWEspQH6CGwuawCIhQJpDZ4vxR6MLWohOLp+rJ56nXciY3WIET5wGoS4mWIZVth6rptO/ABNhH4AQvqYPJKw91C0l8TuCAtagKZYhZBVmeGXbdeMcnXsg2FHqrO0gqeDQ1WPbp38RaeqwrtI29fKLJt8QQ0GSQN2+0AheiDq2ztKOU4o+W6a3Is27AYJsrr29pwiYiXm3cf6xD476A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNS2HNkC2nRECpsSGgu95AWMQbU0VRsYl+SclgY+KGg=;
 b=1FWisHvg6kkPsf3Qf4x2WTYzz+g4kU0VHCMF5fSfVgKQRqRLJcCF9klwh7GU+rbrtpuucmAsi3My0MXafZfzYP/nJlDCipX9EuST9ztg/gd6MBPkSXAi2fwF0ZJRuLO4hWt4eHtcdB8unjCCmQcLpXW2So3CmLWoXMZsaymt+ZoMqytQ5dcShRrC88YTcYqvw/2uxvEKz3aCPwKGKB3FDvNTF95nLr1NvVkanXjrvh8NDh38xjxZMImq1UsvFJCmZPL+yyERXKYr8CQfOzFPRy5elRbwWHZ8JG0+A1y1tZJd5cohWcbOjwp+qiD3kD1IbBXBunf4yzhOWCaZRAu9NQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: QUMQ+of5u9DRUcX7mSLfrpBLPORp3kxHsCC7+EX131EwWruPgzNallQ/McZfLshhTyP20qOZmvXmlC8jNehtFL02wvVeW85uMNjap0jT8uThVCBwiHm6Tfc9o9fm1lR4DuR1ypyY0Ys76bvfzmOCxW0mZOl4HNFsXoJA2Ei7Hfvieh9qUCk+mBmTe7cjRJAqYX/S29JI6SapPzqmQD0+mcn311dbipHEYxUUWrVUeefTkJvae/y9sitpaVkIq0X6TeG8fXwwiKTl/g4KU8s89eHZATvYVFRz7HiUTF5OUxQsUoHWQQwd1tDyItcYZBhlf+m9R/jKOup65HuyHfbmCcJXytjrGMrAV+ffEPbYthKsGWop+hg2YYEDne2gur5bmsZUgs5Z2fn2Nv97UuEf+jjeiKp3TBj7Iok7TRKeUmXQXumQnV7rpTnVN7YHV9OMS11T7sHDdYzOGOReC8XbiRtUeW11uf/cqXGhAJREGvYRg+QCaXUjym3Yk7GXnytiu6HcMcsWWOT8XDuHolFPxsqecVR5itpiHvSkU3IaR8TZZjH9aLJ7yx/m+Det5x7LoyGPheHT+O+EOWBZ0LHm3DESDbMx+p9tctxcRwsw5NYtzERe1nR/FJWtBfqym6uUQx0XKYYCtY9KhX4H86DvFyJ5jreP7yLq1UFXvTXmuGv9LfTj8iN1XxoQCS3kiz+ieFbK2MyYWA8UYRaKoPZYaHCUVsCeV3RvMFrVULlZXJiqBknZBdWObAUNSuj12FEeB+m10OXT8H2TWP9a0qxcIPnt3VjRQEDIZlI0baNctuI/aHnYX3FqDKw7KEaP8fjuidqaJ7bfamtSwwh3NOr2Sg==
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: c2cd7166-6c69-4e28-29bb-08db91ef17c1
x-ms-exchange-crosstenant-originalarrivaltime: 31 Jul 2023 17:53:48.4543 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1031
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_11,2023-07-31_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_11,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307310162
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310161
X-Proofpoint-ORIG-GUID: 5bioogs21jUrr1uSGzbdLhiaeZs4LOaV
X-Proofpoint-GUID: 5bioogs21jUrr1uSGzbdLhiaeZs4LOaV
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307310161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=joOQVblIfYOcwDd96wtz0LdWd0siwAtZa8NDaD2GBkk=;
 b=k2OcmQ+Ct81O7ttLLid/hgDan25bofeY63K2rFRmcrbcvIZhoFWcVI/oMn3uPzRGs6d4
 2+x6qn2JOjJtExLZ2CxZD1PyE14bE+ZvHQVTeVy5U8KVc/1upukCaCGBFCA8Ff1RIEHs
 PQYS7FyMlN2lpbkKmUXqX+rOAzbM2fmFSc2FdehyIj8rbTM06krGfQ79HKZuXb7y/FpS
 4f9a6F45dsFWiXBIkGHPgQE0yTquzECg7MkMn+m63vqJDRiKRQ/s+NHp3ogv+CfF+e9F
 5JjOAB/x/qGRJITNvquv6P23iwEvjl9ksTlP3L3eAwJRf1IQb7szNNqAJbkp/IFq6PWd Og== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNS2HNkC2nRECpsSGgu95AWMQbU0VRsYl+SclgY+KGg=;
 b=CRYSFIwJhZlRfyvkNr3/LWLZth7ssIAxuFitQEveuiWx8ggv3EjGM1xPWpWZrUhXi39cUEBL66LIZq1SuAJ4YeCk12HHdV75il/adVbUZUv6PdBmHXs31lKOzm99F27xUrhlNVE4Tst6Gwdw05vE5yJeqJdq7F4oHzQRGXkPX8g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=k2OcmQ+C; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=CRYSFIwJ
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] utils/docker-run: fix
 support for git-worktrees
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

> -----Original Message-----
> From: Maier, Brandon L Collins
> Sent: Monday, July 31, 2023 12:37 PM
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: buildroot@buildroot.org; Ricardo Martincoski
> <ricardo.martincoski@datacom.com.br>
> Subject: RE: [External] Re: [Buildroot] [PATCH 1/1] utils/docker-run: fix
> support for git-worktrees
>
> Yann,
>
> > -----Original Message-----
> > From: Yann E. MORIN <yann.morin.1998@free.fr>
>
> > > +    # Support git-worktree
> > > +    GIT_DIR="$(cd "$MAIN_DIR" && readlink -f "$(git rev-parse --git-
> > common-dir)")"
> >                       ^^^^^^^^^
> > Expansion should use curly braces, like everywhere else.
> >
> > --git-common-dir was only introduced in git 2.10.0, which is most
> > probably not available in enterprise-grade distros like RHEL (RHEL 7 is
> > still maintained, and it is based on Fedora 19; there's only a docker
> > image for Fedora 20, and that has git 1.9).
> >
> > So I've added --no-flags, that has been present since at least 1.0.0,
> > which means that, on git versions that did not support worktrees, we'll
> > get an empty GIT_DIR, so that's OK: it means we're in the main working
> > copy, and thus we don't need the mount.
> >
> > Applied to master with those changes, thanks.
>
> All the changes look good to me, and verified still works on my end.

I was looking at this again, and there's a problem with one of the changes. If the script's working directory is not at the root of the repo, then the `readlink -e "$GIT_DIR"` will fail because GIT_DIR is relative to the root of the repo. My original patch had the readlink run inside the `cd $MAIN_DIR` so that it would resolve the absolute path correctly.

Here's the output with `set -x` if I try running it from another directory.

$ ./buildroot2/utils/docker-run echo hi
++ dirname ./buildroot2/utils/docker-run
+ DIR=./buildroot2/utils
++ readlink -f ./buildroot2/utils/..
+ MAIN_DIR=/local_build_dir/blmaier/buildroot-update/buildroot2
+ '[' -L /local_build_dir/blmaier/buildroot-update/buildroot2/.git/config ']'
++ cd /local_build_dir/blmaier/buildroot-update/buildroot2
++ git rev-parse --no-flags --git-common-dir
+ GIT_DIR=.git
++ grep '^image:' /local_build_dir/blmaier/buildroot-update/buildroot2/.gitlab-ci.yml
++ sed -e 's,^image: ,,g'
++ sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g'
+ IMAGE=registry.gitlab.com/buildroot.org/buildroot/base:20230207.1123
+ docker_opts=(-i --rm --user "$(id -u):$(id -g)" --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" --workdir "${MAIN_DIR}")
++ id -u
++ id -g
+ declare -a docker_opts
+ '[' .git ']'
++ readlink -e .git
+ GIT_DIR=

Which it dies at that last command as the readlink returns an error and `set -e` is enabled.

Thanks,
Brandon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
