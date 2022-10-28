Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB71DC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 12:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F394414EA;
	Fri, 28 Oct 2022 12:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F394414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5vXy65lA4Em; Fri, 28 Oct 2022 12:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A5BE4094D;
	Fri, 28 Oct 2022 12:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A5BE4094D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7BF1BF32B
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 12:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0E5E40911
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 12:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E5E40911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zI7yShqMUNDG for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 12:59:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC35402E7
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60045.outbound.protection.outlook.com [40.107.6.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADC35402E7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 12:59:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtnOcHy6l7wBIsuGft41cddrOf7kuRdM31LQ2Kt9SFaQFP37eWZsWkl9prKBSlxsbXOCjQYAhmSO2ZX+fxPOXoJSK8mzXgbDhAzT0p26+VjVszj8GsJMyqNfaby81nupsdXVhic6IsFtENdRbfpur/8VQbsjq+UYFl2KQDh4uFjeQoFqJXFM3aqqL6T+IHaLuI/66TCGF7YmhyCkpN/rLH7KDtpmal0E1pcQOn5sOXHUocqcqSmAkB2bcerBN7+CWRPjXK2uxcBNxOcQCKgc2eKecSu2xSMbFyEugXsPjllDV1E4/HT2iPrxK1DL3gbgZ7mmlbTjZBHpA972hvA2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOF8AMdDvig2Ona+wazr/a7VKoB5b3y/tnyYWbnHCRE=;
 b=ikNJQZnmVrFlU0Yx4lk0HP/Y0T/l6cD8sni3u0boUTmen9Vd6kTRI7Y0rG9dYzq7L5CVRPTOMSKNbkVhSpL2E0KEC8a7iCa1SsU5V4ohpNElhoAP7JYyRrmfemmunGnSqKtbenawh5Wr9oP5ZhQ3TNXhTcld4mw3Wf5wrvYd46e9GrW9SEyJzJca/3NT3VJfOEI68UcbLrbOT3QWqx+riTf8adi8+dL+mZKT4itq0xgs7olj/0ZZyZFPyJHmQQ7FJEMTrVmQJc9Wbq/QuLSJmFF9HoFRS0/TIlFlQmIM0filJHlkau8B1KBZsPIKyXYZEjDnHFP5Q68zWUdaGKpFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com (2603:10a6:3:97::9)
 by AM0PR06MB5171.eurprd06.prod.outlook.com (2603:10a6:208:e8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 12:59:04 +0000
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9]) by HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9%10]) with mapi id 15.20.5746.028; Fri, 28 Oct
 2022 12:59:03 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "fontaine.fabrice@gmail.com" <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/valijson: bump to version 0.7
