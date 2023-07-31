Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B4C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 18:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E450642491;
	Mon, 31 Jul 2023 18:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E450642491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVdeCPy8nBIP; Mon, 31 Jul 2023 18:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF8041D91;
	Mon, 31 Jul 2023 18:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF8041D91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3746A1BF980
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6765E82C98
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6765E82C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhQPJYO6-h9J for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 18:19:19 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40B61821C5
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 18:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B61821C5
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36VEFqUa003217; Mon, 31 Jul 2023 17:36:54 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3s5cssrxe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jul 2023 17:36:53 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 36VHapAX009133
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jul 2023 17:36:51 GMT
Received: from UUSALE29.utcmail.com ([10.220.63.19])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 36VHZrrh025455
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Jul 2023 17:36:49 GMT
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 31 Jul
 2023 13:36:45 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Mon, 31 Jul 2023 13:36:45 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1227.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 17:36:43 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7dcd:c63c:231:5ee9]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7dcd:c63c:231:5ee9%3]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 17:36:43 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1] utils/docker-run: fix
 support for git-worktrees
Thread-Index: AQHZwZsBSNsxfnMeyUKb9AlC1aXtGa/Q4L8AgANGsNA=
Date: Mon, 31 Jul 2023 17:36:42 +0000
Message-ID: <BN0P110MB167326D5720C0DDA05377E90EB05A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20230728213218.3893857-1-brandon.maier@collins.com>
 <20230729153310.GA229077@scaer>
