Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDB0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 10:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC988141E;
	Tue, 19 Apr 2022 10:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4OZmnjpjwJb; Tue, 19 Apr 2022 10:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9578140D;
	Tue, 19 Apr 2022 10:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B12F1BF8B4
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96E41612B2
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="eZKIBjHo";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="IB5GwNB3"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_C4Kv51n6CA for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 10:19:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61A1D612AC
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650363558; x=1681899558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PbDp6wQHZ90WVGCFNE7/Ht6quYirHOPrJEObZ+QoH/0=;
 b=eZKIBjHoU1z0p/9N+VuyZ1pOjx48TrF7/oCvXnm2vxfee0lhB3aH4wLD
 rDML8wclwv58xDTG8JWmHheV35yiS+607uAvrUAY6+BtC3Cq22FiSCzU7
 jtewuefLf0wMV+0igGcKJqt7MvCnUNH18y0FndAsaqsTrcCGT61J6Nxq8
 7akYjlo8/46TynzoFIjr/ixE3qBQM+f1oPv9sJxloF6f2quCPQhhorY+D
 suk6treBQUFvRVPAYCnPiAW6SAWv7bV+2Z5LwMPMuD0zSx+ICB12ChUnp
 d6M/W2oXliD1y+31fQWhMhRHEC4WyNHr/Dka5zEIGK2ULRKBgM21WXKr6 g==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="153050597"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 03:19:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 03:19:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Apr 2022 03:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0FCPbaBh/tVetHR+O9FEv8DQlEsm9WEdM5ALn0xzknaAfOgir27Hwp+WIr7UxQzh5V34Jvw7I9eCRNtmvR3oAI7DQk25ojiFRIPFFE8s4m3D4cVPGH+3UvaqlNazqRcQG7zTKvKXS7VrLvpLbUKB9FXJzoVWv/23+/NG5wjUmXLutn+f45dir6kArN8c5jwOcYbLsMGqfUyoKW4eegEtnNropdSZFkqgxcXcgHlirrVz+4iCgUHyOdVa4DoePYRa7q535b33vEbz8VYqnrZQyIqyp8LSRgd/199L/TXHHaerBEqxRWxBpPnobQBveXjVrVH0zESDQ7NGiEOVQtfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbDp6wQHZ90WVGCFNE7/Ht6quYirHOPrJEObZ+QoH/0=;
 b=A1QYU5ztAcWEtEEwYEh+ceUc919O7L1GqDhbEHIVLFow2cD3XG9dSnhSzpJsaaIiekcuLdLkXGzWw7RNg3K2CEDU+5jqep5C83BRqsq+kO/LLvA5DY9BgY7iRKE6g8cNUv/fjuh8ZqJ5nrqPxP95Uo0WdHMkwIC/OUAJNgCUoOSD6+IIyXUCa5M9AcMxwHm+TjqDs8Xu9a33hW9ttmw/tof99TOiDPVklO2jd/FpLjp3Ji3mjTJqDUoV2XN9G+RqEFt+P2dEz7PK9j1w9vmzbsQS3RpKHfjYLq6hUUyhZte7nMYnWFXjDFrbBfKejg1MDZeMYtC+LPprT/RkkJDLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbDp6wQHZ90WVGCFNE7/Ht6quYirHOPrJEObZ+QoH/0=;
 b=IB5GwNB3pozM0d9eg1MNioaBCNfM5LlVWPGwW415kbDd6h4jLvUfZauk5KjkJi7xMeoWhYpnb+rrph65enJnaCdcWsvIUgCrTFrK4V11/R7oadF++ir508nltZxDxYRHQ/pB0QwhAmmFK79LAnTPLKWHR1NmGMsIskQFRo3HVY8=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by CY4PR11MB1334.namprd11.prod.outlook.com (2603:10b6:903:2e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 10:19:10 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 10:19:10 +0000
To: <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYTmEZ03FYkSO1E0aa3ZrEpJPiy6zsKDSAgAAOXOOAAF/EAIAA5G6AgAAJoDiAAZ23gIAADdeAgABxAwCABxzhgIAAP2AAgAAT2AA=
Date: Tue, 19 Apr 2022 10:19:10 +0000
Message-ID: <2a14aebd-8213-0966-b0d4-392ca9ce36e6@microchip.com>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
 <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
 <87bkx5crop.fsf@dell.be.48ers.dk>
 <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
 <CAPi7W82XAg4jMw6z5LR=rg-HoZGBbfDC13XbpXtr0hppW92QEw@mail.gmail.com>
 <CAPi7W83uC=WLeMufRy9OC2G2m61BtUu1v_KX-nuiUBRFTwd8sQ@mail.gmail.com>
 <f10430c3-6805-eadd-7161-82db2309c198@microchip.com>
 <CAPi7W81tjVJ66QKgGVWHqytr-rakz4b6dK2TKVR7dc=tPiaxQA@mail.gmail.com>
In-Reply-To: <CAPi7W81tjVJ66QKgGVWHqytr-rakz4b6dK2TKVR7dc=tPiaxQA@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1efd2bc6-369e-4abd-1494-08da21ee0b5c
x-ms-traffictypediagnostic: CY4PR11MB1334:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1334F6CE4C9DB04340370525E8F29@CY4PR11MB1334.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T84irO0YpHZPBlYlnP0v10lpRfjt9uiTek30E+NWIPXvwQK+JViF5UQugVZGbPT3/PA06NJFTDYCwbnGyAjgPwE4Bfev28EXthwQgY2EzynlrUO8ar/yhG6ZEzeCdhsp2orf3TRVao2ndq3Jz2sDA9Jav9Ns+Rbv/9AYC1lS2D2wS1oY0ZJX4d7DkZ8zSksiMNlR78JOvs0jUFgFb2LGvaip+JWqT3zw6G1ChblXouHlPHcdRNAtKea2urL1NcuG9pRxz4mOkLv7Q7hbZ1iu+f9cnh6laFS2hvDz+hT75P58butejKvTIIJcAuKrmF/VSAM8IWDyeC8XfhXL12wKLnAYchI5k/LjfABTKCH2CKJsqcgRom/YJI9xlf9uAtJ4puUg0NjKAXxipGDy2GfD+m/jXJ/7QI32QUrhwLPFPCCEudH4nqdQwE5Osr90LS5img7qo3dQeOlmT860SOd2o1rxgn9/cMgGb7RLCTBMZA8keOGuG0GggNOil3aiuaWqWzyywd1IBlwXLLIw83oZd56oLRgPZQLkyvO3J4Mgiipm0lU9e5vDOn+1e++R15imPaoJOLTmw9ATTIxC95v4ovQ/r6jAMcm1jcT4uGpb3CU1o0RmodctQ0B8JJxN4ST0/eQF16wV1tqIdFg3bZeWhI+DSgo0lH2KrPFxj+6fpGHsKe7bi9LXVopKawymnMexl9qE0o/7d0eqOAp1jWNnBsQb5LQJFzcQDB91LRJ7FsBG15WzDqxFef/GlTeVnQqPnfIE4oF/k9iaByKuVSrMFl0hslMjX2qXEW8ufI2tkyHUjOu/sI8JSNgOpC917+MjQr/9QuWmekP4gJ/iP/1WkQU53o9swHu7H92r9lrAW1w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(31696002)(186003)(26005)(36756003)(83380400001)(86362001)(5660300002)(76116006)(66946007)(45080400002)(66446008)(66476007)(6506007)(2906002)(6916009)(31686004)(2616005)(66574015)(54906003)(91956017)(53546011)(6512007)(38070700005)(64756008)(66556008)(316002)(122000001)(6486002)(966005)(71200400001)(8936002)(4326008)(8676002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDQxejRIZ3czVFNtZDN5djlObkNpYmVybmFzenVUSUhCWEhkQ3JjYVFKZlhm?=
 =?utf-8?B?U3pxOE5YNzI0Zmo3QjlNT1lkV0xFcXgzUEZuYzdYUUo3Sit0aGZuTlZlSUNI?=
 =?utf-8?B?UVBSMjdESExESkFaZkZqT0J3Mm5id09SZTVYQWZqVEgxWUVBTGRYaEc0M0Fu?=
 =?utf-8?B?WW9kYy9ZTG9UeGY2NDB2Ni9mSDZyMyt3N205OFFTeEhmZzZhRVR2SENDQ0Yy?=
 =?utf-8?B?czZrejFoWjUwV1Q3V2gzMGRNY2Z2UmF4aWh5dWhsV2dpZmY1NStrNm9sb3hw?=
 =?utf-8?B?WWs1ak9lL1BnOXRBU0lRdWh5RDBQbVpOZWpsOWpELythclh0clpvVFc0RHVG?=
 =?utf-8?B?R0w4ODFMZjhSMDZKT0xReXdtMEdoTUhnK2VRM2lnd3NKU2p2S1BzUUhISXZT?=
 =?utf-8?B?STdrR3R4Tkh3aUJQT1hHRFBoMFhEZi92dzRrUGkrdUhnYVFtOUhub1ZXbC80?=
 =?utf-8?B?RU85SFpxTG05eStNOCtWdkVBeWR1cjRUUXBOUHhMUWVVOG1ZUHh1RDNqTGhH?=
 =?utf-8?B?QlAxOUpoYXhaTGpoSmRsUnVaL2tVSjA3WE8vRy9aRDA3elcxcDdwYXhrQWUz?=
 =?utf-8?B?Rit0MzBGMWk3UnBkcC9OVFB1eU5aZ3RUdWFRQWt2SFVTSkJJb052bi9tbGJO?=
 =?utf-8?B?ZTF2c3BQZ1dyVHJ0V0hBZTg2RDE3aldYaU91bEpCY0RWRWlHbE5wcGxWdlZU?=
 =?utf-8?B?cy8vRDJONE03aDlTcGF0T3hlLzRqTzBNTW1PSmkwMEhIOFE3V3RJbVZDYmZS?=
 =?utf-8?B?aC9BU1FRZjB4cXAyeEVybEJVdmF3OFg2UDVqNTlNWC9EbVBWNVJ0d0QrVTZN?=
 =?utf-8?B?WExrWm5KMHU3N0lXVFdHN09RQzZXWHFkMHhJMXhqeWdGUURsTU5FMzJRdjgv?=
 =?utf-8?B?VzRPd2RTSU5udEVueE9aT1ZCeWNNN1hPLzk5TlcxV1RFMVdkV3ZxV2lSUkhF?=
 =?utf-8?B?VHorU1AxSmY1c2JPMW4zRUVUTnEza2JURnllMkpDOUxpWnpuN0lNNGFQVStL?=
 =?utf-8?B?Rkp1QkhPVnNKb01heDZ5ODZ4TTgyK2NiQjNlTlA2L21pUVNmS2hvb04vcVFl?=
 =?utf-8?B?ZFNjbGN6UjlyWU5BQk9wcmNrVHE0UzhzVXBoMkFpYnFtdm1QYmFsT2RDcWxo?=
 =?utf-8?B?anZNaXQ2RzIvZ3dscnhUVEFBdHZtWlgzZk9WQzRTOUl5WW5kalNUYVZraUdu?=
 =?utf-8?B?SjNVWDFrYTBPWmE4aE5odHRUNlRSd0ZhRGlhR240S21qVmx4U0JyU0cxK1B2?=
 =?utf-8?B?UFNwRWZ3UE9VVkxCeGVmOFd0T3NUVjNVaGJSZEVsL1ovazZPdGpsR0t3MTNy?=
 =?utf-8?B?ZkViZDZPSnBiUmMyamlJTVhCOVQyNm5XbzcyODEvNndOYU40TW92RDRZWVJy?=
 =?utf-8?B?ZUdYWkU0enJmQlplT0pCM1dEaEpYSlFDODNsYmJjWDIvOHRPa016OFQvT2Fz?=
 =?utf-8?B?dS8yc1ZKb0pYalJKYXIvZXBSMnBHeFlxcG5IZ0FIREY4NjVoOHVlbG5lTHlO?=
 =?utf-8?B?ckZubXA5R0tCNE1vNXdVZjBlNHNseUJSVTVuZVBjZlRVV0VrcWlKUkRjS1hn?=
 =?utf-8?B?SXhrTk81V1dYMmVWWVZZcFdjZkRGNTE3NkZNVzJ0U2tReTJaNTQ3V1phSng0?=
 =?utf-8?B?VEUya0dYeWxSM1NXRmFoRGJCTkJnVURZWlkrc1Y3OGR0eHF1d2ZwQ0ZhRUlF?=
 =?utf-8?B?TUNhS0x2VTJaTmZNOXQzMUJHRGVqNHAxck5VSGFQMzQrRTcza0o1OTdkNWRn?=
 =?utf-8?B?WjdVK3JFOTVUMXcrUk5sYlBEV2hTMUhCa2F6cXRoaENnQmxzSFBRUnk0UzR0?=
 =?utf-8?B?S0t4NnlJT0tKVXNqakQ4UVFDeTRIdnEwa1JoemJoVlYwNjcxY3dyeGJSMEEy?=
 =?utf-8?B?dTY5TE1uR05IUGpMd01kaGFWRFRBY2VEcXY3d0lMM2J1b3NlMmU4cmdiaWsz?=
 =?utf-8?B?aVU3VTUwNDlNV3NtWEJlU2lJd0RNUTJUajRWT25ZVnhkcHhWQWhoTTg2bEJ5?=
 =?utf-8?B?Q3gzS0l4NVRrOFluZ1RRa1FNY3pSUlZEZnIyNjBVL0dXN2pkaFB0T0s2NjlB?=
 =?utf-8?B?a0d6bzZpTlh3RTF1eDMrc2k3TFpUdW50MmNlRk5NekhnSSs0TmExQlpMblhz?=
 =?utf-8?B?RFA4ZWF5b3F4Q1JVbUpRWFBvYXJZbGZuZE1kb2luejNIVnJoa3ZCZjVNa1hn?=
 =?utf-8?B?RUp6bHUrK3F3aTF4TkVjeCtLbnAxbExMSUorSjhWcEpPTXY5NURlMjlGOTEw?=
 =?utf-8?B?STRROEpMYWR0dTZCbXB5eVV0dkRpYVcraThla0NiTGtjN3NjcXBNV0tBWER4?=
 =?utf-8?B?WURiaVFxYUJrWityVDU5SDNPQnRwY0QxMTh3bEE3QTc0MElNaG90L1U0dEN3?=
 =?utf-8?Q?l8VMmCcxl4XgQcnQ=3D?=
Content-ID: <35C6B57AD60A184DAF3D8625D228BD1A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efd2bc6-369e-4abd-1494-08da21ee0b5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 10:19:10.2394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuS/Q2lACQB9Qvl6d3Ap5/NZiP1cKtgG1WHgIpDFr7GxOVTLUtH8qVtbeRBzXkz983DVnoRhc7eCc/aSn5RcazHiL/BKQziymGVdsiYlsno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1334
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
From: "Eugen.Hristev--- via buildroot" <buildroot@buildroot.org>
Reply-To: Eugen.Hristev@microchip.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNC8xOS8yMiAxMjowOCBQTSwgRmFicmljZSBGb250YWluZSB3cm90ZToNCj4gSGVsbG8gRXVn
ZW4sDQo+IA0KPiBMZSBtYXIuIDE5IGF2ci4gMjAyMiDDoCAwNzoyMSwgPEV1Z2VuLkhyaXN0ZXZA
bWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOg0KPj4NCj4+IE9uIDQvMTQvMjIgNzo0NCBQTSwgRmFi
cmljZSBGb250YWluZSB3cm90ZToNCj4+PiBMZSBqZXUuIDE0IGF2ci4gMjAyMiDDoCAxMTo1OSwg
RmFicmljZSBGb250YWluZQ0KPj4+IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gYSDDqWNy
aXQgOg0KPj4+Pg0KPj4+PiBIZWxsbyBFdWdlbiwNCj4+Pj4NCj4+Pj4gTGUgamV1LiAxNCBhdnIu
IDIwMjIgw6AgMTE6MTAsIDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IGEgw6ljcml0IDoN
Cj4+Pj4+DQo+Pj4+PiBPbiA0LzEzLzIyIDExOjI5IEFNLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6
DQo+Pj4+Pj4+Pj4+PiAgICAgIDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdyaXRlczoN
Cj4+Pj4+Pg0KPj4+Pj4+ICAgICA+IE9uIDQvMTIvMjIgOToxNyBQTSwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToNCj4+Pj4+PiAgICAgPj4gTGUgbWFyLiAxMiBhdnIuIDIwMjIgw6AgMTQ6MzQsIFBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0KPj4+Pj4+ICAg
ICA+Pj4NCj4+Pj4+PiAgICAgPj4+Pj4+Pj4gPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4g
d3JpdGVzOg0KPj4+Pj4+ICAgICA+Pj4NCj4+Pj4+PiAgICAgPj4+IEhpLA0KPj4+Pj4+ICAgICA+
Pj4NCj4+Pj4+PiAgICAgPj4+ID4+IFllYWguIEV1Z2VuLCBpcyB0aGVyZSBhbnkgc3BlY2lmaWMg
cmVhc29uIHdoeSB5b3UgdXNlIHRoZSBkaGNwIHBhY2thZ2UNCj4+Pj4+PiAgICAgPj4+ID4+IG92
ZXIgdGhlIG90aGVyIERIQ1AgY2xpZW50cyB3ZSBwcm92aWRlPw0KPj4+Pj4+ICAgICA+Pj4NCj4+
Pj4+PiAgICAgPj4+ID4gSGlzdG9yaWNhbCByZWFzb25zLCBhbmQgdGhlIGZhY3QgdGhhdCBwZW9w
bGUgaGF2ZSB3b3JraW5nIGNvbmZpZ3VyYXRpb25zDQo+Pj4+Pj4gICAgID4+PiA+IHVzaW5nIHRo
aXMgcGFja2FnZS4uLiBJIHdhcyB1bmF3YXJlIHRoYXQgaXQgd2FzIGR1ZSB0byBiZSByZW1vdmVk
Lg0KPj4+Pj4+ICAgICA+Pj4gPiBXZSB3aWxsIHRyeSB0byBzd2l0Y2ggdG8gYSBkaWZmZXJlbnQg
cGFja2FnZSBpbiB0aGUgZnV0dXJlLiBUaGFua3MgZm9yDQo+Pj4+Pj4gICAgID4+PiA+IGxldHRp
bmcgbWUga25vdy4NCj4+Pj4+PiAgICAgPj4+ID4gSG93ZXZlciwgaWYgdGhlIHBhY2thZ2UgaXMg
c3RpbGwgaW4gdGhpcyBidWlsZHJvb3QgcmVsZWFzZSwgaXQgaGFzIHRvDQo+Pj4+Pj4gICAgID4+
PiA+IHdvcmsgcmlnaHQgPw0KPj4+Pj4+ICAgICA+Pj4NCj4+Pj4+PiAgICAgPj4+IFllcywgdGhh
dCBpcyB0aGUgaWRlYS4gSWYgaXQgaXMgZGVhZCB1cHN0cmVhbSBhbmQgaGFyZCB0byBmaXggdGhl
biB0aGF0DQo+Pj4+Pj4gICAgID4+PiBuYXR1cmFsbHkgbWFrZXMgaXQgaGFyZGVyIHRvIGRvLCBi
dXQgdGhlIGludGVudGlvbiBpcyB0byBmaXggaXQuDQo+Pj4+Pj4gICAgID4+DQo+Pj4+Pj4gICAg
ID4+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNzdWU6DQo+Pj4+Pj4gICAg
ID4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyMjA0MTIxODE2MDcuMTQ1MTU4MC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLw0KPj4+
Pj4+DQo+Pj4+Pj4gICAgID4gSGksDQo+Pj4+Pj4NCj4+Pj4+PiAgICAgPiB5b3VyIHBhdGNoIHRv
Z2V0aGVyIHdpdGggdGhlIG90aGVyIG9uZSAoDQo+Pj4+Pj4gICAgID4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC9EVTBQMjUxTUIwNzc5N0NBQUU4
MEM5ODVEQzg5NzYzMzVFM0U3OUBEVTBQMjUxTUIwNzc5LkVVUlAyNTEuUFJPRC5PVVRMT09LLkNP
TS8NCj4+Pj4+PiAgICAgPiApLA0KPj4+Pj4+DQo+Pj4+Pj4gICAgID4gc29sdmUgdGhlIGJ1aWxk
IHByb2JsZW0gZm9yIHRoaXMgcGFja2FnZS4NCj4+Pj4+Pg0KPj4+Pj4+IFRoZXkgYXJlIG5vdyBi
b3RoIGFkZGVkIHRvIHRoZSAyMDIyLjAyLnggYnJhbmNoLCB0aGFua3MuDQo+Pj4+Pj4NCj4+Pj4+
PiAtLQ0KPj4+Pj4+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkDQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBI
ZWxsbyBhZ2FpbiBGYWJyaWNlLA0KPj4+Pj4NCj4+Pj4+IEFmdGVyIG1hbmFnaW5nIHRvIHN1Y2Nl
c3NmdWxseSBidWlsZCBhbGwgb3VyIGRlZmNvbmZpZ3Mgbm93LCB3aGlsZQ0KPj4+Pj4gdGVzdGlu
ZyBvbiBhbm90aGVyIGJvYXJkIChzYW1hN2c1ZWspLCBJIG5vdGljZWQgdGhpcyBtZXNzYWdlIGF0
IGJvb3QgbG9nIDoNCj4+Pj4+DQo+Pj4+PiBTdGFydGluZyBESENQIHNlcnZlcjogL3Vzci9zYmlu
L2RoY3BkOiBlcnJvciB3aGlsZSBsb2FkaW5nIHNoYXJlZA0KPj4+Pj4gbGlicmFyaWVzOiBsaWJp
cnMuc28uMTYxOiBjYW5ub3Qgb3BlbiBzaGFyZWQgb2JqZWN0IGZpbGU6IE5vIHN1Y2ggZmlsZQ0K
Pj4+Pj4gb3IgZGlyZWN0b3J5DQo+Pj4+Pg0KPj4+Pj4gRGlnZ2luZyB5aWVsZHMgdGhhdCBsaWJp
cnMgaXMgcGFydCBvZiBiaW5kIHBhY2thZ2UuIERvIHlvdSBrbm93IHdoeSB0aGlzDQo+Pj4+PiBo
YXBwZW5zIGFuZCB3aGF0IGNvdWxkIGJlIHRoZSBjYXVzZT8gQ291bGQgbGF0ZXN0IHBhdGNoZXMg
YWZmZWN0IHRoZSBkaGNwZCA/DQo+Pj4+DQo+Pj4+IEluZGVlZCwgdGhlIGludGVybmFsIGJpbmQg
bGlicmFyaWVzIChpbmNsdWRpbmcgbGliaXJzLnNvLjE2MSkgYXJlDQo+Pj4+IGNvcnJlY3RseSBp
bnN0YWxsZWQgaW4gc3RhZ2luZyBkaXJlY3RvcnkgYnV0IG5vdCBpbiB0aGUgdGFyZ2V0DQo+Pj4+
IGRpcmVjdG9yeSBiZWNhdXNlIGRoY3AubWsgaXMgb3ZlcnJpZGluZyBESENQX0lOU1RBTExfVEFS
R0VUX0NNRFMuDQo+Pj4+IEknbGwgc2VuZCBhIHBhdGNoIGJ5IHRoZSBlbmQgb2YgdGhlIGRheS4N
Cj4+Pg0KPj4+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNzdWU6DQo+Pj4g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIy
MDQxNDE2NDEwOS4xNzI0ODczLTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20vDQo+Pj4NCj4+
DQo+PiBIZWxsbyBGYWJyaWNlLA0KPj4NCj4+IFRoZSBsaWJpcnMgcHJvYmxlbSBpcyBnb25lIG5v
dywgdGhhbmtzLiBIb3dldmVyLCBJIGdldCBhIG5ldyBlcnJvcjoNCj4+DQo+Pg0KPj4gU3RhcnRp
bmcgREhDUCBzZXJ2ZXI6IC91c3Ivc2Jpbi9kaGNwZDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFy
ZWQNCj4+IGxpYnJhcmllczogbGliaXNjY2ZnLnNvLjE2MzogY2Fubm90IG9wZW4gc2hhcmVkIG9i
amVjdCBmaWxlOiBObyBzdWNoDQo+PiBmaWxlIG9yIGRpcmVjdG9yeQ0KPj4NCj4+IExvb2tzIGxp
a2UgdGhlcmUgYXJlIHN0aWxsIHByb2JsZW1zIG9uIG15IHNpZGUNCj4gDQo+IGxpYmlzY2NmZy5z
by4xNjMgaXMgaW5zdGFsbGVkIG9uIHRhcmdldCByb290ZnMgKGluIC91c3IvbGliKS4gQ2FuIHlv
dQ0KPiBjaGVjayB0aGF0IHRoaXMgaXMgYWxzbyB0aGUgY2FzZSBvbiB5b3VyIHNpZGU/DQoNCiMg
bHMgLWxhIC91c3IvbGliL2xpYmlzYyoNCmxyd3hyd3hyd3ggICAgMSByb290ICAgICByb290ICAg
ICAgICAgICAgMTggQXByIDE4ICAyMDIyIA0KL3Vzci9saWIvbGliaXNjLnNvIC0+IGxpYmlzYy5z
by4xMTA3LjAuNw0KbHJ3eHJ3eHJ3eCAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAgICAxOCBB
cHIgMTggIDIwMjIgDQovdXNyL2xpYi9saWJpc2Muc28uMTEwNyAtPiBsaWJpc2Muc28uMTEwNy4w
LjcNCi1yd3hyLXhyLXggICAgMSByb290ICAgICByb290ICAgICAgICAzMTc5NjAgQXByIDE4ICAy
MDIyIA0KL3Vzci9saWIvbGliaXNjLnNvLjExMDcuMC43DQojDQoNCg0KSXQgbG9va3MgbGlrZSBp
dCdzIG5vdC4NCg0KPiANCj4+DQo+PiBUaGFua3MsDQo+PiBFdWdlbg0KPj4NCj4+Pj4NCj4+Pj4+
DQo+Pj4+PiBUaGFua3MgIQ0KPj4+Pj4gRXVnZW4NCj4+Pj4NCj4+Pj4gQmVzdCBSZWdhcmRzLA0K
Pj4+Pg0KPj4+PiBGYWJyaWNlDQo+Pj4NCj4+PiBCZXN0IFJlZ2FyZHMsDQo+Pj4NCj4+PiBGYWJy
aWNlDQo+Pj4NCj4+DQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IA0KPiBGYWJyaWNlDQo+IA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
