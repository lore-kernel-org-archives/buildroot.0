Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E9AE748F6
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 16:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6FF441762;
	Mon,  2 Oct 2023 16:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6FF441762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3URxrJqEIzf; Mon,  2 Oct 2023 16:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8342417B1;
	Mon,  2 Oct 2023 16:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8342417B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2E41BF410
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5081741751
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 16:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5081741751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGN-KpzqZ5do for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 16:21:53 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C117741762
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 16:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C117741762
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 392DLJOh002670; Mon, 2 Oct 2023 16:21:50 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3tea33ehe8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Oct 2023 16:21:50 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 392GLmM7026957
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Oct 2023 16:21:49 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 392GLiVN010305
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Oct 2023 16:21:48 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 2 Oct
 2023 12:21:47 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 2 Oct
 2023 12:21:47 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.177)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Mon, 2 Oct 2023 12:21:47 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1339.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:182::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.37; Mon, 2 Oct
 2023 16:21:46 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c13c:9866:732a:abf8]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c13c:9866:732a:abf8%4]) with mapi id 15.20.6813.027; Mon, 2 Oct 2023
 16:21:45 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/4] board/freescale: fix
 arm-trusted-firmware for binutils 2.39+
Thread-Index: AQHZ7NaFaVU68wkmwkqVGo5fL7d66rAziZcAgAMqJwA=
Date: Mon, 2 Oct 2023 16:21:45 +0000
Message-ID: <BN0P110MB16739C7161EECBDE65DB936FEBC5A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20230921215633.34828-1-brandon.maier@collins.com>
 <20230930172024.5aaf0df6@windsurf>
