Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1421CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1546082A;
	Mon,  2 Sep 2024 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9X0UvrzamTw; Mon,  2 Sep 2024 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23AFD607FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23AFD607FD;
	Mon,  2 Sep 2024 12:38:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128971BF40F
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B8A7403F9
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJdmLiVdeAQs for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 12:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AF2240650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF2240650
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AF2240650
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 12:38:55 +0000 (UTC)
X-CSE-ConnectionGUID: c3aBTtK8TUmBT6z22zFUrA==
X-CSE-MsgGUID: Jf5m8CQQRF+dC7zDfDYrYg==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="25109627"
Received: from mail-northcentralusazlp17010003.outbound.protection.outlook.com
 (HELO CH1PR05CU001.outbound.protection.outlook.com) ([40.93.20.3])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 20:38:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWNBY3x2AVY9DU505gCijJ3q9sGMLJ7jQvwUi8NDS4m4clg6iXy5mNOEkG9y7QZ0/wQRVgTRptzt8kLw8d3vlXjZ4P46+ce6Cx1VWQBojo2X+F2tS512x2sBmBPtzheZIZ8srjxiSBDKYXTZooGZbk/5y/3k+LG1pTwye+u0mXKGEuo4Zdy/6ZyT+vVP4nk8z19awpG+nO1fehAyBbDJU7w3wrUaJZt+PnfxA5vA38/PZnrB1OJJPyGXeyfzSf8Urrsc3LlY4Y2erc5zB9DiNIQ9rfjNN81LXtTN3he0Idf3XS0PFjl0VnltcpMP2acHAAIAaPqQpFeTHJ/ZSS8MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbVqY7/xjw61qvHVlHYMiKEc8Q36T2LNlPludKD4cAk=;
 b=XFwUh8zUgn6SWN5F/zgc8Fv4q0HGkcyOhkiazyrzrV271gneVdJUKUKowCbUs/J1idOiBNiu9oPHGWpALZjZl6ZnI0+QAwHmCKQX5F+qv9XRonWGFr7dLx9st+iGR0IpWsD+6IUCsbDmM+YEaGcS5DJRaSlRqJMvhIDvJMWB0PuwKd/hFPEkvJOlmOZbMoqojpePGTlukRbAaQZ/NlN0mq7EMdWwtfDhlTQAh0uiQnHpnGGbY1Iy1zlj3+1yC88hAbeDDdgBXrt9tmBAsZpD/jKIXCuh3/fGjpg+sRcj+G2lAJR08+Y3SN+4VnBBB7O8dQeYQGukzqpStVi4X5CI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by CH3PR04MB8901.namprd04.prod.outlook.com (2603:10b6:610:17a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Mon, 2 Sep
 2024 12:38:51 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 12:38:51 +0000
To: Michael Walle <michael@walle.cc>
Thread-Topic: [PATCH v2] linux: add support for device tree overlays
Thread-Index: AQHa/SswIJo1QUCMv0WUaZIAhp9+i7JEb8kA
Date: Mon, 2 Sep 2024 12:38:51 +0000
Message-ID: <ZtWx2nqI0YTpwb-P@ryzen.lan>
References: <20240902112735.728574-1-michael@walle.cc>
In-Reply-To: <20240902112735.728574-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|CH3PR04MB8901:EE_
x-ms-office365-filtering-correlation-id: ed8f9d1c-90ec-450b-7702-08dccb4c3335
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?dzGvi6PFF/FNhvlD6X23AgmJQewTh3oCoBVkfF1vJNaVnqLmc905GQlreI?=
 =?iso-8859-1?Q?OH+jIKymFnvDpHN9CQcmDKiWk3To+OFjW68RtSn3ukvgVRwImiDaQlArMD?=
 =?iso-8859-1?Q?C6GX8yrqkRFIiDZUevqgLXZnuTlvs3fDowx3R0tikXtVvxSCjzvN7wIbd+?=
 =?iso-8859-1?Q?o6aT3I127bEcvFx6Mqb0Nvm7k1hmX3uElpoC2x0A2W19EzJheUkx9ruFA9?=
 =?iso-8859-1?Q?EBlXg1+r3uAz85odSjdLVNFfshOPQzmGYW1l6HQ2fyCfMdMcux9GDuwax0?=
 =?iso-8859-1?Q?We6Xe/4nO2Mbxc/0CQbLiPSg6yOFVYyGzRA+6r94JgeD8ddEG6yM0AzkwE?=
 =?iso-8859-1?Q?REMah5eLCuPmU4yFfADeuQqOPl7UkTVNsTuSNqhjiBbO6GsAuhpJhsxHSw?=
 =?iso-8859-1?Q?+IJbNHR7iE9B+EsGZx7PdMF05pRVdb0lOwc3oMG29JFJcgmhySNYZfmly+?=
 =?iso-8859-1?Q?FJCKJOmmk0Vlkr8USm5nKBfaOnL6HsPpmIypzcJiEEn+FImKN53oRY4WB9?=
 =?iso-8859-1?Q?vRSVPsje8IsYopD6e1OMFXRE6PQYVIhlqx/lxUSgqkQh9CaXKCdHZTapV6?=
 =?iso-8859-1?Q?ZjTiEzdrwlEygQuEtNAiTc2TcwKIl7FKBlP/cacc+3K7FcMdDP4oUhi3gI?=
 =?iso-8859-1?Q?+A+WxdOq3U75kzpzn9e01TNQbkrO5wPoGXOV0S/vH0FnV2XsNWzFuls8wh?=
 =?iso-8859-1?Q?p63ELgqGp8uIiHXulmJXoc34xyuIJozbOisXcgD/xEw4OvcANoAhXf2L/5?=
 =?iso-8859-1?Q?b8GTrweLRa9Kgs8i9v4EHNSqpgrw+Sbd49umTiqxn5skSdYwtEE62TEg8X?=
 =?iso-8859-1?Q?gphT+u1zoy3EPfxIIgOCpq8FJaX4MUnCBhBu2kRXrh3D3HaiWijZCjHXkN?=
 =?iso-8859-1?Q?qfsuCxEAz/aMCnX42a8AgGt0baGBBobRwA1SIv8mtYf66W9lCPv3LERWtf?=
 =?iso-8859-1?Q?FolQZEvi6eEUDodT2c4d2wVhIB6JLnjKzmwj7AZNO6F3SaUjM+4AMwQZSz?=
 =?iso-8859-1?Q?5lV6HyijQE1HR4p+76rlrfO5s4pau5MJnVXDzCuR6QR/UEeI9ZSIGPntMa?=
 =?iso-8859-1?Q?ldUziEPRgZbLvRIp75vSy4kYWRseZJ9hhUmo9W7RBti6gGiPnIA1rJt/kS?=
 =?iso-8859-1?Q?7JROLQN++IjkmOvGSYWn0rIcwxu0Z26FU8s/9xkcok7gb2Fo1XiOukWBid?=
 =?iso-8859-1?Q?pmK0JNT0KeqG4mMebZbdowA9dwzOR1OTZNGa979FOw53EwtgG05knurY5e?=
 =?iso-8859-1?Q?K85/gmodv3sEquZ8R5ksZqNREiacTihHhBkFCNUT2xKwO2Tl23BA7421QF?=
 =?iso-8859-1?Q?9QT9Ir0ZzX4sJgjNf58BrTG8FM/DDkidDvqs6tbiF7UPPagMwQ+KJbd8pP?=
 =?iso-8859-1?Q?jEc5EYPizs1NDwJJypUS3cO/OktD8zYzxLQTGOmLr/vbhUWQ2f/xnXWCZd?=
 =?iso-8859-1?Q?tPHQjW4a9C4gwyjuk+yRulBWVCiXbYpr7F+IdQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ypP37rGTS3rC02p4BsSnIxkoHLWFJZHLXQrV600xXBm5G4YnVhBaoATB+L?=
 =?iso-8859-1?Q?9R4fx/2SRNSt0WhR3ij/eeFvmXCMQDtsE0GUeTyikHPNxnvULJvPBWnG54?=
 =?iso-8859-1?Q?GSIE4oWveafTiqcq2E7wMNj6H8kNM5pu2sm/pB532McNCLaban4oepdX81?=
 =?iso-8859-1?Q?A09zu3V57jy6P0N7rAuoCjPC51lxmyci4sFwVeqGFBsdRzhr02I4Txtonx?=
 =?iso-8859-1?Q?wsj4iU2ctZHjH0pNsbUJZ0iNNkuOYaSDQKvysowGnWDfL6alXt4VSsmE/9?=
 =?iso-8859-1?Q?dZ6MaF45JMF2FDTLO/xDZWhb68exne1MLGyaj3zldAdpxCdzWOum4XwYG2?=
 =?iso-8859-1?Q?3jDw8oVrUs+GQnoV6r1+o9+JplwTqRQfKAY87MzEtUcSJ+ATj65g+0Ffkw?=
 =?iso-8859-1?Q?yjiDfWfoNzw/RwG1wmE/ZqF1PpjLkAVYZxKKam6gL16WeLx1MfSnFpoUxX?=
 =?iso-8859-1?Q?teAQbeQFMLQ1o1fFlbYYRZCuGOWJLRfg68aks2He8bOmdmiK/YutsSIV0d?=
 =?iso-8859-1?Q?jSgDFsHFD8X7IRYY9MgmJ1FTvJRxkiymrGZ/xulcEbrtkUa68gGzLQeEIa?=
 =?iso-8859-1?Q?1sllGOK10Q9Zy3gIXWy7SSKddSUajkypI/waZLyQqFZN+ozlSpt+E1pLMF?=
 =?iso-8859-1?Q?mPZdU0J/Bd9gM1TkbVXrkEnCR7+xNq/+f0gA5M6gYw1uHsWHV5P+VKljBr?=
 =?iso-8859-1?Q?tIxfESaBAXvS6FGc6vWw2Ya1mA/48lcbd3iwfDTzmlL76U/AM3mXA/Eeue?=
 =?iso-8859-1?Q?Ep0Xt/JKQ60P1kBDlYfW3kCAaQFpcNXXIXSSlQ2fiRVVd1i9+//NY8kQts?=
 =?iso-8859-1?Q?p/QK5T+0dv6uRIYGTx/8M1vm97picH1dGutOZH6o6nXdUB2M9D14jen7PB?=
 =?iso-8859-1?Q?AZ6O66ePTgI0J1eE5T+7aDvqcTAiKCiYOMG/lhmv+up/1Sy04M50fn7/pv?=
 =?iso-8859-1?Q?k02BA/eonYp9YlkE6pf+3mwE99NLKjcx2ZzjOfsfa8ZzEHQ38MACfEl7I9?=
 =?iso-8859-1?Q?nLktpZLI7E+eb/35qsIWTnG39l8zkiG60NIE1/AGXZtMjNoYiHeOnYpyQ0?=
 =?iso-8859-1?Q?NcRxlcO/TUW6AxgZiqsThQZTJBJDwdijUllTjMWeF1jxzwNSnYQp2ArN4G?=
 =?iso-8859-1?Q?lRJHG06VB4XsNDeeLmxnQRp4wI2ZZKJPze6C7PCFB7RU0KMnj9tR4w41/D?=
 =?iso-8859-1?Q?AHT1Nvz9NSzhoPWaNIo6H8OpMm4G2QF7J8r+LyITTwBohujTk2P02mJ4qh?=
 =?iso-8859-1?Q?LxQ+PBmeqqy7mGHwHh3n1+oSJcV9EFj07T/pDffx45HWrpz4sxTYWAELu7?=
 =?iso-8859-1?Q?B9YEYPVl8LmP6XWqfuZk67KjcQ2N5tgDYo839+62QMjeLdOZZd2vWQCIKU?=
 =?iso-8859-1?Q?D6XQIEzfLQJFZEBRWT25PQ26C34GsZ6I7hbwiKlCboobjPHhK8UbgnpoQA?=
 =?iso-8859-1?Q?g1Aljet+gGDZJrPSA5cc6A4vvVD0xmdHU3EEE8hN0cMmVSkhAZa+jLzKMX?=
 =?iso-8859-1?Q?TXJPbuB7bjA1fZbNlzMcGyEaeaxIvFXEgphvXD8uwSCoIy2CmguP9WA0kr?=
 =?iso-8859-1?Q?3ChvzTXtwXL4jbbDm9WxplRAqcvFrQv1w/QR0wTzkCTDC2KeEAeBY2uAgZ?=
 =?iso-8859-1?Q?IzUh8QdMJZ0KdiaR6zE22NGzDg6HQcptWGjHy4pKgTCQeIRZzrVRbreg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <654241A6D7C825418DB0CB9C6D48146C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MzFTJlWBKUUSLsExbW8/es2KuYpFko0y5qqGHEXsmrzPn99zDj5yBaAxlpr6Ykei/b8/jqZzWZ6/VB9Yf5IM8P0unN5UcRcFVKMDloQxeXS2SHlhgeDj2eptYexZtOdySJnNEILHhY99XGjC+Tq0oomImiyp1xjMk6mX//EYi0NWZW/do31Fqr1OHvWVWLMe17lP6GXfMlu0APn9pzVpOI9TExP7Vv/FmMmceWFNesUw8EBJsF5bGycMYanzErVtC1jB9i5+zXRkadQZcHhbgEbEzf/tYc/cbHvDB+Hbfus6mhZPvM5B3Gwj5Jf/5YziLBjRoKQLhf2959U+Cvg5XPJOT68j5P8pZfTGTSTs3S0sp996791hWxw0UQV7HzLxCbpArkt+4iiCzX7gXuX1Hft3VI0U2+YbeJ8Nd61RLQ2FSAaNSD46kCNyKEEf4619MxQ6tFEVjH14aoUSX3kWjnsuXi1Ub1lD084yD4tDyakZudtGLBSiDc3lOl87sp9PvYZilTng+n6FYdb5YnCoyIofuxzNWKmUwPEJN57t0BWvrt2ye+6oNJFW71nqaqDlQOB6ajIsd/kQ6PjhcugjG2qTa20GcR/62f2jANb2HAMgpJilbrvPhkptOqbS3q82
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8f9d1c-90ec-450b-7702-08dccb4c3335
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 12:38:51.6390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZYreltLjtKxtB2rxlJCk5zp+atFv9M+mKF124IEKI9ipfFjHqbrrum2N82JFt21IsKhE2gQCXPvoRHwD7BhDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8901
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725280735; x=1756816735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Gnr4bDwD0dh5H61zNqHlcbm2PSoU0SWi1qvCKvC46co=;
 b=lzxs/pPun0j5iY6m3UzIU7dQM5kQD6LVYq5ELpLIbXpTeg+A4AK5oGsH
 zl1DWZXTwSugMXsLIwQSBVU1qwvuAYEziMHz6LWoeEVxDUsa+oBdPqJeA
 IOOktNvXkRLWW88RSQ91m8cybdFwkyfPDcngheWCoqOYWMK2CFNvoe4TM
 vZAikqHTjv9N4nXbZ5X+5N7LACI1GnZY3ugDSK7ZgC2YfQh55ro7SuDmu
 ppcb15vZ6UhTJuila++AQnMIz2rY4UNrPszwO8CllFVMGruMlABLk9fhC
 BSOT1S9iXQ8l9KGdDLEOJYoZjUHMs1bM2NbvI7Oo72NZpTpnYZnDl0QsD
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbVqY7/xjw61qvHVlHYMiKEc8Q36T2LNlPludKD4cAk=;
 b=bKXoLu3yWeddmGoM8KN/236a8WisEODlwq3INYfjzp1aRFkRTumfEzOQaA7Qm/JpHcviBdty5pAv4n+4DNflqCOTcJxDrgNZ8H3oij6ZO5Gb5NwUfa7/nW9sPXG9oL46eGEcebzVNx27x/DT3kAvwt28CTZBAjc7MQ5DM483PAY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=lzxs/pPu; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=bKXoLu3y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: =?iso-8859-1?Q?Ga=EBl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 02, 2024 at 01:27:35PM +0200, Michael Walle wrote:
> The linux kernel can build device tree overlays (.dtbo) itself. Add
> support to build and copy them along with the actual device trees.
> These can either be in-tree device tree overlays
> (BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
> the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
> overlay source files will be copied into the kernel tree first.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Regarding using the .dtso suffix (or the lack of here) in the
> config symbol: I guess BR2_LINUX_KERNEL_INTREE_DTS_NAME used to
> just a name in the good old days (and for arm32). But nowadays that
> "name" also need a path prefix which makes it kind of a mix between
> name and filename, i.e. freescale/imx8mm-evk. IMHO that looks a bit
> odd, but I don't care too much and for the sake of consistency the
> new config option also just use the "name" variant.

Well, like you say, the need to specify a "machine arch" prefix is how
it currently works for BR2_LINUX_KERNEL_INTREE_DTS_NAME, see e.g.:
configs/pine64_star64_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-pine64-star64"
configs/qemu_arm_vexpress_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
configs/raspberrypi0_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
configs/roc_pc_rk3399_defconfig:BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"

So this is nothing new, so I don't think it is anything to worry about.


> 
> v2:
>  - don't use the ".dtso" suffix, just use the name
>  - renamed BR2_LINUX_KERNEL_INTREE_DTBOS to
>    BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
>  - remove leftover $(error debug)
>  - rebased to latest next
> 
>  linux/Config.in | 14 +++++++++++---
>  linux/linux.mk  |  7 +++++--
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 429a7eabef..e2432dadd0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -417,12 +417,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>  	  the trailing .dts. You can provide a list of
>  	  dts files to build, separated by spaces.
>  
> +config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES

Hm... the config for DTS is called:
BR2_LINUX_KERNEL_INTREE_DTS_NAME
and supports multiple names separated by spaces.

This new option also supports multiple names supported by spaces,
but is called:
BR2_LINUX_KERNEL_INTREE_DTSO_NAMES

For consistency, should this new option perhaps be called
BR2_LINUX_KERNEL_INTREE_DTSO_NAME ?

Either way:
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>


> +	string "In-tree Device Tree Overlay file names"
> +	help
> +	  Names of in-tree device tree overlay, without the trailing
> +	  .dtso which should be built and installed into the target
> +	  system, separated by spaces.
> +
>  config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>  	string "Out-of-tree Device Tree Source file paths"
>  	help
> -	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
> -	  Source Include (.dtsi) files, separated by spaces. These files
> -	  will be copied to the kernel sources and the .dts files will
> +	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
> +	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
> +	  files, separated by spaces. These files will be copied to the
> +	  kernel sources and the .dts files will
>  	  be compiled from there.
>  
>  config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 16d9f19470..a850353718 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -193,14 +193,17 @@ endif
>  LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
>  
>  LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
> +LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
>  
>  # We keep only the .dts files, so that the user can specify both .dts
>  # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
>  # copied to arch/<arch>/boot/dts, but only the .dts files will
>  # actually be generated as .dtb.
> -LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> +LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
> +LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
> +LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
>  
> -LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
> +LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
>  
>  ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
>  LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
> -- 
> 2.39.2
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
