Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43605C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 12:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 979B6408E1;
	Thu,  9 Feb 2023 12:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 979B6408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FLiZjZ0bUdh; Thu,  9 Feb 2023 12:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 606704182E;
	Thu,  9 Feb 2023 12:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 606704182E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 325281BF5A9
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 12:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC77C41009
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 12:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC77C41009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pm-hXO-XeCwq for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 12:48:05 +0000 (UTC)
X-Greylist: delayed 00:23:56 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0856F404E9
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0856F404E9
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 12:48:04 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3198IUJK005650; Thu, 9 Feb 2023 04:24:08 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nhqgcbjkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 04:24:07 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF769404E7;
 Thu,  9 Feb 2023 12:24:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com
 [10.202.1.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id D450CA005E;
 Thu,  9 Feb 2023 12:24:03 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 73889A02B8;
 Thu,  9 Feb 2023 12:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWdwl8WOLLfAEvck9/NbznETOUzkD3fmn/WBAyBf1tnLnbQ63RN2EQBd1s7F8lgz/ZGtnbXFIIsFKz7KyEA4DnC7vimgsuDg5nXy7f9CFrEWdX+FMegNTLlWsKE9gXd1zSplTeYGYGJMeImgkV4hHa2aoyyUr+BbAYmOUpDLB8cLu/fwbXt/Ck8AzOqLsX4n1VLBM8EYWc9KeA/5S3/HnnpqiQEbJPai5i7rSZ6QTD89vLpqA042iocZ48cYMB7cbfHdSoeREFvZoaY/pSDScIMoAISZ6HXLm0Sfo71cnc1CqUjf8KKeX+eJSjqI2K89SPsEoQ3e6VU6CS31+UTIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCMxf10oa7GWsVjT4VmnF0f/sGkpVVhbY9vFh26CFt0=;
 b=Xnr3MF+AFaQUsDOvzCXtlx5dJVJ3zp7fFlBSypZdA1u61dvmfR69qUpVEN9PCwjDjmTXAhGVAuq6harlS84HcI9EOPDgcPrxUkzJdhifDO//E2wnWnvGT8xLFwIDa8USWDciu7ztDz1zsz+f5/MaQTuDP22b+hLtMYPxzhuXrbg5CRvTDkBQZ7KjnE6vHoxPJ5/gTgubBE5jVut40Ln3beupjCoijJbGWBgLpjYz9tpsQpPxjj8d4Xy6nYU4zsBQj+sW7FdLvDdJyG03N76F6J7hNahKtyMjUKy5kgkUf/oHq9PeLcVw1RI1AT3oQX5JNqyJhBmVcztPElqZ9Iq1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by MW3PR12MB4540.namprd12.prod.outlook.com (2603:10b6:303:52::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 12:23:58 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::f311:9706:76be:bcf]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::f311:9706:76be:bcf%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 12:23:58 +0000
X-SNPS-Relay: synopsys.com
To: Arnout Vandecappelle <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Thread-Index: AQHYgKa1M48yKL+fGECWDKsB+ehK1K7Gtb2AgAFLvgA=
Date: Thu, 9 Feb 2023 12:23:57 +0000
Message-ID: <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
 <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
In-Reply-To: <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB2782:EE_|MW3PR12MB4540:EE_
x-ms-office365-filtering-correlation-id: 233ec4b5-1b1c-49bc-ea85-08db0a9884a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YPN30GjczeaGqxcElFwNjvtdzZVNEEd75mF5AiZ9SZFB3j3a61BArOP60D/Bm3ihq9WrC3TQQl/oHJ6k044ny6PD3UACh5InoqUNH24CTTw+K5BZO0fv5LOqiYZOugvGWD7hp34hytibc02Csw1C3Hmc5n7zSNqBS+WCRAORgKJDo6BjP5aTL8rXJHuRS4GGTArdd+qTf7bhf3mytAXTlqhfr1fxPFF4RS2/x7UU6x6dJC3ATpm+oAC7YorIQ6SxkoU+Andsyhl2bWVKXXtZ2jvSAYmwC1ISmK3jpMB1PYPSIF/3dAv2wiNpg3sjUuGQRvnY9TqKvH+YP6dF1SUIRUZeghxTj9wN02efvbB9QNvQFjWF0TKFhYy39GjB6D4/OxL/WRMVDOOvJl09I7RBJ1+PDYh/BS6ScYB0VVdfrhS7JyNomM7+Pqg/Qz1/dFe1HP+ztwbo2GsTecFcVnQWF89lfh5Ek0ApktBA2dixjOom3AgtC1KfOeeJDXmvdHgwDZzbp/XTHOaH5I8hoxCHmbgM5VsjLzELJXBUOZ2EdD3reLlWPDdbjW2ebsoA4oAzpIjbv64BH4k9J3o/PsLjF5SEj6qQurtnzQjhULR47Y+tBIzcaXtwbTYlA4Vpm0BihCqFlFtgYIyQ5Vzg98LSnRHD28xWP0m2THGYBTHbPkf/tXSHsfj/x7WGXoA5ABHpUW2aQl0No77FegaYof+kEwCqKZAIDrY+Xw9NqooifEeQao1Spq2jgg+F+TBMKkUl0QBGKhu8AogwMIhbRoMecA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199018)(53546011)(6506007)(107886003)(316002)(186003)(6512007)(8936002)(478600001)(38070700005)(2906002)(71200400001)(54906003)(83380400001)(5660300002)(36756003)(6486002)(966005)(31696002)(64756008)(66446008)(76116006)(66556008)(66946007)(66476007)(91956017)(6916009)(4326008)(31686004)(86362001)(66899018)(8676002)(41300700001)(38100700002)(2616005)(122000001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWVVT1pCQ2dFc29GNklITEZadkZ6QTIweFhvMzFlV0laNkk0R1pVQklQZGE3?=
 =?utf-8?B?K2grRVJjWXBUNGhPRUF2NFU5SDloN0w4ajVEYkE3cDlncTF0UXlpZ3M0eDl5?=
 =?utf-8?B?YnFrbFZPYURDSHlDQ3B6eGtpcVZkR1loVUhvOHZ1RVNzUlhnVmFsQjZxaGln?=
 =?utf-8?B?djJUWUFNaUE5R3czZEhjY1I5T2JxenRsSHpFeHljeWZiY3I5UjhTRVdWTTJF?=
 =?utf-8?B?Q2JKUVkxdVYvbkk0NWV6NXBCWlNRRTRJenovTWF5TmhHSlp1dENpUTVaZGZs?=
 =?utf-8?B?dTdsMDI2cGdLWjF4TFdqSFFaK0xXcTczVnZEQmpkTWovR2s3bzAxYkJRUHEr?=
 =?utf-8?B?S2VwdWZTdnBibXdIc3VSeDArdk1Kb0hBU2toYkFrNEV4MUV6emtuZTlvdWdD?=
 =?utf-8?B?eFErcmlOOUJoV2hkeFlNZFZBdm4raVJaa0JZQkRlblA0SmtLUy9GbHFtSHkr?=
 =?utf-8?B?aGRNTUhwSHQ4MTJka2VkbzJHVm1qSmsyUHhTZVE4RUVJZFRNejhuUVVSZlZP?=
 =?utf-8?B?VUNUMkFxc0RhQXpta0RPZCtjSXp1VktQWjhCcW9VWlQ0TUF3VkxpdDdwNDY3?=
 =?utf-8?B?QXZrQkJWUjR0RGJiQnhoMGRiNXp3MkFMMVpUL003bE40SEhReU1vU3V2QkxH?=
 =?utf-8?B?cnJsZFVUU1JIVGJ2eDJNYkxHMm5BMjkrdjAwL0lVTTVCWmkzajY3RmJBenBQ?=
 =?utf-8?B?Uit4NXk4NVRuV3lsc3Q1Q0VZSU1vVmdLc3B4MjhuQ0NyUnhWa1NCNHBWb2JD?=
 =?utf-8?B?WEZybytqMzBFMk92c0l3c1ZBOGEvclNtNDV5UGp4TE94ZnpMYkZzcWd3T3ln?=
 =?utf-8?B?TjNQMDJ0WE5WMVR5YlN6VXZtSlRlQVlNN1VSM0R5bitNK0xHTTN4djZSeVA3?=
 =?utf-8?B?NWtjV2NDTE9uZGs2ZW5xckhKMWNuT0ZoZEZRYWFjQ09hc0lRVDh1OVhpYXdL?=
 =?utf-8?B?ejgxdGJsM0I5MFpWd0ppd1BOYzFGN0tvWXRYWlRHV1FSamc3SXNKOU9lMDlw?=
 =?utf-8?B?dlBSR1VRUlU3Tm5UM0Y4OHk3SEdOYS9qeWovdGsvVTh0ejgxQ0VuNkcvcXNM?=
 =?utf-8?B?aEM2R01HRmVuRGtOME94S3o0eVBtK1ROcmsvZERJZVVkTXhXRWdsZlFkU3BN?=
 =?utf-8?B?cWxURytwVlJkVkFPNWEvSUxrNFRwS21kcGJaS04vVGJpZmRXOXpDbkpVZ1kx?=
 =?utf-8?B?bk5sNUpmN0o0cjlSazZGSWVIWE9sazhIemxVK2h3RTVoMkRCNVlxU20wU2FX?=
 =?utf-8?B?SWRNZGdlU3R2MVlJMERpWnNoeUFMWkt4QWlUY0FNR0tJUlc5a09XcStnNmpz?=
 =?utf-8?B?TFIwUURYdjNGMjRGZW93T3FNS1hpZXBQU0VuNm1IUXRLZ0xKL1Eza2tXNmlv?=
 =?utf-8?B?bFZxZEVNRGNIeEtEZmFMcmtidmExM0RTblh1emZ1OXUrdlhPOXdaOU5NZitZ?=
 =?utf-8?B?Nlo1VkI1VTMwN1lPNVZlSXEyYXd5RVBZSHQ1STZ2eHNrdnZWaE5WRWk0Mm1F?=
 =?utf-8?B?KzcwMysxS1c0OHAzb3ByNUNkN3M4c3B5QXlNOE5ndUdhYXVaMnFudHhiN3Ja?=
 =?utf-8?B?UUVhRzFNUXNGbC9OUzFoQlgwY2N6U1ljVS9BZENEQ08rbGRpZk1yOGNmQnhu?=
 =?utf-8?B?UFVOalhhdUtrS0crQW9mZWlZUExIbWVGbUJYODY5T1ltdTU0cmdEUkxjcHF5?=
 =?utf-8?B?SURUZ2NQdnplU2JSRUlPOE5xT2p4SVYwa0hQWlZFV3MwMzIycU50bXRWNGhu?=
 =?utf-8?B?VVQyekZSQzJNQ1hXcDNWamtUdkFhQUhYQkZDeGVqNEVCeUZVZnp6ZnpoMjFm?=
 =?utf-8?B?dDJ6bndZSGN3UjNvenpYMVQyWjZjSG1iUGFGVnRWVThRc2hNMzM4N25oL2xa?=
 =?utf-8?B?TTFjTmVMMWRTb2FSYWdEaG92cTYyWnNTdTRxZzYvSGhjRjJrUEp2anR1VG5N?=
 =?utf-8?B?OXEyUFJCaFcvTVlCSjQ0dGxmeHVrOEYvU2Rndyt5aHVTTDlqK255TzNVNlZ5?=
 =?utf-8?B?cVFDRVVlVDRYS0U0Uk9FTzZVMzdwZUlxNzBpUXJUVy94ejFwNk1ETHUyZzBC?=
 =?utf-8?B?QVVyb2pRdndDRmVZaitJWng5TVd4ajNWYXFrVjkwbkxNTDNvazNzT01RcnNS?=
 =?utf-8?B?bmNuUXp6UDE2QVZxU0M4dXNKUDF0UnJ5U2d4QmJwTDE0dG9KZ3lEcG91d1kv?=
 =?utf-8?B?SXc9PQ==?=
Content-ID: <A6B1AD845B699749AF1C010272B51236@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1CB/WpWmRH8whpO97XFelzQ7I1JsyG9/yAmyDXfIyI72PBJPfmzp4QabMLOrx+nJX928BLkhpR0fior4yeoNUxgQ3d7kruKRqzVDhP1KvfnrwdtRZ7Fnyn2Z2dK98Cw+ExWC4DGZoNSu4Kb0yFrzmjTWYc2wOPVPCpxbpXlRuNGb1YWGn6XNTEXE9eZcrzVSi3APfSRLFrbYEqKsLchjHim8gvbPaWc0QozD9BijtGizKZTNNzZkKQ1wWNMqnfiBieUsyepr06JNRZzgcU8KyN4ARVJmsdKAM9CUw/2TygsXz0v3MBeQSz0Qlj/wGkDqkKgnrHqTSivHTO4xUiWBftwxlOd3HiqCujwMGd2v9840JWy5fxyHxWyT0rDnimHLWhGO2MYu3huK0jy1OTJmx4dV9bqSTGb8cVjaQtWNitkfkr+9h3xPYwi76Wpznqss++4UkSAHTSMVcmTTXL8Ly77Q6Di1zH2YbmnhclWEPO9ytuttT0Dsz1FW+av89pHGQVFOAAp4gewtQsB3FSaS/FSXSgrqWskbionLDHe4eON6lqlBL+8xpdfZkALDqUrXbRGJilpn6k5jiLtaBXo8RWBze4K9j3S3yYoN2474uO+w7gK4wYRqCCYkS4r62I4PAkVZMZUQv+bK+l629QlPn1C1/wWpG2SHDdkUNIw66i8huLxv/tjG8iPSAvMWSAXslSXvqT7+hTza1jrqNL8RdNhfWpae2Vrfxq9lNmPIbDL3TDO147vGZQCNu/EGozV+SDmdrZaX5d32dLwXcqnedVTI5SzJuocfoZooaN8gLDUwbGLMfCf4GO8DkUa300iOOgQoy3i4H4SWYfonoOngT0YkabGnyqDyFkSmvHoCdBDTtxoxBJ5w4/ZgzYVS+I7T
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233ec4b5-1b1c-49bc-ea85-08db0a9884a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 12:23:57.8942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4G0VucZsPM3IgqFG6cmr/NiwNNDuHVpSd3Kgzylo5qAcaoIADZKtYHKtuNf17UoBKCib6pN4dATlbYfizvbpjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4540
X-Proofpoint-ORIG-GUID: RKZ72zYw10c5BF7w4YnwXOaBVeQSCiTS
X-Proofpoint-GUID: RKZ72zYw10c5BF7w4YnwXOaBVeQSCiTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_10,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302090119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=kCMxf10oa7GWsVjT4VmnF0f/sGkpVVhbY9vFh26CFt0=;
 b=sCSDddFybTL7kJU5hWaJ/4D0oiS0F7sGINOegAKTQuERJ0fo1X/lCejCi3UoF4vtj0Zx
 xvFdnzCpTYkxvXHfBXgBxsgJMOZ0mFr+wfso3ijvNJB3zMpXq1zio7mFnu7J5uhoOKy+
 i+hBlQd5kAt/ikten/gTZIoAtMNvUugH31ojl4MDsNg+YkH43SwPNGm7efQRp175m4na
 hRKljJKsjHBhCI2jt0jpmko/RnSAKJbXPW0rpItFc3JTL+2uhbcBxZHMRUrTwGbB8ZSY
 n5ek8dQe91q+rRZf+sOkRZJtaQkzhD3csJNEv+ugZW5Ri/wPhv0P2MoSrfvesoJzW07q aQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1675945447; bh=kCMxf10oa7GWsVjT4VmnF0f/sGkpVVhbY9vFh26CFt0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IIeba6MUtRZt0BUXhkds0qIFvGKQOH3Fw67zuvyxQR+ZZ6yl+0d/8liTfdu08gsh4
 DVpwkPyJooHPeGgZjlG0RJZOZ1Uuct1h5nOSK9XQ/IrtrSLA2xsRIO4qJ4fZyo8EY7
 JTbbWmaGKMHEK1soP4S2RF4+Iyrg8I7nQbv5FaKOUWw8eddDHjtlDAs4vBSaIpvBHO
 GpUdAQC/mEIy/g9csLwu71dZpYzgVpSoRGcj2g67cNWeeLJBx1QYL5PJUt3WmZBrdn
 EY5+4IhGQYAQUc4Pkebk6eSMsmgjcoDVUEV/I50C9+VwO/oCQsGVbM8drDCkDhxHz4
 keB0OtefKcLlw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCMxf10oa7GWsVjT4VmnF0f/sGkpVVhbY9vFh26CFt0=;
 b=UukdfP6xhd3XgLFbRT3V8xElVP4OLAxrImGRAAhhlrVxw+rw6xit5dXnkzAFynRWHi6mg3xjJG9FDmUIeCRijanIKM1+mxWfPa65OWoaQDms7t6enhqkbcUtMdiHBo+fcsWO34uf8PxKse7BkQzgj8JDzgzcp7CSd5um9EHFyws=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=sCSDddFy; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=IIeba6MU; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=UukdfP6x
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
From: Shahab Vahedi via buildroot <buildroot@buildroot.org>
Reply-To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On 2/8/23 17:36, Arnout Vandecappelle wrote:
> 
> It's not clear to me why you did a revert of the cookie feature rather than
> using those patches. I think the first two or three should be sufficient to
> fix your issue?

Ideally, the correct way would be applying that pending series. But since
there were comments that some of the patches might need reworking [1], I did
not feel confident to add them. Therefore, I tried to keep my solution minimal
and solve it by eliminating the problem. I know, it is not appealing.

> For the time being, I marked this as Changes Requested. If the upstream
> patches are not sufficient, please send a mail upstream (as a reply to that
> series) explaining the problem (again), and re-send this patch to
> Buildroot. If it does fix things, please send a mail upstream to ask to
> move the series forward (explaining the issue you have), and send a patch
> to Buildroot that adds the needed patches.

They (re)confirmed the issue to me in the past [2] and are aware that its
solution is missing from all the releases onward (see the first point of
"Known bugs" in the release page [3]).

[1]
https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#rb9ce86e9f25b2d097b88d87af8ffdfa401d63c68

[2]
https://lore.kernel.org/bpf/b1a604e1-be09-ac0b-ff22-b194ae9ce886@isovalent.com/

[3]
https://github.com/libbpf/bpftool/releases

--
Shahab


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