In-Reply-To: <20230930172024.5aaf0df6@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1339:EE_
x-ms-office365-filtering-correlation-id: d46241c6-574e-4336-b201-08dbc363ac11
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OWBxkQWMIY09Qx3Sz+rHIyizKThCe42FXxrhcugsaneil9PU5X1gQ67lUVtStK/TEd3xhqX6sECDZM2jR8OfcMO7bPTlVlBU7hhgErxxyqdlFF33K0t/EemqJNq5+38rRIYZRGiHL+8RL8F+7NQVj2NKl1yVyH7+wQxInHq7CDMMMhsV9zqz+a0Bm2AmyhNkYuO/N/scbBFikXrOflpl5oUh84C/Md6DmA7KF7cwScB02uyNYAgXZePBcn0nGjtCtnQBMznnzewlOBGg6d9y3N4Fg1SZPQ9mBhnGfOYw+H7BiHxr8AHYre83DzkTHUfM4rBR62YNtGZ80dI+4hgBOFjAxS9UErh1UTiRs4CN2cxFCRYaNe8OSxYakEbAfww38sUp/3b0j9MPS52Y4bilOomkRR8Yak82JnrCiVHKEhbpqDnklG9kGwnsFnp9MtnwDBfgQXvc3bg1bMVdlrMUQ8wJu93pn997H9GlBpK3KQTWDf8RzipQEfLZ75ST4755NfW3Nik8YWhgCMOCtZwoDdORjjDhcT7IRURhFC9ZOERk8zaaxXMPL4bvsCdCgkBve9sXmIOBddEdndDG3KdyhbfO4o9h3dFYZn0N6hGkn+k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(1800799009)(186009)(451199024)(6506007)(9686003)(53546011)(7696005)(83380400001)(8936002)(966005)(498600001)(52536014)(66446008)(2906002)(26005)(8676002)(5660300002)(66476007)(54906003)(66946007)(110136005)(76116006)(19627235002)(64756008)(66556008)(4326008)(122000001)(86362001)(71200400001)(33656002)(82960400001)(55016003)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: fV0cKlDS6lqCZBYlUnrXAPi/Tg98QIybe9A9Wl4+95JF0IqmdBrqJIPA/Ni+h9IIH6lbwFA50kfx83wRocsiRDRplvj62U12BMt0VO0qIJEMSkTv/b55EgPG63z9NVsHETrGvXXfP1GCrfqookX2c4gQtPfKwxiNDHob/uZP0ek4vlmQcj8ggvLuxpEs7k46ZH3txcYxJBKNIR6ys7Lv6oYvOWwmDF4qdOUUx8ujCkARYNQ3DBfupC5VIfZeA/+KrT2OVD8X6CN3e4Gt6sPZDl9Nlgpn75BuwwdYpszp+8FRqgdamSekPNrmTvJmBu6m3tcJ0+BvfewmE0PmFyYg3yECN4o+mCCc5V3YAVjCwVh0NGKArZ6qwF/xWl9SX7s6bwxJcdBIiORfquX9zVbhkY6/xNZttiLtFejfTG6y0OQ=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=yqqGDriN7m9FjKxCIAZHDE2+gSJsyHHofSsbdlNQi163jDzuQ3yjbBg49H1crtQZVRbpvupBUzDhvkrJKSF8ubGZWkiR4MMiRQxkOqV+Uok0ulxwMQWLD0HEtNK5JTYFFvJISa5ObkcMZtRbQtaMvkGqh8g0al4h1uLUZ4DZXvSX1ZBDg4xFRmtqqn3fdbLmtjiWphjiDJSeOpBSFmQuLN5kSIJZSYFS4q/CAQSjXU44EVzhRAD96kxrRzDEe5a7DtZSwgp6DgHuYOILOpxGDBy9Om2OIGt5WF68zbToo0JDnLa8YqaHGiEgIM2ex+8JVeYvdaIp4gOicyxO7jGs2g==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/MsNaSuwDOsDeMPoGQUmjzJ8HhZcAE8WIK7Uwwu1fU=;
 b=oI3SQb9uJ8XThPyfBZbuDBvpIOvInEeteDYHhwWMf8VDRB3PUwQy128kIccn0q3Jx85/qqg+NdEKnZGxva7q0LqRDmWa/hy5tXFERXdP59n07G34RwvUzx+ZTMGgfRg2/oYTzi23nBqEMXJusHKR6Vn9K6mNCsFlsQD3N8jM70F2zD/vvSAzSzRnVvsZS2ntRq1DfNoVW48c5C8SvdnNz/GS4PL2jY/FkwpviMmwNJQ7NZnT6IHaU2ffT7z5AqX1YtJkXQfrpdBzHQNS5n3jC6XxvjlJsjLZCY/zCYZgilVDY/2t+3rB78HgRI0WCYqrFu2sEVErMixnVgtsqJiIaw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: zRsp2IB2crTVHf9GRiI7iUtqd2QvDot+yxZD2vFm8B5XO0PyB1NPCl/KbSjkTx1QwDF9Yu4uFaMDHo8/J/wZz5GimNptdSHW9/IifRxGzHlytxH74Z7fot2ohfA5fleo+p9rndid8iyWzUDP/VY83dVNXL923fG+xOHW4jJMS52d8xriOAPSwKH/XWPcLxCNZkOTAcEBcqviLxURTPT9AH18ruCbuNafqPEiGu0G+GQ0MgXMYtaXLY1rAENQtG2krkq9KrZHqehzB2Jo/yPaUUyjWApLVptknW0VoJZBpnTMlJMytSeLksyGB2Wk40ORIJy5laTb6e7zsk3u4X+bxwUqCmeRQvV5527niWTYV+r3I89ASKjgElpek4nh1VAokiUTVfU/NrjBxz5xbpgQ78HX//UouTGNwsiEStOpA50veZ3o1m50ix5UQfr/vHNPCAXjLb9B38+CpMhgzxIo151A8C1XzEQB4PmUnKJCuk4GHxF329o1is3QvMvyOsEEmrvMR+okIZ5VdIPcPTKLVoAiscbEItUzFf3UwjhSBHr2f60tyhtRJ58BUtjJyT1SAq0JmbJr+K3o456PTNhe+1vt6ztBaxMb5ZvVhSnwt/oCQDluF55SMOR+YjQ5EuPfcvFT5TH/6Kyx+geu3wpDCRRlZXsZeildi+9AZ5/wyDfPTUuENkMCnWVF55s+87i97dddLiekRDoOxd92JxubJIqGgdLsMmgJ9xvQhrfxRH+zxcgM14SEvxu7LSw79z6uUZ3GNET64A0D9OpM9UBBoi6Mc3JWLchWM1kMmlTDLw08bgZ+51yYcQPmyWfLEzMF4Qfl8ZcVSb91CSUouEFWTVveq2BfGTySQYqhioNqxfZ7Z17RXwK+9LJWkkNzNx4b
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: d46241c6-574e-4336-b201-08dbc363ac11
x-ms-exchange-crosstenant-originalarrivaltime: 02 Oct 2023 16:21:45.8836 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1339
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=996 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310020125
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 mlxscore=0
 mlxlogscore=964 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310020126
