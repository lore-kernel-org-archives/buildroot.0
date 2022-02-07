Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721FCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 08:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A18401AF;
	Mon,  7 Feb 2022 08:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-qPXW8yrK_4; Mon,  7 Feb 2022 08:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDEE440298;
	Mon,  7 Feb 2022 08:44:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 689321BF289
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 08:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56DAA40252
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 08:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="LJT1D+09";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="fqu9h2Ri"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFBUZvuJmN_c for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 08:44:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BCEB40253
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644223479; x=1675759479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NMj1JQghhFUogbBmJ8MS9J4QlITgGvNCzpjO1ShFBp0=;
 b=LJT1D+09mJGQjFt/B6Nv5kqGIDo18HrmLqhdTeEA+YPhTKHo9gUAsSS+
 tmixyA9iAZYIoCDWxR9dbKLl8M+Fd+jDOTV+6R/p5p5t7G0/zGQiRFQF+
 GKlzevz3qTrLYMimqavrJ2oJUsOnOZ+AISv4eN85jVpXYjoACcswY+jQG
 bS6QowHKHZLluSA1OPPQ/LAkYeCQ2SutQSqHChyVw4C2LnIe0/9Pcp6ud
 JLQjXF0U6NM5pYplKqJ3yYvYlKLVVXyAopxATv57E13ERC/UzsbWJItWR
 kWFL5/Fw4AKbd7/7Sjs4r5/o6dfPteKF7a0mZP9XCfKKc4r6zUM0d+sgs g==;
IronPort-SDR: bc4oRLSeXoy8qIiuXhTnpBOrC0JLS8WclhDDWtbLvs57+SfNB3tUrffeTS96jJ2nWyFxHdKz8+
 a8zpJ4VAsF2B0Vu+lgYKyd8k6t1vAt+OIKaxZ01/6rHbu0nB8t1w0viwYOgCJ2i7OuuiH+kcZU
 cg2PEttXl/giat1YtAj2aU92/3l5AXPcnnrMd0WspftLT/nK2wRPmgNJAAz/6FCHRx0MYLAgno
 8+PpxGTDnJb9xBMiVSnF9+BOPyorLrYU9X0dgiuqBhJpO6orKwXu4U7oRvF42f5jlS3xHim+0s
 FmbHd2ubY6eNtUXSgIRZVSJs
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="161304947"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 01:44:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 01:44:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 7 Feb 2022 01:44:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAZ0SMpUOb8hwmP4wzZqwSyc/2gDos6kEQBz4wXFAwIT4vJPiEQkhiKFdIy5EoEkmdYJpWd68f3rNKHTdB6w2FeuewixDbelDt3OKfIrx11tZHBGvfv3o/Yu0Hl4bQSWc8MAlvIliTG2ZTz0oci9T4EaOgZDfJe4nUFRWtfND/lC1rmU8yzsSk7/zMaxN281we2L8/bjbfFlgD45If+0GlAW5dFzBmNniAftJnVA6AJRkJCSIoqoCqd7huoBnUO9jtWNozd95XjCwRESZeaSe2nPkEt/sjbnr7mrOEv8FXwh6e+kx2V3rR0nzeVdgHhkvF0p80csGyoUK1MnZflGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMj1JQghhFUogbBmJ8MS9J4QlITgGvNCzpjO1ShFBp0=;
 b=XjVUqzkBjdAfAwgzKG3iAY1V5+l6rEOfymhBrBg8oDMkuXCF14DKG+K/gMH02f7O2/R2WsVAuLUxAY98jxNYySz+91MJA2g4QGcgfrwW482ayJIdFf07R6zc3UlLQpcMTO8uJeFCT6ma+nK28dvTq4OjnQJ4RaVsH62HkAPliqyWNYkjeUViytYXeLVQ+oVhaW+/U8yyPKunJ1H4UamZjl9G+lY6/LY4D9ynyobUzwrbxAWwwUvMnLjsGSulAEGdF9TBYUjFHWxGhpzm+8FrPCdRRLYppWgAqyaqEpw0zWkPWik3lrzWMWCjex9/IB04Unky/l/mZ+K485+NTGEyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMj1JQghhFUogbBmJ8MS9J4QlITgGvNCzpjO1ShFBp0=;
 b=fqu9h2RiNRx1jNyf4iJHACQQGkFHlf7hG3h8YCDqH4LyVk9liRCfPVjlF/WOUeaie+ri9e0CyBLOg2d8Pzr4NEZHMJyImhP6eAs92mb9lDzRuv8d2ShY4kNBmW7kLCRznC11lunSpM14NphqSXs+q0gTafj1n7QO845sJR4pDLU=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 08:44:32 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%6]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 08:44:31 +0000
