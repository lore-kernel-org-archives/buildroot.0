Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8ACC54EBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 09:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6B2605F6;
	Tue, 10 Jan 2023 09:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC6B2605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKN2Anj3G50U; Tue, 10 Jan 2023 09:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B2B60F94;
	Tue, 10 Jan 2023 09:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B2B60F94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4E501BF86C
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD4981839
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD4981839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j20D6WKytQU2 for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 09:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E81468175A
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E81468175A
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 09:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCXLxQQ0xX9dJScTefxFeRrqLKflQ0pSye6vYhXrKCiEdcaSE8xGt5tqni/aWx9+5DOJhihUx/rir1IOzP+9kxdlRKLi8TNiN3D5gdk6dbsW0pfOhVVRptGsx7t29vAsMj0CjBSWIABkq4e18Zab8qYFIrVkWyHIh0LhONeS7mI/ceFA8pXXSnpz/YiGcZhcCv9SGosFLQjt9j3aXL2Zjfp+GtZ0UWDQeISByVO69ezCF32vtfeZWuLOkzCAuepLLQ++oGhEkeEyQ/fCGf+bGMHJWgcZTSUe/L7evI4HrEwbkwZT/yewBBqWoZePT7f0LdxGW/303AXbuKX8zll+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN0I7TwokQnUTDq3b1mOt9ukhtKyGmlBdsYZMGuvTik=;
 b=U8ztsq54RBgH0kUhn3YmaHUJEbcnsiWdVDPVcFtIfT5RKGRS8SVKya1bK19hyxsLcHHP000yXUEqujrVJVP/j4F+BpawkX/GEZqRSMOYjsQdgusLonbyC1o8rZwSenEtyV0c1en6UYBeHEimt3/O6TFIaz35ydDfd4XkHC07hyMpAnCgSdVb+5qyeegLR+EPBI7+LdNVq19cSiwQ/C5QZualfE4vRCMR4xRK7atMiooaGBv4TzEeujTmXtONg5TWqNFsk8uPXBCjLgV6L4oe7dcflFG+nIDQF400Cyfnlz6R5hmeBdqx8uf2PKqkk1AbSp+V6ZCJNIUxiYAZzHtpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1770.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:324::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:33:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:33:14 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/3] package/freescale-imx/imx-gpu-viv: add IMX8
 framebuffer support
