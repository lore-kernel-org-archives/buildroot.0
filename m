Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9341D40CE0
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 23:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F35608B1;
	Tue,  5 Nov 2024 23:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeZbCiEn-wgU; Tue,  5 Nov 2024 23:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4DBA60884
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4DBA60884;
	Tue,  5 Nov 2024 23:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE65B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C22A40621
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00XJhDr6Lusv for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 23:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=032b7802c=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EECB6400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EECB6400D8
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EECB6400D8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 23:26:56 +0000 (UTC)
X-CSE-ConnectionGUID: 8pv5TUQsSl2fW4ukECFPRg==
X-CSE-MsgGUID: O6F3ugNeQiaKOQ3tAnWKIg==
X-IronPort-AV: E=Sophos;i="6.11,261,1725292800"; d="scan'208,217";a="31837563"
Received: from mail-northcentralusazlp17013059.outbound.protection.outlook.com
 (HELO CH4PR04CU002.outbound.protection.outlook.com) ([40.93.20.59])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2024 07:26:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9R/XkSR3xqfd9aGgMSpxWkAz1yfcXQuPagzFdsmCjQwusHrlXzICaNKAFQZA0TJ8cx+BI1XcWUHTxGhLmyJTLKELuwF8Ew81R8to8Zd1R955k8C7n+92TS+QNvY7j4Qa8PA5CdnWqs4fn4j8n/hPIV+/JQSBiKDM7pclwkY15A6MrN8Nvnc/2/+92X+EFDTHsDqcoWBOcQk8r7um6ayw2uHK99oaHE21bBS2pYQUeaDci+BkF9LQ5Q53cKwassnL/Sou4xQkfhtjY2zODxujikdA8v7k/mvF1GF5Y+syFKxaS+FFar46Q8HLCNHcH2RdxxJ+jkQvuoguinY2yhZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbLSz4+n5PdJ5a3PWR4AAJIAqDMY0ZPOa1QscVrsjuY=;
 b=UJ/UzSpMMT9+JilMoGr0Eu4bFQD8VXL8lej5fgGX6GE2eq/VM6GLqWpfmNMpSTLYo41jD9XnPcp9pirczUvWcIFp/wkreHqHtm1Dc0BFV/pPRkCfpF8J1SPHJ/A5/tf4dZc8tBR6MFfaC80tqETdut1PpHR/4HHHidBJ5sSspgz0v3TGOA80vaxN/NYxwMx+G0ba0SNWch6RCy8HbiEQfVjyZyf3+a5g1/KJ1NZ4Y2++j6hbNzYvVnA9E9IKYmKkWULoxKLDi4ofUeuBLhP6wDW+LXdM/qsqMpYq/ygH3zvVFy90zg+oIm1g1a8sxLpdk61qCYoFtlN3wShB6btw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by DS1PR04MB9140.namprd04.prod.outlook.com (2603:10b6:8:1e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Tue, 5 Nov
 2024 23:26:54 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%2]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 23:26:54 +0000
To: Julien Olivain <ju.o@free.fr>, Alistair Francis <alistair23@gmail.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Alistair Francis
 <Alistair.Francis@wdc.com>
Thread-Topic: [Buildroot] [PATCH] package/libspdm: Support spdm_context in the
 HAL
Thread-Index: AQHa+EBXH+/QKLnsEUqfAwc/aS14vrKptoiAgAAKnV+AAAKgqg==
Date: Tue, 5 Nov 2024 23:26:53 +0000
Message-ID: <PH0PR04MB8549B4D65F520F843DDA764EF7522@PH0PR04MB8549.namprd04.prod.outlook.com>
References: <20240827051631.234377-1-alistair.francis@wdc.com>
 <b64f7f346ce3350571f00223b380d71d@free.fr>
 <PH0PR04MB8549F28957119B0331229728F7522@PH0PR04MB8549.namprd04.prod.outlook.com>