To: <giulio.benetti@benettiengineering.com>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v3 1/2] configs/microchip_sama7g5ek_mmc_defconfig: set
 custom linux version to 5.15.21 and add host openssl for linux
Thread-Index: AQHYG0xlPHryZVg9uEi3K64w4b9GS6yGcEQAgAAkAoCAAFe3gIAAAzmAgADYAoA=
Date: Mon, 7 Feb 2022 08:44:31 +0000
Message-ID: <f6794ddf-72a4-7444-cdb4-64e4e6624528@microchip.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
 <20220206131656.16e2c8a6@windsurf>
 <febd6a86-7b73-7263-ce66-2056fa102342@benettiengineering.com>
 <0f8fcb54-806c-fb0b-27ea-38eb938a725f@microchip.com>
 <888aa13f-277c-f4a0-2447-79d58145816d@benettiengineering.com>
In-Reply-To: <888aa13f-277c-f4a0-2447-79d58145816d@benettiengineering.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bbcbc2a-d5e1-4b7d-945f-08d9ea160f7b
x-ms-traffictypediagnostic: BYAPR11MB3558:EE_
x-microsoft-antispam-prvs: <BYAPR11MB3558F5B22086967B707B75B8E82C9@BYAPR11MB3558.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LV0ocZJEZhfLuWQgu6yjeC1W1nkAlTLh/KBMRLpnEp0YBUTbHSmC91lO+Hn13hf3yrXYYETnXEetJLrIcZJ2ecgeaicA3XpuholoSRtqLbGAx4QL3qOvjB8D2+FbdH9mKto7t0FIqPcqWwRkEW5Ac8biLyMGVUN8r02BUxhuyrKYdCOZ0Zp6ZiHjgrxILmROA/i46qmEpI288hPJyKKi2FRtZbsaNZwNlPLFEHN53vfZnMbUNooQUvPt85DlP2b9rfJqHGxTA4bEm/OVOlRJNT2hpNHyzxlgOdlpvvsSrczv62+R3PpB4gbrCapf0S+ewuehxim9z/A9NKuUaNde27ezZ54zUvdqPR3FuoZ+o/WdoPHToHtSRDH8omyV5lOJJmmij1xuMM3EyATRSzCLKcEc/4i2mMWqyY4AXvlOfEMnpwpc/YO0cYqFXPiXVT1XfO5KtKMTopW+0/BdNWXxsKze8AVkbItiOpHxodMjc6uYYSNsxCE7rxlTAlTx8qpyejn4BqI5jgammzNLu3QlzaCCxeJF7RiE3E4C4GTk/eql5dciujKWSuzUx23YZq80ObWxMJcBLoYn9vLH00RtvP1jABGjU7SRewbtX5FJTccUaa4Zid+U1njrrzIeIK44M3Zy0a1Yj3L1eRSOURAuOEsYRT25zuURyDcD6KMWWWA2TUZhbKxC6jQG5CLrk/O6cOcZP9cL5PUDtL7QtG64oWsRFHMw9NnkOEZhfhuqFmx0IYduh6g83ketdVnXEG7JgHGT9k49aOUFByOeR4uxp7B41kkPcRt3a1lzQk3vGoysvb36E62IZzV8ERnBHQ8j7+FpWdmpVYKNiKw9v11W5cZ7i1R4Feo9ZzQk9pPj11mGic5RrzmuXXfZZDxgm/6QTMLVBcxH1COtIhlglB1NNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6486002)(31686004)(36756003)(2906002)(186003)(54906003)(508600001)(26005)(110136005)(38100700002)(122000001)(316002)(6506007)(83380400001)(53546011)(71200400001)(91956017)(6512007)(66446008)(66946007)(76116006)(8936002)(4326008)(66556008)(86362001)(64756008)(66476007)(8676002)(31696002)(2616005)(107886003)(38070700005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEdqVng2Q0p5NFQ0UlA4RVlCVHptNjN1K0w0YXlhQ1Nma3RDQTJJMHZ2Ujha?=
 =?utf-8?B?ZExOYTd6Si9Sc3htS0dTMDRLUC9jZExXckwyUXpRRldEaFJIV2tRRDFwelF4?=
 =?utf-8?B?ZW95bGI3Ry9jc0RnV1NIUExpNHVNWVZhczQ3S0Y2MkpHS1FsYTd1RHBNdDBz?=
 =?utf-8?B?STVFRnovYW85WFU2LzdWalJTUUw3dWVFNWJrNTFHallaMmNWWWpwTVhmWHRM?=
 =?utf-8?B?ejErTE5ZU0dvc3JDWEI2QkZRblh4SE00UHFDd2xVTDZrc3hqamhkbklQWlJp?=
 =?utf-8?B?Slo3RnIrdzRhUXEyVmFEMmlVMk9wMmkxL1VLRzZuVFlVUW5aOUh0VERUYWxu?=
 =?utf-8?B?SnB1VnBWeWppSWtWRmc5bWo5dVprSEd6ZldtWEtydzE1VFo4UzdpMW9nOUpR?=
 =?utf-8?B?ZVM5TmNqWExvVW9KZjgzQW9FdzRqYi9VbFU1TG5RUDJ1aVVPbGhIcWtIYzUw?=
 =?utf-8?B?U1pzOE9CbVpxcU9MdFYxQzl0RkZ4MVcxUGJ0bGFYTXR6eTB6Z3B5cnRZOHZM?=
 =?utf-8?B?RjVNcHFFUktaRUR1Tm9WSWZNY0EwSzNSM1o5czBrenpuSksrajJtMXZFUDQz?=
 =?utf-8?B?cWM5N01YdEJBNGx3TWx6d1BSTnJYZTdRZ08vR0drT2tVcW52R0N0TXBvM0V5?=
 =?utf-8?B?QnlQM1h4SVBvZ1FHTmdNVTloNlRod3hjWHFGNUcyL1pubE1zM043N3IzNlpy?=
 =?utf-8?B?K1Rka0tJT2Q3QXBSTlFBRWNvckw3TUZtODFhNkFIN3NsTmNsSFRiLyt4NmRi?=
 =?utf-8?B?dVRRMncraWhqQVk4NTFCdC9pNVpwNndqbzBOYTRNblZiYnB2VFNoQTYzUUF6?=
 =?utf-8?B?b1J1L0czOHdoYUprZjVhM09zOG9MZzBMTmRCajV0N3VKWXc5SXovYVUrbWZO?=
 =?utf-8?B?cVlocCtFalpyeXljWmlSaUwzU3pOUE52dlV2alE5UHdvVGxGYzJBak85aGZv?=
 =?utf-8?B?VnFXK0IyVEN6cTUydzNUK2p4cWRvTXZMbkFhVVl5T3lHdzBmbWtwYjlJRlBa?=
 =?utf-8?B?MXFEVTdXM3J4d3BYRDErQW1yNk1OV2phQkJoVGkvNkxSaUpBVEptM0d4Wk51?=
 =?utf-8?B?Y3d1SFFMN2s3dXQxTjhwRWNLKzhRZ3FiT1ZQRUlocEhNL0tZZlZDZTkyd1BQ?=
 =?utf-8?B?V2RwZGlIUXVoV1hUQmhFc1Z0eU5YYk9FQlNrR2JZbEZzeGZCNDVnaUVPK3lM?=
 =?utf-8?B?Q045eGRCRGNiOWs2VXNHWnIrRldhWExIZzFGSmJnWW1mak5IRkxmbndma2lr?=
 =?utf-8?B?RzdxT3IrUUVyQ05HelhOZjhFN04vWmFsYWpJaXVLd3hCNlpTdG5IcXNzSEN0?=
 =?utf-8?B?WW01MEtxLzlBQXNNQ1hOTW1aYm5Qd0ZtUEUwRURKZmdlU1F5cFhCZ05uYWZi?=
 =?utf-8?B?TnM2a0hWbWJteDM1dTZmbXYvYkZHVjBIUnYyUWEzbHdMcTVWT3JzREhUSkI5?=
 =?utf-8?B?Nm1aN09YLzlGV1d5bU0wNkNIYWVhMmxZeHB3S1E5RllYc05LbU1RQkt4eTEw?=
 =?utf-8?B?UHI0QXJxS2JPM3VWNHJ6SkNRSmdZMW9KcnhMakozMlBTSXZJRy95OWp0WUJw?=
 =?utf-8?B?T3dYQk9zR3QweE11OU1GYTRMTXhlaytRT3RqaFFaUFB4NTNJSVVncnlwb3Z5?=
 =?utf-8?B?Z21hWXI0VjhzSlF5Y2lhNncwcyt0UWNzbHZ5SHQ4c0xmNmVqQWpLd1RreHBj?=
 =?utf-8?B?VE9SWmVxNWhQbDFxQk16a0lhU1RraThUUkc1QlB6cHAyV2twQkgxVDhVQjY2?=
 =?utf-8?B?K1RBcnlzMVZpV1g0cXBwWDRVRm1IOE9xeERvQTJBQytWbTNQYmp0blpFZTN0?=
 =?utf-8?B?bS9BMHZ6MWtZWm90MWlUajdCNUk1YktKcHczMDdSZVJLQXI3eCtjbk1QUFh1?=
 =?utf-8?B?cUZSTHQwK0dRSHUwWnZTak96amJKN3RBcVNhOHdJVThaUW1hTWZTelZtaU1s?=
 =?utf-8?B?ZUk1V2ZFdDZZTm9VTWJyaHhIWFlPN2p0dkdGNUZMSlBJWVM2ZE82VzVmV2pG?=
 =?utf-8?B?bGp1UUdwOUljRGtkQkVOUlNqU2FnYnlPaWZFbnptVVQycjIxQWZoUXk1Unhr?=
 =?utf-8?B?QVlreHlHYmF3eDlBcVExT0d0K2xDY3U3Nk90WVVNMGVyMUpONmk5V3J1UWVW?=
 =?utf-8?B?L0pTL0kvSzQ0ckJHMEJVSHMrRmloSldVd0VYdnNFWDhSVTRuQU1MblpmYUw0?=
 =?utf-8?B?aUc3YWIwaDUzOVNmbTY3QWxzYW0rL1JZTXYxMSs2YVRhUW83eURtVnhqRDkr?=
 =?utf-8?B?RndENW90T085LzRieHNvUjZ1RVpBPT0=?=
Content-ID: <9ED713722C3F8642A5914AF461EC44C9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbcbc2a-d5e1-4b7d-945f-08d9ea160f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 08:44:31.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sjwpzNzT3OvWTSo0Mxo7Ourd5yVWa1sgGSgrzv/9UwZF4udTM27MfGGMn5gbrYrYmbXT1vDOUrfX/1B3QDEjKA/XEcXMR9KwGUgplvrVQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Subject: Re: [Buildroot] [PATCH v3 1/2]
 configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
Cc: Ludovic.Desroches@microchip.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi82LzIyIDk6NTEgUE0sIEdpdWxpbyBCZW5ldHRpIHdyb3RlOg0KPiBIaSBFdWdlbiwgVGhv
bWFzLCBMdWRvdmljLA0KPiANCj4gT24gMDYvMDIvMjIgMjA6MzksIEV1Z2VuLkhyaXN0ZXZAbWlj
cm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDIvNi8yMiA0OjI1IFBNLCBHaXVsaW8gQmVuZXR0aSB3
cm90ZToNCj4+PiBIaSBUaG9tYXMsDQo+Pj4NCj4+PiBPbiAwNi8wMi8yMiAxMzoxNiwgVGhvbWFz
IFBldGF6em9uaSB3cm90ZToNCj4+Pj4gT24gU3VuLMKgIDYgRmViIDIwMjIgMTI6MjY6MTkgKzAx
MDANCj4+Pj4gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+Pj4gRml4ZXM6DQo+Pj4+PiBodHRwczovL2dpdGxhYi5j
b20veW1vcmluL2J1aWxkcm9vdC8tL2pvYnMvMjAzNTgyMTA5OA0KPj4+Pj4NCj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPg0KPj4+Pg0KPj4+PiBEaWQgeW91IGFjdHVhbGx5IHRlc3Qgb24gSFcgdGhhdCA1LjE1
LjIxIHdhcyB3b3JraW5nPw0KPj4+DQo+Pj4gVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgYm9h
cmQsIHNvIG5vLg0KPj4+DQo+Pj4+IFNob3VsZG4ndCB0aGlzIGJlDQo+Pj4+IGRvbmUgYnkgdGhl
IG9yaWdpbmFsIHN1Ym1pdHRlciBvZiB0aGUgZGVmY29uZmlnLg0KPj4+Pg0KPj4+PiBFdWdlbiwg
THVkb3ZpYz8NCj4+DQo+PiBJIGNhbiB0ZXN0IGl0LiBEbyB5b3UgaGF2ZSBhIGJ1aWx0IGFscmVh
ZHkgZG9uZSB3aXRoIGl0IG9uIHRvcCB0aGF0IEkNCj4+IGNvdWxkIGRvd25sb2FkID8gKHdvdWxk
IGNlcnRhaW5seSBzcGVlZCB0aGluZ3MgdXApDQo+IA0KPiBIZXJlIGFyZSB0aGUgMiBsaW5rcyB3
aXRoIHRoZSBwcmVidWlsdCBpbWFnZXMgZm9yIGJvdGggYm9hcmRzOg0KPiBodHRwczovL3d3dy5k
cm9wYm94LmNvbS9zL2F2OXZ6Mjg0NTloYWtqbC9taWNyb2NoaXBfc2FtYTdnNWVrX21tY19kZXYt
c2RjYXJkLmltZz9kbD0wIA0KPiANCj4gaHR0cHM6Ly93d3cuZHJvcGJveC5jb20vcy83N3QydHJ1
OTVmNmwwd2svbWljcm9jaGlwX3NhbWE3ZzVla19tbWMtc2RjYXJkLmltZz9kbD0wIA0KPiANCj4g
DQo+PiBJIGRvIG5vdCByZWFsbHkgdW5kZXJzdGFuZCB3aHkgd2UgbmVlZCB0byBoYXZlIGEgZml4
ZWQga2VybmVsIHZlcnNpb24uDQo+PiBUaGlzIGJvYXJkIHdvcmtzIHdpdGggbGF0ZXN0IExUUyBz
dGFydGluZyBmcm9tIDUuMTUuIENhbid0IGJ1aWxkcm9vdA0KPj4ganVzdCBzZWxlY3QgdGhhdCA/
DQo+IA0KPiBJdCBjYW4ndCBiZWNhdXNlIG90aGVyd2lzZSwgb25jZSBCdWlsZHJvb3QgTGF0ZXN0
IExpbnV4IHZlcnNpb24gZ2V0cw0KPiBidW1wZWQobGlrZSA1LjE2IGV0Yy4pLCB5b3VyIGRlZmNv
bmZpZyB3aWxsIGJlIGJ1aWx0IHdpdGggYSBuZXcgYW5kDQo+IHVudGVzdGVkIExpbnV4IHZlcnNp
b24oaS5lIDUuMTYpLiBTbyB3ZSBuZWVkIHRvIHNldCBhIHNwZWNpZmljIHZlcnNpb24sDQo+IHRl
c3QgaXQsIGNvbW1pdCBpdCwgYW5kIGluIHRoZSBmdXR1cmUgd2UgY2FuIGJ1bXAgaXQsIHdhaXQg
Zm9yIGEgSFcNCj4gdGVzdGluZywgY29tbWl0IGl0IGV0Yy4NCj4gDQo+PiBBbmQgd2h5IGp1c3Qg
YWRkaW5nIHRoZSBtaXNzaW5nIGRlcGVuZGVuY3kgZG9lcyBub3QgZml4IHRoaW5ncy4NCj4gDQo+
IEJlY2F1c2UgdGhhdCBvbmx5IGNob29zZXMgdGhlICJDdXN0b20ga2VybmVsIGhlYWRlcnMgc2Vy
aWVzIiBhbmQgbm90DQo+IExpbnV4IHZlcnNpb24sIHNvIG9uY2UgTGF0ZXN0IHZlcnNpb24gaXMg
YnVtcGVkKGkuZS4gdG8gNS4xNikgaXQgd29uJ3QNCj4gYmUgdmFsaWQgYW55bW9yZS4gVGhlIHBv
aW50IGhlcmUgaXMgdGhhdCB0aGlzOg0KPiBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNf
Q1VTVE9NXzVfMTUNCj4gaXMgbmVlZGVkIGJlY2F1c2Ugb2YgdGhlc2U6DQo+IEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT049eQ0KPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSI1LjE1LjIxIg0KPiANCj4gYW5kIHRoZXNlIF5eXiBhbGxvdyB1cyB0byBoYXZlIGEg
c3RhYmxlLCBIVyB0ZXN0ZWQgZGVmY29uZmlnLg0KPiANCj4+IChJIHJlbWVtYmVyIGJ1aWxkcm9v
dCBoYWQgc29tZXRoaW5nIGxpa2Uga2VybmVsIGxhdGVzdCB2ZXJzaW9uIHRvIHBpY2sgDQo+PiB1
cCApLg0KPiANCj4gVGhhdCBpcyBub3Qgd2hhdCB3ZSB3YW50IGJlY2F1c2Ugb2YgYWJvdmUgZXhw
bGFuYXRpb24uIEl0IGNhbiByZXN1bHQgaW4NCj4gYSBub24gd29ya2luZyBkZWZjb25maWcuDQoN
CkJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MA0KTGludXggdmVyc2lvbiA1LjE1LjIx
IChici11c2VyQDczMzQzY2RhMTU5MikgDQooYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVl
YWJpaGYtZ2NjLmJyX3JlYWwgKEJ1aWxkcm9vdCANCjIwMjEuMTEtMTUzOC1nMDM2NTc3ZDZiNSkg
MTAuMy4wLCBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zNi4xKSAjMSBTdW4gDQpGZWIgNiAxNDo0
MDowMyBVVEMgMjAyMg0KQ1BVOiBBUk12NyBQcm9jZXNzb3IgWzQxMGZjMDc1XSByZXZpc2lvbiA1
IChBUk12NyksIGNyPTEwYzUzYzdkDQoNCg0KIyBjYXQgL2V0Yy9vcy1yZWxlYXNlDQpOQU1FPUJ1
aWxkcm9vdA0KVkVSU0lPTj0yMDIxLjExLTE1MzgtZzAzNjU3N2Q2YjUNCklEPWJ1aWxkcm9vdA0K
VkVSU0lPTl9JRD0yMDIyLjAyLWdpdA0KUFJFVFRZX05BTUU9IkJ1aWxkcm9vdCAyMDIyLjAyLWdp
dCINCiMNCg0KDQpJdCBsb29rcyB0byBib290IGZpbmUuDQoNClRlc3RlZC1ieTogRXVnZW4gSHJp
c3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMN
Cj4gLS0gDQo+IEdpdWxpbyBCZW5ldHRpDQo+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
