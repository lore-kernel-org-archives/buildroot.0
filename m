Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0DCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 09:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B27A405BB;
	Thu, 21 Apr 2022 09:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LS8rpbDJcLmq; Thu, 21 Apr 2022 09:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC4B404DF;
	Thu, 21 Apr 2022 09:25:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87B791BF356
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 09:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 750B060F9B
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 09:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="ILNvm24C";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="rSJrcnpo"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6I98I5XpM3Ir for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 09:25:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 563FD607A4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650533141; x=1682069141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CGLVs42QR7Rx4xXPvt5/SmeLM7pFcTFmsM05fytcPEs=;
 b=ILNvm24Cy9D6HXsAd1E5Ic3/SSthtrgSnZlIi2zMkWnyYGwwEW95cXAZ
 YWn+WMThr8USiRElfQolEU6PBXc9vhysnn8Pr9a2hknsYsEG+Nv1hNBts
 /x4BfpHN28u4g/iYPrhvkIUSnCx+NWdoePwCwkYKqAhSUH/TCNRfrAxkt
 9cUIel05JqmXiBGcvH6VkjzX/SWeM4Zhr/Dr5bs2fHijSuOrU4Y15Cckz
 uFA19t2sEIiUDzHDpptVT9k8VU/WyWD6hSAjfnGd0G6xmESHHtb6McqOu
 9p3OqLMhWabwW1kTAUcze12YXdwuz4GgCfQ6ClYw4MSdxkNfuBsA8Lb1t A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="93077011"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 02:25:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 02:25:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 02:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyXKvECjp9S67Ke2aShI2Sr87bTzIOWpFY2hsAbNegownz64alu5CuvxCujl9L2bLu0PYxM6B3vAk/a9KkGfeyBg4cGw6nCAwUR2lIPMRvS3DfmZlvpm+TrWnB0ZOQ/dCP+cwX7GOQHWrh9Okilr1F7e813ROtfqtUR/W1p+r8P18xx2CRI1Hh9VEKgEzWU5aAee+ttkz9CNIS2yaW2dHz5y4nKj5EH+7IeOYqNR3SyIpm8mvgXOfv2/LMQHCbN9hRga+4bWt9+j0wLgpbFFeV5NNa/HszlcECOWVrHbiNpX0x+PmP0KlzquvptyuXThdlzSjkRpS02f5mG0nIne3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGLVs42QR7Rx4xXPvt5/SmeLM7pFcTFmsM05fytcPEs=;
 b=PRQo6WqXiZCtIXYVyr5S1MW1IkBeTWwwk8rr7IYSBkdX3i13bJM1bU/mkVeVkzvQinEhCcxSvOmAQXQpaYUI8kyoFH50MbKclywYiPJTgqf+7ahSADZnXVX2nLMExnJAbKAGqWSpU4pwm7ovEp2SR+Vnzyu7ngc/Ur6wgDEujoEBFE/zoheEPUI19tpzGylnliP5EZAWiJyockjPzbRYDyMgqVuFvkT/xKMfKwm+nG8vgKHvmouOyO4fmbSZG/5stP0sAhpAZ7fw84+gxL+Ro9bv14ox0Z7iRbqeEhGb4xsbzaS6MnyCFMRebLsD9BE0V2dnITlgEoeo0MKoHZ+zaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGLVs42QR7Rx4xXPvt5/SmeLM7pFcTFmsM05fytcPEs=;
 b=rSJrcnpoYr3vliEgBRdblc7aphQF7V9LOPy8sKzpNcFX/cUj1z1E1ZUiplC+Lr0G5O4/NREEO8+/C8RWp/UhKONX9jLSwEWg8xahgtxVavvYIqusKLFNdVBgYIrSs5Fj6eEOwkV/iTbJ5RK8y2/lknXqjXqwL1qlKRAg4Kx5f7U=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:25:37 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%8]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 09:25:37 +0000
