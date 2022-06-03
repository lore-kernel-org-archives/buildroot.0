Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B549C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 10:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC1D1404F8;
	Fri,  3 Jun 2022 10:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOf-0JS4n8Bm; Fri,  3 Jun 2022 10:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F68404BF;
	Fri,  3 Jun 2022 10:51:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB811BF2A3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 10:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59CD740905
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 10:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54EJm_i8oFWI for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 10:51:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::612])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11873408F8
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 10:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/z8BasD/VNmLYcHW04pUKdLQskERRdkBu4cU03YSaQ0+P/IsY88P8Xu+wp6jCMciIgpjgP8zdPcocE2qWg5IuUH65o9kohTHhKoZvUddcpTyBcUonJf68xbr1FmTwYLQWQIUshuFnsFkmRsec7Ub5nhyUHlmyoUws0Wl+V0WZ8qiMITVACIJL2uLXY8W7eOfrBroap5gUJUqFWPpQHpaX9qNAep8fJftsKcO/netH4z3vOPJnFpXjLvA8I4F+48uMUuWM6qwinxRF0cHH07jE7hna6SfOU0oTUKw23h2CkCi3ZY95s9Brwe0GYXVfVPiwlavJN1LJvMy07gytgkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKwtLrxgsQJnhVw3r0FLC0xqPxoezffcSTUsFA2ZBh0=;
 b=RR8fXNerQ4YGzDMiioZFGBgYq0jClqlCW2aGjCYHSRF63V5Ex+xR0BYNAlkvEPRiZANXBoa8rYtGVPADA8l1SDrQAblm4PHebL5hW36IwiYsyGvSnVvtp371AOOh04BZeRJlLt+pAuu/XCpF5rOzZ8aAIs3zcoU3vgBdSVVX/tcm8nYJXlTIRRqD1GWDHB7UD5V12pdPI2hBGucb919MNaXPqJQSFgw+0zgMOwr9lO5Fseb6e3E6uMm6FtQMVZYxvyiEA0MjqWxu4BFnC1V+SAWpiGDFwCJcQXt9DNIw56d2MizIa2E2QRjOP4XAVrlCarrTewVuYzy7+/ry9Ywl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKwtLrxgsQJnhVw3r0FLC0xqPxoezffcSTUsFA2ZBh0=;
 b=YkQoGmdxkf5GADbk246xGKDkN9Q5krOLuFX/1BOCKK7Fq3aIN5ZWDPd4HpLXxgIoEG0xPUKVirfSROXnwNW7XMnNcx4DAewDJIvODGKu9aUwvcv8y8v/BVeD8ULk2ULLpmJdXACG3Yc2wloUP7yfyg2WGbjbawPT/0IizljEL+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by GVXP251MB0839.EURP251.PROD.OUTLOOK.COM (2603:10a6:150:7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 10:51:01 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 10:51:01 +0000
Message-ID: <870b4ca3163d724805fb1ad470d52b8fa5080424.camel@orolia.com>
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Jun 2022 12:51:00 +0200
In-Reply-To: <023b9abd171f8d56639f7625bbd7e573a2a2a1f0.camel@orolia.com>
References: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
 <b203b8a90944c5f307c113ba8db8e377a627017a.camel@orolia.com>
 <20220603114724.5cf56736@windsurf>
 <023b9abd171f8d56639f7625bbd7e573a2a2a1f0.camel@orolia.com>
User-Agent: Evolution 3.38.3-1 
X-ClientProxiedBy: LO4P123CA0400.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::9) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d712405f-a6d6-4526-ed0b-08da454ef334
X-MS-TrafficTypeDiagnostic: GVXP251MB0839:EE_
X-Microsoft-Antispam-PRVS: <GVXP251MB0839A1AB925210FE0C207A7D84A19@GVXP251MB0839.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65hKF7SZ8cfwkspPw0a+k9TJc3VMfg8lF68JJpj57EJCqatLvuyLVjbbkKFYM0p33bWj8A7TQa8sfRgeRR7teRjlyf74+3elM6ibxKMgKpvK/ZM1MbxNz4NbUehTXHT5DrnZhWVkvBBLNjmIKEHZTEHezqTmUPqXUpX6VgkabyyUAGQJ5coTk0OiouPEXxqC/hGxxnUT8Jva1WjE8bZaOwjLjQNkXp4Wh2LIohcX0JLY3EzknJekzHVe35Vbxdl0Mm8ABfy9yLASC3L0wl8nc/xckYArQr2U963gumpJIkIs9HVqw7+bhWSTKYHAYZz2ix8XXD+7qjNEFCM8T/qXrpWvY5k0ZZVSCxVdQt+nTB0hQZ9nuTvVlieEbEwRDkSXWwkpy1s3YwGobiZunfQ9UlU2AP+6oO2NKLVfPkMKekgV2ZsfaHWjTLzNgl38AzRFRJZKBB9exTLqgnYNxJww+JGwgx8xfIZBgU07wWn77RBcoNYsPcc7LGkyp9t0R3+EuK6MgH3nT2z9v4qO5F/SNmbkcXw34YEeP9gP/zfrV679TtRB4CXdd0aIvwtmoXXN4h2Mq2iQ8AB69ZeQEnedvpYCrE159tBzik/OPz8RuwLJ5xnZsyjdlFED0bJ+9nS6s9M7LPlPmpIt9QE9f9l8zv1ZjOfdTf9B2mtjNjk3n6x56EDeqG/cI9b6yffPvlcZnnUFRmrjOwMVFeno4AnUbGoypO7X0nK/jxfrjrmLV2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(36756003)(107886003)(186003)(508600001)(83380400001)(86362001)(38100700002)(316002)(5660300002)(8936002)(54906003)(66476007)(66946007)(8676002)(66556008)(2616005)(4326008)(2906002)(52116002)(6512007)(6506007)(6486002)(966005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blYxeGhxVUJseEdXZUdXWEVpaytXTzRZN0gyQnBnZ243ek43b3FCRnc3OWJw?=
 =?utf-8?B?ZEF6cytiNDJoVlptajRPdjVrS2pjNTY4RWtGSTBRZnVIVmpGeUNLd3U4WlNK?=
 =?utf-8?B?YWhTUjNIVTc1aXFBMkFxK0FBNGdWNmtmZjF0L1p6SEN1aWtFZy8zS2NraHRp?=
 =?utf-8?B?NCtsNWxRWDk1blFhelVSNEdoR0txZkNOeHFXeUE1WjNxdkpWRjZnSStNYWxZ?=
 =?utf-8?B?YkpBNVFPU1dNOUsybVYzS0JXNGZxVVhIY0hGRWNUZkRZZmlmY0dndXlNRTZH?=
 =?utf-8?B?L01RY1RwU1RTTnJHZzhXdUR4YVRUZ1BmYTZ4UkJhL0MyQ2NxMEJtNzBmVXNH?=
 =?utf-8?B?V2xZaHAva2NYaWlmZ2RwQ2EvellZOFN0Ty9SeVVrZTdsZG0vUGR3OVdjMDNJ?=
 =?utf-8?B?ODc1eGF2QWFpc01rT1pnL2VsL2JlMUYyZjlqNkxESjc4SnErUnN6WDFtZnhk?=
 =?utf-8?B?cStRN2Z2Vy9mdjQvNkRQK2d5U1Yvc1V5dFFDY3FOdEVjVDhhcXN0S2l3ZGdK?=
 =?utf-8?B?NHo0b0VUcUp6WEFuWW1WNlhMVms3d0FlYld6MllwMkNOZDFoa1FSOUQwRElN?=
 =?utf-8?B?VEoyMDJDUUdtc3lTS3laNS9jaU9sSzRjdUhlS3hGTUluc29qaTZDYms1ZGZ2?=
 =?utf-8?B?U1UwcUxxaHdNTndoRGVtZlBueWgvWlFSWG1Fa1doYTJ3ZjJ6TTNaK1dMR21q?=
 =?utf-8?B?TE4zL3p4VzFaZXRSeTkwS1NXaHJPaVFyT1RZdTZYc1ZEeHJyNjcxaldPeSth?=
 =?utf-8?B?SjMwdG44MElMRmNkRFlFN2tJMXVUY0pXZDFPZDBjNmpSRmJzUzRlMUVXZTRN?=
 =?utf-8?B?Mm9YbW0xdnhGeTVlVWdQMzZHQ3QxZnVzcXlyYXdnNVZhQ2xCUTdEVzBqeUFi?=
 =?utf-8?B?ZURXNS9FQWI2NlRtb3RpNTRGTUppaEpWckplR2dBUVF6ZXZqdnhNUEhBSnZ5?=
 =?utf-8?B?dVFKU2s4eXdkaUFNdVlKbHFTWUsrUFJGcW1adnlmSC9IaVhneXVMbFZadmdQ?=
 =?utf-8?B?MDFCRzVJQ3hGNmpDOG1xWTBSdGlGVTVWU0wxUTdLcFVjdVhOWE5BaFlaZ210?=
 =?utf-8?B?aGVQR1c4M25RKzZJQ3ZkMjlTV1pqdmxMYlpYWFJjeTNkblIyWDJoSE1KSFNa?=
 =?utf-8?B?N2JUY1M1a0dEL204V0VDZllYV3hwVjRBNFVnbGVoVjk0YjRsYkdtTXJiczR4?=
 =?utf-8?B?K0ZmSGF6eHFUZlh2ZXVIRjZuR3IzczVacGxMbnpxWnVYUitKeEdlT0JEM3Bj?=
 =?utf-8?B?Q3E0MlRoOENGNjRPa3hTOGtnWmhLVWlubHRlaVJXNTI0WFJYVXFuekN0OVE3?=
 =?utf-8?B?VzJXZEpodUFISzdHalhHd3piaDlZWXN4Ui9CcERvZ1htWXV3OGZBV2lWaWp1?=
 =?utf-8?B?bkJBbW9FdlNFOEJhMnNwb1pKbDJ5MnEwRlBaRUJSSGV2V0hJWVVPQlRxc0h3?=
 =?utf-8?B?N1hrQ1NaRm1OT3Q0TDZRSThTTENKTTNNQlRNRG5oYWxhVG5GWmVPd0NvaDhx?=
 =?utf-8?B?R3NFYUVKVi9NUUFxZ1FoS1VXZkNOQk1SM2pZZ0s5MUFOc2dYNmhJTkYrVmpv?=
 =?utf-8?B?RnRodjRwY1N6YmZoNk9mQlhxdmFpcGlxaVdHUGdOT1RXKzRYTzJrM0c1aC9E?=
 =?utf-8?B?TlpjNlcwaFN3aGs1MVU0REI3V2htdVljbEJuM2ZQL3Y0ZGxoczFPaFEyOFhJ?=
 =?utf-8?B?NDF3bzVTNkFGUlJCRUNoRGtKRk5Ya1F0N1phWFRhVlN3UEhvSGJ3VGxONGx4?=
 =?utf-8?B?NjNNMHU1UWRTaTlxSSs4Z0czcVdrUHEzNlBMc0ZoYmhHeWx5YlhqUUIvV1Q5?=
 =?utf-8?B?K2hoMFZRalRFZ1FyNGd0cTBNSXB2U0dLd1pmRDlPTCtMa05kcW9pOXFEbVhl?=
 =?utf-8?B?aDY2ZTRacE9va1E3OTUyWG44OFRlWGc2RzY2c2I0MGVuWWs3RE1Idjk0endl?=
 =?utf-8?B?VThsOUFoR082Tkd0WHIzaTUvNFdjendyK1BNc01BSnMyS2lQTnkvb1RGanIr?=
 =?utf-8?B?S3duSkk3QXlzVVFxbGR4RHNIcGxHRVZDNFZrWkFQVndCQWdxeXdXSUw2RDZI?=
 =?utf-8?B?SFNIY2paV3B4QlVuT2k4ZmphdU94TFZuR3loWGZscDFING9CWVJzd3ZiazZz?=
 =?utf-8?B?YmJ4ZW5hNmxHTnNwcms4YWlSd1lGRjlNOXRpOG53cnE2eUhLVi9XbHh2VzZV?=
 =?utf-8?B?WC9QbXVwN2JQTXZzR3E5QmlZb0c4NFM5Q3c2a1pUWTRPSlhZOHJoZXlJL3N4?=
 =?utf-8?B?R2RFamwxWS9oK3VKNlJVK1V6RFF4amYxUnRydUU3UHpXYVcrc0s5cDBMeDAx?=
 =?utf-8?B?RWVvYnlsY2VuSTBmVGttdktxblFJdTVlRElIQWh4alI3UTdzT0JLSEJaek5O?=
 =?utf-8?Q?hXPtAWS4W7YlaKxqcCEyxkbSNMHtMLefFaOzj+7ZiRmig?=
X-MS-Exchange-AntiSpam-MessageData-1: nyhOT06kyzy4JgNhwrS4nmwLM6Hgjo5U14Q=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d712405f-a6d6-4526-ed0b-08da454ef334
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 10:51:01.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiWSCbbAi0yR/eUeDvVMviR8CoEPESWxL2sip3tYxcM6FWCcHioMXG5X1fen3KgZzLMMk4YFfv4YMp7t9vMgxsvZDD6z6UbzJSVj2brYaL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP251MB0839
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5kIEkgcmVkaWQgdGhlIHRlc3Qgd2l0aCB0aGUgd29ya2luZyBjb25maWcgKHRoYXQgaXMsIHdp
dGhvdXQgdGhlIFNZU1RFTUQgbGluZSkgYW5kIHRoaXMgdGltZSB0aGVyZQphcmUgb25seToKCm91
dHB1dC9ob3N0L29wdC9leHQtdG9vbGNoYWluL2FybS1saW51eC1nbnVlYWJpaGYvbGliYy91c3Iv
bGliL2xpYnB0aHJlYWQuc286IEFTQ0lJIHRleHQKb3V0cHV0L2hvc3QvYXJtLWJ1aWxkcm9vdC1s
aW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3IvbGliL2xpYnB0aHJlYWQuc286ICAgICAgQVNDSUkg
dGV4dAoKQnV0IHRoZWlyIGNvbnRlbnQgaXMgdGhlIHNhbWU6CgovKiBHTlUgbGQgc2NyaXB0CiAg
IFVzZSB0aGUgc2hhcmVkIGxpYnJhcnksIGJ1dCBzb21lIGZ1bmN0aW9ucyBhcmUgb25seSBpbgog
ICB0aGUgc3RhdGljIGxpYnJhcnksIHNvIHRyeSB0aGF0IHNlY29uZGFyaWx5LiAgKi8KT1VUUFVU
X0ZPUk1BVChlbGYzMi1saXR0bGVhcm0pCkdST1VQICggL2xpYi9saWJwdGhyZWFkLnNvLjAgL3Vz
ci9saWIvbGlicHRocmVhZF9ub25zaGFyZWQuYSApCgoKT24gRnJpLCAyMDIyLTA2LTAzIGF0IDEy
OjQ0ICswMjAwLCBOaWNvbGFzIENhcnJpZXIgd3JvdGU6Cj4gR3JlYXQsIGF0IGxlYXN0LCBJJ20g
bm90IGFsb25lIDopCj4gCj4gT25lIG90aGVyIHRoaW5nIHRvIG5vdGljZSBpcyB0aGF0IHRoZXJl
IGxpYnB0aHJlYWQuc28gYXNjaWkgZmlsZXMgaW4gdGhlIG91dHB1dCBkaXJlY3RvcnksIHRoZQo+
IGNvbnRlbnQgb2Ygd2hpY2ggZG9lc24ndCBzZWVtIGNvcnJlY3Q6Cj4gCj4gb3V0cHV0L2J1aWxk
L3Vsb2ctMDM4OWQyNDMzNTIyNTVmNjE4MjMyNmRjY2RhZTNkNTZkYWRjMDc4Zi9hbGNoZW15LW91
dC9zdGFnaW5nL2xpYi9saWJwdGhyZWFkLnNvOgo+IEFTQ0lJIHRleHQKPiBvdXRwdXQvaG9zdC9v
cHQvZXh0LXRvb2xjaGFpbi9hcm0tbGludXgtZ251ZWFiaWhmL2xpYmMvdXNyL2xpYi9saWJwdGhy
ZWFkLnNvOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IEFTQ0lJIHRl
eHQKPiBvdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290L3Vz
ci9saWIvbGlicHRocmVhZC5zbzrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgCj4gQVNDSUkgdGV4dAo+IAo+IFRoZXkgYWxsIGNvbnRhaW46Cj4gCj4gLyog
R05VIGxkIHNjcmlwdAo+IMKgwqAgVXNlIHRoZSBzaGFyZWQgbGlicmFyeSwgYnV0IHNvbWUgZnVu
Y3Rpb25zIGFyZSBvbmx5IGluCj4gwqDCoCB0aGUgc3RhdGljIGxpYnJhcnksIHNvIHRyeSB0aGF0
IHNlY29uZGFyaWx5LsKgICovCj4gT1VUUFVUX0ZPUk1BVChlbGYzMi1saXR0bGVhcm0pCj4gR1JP
VVAgKCAvbGliL2xpYnB0aHJlYWQuc28uMCAvdXNyL2xpYi9saWJwdGhyZWFkX25vbnNoYXJlZC5h
ICkKPiAKPiAKPiBPbiBGcmksIDIwMjItMDYtMDMgYXQgMTE6NDcgKzAyMDAsIFRob21hcyBQZXRh
enpvbmkgd3JvdGU6Cj4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRz
aWRlIG9mIHRoZSBvcmdhbml6YXRpb24uCj4gPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBj
b250ZW50IGlzCj4gPiBzYWZlLgo+ID4gCj4gPiBPbiBGcmksIDAzIEp1biAyMDIyIDExOjA5OjQ4
ICswMjAwCj4gPiBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9saWEuY29tPiB3
cm90ZToKPiA+IAo+ID4gPiBIZWxsbywKPiA+ID4gSSB0ZXN0ZWQgdGhpcyBtb3JuaW5nIGFnYWlu
c3QgdGhlIG1hc3RlciBvZiBidWlsZHJvb3QgKHdpdGggYW4gdWJ1bnR1IDIwLjA0KSBhbmQgdGhl
IGlzc3VlCj4gPiA+IGRvZXNuJ3QKPiA+ID4gYXBwZWFyIGFueW1vcmUuCj4gPiA+IFNvIHRoZXJl
IG11c3QgYmUgc29tZSBjaGFuZ2UgInJlY2VudGx5IiBtZXJnZWQsIHdoaWNoIHNvbHZlcyB0aGUg
aXNzdWUuCj4gPiA+IAo+ID4gPiBBbiBpZGVhIGFueW9uZT8KPiA+IAo+ID4gTm90IHlldCBhbiBp
ZGVhLCBidXQgSSBjb25maXJtIHRoYXQgSSB3YXMgYWJsZSB0byByZXByb2R1Y2Ugb24KPiA+IDIw
MjIuMDIuMiAoanVzdCBzbyB5b3Uga25vdyB0aGF0IHlvdXIgZS1tYWlsIGFuZCBpc3N1ZSBoYXZl
IGJlZW4gc2VlbiEpCj4gPiAKPiA+IFRob21hcwo+ID4gLS0KPiA+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiA+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gPiBodHRwczovL2Jvb3RsaW4uY29tCj4gCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
