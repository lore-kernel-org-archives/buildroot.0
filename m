Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571CDC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 18:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0DB81491;
	Thu, 14 Dec 2023 18:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0DB81491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uxrULlHbFd4; Thu, 14 Dec 2023 18:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C22D83CEC;
	Thu, 14 Dec 2023 18:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C22D83CEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB0A41BF3A8
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 18:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B397660F7A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 18:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B397660F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EANWatOLQnvH for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 18:16:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC4BE60F78
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 18:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC4BE60F78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSJ3I2/qgwkhwAdJ1s9DhVzHFanfC8jD1pVFbNOVBsITS3NooHA0Lw1H8z4sqCROb07A101R67WbquyfzfkHBhu3MPn4JApCEnLbM5CiMjDHaYS/uutKtQyvW6LZQl+WOZHVjHVcONmOycvypQnGxujgVf5GQUtBK7ggRChXKrYoqMWLiUfubMELwD/lKuOsfVZpOCEI/VZ8a2YPoxECes5/3W2l1DmpjDbe80nnweCC3GmvFgSx4Wdb+gMvBJWQiCfJbTezgpof4Ik8ZiQqPjtNYHPLAuMiCfetUh7uI5+a73tl/qfj9Je9ELeQMTuvQb3bqCPudUBWnu1//kwMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWo0QQpMdfMMR8bRWz+IQoQATpZOZiSJ5+sy/UIJrQM=;
 b=RuhE1ewLGvWItGQ1/luLeU7tmgAfBKp0w2myrAGlU4UK4rabQpzNyeDf+v9rlMhRDPZecAA60SA256uTYZ81TO4onn4Ol+H9Hp6XDaXsTX4gCwQCzvM1kq0dWhG5TZeCl/PF4ndpcWMA9l4xcSaRHs1cuGE+q3jZpyC0IBzG3BBQF/mQrSXi1UxCNziOfwgU8azCP7hmidPh7UFFRxOtc/9klk2fs/PXuQZI+4gZeIeFF/h6MHRQ5DciNQcMx13/odlH6k1SO/xST2rU8FxDuukKnxXlAxa5tIj7h9/bTyg0ixmNSk2Nohe3NXqmIoizOBzilKOtB1A5wbopkZ5JGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM9P193MB1602.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:308::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.30; Thu, 14 Dec
 2023 18:16:49 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 18:16:49 +0000