To: <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYTmEZ03FYkSO1E0aa3ZrEpJPiy6zsKDSAgAAOXOOAAF/EAIAA5G6AgAAJoDiAAZ23gIAADdeAgABxAwCABxzhgIAAP2AAgAAT2ACAAGKzgIACswIA
Date: Thu, 21 Apr 2022 09:25:37 +0000
Message-ID: <65316bc2-f596-3b3e-71fc-ffafa87e2165@microchip.com>
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
 <2a14aebd-8213-0966-b0d4-392ca9ce36e6@microchip.com>
 <CAPi7W82y2e=mbjNRUyiondGuTWxyD=NewNKSquxW-hUfL=A9qw@mail.gmail.com>
In-Reply-To: <CAPi7W82y2e=mbjNRUyiondGuTWxyD=NewNKSquxW-hUfL=A9qw@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 288d28e6-cafe-4029-7f94-08da2378e53e
x-ms-traffictypediagnostic: SJ0PR11MB5939:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB593970B919CA28A07B1E11CBE8F49@SJ0PR11MB5939.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QlzznfAI57bguPzghdf/HWf1vbQLWfLny7g1V2f08JV9NYVHLe5ALrXzM1HOKGXbxsOzxy1LmMiVHzCnlecSnSW8GsPJH2BfZN+X1cnHhnZI2Fql1d6gVU+SUkRFESj0H1EBNRsKXinMOsuAnwjbY8p5xbjEZ2MLvcNRQMfg3rc/ZBbgpofHPbVZHZcfJa81EC8gCUN5ami4LnS3RHmQXEeTvrkLcaEtGLb6CpvIzAtCEOwVHzEpK2vQ5TeZicFn0dErTZZwxJ+5Alqo9Gr338lxL1dBtUqVLxcxVLkZVA94JMRd4nrGLzX9ZdufsKgNDJcuNNiDWd/o1BHwQ9c5M+FIuNerk+5bdUfB6SyJvngvxJm5opB4/7wYnzvCB9Y7dGUPmo/IxfdoUlkCm+9Zf8RFelPBs2IpfTciyN+XpgXdz57X8GhANoMkhuRjY3os8AbaCfEWwqJIRIH/GyLSYg+rVoAm0nS06sk9KgLDtYgeFVtzyDmp6w0AY3xn9Ai6vtZxuwYoFZ1hC5bYGQ08f5fhrFoQRAzIy5RHTHxj4dp75qtlt53loaM7vScLtKaGnYddjoqwXIrejUnIHSKDu6bjQllFEJ0Eftacc0zIb9u990Fv19UBWolRzoyQjcnb9XE3iGIjWcDwuNIX9c+x1teZWbbskdtb0Xaly5Wkj5EHgdirqUlFBReYDvfxWy74wT9D1WiTUkgGS8nauXAjOm/yNPgWU+5jP7hQ+6aYBJtpf2LLb5xjmSkDoX8eufagCwyplNTFEKcSDWUfXJr4qNoUJYQR4+vIh1FFchYm0rSe3LD38QF/59JUjwCikAQBC9/+T0SZ6Rmxrx8yQst06IUi25lOCf+p7gFRJVjbxWE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(4326008)(186003)(38100700002)(38070700005)(54906003)(966005)(508600001)(66946007)(31696002)(8676002)(64756008)(91956017)(66446008)(2616005)(6916009)(6486002)(122000001)(76116006)(316002)(71200400001)(66476007)(86362001)(2906002)(26005)(66556008)(83380400001)(31686004)(45080400002)(66574015)(6506007)(6512007)(53546011)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1lnVyszOXFaUThCVlpKZC85Y2pLdkFyaS8rTmc1YURNVjFmRlB1cWp3TjAx?=
 =?utf-8?B?T25GaDlIM2pUSkoxWWJlTjdVMVF4L2VuM05VSHNsbFhFaDlsY1JTNS9MWkxH?=
 =?utf-8?B?Q2M2OVZ2aVMrWVlFa25vV2t3cFZlMDdhMVkrM0JpVVNNN2VXZENIKzhFczlM?=
 =?utf-8?B?U1Q1Z3YzWXR6K3dLN0FHWVc0YkJnSisxSFRoeGcvSlE5R0dmUHZNYVlFdXJr?=
 =?utf-8?B?bk1jNElEMEtybkNSUFVtQlgvNmVPWk5uU29nVSt1bTVoSUtkUHVBRlpzZTVX?=
 =?utf-8?B?WHJUc05MM1JjTHErbTlXNmh1eHJRc1ZUOXMvU00yaW8xS2d2RVBhSVNUcjVS?=
 =?utf-8?B?eFdxdzFLZXNuVGY4VC94UGJxdEY1Ui95MHRjTktuZUlUZ3FQbDRvZU4rNVNp?=
 =?utf-8?B?T24yQWJaRTY2WVVUQ0ZvVzY0Y0dYNjhFTHpIVS93bFA3a2p0ekl0UXVyZXYv?=
 =?utf-8?B?amo1RjM5SmRqd3J3aTZnZENjclI2YjIyVll4amxrMXZSWlJuSzRwTzQ0NkpB?=
 =?utf-8?B?SVRwUUsvSllydW9aT3RJamFzTTZ2eEZxTDYvWFc3aW1TWkRrczl1c09mbUVK?=
 =?utf-8?B?L2NpMGxZWjV2dnlxd29xQUUrdEVrTE9zL1FxYi93Ym42a0lZOVFaY1pDVjg0?=
 =?utf-8?B?WkI2MzRpWnNqSXp2bVIyb3krOTVraWNrQmFJdU0vVFZDMWMyQ0lOVmI4NWo2?=
 =?utf-8?B?TWpOZTIwdnNHZ1lSRVZNb0FlcUFDakx1MFM3QW0vdWs3dC9DOE9vbVF4eGoz?=
 =?utf-8?B?ZUt0RkpWbVpEZER3cWdMaDUrcUpxSWZ4cUxDejY1YlVzOFJyancxaUhlM2Fp?=
 =?utf-8?B?L24xWThSc2JKWldTWVRzcnRIRzMxeGhQM20waXU0OXIrR29PR2xkV3d0eTQ4?=
 =?utf-8?B?TVpRL3NLT2gzWmdUVjBJenFXNlE0dTBVcXdieDRZZEpDaGp1ZHRsYXRjNzZD?=
 =?utf-8?B?WlR4WThtWWREWjZMZHFuQ3ROMnNsVUl3UmRtbW44N0xNclE5MGFJUks3YllE?=
 =?utf-8?B?aTU0SkNma0NGQ3kreU15N095RnlzZmd6Y0M2SDhLSURpMGM4NHRqQlFwNFVy?=
 =?utf-8?B?Y2dOYWRoMUpKc1B5djhRN2tBUEZyRnZWdHVnemljSjdWd2g5UWxDTnMxYmZ2?=
 =?utf-8?B?bTJZbFpWUHk0V2hhZTcwOTVIaW9EUzFTWFNRV3haUExhOERkSGVPMXJiV2hy?=
 =?utf-8?B?akwxSTJWa0xYQ0JRZmV0cjViK2IxTFV4WHNXTDU4SXhGdTJvbWVmTVByeEdy?=
 =?utf-8?B?cEFSSmNRVHkxeVUvVzVNeGpVTGpZd0p4ZU9kZnQyTHYvdFE5Y0FIMVZuclN1?=
 =?utf-8?B?WE1tMHJxemRPWXhOcnd5TVVOSGwzdDBCTVFpZGhLSjd3RDJ3Um5qTGRVbU9q?=
 =?utf-8?B?cWxqbTY2VTVPampGUnhyaTVicHZKdzhPdG1wTGlsbmdwcHlFRmhteHF3MkJI?=
 =?utf-8?B?aTdIM0tETHlhUDB0SFh6UnBCNkJIcjRMU1BVM1lKNk9mSEdGRndDRVJxaXlF?=
 =?utf-8?B?TmV2WGl6bU1GaE5TeHI0NGhTN1NQN1VVTUtDRDMrek9VeFNaSlhuaVQ4TUti?=
 =?utf-8?B?VFVxNDM0bmhnQi9PbFBsNC9DUHI4bDFCcXJJUlVseXhPQzlla01Da3hqS3kw?=
 =?utf-8?B?TjREVGdHOWpXa09iWHppRGdqSE9kdjZFbCtmZzR3WW1PUTBLUDlLc2hqZkk3?=
 =?utf-8?B?UE5aVFVYZ1N3ME45V1hlZDVoNjU0dS9meHRyNk5HWWVRN2NoOS82SldTc1J1?=
 =?utf-8?B?TFdaV3JPRWlyamJlQUIwSk10Zy83RkVmMFIyRS93eHdYUEtWWkFlc3JDa0l1?=
 =?utf-8?B?RmtiNXdUUnFUT002b3Q1R2Yrem01TkNFWTNuTjBBTW1JS0oyOC9xdUpIQ3RV?=
 =?utf-8?B?aWR3N2k4ZFdjdUczMEovZ1JaM0tzaG1HaFRBMVJyLzFYQmZHR0h6QnRMVHp3?=
 =?utf-8?B?M3doc0Q3TWlZMitrVktUMm9sOUVlTWI3b25DZDdlano3MTFtWWVIZFJxWU5J?=
 =?utf-8?B?dVMzcmQ5TTRCcm9OSGh1YUNrdlhUclJVa09EdkVZYWlqTmw3S2lwK0RMUkxu?=
 =?utf-8?B?SEZveWN1cnIrNy9ncVJla0ttY3o1ejJHUjJuOERkYlNIekJydnplUS9pUTdn?=
 =?utf-8?B?aHRicjg5Z0t3K2FZMVBwNHVDRUFRa2oyZS9IbHEvK2NhMU5Yck1sNDFKbkdw?=
 =?utf-8?B?WW5xNWtJZHRRTWlSdWpUUTRKbFNXeXFmKzFOKzdXeGE0QTZpYjNoakxHNk5x?=
 =?utf-8?B?aUJqNDQ4RzJWZzJGVUV1Z3VRTkRaejlINExZa2NSZ2t3ZzI4NmxYR09qcldN?=
 =?utf-8?B?UlpSbUg3cXNJUldMWXo4NHdramRCR1AwMStpNTlzb0trTUswK2tjZkNFRTU0?=
 =?utf-8?Q?rz2EP9DM69aXX9cM=3D?=
