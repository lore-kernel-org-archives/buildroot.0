Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 07:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379364098F;
	Mon,  2 May 2022 07:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LlhnGNJ_d3m; Mon,  2 May 2022 07:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECFAB4091E;
	Mon,  2 May 2022 07:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94B181BF388
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8155F60E67
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czNGTDUDs_Ov for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 07:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::614])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA30360D4C
 for <buildroot@buildroot.org>; Mon,  2 May 2022 07:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjBMiaFqKb2csMD6/kMMjS1rhMIsqqPRVoRnlRVjWFsFixgibA4AoOg7bjADFwYZrY0DncqgJLDUCwXuwd8s9vCanRPfB1HeLvUtr0nVggoJbBlhIziVYYUznR24n8aAyrXrb25HzbQ281Rz0i5e6DMti0T4uXlc+Lxx8gsnqipd9dztIdKfNY/3pdmrJDsSeVyY5G8NhTdnpmcil8Y8KbGmmmPbqvhg63IehgmeAVKNvHhL4npXAwyzdJuPt5FsTV9loOPz+KuKJEueyi1Vfgj0ngw1E8HH+ctAThMQPQBMDZqaIUBhh5x6y4ucXAMBFs/tETtMtU/1rMt4TSQMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OdVUBR6lWuEajd4BLZ4fiDabWK+eL9vxpUMnru3Y8o=;
 b=JPKXPNv+v5mOrpQpGF/CnkOWVcnDjAffkfjcDBQkZCzVWnBYVAmvUWz1opqvsNuR6LkxhyJN/wjpXGOgpMMo2Ji/o+mG3dTj3c59EahBbzT6suxHyTafNdXVgdp0mWm89qYPPkBYhek1uyvXtu1kpwyviteKbOPiVc1LoIggq5koVpjwXT0gJIT3/s8pOzXHKYri3IA77Zf1B7AKL8PxzLhVBFNHsHagxq+v7S7Pjq86Mn1JBlcRNYd/wx9kfLOBQIeXMF2xq8URoVp5EYxg1nfETN6YndAtVS16nKdJXO9STyZdVF+S0V5QnbTqm3U6dSNamXF40EFtAkFYb7TxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OdVUBR6lWuEajd4BLZ4fiDabWK+eL9vxpUMnru3Y8o=;
 b=b1VR0gtB9FOLYRT1FvVlA2bgqTZUjO+tW0DnqKPnW2Yf+Zk8XkS9CjsvzHeLRqEMVfFZo7aqS+lvMnVEv0xZ6w6In4PA56h+IvyddtVo44j0Xvvn9yHkdhcblIrx+cEmRgYG3QQ/HrlFtDGuPw4aibpTkHotS4KYp+WR/+vqt2E=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4138.namprd02.prod.outlook.com (2603:10b6:5:a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Mon, 2 May
 2022 07:43:57 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 07:43:57 +0000
From: Neal Frager <nealf@xilinx.com>
To: Neal Frager <nealf@xilinx.com>, Arnout Vandecappelle <arnout@mind.be>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to
 Xilinx 2021.2
Thread-Index: AQHYS1jCIBhUrJ2T10y2XXcoR/MRfqzv3CmAgAC2VaCAAyUNh4AXoeCA
Date: Mon, 2 May 2022 07:43:57 +0000
Message-ID: <SJ0PR02MB7758B4305ECDB6A7F87B4692D7C19@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <23538a24-16fe-5302-0cba-c97e67a8ab97@mind.be>
 <SJ0PR02MB7758E25006ADC3AAA0346C73D7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <299536D8-AC74-4B1B-AF56-FD5BA3619055@xilinx.com>
In-Reply-To: <299536D8-AC74-4B1B-AF56-FD5BA3619055@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56af11bc-410b-454e-0da0-08da2c0f83f9
x-ms-traffictypediagnostic: DM6PR02MB4138:EE_
x-microsoft-antispam-prvs: <DM6PR02MB4138F5B7BC38DEA135C07B30D7C19@DM6PR02MB4138.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nJn7cjeTW7e4zt1qbHjfsr/jRSSfbtlgJKFIAgqFgsJBnUavI0QDCDJZiIOoJi1TjdKhmZs/ulY49mW9gL+6p2DV+RoKvnNbEuAt0dm97hZJlksARN0CN/QaPZ76nPrqeUdGcEyrwDvuXaTRcXqLNbQDPurer23kfqWrqFILHImi5ME5sGLu2FRZ+zPiGmA3QQxfmOAMaRCvCy8iiVwuG78HQXEV/MDL/sgKPX9ncG20TxfjLj/jjr0tXPaJ3YKR2oMy7q43zvR9e0cnFLfjJHbUDNR75TMZSJYbUKup9O4Dw2yY2QAvbw6CiisWo3c6Xl4+miY0K7uOp0iqWTR9Lc0h9rugoNYYiOP0waBI1X4I8BnkbWjOvJ+/JsVKaemRrEs1zAwmfZtFzIxAapdq6BmsLzgd27Ru6yDVMPb2jkLo7lOKOTbNdoYBwVJdvypkOAfG1SN2pp/BUtTWnmeREE8fp79SAB6B3ghz9KdIhkHVkUWA/hF5BZii0rukbPKsqKyj4vTZOq11VgGPQ2smrkYAk4+y8dHt07skXEpGiAojNR0onL8rl6eLAAriMVASWO7Ux6aw/O5WDDKYBsMI3DraaCGKBama0HFBNbzjPy+9iTwGc4FtJPLgSGzEocsa+cXcVtdl8XcpGUmq6nmJCuqwGwjG9Z/AuArWnfj7dKXC+it5yhMn7f/hn3ssfrfGYmxAJMHRTVO7/sJHt09RcbmKqpyP2r8nSNWwmoLTxK6KJmcQ2yj18BtQ2XXhAvbz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(54906003)(508600001)(6506007)(7696005)(55016003)(9686003)(83380400001)(186003)(86362001)(66476007)(64756008)(66556008)(66946007)(66446008)(71200400001)(52536014)(4326008)(8676002)(2906002)(8936002)(5660300002)(33656002)(4744005)(38100700002)(38070700005)(122000001)(76116006)(316002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGx2dk4vbDF0eFlkZFFDei9oOS85VllJYmVSZzRSVVpvaFYvY1ZpcXVBYWRv?=
 =?utf-8?B?NEZ1WXlqbGE5aHQyemtOR1BnQUJ5VS8raEJVVEZzUmJqbitWZTlrTXF5Unc4?=
 =?utf-8?B?Q0pMK08xd0kxa1QxeEhjbmhXVHhjOXZoWGJ2bFV5WFBnY2J2cUhtS0hmb3lk?=
 =?utf-8?B?U1Z0YVZjLy9LNjRTcnR6aHI4cTk3Qk1NcXlwdC9aRGtvQzFpRitGUjNiazR4?=
 =?utf-8?B?Ykk5bkp1RGdCaDllb2wzWmNTM3lVSTVJT0ZTcTNYM3lmejBmOWEvTXgyay9i?=
 =?utf-8?B?RlFIT3dZU1lsL3BWa2xoMVJrWXhWdzhrUERpZHZtajhHbFYzZGNYSEVLR3Qr?=
 =?utf-8?B?eXU0enJpSExKR1dLT0dTdFNsTzJyVWlxd1JBMXcyQ3MwNXJBb2ZqZkZXQ2Uz?=
 =?utf-8?B?UTBNVHVPRDlIeTNXWXJQdVpXWkdQbUlPMzVSNVJOVUhyOVAvQXJoRmE3alM2?=
 =?utf-8?B?Umk3TGx5azhOK1dTUXZXcVFoREd1Y01ZM0VRM3BrUG4zK2NqekUxSzVad1pK?=
 =?utf-8?B?UXE0aUhjNElLb0VDZzlsOE1iOW9XTERqZGlScWsxTUxIaTBKeGlCK0RmTEZY?=
 =?utf-8?B?ZG5IRC9XTzI0ZVhETmM0L0syV0xaaWlwZUdYSWEydEZVU2FCeTQ0Wng4UHVS?=
 =?utf-8?B?WnczaWtIUHE5dndlVTk1QWx4dmhvTEFqQ1VRWFVxOFMxNEpQV1NSUjAzOE53?=
 =?utf-8?B?c2tINmxVdW1BWHVGaS9KTzhMeGgrUXdFZC8zemphaGlLV2dDQkVjaUdzaG5G?=
 =?utf-8?B?RHBkMTVCNTF6RHZrbnhITUFjUWtVVy9TTTg3VVU1Y2tPdkhINC9RaFJnc1Jt?=
 =?utf-8?B?VjBhUkZuTjhobXhuNlJyQVBsTXdINmtYV2ttVHhkT0k5eEFUWkNjdzRIWFZi?=
 =?utf-8?B?eTlTYmJzMTFzK3V5RWVzMEI2QUFsUkgrV1lXSXFmUWxjbDBDRWpiVE1ZMHJR?=
 =?utf-8?B?RUVGYUZXZko5ajRhL2FTaElUTkhqVkxQWnpiclF6QkVveWN1VGpFWlhLKzU1?=
 =?utf-8?B?NXZKbEtrS1p3U0RKdWlxUXpvQXpyMllZd2wwY241V3VUeVA2MWlBbFppWmc1?=
 =?utf-8?B?czY2a0xOZ3RrZ3NBRjY2RVlYV05XWHhPS3JFNjFOUVAyQzI4eHZQZlZsWVRP?=
 =?utf-8?B?SE93eXViSTg1MnYxSDJFQy81SS81dmYzY29oT2VJMVJvOUhJYUFrcjBZeG9G?=
 =?utf-8?B?REFIVkdTYkVsRGhKWWozdmVsL0psTHBCd3B3MVBFcTBXMlNhVGdiQzdqakFz?=
 =?utf-8?B?UkhlYk5HR2tTTHBQL3dxVlg2V3d6ejB6b2F5ZXhCYitBN01iNm1NUkJ6QTZk?=
 =?utf-8?B?YUhLSmNQNGtLYUoxT0MvNUd4aGZLUWtEeGlMbUhFRjNvY3c4SjlFbWRBR1JF?=
 =?utf-8?B?UHpiUTdqSVVNeVgwOFV6NWdRRTBxUFRpRTg2YUsrTkg5cmtYQ0NoR0VBSW1o?=
 =?utf-8?B?OEFhYmo3Wk5qbEd4Z2R3bzRKaUp2TmwxL0h5Y0w4eForVk9zbmVzOTBrL2Jx?=
 =?utf-8?B?d1pkTW9qbzJWeDRFVjNoOWlYUld3WC9ocFg5RUxMeDA0VUdXS1M0VWN2TzVC?=
 =?utf-8?B?ZmhVdUtMRkFiNlQ0RzNuUjVBdUNhL21KVlhrNDdKazVMeWdHM3hiZ2x4YXBl?=
 =?utf-8?B?RWtvNXlibHVuT3hqV3UxdklQdG5kalE4bURPNFZ2cU1YZy95SzVuL1czcjA2?=
 =?utf-8?B?bHE5dWV3SjY5cDJDR3RldUM5RnY2UjJzS2R5NXluQmcwem40L1h3MDh1bk90?=
 =?utf-8?B?czRXQTNLZGIyK0MyTjBQeU5GK3VWZWIwTCtZb0ZqdG44NDREOHBlS0V4V3Ew?=
 =?utf-8?B?a2JyVlRDdDJsWXdDVkJrZUk0dml3RkorWDZxQmdodmtQYk9TY0lVa1o1OCtC?=
 =?utf-8?B?RHZQVThUbCt3ZFRNdUszUHlWaHlEZkxrcS9mUVNGSmd4bU1WaUpzUTMxRnJY?=
 =?utf-8?B?K1hKQVV3R2NWckNvT0UzSzRJRmJ2NzNuYk92VTBoR1lwd2ZqUzZmNUV4OTRj?=
 =?utf-8?B?Y3dsUFNqVFB0WGxvL1NoQlhKemRXaC9icEpTcmhDMlJ3dnlEUmZMUWxFWnd4?=
 =?utf-8?B?dU1HTEhHczl1NmtXbHNjVnorSXRlcDFlbDJjR2hab09RNGxCcGkreFYxdEFL?=
 =?utf-8?B?YWRSTlQrQ1RScHV0OUFwWCtRQkxEM291dXB4UzNyd2VSMFV2VUYvb1hXQURX?=
 =?utf-8?B?L1I2eEhKSTJWRmVSd2VSNjhTdTNBNFJEVnFPeS9YUmduRHJBYWNOZnZoSmpT?=
 =?utf-8?B?NW9peG0wREdhcU9jWTBEMWdpVzBpSGVDTDgyNEUrZTYxZStLRjZGWmx0UTZG?=
 =?utf-8?B?MzAxVXNhaERpQlVEbGY2VEozZEJrK1oxU1JFaXBwQldSYmd1YWtMOTJ6L05U?=
 =?utf-8?Q?IfHR+uYVPgc3Ign2/LlCIzDc2AcKypss2hJ71?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56af11bc-410b-454e-0da0-08da2c0f83f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 07:43:57.6146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SasQORdcVFDd07qjpqNgPpGVfR3cftLjNJJVBIM3caeVm4R+7GBK+obEpzByESMl5P0+zruvYV4fS+cypacVXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4138
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

As Xilinx has just released our software version 2022.1, I am going to submit a new patch set bumping the zynq defconfigs to 2022.1 instead of 2021.2.

Based on the feedback, I will keep the defconfigs using tarballs instead of git cloning.  I plan to migrate the zynqmp defconfigs to tarballs as well.

Do not hesitate if you have any additional feedback or questions.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