In-Reply-To: <PH0PR04MB8549F28957119B0331229728F7522@PH0PR04MB8549.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|DS1PR04MB9140:EE_
x-ms-office365-filtering-correlation-id: e075ffb3-f207-493d-5518-08dcfdf15553
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|38070700018|41080700001|15866825006;
x-microsoft-antispam-message-info: =?utf-8?B?TjIyOVhhYk1jYWpWejYzVm11UkV1VmU4V0lTbldKK085NzdUck9hN3hORUh5?=
 =?utf-8?B?ZjEvRHF4V3NCZ1NNZmVqTk9KdWh1dzhGWHN6TEJxc2dwampEWnlkaVJ4VWxH?=
 =?utf-8?B?YkVkQXI1ZGIxS0gyaEQxVk1Na0NJaG5TeVlLS2dCbURnZEExQU05bjZDMmhD?=
 =?utf-8?B?Nkt4QUhGYjZQRHZVcFp6MFg0d0JzUzBiUlBnbVRiK3hiMVZsNWxtam01ZTRR?=
 =?utf-8?B?RWVoQnlqRTdWYzJPeGlTa2lJbThJc25KYzN6ZXpLQzl1MkcvbktoczZBWmJD?=
 =?utf-8?B?VFpTUW43Qm5vVjRnQy83ZGhaU21CZEVia0Uwdm85dWdTanJWSnBLTmJodXVI?=
 =?utf-8?B?Kzd1UHZWMU5TVnlSbW8ySmFZWTFlaGFMbjVEaSs3MzEzdmN4R1JOUG1BRFFB?=
 =?utf-8?B?djhkOTQrbXRQdWFBUzVvNno3UVBXZFY4STcrcHNjQ0lkNWNtNktPa2pnakFy?=
 =?utf-8?B?UEVud2trSUhmUmxFTFFSMU5IQm03YmdKY0lnQm9HSGl3ZitldS9rWEVFRHRp?=
 =?utf-8?B?K3dmdjUzM3A1STRKd2NvQUx6RzdrMURWRi9FTFNLbWIxenhqbHNTUkYzM044?=
 =?utf-8?B?T3FiL1lic2d3Y2wrQTdGZ1YzWm5EdTZFTVZiY2lZQmdmMTg0czl0d0o1QjZX?=
 =?utf-8?B?NUQrcGV5aitpOVV1Q3QxNzF4WmcvdVVraDhndi9QSHJUZW1SajhSTEpOUjZR?=
 =?utf-8?B?ZG9QTGpEMlc4cmZ2TXFEeFdyVXVZdTF2ZVhHaTZuUDhqcXFuazFOMThvWnRl?=
 =?utf-8?B?YWxlYWxsS25SaFRlc3ByS3pXV3RyVjh3RkRTd0RVYXZyZGttYno5bXZPRXlZ?=
 =?utf-8?B?bER0QjNzVlA3N3RUZmYwQ0Q3Mit0YlZiVVZEUkpHcVdRUzF3UUduRm5vdHAy?=
 =?utf-8?B?aE9HUmN5aG1qWUU1MTFQdnBuY2w4RG9XZ1gzcTg4dkJpbjV1N0ZJc2RMT1Yx?=
 =?utf-8?B?dG9aNTdpUmV4SE84a2hPekRVd0lSUCt0dEVHcEdQK2FiN1ErNENqMDc2dmFl?=
 =?utf-8?B?K0MwUm0zRDhzM3F6VjBpcysyYi9rRDV3ZWtRM09pWDMvWDg0WW00OTNhUlF4?=
 =?utf-8?B?ak5CNmdoODVraE9uWmQvRWcvR3IwU2tNeEg0TXNrbVV5endhaWtCQmRUenNF?=
 =?utf-8?B?MXh5OUlQeVdZY3BJaGxud2JjYzZXZzJDdHo4dlJuVUdBaEJTeDhsL05CQXFy?=
 =?utf-8?B?cHM4YnBzMUFocEp2T1A3RmcybmkvN2lnbEplVm5zbkt0LzhsbmNtb0NTMG1r?=
 =?utf-8?B?b2F6MFhYRlJ0M1owaFBtODYybnhUeHN3TzVzcUxzQjN1akxjT1N2bnVPK2Vl?=
 =?utf-8?B?b1NYcGNuN2FHSEt5dzZXOGxkR0lhNFUwVWZDK0wrYXFvb0FQeWZLNGova0dj?=
 =?utf-8?B?Z0tuYSt2VjF0eml4dkxRQmRGMWtFazRHUlFTd2NabCt1Tml6VlJIQXBYcGU1?=
 =?utf-8?B?T3pwQkNsc1NBT2kxZW5JcjhTUXBSMlVkYnR3dUlFblZGODRlSDZTQmxsTjFH?=
 =?utf-8?B?Q1hLUlVjSVhOb1Z0eXF5TTVrZXBnbDlZcXlEQTRCRlZtWjlvelBKNGE1Tzgx?=
 =?utf-8?B?WVRLYm9OTzNEd01xRGNjT3hwZmNTWXNURXdBMTREUnBTdm5lWGdDRW5JdlJz?=
 =?utf-8?B?U0hwa29ZMzdDNXNSN25scmpzRXArZFFadnB6MEZzay9IemNMUE1WY2kvTUZE?=
 =?utf-8?B?dVRJbXhRN1NQL2ZmZmlNdDdsUUVxQXhpK0pSdzFMRlRNNUsveHNiOU9RSWIx?=
 =?utf-8?B?RzBqOWhLSXR2VklNS1VEaGNxdUdhK05OSmhqT0pvR3FyYXNOTW1zMktxVTJk?=
 =?utf-8?B?bk44QjdEektyQkIvRHJFMEdjd2V6VFA4YkR2QWNHU3hOK1RjNHd5dG5YYXBJ?=
 =?utf-8?Q?l5FbkfsWDD3eX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700018)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTVqSmdWMUxFWVdqUkNyZUZRSWNJb0c2SlE2QTJqaWpaMDRCbmQvVWJvWVZs?=
 =?utf-8?B?S0VmajMzK3NRdEJubS9FaWpEWHo2QmwzaHlUN3cxN1FHVGg1cjFXeCsyekNW?=
 =?utf-8?B?dGxqYy9iY2RDNncvYzRkMFhiN0lSeldWZGxwM3dPTFhuRmFZbXFFdjVYellU?=
 =?utf-8?B?d0tCVExoWWFyKytlYk8xK2k4RTNQN0E5anFkMktJTDFoUGRiTTR0TlBrZnBi?=
 =?utf-8?B?Rm9YY1MxdEorNTJxQzlwQVpWYitMcTFLS3F6ek1pdmtTZlBRcUp4SWlpQk9W?=
 =?utf-8?B?MFYrUDhYc2gwdkNRc1BsWFhmTkpkR3NGTjJtQi9pSW5Bb2txemFHTnhBaEd4?=
 =?utf-8?B?aVVxUkRGSDh5UG9aV2JWSEJmb0FpKzZMaWZzVHhScTEzbVQrSXBTUDFrbEdJ?=
 =?utf-8?B?YkJYMHRnYkhqVVNFMXh5ZzNOSkNIVUE5bGM3UHVDdXVpK09YSmd1b2JHa3Zm?=
 =?utf-8?B?WUlmYmNzNkdKZ0xCSGtQZFR2bzZXWHNUcFZRK2NYQXdrWlR6Um5PS3BDRFUw?=
 =?utf-8?B?OUp0bVl1MlV0WjdFbkxqdHptZ0J3VGt4OXIxUEVhbkZPbUNZNFRHb29wVUN1?=
 =?utf-8?B?TmlXUzJQU1g0ZVFYNUM5dmhtdkJSelNJY0RCdjNud1RsSlBLN09yM3VETGRX?=
 =?utf-8?B?OUJ4MEJiV2J3Q2pKQ1FLaGJkUHE5WmpHY2drWElwK2NpeFI5TW9zMzlheXpt?=
 =?utf-8?B?cCtHQy9jOFg0amF6OS9UWWdZeEJMeTlQbytMWFg0cTRuM01qM0RsZ3RkQngw?=
 =?utf-8?B?UVAveU5zaFBiQWJyVXhZQ2ZyalFXejYvODVIMXlLN0lBZzBBSUtPN2l6TDVl?=
 =?utf-8?B?R3IzVHptZ2ZSbWlxNy90VnRJQ2tJQ3JCTzdadU9MQkJ0WTB6ZU51djlDRVc1?=
 =?utf-8?B?NURJUWxlWmoyR3NjRm5SRGorbEk5WjJpbFpSWkZrS0lVdnRvTmJKWXJVUHYv?=
 =?utf-8?B?dmcrV3p4S2VrK0F4Wkthc2NwVUIrQVpRNWk5Y1VvUU5kZlE3NUZrbkN0aVZG?=
 =?utf-8?B?T3Z1eHZhbGlPWU5FczdXcTUvYUF3OFhsTDZ0WGczaWFxeVdGaEliWTZvTUpw?=
 =?utf-8?B?VUQ2TWgzUnFXWTVXTXdKR1huK0l6ZTQzMjhscHNCYjJKenlsdERUZnNsREg1?=
 =?utf-8?B?MzBIOTVKa0RTcnJQT2tYdWwzSkg5bDhNcnI1Qk9sL3N2WHBybkx1dSs4K09s?=
 =?utf-8?B?V1EzSzIzYUUvaU1zR1NncXBsWTE1eWJBZDJkTDBSWVpNdWFyT2gwK0ZreGIx?=
 =?utf-8?B?NzhuL1pzeFZyMklNMEU2N0ZEdjR2c2VLYXhnVmw0L2l6NE5BM3hieTJSZkNj?=
 =?utf-8?B?Z0pjeTJXSGxaK1hSeVgrUWllTHg5QUZURFlFYmcxcVFFdjUvbXY1RWNHZ3Uw?=
 =?utf-8?B?L21BU2ZUUVVPdFMwMjJNQVZrTFo0aDVkcXFQSkpHUEtSWi9CNlRWV3Z2UWRJ?=
 =?utf-8?B?NFN0YVZPZzRuNGpSU2pIYzE4RGlRVS9qcGtYQ2cvUlRzdHpDVERtZGlRZVp1?=
 =?utf-8?B?bXZMRVhVcVhUSi9jMkRzSXVjbnNEdEtGZzRFR2Q0VFN5akFTVURTd3Vmb081?=
 =?utf-8?B?VFJUZFJKWnJUeittRzdSeXN1TGFCUGhQRjY0b2FxSjgxYW1GTzdXNStUSVp4?=
 =?utf-8?B?bERUVVVManRZcjBja0V5dWp4Z1V1T201R01pYW5FNW9pMHNDZnZ1dlIzNkds?=
 =?utf-8?B?MnlGMkhhSjc5amdKL29JT1N5M0ZsWm1iOUNnVE1rWmMwc1JZUVM3TWZPakxH?=
 =?utf-8?B?aFRjeElRdVhNRnFObmdTa1lIL3l6ak1nZGdaNUpwVzgxZnRObm5OSHFUOVha?=
 =?utf-8?B?ZnZ6RHBDaTVzbmJBQ0VHRzFGUGxNTXVQWVBrWjNnekFaT2NzMStDMkRhN3Iv?=
 =?utf-8?B?dExDZndIWnovOEVrd21mTWdsU3FnYTJMM05GSnNiSTdCdGw3WmtvMnBVWk1M?=
 =?utf-8?B?QUhVNHBsYU1FZWp6VndFNG1nZUlOZEdac2lLNGg5QVlTVkF0bW16MW1qS1lY?=
 =?utf-8?B?c3pjZDlOSkdUdGJCaGdmMnZ1TFdSWkg3a01DNCsvOFpkd1Zkd2kyY0lYWEph?=
 =?utf-8?B?S2F1RXBLVWlCZDZ4YVVFaEZUS3YzNDRYUHkxQjdER1VkYWFkamRUL28wMytr?=
 =?utf-8?Q?ENCd0kdwqz8WA7nVj3nRB54An?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tj+5CckSGCZp7Hnk7easQAs3AlWgzO39NZ+91AnkDZ5rNkQnMBEwuoWWy+yknMIYpz4VdLVVZsZQYQAmgf1G5Ucg7tyC4fhu7Wzv5zDMASLnLuY6ZD/rplM4QkwosYUegkt7gtUfB21MxGegYFoUQ7chCu3wqkRiIfiXQCnj17pd5L+PZxCEs+VZEIQalZXcvry71Y5yzXo0vLC79KqYjIZEKrGT5aguBqa2fvn6E0gV1JrZqZD3tOwTMDE1ev+mgenykjV+HaH5KfMcqyZMdLURJYD9uFiwTILqobiWE9+CzsPPr1fYyRrG3u/57V2ijx2qBieZ1DyjF9F1//Z+uCDmvgnItvMJ1MlV+Sl4FaSS4uBnWnUR8kAq9Z9hxghIpRJyIXXGihd7pfiYujjjS55MPD5JG0EBJipsnx8bXIpGb4WhxAyl64zWY+cGTbU3bnnW8p5/P0PG3XclfHxXCfwxhtvGwLeTrhGND9zyCLha5+62CB85G1yWBdoX4oaBVeuoBnkfMqb5A0qWgfk+G/JO5pl9Ez/9q9R/ItimzBMhcxyaFo7IQtKP3bCGQ8rLs+d0lnsbfTRtLoO/iYbTiFFiMxnEyo0vxdoJNzYjWWkGbF4Smrlg0ErjEZ3YCoCx
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e075ffb3-f207-493d-5518-08dcfdf15553
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 23:26:53.9961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjqkWHkmUGowRcNR8yRpQ63bBezQWha0weCqgj41CybIJ2I5yG6A4RS8NLqcy6oU4m76W1qydJOFTMGl6qnMZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR04MB9140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1730849216; x=1762385216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=GbLSz4+n5PdJ5a3PWR4AAJIAqDMY0ZPOa1QscVrsjuY=;
 b=aNVH/CmmO+nAfmmHxiQIQauO1E0G6zZu7BoK1db+rAwfutezYLlEVWmO
 hSNmNmIsyusaVjMl5WlGjKu1qBWKdQRVZxI9rM0sxedKEUvZwv/4G0/aH
 ZKKVohgaHdVO+qpb4RgRsIfbYzYz3ArlZgLmrQ9bXAaXDvWYlwfoAgt2l
 lGq9xZ/yqF2aMjWtkTa//FeCvfQm9CAj0R+XOCNJsq7YVfmFHHpVXiXc3
 PzEIbqLIqy6s/1uRChpdUo0fyAN1+G9rWC5IpXzg7BONU3k/9ForcUDFM
 52S0HN0Uvf5btyNd4HMkQYmfVhXdFQU+tTZmbDhBoPk0MLIxsmYieCiLe
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbLSz4+n5PdJ5a3PWR4AAJIAqDMY0ZPOa1QscVrsjuY=;
 b=XKEgVJ2zsOXNPL7A1QajUi0JgHL5oJF0xKmaXodV5OLPwqqDPiU/ARDDjm7v1mxpEfMVJevdW7X0DOI18/r3YRZxAZQziRoEp/fOHjviErbLXRZX1vr3rVdB68Q6gK1mDpzIkBTutO4lchxU6e40uQGevqMS6AKU5sBYGThRnFY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=aNVH/Cmm; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=XKEgVJ2z
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH] package/libspdm: Support spdm_context in
 the HAL
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: multipart/mixed; boundary="===============2516445458189636796=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2516445458189636796==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH0PR04MB8549B4D65F520F843DDA764EF7522PH0PR04MB8549namp_"

