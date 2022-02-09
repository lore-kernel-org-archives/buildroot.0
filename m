Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCD3540925;
	Wed,  9 Feb 2022 08:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bb-r64QT145; Wed,  9 Feb 2022 08:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE4C34091F;
	Wed,  9 Feb 2022 08:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF191BF3A3
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 08:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66F6382C1E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 08:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T07aR2lqKbI3 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 08:30:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D281882CA5
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 08:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt5Y50HQatQ7OIxGhOYYEegUQJ4ISaxxLGI5AONeqV09r0QuTFSvxOnjXX3OXAsIvnBwd4iaIzpK2S8a34+j5Lk7gzyctfSuHWwibmk90IVRn7elH5JLtg+7x4rrBRh6/xje/pvj8LKBqXa2iS7woz9Tmy4sd/6cVwF2kxy3SNt7TlLFO6TuKlCICsBDVZvhJaJN6xFpDcAGBaDVJPb5X0ZN9JxSCpU4beeKxeRWd7m43THA2CHgqCAnTea8T4UTSSe74GkYn+3Qj62LO7+u/Nu+z+/9V5oEj9Q7e6v6yeIYNhqf//UQVFX6jFaGHvrq+hN0empsz5jU0RiDaNsyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MErlwV0iIMrw1RG4HewHijGqxTL4ns1kfaPONaHD4Ck=;
 b=PpKl+cC161Teegc8vz+BFJf7uJBAHGCunkG56LfGJZMpEfoawDZkCYiTTc6Hr/sZfNar507EwuFGqFKx/XJaWVJzAhiEpj55kVvSPVEMCIbxXVkJubhaTXZPa/7wL84x8DYkkwqQkkvqVZCmZVtLjggZpenlvtwBd2O6mx2g+pXsjFLVwjOqzPue1KX8mtCAslrTgrD8BR025OkG4hgb30PXKFALx7PYKYZZVV0o3xxhFL8Cbb4bUO+ZG8DUyxBTZ9j9BeOYYMN2q7Hw625G0qodo+oBrJsnbg+ErLV9Ux1RuJ523J7yzdOLPkRvt6c51Wkd8YNmV62IiVesIHzigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MErlwV0iIMrw1RG4HewHijGqxTL4ns1kfaPONaHD4Ck=;
 b=WcVkGOv+bGEe48zUBYQ1GzLmVqK4h0qrh3ysJ11zxfXbRSUuqozGJmLRfWFX1qJodVfe5CIlCLiI5MA93SSi3tagLcUOCJUTQbQM9V2c6q6U2yBvJLadftTwRdrelesk+P6cmvhA5ceSq+sgNUJYYqM2cB1xjS/eIoHEOUbnFBg=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN8PR02MB5828.namprd02.prod.outlook.com (2603:10b6:408:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:30:07 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 08:30:07 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAAKt9CAAE06gIAAAs5wgAAF2YCAAQLO8A==
Date: Wed, 9 Feb 2022 08:30:07 +0000
Message-ID: <SJ0PR02MB7758192D01CC60C47DD9BAC7D72E9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <SJ0PR02MB77585322044616B1600B5D83D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <cfd7b2a1-f06b-c068-939b-f4f0bfe740b8@benettiengineering.com>
 <PH0PR02MB7750946D063D95F7A04A75DBD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <97653013-1d33-4a03-00cf-ffdb3fa5e723@benettiengineering.com>
In-Reply-To: <97653013-1d33-4a03-00cf-ffdb3fa5e723@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6f11278-706b-479f-3531-08d9eba660f2
x-ms-traffictypediagnostic: BN8PR02MB5828:EE_
x-microsoft-antispam-prvs: <BN8PR02MB58288BAB1DD58BC860827E4CD72E9@BN8PR02MB5828.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mR56g3OrD+6xgZ3dP23PI1KiAJzQ0fiPgclsqPMkkQgqgwn4qIuR0rilmr1fEFLw+UTO1b0nPhB9cXvjyI0GGm6xatziMKp3Ieo/pO6iziUX+2SRlh+tNJZHCF6RF+IgP2m1Nz8KTHxVdFKkJsK1X/ZX+kNqXEHHDqgjA8JI0Uh6aS9XoFvlAcgO6mEPgy2Fyt3ZPtCz222Slz829K3p8tTGnvDLPd6Ju3blSrBopcyO9SCoFLavvIa2bw9kVVE4RjKbe3AiZuuYcs7hWsxVaVQqhc4c8SQ1kEu7VJPh2XrPpXZHe2RA71fk4ODwKC1xb6EeecC/JOl8UV+OzveHML8TIljDfw5dra6LJkYmj31lIO1cyM6AdhXJRNym+lrZrjezLYhyiqFvzs6JiaQfCbCQQx7AWk28Dy3Te6rdaFPsqYZXLxU7oFSar4letC0VZc8HebYcvwGd5u5hFn2BWanLZHyyt2i+LmClAwxKykfaVWe2aPeTjGdlnx3wjMES47EE5UeNUJcTxK4TZzcMytkNJa5FU6UJvBc5LHvQZ7tH1p3l5ZGGLEo5hqutJZx3aUGbeaIZwYbIN6ybDdjobfhOhrTdYq8Q9jt1P4ndM5R256tdTDu0blhTa8fSE6Wb7hZK5JMc2R1BY4Nc+LhaHvFK5irru6hqXNkkqiQijvgDdsOUfo5e3zB1yKkKEyhABB2eCjedlvOziSjzcLAwjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(508600001)(4326008)(33656002)(6506007)(7696005)(122000001)(38100700002)(66556008)(558084003)(9686003)(107886003)(110136005)(66476007)(83380400001)(316002)(86362001)(71200400001)(186003)(2906002)(26005)(55016003)(8676002)(5660300002)(52536014)(66946007)(64756008)(38070700005)(76116006)(66446008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2RsWEhOQ1phUDV1Tjd2R3UwM3pGSDVIcytrd0I4ei82V2V1SG1FOVhVOHkz?=
 =?utf-8?B?UU9OMmNoMjVlaC9tZGhNRlNhYjZaRDVENVdndm82TjVRaktrNHUzL1JPREl2?=
 =?utf-8?B?aDRPaXM4WnJnM01UQUpCK0ZCejJPUEwzV2hUL3JuY3AwM3hlRC82bi9jYnVW?=
 =?utf-8?B?WVRhY1hkZXRUWFBNLzVlZy91aW4rMGhUS01UeE10L1dkK3JtbStsZE50ZUVF?=
 =?utf-8?B?ZjBjMEdaaFVJcEJJTkZaem9nTk5KSzFETGNmRzgxYWxSV3VaWHZBSXl0WHRh?=
 =?utf-8?B?c3FvdjF5YWd2cDlQVFMra2VRWWhjd1VzeGgxLyt5N0ZodVQyYzhTMXpYUGdr?=
 =?utf-8?B?TTJlMHpTRDdtR0U0QTY2eEx3ZzBLT2Z2am12aTFVRTQ1UUVPbU1tVGxhMHVS?=
 =?utf-8?B?a2tzOXdEeUxUWk15VjVqZUVoUUVDR2FZRDRldkQzaUs5QkdFTTN3S1drSGFP?=
 =?utf-8?B?VzJhdjBlZXR5bVJ3K1o3YzNaemd6N08xYUhHOEhYWU1TZGE2N3owWEMzQ0xv?=
 =?utf-8?B?blRrZnJ0d0pJN0paY3VuRm5hMTZaSGZ4V2RZTVpnU1l4YzZCdTRtM2xjSUNQ?=
 =?utf-8?B?dVpmY2Y0Y0VlOS9TMndKWHgxS0NtREdmK3JlQm4vaUU3VnRpVXFRaWtLMzFV?=
 =?utf-8?B?VERCaUgzNzg1aDhpRDczVDRjY202eUduOE9kd2ZXcmV1RzFxWEhJNmlMMUJ2?=
 =?utf-8?B?ZWxwUTkvcVlYMjRNaUkzSDB6SXVYU28zZlZCc0luRmVEVFMyNHl6RWVNTWxR?=
 =?utf-8?B?YjBHQkZLNmxUY1laY1FVRFhzUlhjOVczOVlPYjhKekQwbEdBWWxUZ3Z6ZE5U?=
 =?utf-8?B?QVFFUzUzdzlkdTVxVXp4K3BLQUFvNTNyN1FyVzl0d1FpVVE4MnhxVlMxQ29O?=
 =?utf-8?B?V2RsY3RwQ0x6V0xqY1F6cUIwN01UaE4rQk1nTTMrVkJXbUVIM2piS3pwMDJS?=
 =?utf-8?B?RHRPckFFOG1XRDNvclJndnFtV2MxR2h3eUE0cFJybFZYcHRZdzBXZGpwMzEr?=
 =?utf-8?B?N04zVGVodWRtVWpSQnFlNEtmbHVRNllqVVQwb1lkTk1UNldxcE9IbUE5ZjVB?=
 =?utf-8?B?bzFqeTJ2T0xjYVhScC80OW83TnhVZitWTDAwTTg4Qko1VkFDZkduMW1iK1Zo?=
 =?utf-8?B?RVNYd0VEV0NJOXhEZzZwZlJ5VXRXZnVzQnc5QUE0S3dzR3JFRzUzTDB6U2Q3?=
 =?utf-8?B?VmxCVWp0ZXAyVlhPYXdKQWExQ1FueG8yNHQ2UEFZSGdLZi82T0hUeGFOV2M4?=
 =?utf-8?B?bzQrd2pSVlFBMkgwNGtHTTErc005WGl0eVc4RmdPMXhSbkRxREdxM3kzZUNC?=
 =?utf-8?B?Ym0rcEltOFo0eE1hS3dyT3NHQSt6N3A5YUZuZ3F4Z3hydVIrV1BxaUwzZnkz?=
 =?utf-8?B?eE1uempzR2lyQ2VtcXkyTWo5am5jQ20xdEVHLzQ0M1MwR0k3SW1TR1FiVnlw?=
 =?utf-8?B?bHZ2Ui9kK1ZDM2lTaDlobEJLRWVqODdZSWx1VFo4cmNqNFlpVFdxZDJCZmxS?=
 =?utf-8?B?NHN3QTZ0OCtqN1RheCt6aG9zYTZlVGZDNG5naEwvbENaLzNIOERRWlJUbGJI?=
 =?utf-8?B?U0lWWWJHZ3ZvbDJtV1Zaanc4cWxmT1lJN1ZSeTBNZHZZMUFJRE5iSGJFODR4?=
 =?utf-8?B?eG13R0tPY1dKZmN1RlhuMkgzNkZGRXFUVmdwYVV6WGxhOEhESE1SUnJDZ2E5?=
 =?utf-8?B?ZThOeGtXeEdzN2thN3dydXA3MGhQdDJDREgyU0VMK2pwSFByTkhQK055M0pr?=
 =?utf-8?B?REdWVzVxOCtIU1ZRS2NSaURrVFZaQkYvMGhqRHA0TWNudmRJaEEzVWZQZE1s?=
 =?utf-8?B?Mjl5OW4xWGxGR0J0cTBNbWgyWTNFODR6Wnc4UVNQamthc3cxVlg4Sm9YOVhX?=
 =?utf-8?B?MnAzTnRKVmVqekVVeEROclFBamxERzFLY3JGS093cHhSdHJJOXV0WVZIdUY5?=
 =?utf-8?B?MUJrRVlaQS9uNGhNb1hCZDlLaVQzWGFCckdId2xhWkkzRUM0QlZXL3dVUm81?=
 =?utf-8?B?ay9jeVpHR2tmUDZmaHcxc0dHeXZEcEdFM0thT0l4QkNuZkJ0SVV0RHpRdnJk?=
 =?utf-8?B?NHlqb3Z5c2ROVVFZT3ZhbE9tcDFmaHJmbGhXRmRhVkJ3Rm1uTUM5WEFHeUlt?=
 =?utf-8?B?Q2l6V0x0MmR2ZWorblhkYlBzZkZ4dWcrOWdNeEhBMllvTFFadDQrOC9LT2xk?=
 =?utf-8?Q?X/mt+wNQtwiDwHKh+ZTU84Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f11278-706b-479f-3531-08d9eba660f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 08:30:07.2282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CGNCa3KLDrVuxTfXzjUUbvJZQ9wIu80VFOHJvDW0pb8cgmxjJGO3LHx0VENWrH1kXFgDtkm6ZHM0sd9S4x4MlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5828
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> So now I wait for V2 :-)

Thank you for your feedback.  You can now find -v2 in your inbox for review.  I appreciate your support!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