Content-ID: <AC0447955458C54CBA8477944D9EF1E8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288d28e6-cafe-4029-7f94-08da2378e53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 09:25:37.5003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQseZ5/lG5vDKCYfOWIfq8WlDHDJ0FJzn8Pb1jXQ5HIp5VOr4ydtxLLRkttgJBZaXSSU5hSSAxBq3SLM+HpBlZbrU5QpYOnDWwasI6M7AHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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

T24gNC8xOS8yMiA3OjEyIFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOg0KPiBMZSBtYXIuIDE5
IGF2ci4gMjAyMiDDoCAxMjoxOSwgPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNy
aXQgOg0KPj4NCj4+IE9uIDQvMTkvMjIgMTI6MDggUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6
DQo+Pj4gSGVsbG8gRXVnZW4sDQo+Pj4NCj4+PiBMZSBtYXIuIDE5IGF2ci4gMjAyMiDDoCAwNzoy
MSwgPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOg0KPj4+Pg0KPj4+PiBP
biA0LzE0LzIyIDc6NDQgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6DQo+Pj4+PiBMZSBqZXUu
IDE0IGF2ci4gMjAyMiDDoCAxMTo1OSwgRmFicmljZSBGb250YWluZQ0KPj4+Pj4gPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPiBhIMOpY3JpdCA6DQo+Pj4+Pj4NCj4+Pj4+PiBIZWxsbyBFdWdl
biwNCj4+Pj4+Pg0KPj4+Pj4+IExlIGpldS4gMTQgYXZyLiAyMDIyIMOgIDExOjEwLCA8RXVnZW4u
SHJpc3RldkBtaWNyb2NoaXAuY29tPiBhIMOpY3JpdCA6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDQv
MTMvMjIgMTE6MjkgQU0sIFBldGVyIEtvcnNnYWFyZCB3cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4gICAg
ICAgPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gd3JpdGVzOg0KPj4+Pj4+Pj4NCj4+Pj4+
Pj4+ICAgICAgPiBPbiA0LzEyLzIyIDk6MTcgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6DQo+
Pj4+Pj4+PiAgICAgID4+IExlIG1hci4gMTIgYXZyLiAyMDIyIMOgIDE0OjM0LCBQZXRlciBLb3Jz
Z2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4+Pj4+Pj4+ICAgICAgPj4+
DQo+Pj4+Pj4+PiAgICAgID4+Pj4+Pj4+IDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdy
aXRlczoNCj4+Pj4+Pj4+ICAgICAgPj4+DQo+Pj4+Pj4+PiAgICAgID4+PiBIaSwNCj4+Pj4+Pj4+
ICAgICAgPj4+DQo+Pj4+Pj4+PiAgICAgID4+PiA+PiBZZWFoLiBFdWdlbiwgaXMgdGhlcmUgYW55
IHNwZWNpZmljIHJlYXNvbiB3aHkgeW91IHVzZSB0aGUgZGhjcCBwYWNrYWdlDQo+Pj4+Pj4+PiAg
ICAgID4+PiA+PiBvdmVyIHRoZSBvdGhlciBESENQIGNsaWVudHMgd2UgcHJvdmlkZT8NCj4+Pj4+
Pj4+ICAgICAgPj4+DQo+Pj4+Pj4+PiAgICAgID4+PiA+IEhpc3RvcmljYWwgcmVhc29ucywgYW5k
IHRoZSBmYWN0IHRoYXQgcGVvcGxlIGhhdmUgd29ya2luZyBjb25maWd1cmF0aW9ucw0KPj4+Pj4+
Pj4gICAgICA+Pj4gPiB1c2luZyB0aGlzIHBhY2thZ2UuLi4gSSB3YXMgdW5hd2FyZSB0aGF0IGl0
IHdhcyBkdWUgdG8gYmUgcmVtb3ZlZC4NCj4+Pj4+Pj4+ICAgICAgPj4+ID4gV2Ugd2lsbCB0cnkg
dG8gc3dpdGNoIHRvIGEgZGlmZmVyZW50IHBhY2thZ2UgaW4gdGhlIGZ1dHVyZS4gVGhhbmtzIGZv
cg0KPj4+Pj4+Pj4gICAgICA+Pj4gPiBsZXR0aW5nIG1lIGtub3cuDQo+Pj4+Pj4+PiAgICAgID4+
PiA+IEhvd2V2ZXIsIGlmIHRoZSBwYWNrYWdlIGlzIHN0aWxsIGluIHRoaXMgYnVpbGRyb290IHJl
bGVhc2UsIGl0IGhhcyB0bw0KPj4+Pj4+Pj4gICAgICA+Pj4gPiB3b3JrIHJpZ2h0ID8NCj4+Pj4+
Pj4+ICAgICAgPj4+DQo+Pj4+Pj4+PiAgICAgID4+PiBZZXMsIHRoYXQgaXMgdGhlIGlkZWEuIElm
IGl0IGlzIGRlYWQgdXBzdHJlYW0gYW5kIGhhcmQgdG8gZml4IHRoZW4gdGhhdA0KPj4+Pj4+Pj4g
ICAgICA+Pj4gbmF0dXJhbGx5IG1ha2VzIGl0IGhhcmRlciB0byBkbywgYnV0IHRoZSBpbnRlbnRp
b24gaXMgdG8gZml4IGl0Lg0KPj4+Pj4+Pj4gICAgICA+Pg0KPj4+Pj4+Pj4gICAgICA+PiBUaGUg
Zm9sbG93aW5nIHBhdGNoIHNob3VsZCBmaXggdGhlIGlzc3VlOg0KPj4+Pj4+Pj4gICAgICA+PiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIw
NDEyMTgxNjA3LjE0NTE1ODAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+PiAgICAgID4gSGksDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICA+IHlvdXIgcGF0
Y2ggdG9nZXRoZXIgd2l0aCB0aGUgb3RoZXIgb25lICgNCj4+Pj4+Pj4+ICAgICAgPiBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoL0RVMFAyNTFNQjA3
Nzk3Q0FBRTgwQzk4NURDODk3NjMzNUUzRTc5QERVMFAyNTFNQjA3NzkuRVVSUDI1MS5QUk9ELk9V
VExPT0suQ09NLw0KPj4+Pj4+Pj4gICAgICA+ICksDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAgICA+
IHNvbHZlIHRoZSBidWlsZCBwcm9ibGVtIGZvciB0aGlzIHBhY2thZ2UuDQo+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4gVGhleSBhcmUgbm93IGJvdGggYWRkZWQgdG8gdGhlIDIwMjIuMDIueCBicmFuY2gsIHRo
YW5rcy4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAtLQ0KPj4+Pj4+Pj4gQnllLCBQZXRlciBLb3JzZ2Fh
cmQNCj4+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEhlbGxvIGFnYWluIEZhYnJpY2UsDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IEFmdGVyIG1hbmFnaW5nIHRvIHN1Y2Nlc3NmdWxseSBidWlsZCBhbGwgb3Vy
IGRlZmNvbmZpZ3Mgbm93LCB3aGlsZQ0KPj4+Pj4+PiB0ZXN0aW5nIG9uIGFub3RoZXIgYm9hcmQg
KHNhbWE3ZzVlayksIEkgbm90aWNlZCB0aGlzIG1lc3NhZ2UgYXQgYm9vdCBsb2cgOg0KPj4+Pj4+
Pg0KPj4+Pj4+PiBTdGFydGluZyBESENQIHNlcnZlcjogL3Vzci9zYmluL2RoY3BkOiBlcnJvciB3
aGlsZSBsb2FkaW5nIHNoYXJlZA0KPj4+Pj4+PiBsaWJyYXJpZXM6IGxpYmlycy5zby4xNjE6IGNh
bm5vdCBvcGVuIHNoYXJlZCBvYmplY3QgZmlsZTogTm8gc3VjaCBmaWxlDQo+Pj4+Pj4+IG9yIGRp
cmVjdG9yeQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBEaWdnaW5nIHlpZWxkcyB0aGF0IGxpYmlycyBpcyBw
YXJ0IG9mIGJpbmQgcGFja2FnZS4gRG8geW91IGtub3cgd2h5IHRoaXMNCj4+Pj4+Pj4gaGFwcGVu
cyBhbmQgd2hhdCBjb3VsZCBiZSB0aGUgY2F1c2U/IENvdWxkIGxhdGVzdCBwYXRjaGVzIGFmZmVj
dCB0aGUgZGhjcGQgPw0KPj4+Pj4+DQo+Pj4+Pj4gSW5kZWVkLCB0aGUgaW50ZXJuYWwgYmluZCBs
aWJyYXJpZXMgKGluY2x1ZGluZyBsaWJpcnMuc28uMTYxKSBhcmUNCj4+Pj4+PiBjb3JyZWN0bHkg
aW5zdGFsbGVkIGluIHN0YWdpbmcgZGlyZWN0b3J5IGJ1dCBub3QgaW4gdGhlIHRhcmdldA0KPj4+
Pj4+IGRpcmVjdG9yeSBiZWNhdXNlIGRoY3AubWsgaXMgb3ZlcnJpZGluZyBESENQX0lOU1RBTExf
VEFSR0VUX0NNRFMuDQo+Pj4+Pj4gSSdsbCBzZW5kIGEgcGF0Y2ggYnkgdGhlIGVuZCBvZiB0aGUg
ZGF5Lg0KPj4+Pj4NCj4+Pj4+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNz
dWU6DQo+Pj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjIwNDE0MTY0MTA5LjE3MjQ4NzMtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bS8NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEhlbGxvIEZhYnJpY2UsDQo+Pj4+DQo+Pj4+IFRoZSBsaWJp
cnMgcHJvYmxlbSBpcyBnb25lIG5vdywgdGhhbmtzLiBIb3dldmVyLCBJIGdldCBhIG5ldyBlcnJv
cjoNCj4+Pj4NCj4+Pj4NCj4+Pj4gU3RhcnRpbmcgREhDUCBzZXJ2ZXI6IC91c3Ivc2Jpbi9kaGNw
ZDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQNCj4+Pj4gbGlicmFyaWVzOiBsaWJpc2NjZmcu
c28uMTYzOiBjYW5ub3Qgb3BlbiBzaGFyZWQgb2JqZWN0IGZpbGU6IE5vIHN1Y2gNCj4+Pj4gZmls
ZSBvciBkaXJlY3RvcnkNCj4+Pj4NCj4+Pj4gTG9va3MgbGlrZSB0aGVyZSBhcmUgc3RpbGwgcHJv
YmxlbXMgb24gbXkgc2lkZQ0KPj4+DQo+Pj4gbGliaXNjY2ZnLnNvLjE2MyBpcyBpbnN0YWxsZWQg
b24gdGFyZ2V0IHJvb3RmcyAoaW4gL3Vzci9saWIpLiBDYW4geW91DQo+Pj4gY2hlY2sgdGhhdCB0
aGlzIGlzIGFsc28gdGhlIGNhc2Ugb24geW91ciBzaWRlPw0KPj4NCj4+ICMgbHMgLWxhIC91c3Iv
bGliL2xpYmlzYyoNCj4+IGxyd3hyd3hyd3ggICAgMSByb290ICAgICByb290ICAgICAgICAgICAg
MTggQXByIDE4ICAyMDIyDQo+PiAvdXNyL2xpYi9saWJpc2Muc28gLT4gbGliaXNjLnNvLjExMDcu
MC43DQo+PiBscnd4cnd4cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICAgIDE4IEFwciAx
OCAgMjAyMg0KPj4gL3Vzci9saWIvbGliaXNjLnNvLjExMDcgLT4gbGliaXNjLnNvLjExMDcuMC43
DQo+PiAtcnd4ci14ci14ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgMzE3OTYwIEFwciAxOCAg
MjAyMg0KPj4gL3Vzci9saWIvbGliaXNjLnNvLjExMDcuMC43DQo+PiAjDQo+Pg0KPj4NCj4+IEl0
IGxvb2tzIGxpa2UgaXQncyBub3QuDQo+IA0KPiBJIHdhcyBhYmxlIHRvIGZpbmQgYW5kIGZpeCB0
aGUgaXNzdWU6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyMjA0MTkxNjExMzAuMzQzMTQ5Mi0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tLw0KPiANCg0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoZXMgIQ0KSXQgbG9va3MgdGhhdCBp
dCB3b3JrcyBmaW5lIG5vdy4NCg0KU2VudCBhIHJldmlld2VkLWJ5IHRhZyBvbiB5b3VyIHBhdGNo
Lg0KDQpFdWdlbg0KPj4NCj4+Pg0KPj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+IEV1Z2VuDQo+Pj4+
DQo+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhhbmtzICENCj4+Pj4+Pj4gRXVnZW4NCj4+Pj4+
Pg0KPj4+Pj4+IEJlc3QgUmVnYXJkcywNCj4+Pj4+Pg0KPj4+Pj4+IEZhYnJpY2UNCj4+Pj4+DQo+
Pj4+PiBCZXN0IFJlZ2FyZHMsDQo+Pj4+Pg0KPj4+Pj4gRmFicmljZQ0KPj4+Pj4NCj4+Pj4NCj4+
Pg0KPj4+IEJlc3QgUmVnYXJkcywNCj4+Pg0KPj4+IEZhYnJpY2UNCj4+Pg0KPj4NCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
