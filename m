Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A339FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 11:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A4BB40BAC;
	Wed, 15 Jun 2022 11:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyIVz1JSBkWE; Wed, 15 Jun 2022 11:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5784840BA4;
	Wed, 15 Jun 2022 11:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15B1C1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1191781313
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="O4YFbG0r";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="sdYUVRM1"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvVsV3oxlw5w for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 11:03:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C57C812F9
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 11:03:39 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A4C6FC0CB3;
 Wed, 15 Jun 2022 11:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655291018; bh=VCTkGOurWrmlub+hNh+0d/FCFyYen6HEez8jhPuF9l8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=O4YFbG0r7FkjCBHVb0lT3UGxjRPc14ipj7MGhPQSvXncucU6ATbMOTESANlle8Qa2
 DQpRUL9Bge3yGgD1QgfJ9w9smb/MmO9OGvtj54nJgM/u9Zyeq2+bW4pkXfOqYR2NWW
 Ax/yeEMtAJPLR2B7eqRWNK0gAyhEilwdzZuckZPkBKWeLYluNh5A1Y801qd1BqWF5G
 nmIodJ1WtbNA85yR7FLfnzhuvHykjFrm74X5VzLRA8dRg1ABc+MG8akP41KQY2RChs
 0+mLj3x4/bCzT1t6KZ0Sm47BQb10TSX0/zhv+/55O09G99kFITDIl4UBPk/RA/tyn9
 J3jNNcTQ92Tpg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9E36DA008A;
 Wed, 15 Jun 2022 11:03:35 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id BC11780135;
 Wed, 15 Jun 2022 11:03:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sdYUVRM1";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uscq7HhsqrdgjC0i4rAVKF5oi0EH6mIDQ8EmnmE2ANh1qEGAFPqvr0/il8iBAnZqdP1ZZ2ECK8hDzPy2xgmgCOQzxSIp9cpxbI2dcYzEI/NHoCpS4kKty/MIiIH22VV9aUzSMY7tI7cqyTDzBB3qX8aCDTHtV+x+zmSW43vxPcvIxm2Mto61BeXWb80FHzJMppiVrfE0wyZBIDTU8aNiCtfYkJW1tFkcUsRltPg4RynrIKsCf0Bcbl9Kphqhu/pTF5NU2xBC5t09KBQk+CITfvnb66h/CQSc9Z6NCZg4Hdwj3WbC4//KoSzfQahn5cj0WJs/VfR810QPtxeZ/JjF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCTkGOurWrmlub+hNh+0d/FCFyYen6HEez8jhPuF9l8=;
 b=cQFFqKYM7uLBfV36iaxk1ItZ5twqzmHRUzBINVGxdUSSVQJXLCP9Ues7CdRs4nLdRUpjve/oTt4sec+/49noM3AQB6AqAQIljIGYjBr6Dpb3sadSRHDZHSiGe6XaCMOS+R+Kz83EQehIyoN/1FV1Y0byrYQOf/vu5i9HKfQwxQztnCMLN8UJ+T7upXC7Nv5abkNpAOKTqqqmU3rXD6ezJPuIbKtgN/VL+61Czxvu5HitimOj3IIpC0C6sr/k2NUgXiKWoi/9tkfQiq5vvDGHdZWXzhjHYDzLh9uhW+qpQ9ySa7Yrfk9MAu9TMoNScBYKlwZd7YvCYr4K8ZI4zA3jlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCTkGOurWrmlub+hNh+0d/FCFyYen6HEez8jhPuF9l8=;
 b=sdYUVRM1EjNqB+fX8QI5XPopOs798fwIEzeutfStsEu4+nAG3OdNaNcpgb3y8gCrytJqnCzO1+dILJg0LaC16KUV6Js9WJH1MfPLC/wLe0uvAmHKPV2SE1NGRAwaL5+Ti4PIRgDO8efDKFR6Y1p1x9zgAM4DwYgfQI5Zw75e/tI=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by BY5PR12MB3876.namprd12.prod.outlook.com (2603:10b6:a03:1a7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 11:03:31 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 11:03:31 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: [PATCH v3 1/1] package/bpftool: revert bpf_cookie patch to allow
 building
Thread-Index: AQHYf9GGNdBPjuX5nkCxwDk0/FmiVK1PJLyAgAADxwCAASb2AA==
Date: Wed, 15 Jun 2022 11:03:31 +0000
Message-ID: <b916b684-d6f8-f7bf-c20f-3e22bbb0aa14@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <9aaab01d-1e99-14a0-bff2-237da08206ca@mind.be>
In-Reply-To: <9aaab01d-1e99-14a0-bff2-237da08206ca@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f5c9819-6dc0-4c01-e1ab-08da4ebeaf17
x-ms-traffictypediagnostic: BY5PR12MB3876:EE_
x-microsoft-antispam-prvs: <BY5PR12MB3876DD722C513CEAA8A43EF5A6AD9@BY5PR12MB3876.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNUMAz5BCwEY9UmMKLmCDE4Eeamt2jqzAaAeSSmU3qtvQPNHOoGWINv4zM+Cd+SJdDyqcic1q/EL+12ttKrX9U1QEVwAL1iTAuMn8sGETj9UD9e4KckOSvrSwYcJD6AzCM2G+x8YHXl1KwjIMIY8ZDUVyVAc/dOwyl5hQt4uR6FjIR2IGm6QvLI4cQ/YWPoktvRN8KbI1SYapYPF0wKF2R4LRm6ddCy3ICtzrCmBT2gYFzUH8oSh5mbAtvGNT9gUdTwXbq8WVe6W75DatKTgLxLkVd2jERCfsmktS0DYw0TwdekwZCenp09FQVtqe9JILZgJ6Q7vr7vtOH9Xd6FljHWj8VpLE/KAog2KlxT4P7QK+zB4NhHyGCDUE4bW3B76ruE6Q9CRWaMRe0UCZUcCaDXf7pbMUlWBFwdWQnWEFX+0SiwealEWBTd7bPXS4RkAQtvFOgHhn7s+SHhFkv1C8OQQfykFbVa7c0c03iOx1EoHmaE9rvepDgpcjwmA+4QYYKP9PSizimS5zGg+gi28pStNXTDPQqsRDTt8/SnfFsm4bH+RY767uVQA5klgi+PYG/cBB2xgzy11MfMpXpLvHxeLhTfas2Ssd7hOiKGlZ6fmyFyYC4+HsqxO9d0VeeUpPCzD7dg5MTPwCyJCn5jRJB40W0yP1RH9uxGmHl9IK0/5kK7ZpFsCZp0CiXlfzH4oHUQObCIcQrsNC0syks1KDxNrk2NOaf9DLdffQWY8r08xJxz9Cw6idtV80SIvABjfz/ftHsX4uFDpHvxk3S1sCq7zcRVQwLI7o/1LfZFlnWoFjBtfYcHRD0odatfUZs4z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(83380400001)(186003)(38100700002)(38070700005)(71200400001)(4744005)(2616005)(5660300002)(8936002)(122000001)(8676002)(66476007)(54906003)(64756008)(66556008)(2906002)(508600001)(66946007)(966005)(6486002)(76116006)(53546011)(6506007)(6512007)(26005)(91956017)(316002)(31696002)(110136005)(31686004)(66446008)(4326008)(86362001)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0FDTXBmMWtjYlEwUGRLMG5ZUzMwaE90bXBBdlEwUHFWVkxDcG95WHhHR0E5?=
 =?utf-8?B?TEZNM0hiWFk0Uko5UnRIcXpyK3phaGhiZExldjlDdkhxN3pLZ1dVZGhlOS9H?=
 =?utf-8?B?R1RUZ1VLUDQ0Zm9IbUhCNy9IdE4wbnFSM3gzVG5JSGRUODhYZVR3bGNVai95?=
 =?utf-8?B?M0VDamRRc3VMeGhYbFIzcUhPNzFYbXMrS215WGpoOHZHbS9kU3lZTnJoVis0?=
 =?utf-8?B?MzJBYytYRWJqUDgrQS9DZmhnZTdrNTlnYWRGQUlqazdLZGowM3RDclhsSUE0?=
 =?utf-8?B?RjU0WUNIWnB6NFBObXJ3b0RrcEJsYmt2THl3Y0U3Tm5iSTNqcUt4eno4RjBE?=
 =?utf-8?B?c0YySXlkd1JLRngzbnBDcmhMclRKTHMvdGI0K1dxMVE2YytHZENKbHdCaXQ1?=
 =?utf-8?B?QXcvMjRHN3NEMGNTdlJUSlhlSVpJempmb0s1KzY5VHBDeDR1SG1kNFE0WjFw?=
 =?utf-8?B?NXpVWW0vMUFLV0pZNmVyWXVzZlMrOXVqUkRvcmJQb0dIejVYaHdFbjdtN1Z0?=
 =?utf-8?B?YndYbmxOckJnYWd2bDFQMnEveEFvSEQ4YmRmRTJIZHNaQjJKZFU3dEZoN001?=
 =?utf-8?B?YUJtdm9SWjZZS2JvVW9FVmpaa0ZSYXZzbjdHbXRtdjJsUXRnVnoyMGhVdUcv?=
 =?utf-8?B?Y0RmTEhsMC9nLzYzUFBZRnZCNXV0YzE4RlQ3QURMVDhoSUt6eDYzZk1IbnMr?=
 =?utf-8?B?NUFJOWtGQzFpQWFQbkp2bzBZZHJZZW02b05oUkxkbFdRazdzSkNtelFFRnVR?=
 =?utf-8?B?ODdCV1I0UUE5WFBKVDduZWZla1FnZzNzbUdMWVlacDJicnNOUlRVTTVtYjJT?=
 =?utf-8?B?aHQxNUZQVWg0UUtuYk0rWlo1VmxvMVpLSEpuYVZsT3FlcFVncFBPNklsNC9E?=
 =?utf-8?B?YmZHb2lEZzZiWnFyS25ORCt0NmZvYTdzODMrT0p6Z2hKamU1YVRpK2U2bVMy?=
 =?utf-8?B?OTJjSm9idFVRNFJrR21LdmRxVGVmcC9nenFqYk5wUElpb0huWHA5OTFpYzh4?=
 =?utf-8?B?TmdBYjZZWXFzc2l4dU05bnJuWFAxUkhYN2JmWWo5bmZiYXNDekZqRlB5TlNU?=
 =?utf-8?B?ZEZ3T3VOQ3drT2NrVS9CcnNhbFRRa3JNRFEwL1d6RXRsWFdONlUrSlA1QzEz?=
 =?utf-8?B?OE9KaWJDMldqWkVDMk1jYjgwTGpZbmU4UGM4QUR1b2JIZjJOY2JodEl0WW1H?=
 =?utf-8?B?a01VVjNRQ25SVnljeHZwTHd0WDkwT21WdWtUZzMyakhOd3VGTit3ZjRGY0VQ?=
 =?utf-8?B?SjQ1ZXFNaGd1ODZGanZVcTNhOTk2RlZQMG1VdCtwRmxlSUpwSS9pdDFzdWtz?=
 =?utf-8?B?SlFZeWFCQWs2VFlEUFZaYzB6VTVMalFxa0xEM3ZlNWQzajB4eFVEV05BZXdB?=
 =?utf-8?B?SUdoNTFQKzI1MmtUTmFWSzV1cHFlSlNiOUw1dE9OZXRKL0RqYVdCZEY3UUxO?=
 =?utf-8?B?ZWt5NVpGTXgxbTMxdDFlS2xWVlJTS1BQWlJucTZIS00yYy96cUQ5dEc3UzIz?=
 =?utf-8?B?Z2s2UmRiRFZpdjBobEYvWjFjdkN0aHd3K2dYdmNHc01QVmtVRlRNZzRrWWFt?=
 =?utf-8?B?MkJDaHN5R0I5QVhBUEE2bzJxUnlneUNtZTZBaFYwM2t0cXY0OFUzRHZTVzBw?=
 =?utf-8?B?dUwzaG9UeDVpK252V1kvTmQzY0IrWUxlR0Q3ZW1maTV6M3NuMzc0a2doeUww?=
 =?utf-8?B?cUhJbDMzWnVONzBYMTNJcTRoR3E2UHZFZVhYQzQyQUk4Nkc2Mkh4S05DWGh4?=
 =?utf-8?B?UnM5UXdMTkdiUEFNZGZ2L2tBYzZPd29IQVlST3ZZdXNTcU56T293MStGNExG?=
 =?utf-8?B?emdZRmd3SmRKdFE3RlhCN0l1Y29WWmZwOFEvTEhvNEZRVk5ZNTQxQnJLOXZH?=
 =?utf-8?B?Y2toSVU0MVhBQ1BmcnZ2UHZETCtWK0tmbzhKcVRTWDZRY1daclUxWDdocVdQ?=
 =?utf-8?B?Sk92WTFZME9GU1BHTDVOMTMrSThTQW9TckMvbnE5OXFld2tzR3pabjM3VHZv?=
 =?utf-8?B?QVNhS1FPcGt5WWZzVjI1Y3doMkFXakc4VlBmOCtMcjFrTGNKRUVsRzdVbmxX?=
 =?utf-8?B?ajN5YlpmUHlkUkQxZE41c1pjWGNCWXRuKzBWVCs1MnI3LzN4VW9haTU3TlpG?=
 =?utf-8?B?YVpLakVXQ3U2NDBXNmZCVTMzTnZNWThmUnU5OGs4YnZIRTNVcXJKSldXOUNt?=
 =?utf-8?B?ckNjZ1RTREx1NlVzQVdmOHZJaEVHNVBoSCsyem11Si9oSUNKOS9lQzN3dFNn?=
 =?utf-8?B?cXZvRTdySHAzN2pTRTJOZUJQeDZoQWs3c0VzdmhUMnYwWkNjcVd4SE1MbG9h?=
 =?utf-8?B?SG5ncy8zeVF2b1VBYVMydEd5UUVlZlhCYW5wQlJqQ3pBNTVOWmtPZz09?=
Content-ID: <D30A444544535841AF148052DA63EC46@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5c9819-6dc0-4c01-e1ab-08da4ebeaf17
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 11:03:31.4208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xl5MdiMqN/C3hs9YESRBhVNkQc8Zv0V2gbm8/UYMwTCORL59o0rlja7gj841TFEG8WOiTErnqfjpvrmnH1AjVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3876
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
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
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNi8xNC8yMiAxOToyNywgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6DQo+IMKgQWN0dWFs
bHksIHRoZSBwYXRjaCBkaWRuJ3QgYXBwZWFyIG9uIHBhdGNod29yayBmb3Igc29tZSByZWFzb24u
IEl0IGFuYWx5emVkIGl0IGFzIGEgcmVwbHkgdG8gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhl
IHBhdGNoLiBTbyB5b3Ugd2lsbCBoYXZlIHRvIHJlc2VuZCBpdCBhZnRlciBhbGwuDQoNCkRvbmUh
IFsxXQ0KDQpbMV0gcGF0Y2ggdjQgd2l0aCByZXdvcmRlZCBjb21taXQgbWVzc2FnZQ0KaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yOWQyYThjNy00
NGNkLWRhNDItNWZlZC1mMTdlYzBmOGNjZjJAc3lub3BzeXMuY29tLw0KDQotLSANClNoYWhhYg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