Message-ID: <397bf53f-9eec-4c02-aeff-531a9c4feaaa@othermo.de>
Date: Thu, 14 Dec 2023 19:16:48 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM9P193MB1602:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0865c3-aa6d-4ce4-75b1-08dbfcd0d6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Gf6Q5lIIcUpIqprfLjl3DD1JMGb+Cjyh3iTfNZMzLPG+PduJyPNv0hzEuzuK6mq7JV23J6JRIlob47V6WCjAMPYJti1z3ywVExxtecHyJ4SOTcNJPLjGR+Ax2aIkMWVWvu+GpqY4iN91IoybmgMVVGVw0UOuGLvyJmP7fvkOwSiA34pBX2QitllLOvNyyE6XiCyUu7PM2T002yvP3yKv76LzLREFtzh7syW6R5RQvmqmMzfJwpDjD59Yux3oMbhzFUxMMcfc3BUxbM8D0C08pvc8z5UrgR7DCXF2CuSo//76lQ9C7pxyuhY/sQ+fLNOs4/OzLJdFb3jod5cU6cLh4A2Qt5eFsyEnMvwS3iR1yHbOhm8Puoqc/v/Gu4iB1gTBpJrYiAp4sHnPInriQtP3A/yyA8JnCzKcV3W+BLYCVOnA8oXeA4EW1jvevAEm1rVDMT80JpdR62Vpay7gkE2UXnCZ6mkzeqPm1hPAQjKlwC984nBSwvj3/7Q9rJCuknGwLwGRWtPOW4lysSF/KTLPo0vLIfOMrxMdd7xKEInEjBO3rXJIbsfLS9qI0r4MiHTQnmNt3maCJ1wXiXGy/CnUwzMnOvkaXqHyG5Bl3xo49wlM4emDQkLUyvAZfdFlLRN3u8K3rp9VYm+mYbfP79HBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39830400003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(8936002)(8676002)(4326008)(316002)(44832011)(31696002)(966005)(6486002)(478600001)(66946007)(66556008)(66476007)(54906003)(41300700001)(2906002)(5660300002)(36756003)(38100700002)(6512007)(2616005)(26005)(53546011)(6506007)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXgzVjQzN0ZwL1hEMTErTytQMTlhc3o2N3pwcEUySGM1azJ5NURCS1o1cms1?=
 =?utf-8?B?WnptNjV1UUhwSWZUU1Nka3dNak1CSnBhdXdvYndlLzJkSjFDU0tORFhublMx?=
 =?utf-8?B?dldDbUVCV3hRanhydVRReFF6ZWhoTWl6OHVQMzhDSWgvalQvSU4vQ2tiVnFR?=
 =?utf-8?B?RlJ4TnBMNjBTZWp6aXJEK2ZOdHQ3TE5BYmdRckJpTTJhczRlSzNEeG5VVUxR?=
 =?utf-8?B?OThOT0pSbkpkUVRteldhcTg1S1FFV05mNzQ1TzFIUWhWK0d2TnNQc1dVUEVH?=
 =?utf-8?B?aHFHaHMwOWxMaEJ0REhVeWlKM3hXc05LVzE5UFc3b3Eya0R3TlF2eGVLRHht?=
 =?utf-8?B?NkZpMWVSU1E4NUJycmF3QnhoWDRETncwcXZQZE5rSjlXdlR2U3hIQ1RoZDR3?=
 =?utf-8?B?RTc0UzlSajdVU1FnNHZaMVZsd0hqV1RDT3Rtd2s4aVBKd0tQa2lHVHZ4TlBw?=
 =?utf-8?B?aDFYZk5pc2hEVVhrTGtEejk4aUY3SG5EUnZpMklwWFE4MlRLTlFWNEYrSG4y?=
 =?utf-8?B?elovckNVNWV6N2dxVXBiMTZydCtTYmd2MXJHdXFGV3JndWd6bTNJQlRIelp5?=
 =?utf-8?B?OEVnMlN4cGxZRnlyK211cjhVSnE1MHdRZmQrNVdxVWZicDl6TzNBZUVmRjds?=
 =?utf-8?B?SGFNTTd5TzdibEtVTTFJTXMyR2ZlaUlsQXpqb1IwNk9IMUhXaTVjVE95NXI2?=
 =?utf-8?B?bDhSQVZOOGxzNDdkdlN6WUU4M2pxaDlWZGRqRnVJYWFrUGIyL0hxUUJrblo4?=
 =?utf-8?B?bkhJVXVtK3poQ3cxUGhUdU05YWNGTWNldkRkd2ZVeFNqNkJLeE5TaGJlTnVM?=
 =?utf-8?B?Q0tuV0lkeFo2Y2ozQ3NhNVVzZGFicUc1c3MyU3YzUU1JMENYOFl5bHhWN1pa?=
 =?utf-8?B?citXcHoxMTNFQiswZmNuTnBCY2JqK20rRXlwditEOWg5UCtXbnlKWHM4MFB2?=
 =?utf-8?B?cFlsN01IZnYraGNjNnlSVm9PTmFIZXhrTlUrYWY5YmtVbVBjN0FaZzk5ODl4?=
 =?utf-8?B?d2c2V2NiNWxsNzBDZkYxSUpWVXg5UE5xdzR3Tm1pTTFxcUp5SXRzblM3OHR1?=
 =?utf-8?B?QmQrTFJURVp3aDJEV2Y5SGZ4Mi9CRysveFhrT3VWaWtQYklMYVBoUTdTL0Ru?=
 =?utf-8?B?cXhXYTdMTHJIWU1UTVB4N0tTaEFidkNScVFHbFdHeWlXVW8vNWJLWExkRkl1?=
 =?utf-8?B?RkZENG4zRlg3Y29MenJQZHppSmVxaEUwQTA0Zk8rMlByOUNqVHNkaWs5NUg2?=
 =?utf-8?B?R21UaG4vZ25NS1IvdGhMdm9JcGR5cXBuQTFFcmc3ZXVFMmdxM2lpS2twN3J6?=
 =?utf-8?B?ZkNOdll6K0YvenVPaUlQb2VWbUdkZ29aOEdNK05taHMrOEJyZlJLL1VNTmFS?=
 =?utf-8?B?d1k4TUFGNHJGdXRBZStqN1RrV2JDbHdIYUpJTWM2V3NRSHBzS3l3citOUVRK?=
 =?utf-8?B?MVIvTERCSFdFeXFPeWkwZFRYYkg1aHp3YXlneHovZlVCSnA0UVAzdzlEdU9M?=
 =?utf-8?B?S2JqVll2YTd2TjhZN3lJUXJEdHlpTlc3bk52aUNZbnNWWElRV0k5eklBYTZo?=
 =?utf-8?B?WUpBVzJFK01za1ZNL0V4RHRMWTFaNGJyZ0FEbzF1ZWVoQTZZK1FGU2I2a21Z?=
 =?utf-8?B?cXEyNmdyaEdGU1JSbzRrTzlYeE1FSDFjZ2ZtVWZiL2xWZVo1cWhxbHNISWE2?=
 =?utf-8?B?b1JxOVJ0c1VaQ1FKR3FzMGNqQ095Y3dvQkZZQ0JMUWU2LzNyb1QxalBNRjl1?=
 =?utf-8?B?V1d5NG1zOStwZEd5MnZDTGRHdmlQWDkvRzlpTW5WSlJGZGZPTm1zMDUyUXpD?=
 =?utf-8?B?a25TQ2F1MVFpTUYrQ0pzMjFnRmlEZUZMNHFPNVl4RXNqS3dPaGJyK1pCemdx?=
 =?utf-8?B?ZmtxSGVFNlR6RUdmQ2hMRlFDbndLdUJ4amgwVGlhRDFobVhlQ0JFZDNLTHpm?=
 =?utf-8?B?Ynh3ZytWM1R2NS9TUktjSkNhdmtESmMrUDVqSGd0Y3k3eWVsV2NSWVFRU1VY?=
 =?utf-8?B?b3RBWEJxVHVQRWxyWlltVXBkLzAyTjNnNDl4ZHVFaG1EdjdxT21UcWdESytk?=
 =?utf-8?B?clJrQkN2a1ByQTBHc0s2NlpZQitGMjRMR2EvNmtDRGQ0eWNGZXQvNW5RT25I?=
 =?utf-8?B?OU1ybGpKejRPTnJPY21xMGp0bkkvZXVyVTN6NWx0alY5dVV2aEZ6eWR3VllV?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0865c3-aa6d-4ce4-75b1-08dbfcd0d6e6
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 18:16:49.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOKXXNxASBmJzZo8sO4GdOwPrViOgDJo034ZNIGyCNTGBYVyODuqKoNKuhDe+GWkRN6Hm6u9Yk2eF3F+QFIT4M3dB0j9fvOJS9psJ7W/gRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWo0QQpMdfMMR8bRWz+IQoQATpZOZiSJ5+sy/UIJrQM=;
 b=XUDkEXjb9dJPimkCtL9GjhPT7F3HIMfFf4DYuE/uOMotaZfhAguc3GzUO9ZECzb8hr2pMIAW0FH4oPQYL6uoud/IiKMH7GaLvgD6hH9khJyPFNcM+DARaRZ1B6xILR1nIZ92zgAkkxfixSriAHIl4/BqIOuMFBoj7nipoth3hVE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=XUDkEXjb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH v3 1/8] package/python-typing-extensions:
 bump to version 4.9.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC4xMi4yMyAxNzo1NCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1i
eTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4g
ICAuLi4vcHl0aG9uLXR5cGluZy1leHRlbnNpb25zL3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy5o
YXNoICB8IDYgKysrLS0tCj4gICAuLi4vcHl0aG9uLXR5cGluZy1leHRlbnNpb25zL3B5dGhvbi10
eXBpbmctZXh0ZW5zaW9ucy5tayAgICB8IDQgKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tdHlwaW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLmhhc2ggYi9wYWNr
YWdlL3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMuaGFz
aAo+IGluZGV4IGZlZGI5ZTA0NDYuLjc3OGIyZDU3NzEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
eXRob24tdHlwaW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLmhhc2gKPiAr
KysgYi9wYWNrYWdlL3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVu
c2lvbnMuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+IC0jIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6
Ly9weXBpLm9yZy9weXBpL3R5cGluZ19leHRlbnNpb25zL2pzb24KPiAtbWQ1ICAwNmU3ZmZmNGIx
ZDUxZjhkYzZmNDliMTZlNzFkZTU0ZSAgdHlwaW5nX2V4dGVuc2lvbnMtNC43LjEudGFyLmd6Cj4g
LXNoYTI1NiAgYjc1ZGRjMjY0ZjBiYTU2MTVkYjdiYTIxN2RhZWI5OTcwMWFkMjk1MzUzYzQ1Zjll
OTU5NjMzMzdjZWVlZmZiMiAgdHlwaW5nX2V4dGVuc2lvbnMtNC43LjEudGFyLmd6Cj4gKyMgbWQ1
LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvdHlwaW5nLWV4dGVuc2lvbnMvanNv
bgo+ICttZDUgIDJiY2FmYmQ2ODE3Y2IwZDdhMjllZDdhN2YxYmIxZTVkICB0eXBpbmdfZXh0ZW5z
aW9ucy00LjkuMC50YXIuZ3oKPiArc2hhMjU2ICAyMzQ3OGY4OGMzN2YyN2Q3NmFjOGFlZTZjOTA1
MDE3YTE0M2IwYjFiODg2YzNjOWY2NmJjMmZkOTRmOWY1NzgzICB0eXBpbmdfZXh0ZW5zaW9ucy00
LjkuMC50YXIuZ3oKPiAgICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gICBz
aGEyNTYgIDNiMmY4MWZlMjFkMTgxYzQ5OWM1OWEyNTZjOGUxOTY4NDU1ZDY2ODlkMjY5YWE4NTM3
M2JmYjZhZjQxZGEzYmYgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdHlw
aW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLm1rIGIvcGFja2FnZS9weXRo
b24tdHlwaW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLm1rCj4gaW5kZXgg
OWQ0MWIwYTZhNS4uODllZDc1YmRhNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi10eXBp
bmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMubWsKPiArKysgYi9wYWNrYWdl
L3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMubWsKPiBA
QCAtNCw5ICs0LDkgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAtUFlU
SE9OX1RZUElOR19FWFRFTlNJT05TX1ZFUlNJT04gPSA0LjcuMQo+ICtQWVRIT05fVFlQSU5HX0VY
VEVOU0lPTlNfVkVSU0lPTiA9IDQuOS4wCj4gICBQWVRIT05fVFlQSU5HX0VYVEVOU0lPTlNfU09V
UkNFID0gdHlwaW5nX2V4dGVuc2lvbnMtJChQWVRIT05fVFlQSU5HX0VYVEVOU0lPTlNfVkVSU0lP
TikudGFyLmd6Cj4gLVBZVEhPTl9UWVBJTkdfRVhURU5TSU9OU19TSVRFID0gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzNjLzhiLzAxMTFkZDdkNmMxNDc4YmY4M2JhYTFj
YWI4NWM2ODY0MjZjN2E2Mjc0MTE5YWNlYjJiZDlkMzUzOTVhZAo+ICtQWVRIT05fVFlQSU5HX0VY
VEVOU0lPTlNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8w
Yy8xZC9lYjI2ZjVlNzUxMDBkNTMxZDczOTlhZTgwMDgxNGIwNjliYzJlZDJhNzQxMDgzNGQ1NzM3
NGQwMTBkOTYKPiAgIFBZVEhPTl9UWVBJTkdfRVhURU5TSU9OU19TRVRVUF9UWVBFID0gZmxpdAo+
ICAgUFlUSE9OX1RZUElOR19FWFRFTlNJT05TX0xJQ0VOU0UgPSBQeXRob24tMi4wCj4gICBQWVRI
T05fVFlQSU5HX0VYVEVOU0lPTlNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KCm90aGVybW8gR21iSCB8IFNpdHogZGVyIEdlc2VsbHNjaGFm
dDogQWx6ZW5hdSB8IEFtdHNnZXJpY2h0IEFzY2hhZmZlbmJ1cmc6IEhSQiAxNDc4MyB8IFVTdC1J
ZE5yLjogREUzMTk5Nzc5NzggfCBHZXNjaMOkZnRzZsO8aHJ1bmc6IERyLiBEZW5uaXMgTWV0ei4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
