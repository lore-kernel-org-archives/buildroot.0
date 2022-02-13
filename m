Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AD6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E0D60B5D;
	Sun, 13 Feb 2022 07:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nu9m2wxC3O8d; Sun, 13 Feb 2022 07:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC1860AFA;
	Sun, 13 Feb 2022 07:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBBE1BF44C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBDAD823F6
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 07:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="eB3Scf1M";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="oIV6rowG"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucF-QuBnLEPQ for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 07:51:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ABE781D0B
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644738671; x=1676274671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=150vLvcwe5TmuRjng0yBpbvJyTZfxMKVgABSMV+og1k=;
 b=eB3Scf1MPYVUapKnVVglpQsYfsrMx88G0MKN5i+hhkA+4QCAgmIlhHhw
 uoTabhZwLmiLKTEuE+lIIBS67P+FEkTNTRWz9G5R98xqHZzsAjP1w6oxu
 SYw3vzikcmN3ItLAj4MTfzO+5xz88IYMl/KhCSxKEl/VJ5OVp+oeWnl/r
 F6lonhlgJWh/Hs/kNuvNZLeas0JFoFPr4PIZ8GCk6d75RNRxoLtf0w7/+
 3OMszvIRUNXh5acaR/mJEp1glrIk5RHSbdYmMkziBj+Z5S9W1M9kLPH8c
 IHmP7HfbqrZjKO0ttwaTaKU+4BRTKpyMtNlWolDV8SGxBu6s17Qumw3Bl w==;
IronPort-SDR: WQyCMg4s78oN71rHemI9SDNaiy67rm63TP8Mn/B5zsX+qVHEWAOvuMwo9q0HgXKg6H30O91SSC
 3aC6Bv0twunU4eJQi8wmj32DNCEQNgcoPWhRKg5PW05v6TPOEjTWt36O4v9zWpmj0z2e1MbGBZ
 NEDeVIXzx1V2t9nZsg/BqfKOg0nQBS1ajSbrn6mqccpwG2BtyFaMDhBGyG3QlsB4EonPMT6lsa
 B66G2q1zyct/hPsuz+6T0Qgk3KmzKW3Krk5HJLu0WGgrMa8ascgkLp5GsFKWoPERxKfl9U2xjy
 emiKZdI2Qf+uG7NLt+tlUjue
X-IronPort-AV: E=Sophos;i="5.88,365,1635231600"; d="scan'208";a="148523231"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Feb 2022 00:51:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 13 Feb 2022 00:51:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 13 Feb 2022 00:51:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbF8mF2FZPADKTwfJ5zY12URa4RMWhWB7dLQGwBV2bSWnVWEg/Zerz1Xd+3L74lEPai04SFr2ByLGaML+idq5rUDqa2Rr34Z3Usg8S1rpeHZXXCVD1ZASopyFEbfYHjmEIKwY/siynYK2zV40fhcFf9BsFt0JAFea2PDBN4xqALJ9cjTwjwrW7tMRmaxmYiHxAQh4pEYPe1nhxDHbozkmpOOeREDJZBSLy0PoeGJ2hRN/7VM3z9e/RU3WENQwGaxvMQg2tBWdAoNDYy+u83oMYnWMltTdHUupF5QRGMwrkQ9pZoRZ4/tGEyr5VSXtLhD3yVOxGgmRBhnubwsuiW5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=150vLvcwe5TmuRjng0yBpbvJyTZfxMKVgABSMV+og1k=;
 b=ATmhW5+BvJ9gmLNYCxfvST7BzWuQjdCHXGbz9w1Hz24IagY8MlAslQp03AY7/CyyNY6x99ucZ0WfHiV0Y00XELZPzl5Z9TY7PYXfNQHXakl98iTnTtL2nLDhOZBbxjrobpalcquMvz+Zhr6OHEwXj5mKAUlrll4nHk7bEJPTCpGQ1GONrBkn6djV1ZHYXlVZChhtmV2PgzA5sd6UuSln0LwlmEgAOLEAQLQ8BvaMU7kS6z2zoWlH2blls4kb+/PYxEdnHpbQN6g6fC15RBBvnwUxYaHzAWejM/XTBOuWGIsq0k3zOQ7H9752zkuOus4GT/knpoxJMPKIAm/ycjG0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=150vLvcwe5TmuRjng0yBpbvJyTZfxMKVgABSMV+og1k=;
 b=oIV6rowGpxOyHiEi9tEyq5xb3SLUbo+iG8l6gdIsxWdyVBXi+AkiB+rO8gy7iCjEXmtqecFc2TXbX5nnTy0TNCuik3m6UMbo1+tbfT4j/UcRNXRc8D8mFgKpahyMaxzV1GuQ7pXzvbDwkqq3KUX5HwKCvbYcMawOr11s8YPdnA8=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Sun, 13 Feb
 2022 07:51:05 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.017; Sun, 13 Feb 2022
 07:51:05 +0000