X-Proofpoint-GUID: rUObvxCE6hrR118T7M6QZzPIpmi5gMeS
X-Proofpoint-ORIG-GUID: rUObvxCE6hrR118T7M6QZzPIpmi5gMeS
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1011
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=dUEERrslw7T3dQ/DWdXB8zRHLz9vPx3hKbyeOsEqTBM=;
 b=bUQfys6kqLsxwdyf+xkfOw/SvmnI0JtNbGXUenCj6eYsTevXWZn5cETPrKX1FzlMF+3r
 vnwjsHRvyGlYJNh6d8+64nFgnXAYDcfcVOMcpkmLh92i1++kKI5jTnfuo0z6Y1Vi4Hb3
 CC3RlCYGyEWxIyQaNsjRzTXAnpayOcvXNEyZuMU/BzBGMFCyZ5sS6iSrx+kc4/5bBhTM
 wFPwn9Y6kRcpMZd3SXyFObSNpEa0kjFu3QQn7WinIynaXLABBBGvKqSCdLL2ZsrujdKO
 hHxXIEhX6yDKoRLonfQ4kvaeRE+yZTGr7uYpXSmXdRiAKWJu1KUhkKuekHH6h/nvYQUF Ww== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/MsNaSuwDOsDeMPoGQUmjzJ8HhZcAE8WIK7Uwwu1fU=;
 b=eLXr21bE5apTPtQyXnL817OJMOeEzUSDwE12A/s0kdtfBB9OuaM9HjBijiwW9uPgDtYyeLeeSGUuHs3MqGf795oTYMTQ9SaPSYeN283pAglWOOk85cva+50wSwjKolR6+NOi7HPqV/0H/t7qrkSF/IUJxL8ab84re/azrbpS8nc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=bUQfys6k; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=eLXr21bE
Subject: Re: [Buildroot] [External] Re: [PATCH 1/4] board/freescale: fix
 arm-trusted-firmware for binutils 2.39+
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
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 Fabio Estevam <festevam@gmail.com>, Stephane Viau <stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Saturday, September 30, 2023 10:20 AM
> To: Brandon Maier via buildroot <buildroot@buildroot.org>
> Cc: Maier, Brandon L Collins <Brandon.Maier@collins.com>; Fabio Estevam
> <festevam@gmail.com>; Gilles Talis <gilles.talis@gmail.com>; Stephane Viau
> <stephane.viau@oss.nxp.com>; Maeva Manuel
> <maeva.manuel@oss.nxp.com>
> Subject: [External] Re: [Buildroot] [PATCH 1/4] board/freescale: fix arm-
> trusted-firmware for binutils 2.39+
>
> On Thu, 21 Sep 2023 21:56:30 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
>
> > The NXP arm-trusted-firmware forks use an older version of ATF that will
> > error with "LOAD segment with RWX permissions". Similar patches are
> > present in boot/arm-trusted-firmware/ for older ATF versions.
> >
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> >  ...dd-support-for-new-binutils-versions.patch | 61 +++++++++++++++++++
> >  configs/freescale_imx8mmevk_defconfig         |  1 +
> >  configs/freescale_imx8mnevk_defconfig         |  1 +
> >  configs/freescale_imx8mpevk_defconfig         |  1 +
> >  configs/freescale_imx8mqevk_defconfig         |  1 +
> >  configs/freescale_imx8qmmek_defconfig         |  1 +
> >  configs/freescale_imx8qxpmek_defconfig        |  1 +
> >  configs/ls1028ardb_defconfig                  |  3 +
> >  8 files changed, 70 insertions(+)
> >  create mode 100644 board/freescale/common/patches/arm-trusted-
> firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
>
> Applied to master after references to the Gitlab CI failures that are
> fixed by this change. If you have the boards at hand, it would be even
> nicer to upgrade to newer BSP component versions. Perhaps this is
> something that Maeva, Stephane or Gilles can help with?

Romain said he updated one of the i.MX boards as well. I would like to update the others, as I'm using latest lf-6.1.22-2.0.0 for our own boards. But I do not own any of those other boards to boot test, I could send out a patch to update the versions and verify they build at least.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://urldefense.com/v3/__https://bootlin.com__;!!MvWE!CEcPUERRV2wb
> 6IOiaXKEBuPqtpbxfJ7WlCyGhnSVJpmVsxQ-
> BplmLtE6chgxY5ptrX1qJdKVaeR_cTbbMBQdNQ0nkDOmn90$

Thanks,
Brandon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
