Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205DEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E00361478;
	Fri, 14 Jul 2023 16:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E00361478
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4FnrY0EPrJL; Fri, 14 Jul 2023 16:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F8261473;
	Fri, 14 Jul 2023 16:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F8261473
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EE591BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444D041863
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444D041863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kb1iooEaZwQR for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:42:04 +0000 (UTC)
X-Greylist: delayed 01:10:46 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F0641858
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F0641858
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 16:42:03 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36E5Lp8g014278; Fri, 14 Jul 2023 15:31:14 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ru058kgw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jul 2023 15:31:14 +0000
Received: from xusxph009rp010.corp.ray.com ([128.13.125.224])
 by xusxph008rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 36EFUn1j017377
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jul 2023 15:30:50 GMT
Received: from UUSALE29.utcmail.com ([10.220.63.19])
 by xusxph009rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 36EFUgIb019588
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Jul 2023 15:30:47 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 14 Jul
 2023 11:30:47 -0400
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 14 Jul
 2023 11:30:47 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.177)
 by UUSALE2B.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Fri, 14 Jul 2023 11:30:46 -0400
Received: from PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::6)
 by PH1P110MB1187.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 14 Jul
 2023 15:30:45 +0000
Received: from PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ef29:cd3a:c719:f15]) by PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ef29:cd3a:c719:f15%5]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 15:30:45 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "prabhu sannachi via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH v1 1/1]
 package/redis-plus-plus: new package
Thread-Index: AQHZtjnMyuJgIfT9y02HXtPO+0GU+6+5Y5xQ
Date: Fri, 14 Jul 2023 15:30:45 +0000
Message-ID: <PH1P110MB10671E0659EA63031BDEE958EE34A@PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM>
References: <20221007211932.481-1-prabhu.sannachi@collins.com>
 <20230714115835.3d1f1b02@windsurf>
