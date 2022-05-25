Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817B2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 14:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F3A840FEC;
	Wed, 25 May 2022 14:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGeVHzjPOdkL; Wed, 25 May 2022 14:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D80040A88;
	Wed, 25 May 2022 14:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 624041BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 14:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5289681B9D
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 14:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rsl4TkSu_Fyx for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 14:02:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8583381B70
 for <buildroot@buildroot.org>; Wed, 25 May 2022 14:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wiyrc4KRxb9A/bgRKASvSBlENyiYTF+kGvPxzclsKKwO0WAc5babxnQWsfvyYc8tCOpGc92xr1E2nQd9n5h11pZfSdaiCHnKByX2Iasziy6R3LuECk6y6uuhgF2mSeOL7NjwNR6gs0HNLXTIUUE3eNGs7NyWXbIo07kTcI6UOSaZyhRFB0RneW3kNdVqasgcse38+IshGx8bWOr8TWX35V0G7OVjB+qDuRHjEHzVo3Oz/p3grI1IqjIGstFdAtJ4TuK6PQltscFJRt7ySWwcheS2tD+nQJZ1WV+KTDdvbrKuKdm1MMfK/cJncAuFbm/1Jh7rFM/VMbi3/U9IbPDuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGY+Dab4KvFkdtuYVroDvBr2ON5JtxRUIPGtBpp+hn4=;
 b=FOHQU6zwFKKeDQt8IDXolcypp8ouKV8xziYYCyMZXoM3XT78aNr+O0EhEOja895vhURcSu/w/myRDWmmwVqVb9PvcBAtWNCUGzIfirw+IRSFpCdEjdkLJHYfKno4eHMMpERyAGYqe6vRIynPpsdWwDLzFra0N1Jakh7AwR/f8ZMVUHg8D/kFhNLq08AvwaweReyjNsuPzd2/A2u4YkQgHdUf3uhZFdZcxLln112lu3rSGHAeugvARLkZkwuIGQ+AkmwFPt0MrVp6h0kanwvA138BsNftSpOWjCLK5TSVlmErdIJ44ZagZ1UOhIBqM7g5e2Jaex+EsKBycb9DX1Npww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGY+Dab4KvFkdtuYVroDvBr2ON5JtxRUIPGtBpp+hn4=;
 b=RzWidzIRDUvU8BNLSCu3oIspjzBvwOSIq0jUX9E8LJE+VgauwNXTrpDCfzX1GnwwRuZF7L4fL9E9y4BBB+RQvFzs+Wq9eVBOYKERkmaCSS/sASEk10FlYpUaJETJ7+ZifeyuRsJg0eRFJ/6zE10ESTMwchMbEV3HjkYquaWb++E=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CO1PR02MB8538.namprd02.prod.outlook.com (2603:10b6:303:159::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 14:02:24 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 14:02:24 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Neal Frager <neal.frager@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
Thread-Index: AQHYbd4O2Ejc8kIdTU6twGCobUN0xK0vTyKAgAA2mQCAABXqcIAAB+QAgAAAOkA=
Date: Wed, 25 May 2022 14:02:24 +0000
Message-ID: <SJ0PR02MB7758F7203D87AEBDFA9DE50CD7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
 <20220525085717.GC301044@scaer>
 <1325638a-c5a9-3795-d282-c0a6accee081@lucaceresoli.net>
 <SJ0PR02MB7758166614E50F1528FADE3BD7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <b0d64e2e-f316-d98b-8374-b98e0eb8ff66@lucaceresoli.net>
In-Reply-To: <b0d64e2e-f316-d98b-8374-b98e0eb8ff66@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73303aa6-4752-47f3-8bfc-08da3e5731c8
x-ms-traffictypediagnostic: CO1PR02MB8538:EE_
x-microsoft-antispam-prvs: <CO1PR02MB85388578085AA84490C0134DD7D69@CO1PR02MB8538.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VkMSwiDvylx3zVsMASrYlp21brraIWRmX5MGD9eqVevAvBStvUmzmf9AuASZdh+x1NdTgICA4SPUvKwcQGOKcmHdxpeDkSDr2Sak6Ptg1/1B6QmOgonefg0YxJJCPP1sIjOM1EvoSRzoBqvq4cmzpG7wULCTHNpsA4GP2XOBfO2nz0SScleiOwHVYclSR5PXm8cFu6s1UVIOHN89USrVe2gWlJ43JCPyOSOecgL9oiOd2gssbDq2olDtw3EVh81XJNbpUYBLAo95D//ACNX+PWyb/WHOtCcxE0FtEC5vE/tQ8WEVKFRC9/weDmeJLuDVLhpLTHIwtWVoeWfEq2APKbWv1tgd26kgoKkgn102UKG9JEnfFM9iI+BRo9SI5M9rZNKW6t/qE7+6Q/mlxmWk1nlQyHfTS8fGLXVf6SkVCV5kxcLDe5t8D3nczbx31xft57mqNhWncxqYs4BtUD+EQDTWT1YoceSvxWZ/Knh5t+Nnx5yyMZXBTg/Cua4gAw37HvZhN7WNQzp9XRALrTTU6mJhySEc9HDhRLIdfi84DmmIhsv590ePoyLitGZ22yk2U+KVsweB+sziqXDpmoLn+/7lwwYXuFnhcH3g7camYrXEZW9s+LlptV8cLevP7a5ppCiV1uAa3eNELfO0LI5MqfoWoW+ZLpL25tCXf34nnfkB7/vofSTc6NqACMQ2qVgbPxrX1W76cHzTlMbv67sm10BBxGjlbXD88oAsBANPhHA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(71200400001)(7696005)(4744005)(8676002)(66476007)(55016003)(508600001)(5660300002)(186003)(33656002)(52536014)(6506007)(8936002)(2906002)(38070700005)(316002)(38100700002)(110136005)(54906003)(122000001)(76116006)(9686003)(86362001)(66446008)(64756008)(4326008)(66946007)(66556008)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1ZHZU5DMDV0czMzUTdNUHJXek5FVzdPTVpDcUJ5K09RN0NJZmx0TWE5NXZo?=
 =?utf-8?B?bURWOFBlaHpPYnFHTVMvOWFpU3dOZTVkVHRxT3h0YnI5T3RKZHVyQzdIbXdl?=
 =?utf-8?B?MmpXaW9OczhLenZZLzI5aGVvTUQwUk5DSVBCVUpQT3k1REMrNFZrckxvalFt?=
 =?utf-8?B?NXNzeE9oYndrdWpyNzJ5TVNsRTBxaEUrY2V6VW5Id3hwOXVXR2R4YTFSNlN3?=
 =?utf-8?B?bm12dWI0U2JtTFlLWGgyeHJQdDUwV0dnM255dm9zenFwRHBmV1daZjVNRW1K?=
 =?utf-8?B?YUFGQ1RJbzJYa011eGQ1bkpKUFhXMllMNnVXTGMzTDQvdnZ6TnVJS0tockll?=
 =?utf-8?B?aXJKVDJPV0N0N1l5dytUS0s2ZUdXd25BY05lMDlHYWxhTWZIeDMyOVJRRG5U?=
 =?utf-8?B?V0RsTFF2SUNjeXBXUWhWTVZuaXNqd2VVekIwSVFITVp0dGhtbDJ1TzZpV09O?=
 =?utf-8?B?YVlaSWloSEswc1V1V21jZHltSmZ3SW94UXZJT3FUNnl1SC9aMnJ1NjlYWFR3?=
 =?utf-8?B?Z0dlODhlVHJkKzZXT2tUUk4xMXc0OEQvY3dDNFRDWXc0Zkx0WFpQYnVyS3ll?=
 =?utf-8?B?eWJvM1gvM0RMRWpPMnh4YkZlNzZLeFN6WS9HbnNEamVsdlMxTGk3RWxHTlhH?=
 =?utf-8?B?UHdTZ0VPNEM1ejZZRFNpRzkwVisrY3dWNzYxNkhQQTJ5Mmd5UW5HODY4UTZN?=
 =?utf-8?B?Y0JSNGRYZnBzV1FTZE9uQTFZUHF3WGl2encwM24xWTFoWVM0VmtwRmo3OWZi?=
 =?utf-8?B?ZVd4Umw5aXZIYUN6TWVwa3kwMmJENHhiMGdIQ0hvYTUrYXdJUjAyRExHZ2ZN?=
 =?utf-8?B?Z0VzenlBMzlnc1hRTzlsdGRQYWRsRVBzVnJSaC9EZG1iQlJJK1RXeUhMMSto?=
 =?utf-8?B?QXpNTVhrTzZYTUlaVGdzUVgwbjZpR1phSkYxQ0NMQWtHMW5lbFA3UDhDU3VD?=
 =?utf-8?B?eERRbyt1OS9uZ0p1UjZKV0FyeGN4bHE3cWtmUnFCbU55ZFVhTkhkc2NLSEJo?=
 =?utf-8?B?bnkrZVFMc1FjeTdKaVorZTRPb1k3dzQ0cnFXMVJ5UytYK2crYkpKRXM4bzJa?=
 =?utf-8?B?TE85ME5sdS9HamhYSFJZS0lMR2RmWkhiV3hONDIrUGNLamFrV2xEUEpMR1RK?=
 =?utf-8?B?M21MYnl5SXlGUXdPR1owMmNEN21xNHJVTjV1ZmF1OEVkbWRNQndwMjYvN3pR?=
 =?utf-8?B?MC9YQVdOWC9jQ3pwaC9QMTdFMjAraTBiS080OXR2SEpRL2pYR3cxZml4QVhU?=
 =?utf-8?B?bFVFbzBITjBZL010TG1sYWNHd1hDdEVhMDBua3VoOUNYWDhsdWVIckNzUzRC?=
 =?utf-8?B?dFp0bVN0NEVPUmJ4TVhHUHNHUlJVb1M1eVRFbGlIQ2c2NkN2NjhxZ1o2ZldI?=
 =?utf-8?B?SkRxM3ozSHYyRWpmSHlUc2pyckIwamdsS29HZHB6N1N0WERla0hmUkMrQ2JC?=
 =?utf-8?B?RmNyWlk0b2tCdjVCeFh4bFNGNm1hN3h1KzF2cUx2SHAyT3FXOUltU2JTUWFt?=
 =?utf-8?B?dXNNU3NjR2lvV1pJL3VDY0dTZHdCSGJJeTRzQ3djaU9RaXpMZmx0cTQva3Fq?=
 =?utf-8?B?UlBkQ1NOSVQybmlodE5LMklrL2k4TVZzOU5oQWs1MVNJaHRuSDZOS09sdFNY?=
 =?utf-8?B?dTkxbzUrUExTc1ZXRnRua1hhQXlZeDg3U0xuRWZYT2pBcjJ3cnphK21FbEFZ?=
 =?utf-8?B?OE82SDhzYS9Qbm9iRDVFTjRpOHdhVjBNd1NUYzlGZDdOZG5JL3YwYXVBS2kw?=
 =?utf-8?B?bk1hSTFpZk9sTEtVRmE2cGVMOS9xbW1OcUhtSEU5Ulh6cEd4UmdHL0kwVHpQ?=
 =?utf-8?B?NTZMYVVWNWtuMndyTmxwQVdXOTE2NG1neDlFb3V0Wm1aa0JCQ004dUFka0VR?=
 =?utf-8?B?eW9Lb1hMM01FMnh2am1QN2UyUU1HeTNHY0NFaFQwTDJENGZrUXZpYTN0ZVVl?=
 =?utf-8?B?bDhHdzc3OVhlT3JlT1VxOUtjYzhOL2VESU5DYmxpUWdoUUsyS0pjZDZNYVJv?=
 =?utf-8?B?TFdwbTNmVmxiQmxKczNzRnUvMXA4cmF0NUNVUFM1MWQ5b3lMSXIwV1Z4Zm5H?=
 =?utf-8?B?cUtobCtaYWF6V1NOaWo4dVM3VUxON3plOHRWZVhIdnhpWDhSaDlxS3A5QTFh?=
 =?utf-8?B?aXRYQ29NWWdFU3ZDMlFoekhRS284S2k4bXh2Mlc1SThRWUFyb1Y1Y1hHZDZZ?=
 =?utf-8?B?MWd2V2NnYmY3dE1rejlFMzUzZVNHbElJVUlLQ0Y5VzFYWnFQcFBLZENIdjh1?=
 =?utf-8?B?dlN0OHA0OG9JbGh1dDMyVmUwV2RuYmVPeTdScS9lR3B4cE1ETEQ1eVZ4ZG9N?=
 =?utf-8?B?UHd3WDQ3djdsbTdBc3IzRkpYMTdGN1JlejdQZ3M3YWdqYXZkQ0V1QT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73303aa6-4752-47f3-8bfc-08da3e5731c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 14:02:24.4493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYeDbY7zBBru9o/xzOW2EqGTP+MKF15Y37dGgJKGjPYwEGlGIilVcZzd341EuSNEy2IwzrGMMHXWdBROCEZVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8538
Subject: Re: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

>
>>     FILE="${BOARD_DIR}/extlinux.conf"
>>     if test -f "$FILE"; then
>>         install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
>
>> Right, but use "${FILE}" after -D.
>
> I just want to make sure I am not missing something.  I have changed the script to the following:
>
> if test -f "${FILE}"; then
>          install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
>
> Is there another -D I need to add somewhere?

> I didn't explain clearly, sorry. What I mean is quite trivial: you can simplify this:

>  install -m 0644 -D "${BOARD_DIR}/extlinux.conf" ...

> with this:

>  install -m 0644 -D "${FILE}" ...

Ah, I see.  Yes, that would have been another simplification.
In the v2 patch set, I added the fourth patch that removes the if statement completely.
So in the end, this line is going away anyway.

Please let me know what you think of v2.

Thanks for your review and support!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
