Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC87C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 08:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8C0410DF;
	Thu, 10 Nov 2022 08:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B8C0410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CWyYtzAGhsx; Thu, 10 Nov 2022 08:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33A3410BD;
	Thu, 10 Nov 2022 08:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33A3410BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64D4B1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 170C8410BD
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170C8410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeJMTZasHMAQ for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 08:56:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0375410B8
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0375410B8
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 08:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aImGKZH9VhT72ndchBN3HSdxppDNlKKYHoxs8r/zzYKFfA+CIVV1ymfOf50+KaON294M8ToEr0i7wlAFZEaYRIGlp7AzJ5js7Z3jgllDpv+PAV9kkqys24WKTTrfAWdvVBcyvkGJOGAFO0OaXRDfrJuiopjId1rIop89ibnBw1Qxj9Fm2Jj/6DTMiUVjbLUyUnyWDl+UW/HkCoeXAQF2F6nNr2uwKBA3xMZXpyw+UKRXFfVslv4r+yUQn/DT9abNkUPcU6vkI5FrJ0K+XiZYg2lq0bWwT1cuH9uJnuea6Y1yJkbo/7OXS7HzAApjw0GpDo1DNnqQ436WK/ZU0buKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkOOuiJHWegDoQ3keL3AFGoSvvIeDaF/OgaF8n0U+fQ=;
 b=aJze21yYSIIoxO31uChNSSfc7njgQuLhRFd7ax1dRdd0gQxH6CnucNKOTVz2j4yUXtCdgU74SQMHPYWoLlkUvwlvVlwmq1b6phrE+TT8bYfs1bUIqTCgrJDHC8PwWW1sWkE5hoq9LLZgOP3zrbwT5DG7wopeD3I0pb9VrGPAJfy65mZKoFtywOObxLjKb23Y3rD5cIgLG3MpRSSVAxnUnuk4rxlVmlXTNa0bCEtg8WfvyfvuEWNuVG/WJJDp56jzvxL3ZqqUhnd+ZSHDQT6eL4jwlbyclrhx2/n+51Gv7jVuTKCa/uavAKaBx7IdlRL6ue9fmurm9G0LFY9/2INLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 08:56:55 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 08:56:55 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 2/2] configs/versal_vck190: new defconfig
Thread-Index: AQHY9Btje/fKxpNlD0iFO0ixpgBZLq42rqSAgAAD1gCAAArEAIABHlQg
Date: Thu, 10 Nov 2022 08:56:55 +0000
Message-ID: <CH2PR12MB50045C678FA8C55C4A159E3FF0019@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221109155621.4af7f270@booty>
 <CC27D304-488B-42BA-88F5-0B13A7FEC403@amd.com>
 <20221109164836.60da738e@booty>