Thread-Index: AQHY5lbCBpiqfJo8PE+9jVKTfMXcE64jzWuA
Date: Fri, 28 Oct 2022 12:59:03 +0000
Message-ID: <88f2cc785e1694565cb19f530036a85ef847dc0a.camel@vaisala.com>
References: <20221022204144.137169-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20221022204144.137169-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0601MB2361:EE_|AM0PR06MB5171:EE_
x-ms-office365-filtering-correlation-id: 47400cb3-4adc-4838-b1f3-08dab8e430c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K3UlW/ueWg85LsQ5LViKRntvWKacZZjrT8pCbAoGlzaPy4cCpcmIxClyqza7CXcgusaU5sOzNuT2BTpRvzZlghOPxSymaEDrJ/C1De74H+0vf6OUF9EITBgI/D46U+lYMUS1GciZ8BfxiHebD7RY5DLi65+ICoAxYRvsDxxgiII9Km4Cj93+sr6ifMtEUjg5J8VUIYdkKZzl+JjtZkN02P+0ivupL6oXa8IdtKd0rS+IVI5FDtizjIzY/sgrozBPT0QFGw+yxiGIHbObETqxH9bTv8rVmhl/zpgsXIUkfyswDKyWv3sz1qrEB8pp7pVqTYAEoS8lUHjZoCePtrM4hWV0+vdhjDCXlIPfFeGoW9VhcokqDE5JpxoG/APCn4qtgsgIcOfNCcvMcb/YuLzL/9zjMtnIj4MXjFYFJhqmHHfPtMXF/b5p95+NDGb/M2htI3mv54xOaBjiTNaD/FXnim68cgzRKspNiKtR6ArVzBuZBYuzJi69nAdT20AGhnEwPA7BhtMYNFaSrJvr9c3dSHCXvV4o0sL+2b5XJ6CtxG1ErXc/wkWD+G+gCWFXznJbP3LldYBYsGOyt+Tux90g7KUAxh+YBD95uo5xtZsyHRrZipghVTc6Q1YDNuSWliNrhSPSP3ICsqRMsQrNGvpiSUGldbLQL4hMmxhRclM9RfnJx2IVUlFcHM8vYBRWOjoOY3ZPpRt6gkqQ8xWQZkUNJ2VVTjh23WD8+HTCaa3UTGs926ATH7QFAzAZMk4RpRL0nR8H13V7jQqqlI4ezqR2l6ei9GkEz32FsPzlNBrN4Uk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0601MB2361.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199015)(36756003)(4744005)(4001150100001)(122000001)(5660300002)(2906002)(38100700002)(86362001)(38070700005)(2616005)(186003)(6512007)(26005)(966005)(6486002)(91956017)(71200400001)(478600001)(316002)(110136005)(41300700001)(8936002)(66946007)(4326008)(8676002)(66446008)(66476007)(66556008)(64756008)(76116006)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm9OWFpiaC84am9yQ3Nod3FsRFF1MWVvNjFxNEdvUEZxQW11aStBdG5CcGgx?=
 =?utf-8?B?K254eWZzcVAvTU05VnRUOGxGeGNrdHgzV0o0cnJJcDFML1FoQVJjdVdGTjZT?=
 =?utf-8?B?VmJiYVZLWWxadUdCM3YrMFdzSy84NXY0NTBvUWFHZWJ1S3lJUlpTY0hzMTNm?=
 =?utf-8?B?NkdmL0xLZSszaXV0dXJ5Y1BFTWpra3FlU1dCbzBQYTBoWDdhbXFvQnNpWE5L?=
 =?utf-8?B?THJrU3NCeTMydStpZkp5TEF2K2wwc2JmekcvYnoyZUR0NmJ4V3AyVDR1cTU3?=
 =?utf-8?B?NUJINExCeFZNQnh5eS9rZkNvbVpRSWE3akw1dTlhWFd5MTJSa2MwL0lhU3NG?=
 =?utf-8?B?NnhHenBHK29HUDVEVVdGRFkyQllTeEwrWTdiQm9WU3h0cU44ZVJpcm5leTZo?=
 =?utf-8?B?UGpsQkZVTnVNcWNndFFsOU9Sb3NWWDlncGJKWUZ0aXRzb2ZRb0R0NGNQdjF2?=
 =?utf-8?B?UlZneG9LRnA2WjB0YlJYbC9QWEI2VFJLajNEN1VyS2pyZ2xYbHhlT1JKN0FG?=
 =?utf-8?B?cndLZ3c3dFJkQWFyT2cyT1NxbUJERXlqeUp2VlFNVVRTU3VRMkNOSTBoc2p5?=
 =?utf-8?B?OFlsZTBMTGVjSkIvRnAwRmUrTU5MYmJDd3JEMDBvM3VaNDI1YVArMkczTVh0?=
 =?utf-8?B?R20xUWFhNXJVZTM5QnhwTWMzc0tSSlE1c2Z0ZGVyOFpZRXd0cFplcDJEV0JN?=
 =?utf-8?B?YytOemx6Wjg1eXBFOWEzU1B4OGxLcjBBVzFHUG5vUTJlRlMrYUxaSzVYVTBX?=
 =?utf-8?B?RTA0UUV6Q2tIZy9PQWU0MS9zeG1RTnZNVVl0Sm1SWGVCQURVRi9kSndVS2th?=
 =?utf-8?B?ZjV2VExtVmI4Zm0vWTFOcTVvVnBHaWY2U2ZGREpXZU1BRm9ZKytOaHE4empk?=
 =?utf-8?B?MEdzbktkNm5yaUNVM1AzUG1nMWdCR2JEaTB3U2dVbVMvZlFXN3BOVTBmTlU1?=
 =?utf-8?B?RG40bTQ4TGJ5YldqNVdWVlF6Si81TWhQMDdyY0txMCtQTzlqbXZlRSttRDk1?=
 =?utf-8?B?UVRwalhkQWVBeFBOSGtjc25tWXdIdGZRL0tkWUs5Smh2NmZWeWVQczg0Z3Jv?=
 =?utf-8?B?NGpDZUZXM1JXSHZrbXl0NDRBOXpPSjhVNFlZM2lGNldnRW83UzgzanFPeXdX?=
 =?utf-8?B?ODJxQU5wVkhkb3ZFS1cxOVVhNTd5a1pnSFVUWjJzWlNiaXU4ZkpFTXJUaW1U?=
 =?utf-8?B?VnQ5L3FmNnltVXI5bURnU1Jab29tSmtMVGNRMytNaGhqb2tuek5TcFJKeEdM?=
 =?utf-8?B?REtvMkpCcHNIV3IzZWN6aHJ0Ykhla1g3dW9TRzVtbXU1dGNJK3pWbitsSmVQ?=
 =?utf-8?B?STF2VTVSczFqbEdyMGVmOUI2cFBzelRXY0VYbXNydzBKc2tDQWZGUWp2bFlS?=
 =?utf-8?B?bUtUUHBNVFNGUWFMeXozbnkvcDJrM01MRFoyRnVrLzMyQ09wcUJKd2M3Y3Vs?=
 =?utf-8?B?N3JtUWJuWlZ3b25zR2l6c3dwSVpUczZPb3hhTDdIYXBWVnRFK2ZGaFpIaW91?=
 =?utf-8?B?SnY1ZUIzUXRxZnNsOWZnVW1jNmlMQ0FsTDNuNllrWUFub2xlNlJGanlHQjIz?=
 =?utf-8?B?VDlaVFBRNUdOT0pWV2VRNlBoc2Q4TkxkckZrd1pVaUZTQkJkZGNJQkFwejRS?=
 =?utf-8?B?VEpuMDd3WDhxazlzVkgrRjZYRDNwUDlWL0hPUzhtbkRVRW5UNWsyMi94UGVv?=
 =?utf-8?B?ZFdsRG9iRVNLaFZWWmRXR0c2MjJDKzFSS0ZZOCtoWTNFaGMvQ0xFeVBJVFk4?=
 =?utf-8?B?dlVXODdsdlJWakdNeCtzbW5oamFob0ZYQVliQm9uYThJL0F6QXF6YzJXeEp0?=
 =?utf-8?B?ZFViSStvS2xTcVl6QTc1aW8rSWNqK0pjQTBXSXRBN3pERU1uTHhRSTRJenpK?=
 =?utf-8?B?QmNUaWxyandUdUsyUkxIV0w5RFR4TjJ4Y09EaXI2OXRsd3JVVGdMc2xRMVZC?=
 =?utf-8?B?QjRsQUJ6NnlSek05VHR1Q1NuN2lCemZoalpzcUs0MXhtSWtQc2EzWkNVbVk4?=
 =?utf-8?B?UnlwV09jWkp2VU5UNGdKMk9EREV0dHlabUgrOEg1MFcxaWRLVzNlM2g1aCtu?=
 =?utf-8?B?aFFzZkpieXBqRmxreEdkM1ZBczZVbnE2aHJKV1NnUm5heVd2TlFNYlBJVFhV?=
 =?utf-8?B?dld3dTNlN2xNYTNvK2xoVis3ZmRwN0E2T3RNdWRqMm5nUGxiOXZaeVFjOHJn?=
 =?utf-8?Q?CJSKkOiXUzvfsrhH0xZ/Dno=3D?=