In-Reply-To: <20230729153310.GA229077@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1227:EE_
x-ms-office365-filtering-correlation-id: 32e2b80e-9c58-45f4-7221-08db91ecb489
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PeobWoV7Mdu4DASjpCXxngLEMzel3oXMyQ9vT/B4Ncl1cvdREJGZGMWTkOtlyNzepTGy+YM3aeira9o7EaarWnUeeI9x6QjZzOHkSLGsFZnYjGA9C/X6f4b1Y3ilszccQ4grmKen0X9t9rAlyw2pRWQC1ieIP/sIkb9dYHACFeJpZO03XaDfdwDFTq4Q0YJCo6lr+2WKMYaITKmwIlUE+lMgxpQd4GWYlaue5TGszMz6jLPYq6wmLoh3uc8xqkGjorKl00ZUkZEEJuP8TN845igOZIQC2JO9Ex/T0gGHBK8Si9RixP9pSHSFs7u4wi2enR9qXmpr4hHW81hv7IDmfDz8mMjCRDRvtv8iUUAWkCtAbI9zw1tnbIP4xOLcXo9l7jl/6mt1hlPbkX5pnIe0RV8uvHgZnEYe/bbhhKbWQftaVSJTscZUZ2PEy87zXs4fiV8z1jaA0M87bdnDArCll68xwQlfaZ9rG69lNwjiTxe96AHHOKJ/QSG+k6nCt4bfqCJxkgmVCJipJxJYvhtpoqkSF07ABbbfkNZHv0mDreW0/snJif5BDqKL3/VOZyUGQRUiUnigligla1f51626ilBIeoUBT5o1wWOIvk0H9BzO5qfPCKFSK+pbfi9LhyqXvY70hNVCGCN0HybhvNthaosR3mHplDqYziFJTSZeB+3xXCpS+c5M8QNQhCKdH26+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(451199021)(5660300002)(52536014)(38070700005)(55016003)(82960400001)(38100700002)(122000001)(86362001)(2906002)(4744005)(26005)(83380400001)(498600001)(186003)(8676002)(8936002)(6506007)(71200400001)(9686003)(7696005)(33656002)(54906003)(4326008)(66946007)(66446008)(66556008)(6916009)(76116006)(66476007)(64756008)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: tjxKxX4rD5tamBcBISroZW6FBvlQjhM1ORb4bF1fXA5ACWvNh8z/gmVkffkcrBG0+zeav4OgX4vNGADo+pbL74NONM34alq4nUVINmcwrZoIIr47WVyrIXv1EPBMwGvRHGGZ8wtv5N06PF13X7ucwq0BZkSq6ERLiqQ1qdZ3hKfvphEHbkQr0CBz7YOXvAISfrWxOTGONmceHSXTwhnaBQxWpaMhAEwIP5EJdNqRxQOSKrpf3Pj3imixHMmV9QBuAsW4pgsAwRoIGcQr596uWYJ7hfwme5GWg5a8Fwb5Kuyok4smYkCCvJ0s7WTlIr2w5IbkRf45GrO9bn8uAfarkteCIYU763VlGk+cl/83xIwNai3PUk7aK3FkeD/8UVyypm1hwfXdW/Ygc5/QBibgTxi3IXNr8ECxGbZujk3R5cY=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=SYOqHfj6r5ww7GAeFdERPjwxZ7qlS7eZAIcn6Ojt1CrlnEzLoo19t0I6b6tVJW5Hjya9Ev0J+ige1/dQkAhvZhr6uuT5EaXhOpql6tfeLvk/qxwFtdNshiY+8Rq8BgaOVMM2ltANIgGRyIkv8941dmaeya6RXzH3I1ihJQ9xfwyE0/X3Jn1ssJCI0rstXi3zEcqv+ZYQ1iJThG/RoLPssK5suhj96wZ5c2MkP6kx9hBPGEUnc8f4lq30n4xENlllBQnC4c2C0vhl8100RH/93HAAaomfQ34UpKIJHAbDXGxiWDzDXgI8dSjNwx1RXLPM1l8OUYSpYMHWAR6Giso2yA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+Rpbmd49hX83djKAPZfCKG4YaBhymtCV1Alqr9ZrY4=;
 b=NkkBq0Im53N8M3T2qg1WrEzzEtxO8O9RI+3H2ahi7Lmk7+Mq75LspOca1G5Pc3tIBQ6CFmoi/yxhni4jyFqU5QP4SeXeGYQ8WpuhGYLjRBd/HJV6MI4azPY7tGA2caKa3IlB6STmPdePPYJ7jvW5m0kL98fIm1WNTXWvg5ACn0JEhQjyGWt8Yraf88IrTH8VPGImniqyyrH14TXanrXxBkfd6pEUvA2Mgf/wFsAtAhINhFkGGiI5sGmFjOual/qVQQu851Vxw6XDaVmldybfICf5odJdC9bEgG4+dKzI200zeU5E+JCcqRy1lQubUL3GecIQa77Kf3Qo4hY2GEltBA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: PpEhQQ+aMaetAfjHV4Sr+A+3L9Z9mRnbJPwh4a1aX06x7PatNj03pyCgfv0NbN3Oe9f6T8JVcD+7SCx5Rjjsj4OKvOBI5NvmNfaXIjrwE8TsW+8cXUaThkXhfLfJ67npVfyKEVFyzOtz3GYzJIN6xT7XM63xttx0KpvFUOoH6aCV8h9NYSJPRtNi7jfPATMmNb91WnglHwQqAVjlhJ8pZHIHDpD7NgO/xLlXpf3BBw8nkcA+tz8eanTosjNoHnZgqNlPjS6UX+QLe0ZXdV/RME1B8ZB773PAfsLn74iuvUDAZVN/XgsXZAegASmvIOizWK+m6gwkLvLwvVDXa7VfNvmtT4AezsiJWPpH9tEFwqGnjgTMZ7PtAdu1vAJUqlAaS5exkncWSUdEzS2TInbRM+++E4jxuWK5jgTRZ4M6EZ5THXBHIaYGo9l0D1KWwYq9anEufa/XXtIc1iOtkEArUSeNNHz1ExK7N2YfujFidjhrt1HIACdlcTp6sr66b24DUquXhB1fOL6THLVfnDl6e7Ro4rlxt7EjHvpWWX5CxAz8kTpX15fTFp2ksTEeDSururYNyrIRepBwgkDpM3rKRgpXU6JYxTgFQ1Te+N/39q5f5qxAinJ3sikaO/FtE2C8rrA3UwZ7V3ReFGIOTEDy9woiIjtbyykRRIZAlc2RlBLRSigJlkSfB1O2a8zSpf8amrdTjABqO0ZwlOjaCvFUs+ZaoCaePqJ2dYsetxFTdBOc7nsNuJPHP5sT7xtWti4W972l1cnUchD1teP8UrSejr2qVWJJ7mgyp08GL32yp/b1R9nPL1VtHtheeF8tVqCuK7LxZmOZCgwBmO7jRHJDMg==
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 32e2b80e-9c58-45f4-7221-08db91ecb489
x-ms-exchange-crosstenant-originalarrivaltime: 31 Jul 2023 17:36:42.9725 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1227
x-originatororg: Collins.com
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_11,2023-07-31_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_11,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310158
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310159
X-Proofpoint-ORIG-GUID: sqiFKI6aTslt7yY0m2zQtRMrCEfDbPxy
X-Proofpoint-GUID: sqiFKI6aTslt7yY0m2zQtRMrCEfDbPxy
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307310159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=ztAZ4g5RlXM1aZjsfgEemUl4dc1snqqPz69CdoyfDfY=;
 b=o8nwqMmnNrT5CQdB8VmAktmhK86zr7XNqGoVWwrc5E6RZ3XVkbNoTTcen0YG0rnt3oV7
 kDb6CKOyWlPLdcRpYMCObsuZxxTe01gtc3VuIbmbFvUqcAjTPur4mEJPJJmHdhnqubaN
 65rtrFRvMI9UxQshta+ewaFwzIO800Q7RQ6kUUmT65A97eqgqJS32d97CtuRMSlNEf6Q
 qkQ024mk/d4Gg7Hf5EN/3TOHm8K2M/D+fqWwsnMqPTy0x2c91JdOY61FJB0/skuGZk67
 0EbHJf/bLl44jTNe1/N85fVnzs9tn/e0nMO4IHH6yhU1h9hSRLehKC4x9DaJ8P35o7WW WQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+Rpbmd49hX83djKAPZfCKG4YaBhymtCV1Alqr9ZrY4=;
 b=AtABJTRadslWEHKBH1WBkR9I41OcZLGvV3PiZCu8i+wu7HLdFdfbVNOnQEhUqzcZ/ljpwKzHS2XecRfgEh/adkEWmdxdNWTZMUEYu9Ay6cUmhETp3JTY173Z4H4VDcl7iTvaI9ur8MlXmNe7/MmNI99KzNmC3mqKNo+LJ3tCm6g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=o8nwqMmn; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=AtABJTRa
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
> From: Yann E. MORIN <yann.morin.1998@free.fr>

> > +    # Support git-worktree
> > +    GIT_DIR="$(cd "$MAIN_DIR" && readlink -f "$(git rev-parse --git-
> common-dir)")"
>                       ^^^^^^^^^
> Expansion should use curly braces, like everywhere else.
>
> --git-common-dir was only introduced in git 2.10.0, which is most
> probably not available in enterprise-grade distros like RHEL (RHEL 7 is
> still maintained, and it is based on Fedora 19; there's only a docker
> image for Fedora 20, and that has git 1.9).
>
> So I've added --no-flags, that has been present since at least 1.0.0,
> which means that, on git versions that did not support worktrees, we'll
> get an empty GIT_DIR, so that's OK: it means we're in the main working
> copy, and thus we don't need the mount.
>
> Applied to master with those changes, thanks.

All the changes look good to me, and verified still works on my end.

Thanks,
Brandon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
