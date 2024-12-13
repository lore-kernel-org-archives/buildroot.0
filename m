Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C73E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 14:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA9D2400E1;
	Fri, 13 Dec 2024 14:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLXOUTqTea0L; Fri, 13 Dec 2024 14:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C952040698
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C952040698;
	Fri, 13 Dec 2024 14:27:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B78BECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CAC881116
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9ImMUkPfsdu for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 14:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::605;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7840380EDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7840380EDA
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7840380EDA
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKNc28X5D7yJ8nr87nIjwHaWg/jT8yHtXOcXDxjbzUjtEoylS2t12lJ1O8PqMqeyBiYMFqsAgx1YlP1r6gVnSypCKhEM1+5gNf84XFaBjImZn5GKBfL6VeFaAgT5QGTS1qgKrqVRhc/OzXvErwPSgbGMLzk+794bYgPF6rcDdP3lioqr/bzic4qIK+FQeBVUxYeubt5gg6xyJwyB3tq4xBLeIoiUecltV6DggySeHZuW7MsAwkvpmgH/FrthjV5CaCXMtGITYT6Ex0i/3FdScceovf3QO/KpkVPaMPemr+mvV4u1tV8QH74YIARvknu27IqGvSBLAoWRIvqnrGR5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTozLhTv7vyusbGfsIdzzw6dasaY+8/VsRrkK4JjH5E=;
 b=Izvik1tv4ZX9O9qGfUQ/iBWYVM9mcfcayHZBrbFzn9E/06Cu0rbOHkXumTjTIMnRgWaFgpVpyaEx8tIjEy6OQv9udgQmNVRDaaMgHnAW1GkEDmZcv/Q8wsspNm+PY9FdhkSq3DfM46uhdIOCqlN8j2iubN8lFY2K62v0wecmFNg7fo8k3Og3RynOPi1as1jftFsl0Quwqo0bkK6V7kUGtXS4c2Jw7NYkpPKDSKGYxkAzkAdDVGKAAIWt1AHDgt8L05uI3dUvS0iLssJJs/2zmD/Ub4zRm8WwJDSIhpUYSlY7mIz74if3iATN1dsC2yGidwRPgCFbLWhMmoxNzrzCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB8970.namprd12.prod.outlook.com (2603:10b6:610:176::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Fri, 13 Dec
 2024 14:27:25 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:27:25 +0000
To: "Simek, Michal" <michal.simek@amd.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHawTEMoyu+eO8XaUWWah1EeSt8SbLlTKkAgAAEJQCAAADvkA==
Date: Fri, 13 Dec 2024 14:27:25 +0000
Message-ID: <CH2PR12MB5004F72DCFC7CAE9556FBB4EF0382@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
 <20241213150136.0c434b72@booty>
 <1b302d1b-723e-4347-99a4-c2491b072850@amd.com>
In-Reply-To: <1b302d1b-723e-4347-99a4-c2491b072850@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB8970:EE_
x-ms-office365-filtering-correlation-id: 7ab25de6-9a7f-4893-e42a-08dd1b8243bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?Y0R4akpZYTFjQTRDQWNIZi9lZTMwVFBMa2pWQzhhTlp0bUl5RDFZdkV3Z2Z0?=
 =?utf-8?B?OVcrL29QckNuTjZUaFh4TmwxOTV6Z1FyNXQ1QWhuRWd5SzhwMy9Pb3poSVdK?=
 =?utf-8?B?TkZHcncyQzhvWFVvV1grc1E2SFN4V2FReExhSVNRVTlxRkx6a3V1T3ZGalo2?=
 =?utf-8?B?aitoRkRSY2U3VFFtQTFoZFFCTXBzNno3cGZKeXVxMFJjRzNQbHdjaUE3aWpy?=
 =?utf-8?B?aGQzdGdxMnZsaWRzWmc2YmpMRHlQc1VBR1FTUnBJQXpGQ0pIUU1zcGhLNHM5?=
 =?utf-8?B?STV6bUlCbjhOTUxGZ3REVWpwaDNEQWFDaU5iUXlpY0hiT1QwL0ZJdURsdmVr?=
 =?utf-8?B?QzZmQVZoV3YybDVSeFdxb3JQTlk1OEdXM0wzY2oxdGY1M3RGcVBOK1NISVNq?=
 =?utf-8?B?RE5TTnNHeWRVV3JVRThMcVg4eTIzVUk3NHpIaTd3QWl2ZG9xcmMrZWFmdmgr?=
 =?utf-8?B?ekFKUi9uUFdkWW1LUFg3RnFNZE5JSzRNbm5vZUExcHV6RzVrNEtzQjlmTTNS?=
 =?utf-8?B?UjZ5Q1loUGRSTGdGdE1CNUNjeVZ2Sm9CaytSVDZPcWNSQkUyOFR5eDVXWThk?=
 =?utf-8?B?cmUwb0Zyd3djclp3WmxDRm54TTlpRDRyRFVxdWNFM1RLWlBXTWFZQ051eHdM?=
 =?utf-8?B?aFpLdzd0U1lGY0FhT05wNTFwNURJN2pUQWpOaFJCdmhCS3BwZ1h0OXJhRnRO?=
 =?utf-8?B?b0c2VzVUdEFKeU1GQnlza2poNERNbmdGN0poTWlFVEgyV0ZWbG5pQW5GU0hS?=
 =?utf-8?B?RitNNDBWK0wvOWQzdVY0UUhFWWtFQWx0bStaakJ5YlppMlNRT240MWsxSVdF?=
 =?utf-8?B?dGJOMWRNSWRjRUQvdEhZQmsveGREaEF6MXVoWU5SaG1xVnVvOFppc21aVmJT?=
 =?utf-8?B?QzJKOTlTVnRtTTJwQTF4bnU0ZHl6WTYwVjFKU1FrZS81UmRjSzVyYVlVVTBY?=
 =?utf-8?B?dStCK2pGS2VoU0ZyYXVCMW1KVUwyYlpkVnRFMi9DazRHQi9iTFZDVkpPN3Rq?=
 =?utf-8?B?OEJINlcrcHBKSCtPc05uRWFhLy9PZHEwaUdkRnJUeWtxMm4rbVpDUUliTHVy?=
 =?utf-8?B?d2tZNjFoOUswUnJJU2Y4VlpZWWU1U2FvMG9XOW9iUXY2cm4zajBCczZITHdK?=
 =?utf-8?B?RjMrS3BFalN3ZVFmQjVjbFk2bldmZ2hRMWdlTllXU1Y2djFyei90SzN4QjRx?=
 =?utf-8?B?V2REaUNlQVRWMk9LQkFHMUw0UExpVnV4dTRyWjIrYnF2QUovUUxKMjBMWG9E?=
 =?utf-8?B?RzUrWHVzbjdUNjl6MFNnM0Mvc0MzaitwTUNLOG05WkxqUE5FWGVzVUxXR3Zq?=
 =?utf-8?B?TnpmdXdDRGVjQ2NhNldmQTQ2WmJZWkc0dlR4TjVIbmJvUEtCQ1pMRUhjdGM3?=
 =?utf-8?B?NCtuUmI0TWNkVndhWHRVMndWdGF3K1h6NHdzVUUxU1R4Tys0dmI3eEhWUkpX?=
 =?utf-8?B?aDZqa3dFK1ZOQ2EwSEh6M0Z2UVVNbFNnckF5ZDkzVUxCelRBSXNZckZaTTA3?=
 =?utf-8?B?aGRTSndROUlSVnJBL1p1aThIN09wVzRGK1U0UVVwRTBTblkybVU4Uk0yc09t?=
 =?utf-8?B?ak4zZUJYZTFHY0ZvbFprQ2ZncUdsTk5kUG90ZlpiOG9YZkY1Z2N4dVhJSEN0?=
 =?utf-8?B?VEMyNDNmTm9hcGljcVdsQmdJbEpwNnVCV3craW1RSlREQjVUVUx5OWM0YkMx?=
 =?utf-8?B?b01qWk9TdXlBUndwS0RZZzZaY2ROemhodGdZSUF5bnlDeE1zU0hiLzE5Qk9o?=
 =?utf-8?B?c0dibUVTNXF6WGRqQnBWMFlEdy9ub1FZcm1GRldDTjZ4cGNlUHRPcmFGOE1p?=
 =?utf-8?B?V0NUL0NNTmlsVTFBU1hEait4SFJ5YWNkckVsdVk5cUlrQ3pYREh4T1I5VnFK?=
 =?utf-8?B?UmdQTXIyRGJibEM2MUFRejdEc1VoT0lhMndRRHBoTVowZ3NBWFppTmlORHU3?=
 =?utf-8?Q?SyF4KWylTSUyEmpMoxLUvFMzitkFE7gy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mzk5WHdiejJRVDZlT0lyakNYVjlQalluU0g0ajNFbDlENU1EVWdvVDkwMzVS?=
 =?utf-8?B?NG93bFpBaXF6N081WnFRM2ltQWZubWtzaTlmYTUxVWNURUxtb2NZajFqSlVH?=
 =?utf-8?B?bmlRTTlJdGFMaHZwaXhKNHdBVzVHOWNBYmQ1TnBrU2xyVWtWYjRtUVIwUVp2?=
 =?utf-8?B?WkdpaUZxVW9YWFZ3T3Q4UDFWdTZjOGtaY2ljZHVwOERsdzdvcGFweFJnTWhs?=
 =?utf-8?B?KzZ0YmVtVUxqSTFEV1ZudDNRa0krSEUrd21JUkJBNms1dDZoYk9QRVRoUW4y?=
 =?utf-8?B?bG90cEtRajVRUk4xV0REMmxzQUl0SmpkUStMYkdSOVBJNmdRY2U1Y1ZhUDRx?=
 =?utf-8?B?elA3dEE5aHgvZUFzaDZXbEVpS1VWaXF6bzluMzBwczA0Sm1yMlp2a0crWVQr?=
 =?utf-8?B?UTU5N09GLzUwVHJSV1d0SWc1SXB3a1VGM09XekdLMThPaWJ2MzJjV0x2cE85?=
 =?utf-8?B?YXJTcjFIZWROcitnNHkzOFdSUlpZQmo0aDJ2d2R4RFpjKzUyTzIxdDBFSGoy?=
 =?utf-8?B?azcwLy9vNEc3b0dqclNSWk00elFZak1URllkK0tMbnYyWXVTNVo0L01ra0xn?=
 =?utf-8?B?dnpPUW1nbXZTOURvbFF0b3JLMW5ZTkVIRUphK2dSRXB6ekxpRk1aUUNmL3R3?=
 =?utf-8?B?L0Q2dHlNSk1GUnlSY1k0ZUJkVVdtdHFocEw5bjVvSEVuWEU3ZXkvM1Vneitu?=
 =?utf-8?B?SHp6TlNieVZpTE0rZ1RVaTExaUxOU0lqb0Npby9rQ3VzMmdqMnZIaDBHQlpM?=
 =?utf-8?B?dURXK0hIOTF4RHRxTEJoU3ZuMGZSMEkrOWVaZDlLMXJzaXhtMk5JQlBMZjUy?=
 =?utf-8?B?QkRpWkllRTUza0dTYkYvUUMwRmQ4TDJ2ZE1NUVpFdUNnaS9KQWc5K0p4NGp3?=
 =?utf-8?B?cEc2MGYvQVlxSHFhTjlXdEYraSsyeUpTaERpYkdrZ1V6bHhvd1lzdnBlT1Z6?=
 =?utf-8?B?RUR0bEhOVFk3d0VGd055Tk1qcW1xZ1BhTlZ5cEp1YjNtVTNaS2N3WGhvVHp2?=
 =?utf-8?B?VDd0clZwQk1YbHJFeVZSRW1ZMENKSnBNNXVmVForVTNjYjdYYjdBSEdRNDZt?=
 =?utf-8?B?SVhBczhHZXc2a050WmQvZFdHTEFmZlgwdHBpbWhwaStQTVpGYjBwRktCVThQ?=
 =?utf-8?B?NkVyZHJWUHE2YS9Zaml5Q095MU9YSExJU01ISm9BUWRSWHc0N2h6dTcrRW9z?=
 =?utf-8?B?OWgvSGpCZHB6NFYzV2NOVkt4ODNEUW1jSEF5YnFmOUc5SGErdmwxeDFHWExL?=
 =?utf-8?B?SDdYeXduSHlVOVlsRVRYZlhkVUh3NkpLMjFYaFJYVmhMQjhkbjdpcDlNdktm?=
 =?utf-8?B?d0J3VkVIN1VpVThPWEZwTnp1WlNQZW9KZGpMcnMyYVVVcHF3dnZtZmN2MTk3?=
 =?utf-8?B?RUtVUjk0dUxFb3ByaUdHRW82bXRvYjJKZzlid2p1SUpYV2ZFdDdzMzBha0xY?=
 =?utf-8?B?SEpBSStCbjF5b0VtRmNDSDZVbXhSeFlTR1ZTWXBTb0cvbXBVT0tTWUlBOThO?=
 =?utf-8?B?K0ZQbHBCWEZCb0JLQ01JSkUyYUhEZTFHWWZLcW5jTWllRWY1V2xBbTNEUlBs?=
 =?utf-8?B?SURvSy9Ba2t6WjhOaEYzcTJjZ3U4TGo4TlNjMExpSWt6bVZsOTJMSWYvK3k5?=
 =?utf-8?B?S2Z4Vi9pQUFDc09nRExBcVdVVUFNYXFLcTNuMVlEVk9PbjkzNkJyaTJsS2Fa?=
 =?utf-8?B?anZ1SGhEcktQRVNWc3paMzRTUW9zOWFZWWVPQTM5OVdyWEZQRjVGMjAyQTU4?=
 =?utf-8?B?ZENmRVA4NGQrOGREWk5lYlJpenJaQzdqSEowRE53aWlwWndjVm5CbmFyaWIz?=
 =?utf-8?B?TWRZaDFXdC9Ta0VsK3c5YXVjSXByL1JUeFhIWVFGNmxyV3EwZWkvVHhuMjZS?=
 =?utf-8?B?YXRlVjJJa3h2WldnMndYWlJhb0NaSHRHV3NqV3VXWUxld2FMUkxPbFNteTRy?=
 =?utf-8?B?SmlpYnA2SmdNaTljZE5OYzNHTWV6emU1WnYwZmhnUE1Kbk9pdmxwMVZwU213?=
 =?utf-8?B?YW44V3k4aXVJNytiQnZneVliL2NkL2JuT3VyUlBzZFFITFBiOU9CUDF2UC85?=
 =?utf-8?B?TnArZXNodzdvREtqSS9Kc1ZFT1VWaTFWWFkvdXBmeHFWWk9jK0RZbGNNTXM3?=
 =?utf-8?Q?724I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab25de6-9a7f-4893-e42a-08dd1b8243bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 14:27:25.2293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWbfbOPxfkI9dbns1uMgs4GI2PX3Dugz+PAxvwyuUu+jsrJK/Btn/042jqzr7GZT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8970
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTozLhTv7vyusbGfsIdzzw6dasaY+8/VsRrkK4JjH5E=;
 b=Fh7A9ACkzRtp1qOXls54eSkXAqww95dXzSFwUvlTRK9jw0ljiDPFh3A9x9WF7IV46RBV7VbcjIZo0+f4xPo+j1c2hYUG4qpubA1gCMoRyzuTN5pOUfZN8U0XziuDGcyS6uGKB7wazSY45pTMFAag0GV8ry8Tz5JNAM76Pny4oDQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Fh7A9ACk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> Hello Neal,
> 
> On Tue, 18 Jun 2024 04:38:48 +0100
> Neal Frager <neal.frager@amd.com> wrote:
> 
>> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
>> the following updates:
>>
>> - Linux v6.6.10
>> - U-Boot v2024.01
>> - ATF v2.10
>> - PMUFW xilinx-v2024.1
>>
>> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
>> needed.
>>
>> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
>> the offset between the base address of the boot.bin and u-boot.itb instead of
>> a raw base address of u-boot.itb. This allows for A/B firmware updates since
>> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.
>>
>> Thus, Kria SOMs come with the following QSPI address table.
>>
>> Partition A:
>> 0x200000 - boot.bin
>> 0x280000 - u-boot.itb
> 
> Now I realized there seems to be an issue when using the flashed
> recovery tool to upgrade boot.bin and u-boot.itb. The SBIRT recovery
> tool does not allow writing at address 0x280000, thus using the current
> flashing procedure leads to a non-booting system:
> 
>    U-Boot SPL 2024.01 (Dec 13 2024 - 13:41:04 +0100)
>    Loading new PMUFW cfg obj (1836 bytes)
>    PMUFW:  v1.1
>    Silicon version:        3
>    EL Level:       EL3
>    Secure Boot:    not authenticated, not encrypted
>    Multiboot:      64
>    Trying to boot from SPI
>    SPI offset:     0x280000
>    <system stops here>
> 
> Do you think my understanding is correct?
> 
> If it is, I already have a draft solution, which is basically creating
> an image just for the SBIRT tool, based on:
> 
>    cp boot.bin sbirt.bin
>    dd if=u-boot.itb seek=128 bs=4k of=sbirt.bin
> 
> Do you think there are better solutions? Otherwise I can finalize my
> draft and send a patch to Buildroot in order to generate a working SBIRT
> image from Kria defconfigs.

> not strictly following buildroot activity but I expect Neal has started to use 
> binman which is enabled in u-boot/next branch which generates qspi.bin directly.
> It places based on kria defconfig u-boot.itb at 0x80000 offset.

> And that's exactly what you are trying to do with cp and dd command up.

I was aware of our migration to binman, as this will enable us to remove all
the kria post-build u-boot.itb fixup scripts from buildroot, but I was not
aware of the qspi.bin!  This is excellent news.

With the qspi.bin, I retract my previous email.  When we migrate the kria
defconfigs to binman, the best solution is to use the qspi.bin in the
genimage.cfg as this file will work with both u-boot and SBIRT flashing.  We
will make sure to update the readme.txt accordingly, as well.

@Luca, that said, I think we do not need your patch.  Once we have the next
u-boot release tag (it is coming sooner than 2025.1), we will have binman
support which will clean up the SBIRT issue naturally with the qspi.bin.

> Regarding recovery tool. I have recently seen one target where Image Recovery 
> application (when you press reset and fwu button) is not able to program this 
> boot.bin to flash and reports incorrect CRC and programming is not happening.
> It looked like it was any old board with some limitations. When image is 
> programmed from u-boot itself it was working properly.
> Can you please provide some information about your board?

I don't think this is Luca's issue as we do not yet have a u-boot release tag
for buildroot that is enabling binman.  So Luca's issue is that he has a
boot.bin and a u-boot.itb, and needs to create a 'qspi.bin' or 'sbirt.bin'
post-build.  And there is no way to write the u-boot.itb to address 0x280000
with SBIRT.

> Thanks,
> Michal

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