Content-ID: <2773E6D6C1AB5D4F91BCB41E16977AEF@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0601MB2361.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47400cb3-4adc-4838-b1f3-08dab8e430c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 12:59:03.6234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6+RHEkJL71Zd261V8gTTnitz/3/c3QtWXxRZipLPUZ6RR8a3Cyp+xHjPPfQSLqjuXxmxrzocM/XJShIRlwLgOAMe9h2H2HPnFJ1Ll14oDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5171
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vaisala.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOF8AMdDvig2Ona+wazr/a7VKoB5b3y/tnyYWbnHCRE=;
 b=XTciUX/eSmoDxZOSuuYVVMT5V9nSSKbuZProfav4+K+AJZWL0XfI//PkgTwbwgBfJvuKElN9Xl6aHM+DtbfU5UDagTeE8Haj4mccWvTxDsspSA6BN0zHvwGIzMsov7UakHhgpsRMVAlU7KRdTAmJ2YVANvsJdGkH7iRD3AIwwbKligAiaVITfEeCRJ3f6w2vU1ajABbNKttQiWlXk6QpROYBttTzb1WQ1htLMsl7ubuTGoZLGv6AfsStYlA08RiImHCGAMUjrKIhy3b3TK7H+OJ7IHrQwBFT/6kZZDmgM4/sBL2tz5o/Wu25yhv0sh4bKfMSPul8pGt8dU4juJJSxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256
 header.s=selector1 header.b=XTciUX/e
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/valijson: bump to version 0.7
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
From: Aaltonen Eero via buildroot <buildroot@buildroot.org>
Reply-To: Aaltonen Eero <eero.aaltonen@vaisala.com>
Cc: "matthew.weber@collins.com" <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 2022-10-22 at 22:41 +0200, Fabrice Fontaine wrote:
> 
> https://github.com/tristanpenman/valijson/releases/tag/v0.7
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Tested-by: Eero Aaltonen <eero.aaltonen@vaisala.com>

Good to me.
 
Testing:
* check-package
* check tar.gz hash
* make
   * checked sysroot/usr/include/valijson/ headers are there
   * checked sysroot/usr/lib/cmake/valijson/valijsonConfig.cmake is
there.

-- 
Eero Aaltonen
eero.aaltonen@vaisala.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