To: <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v3 0/2] Fix gitlab CI build failure due to
 missing HOST_ dependencies
Thread-Index: AQHYG0xnd21PA/9GPUuN/ddCsotAWayQhgEAgACgS4A=
Date: Sun, 13 Feb 2022 07:51:05 +0000
Message-ID: <79d7d2a5-d915-3838-2771-37604ee9a835@microchip.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <e705b71d-9a21-89ea-d094-0f2678716dc5@mind.be>
In-Reply-To: <e705b71d-9a21-89ea-d094-0f2678716dc5@mind.be>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd76455d-d629-48f5-df45-08d9eec5969d
x-ms-traffictypediagnostic: PH0PR11MB4984:EE_
x-microsoft-antispam-prvs: <PH0PR11MB49845F674DFEF8A8CC1AD855E8329@PH0PR11MB4984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2XxbpfHply+qLLY8MGrdbrpvYeBjFuGauJV5k1yLZDE0VtNDLMBFZariUf/jIAxu4Z2Iu+quK945dPY0ts68F5Vh+/dWnhMY/iJl7BJGwoTRUY3AUZWzs76MzZPTYYK5iGaqmRARsM85MmHL31PIGgGWJXHhvU+H3lCHTkGh9ruFBnh5Mve6HTXb12l28c0IFkWn2cCS9yHjb7jtPCWNVKV4QJFNbYIq01gyQg9LT7VlaGRAFPo/WcvI6LZmbRdi7L/akz8JfVM77mzw9EE/sl0q7LZ7buZ3McU8v82d9P4FWgsBBxcrRomG5pKgAWyV36KKCWh1q1nEZzMLOspjOH9NhzF6iGtG4dE8Mm41LGmfBI3YB495Gj+iPvIDPSLG39HqW0dRe3YJts8ekqyd4HnzSkFwOdJIUJOp4sgJe3+QL9Pov4pZdRhBkXx+zErC+VvQ+W08aGlSl6IaYNOs48V7P6EnRT70y5sVMW/AKvQYiv0NMgRiy8jcTnODZOYgTkrbAaXAcCAcL3IFY+aEG4zMI3dDBWjkIAOUY/h84/vz3xeZp/309jdkwt21x/BWOCSVQ2n926WhEinEZXNlWaamf2qI0ZL4oqVeliTZJuQQr5wsAeM5nVMkOOATCSB95JB0drdNoWY8gP+2NZk2IOkGOBaamtyOlKNs3HJ1W2aZmhLZka3t0VRe95EgMJOfL9Ucjc/CvYX2LBucXSXQMRheD7xnUWVgZDglgBcVJz2DGLlGF40B+3qJ9saufvS1ldM54CvLKhHtaMMBLnUEWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(83380400001)(31686004)(71200400001)(508600001)(6486002)(4744005)(5660300002)(36756003)(6916009)(38100700002)(38070700005)(316002)(76116006)(86362001)(4326008)(66946007)(66476007)(8676002)(66556008)(66446008)(8936002)(64756008)(54906003)(6512007)(122000001)(2616005)(31696002)(91956017)(186003)(6506007)(53546011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFNNTlFpeDNYem91UWN4N3FJUjFWdXFTOTh4T3BXYVpWeVNjT2NOZkpNZWdS?=
 =?utf-8?B?b2N6dC9xOEZRQWVqUk5wYzZTVHFjTlo2RjVzTDE3MW9IRXdYWmdMT3pyY3VO?=
 =?utf-8?B?d3U2T3NuM2o0ekhvcm1lRTc4UU9HeXJUWnIvWWsxc2RiNUp2czNpb0o1VUtY?=
 =?utf-8?B?KzRrbmZYclBsOXhNVTl1WWxBYzdzWGMvR01Nb29ob09oZVpTN29tR09nRkti?=
 =?utf-8?B?dUhRb3NYRE1Qd21MMmRPSS9TRDVDeFZBVzkrWWdZWVdtZGdYandJQnlRSkli?=
 =?utf-8?B?TE03SnhTS1R5a3IydGlMREtKQ0wwbFVuSHpCSHI0NjJXSGQvSk83aElCVHl2?=
 =?utf-8?B?cWN6c2tXekk3aFBxRVlJdDZzcHdHM2hDR1ZkQ083Y3lWam1mdngvMXQ4NnlP?=
 =?utf-8?B?ZjNXdG1xOVhUdDI5cmtYRnU2bHgyd2dmcHpJdldmbENLMnY5SnlEOERML2s0?=
 =?utf-8?B?R3VWdTZYbDd5N0FYakJaNTl5SFR2ZnROazNhd1lDcU50OFpNTEhHV1JQcEVz?=
 =?utf-8?B?c1dpc09UTXE1ang5a3d2M01iSVRPLzM4K2JoelljN0ZWMiswdXpVa2h3R242?=
 =?utf-8?B?Wk9BQUIvdnhab1YzYkVUTFpFTklZcmlJSkhhbFFtdTVzRmszN1paV2Jlc0xE?=
 =?utf-8?B?R1Z5czFEd2cwUTE0S0pleTdxUlN4cXEvam5GUkZrRko3MEQ1UUIzWFhiT1VB?=
 =?utf-8?B?YWQvTU41amNySmpNdW4xSXE3TVRXYXFCNEpheGJHKzZLdEZTbDBvSFA2WEp0?=
 =?utf-8?B?TXd4S1VNVUEyRGQrRkFUdEtQODFBS3lxRldpbC8wdmJ3TEtSaVAxdlJ6QVBP?=
 =?utf-8?B?d200d1JVTzg2SXo3YjZwMVB5cVEyd2ZHTmNOMTUyK1NxVFdqb2IwTWFqTnYz?=
 =?utf-8?B?R2JyTXQ1TjRPWEhVOW5HUGxQM1YxcXpaVFU3UzhWN2pLcC9uWGg3UDlNU0xz?=
 =?utf-8?B?M0hvZDFSZWFBQ1RHa3pMbnBSbEIwWjVudUhrMmM2Um1uRnp1WUJNWTBrMjhF?=
 =?utf-8?B?M09jMldObkJOUzVGeEprNjFEV1JVN0liNW9ISnlsdVZsdmRuWHZqRnpCaVlE?=
 =?utf-8?B?N1A3ODd5SXdXYktGaVRvcVFyK1JpU2N1bnhFOUtDc0xOTnpkNmI4WUp1RHZC?=
 =?utf-8?B?OHEyOTFrbGJKdXQ5SjEyTG9uclhWU0VJbGVnaitzMDdVSEp2MGtNRW4vdVpq?=
 =?utf-8?B?aThqWk1zSWgrRkdKdkgvbzNIbDlyS09NaW9PVWhYbUdJU0Zod1dwRDJBWTg1?=
 =?utf-8?B?NWtxbitDWHRjTnQ5UHAzWmtuck93UG9pMmE5QUR0TWVCZVZQK0dPakc1VCs5?=
 =?utf-8?B?WkE4ZFMrSkp0Qk43Yzk0V1NlWnFPT0UwbXI5amdmT0czVWR3L0ZHdTBSK21R?=
 =?utf-8?B?c1BPdnNUTm9QSTNxK2ovUktkUjN4RzlxbWlWR1hpRHNORGpiYmxxRkkvbWZE?=
 =?utf-8?B?OFlzc295dWFQNGYxOEZJSzVaR3JkU1l3M3o3c1VwUTM1QkYvK3g2Vm9IaW1Y?=
 =?utf-8?B?dTBqa216ZjVsZWJZRHZkbWhmbG1YekF4YnVIN2J2Yld3YWsyMitseUYwbkJX?=
 =?utf-8?B?bmp6RXdibHYva3JLL0taK1BMcnAzMGNhTUQ4VlRnQXhqcjJBNlNJTE1RV2Yr?=
 =?utf-8?B?anBUNzJOZy8xVFdjcWhUOUxBTUpycjZSZ0hzaGlxbnIrODNGb2lLU0pMaE1X?=
 =?utf-8?B?Y09Sd0o5bG1Tc0M5d2J0a0hFbWZrSG9FQ2pMbFVaS2duUDVpRjlTUVRNV0pt?=
 =?utf-8?B?K3lsQXhUaEN5c0dTbGtBMVFCS1pocEJNc2NxeFYxMFJBa2J6aGZXT1NrVjZz?=
 =?utf-8?B?a0J6Z2xadXAxNVltSlVBWW42TDJNbEEzVkw4UDhUenZidzR5eURWdlVTVDBH?=
 =?utf-8?B?Zy85UEQzYlVpQi9SNUowOE5yTEo0TS80bGtTT1VPREhXSkFnZHpRak9SLzFX?=
 =?utf-8?B?eTVvTEhiS2ZjT1N5WDFKcTJ4MTcyZGtaMkdvb09ucm9CU0xPWk9jSkc3eEdV?=
 =?utf-8?B?MGVkTEdTUEhFbVliVjdKU1FBdXdiekIwMWRDRlpqei9WYXpEUWgvdElLWlVY?=
 =?utf-8?B?TG5ad0VVejNybnNxcU9kK1NSemNRMXhOT2d6TGdxaE1scXlBRy9MRktBcU9L?=
 =?utf-8?B?d3VkNGpKTjh3c1RoMTQxNXRUdFZHQWt5OTYvaTNxaklIWmZoeURXWE9JWlhP?=
 =?utf-8?B?UXdhSDV3VFVRTVFsdFFGTG9FS010TnZvaG5hTXdkK0QvbGZIU0xtcmEvTnE4?=
 =?utf-8?B?L0RIOXd2aGsxcUFTaHRKc0I3OG9RPT0=?=
Content-ID: <96B588ECFDC2DB44AB091B616B8275CD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd76455d-d629-48f5-df45-08d9eec5969d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2022 07:51:05.1595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiqFlwDQZdaKjGd1HNDYtX30HSJpqS6T5ZlH+vaklqA2Mzu1wpyaJlLiGvAgKe0WLsOphik1z/m1aNBl39QxmbRzHFsTd38EpX+VPBYpf5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
Subject: Re: [Buildroot] [PATCH v3 0/2] Fix gitlab CI build failure due to
 missing HOST_ dependencies
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
Cc: giulio.benetti@benettiengineering.com, Ludovic.Desroches@microchip.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi8xMy8yMiAxMjoxNyBBTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6DQo+IE9uIDA2
LzAyLzIwMjIgMTI6MjYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOg0KPj4gVGhpcyBwYXRjaHNldCBm
aXhlcyB0aGUgZ2l0bGFiIGJ1aWxkIGZhaWx1cmUgZHVlIHRvIEhPU1RfIA0KPj4gZGVwZW5kZW5j
aWVzKHVib290L2xpbnV4KS4NCj4+DQo+PiBWMS0+VjI6DQo+PiAqIGFkZCBtaXNzaW5nIGhvc3Qg
b3BlbnNzbCBmb3IgbGludXggb24gDQo+PiBtaWNyb2NoaXBfc2FtYTdnNWVrX21tY19kZWZjb25m
aWcvX2Rldl9kZWZjb25maWcNCj4+IFYyLT5WMzoNCj4+ICogYWRkIHNwZWNpZmljIGN1c3RvbSBs
aW51eCB2ZXJzaW9uIGFzIHN1Z2dlc3RlZCBieSBUaG9tYXMNCj4+DQo+PiBHaXVsaW8gQmVuZXR0
aSAoMik6DQo+PiDCoMKgIGNvbmZpZ3MvbWljcm9jaGlwX3NhbWE3ZzVla19tbWNfZGVmY29uZmln
OiBzZXQgY3VzdG9tIGxpbnV4IHZlcnNpb24gdG8NCj4+IMKgwqDCoMKgIDUuMTUuMjEgYW5kIGFk
ZCBob3N0IG9wZW5zc2wgZm9yIGxpbnV4DQo+PiDCoMKgIGNvbmZpZ3MvbWljcm9jaGlwX3NhbWE3
ZzVla19tbWNfZGV2X2RlZmNvbmZpZzogc2V0IGN1c3RvbSBsaW51eA0KPj4gwqDCoMKgwqAgdmVy
c2lvbiB0byA1LjE1LjIxIGFuZCBhZGQgaG9zdCBvcGVuc3NsIGZvciBsaW51eA0KPiANCj4gIMKg
Qm90aCBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLg0KPiANCj4gIMKgVGhlIGVudHJvcHkgaXNz
dWUgY2FuIGJlIHJlc29sdmVkIGxhdGVyLg0KDQpJIGFscmVhZHkgc2VudCBhbm90aGVyIHBhdGNo
IHRvIGZpeCB0aGF0LiBQbGVhc2UgaGF2ZSBhIGxvb2suDQpUaGFua3MgIQ0KDQpFdWdlbg0KDQo+
IA0KPiAgwqBSZWdhcmRzLA0KPiAgwqBBcm5vdXQNCj4gDQo+Pg0KPj4gwqAgY29uZmlncy9taWNy
b2NoaXBfc2FtYTdnNWVrX21tY19kZWZjb25maWfCoMKgwqDCoCB8IDQgKysrKw0KPj4gwqAgY29u
Zmlncy9taWNyb2NoaXBfc2FtYTdnNWVrX21tY19kZXZfZGVmY29uZmlnIHwgNCArKysrDQo+PiDC
oCAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPj4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