--_000_PH0PR04MB8549B4D65F520F843DDA764EF7522PH0PR04MB8549namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T29wcyEgd3JvbmcgY2hhaW4sIHRoaXMgd2FzIGZvciB0aGUgbWFjcm8gZml4dXAhIPCfmIQNCg0K
V2lsZnJlZA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogYnVpbGRy
b290IDxidWlsZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBvbiBiZWhhbGYgb2YgV2lsZnJl
ZCBNYWxsYXdhIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg0KU2VudDog
V2VkbmVzZGF5LCBOb3ZlbWJlciA2LCAyMDI0IDk6MTcgQU0NClRvOiBKdWxpZW4gT2xpdmFpbiA8
anUub0BmcmVlLmZyPjsgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIyM0BnbWFpbC5jb20+DQpD
YzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPjsgQWxp
c3RhaXIgRnJhbmNpcyA8QWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tPg0KU3ViamVjdDogUmU6IFtC
dWlsZHJvb3RdIFtQQVRDSF0gcGFja2FnZS9saWJzcGRtOiBTdXBwb3J0IHNwZG1fY29udGV4dCBp
biB0aGUgSEFMDQoNCkFoIHllYWgsIG15IG1pc3Rha2UuIFRoYW5rcyBmb3IgdGhlIGZpeCENCg0K
UmVnYXJkcywNCldpbGZyZWQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9t
OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPg0KU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJl
ciA2LCAyMDI0IDg6MzkgQU0NClRvOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpcjIzQGdtYWls
LmNvbT4NCkNjOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyA8YnVpbGRyb290QGJ1aWxkcm9vdC5v
cmc+OyBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPjsgQWxpc3RhaXIg
RnJhbmNpcyA8QWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tPg0KU3ViamVjdDogUmU6IFtCdWlsZHJv
b3RdIFtQQVRDSF0gcGFja2FnZS9saWJzcGRtOiBTdXBwb3J0IHNwZG1fY29udGV4dCBpbiB0aGUg
SEFMDQoNCk9uIDI3LzA4LzIwMjQgMDc6MTYsIEFsaXN0YWlyIEZyYW5jaXMgd3JvdGU6DQo+IEZy
b206IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+DQo+IFRoaXMg
YWxsb3dzIHVzIHRvIGJ1aWxkIGxpYnNwZG0gd2l0aCBzdXBwb3J0IGZvciBgc3BkbS1jb250ZXh0
YCBpbiB0aGUNCj4gSEFMIGZ1bmN0aW9ucy4gVGhpcyBpcyByZXF1aXJlZCBieSBgc3BkbS11dGls
c2AsIHRoaXMgbWFjcm8gd2lsbCBiZQ0KPiBkaXNzb2x2ZWQgaW4gbGlic3BkbSA0LngsIHdpdGgg
dGhpcyBmZWF0dXJlIGJlaW5nIGRlZmF1bHRlZCBvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogV2ls
ZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
QWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KDQpBcHBsaWVkIHRv
IG1hc3Rlci4gVGhhbmtzIQ0KDQo+IC0tLQ0KPiAgcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsg
fCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsgYi9wYWNrYWdl
L2xpYnNwZG0vbGlic3BkbS5taw0KPiBpbmRleCBlODZhNzllZDY3Li4yYTc2ODkyNzM3IDEwMDY0
NA0KPiAtLS0gYS9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5taw0KPiArKysgYi9wYWNrYWdlL2xp
YnNwZG0vbGlic3BkbS5taw0KPiBAQCAtMjAsNyArMjAsOCBAQCBMSUJTUERNX1RBUkdFVF9DUFVf
RkFNSUxZID0gJChjYWxsDQo+IHFzdHJpcCwkKEJSMl9QQUNLQUdFX0xJQlNQRE1fQ1BVX0ZBTUlM
WSkpDQo+ICBMSUJTUERNX0NGTEFHUyA9IFwNCj4gICAgICAgICQoVEFSR0VUX0NGTEFHUykgXA0K
PiAgICAgICAgLURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX0VWRU5UX0NBUD0wIFwNCj4gLSAg
ICAgLURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX01FTF9DQVA9MA0KPiArICAgICAtRExJQlNQ
RE1fRU5BQkxFX0NBUEFCSUxJVFlfTUVMX0NBUD0wIFwNCj4gKyAgICAgLURMSUJTUERNX0hBTF9Q
QVNTX1NQRE1fQ09OVEVYVD0xDQo+DQo+ICBMSUJTUERNX0NPTkZfT1BUUyA9IFwNCj4gICAgICAg
IC1EQVJDSD0kKExJQlNQRE1fVEFSR0VUX0NQVV9GQU1JTFkpIFwNCj4gLS0NCj4gMi40NS4yDQo+
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QNCj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290DQo=