Thread-Index: AQHZJNXR40NDFJ3cC0efFYZS2MGTWQ==
Date: Tue, 10 Jan 2023 09:33:14 +0000
Message-ID: <VI1P190MB0493F59C8F6F866D287232FC9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1770:EE_
x-ms-office365-filtering-correlation-id: 6dff644f-5b4c-4b05-21ec-08daf2edb2c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m3slfbypUpgTrzIjRsdyHTGurP8aoUSLOSxNNjWIgXnQE1v2wyNc2qctW48jmmpTMhzRglHmL2aXtrNdo8olG52RQht/XxHPcxNJiUfn4HtiZVs4WpBvM82hVl1qzU4/SnurCfRaCKYX/pjSZkOg6KlOSnpwT/s+ig9K52BYi265Vl/+7DQbc6dhdNgb42Aur/r1W1YQDh5LxYIcfbVLCu4G2LO7SsgVQPN+6mF0/iK9tQoFwtBPUUdnaSRoYIcer5Bfx3SJlM+OJsCdX2bxNZxLS4G7j5ZorbccU1hIxwkapvhoeyxmkxokljlXGz0aslevZ1+2qX7TMVuhEsKv+YDKol4CDLmhxfcfP8M1GAiE2C3ktp5VH0ibK6ebT0NAVAbsc4QtO4H78wmKaI2l7iurPqaRxK0Rm1BMGcdrnvOG6nbCFU9Ime8pctYYxaRCbsYEDgoOkAl4EM91ay1hzdkrP51IxZQkwR3v2s9fYzOJYyoQF6pzITRo/jMvXufm8+Ae7LPAb6BNdjIT8fgeVbzjxyLO1C9FmBoyIr45URsuUrJb3hAqREsoi/qMZB28rNm8l3obQS2b/RLhTKKGKk3cmU3rKpyPage+D/4vN7OMTz0iA/1/Zv7+QLMTgZ9dWX61chJeW4Cv/+Dr+lcSG1+RFZjySxOuoGXjA2hqtXak/6Y26frpK9qJtWC36EtbngSzbZZ/pzLHQDm9vnXdG+80niduPnyOcmdLb6tQluw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39840400004)(396003)(366004)(136003)(451199015)(76116006)(8676002)(54906003)(41300700001)(86362001)(6916009)(66446008)(66476007)(64756008)(4326008)(33656002)(38100700002)(122000001)(66946007)(38070700005)(6506007)(966005)(26005)(7696005)(71200400001)(478600001)(66556008)(55016003)(8936002)(316002)(2906002)(186003)(52536014)(83380400001)(5660300002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzcxNVl0VE9XeHVFMmdGU2M2N0NjZmhBOTJJWld3MWs0Z2pGbHhmNTl0Znhv?=
 =?utf-8?B?ZWNXQ1Y5eVd3U2VCSXYzOU55bVoxNFlxYkJUeHQrdXhsR3V5c1BlMXFmKzJV?=
 =?utf-8?B?ZjJWaXptV1BEMi9GdlczMkdtR3EwUllpV0l6TzluTElWZktoN0pHSWJxSFBr?=
 =?utf-8?B?UU5kbVVuRVJPbnk3Mi9aMUlVYzUrbnZGYnByeTdMUkhyeXM2L01tbkRMem9K?=
 =?utf-8?B?V2txODhrRVlyd0Y2bGorb3VuejhNQjBxVHJNZlRTTnhYUTkyc2JBWHlHYzc3?=
 =?utf-8?B?OXJ5YjQxc3NLdHJadzQxV0JRSkVXWS8vVHhmZ0NKS1JKRWxWQUQ4QzJJT25x?=
 =?utf-8?B?RmlYS1E3NDhCZnN1R0dJOGswdTJXZW03dFJ5L3dKNW9qcnBXekxxbWk0MXh6?=
 =?utf-8?B?R0xMV25MMEp5MjF4ajhvVEtDNStyOVd2OFRaQVJ6SjdRWEZFMkJsZ1RTendD?=
 =?utf-8?B?TkxYb2lFNyt0RFZKMGMvc3B0WFFLcGVmNEc0NDlYTU8xK3FNMnVmNThSTllu?=
 =?utf-8?B?TVlDVmtFYWJYNG95T2YyRVlGcDUrdk9DUWdVRkxVd29UcWJaajhXU3BoZFdV?=
 =?utf-8?B?T2FxbWFWU043SjhVa1Nmamg4bk5DOTJNMjloYThuL0sxRW0rZFhCaitkYVdh?=
 =?utf-8?B?cFJjMXlXcnJpMy9KTWlNT3kyZ1ZRcmRlait4RFRvWnhlQlhzdUxzRGRSbjY5?=
 =?utf-8?B?emVIaVVGbWxJY1liendQTTRPZVVXcTlCUkliNDBEcUs5d0o0eDlURUYrQWY5?=
 =?utf-8?B?am1Ka1haZXd3aFZhdWdYbmZsNHMzd1pKYWtKYWFlMmtFdjA3bW0zdWw4WmhQ?=
 =?utf-8?B?WTRBSE8vTTZLWVY3NU1xYTdiK1NYZFQ1RE0zaDVPS055dWdOVXpoQkp3UkYr?=
 =?utf-8?B?ak1PTVBKUWRWNU4wdFNoUVp4NU1mOW92STJDVFZEZG83WWY5WEhYNzlFOWNw?=
 =?utf-8?B?RW9DeTNwM3Q2UEtUcmRvR3ExZ1c0TGErUFo1UG40eUYxenp4RkJNaG9xNDZQ?=
 =?utf-8?B?cmdtMGtkdGxLWTEvVTREZ2F6OHdSK2dWRzRxTFp1eWpIMTVyWHIzK1lwT0Q0?=
 =?utf-8?B?WlZWOUJvMWsrSlFlSk1SeVN1TjVyUDBOd0Y4NXk5b25jRjBaZnhZVlZHTTQx?=
 =?utf-8?B?ZDQ5YjVzemFkdkkybTQ0WXR0eHFKL3dibHJLUVRhQzdXcEFIaHUvOGRSVUpn?=
 =?utf-8?B?NWkyYkVjbE0zbEdqdmVYcWtHb0dBNmwvUWNoZlpZWC9OZzNPTDdDeWJEQ1Bq?=
 =?utf-8?B?U1ZybTVsemEzV0JhWGowRFBidXBDcWpldUxmYzFWdUhPWEhockk1Tm1ST3Bq?=
 =?utf-8?B?ajZtMFBMQWtaczFMZjJveWxiZ1ZwTm83bjBDcXNGNXhRS3hCbVI1V0doNlVS?=
 =?utf-8?B?d2U3MnVvbkRQWlg4Rnp5elNOaFZqemZlVHJsYmQwN0c5a0E0aFEyRUlUK1RQ?=
 =?utf-8?B?bkd0S1FvczRtTFNYOUFxc1dPWFJSckZrQjRsNU5SMkkzWUFleENQZS9VUEZ2?=
 =?utf-8?B?TkpIbUk1dWszOGVyd1p6N0YwdUFxcXZkUFJIU0VlMzlidHVLcFY0YUF2ZUF3?=
 =?utf-8?B?TWt3L3lKQ1hpWG03TGZLSldmb0xCTHFyeVplNnZKKzE4Q1ZqWjQ5VFVkR3BR?=
 =?utf-8?B?UnI1emNDTy9RTzlnSkR2V1FleVNYV3llZlpwS0lzODFRbGF5ZVlUaWtPTzd1?=
 =?utf-8?B?Q3hvc3E0WjhmMzVyc3RaRm5WdHhnNDhaZXAwRDY3NFVjZ1VuVUdVUndYazNX?=
 =?utf-8?B?NEJ1OUdXL0JmSFdnOHBRWitrSTQyVjZXdjJXSno3R0g5eE96U2czaXdJWnF2?=
 =?utf-8?B?L0ptSndsUWV0WGdFME5uMTBNOS9mcVhKOXpYK3RwUUQyejhtYllBSkVJTzk1?=
 =?utf-8?B?RENrOUJQMU9LeVNid1B5Sys1L3NLNDA2bVlSWWZEcThCRFJlcG5IMjdFSWlB?=
 =?utf-8?B?RlFmNFBFM1RmMEIwelFUd3hCS3FaU0lKTVdFTXV0RjNHdE56OUVFVmNFS0ta?=
 =?utf-8?B?R2xlRzh3ekdVd2VoNGFLY05BU2Q4dnpmVmc4dXZYZGxLNGdqM1VFOGZBNGFV?=
 =?utf-8?B?Ynl5RFBQQTlWdWVLY1kwOWpmOFp4N3VSanhVNzBFOG9obGhUNWROcU1wT3VQ?=
 =?utf-8?Q?CiIY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dff644f-5b4c-4b05-21ec-08daf2edb2c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 09:33:14.6599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGBneChIuC24NURU1ROFUCrF6vlbiz+71Mvf1cBibNAVoGn5SdFxysAv4iUousX8Z2Fk5OS6xvvGWKKHJ3df4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1770
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN0I7TwokQnUTDq3b1mOt9ukhtKyGmlBdsYZMGuvTik=;
 b=VbrSMP8yjVf9Yk35etsQYHfF7BC0pamMJGKpOaWdfr8EZChKPBL2avwpJlFOBfsHyNXQbXtVPbPAPSE4eNOUF+1wkQILdShE+7eLYNt0YKy/E+uK1cStw40399PUf17bfQ9oXlS7mqd49DjQ9LThyrpL1O74sxUtYNgw3Wzab7M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=VbrSMP8y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv: add IMX8
 framebuffer support
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWNjb3JkaW5nIHRvIG1ldGEtZnJlZXNjYWxlIFswXSB0aGUgZnJhbWVidWZmZXIgb3V0cHV0IGNh
biBiZSBlbmFibGVkIG9uCklNWDggYnkgdXNpbmcgdGhlIHdheWxhbmQgbGlicmFyaWVzIHRvZ2V0
aGVyIHdpdGggZWdsLnBjLgoKVGVzdGVkIG9uIGFuIGlteDhtbiBieSBydW5uaW5nIGttc2N1YmUu
IEVHTCBhbmQgR0xFUyBzdXBwb3J0IGRldGVjdGVkLgoKWzBdOiBodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL21ldGEtZnJlZXNjYWxlL3RyZWUvcmVjaXBlcy1ncmFwaGljcy9pbXgtZ3B1LXZp
di9pbXgtZ3B1LXZpdi02LmluYwoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIExhbmcgPGQubGFuZ0Bh
YmF0ZWMuYXQ+Ci0tLQrCoHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9Db25maWcu
aW4gwqAgfCDCoDQgKystLQrCoC4uLi9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUt
dml2Lm1rIMKgfCAyMCArKysrKysrKysrLS0tLS0tLS0tCsKgMiBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LWdwdS12aXYvQ29uZmlnLmluIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC1ncHUtdml2L0NvbmZpZy5pbgppbmRleCBiYzMwNzk4Y2E1Li5hMjQ1YTFkMDg5IDEwMDY0NAot
LS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9Db25maWcuaW4KQEAgLTQ1LDggKzQ1LDgg
QEAgY2hvaWNlCsKgCsKgY29uZmlnIEJSMl9QQUNLQUdFX0lNWF9HUFVfVklWX09VVFBVVF9GQgrC
oOKAguKAguKAguKAguKAgmJvb2wgIkZyYW1lYnVmZmVyIgot4oCC4oCC4oCC4oCC4oCCIyBUaGUg
aS5NWDggYmxvYiBkb2Vzbid0IHN1cHBvcnQgRkIgb3V0cHV0Ci3igILigILigILigILigIJkZXBl
bmRzIG9uICFCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDhNCivigILigILi
gILigILigIIjIEZyYW1lYnVmZmVyIG91dHB1dCBvbiBJTVg4IChBUk02NCkgdXNlcyB0aGUgd2F5
bGFuZCBsaWJyYXJpZXMKK+KAguKAguKAguKAguKAgnNlbGVjdCBCUjJfUEFDS0FHRV9XQVlMQU5E
IGlmIEJSMl9hYXJjaDY0CsKgCsKgY29uZmlnIEJSMl9QQUNLQUdFX0lNWF9HUFVfVklWX09VVFBV
VF9XTArCoOKAguKAguKAguKAguKAgmJvb2wgIldheWxhbmQiCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvaW14LWdwdS12aXYubWsgYi9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LWdwdS12aXYvaW14LWdwdS12aXYubWsKaW5kZXggZTBlOGEzMTUzMy4uMzU5
MjliMGU1YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lt
eC1ncHUtdml2Lm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgt
Z3B1LXZpdi5tawpAQCAtMjYsMzQgKzI2LDM2IEBAIGVuZGlmCsKgCsKgSU1YX0dQVV9WSVZfTElC
X1RBUkdFVCA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9JTVhfR1BVX1ZJVl9PVVRQVVQp
KQrCoAotIyBMaWJyYXJpZXMgYXJlIGxpbmtlZCBhZ2FpbnN0IGxpYmRybSwgZXhjZXB0IGZyYW1l
YnVmZmVyIG91dHB1dCBvbiBBUk0KKyMgTGlicmFyaWVzIGFyZSBsaW5rZWQgYWdhaW5zdCBsaWJk
cm0gYW5kIHdheWxhbmQsIGV4Y2VwdCBmcmFtZWJ1ZmZlciBvdXRwdXQgb24gQVJNCsKgaWZuZXEg
KCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCkkKEJSMl9hcm0pLGZieSkKLUlNWF9HUFVfVklWX0RF
UEVOREVOQ0lFUyArPSBsaWJkcm0KLWVuZGlmCi0KLWlmZXEgKCQoSU1YX0dQVV9WSVZfTElCX1RB
UkdFVCksd2F5bGFuZCkKLUlNWF9HUFVfVklWX0RFUEVOREVOQ0lFUyArPSB3YXlsYW5kCitJTVhf
R1BVX1ZJVl9ERVBFTkRFTkNJRVMgKz0gbGliZHJtIHdheWxhbmQKwqBlbmRpZgrCoArCoGRlZmlu
ZSBJTVhfR1BVX1ZJVl9FWFRSQUNUX0NNRFMKwqDigILigILigILigILigIIkKGNhbGwgTlhQX0VY
VFJBQ1RfSEVMUEVSLCQoSU1YX0dQVV9WSVZfRExfRElSKS8kKElNWF9HUFVfVklWX1NPVVJDRSkp
CsKgZW5kZWYKwqAKLWlmZXEgKCQoSU1YX0dQVV9WSVZfTElCX1RBUkdFVCksZmIpCitpZmVxICgk
KElNWF9HUFVfVklWX0xJQl9UQVJHRVQpJChCUjJfYXJtKSxmYnkpCitJTVhfR1BVX1ZJVl9CQUNL
RU5EX0RJUiA9IGZiCsKgZGVmaW5lIElNWF9HUFVfVklWX0ZJWFVQX1BLR0NPTkZJRwrCoOKAguKA
guKAguKAguKAgmxuIC1zZiBlZ2xfbGludXhmYi5wYyAkKEBEKS9ncHUtY29yZS91c3IvbGliL3Br
Z2NvbmZpZy9lZ2wucGMKwqBlbmRlZgotZWxzZSBpZmVxICgkKElNWF9HUFVfVklWX0xJQl9UQVJH
RVQpLHdheWxhbmQpCitlbHNlCisjIEZyYW1lYnVmZmVyIG91dHB1dCBvbiBJTVg4IChBUk02NCkg
dXNlcyBlZ2wucGMKKyMgYW5kIHRoZSBzYW1lIGxpYnJhcmllcyBhcyB0aGUgd2F5bGFuZCBiYWNr
ZW5kLgorSU1YX0dQVV9WSVZfQkFDS0VORF9ESVIgPSB3YXlsYW5kCitpZmVxICgkKElNWF9HUFVf
VklWX0xJQl9UQVJHRVQpLHdheWxhbmQpCsKgZGVmaW5lIElNWF9HUFVfVklWX0ZJWFVQX1BLR0NP
TkZJRwrCoOKAguKAguKAguKAguKAgmxuIC1zZiBlZ2xfd2F5bGFuZC5wYyAkKEBEKS9ncHUtY29y
ZS91c3IvbGliL3BrZ2NvbmZpZy9lZ2wucGMKwqBlbmRlZgrCoGVuZGlmCitlbmRpZgrCoArCoCMg
SW5zdGVhZCBvZiBidWlsZGluZywgd2UgZml4IHVwIHRoZSBpbmNvbnNpc3RlbmNpZXMgdGhhdCBl
eGlzdArCoCMgaW4gdGhlIHVwc3RyZWFtIGFyY2hpdmUgaGVyZS4gV2UgYWxzbyByZW1vdmUgdW51
c2VkIGJhY2tlbmQgZmlsZXMuCsKgIyBNYWtlIHN1cmUgdGhlc2UgY29tbWFuZHMgYXJlIGlkZW1w
b3RlbnQuCsKgZGVmaW5lIElNWF9HUFVfVklWX0JVSUxEX0NNRFMKLeKAguKAguKAguKAguKAgmNw
IC1kcGZyICQoQEQpL2dwdS1jb3JlL3Vzci9saWIvJChJTVhfR1BVX1ZJVl9MSUJfVEFSR0VUKS8q
ICQoQEQpL2dwdS1jb3JlL3Vzci9saWIvCivigILigILigILigILigIJjcCAtZHBmciAkKEBEKS9n
cHUtY29yZS91c3IvbGliLyQoSU1YX0dQVV9WSVZfQkFDS0VORF9ESVIpLyogJChARCkvZ3B1LWNv
cmUvdXNyL2xpYi8KwqDigILigILigILigILigIIkKGZvcmVhY2ggYmFja2VuZCxmYiB3YXlsYW5k
LCBcCsKg4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCJChSTSkgLXIgJChARCkvZ3B1
LWNvcmUvdXNyL2xpYi8kKGJhY2tlbmQpCsKg4oCC4oCC4oCC4oCC4oCCKQotLSAKMi4yNS4xCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
