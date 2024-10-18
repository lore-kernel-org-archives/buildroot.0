Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225F4D3C545
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 03:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6F4400DF;
	Fri, 18 Oct 2024 03:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1ci3xVQs8S4; Fri, 18 Oct 2024 03:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC65400E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC65400E1;
	Fri, 18 Oct 2024 03:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D52ED2072
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 03:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6791812F7
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 03:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01GMQ4O-aL3u for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 03:19:01 +0000 (UTC)
X-Greylist: delayed 2146 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 18 Oct 2024 03:19:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8163812C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8163812C6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=andy.a.kennedy@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8163812C6
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 03:19:00 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HIVYKt022038
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 02:43:14 GMT
Received: from xusxph004rp040.rtx.com (xusxph004rp040.rtx.com [128.13.120.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42b7jk47k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 02:43:13 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.135])
 by xusxph004rp040.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I2hCmE015278
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 02:43:12 GMT
Received: from UUSTOE27.utcmail.com (uustoe27.utcmail.com [10.221.63.41])
 by xusxph005rp010.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49I2hCEF017782
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 02:43:12 GMT
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE27.utcmail.com
 (10.221.63.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Oct
 2024 22:43:12 -0400
Received: from uustoe1z.utcmail.com (10.221.63.19) by uustoe1z.utcmail.com
 (10.221.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 21:43:12 -0500
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by uustoe1z.utcmail.com (10.221.63.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 17 Oct 2024 21:43:11 -0500
Received: from BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:169::6)
 by BN2P110MB1025.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Fri, 18 Oct
 2024 02:43:10 +0000
Received: from BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9f88:6b6a:969c:b264]) by BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9f88:6b6a:969c:b264%6]) with mapi id 15.20.8048.020; Fri, 18 Oct 2024
 02:43:10 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Python for host?