--_000_PH0PR04MB8549B4D65F520F843DDA764EF7522PH0PR04MB8549namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpPb3BzISB3cm9uZyBjaGFpbiwgdGhpcyB3YXMg
Zm9yIHRoZSBtYWNybyBmaXh1cCEg8J+YhDxicj4NCjxicj4NCldpbGZyZWQ8YnI+DQo8YnI+DQo8
L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6
aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlG
d2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0i
Zm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gYnVpbGRyb290ICZs
dDtidWlsZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnJmd0OyBvbiBiZWhhbGYgb2YgV2lsZnJl
ZCBNYWxsYXdhIHZpYSBidWlsZHJvb3QgJmx0O2J1aWxkcm9vdEBidWlsZHJvb3Qub3JnJmd0Ozxi
cj4NCjxiPlNlbnQ6PC9iPiBXZWRuZXNkYXksIE5vdmVtYmVyIDYsIDIwMjQgOToxNyBBTTxicj4N
CjxiPlRvOjwvYj4gSnVsaWVuIE9saXZhaW4gJmx0O2p1Lm9AZnJlZS5mciZndDs7IEFsaXN0YWly
IEZyYW5jaXMgJmx0O2FsaXN0YWlyMjNAZ21haWwuY29tJmd0Ozxicj4NCjxiPkNjOjwvYj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcgJmx0O2J1aWxkcm9vdEBidWlsZHJvb3Qub3JnJmd0OzsgQWxp
c3RhaXIgRnJhbmNpcyAmbHQ7QWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tJmd0Ozxicj4NCjxiPlN1
YmplY3Q6PC9iPiBSZTogW0J1aWxkcm9vdF0gW1BBVENIXSBwYWNrYWdlL2xpYnNwZG06IFN1cHBv
cnQgc3BkbV9jb250ZXh0IGluIHRoZSBIQUw8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPC9k
aXY+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0eWxlPSJkaXNwbGF5Om5vbmUiPg0KPCEtLQ0K
cA0KCXttYXJnaW4tdG9wOjA7DQoJbWFyZ2luLWJvdHRvbTowfQ0KLS0+DQo8L3N0eWxlPg0KPGRp
diBkaXI9Imx0ciI+DQo8ZGl2IGNsYXNzPSJ4X2VsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1m
YW1pbHk6QXB0b3MsQXB0b3NfRW1iZWRkZWRGb250LEFwdG9zX01TRm9udFNlcnZpY2UsQ2FsaWJy
aSxIZWx2ZXRpY2Esc2Fucy1zZXJpZjsgZm9udC1zaXplOjEycHQ7IGNvbG9yOnJnYigwLDAsMCki
Pg0KQWggeWVhaCwgbXkgbWlzdGFrZS4gVGhhbmtzIGZvciB0aGUgZml4ITxicj4NCjxicj4NClJl
Z2FyZHMsPGJyPg0KV2lsZnJlZDwvZGl2Pg0KPGRpdiBpZD0ieF9hcHBlbmRvbnNlbmQiPjwvZGl2
Pg0KPGhyIHRhYmluZGV4PSItMSIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrOyB3aWR0aDo5
OCUiPg0KPGRpdiBpZD0ieF9kaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9IiMwMDAwMDAiIHN0eWxlPSJmb250LXNpemU6MTFwdCI+
PGI+RnJvbTo8L2I+IEp1bGllbiBPbGl2YWluICZsdDtqdS5vQGZyZWUuZnImZ3Q7PGJyPg0KPGI+
U2VudDo8L2I+IFdlZG5lc2RheSwgTm92ZW1iZXIgNiwgMjAyNCA4OjM5IEFNPGJyPg0KPGI+VG86
PC9iPiBBbGlzdGFpciBGcmFuY2lzICZsdDthbGlzdGFpcjIzQGdtYWlsLmNvbSZndDs8YnI+DQo8
Yj5DYzo8L2I+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnICZsdDtidWlsZHJvb3RAYnVpbGRyb290
Lm9yZyZndDs7IFdpbGZyZWQgTWFsbGF3YSAmbHQ7d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20mZ3Q7
OyBBbGlzdGFpciBGcmFuY2lzICZsdDtBbGlzdGFpci5GcmFuY2lzQHdkYy5jb20mZ3Q7PGJyPg0K
PGI+U3ViamVjdDo8L2I+IFJlOiBbQnVpbGRyb290XSBbUEFUQ0hdIHBhY2thZ2UvbGlic3BkbTog
U3VwcG9ydCBzcGRtX2NvbnRleHQgaW4gdGhlIEhBTDwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+
DQo8L2Rpdj4NCjxkaXYgY2xhc3M9InhfQm9keUZyYWdtZW50Ij48Zm9udCBzaXplPSIyIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdiBjbGFzcz0ieF9QbGFpblRleHQiPk9uIDI3
LzA4LzIwMjQgMDc6MTYsIEFsaXN0YWlyIEZyYW5jaXMgd3JvdGU6PGJyPg0KJmd0OyBGcm9tOiBX
aWxmcmVkIE1hbGxhd2EgJmx0O3dpbGZyZWQubWFsbGF3YUB3ZGMuY29tJmd0Ozxicj4NCiZndDsg
PGJyPg0KJmd0OyBUaGlzIGFsbG93cyB1cyB0byBidWlsZCBsaWJzcGRtIHdpdGggc3VwcG9ydCBm
b3IgYHNwZG0tY29udGV4dGAgaW4gdGhlPGJyPg0KJmd0OyBIQUwgZnVuY3Rpb25zLiBUaGlzIGlz
IHJlcXVpcmVkIGJ5IGBzcGRtLXV0aWxzYCwgdGhpcyBtYWNybyB3aWxsIGJlPGJyPg0KJmd0OyBk
aXNzb2x2ZWQgaW4gbGlic3BkbSA0LngsIHdpdGggdGhpcyBmZWF0dXJlIGJlaW5nIGRlZmF1bHRl
ZCBvbi48YnI+DQomZ3Q7IDxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogV2lsZnJlZCBNYWxsYXdh
ICZsdDt3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbSZndDs8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6
IEFsaXN0YWlyIEZyYW5jaXMgJmx0O2FsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbSZndDs8YnI+DQo8
YnI+DQpBcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzITxicj4NCjxicj4NCiZndDsgLS0tPGJyPg0K
Jmd0OyZuYnNwOyBwYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5tayB8IDMgKystPGJyPg0KJmd0OyZu
YnNwOyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pPGJyPg0K
Jmd0OyA8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5tayBi
L3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1rPGJyPg0KJmd0OyBpbmRleCBlODZhNzllZDY3Li4y
YTc2ODkyNzM3IDEwMDY0NDxicj4NCiZndDsgLS0tIGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0u
bWs8YnI+DQomZ3Q7ICsrKyBiL3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1rPGJyPg0KJmd0OyBA
QCAtMjAsNyArMjAsOCBAQCBMSUJTUERNX1RBUkdFVF9DUFVfRkFNSUxZID0gJChjYWxsIDxicj4N
CiZndDsgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfTElCU1BETV9DUFVfRkFNSUxZKSk8YnI+DQomZ3Q7
Jm5ic3A7IExJQlNQRE1fQ0ZMQUdTID0gXDxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgJChUQVJHRVRfQ0ZMQUdTKSBcPGJyPg0KJmd0OyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAtRExJQlNQRE1fRU5BQkxFX0NBUEFC
SUxJVFlfRVZFTlRfQ0FQPTAgXDxicj4NCiZndDsgLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAt
RExJQlNQRE1fRU5BQkxFX0NBUEFCSUxJVFlfTUVMX0NBUD0wPGJyPg0KJmd0OyArJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IC1ETElCU1BETV9FTkFCTEVfQ0FQQUJJTElUWV9NRUxfQ0FQPTAgXDxi
cj4NCiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAtRExJQlNQRE1fSEFMX1BBU1NfU1BE
TV9DT05URVhUPTE8YnI+DQomZ3Q7IDxicj4NCiZndDsmbmJzcDsgTElCU1BETV9DT05GX09QVFMg
PSBcPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAt
REFSQ0g9JChMSUJTUERNX1RBUkdFVF9DUFVfRkFNSUxZKSBcPGJyPg0KJmd0OyAtLTxicj4NCiZn
dDsgMi40NS4yPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fPGJyPg0KJmd0OyBidWlsZHJvb3QgbWFpbGluZyBsaXN0PGJy
Pg0KJmd0OyBidWlsZHJvb3RAYnVpbGRyb290Lm9yZzxicj4NCiZndDsgPGEgaHJlZj0iaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Ij5odHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3Q8L2E+PGJyPg0K
PC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_PH0PR04MB8549B4D65F520F843DDA764EF7522PH0PR04MB8549namp_--

--===============2516445458189636796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2516445458189636796==--
