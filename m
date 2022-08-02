Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F8BC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 09:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCE1480CD0;
	Tue,  2 Aug 2022 09:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE1480CD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMqybQhXcsuJ; Tue,  2 Aug 2022 09:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9F38139F;
	Tue,  2 Aug 2022 09:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9F38139F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 233041BF57B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 09:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A49B6058B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 09:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A49B6058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6snrm3ux7sr for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 09:23:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF66600CB
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAF66600CB
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 09:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+kLbLZMw9NOomjdKuxgTgJWTkVWgpL3EncKQk+VC4vo+xxKJagC4s09vZ3JVs8ZF5J3IWk3FnmOIGPndFhmNwkd2l55k2B24+GcceZ4x7pXaI5suNYhSyApfMDeqoaPvQZSQqVHE0HwauXzIzfGe4BWCKFatOi8jtQ87fj/+TLzAg6f99JmAhs69vU4o0lOXnA14xXGShzNbcWu7ljtyBq1CXbS8DSApRX0cDfd9s1cSzrKxvJGk3dHLityOsVwPZxKNx7TYkfgyc9Zh/uCoQrJaxW7XLW15b0fhQM8vID4R00odqvK3O2OFTj+I+d2AS4grafgAAhsYvQQOPUHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLYoZNY66XnLvsjVbXBnJKppp+Wm3mxLFl6MJCxDATU=;
 b=VzczWzivmNOwj9TFRO9dBXF/m78qYlkAXoC65qU2IgWXtLMq0zg1UlPk9Yg7dqc5gqPyS6KiOoi2ppbE14+kHqvD+HpB8QMeeCCINeb+WZLkSIKtYkMLemiGJpeGhruBR4jkSseg6riXHJTOPcsdkAmX5ybQPbB09dwrfeBPj//UiedFGhXan2kBclScV6Y8QvVBl35fiNCzrP91smnPsyHLbEhUrIpe45DWAq8EMvTrSeCzADybLrfdMYmI37VJrEY/5GOqg1HrQs2iwELd/sw7hOSAQeHEZ9fE67LteQ4AuEjb81NqJt7DhU88r8e9vRMYlLIoBw+tL7nESL2Ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DB9PR04MB9378.eurprd04.prod.outlook.com (2603:10a6:10:36a::6)
 by AS8PR04MB8691.eurprd04.prod.outlook.com (2603:10a6:20b:42a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 09:23:18 +0000
Received: from DB9PR04MB9378.eurprd04.prod.outlook.com
 ([fe80::79c0:7ff0:98a3:db3a]) by DB9PR04MB9378.eurprd04.prod.outlook.com
 ([fe80::79c0:7ff0:98a3:db3a%3]) with mapi id 15.20.5482.014; Tue, 2 Aug 2022
 09:23:18 +0000
Message-ID: <102c1fc0-26d2-260e-46d2-40c498550c17@theobroma-systems.com>
Date: Tue, 2 Aug 2022 11:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220801204227.2993126-1-yann.morin.1998@free.fr>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220801204227.2993126-1-yann.morin.1998@free.fr>
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To DB9PR04MB9378.eurprd04.prod.outlook.com
 (2603:10a6:10:36a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89bfa034-3ccd-4250-404a-08da7468a28c
X-MS-TrafficTypeDiagnostic: AS8PR04MB8691:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQ5a6JU0ThVbFnop43AmS4q2E4NDVZSqrkhSwYEBSPCyBtqpjt1mwD9uBWLbQus1ZgUUF0QLAR0Y7Q3ZvQB1MGWly6HkJGtq9kFSUPotSTHRqYOJDxzOIrxkciP4IO0KpSWaYn77r0UERh9EUcFEj5GmrIBtVRAcMaeQlOwQZlzGdvvagM67ulEufgJpKwwbLTCzVXD5Z7KltVmREt8v/yRxAHA+gqRZWhWKmCiie8zHySdTKZGCBWnW8QLK8asn+Bj2Rxbca18pIgzppr/dgdvbAfTz/nTy2hyS2vvFLB574xAtvmpYhPUTI4RcpmpMDXZVojQ4QT1NShT5vZOxqQsgmCIA6Z3DCS5ote/5eFxKYn5XQBTBtqWssf3rq+6g5cnxgnZdjz8tclMRLMRPQKPo4E//eVh3xlp7DVhb/ZC8SFhReJBbq1iLWJwN9NcAr+c/lllEQepmXerMdh9aqWhHwODVvHRJOVew/OEJHWLnrC65vfrEzWCpNLQBeSQnzC38aIKIqaJsSOwJxjUC/i9nEnGnE/fvqpd8HIEpSdbh49r6ZcU1a1hMduZlH0QCHbRP72ns2s6Z4hkgWAHpwlTKmIWzGSOvaisjv+CpwM40DgkftXawL6aSRtNiHati4+1UkBCEAhxmGUoT4mmunqzF3TFuhDj4qx+J6LgCCLrkiW/WV83bWZO+h9RBX451UlxfgQ4ZjhYJGmdbd1s8XNXzMPzjwGGaBhG3jAeSFmgd73tydzwJ1D7qWIA3GNwsNnKhvVEgtubCNKHOHJqv3lo+J5BMVoYNu937J0zw7QiSIpxyB7rG/KRiE2R2HPrQzPbeETugX1WgrkDvkFwde8yX5P7EkUhxAFzfEWaiDzrrJ3DW3yUKLsWuNHHaAwk+cjupQ+hlb7AvNyQKVHABkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9378.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(376002)(346002)(39850400004)(478600001)(6486002)(6506007)(41300700001)(316002)(54906003)(31696002)(86362001)(83380400001)(38100700002)(2616005)(53546011)(26005)(6512007)(186003)(36756003)(31686004)(2906002)(44832011)(5660300002)(66476007)(66556008)(8936002)(66946007)(8676002)(4326008)(45980500001)(15866825006)(41080700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXBjb0d0WmJiWndweTBiUmZQclk1R2dqOXU1TlJiQ0syb0lSdW04SE9id3NS?=
 =?utf-8?B?bS8yTDVyaVFYZnZaTUJFWmhWcysvbDVTcXdJa2huM2pFK2c3azJ4WXY3Z3lz?=
 =?utf-8?B?ampibTdPS2N6R0dZWmZ2WGlpOUpiSFdLdUNib09CNXZvRWdLR2ExMGRZL0RC?=
 =?utf-8?B?T0tlQzlxWC8ydnV6VjNiMW1JZjJ1MlJLTmRlem9ad3g1OWVlYUVsbUwzVlJD?=
 =?utf-8?B?UXVhd0pWQTJSdmp1L2t5MDc0K3h4N1FhQ3hQLzdaS1lzOHF4b3pTMDZ5Qm54?=
 =?utf-8?B?Q0tZYjZNaVFzNm5nSlJlL0psSHIrWFB4YXJYMzV0cisxYUIxMWpQWkZFdTA4?=
 =?utf-8?B?UVlQRDJpUmdLRUFTaFRGc1QraGxtanpvVEs0dkx2WjBBRmZsUTd2WjRaK1lk?=
 =?utf-8?B?eUNBRzdRTGdGeWxQSEg2SjFKOXR0cUhwNXFnb0NZd3FBS3pEa1hDN0xxenlY?=
 =?utf-8?B?WGxycmJLZlVKbnlNN2NDZGVvVmpQQzFQdlhpalE1RDlEcGo2OE54SFdzYnFx?=
 =?utf-8?B?YzNuM1g2V0FzaFB2TU1MOTB3K2JReTdEUFZRM3ROazhpOFpJQTdWeHBNWEdD?=
 =?utf-8?B?UXNMb1RiTE9qU2JoM21ybVZsU0o0a1c2MlRGb3A0dlYrSkozbGIzUksydWtz?=
 =?utf-8?B?ZGhaRlJuVUZ0Nk9zTXg4L2NKSXBIZlNyNlFENlM4WnlZUDQyMy91OEtyS1ND?=
 =?utf-8?B?V2RWUE9TaXpURjRtSTVOa051MkFxdVIwRmUySDBpV3RPN0hZeURiUFZvc1Ev?=
 =?utf-8?B?ei9MYmNyeWFEQVVXRTh6S2lHdHZ4LzMxVEdQR2hsUkNzVVlMK0VhVFNKZlRL?=
 =?utf-8?B?cHB6UlBnRXlmZHM2T1IxNUtBRmc2dzBuQUFDTS9tcGZOdXdNYnFaVjc1cWJQ?=
 =?utf-8?B?ekwzVEsrMWQyV0NFQXNWR2pBNUlrY21sVW9rTGpqN1ZBazBwUUZQTjgxL0lq?=
 =?utf-8?B?allHQzBZNGpzaDVRVXp5UTZYMDR0Wm5uRVpiQkdRN0gxZk9mMHE1b2lrYnZ5?=
 =?utf-8?B?eDZKTGNYdVpMUTFBeXBJUWlRc1B2V2VFUjcwSlFWTk1aeEE4dkxZbGVvMlhh?=
 =?utf-8?B?VHRtMTc5NTlDdDFPSVNOOWpDR09mV1FjNFk0WnplMkQxNDZ2bWNYUnhkWGpO?=
 =?utf-8?B?K0JNWlVCMkNlbkE4Z1JjYlFhUXRMNW1nWU5lYWl5YzQ4QklpS0h6VUdOSU1W?=
 =?utf-8?B?NFZrOHJIWHhydTZObXRtbzRueHAwOWhPSlF2MWIwSVU4eHNDSTdLaHpNT29o?=
 =?utf-8?B?dThyZkxWYXd4ZXduMVhSdkw0V0xNd0IveDNwNTdsZFZzU3ZQUFMrcFRvTGRj?=
 =?utf-8?B?SXFCVW9vbnhsb2ZHYlNCdW9PZXcrSVVCN2xqUmtuaVdwa2NxT2ZaemFvWWNM?=
 =?utf-8?B?Y3I3bGNJaXJjRXJFdjdjakZDQm1nMjdBZGlPbzlZaEt0M1RVOVJ2eDdidFdQ?=
 =?utf-8?B?dVoyTXNnL0o1QW5PNEhVWjNNZWZYWFg1OHROWmVadE1mOUgwQ0s2OEJvcnhL?=
 =?utf-8?B?eXV4bkhGQ0ZwTTVWQlVYNXQ0QXFpTjR4djN5RWNNQll0V3VCdmJvTlljMFRG?=
 =?utf-8?B?VVgrNitUUEc5NHhjMVgycUFPU2ZrcUlFZ1lmWDRvS1F5d2hrMlIwSkp6Nzlu?=
 =?utf-8?B?NzhkbXFxR2lSa2JEU085Qm1VWXlaTUJBSTlaenRGejE1N3l3T3k4bzRWanNI?=
 =?utf-8?B?ZzdCSVg2OFprWEdHUFluMFFaYk4zNER4L0J0MHFwdFBqM0Foc1hESUhLenh3?=
 =?utf-8?B?WGFBd2VySWlvYUFIV0N6b3c4NzVaeWwxRlVrMTV4S1pPMFcrdVI3ZGlvTmtV?=
 =?utf-8?B?ZFI0OUQzM2lYNGU3SURvaHQ0QUpKQ0xyb3NFQjlGU0Q0NG82aTRtVVhMWnIr?=
 =?utf-8?B?Ukk3NDZhSTJXazhIOTUrQVh5UUpVcUo4Nzh6eW5LSHhhalI5Ym1KR1padmsr?=
 =?utf-8?B?cmlBTmxNQWh2Z3d4NzNlTlFITWdDNVFsVnJyajFadjA1RDZxd0tWcEo5RmV4?=
 =?utf-8?B?QlVVTDNxNnNvd1ViZ3hHNzJ0Tm5KaEQ4Zm14dkNJVnplWDlmWGFnOUV2VURO?=
 =?utf-8?B?K0FtbzlQdGQyelQwV1Z1YWxzM3gxQVlkdGhXUjNNYXpPT1pkWkx2U09JSnpD?=
 =?utf-8?B?QkxxTDR6YmJPaFBpMGx4NHVBUE0vN1VyYXIrYkVTRllreXQyVms0STlhcmVC?=
 =?utf-8?Q?kUjEvxcjBKcev6DTStOBh+Y=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bfa034-3ccd-4250-404a-08da7468a28c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9378.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:23:18.0117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uABdu54e0nsZjsMZvynGYhzRWgbPsM+GJnzw0KAf1v/5SpbP2WY6zo1R/qy/LJ1gFmkKfP/zaMdj2x9CDRVj97o6iXz8dB4SGM9mHVUEmB2qyNVFJl0wHgEGH3SCo3L2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLYoZNY66XnLvsjVbXBnJKppp+Wm3mxLFl6MJCxDATU=;
 b=KcMpKmTn6BRifhEQNjMdT4AZtkr7AKCilMZwV1bs21dgVL4yV8XRi0Tg+sKnZpUKj5TUs810BFOBAwQQshz83y/AkTu/5hy+G6PvCPPPYrjuqmyHxk0v+ZqpMaA7/+ry0JHNY/DHqhtHVNh/sqVl00k8cv6VT/XF/6K+hDC+jQg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
 header.i=@cherrycloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=KcMpKmTn
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCHv2] Makefile: fix show-vars for good this time
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
Cc: Roosen Henri <Henri.Roosen@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 8/1/22 22:42, Yann E. MORIN wrote:
> Commit 5c54c3ef3db2 (Makefile: workaround make 4.3 issue for 'printvars
> and 'show-vars') did not fully fix the show-vars case, which still
> segfaults.
> 
> Overall, show-vars generates a JSON blurb. That is supposed to be
> machine-readable, so we do not care that the variables are sorted, so
> we get rid of it to (slightly) simplify the code.
> 
> Then, we currently iterate twice on the list of variables: the first one
> to filter-out the 'internal' variables, and the second one to filter
> only the variables matching the pattern. We can do away by iterating
> only once, and applying both filters at once.
> 
> Since we now have an 'and' condition, we can take advantage of it: when
> none of the items in $(and) are empty, $(and) evaluates to the last
> item, while it evaluates to empty if any of the items is empty. So we
> can coalesce the $(if) and $(and) together: $(if $(and a,b),c) is
> equivalent to: $(and a,b,c) ; this gains us one parentheses depth.
> 
> Finally, the cause for the segfault is an overly-long call to $(info).
> Reducing that is not easy: we want to call clean-json on the whole of
> the JSON blurb, so we can't emit the individual variables one by one, or
> the trailing comma would not be trimmed away.
> 
> So, we go crazy: we just output each word from clean-json with $(info).
> 
> We can do that, because mk-json-str transforms all spaces in a string
> to an escaped UTF-8 sequence, so we will never have spaces in values;
> the keys are the variables, so they won't have spaces either; spaces in
> the rest of the JSON blurb are totally optional, so we don't care how
> many there are. We know there are spaces, because we explicitly
> introduce some (after "expanded" or "raw", for example), so we should
> never hit a too-big word for $(info) to print.
> 
> Thanks to Henri for the suggestion to push $(info) further inside the
> macro.
> 
> Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Roosen Henri <Henri.Roosen@ginzinger.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 

Tested-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Upon request, "time efficiency" regression test on old make:

 From within debian:buster container (make 4.2.1), from master 
2a592f0b2a400825a95e19113ce996bbc5c431d7:

# make raspberrypi4_defconfig
# time make show-vars > foo.json

real	0m19.001s
user	0m15.828s
sys	0m3.305s
# time make printvars VARS='%' > foo.txt

real	0m16.271s
user	0m13.056s
sys	0m3.360s
# ls -l foo.json foo.txt
-rw-r--r--. 1 qschulz qschulz 62448149 Aug  2 09:06 foo.json
-rw-r--r--. 1 qschulz qschulz 32813206 Aug  2 09:07 foo.txt

 From within debian:buster container (make 4.2.1), with this patch NOT 
applied and 5c54c3ef3d commit reverted:

# make raspberrypi4_defconfig
# time make show-vars > foo.json

real	0m24.325s
user	0m19.617s
sys	0m4.905s
# time make printvars VARS='%' > foo.txt

real	0m16.223s
user	0m12.895s
sys	0m3.469s
# ls -l foo.json foo.txt
-rw-r--r--. 1 qschulz qschulz 62448149 Aug  2 09:04 foo.json
-rw-r--r--. 1 qschulz qschulz 32813206 Aug  2 09:09 foo.txt

 From within debian:buster container (make 4.2.1), with this patch applied:

# make raspberrypi4_defconfig
# time make show-vars > foo.json

real	0m22.634s
user	0m17.542s
sys	0m5.202s
# time make printvars VARS='%' > foo.txt

real	0m16.829s
user	0m13.381s
sys	0m3.579s
# ls -l foo.json foo.txt
-rw-r--r--. 1 qschulz qschulz 62448149 Aug  2 09:02 foo.json
-rw-r--r--. 1 qschulz qschulz 32813206 Aug  2 09:14 foo.txt

I wouldn't trust too much the reports from the time tool because I had 
some runs where it was twice longer for some reason.

In short, it does not seem to impact too much time-wise.

Thanks,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