Thread-Index: AdshB3N1kO/vVyHJTeSPZb+alacWaA==
Date: Fri, 18 Oct 2024 02:43:10 +0000
Message-ID: <BN2P110MB1060B7C18C429384A20EF037C840A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1060:EE_|BN2P110MB1025:EE_
x-ms-office365-filtering-correlation-id: e6678879-7866-449d-2c63-08dcef1e9aab
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?zdDqu9S4vgsdkuWwJ3Hp6H55C+48lRlEp1ldAuk4Aj0cgCnZY54tA8bV2wQD?=
 =?us-ascii?Q?OgiGHxu7rbob2A7nBHzCHzhaWieALx7NhDfhJDd8f6phobN6UPvusmDBjE/z?=
 =?us-ascii?Q?Hd3Eh+zkROv/3/YAW1smahXMqkJ5UBgJY348FjH25ohfxcRM46WLNv+sW5tf?=
 =?us-ascii?Q?ibgC9bCn0poMQOEoSOgnccpWSSHGUpxAog+fakG0kqjgL/Jgc5vJXpRl88GP?=
 =?us-ascii?Q?L2WVCK+3mPwy4U9wWcYkiGiNAbm4hbpjTZgPkWwe/k8db8Oahy0Kw+M1Cvct?=
 =?us-ascii?Q?uVRAYGGa5QKzf7Feq4wJW4F795bZcDnkJR+AdRqDokb+AP0PR/rETx5fR6Fv?=
 =?us-ascii?Q?YYflkEuT6yrPIn3/zld67l7Ix42GBBz3p8WIlr6DHW21u79ranLYcJKALFQW?=
 =?us-ascii?Q?s6xU7ZHV9qBk0kpaKmb4TdKSk2fSMQJu/gdayE97lxNA5LAoXTnKejLvwlB7?=
 =?us-ascii?Q?3lJ60hpHvVeY/01AnHCbPxGv0W2GysItLXzG7hveqbG7f6tHxJm61bZPq6xw?=
 =?us-ascii?Q?CO9S70ZAzSlsFAlDnEOFIE3wiaJMeHLjUEXRUiO1orVvQCyP48mJWixaET4i?=
 =?us-ascii?Q?q0QCrzQah/r2qSi/t6ygIxkCc9i11OonyN091x8LQZeO9EchSC4jo4cS0N8n?=
 =?us-ascii?Q?lNt8A5iuvxV8xjkA7OsTmHrzUH9c1XBLZ1NrdIpri9QB3oGnTjoDcFj5XTDY?=
 =?us-ascii?Q?DnpAkuV1B9RTIjqCTRfCxhteib2RKIkRNmATcC8ATPfCYgzJFXx/w5kKVaQf?=
 =?us-ascii?Q?JHmNDQ8Mj9d20aNlBHq13kKMB+wEQhbsgributu6SUAagY7IIaQ79q0fS+9y?=
 =?us-ascii?Q?JmIeOYjzIUmO2meIAeZQC914+RviQmn6bqqbD8DWnbhqH2G6WbnenaC1nmYW?=
 =?us-ascii?Q?j0msD6sI9SnYjBpltry30UkVA530D3yo75N7ZTwck+onDwEXtaZHYD2LDuva?=
 =?us-ascii?Q?wFviGX42sUGE8TRQRGZ8R4ZmPLjDa8WU+KWPSSn5hDhQNhDpOENp+cViNDVX?=
 =?us-ascii?Q?B/21C0+kElrfvCuNQTYIw1DEM+OoTgeXbd5c4GY6ohTfe9QPJoguoYC6et8e?=
 =?us-ascii?Q?HSugfHzdJiTKBDuuy0mvF8JPoqmHGCmObZKgFw5HKoV+usL79AUqH/nX2X5g?=
 =?us-ascii?Q?ZmSAoa4BDHzSITx85NS8f1n6znvJH/MEpn/gB3iV3i21JqsKkcRpbax72ov5?=
 =?us-ascii?Q?PcYeu3XmJiICjWsCApBQf1lRaPpTVWY1/TWZhA68Y355tj3WSt/tD5AQAakk?=
 =?us-ascii?Q?eHx5pikcdqli7DwQO8WyOou9b46gOzK1Xo2d1CObRcblWuQXjF2usnicNYpS?=
 =?us-ascii?Q?dthbOK+sJMORyWJOcHdC3v9L/dGze+mkxgibAAoAR22ophZ20pqaXL7tChpH?=
 =?us-ascii?Q?8g7ubEU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qmIFQS8QpO1oMAWwDQN2sitOP5FcJFPTud2yX43jfdri0Bqu2fgtA6X97zj6?=
 =?us-ascii?Q?G6D5++v4O+wJklpfBmjG0waZ8xwvx1SnFPvVJ0Kk18OluKwLfK59IkJgDl2a?=
 =?us-ascii?Q?VKK7ThKc+z1CLkV9NhHvA0NgYTRFtnpBrTaoYg/jkmFADcvZdkN/kU3eIY8t?=
 =?us-ascii?Q?WL27qQCttetvDEQpbAxOC912l3NWCTUSj6l/4PUYB3Wi6q8/ZTkSjS4Mh2/N?=
 =?us-ascii?Q?vEBcMVa6Ehhy2A06cC6RTuMpvw2YZBoEjoqxHNVtAifIc63uAwHF6iirHGoC?=
 =?us-ascii?Q?+dmP9lONGJzYZ8SGmGmdC/4NgZ+thzdPm/ywKQ4uX/sdioCW8kHl8JIsSD0j?=
 =?us-ascii?Q?2H/Rd/6FcbiAUsDYfZOSoNzQ6Is085qo+qgLdv5SjXSGz1KUlpRcXgoMZ+W+?=
 =?us-ascii?Q?ab8+lQSKG4R3yy/mtjelVmWmh3H0fPgBd5dTz7drKECpLlRcsTd9CoG6bz9w?=
 =?us-ascii?Q?aaWFImLna5BNX5F4rHel8cILbQMKduRzsC0szyRnmjHXscm7thehXoAmRXlj?=
 =?us-ascii?Q?zgAa0CEU3X3NJf6exWfBPZcYcQ8j+mSsSI9TNgynDKEYo1laqPFO+O3sYe4v?=
 =?us-ascii?Q?HteD3uiaL9rcyE/h3zhDtEAoSk9H6DOQXazm1iW4bf26GhrclnAeeKTgEUxs?=
 =?us-ascii?Q?f5ShQnlEekKXnJyYvw2bWp450Y/suHePIH0We6cw7LVCLy7hLGtqBBdHZsEZ?=
 =?us-ascii?Q?m571e7Ah3yV/OpWxaj37Ds+97WLYCbr1nOSiYliZJjj2ngGlcWB55egfKFel?=
 =?us-ascii?Q?hnH3SDsgt0jGBAZSTV/A2br4L2lhezQplgYt0gkWURhif5TqezZkiKeQgS7D?=
 =?us-ascii?Q?2frHnvkXk8JNM9tF/Tej3WgNw0mLy6gcEg8JoeKzbvR3lK7rMD4rLOWq4lCo?=
 =?us-ascii?Q?Uehu+Yo5tZdbTyPN3sTmIAxM5hkoDKJmX4bSK55/4N9kajwa/a3wJGmbtgtJ?=
 =?us-ascii?Q?XDyvoqSriAON+zcd204E3Y9UO6DrgleHqkjJrD4wSWE2VLxXjofuLE1jS3fN?=
 =?us-ascii?Q?7D8h54WdC0SNSxBqwgw9VzURgeT5k4sBbzNW3smyePTFXWeLvQTv32rjcpxC?=
 =?us-ascii?Q?tVBNLdw5v1QaSgcWU3sYO7dnYI/HGoTN0aXxeIQFlr5Gc4INJaJ0zBHq2L0f?=
 =?us-ascii?Q?wl0mhGuSxrVoRT7cAxr3FnaiIgm4QzGkyaE7wCZqGqHqu/0/l8LNDPcVV3J7?=
 =?us-ascii?Q?d+JW5BSmBCCE99rCamoFzLEEQRbpuLjMNtf9vgZlNZieow93UCmjKkcnhsI2?=
 =?us-ascii?Q?RMq14F0cAKoS8iMow7WxlffO6euqRhyDDKzWMB6rPWYiaMCZ6vVUdrNkp+K7?=
 =?us-ascii?Q?ZBRe8UkuFip35r6N/8O1WiPnn+cqGEnOHfl7y0lnsNxvuC4DziEFCKV3Tdqc?=
 =?us-ascii?Q?4mPNMLk+OwiMrd3lRkXKnoOxpbKwbTVjdG8rs12nNa8qxKMuThXeTTv0akgF?=
 =?us-ascii?Q?tictAADwmZ/67KyvVuxawLtvNIrPH2Q6/ER6M779nl7GydmwWtlWRq9ixIQi?=
 =?us-ascii?Q?vXYzOvth+aakDxQ=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ArhZA4AEcvRm5IqvyEo+yx2EaX6iRAGWdZGgwytjvakZ8RV1ZuGwrt5FVDE93jhGP0VdWRnFUlsrX1gq8WkcnweeR2Z0yby/s0dAZlAbmbTSoFOugJABPURC2cQZTUO/CuxvV3QN36fh6nJ0yIQ31tJGSe8FfDufY1qbtM8cLIla1yw9KKh7dEI4H8lmGOKALbG5dIZD7id4+HXO8Qmx+V+Gnezuhl6lIBWl6mc5T7OMoolOCF8IqzagiWcA2Fl+zqwl1nhL4PMe212VQA77wESjCXWnk0PcMixoTt1pdq3BzbvmwTQa8l3SiS37ll19VwqjeLJZZFIEAi8VundBQA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSWRHW7NHQ3UVU2mtFMgcYa+TF/T+dkK/aNgnv2JcA8=;
 b=DLy405+efQy/YKa6cYkkUFpi9LYj4zd2OXRV31aXE9vlqtwkUAEAwD/a/An6vcUnp95+DPQqbluY36St5ZoGMmhOCvKPn9UYKv/nEhLk9gYoEGIoPLP1Nx5n6JLkLsQac4xLgyBnGG3NqKnZCdWLcRDsyxPdjjzl4xEQiVaxRSbKLk7jK3WHqVV5SbUB6LVLjaT/lW3VpWCzHoZ4LQ8LHm1JDDsvfLOP+oHhSU1LbObXCUUt8V/VOC+i/pvUb5XABCDVnXIbJuIfebBShNpW66d/KJ1d/q90heX4WvEodCQoEBWbjCDV81XCJSG+wACTwnKSpRyltV9isTDFesmQUw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: e6678879-7866-449d-2c63-08dcef1e9aab