In-Reply-To: <20221109164836.60da738e@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BL0PR12MB4899:EE_
x-ms-office365-filtering-correlation-id: fb10d70f-dd8d-4179-a7a0-08dac2f984d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n79N/InW/k0oLD9ybqCaUXtOcMgZgZy5DlPYxFsFLAXkO6TTRK7jDyzoNsnhDxl4H7HkvjVz3ENdt9KIitF6gbKrDIBqaaQ+W7FtgRjgPuRfaUxRDoDKfGGhbCD5PTHSExgH2FOG5t4gsAP747rUiDw2gIgiBD2df9P9jRCbn5jpdLnLbC/wXdbajUGo4LDXc9GD4pAXHbs3BQgFYq1r1gq3qc5tNbPUVK7TNaXEKx6z4IlvEgotvV1M/PTxHPTn2OtAUP7F8uh/8DKcuN2T2eX0qvPLrMjr680HLDH0PD8WGUWoTbCFprRqaaf2tJt4tOKaF2pdok8/z0zXfEIEg/mIFllPx7eknnmMlXJc1g5xnNAcBvBYTrPCMTP9YNEr0/PEFUUUJLh1v3aCvgTKvI5QUkXKxaqSuv4jObjmsunADBY0O7CgDWf+f84vr4xDm+RsmTbYihzeIN0zkCEaZLZPh5m2lbWJRUdqn138NpLveE1AJ+DkLuVFN1tpejH0R6zNvD+zIOfeNBcreBC6lnsOVzO4iHQlvShwQ3GqsvtFNj3blKxG4qDFqacNmz6ACrvh/39jtk+tNSyYoqVW9IDjN+BW48hbeiZd9s2EV67qGhgkNNU6mqNAVCY8tUClNaczYdsK9AgmkVgQxeFeqSxXOAnACFjvCr7cvYrSQQbgI1/DKWr6XHVSvavhGCIUJPfOEl9Xn9w1S+qTWEGph8IridGUUEKrwXkRH7cOtDKt7us+zP0xaR3mwi1cXAqpeJM8X/8d2mEAn9BkJWdtKYTP3LqaM4EOhyl/Nuzm/4KBRxz4Ty6bADxFBhk60GDNwZg7+iF8B36tYnJy7GTiXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(38100700002)(122000001)(33656002)(38070700005)(86362001)(66946007)(76116006)(8676002)(64756008)(66446008)(66556008)(4326008)(66476007)(41300700001)(52536014)(5660300002)(316002)(966005)(71200400001)(8936002)(55016003)(478600001)(54906003)(6916009)(66574015)(186003)(83380400001)(2906002)(7696005)(6506007)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTNDbkE2MkhXQ1hvb2pSZzZuUzZqN294VkJDSXV4eEhHNHFVM21rT1lzbng5?=
 =?utf-8?B?SmhWUGMvcHArbWVxNUxFSVd2c2RIQXM2WGdyS0dKd2xHUXpwczQvOElBK2s3?=
 =?utf-8?B?WXlBeEd4WW83bDRyM1lwSzlkSXF6VUltTFdkd0ZXM29iZkZVMkVsTitmTFBT?=
 =?utf-8?B?SmdIRW0reS9wblUxNmNkdE1CU09KOXp0RFJwcTdlY1lRem5ob3FRWkIxOHpM?=
 =?utf-8?B?RklsSFBZYTJrbDlQelpwT0MxOVR3eGRRU0tYZXJoV2UzYThTVjl6RHJQemI0?=
 =?utf-8?B?UzN1OVFXdjdUR2FwYVh3dmNRRjNxcEFmNmNXc08vcy9uV0wrazMyZ242NTVB?=
 =?utf-8?B?dFcvZFRVa2Z1UTNvTlRWMEpqcjVva1NKMXBLQjhZSVV5dStIRjhuZ0JiVjJC?=
 =?utf-8?B?L2NpSWFFS1RMRGUreU93TDhJRWVjK3U5T29vdXpWbGlseWxPY1cyK05CZEVY?=
 =?utf-8?B?bEFncTNyWTdhVlRINlVOdHNWZi9TdklUdDJYajg3OGlIaWtxVmgveUJxUFFs?=
 =?utf-8?B?OGhVOEo2eVdVZkF0ekcrQThSODdTaVR1N1FIZWxjV2ZldDV5UVVoNm9VVWsz?=
 =?utf-8?B?WU9lMDRvTU9PcUY1Wk5mUTQrYUU4V1JGVThkK3V2cm9ML2xUR2JCVFovREY1?=
 =?utf-8?B?Y200TUtOeExVNWMyblhyTzEwSWFrd1pjbnhuZ0Q0eis4TlBEYmVhWEZwdThX?=
 =?utf-8?B?SGJvdktwQXhGUmtxd1ZwcjE0TWp1a1pBYndIK1JFRm02RnhnWktEWjE0NUxh?=
 =?utf-8?B?eGxTTG52QWc2S0c2TE8zR2RWaDZYQ29mM25DQTF6NWJsam1JOHhweTloMWNQ?=
 =?utf-8?B?eEErVTNTZkYxQSswRlQyMkNYaWhKYnE0MGtuZkhOQU9kcmtxaUcyRnV3bEZT?=
 =?utf-8?B?M1FCUFRqUG5GRTFGeHBITWFOVU5XOXUyZHJHQUNNaDN5T1JFcElpeEw0dDAr?=
 =?utf-8?B?LzNkMUVKYmRqdWdDczFndmFVTVhhQ1kwTDY5L0pZK1p0dURXMitzWDFLcktq?=
 =?utf-8?B?bVNBWDBMRkpJTEFTc3NYUTQ1cXRlN2VSNXpiQlF4Wjl2VEo0Q2wxMk1uK29O?=
 =?utf-8?B?YUxUMy9VVDNyYWVEa1V1aldRQ1RJWjZjQjNTVEZxajdHS1BYblh4SlB5MWNM?=
 =?utf-8?B?bk1mL0JEdG1xWERZb2dnNXQ0YTh4VDRDMnlma3N4bEhYYTViZW5SdXFjaUM0?=
 =?utf-8?B?SmhJQ09YU0ZLYVlYUEoycWVaZlFtV0FyWnBtdzAzSUgvSUV6bytwbWk3NFZ4?=
 =?utf-8?B?WlBIMFlmc1QrbTdHSVQrUHVHd0U5TjM2VHIyQkxlVTFEVWZZMlplWmlRSUhF?=
 =?utf-8?B?emtkRWxnYS8reWhLWTlVRGxRWmZnUUV5TVVFV0l4bVhOR3JlbnlIODBqWnBu?=
 =?utf-8?B?L2pzMVVlSERXTWc3MkZmeU1GQmxtYVZFaEJBUGlRdCtXK0FTZ2pzdnBCYjZu?=
 =?utf-8?B?UnU4K09TclYzRjdJRU5GOUk5ZURYUDA4aUVIVktBaEZ3ZWV4MlFXa2hJQVhs?=
 =?utf-8?B?OGh5NHhSaEhxS3BWNm9sYUwvdGRxU1JuN28yam93V29YOXNNZVBlVUtrWkVB?=
 =?utf-8?B?a2Z0SG92MU8yRzIvWjRuaWFVV3VHWkIvSGtkMlMwaEM1T1VkdmFiL2prTFhm?=
 =?utf-8?B?cXVNbGxDS2pYMGFGM01vSHNWeWlrUTdwcmZGUzhiYlEyNVRrTVUxWm5wY3dx?=
 =?utf-8?B?UnBBbXVaTitiRG40b2lCbFMwcCtVMGFsVVkxQzBEVG5HZS9QWVdySU5NOEx0?=
 =?utf-8?B?MmVZNVRSeUFDZWRINkloWEtzcVNSLytoZXlVNm9yRFd5WVl3OXBvMFBqZU9N?=
 =?utf-8?B?RktHQlI3TGxxRjZIK0Yzd25hVi9xMmQ1SGQrZVh4VVFYeVBCb0hWVGJHOXFN?=
 =?utf-8?B?SXBwZzl6aTJueEpFRDZPWlpKRnhLdHhoUVJ5bklTTEJMVDdCbWI2akZtd3R6?=
 =?utf-8?B?Slh2cFRac2JDdFRGWXlVaWdOUERJTTQ5QWNQS2lDcXVWZnQ3WEIrU1JtODdK?=
 =?utf-8?B?ZDdFYk9jM3lKYzdlYlFUYWFsdE9maEV0RjkzWGNoSmQrMGtRc2I0Wk9GZXZw?=
 =?utf-8?B?SWswNUV0MHZZYkp3SmdjeEhRczBhaXVGZ2lHVTVNNGpHVzczRGpDZFVMM0dP?=
 =?utf-8?B?TmRoZjdBVGNTRHZuZzdkeUFVNlpENUpsWVZBak8wcU5BWEVoRmVNOVdQbGd6?=
 =?utf-8?Q?BijvfX9e7BYXJ/5izh2kZgM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb10d70f-dd8d-4179-a7a0-08dac2f984d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 08:56:55.6830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqx7Uv+hPpKzZ+4+ob7iZzSXZUePp32PQkED7GAmJFbkNAhhnAzV1IfG839SbSJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkOOuiJHWegDoQ3keL3AFGoSvvIeDaF/OgaF8n0U+fQ=;
 b=1xBqVTix6+Fp5N5rY6/sgYjNLCxKpyzdvvHbWfgw7Ep7hut0s85FgTfwIv4JOUsT3FC2KHGupLKzSYr1R6neEuSQXbVyfnsCkIJ6fzjA4xwvvgy7ooTHAbvpQtmLh4aLbVxg716vIveDdfTODQg2mr7CpXYaOti7MxJqIKV5Xks=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1xBqVTix
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/versal_vck190: new defconfig
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "O'Neal,
 Terry" <terry.oneal@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBIaSBMdWNhLA0KPiANCj4gPiBMZSA5IG5vdi4gMjAyMiDDoCAxNTo1Niwg
THVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4gYSDDqWNyaXQgOg0KPiA+
IA0KPiA+IO+7v09uIFdlZCwgOSBOb3YgMjAyMiAwMjoxMjoxNCAtMDcwMA0KPiA+IE5lYWwgRnJh
Z2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cm90ZToNCj4gPiAgIA0KPiA+PiBUaGlzIHBhdGNo
IGFkZHMgc3VwcG9ydCBmb3IgWGlsaW54IFZlcnNhbCBWQ0sxOTAgZXZhbHVhdGlvbiBib2FyZC4N
Cj4gPj4gDQo+ID4+IFZDSzE5MCBmZWF0dXJlcyBjYW4gYmUgZm91bmQgaGVyZToNCj4gPj4gaHR0
cHM6Ly93d3cueGlsaW54LmNvbS9wcm9kdWN0cy9ib2FyZHMtYW5kLWtpdHMvdmNrMTkwLmh0bWwN
Cj4gPj4gDQo+ID4+IFRoZSBWQ0sxOTAgaXMgYmFzZWQgb24gdGhlIFhpbGlueCBWZXJzYWwgZmFt
aWx5Og0KPiA+PiBodHRwczovL3d3dy54aWxpbnguY29tL3Byb2R1Y3RzL3NpbGljb24tZGV2aWNl
cy9hY2FwL3ZlcnNhbC5odG1sDQo+ID4+IA0KPiA+PiBUaGUgVkMxOTAyIGluY2x1ZGVkIHdpdGgg
dGhlIFZDSzE5MCBldmFsdWF0aW9uIGJvYXJkIGhhcyBYaWxpbnggQUkgDQo+ID4+IEVuZ2luZSBh
Y2NsZXJhdG9ycyBkZXNpZ25lZCBmb3IgYWNjZWxlcmF0aW5nIG1hY2hpbmUgbGVhcm5pbmcgDQo+
ID4+IGFwcGxpY2F0aW9ucy4gIEFsc28gaW5jbHVkZWQgaXMgYW4gdXBncmFkZSBmcm9tIHByaW9y
IFp5bnEgYW5kIA0KPiA+PiBaeW5xTVAgZmFtaWxpZXMgdG8gQVJNIENvcnRleC1BNzIgY29yZXMu
DQo+ID4+IA0KPiA+PiBXaGlsZSB0aGUgTGludXgga2VybmVsIGZvciBWZXJzYWwgaXMgcXVpdGUg
c2ltaWxhciB0byBaeW5xTVAsIHRoZSANCj4gPj4gYm9vdCBwcm9jZXNzIGhhcyBzaWduaWZpY2Fu
dGx5IGNoYW5nZWQuDQo+ID4+IA0KPiA+PiBUcmlwbGUtcmVkdW5kYW50IE1pY3JvQmxhemUgY29y
ZXMgYXJlIHVzZWQgdG8gYm9vdCBhbmQgc2V0dXAgVmVyc2FsIA0KPiA+PiBkZXZpY2VzLiAgRm9y
IHRoaXMgcmVhc29uLCBjdXJyZW50IGJ1aWxkcm9vdCBzdXBwb3J0IHdpbGwgZG93bmxvYWQgDQo+
ID4+IHByZS1idWlsdCBmaXJtd2FyZSBpbWFnZXMgYW5kIHVzZSBYaWxpbnggYm9vdGdlbiB0byBn
ZW5lcmF0ZSB0aGUgDQo+ID4+IGJvb3QuYmluIGZvciB0aGUgdmNrMTkwLg0KPiA+PiANCj4gPj4g
U2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+DQo+ID4gDQo+
ID4gWy4uLl0NCj4gPiAgIA0KPiA+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy92ZXJzYWxfdmNrMTkw
X2RlZmNvbmZpZyANCj4gPj4gYi9jb25maWdzL3ZlcnNhbF92Y2sxOTBfZGVmY29uZmlnIG5ldyBm
aWxlIG1vZGUgMTAwNjQ0IGluZGV4IA0KPiA+PiAwMDAwMDAwMDAwLi44YzVkMzkxYjk3DQo+ID4+
IC0tLSAvZGV2L251bGwNCj4gPj4gKysrIGIvY29uZmlncy92ZXJzYWxfdmNrMTkwX2RlZmNvbmZp
Zw0KPiA+PiBAQCAtMCwwICsxLDM4IEBADQo+ID4+ICtCUjJfYWFyY2g2ND15DQo+ID4+ICtCUjJf
UEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTU9eQ0KPiA+PiArQlIyX1JPT1RG
U19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvdmVyc2FsL3Bvc3QtYnVpbGQuc2giDQo+ID4+ICtC
UjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC92ZXJzYWwvcG9zdC1pbWFnZS5zaCIN
Cj4gPj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0idHR5QU1BMCwxMTUyMDAgbW1jYmxr
MHAyIHZjazE5MCINCj4gPj4gK0JSMl9MSU5VWF9LRVJORUw9eQ0KPiA+PiArQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVEFSQkFMTD15DQo+ID4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJC
QUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLFhpbGlueCxsaW51eC14bG54LHhsbnhfcmViYXNl
X3Y1LjE1X0xUU18yMDIyLjIpL3hsbnhfcmViYXNlX3Y1LjE1X0xUU18yMDIyLjIudGFyLmd6Ig0K
PiA+PiArQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InhpbGlueF92ZXJzYWwiDQo+ID4+ICtC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkNCj4gPj4gK0JSMl9MSU5VWF9LRVJORUxfSU5U
UkVFX0RUU19OQU1FPSJ4aWxpbngvdmVyc2FsLXZjazE5MC1yZXYxLjEiDQo+ID4+ICtCUjJfTElO
VVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15DQo+ID4+ICtCUjJfVEFSR0VUX1JPT1RGU19F
WFQyPXkNCj4gPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15DQo+ID4+ICsjIEJSMl9UQVJH
RVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0IA0KPiA+PiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRT15DQo+ID4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9U
QVJCQUxMPXkNCj4gPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1RB
UkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIsWGlsaW54LGFybS10cnVzdGVkLWZpcm13YXJl
LHhsbnhfcmViYXNlX3YyLjZfMjAyMi4yKS94bG54X3JlYmFzZV92Mi42XzIwMjIuMi50YXIuZ3oi
DQo+ID4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJ2ZXJzYWwi
DQo+ID4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzFfVUJPT1Q9eQ0KPiA+
PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMT15DQo+ID4+ICtCUjJfVEFSR0VUX1VC
T09UX05FRURTX0FURl9CTDMxX0VMRj15DQo+ID4+ICtCUjJfVEFSR0VUX1VCT09UPXkNCj4gPj4g
K0JSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQ0KPiA+PiArQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVEFSQkFMTD15DQo+ID4+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9U
QVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLFhpbGlueCx1LWJvb3QteGxueCx4bG54X3Jl
YmFzZV92MjAyMi4wMV8yMDIyLjIpL3hsbnhfcmViYXNlX3YyMDIyLjAxXzIwMjIuMi50YXIuZ3oi
DQo+ID4+ICtCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0ieGlsaW54X3ZlcnNhbF92
aXJ0Ig0KPiA+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fTUFLRU9QVFM9IkRFVklDRV9UUkVF
PXZlcnNhbC12Y2sxOTAtcmV2MS4xIg0KPiA+PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9
eQ0KPiA+PiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkNCj4gPj4gK0JSMl9UQVJH
RVRfVUJPT1RfRk9STUFUX0VMRj15DQo+ID4+ICtCUjJfUEFDS0FHRV9WRVJTQUxfRklSTVdBUkU9
eQ0KPiA+PiArQlIyX1BBQ0tBR0VfVkVSU0FMX0ZJUk1XQVJFX1ZFUlNJT049InYyMDIyLjIiDQo+
ID4+ICtCUjJfUEFDS0FHRV9WRVJTQUxfRklSTVdBUkVfQk9BUkQ9InZjazE5MCIgIA0KPiA+IA0K
PiA+IFRoZXNlIHR3byBsaW5lcyBzaG91bGQgYmUgcmVtb3ZlZC4gVGhleSBob2xkIHRoZSBkZWZh
dWx0IHZhbHVlcyANCj4gPiBhZnRlciBpdCBoYXMgYmVlbiBhZGRlZCB0byBwYXRjaCAxLg0KPiAN
Cj4gV2hpbGUgZnVuY3Rpb25hbGx5LCB5b3UgYXJlIGNvcnJlY3QgdGhhdCBJIGNhbiByZW1vdmUg
dGhlc2UgdHdvIGxpbmVzLCBJIGFtIG5vdCBzdXJlIGl0IGlzIHRoZSByaWdodCB0aGluZyB0byBk
by4NCj4gDQo+IEkgZGVzaWduZWQgdGhlc2UgcGF0Y2hlcyB3aXRoIHRoZSBpZGVhIG9mIHN1cHBv
cnRpbmcgYWRkaXRpb25hbCB2ZXJzYWwgYm9hcmRzIGluIHRoZSBmdXR1cmUuICBXaGVuIGEgc2Vj
b25kIGJvYXJkIGdldHMgc3VwcG9ydGVkLCBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgZm9yIGVh
Y2ggZGVmY29uZmlnIGJlIGRlc2lnbmVkIGZvciB0aGUgc3BlY2lmaWMgYm9hcmQuDQo+IA0KPiBJ
IG9ubHkgY3JlYXRlZCBhIGRlZmF1bHQsIHNvIHRoYXQgdGhlIHBhY2thZ2Ugd291bGQgYWx3YXlz
IGJ1aWxkLCBldmVuIHdpdGggdGVzdHMgd2hlcmUgdGhlc2UgcGFyYW1ldGVycyBhcmUgbm90IGRl
ZmluZWQuICBCdXQgaW4gcmVhbGl0eSwgSSB3b3VsZCBsaWtlIHVzZXJzIHRvIGFsd2F5cyBzcGVj
aWZ5IHRoZXNlIHBhcmFtZXRlcnMgdG8gZ2V0IHRoZSByaWdodCBib290IGZpcm13YXJlIGZpbGVz
IGZvciB0aGVpciBib2FyZC4NCj4gDQo+IE9uZSB0aGluZyBJIGNvdWxkIGRvIGlzIGdldCByaWQg
b2YgdGhlIHZlcnNpb24gZGVmaW5pdGlvbiBpbiB0aGUgZGVmY29uZmlnIGZpbGUgYW5kIGxldCB0
aGF0IGp1c3QgYmUgZGVmYXVsdCAobGF0ZXN0KSB1bmxlc3Mgc3BlY2lmaWVkIG90aGVyd2lzZSBi
eSBhIHVzZXIuDQoNCj4gVGhpbmtpbmcgdHdpY2UgYWJvdXQgdGhhdCBJIHRoaW5rIHlvdSBoYXZl
IGEgZ29vZCBwb2ludCBoZXJlLCBhdCBsZWFzdCBmb3IgdGhlIHZlcnNpb24gd2hvc2UgZGVmYXVs
dCBpcyBsaWtlbHkgdG8gY2hhbmdlIGluIHRoZSBmdXR1cmUuIFNvIHlvdSBjYW4gbGVhdmUgaXQg
YXMgaXMsIGZvcmdldCBhYm91dCBteSBjb21tZW50Lg0KDQo+IFJldmlld2VkLWJ5OiBMdWNhIENl
cmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KDQpUaGFuayB5b3UgTHVjYS4gIEkg
YWdyZWUgdGhhdCBrZWVwaW5nIHRoZXNlIGNvbmZpZ3VyYXRpb25zIGluIHRoZSBjb25maWcgZmls
ZSBpcyBwcm9iYWJseSBmb3IgdGhlIGJlc3QuICBUaGUgcGFja2FnZS92ZXJzYWwtZmlybXdhcmUg
Y2FuIGJlIHVwZGF0ZWQgY29tcGxldGVseSBpbmRlcGVuZGVudGx5IG9mIHRoZSBjb25maWcgZmls
ZXMgdGhpcyB3YXksIGFzIHdlbGwuDQpUaGVyZSBpcyBubyByaXNrIHRvIGFuIGlzc3VlIHdpdGgg
dGhlIGNvbmZpZyBmaWxlIGR1ZSB0byBhIGNoYW5nZSBpbiB0aGUgcGFja2FnZSBkZWZhdWx0IHZh
bHVlcyB0aGlzIHdheS4NCg0KQWxzbywgYmVmb3JlIHdlIGNvbW1pdCB0aGlzIHBhdGNoLCBwbGVh
c2Ugbm90ZSB0aGF0IGl0IGlzIGRlcGVuZGVudCBvbiB0aGUgZm9sbG93aW5nIHBhdGNoIHNpbmNl
IGl0IHVzZXMgdGhlIHN0cmlwcGVkIHUtYm9vdC5lbGYgYmluYXJ5IGZvciBnZW5lcmF0aW5nIHRo
ZSBib290LmJpbi4NCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyMjExMDgyMDA3MDQuMjM5NTUtMS1uZWFsLmZyYWdlckBhbWQuY29tLw0KDQpC
ZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1EDQoNCg0KDQoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