In-Reply-To: <20230714115835.3d1f1b02@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1067:EE_|PH1P110MB1187:EE_
x-ms-office365-filtering-correlation-id: e756414f-aba1-47be-392f-08db847f4afa
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NUHeUcigFP+BcmgVvpBvtnL5j7rJKI7KnAEc67cwEdYDevkWyokmnOTUng8PMk/5zG/qaT2/wi9UpMzQp6iHOdP2LLu7FgX9Dnz8LX6CdLXqq3PCMQekQzvA1AXgLkvaiE9SrUQSoV2dMP4kHpFYdbprELoIsJn5iLozbPByQOm/PhTrtB4qjHjXCETTF1jooNnltYujhr14sqr78QA1dlv8knUKZtbzHtjII023HnG8ybTmGQPUr2IAA1fYGHr7UK1WOyyjbV+smJ+izcjmni9Igo4T0+UPqNEjUd4dyeedsc2TYCEhSjTicjpLe/TIn3Y0300ooqWggNFa4tqsN4tqBQ/CvxwsVHT1MV9VF3OR1tt75vfz/YqB/S7p5q2FblHBdyQ5EA1Hy0YY15qtefvlXxE+z1hHWHpjrtoyLOjEzGJdDHsBUEE+iRZW4ZDnhUYCGvP2e3aYKl8RADxRUAlEl1a/5tbDBftnXPPFXJWPBy+pnnAuBhrVhh+0Nbe5yL7trA5Z4IY4Aqgw7Ysu2ngiK/WfXQVrDnGU232YaiETpUsvlGEFngYtJO4wBTNx/+5HGgZ6iD4EAKOD5L1Jf5/arbAVctHaAikCvLvah5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(451199021)(66556008)(86362001)(2906002)(33656002)(83380400001)(8676002)(8936002)(5660300002)(38070700005)(52536014)(38100700002)(110136005)(64756008)(66446008)(66476007)(66946007)(76116006)(186003)(122000001)(6506007)(966005)(26005)(53546011)(55016003)(9686003)(82960400001)(498600001)(71200400001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 5IeYgEDmOW1ZnNy3q7nbsGSF+pX5NPw6dHVAJH/XyQKAZ/seNQEbfd0pHfRDal5IruK43BE3hfyHFeP9mo1aKOvlh6XpkYAblbCrsax4BrlSh8jh+oBNyK+SG1lZi/iFnVwBm52ssZbAWXUY5qzHTOjJViuE06UqxXKB011iruzmwXT0VFxa9kXc64jd2orRhrJYqUhLt2bC0oS9A8nBNXrqjCHBUKdrVRnhxu+oSmZIWyhEkqsQtAPsK9bfNgz/Lt7Ef0DEjNUDO5hBaRZyVp/e2Jap934++MrSjacdODA+IvsthFmUnp67gBMhMldO+iFYvDfJSsCU8jsWD6Ka1s8wykYS63zsQ++Xs7gkq3XcgPgyKnjxbMCDXMq3DyP5cd0IdRCmcynz4jh8UIlcMfKgxG+bxcRK5d154YP96t8=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mc7LKVzkcih46RD2ugJxw59S0aLYRgtdUGFIO+ehslDZiTPurrpdovE4UxmQqmW2fnqkNKJ3ds9D7kezIlrhbpJXou/T2ftiF1+uHClJoI5F3skeL2Z5TRXiANlpAdt/oaT2sPSsdS59Sv5kv//ONlIU4f5dJnSQhgk5nUHxFT7zVZWoyPmVJZNm83p0tPLsEgPr6XioLY0K/JzTNcCsvI4U2f6xvqksavNBwfBxSkRg/crHjpcnH8+hdnUV+0bvyQ9llLSEy1aZkxmJCfQoM5rdBhjdGR0eG2/HE12WFnWnKR9EtN7UFX8V4S5R/DdnldbmxQ9yS4SWmifjddYdcw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hT9HdGu7pYf2YkmljfTRXc3z2vNJDLxqumfM4NgvEo=;
 b=JIRmKcIhfIvfzgQyVzUAtB0Mmgs0v01h7f+VuqC0MIIt2vYRJThadZaFuqfDiMQI2qifsLxSrOtJOLPibaxQdFRPuwCVRTfz+TwMz0+YTV5DRchILwS/rNgHMDdCwxoaCCHctbz2jddBENs3bS5kkHg+ADm8V20+EzVmqp63HTt1m6buEaJhZvWo5QS2Hr0lphgeEPbrvDY13DO/tU+mGCUKjEIvAGG/UNtPFq29mC0Khh6+5fMtsoNE/D7Y1CE8n3rLh8ungWF8AbafCG5X+8fvZJaLEnWXMGA2AicBX6+nvW9XVh7f67exJB/Kw+gcjbGMEjT2QOGsfcrGcdmdmw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: LtjsEva33CwHn6q2G5qVrGgOr+EI8A+ybUmfm2+SlqVkY0m7qCWpRH0gkgGu1K2b1eSNwcv0UIpP6IQ2ySNPlwLY/aL3zy+KmL+JS7fCS30UjtloL8ToRrDs3+TsfCJcTRHxO5N13BwICTlnbB5LrBfdFk775u/tLMiUpxpV6mW64H4/TXwwZ5KV1IU3n5EhmKVhNP3/vMIofd2e6jN/taeY5SscIGL1hRFrCo4XsDkCJ1rRCLpmfjLIIuFFvPiTsZiGj9rEkCGsyx89p9prQq3z8iR1OCctqhaS9toUVU8v56GRQpQhPiglrTlGVI9CW7SsDuK0CmBFK6kCTbXGdPTFCvsT1ypnyTftJ4HMiDvXyneY/Kem7r8amVQipVD2ePuHAEk1Xs9FLTP6CCy88MobmVu8n1mbqMX50so3LGjFTHdCUP/TRvopx94z6VF2rbsbivJufKpqjbMZ82kHwRggvjS39OtEJMA8cI4mfpas6k3MgbSZ/6yK8Fnu0MYqtwmqQ6oOYjvWXMttNgcZL2QevUzO7fksFbzqfet4Y0uEQxhvQ965w7Ka/Hkhb2YdALCKq+QL17QQcPNHwfJzZ0VWdI8YyoSEgYjZQIoWoNl51S6Lz1qTkezmHBKbsdoLYgd5qe0p3y72aTQztSyzfnPUGO/Fo3Bu7wGt5ngzb/A6szYppzpd/UmvUz4hYQz4y4149uSROWrOUhXGMAGwffw/RJr3zlC/vEdnXO2QrnavXDZWDLb81oFjn5p/5pCYPWKGUXld/l/9NRBew38oizVGrkkzpTVU2s6/X1NC3eE=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: e756414f-aba1-47be-392f-08db847f4afa
x-ms-exchange-crosstenant-originalarrivaltime: 14 Jul 2023 15:30:45.6538 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: PH1P110MB1187
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140141
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 mlxlogscore=946
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140140
X-Proofpoint-GUID: BHHsYHXn7SslKpEbUUhGfn80Cr4OP1tE
X-Proofpoint-ORIG-GUID: BHHsYHXn7SslKpEbUUhGfn80Cr4OP1tE
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=4A8vwzFVF4bTLRu/N62dF9IJWOU4BkWrn+9+7JFD8dI=;
 b=tPJ0yP1q5N2969Tg7siw3PhtF5f7d8crAZT1XKClx5t3ifZ/WMDNd/ggSotATJcxFPhw
 sy9/8GILN8dEQENWdB98aPB6FFgs4kAg6J2V2P7zi+qF1gCPKGDGrc0cSbon2zTHGSi3
 GIzWscIIbCWGRgWZ5Wg6D+l0MZzv9qK9zxnn7q9ZYGBYE7yNpzFze0yIjWr77mkGqruj
 e+4BWGrrj1lPoxMAcoVw+XOaUM5tGe9hZ9leUJHjgE6mHPHpnFuUwmSOIsjiN0DiNS6Y
 3kgGSIjXo+MRjgmPueobvoTaAgU72msqWlcr0lO8zicAqHQQYabWrcYplGnbG1b/8x1N 3Q== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hT9HdGu7pYf2YkmljfTRXc3z2vNJDLxqumfM4NgvEo=;
 b=E46dtHA1Rw6qIxX6573mbCh0HmAL2yxe6T3bNClYn6LgZDnMA3LxI+HMN756OxqbOas60zePkeFPz8ky7TAdy3im/7CYh9SaxGDF8YLI3OYfNgWKZE+J8TfVU/qkzUfcvOro1M3rf3Z2olb/VznqHmqpQs65CTsxc/CgMOIhZts=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=tPJ0yP1q; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=E46dtHA1
Subject: Re: [Buildroot] [External] Re: [PATCH v1 1/1]
 package/redis-plus-plus: new package
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
From: "Sannachi, Prabhu Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Sannachi, Prabhu Collins" <prabhu.sannachi@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas Petazzoni,

Thanks for your input. I will take care your review comments in future commit.

Regards,
Prabhu

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Friday, July 14, 2023 4:59 AM
To: prabhu sannachi via buildroot <buildroot@buildroot.org>
Cc: Sannachi, Prabhu Collins <prabhu.sannachi@collins.com>
Subject: [External] Re: [Buildroot] [PATCH v1 1/1] package/redis-plus-plus: new package

Hello Prabhu,

After many months, I finally took the time to look at your patch and apply it. A number of changes where needed, see below.

On Fri,  7 Oct 2022 16:19:32 -0500
prabhu sannachi via buildroot <buildroot@buildroot.org> wrote:

> From: prabhusannachi <prabhu.sannachi@collins.com>

The "From:" should match the Signed-off-by line, so I fixed that up.

> +N:      Prabhu Sannachi <prabhu.sannachi@collins.com>
> +F:      package/redis-plus-plus/

Indentation between N:/F: and the value is one tab.

> diff --git a/package/redis-plus-plus/Config.in
> b/package/redis-plus-plus/Config.in
> new file mode 100644
> index 0000000..3c23dc5
> --- /dev/null
> +++ b/package/redis-plus-plus/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_REDIS_PLUS_PLUS
> +     bool "redis-plus-plus"
> +     select BR2_PACKAGE_HIREDIS

Missing depends on BR2_INSTALL_LIBSTDCPP, since this software is written in C++. And also the corresponding Config.in comment.

> +REDIS_PLUS_PLUS_VERSION =  1.3.5

Only one space after =

> +REDIS_PLUS_PLUS_SITE = $(call
> +github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
> +REDIS_PLUS_PLUS_LICENSE =  Apache-2.0 license

Only one space after =, just "Apache-2.0", without "license"
afterwards. We use SPDX license codes.

> +REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
> +REDIS_PLUS_PLUS_INSTALL_STAGING = YES REDIS_PLUS_PLUS_DEPENDENCIES +=
> +hiredis

Just = instead of +=.

> +# since version 1.3.0, by default, redis-plus-plus is built with the
> +-std=c++17 standard ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),)

is more commonly used in Buildroot.

> +  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
> +    REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=14
> +  else
> +    REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=11
> +  endif
> +endif

We don't typically indent such code blocks.

> +
> +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
> +  REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_BUILD_TEST=OFF endif

We disable tests unconditionally usually, so I've done that as well.

Final commit at:

  https://urldefense.com/v3/__https://gitlab.com/buildroot.org/buildroot/-/commit/c46df9de21e718a9ed6a2df2bb945c386695d3bf__;!!MvWE!Ctrbmd8RE2sbwEAMgJQIE4dlllBaphGkzTDc_NaL0tCtQ4Vdm43DiI3oDMCjCXSb87Qq625Ux-j_NfMaIj8H5iCTbEsqqmlh7w$

Thanks a lot for your contribution!

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://urldefense.com/v3/__https://bootlin.com__;!!MvWE!Ctrbmd8RE2sbwEAMgJQIE4dlllBaphGkzTDc_NaL0tCtQ4Vdm43DiI3oDMCjCXSb87Qq625Ux-j_NfMaIj8H5iCTbEu9EopxSw$
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