x-ms-exchange-crosstenant-originalarrivaltime: 18 Oct 2024 02:43:10.2112 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1025
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_28,2024-10-17_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_28,2024-10-17_01,2024-09-30_01
X-MHuser-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=875 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180014
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=810
 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410180014
X-Proofpoint-GUID: NjUR23jd6ftlJrRHmJTrQB94GKOxzsFR
X-Proofpoint-ORIG-GUID: NjUR23jd6ftlJrRHmJTrQB94GKOxzsFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_28,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 adultscore=0 mlxlogscore=883 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410180014
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=OiIxolX2NBaERDAqgHF/QpSS5HCNunUwhEMn+3jlGP4=;
 b=c8yRXZa3PlLW4UZWHUnpMSzRnxODtkZSXq7kTLTPo1ytHZFThr+U4TsPvyC8CQY3IVIP
 f8+qrIem7hgOMkn7kKk8++pHH3HzXbfxNpcAJrpjIdkRTE5x4hGNFCeFpAHTIX8R6Lbb
 +wbvF5aLnvFoOv0VBydw8wCAnyoAwE4ZqjS4Gp4qXCgzDc6UenAvEk3RXTG2482k9Gv8
 xsXL3oEgElpNd3y/bjc6TxponYI8uWlohd39oaCYPfOM6VNciBOJ4Q1Hu8q40WogY0lS
 1QddoVO85T4y/0iDRzQ6vEaBC/Knp7HdB9+8lT5erCy0+n/C8JNMzGCbpe6hVL7LWWns xQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSWRHW7NHQ3UVU2mtFMgcYa+TF/T+dkK/aNgnv2JcA8=;
 b=HP5hRsGAk26R5M9L/h/PwcBMqcc+LDk6aT1xT2hGRZY2ytIg64Ig/0WX6AYHGlhK0wvNhkOeKaxHqKXl/drCR9pY38HpfsyLJ2GY6yrQ5NCCwYMVBNWNB1/L3gsjSwbQUtAHMAtl+0tXIaQR13BFsYNvccRovy7M+t9OcFsOtNo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=c8yRXZa3; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=HP5hRsGA
Subject: [Buildroot] Python for host?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Kennedy, Andy Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Kennedy, Andy Collins" <Andy.A.Kennedy@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all!

I'm in need of Python 3 and supporting libraries for the host.  I do not
want to build Python3 and the libraries for my limited storage embedded
system, but I do have requirements on it for the host.  One of the
libraries I need is python-pylibfdt.  It seems that I can only select to
build the host version of this package if I have selected packages ->
Python3, then choose the external package at that time.  Given that I
have a build need for this tool (a support package from a vendor that
needs that library and I'm working on a super old Ubuntu distro and
am unable to update) I would really like to select and build the host
package.  I can go through and add in a Config.in.host for this
particular package and dup the .mk file as HOST (removing the
$(eval host-python-package) into the host-...mk file but I feel like
this is the wrong way.

Anyone else in the WORLD having to run BR on a 20yo system and need
Python host?  Anyone have a clue an easy solution?  Am I just being
dumb?  <<<<  I HOPE that is the easy answer.

Thanks,
Andy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
