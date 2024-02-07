Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B42C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4672682094;
	Wed,  7 Feb 2024 09:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CycRA3gqLzxU; Wed,  7 Feb 2024 09:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648BD82064
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648BD82064;
	Wed,  7 Feb 2024 09:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 358C91BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2366C61399
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIxaw0_ANaXV for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::600;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB06861396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB06861396
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB06861396
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5P2E5vxta5AVNkDka9uSbBXdeLofP2tzx0KH2+XBeJw8yxrFQ3i57khscxA5tpTK+wpY3jRgFkSewznqaWrhU7ikyw8GNo4XAGtHcdYJCOd/lLDiQCklALV20gcmzfyIlL3H/s9sK1fqnv3Z6KV8X0nqmdTen4pXayfNd77k8G/TDK669+C5WQ7SCFbzjz8lthg5QrCKUFW3l36/Z9/Y0ajC1pZUwT2+y119WBCc6zTiC1cVQVmSHpy87h5pCXzO5o4K/yk7oPOSgA6h5XyyY/pXBHssDuGCOwsWSuBgWsXWewYlXyY9Lt6enjS3RMWerw4vrIEQ2d37kEyRFuWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqWg2xgcsQIRM8NLJrSxbQHMtjjBsS3dF3HsSY/WCNs=;
 b=VBQCKbtt71Ot27rV9bielXWX7VpWo9ngTjtaesPQYZ3Ll/8DytZtBXJNI3HbBjB66fctpUmqZs4/M6iwOEdgCL4evkDmYch3FNkX4pk9hGdc3mktfRqsrNvmryC4Ri9DV4zk/lDDXPfdhrUUNyVCssC7LoDp3ce+8Ih+jY6Izr42F250hF5TQL8m/i++Nzoqu2jRt2XvQpsUhQEtbrJTwVM7LdUuR8vLpBnq0uY6VCeMMFsiA6RlicVcaVV6a6jFXDfhD6Axo05cdjZtg9opKR1VxOjKD3lpBlzsgkcKEUhtzGoLTylid36CJ1fdhQnLpQmlzfyTroLni2M01+M4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB5405.namprd12.prod.outlook.com (2603:10b6:a03:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.15; Wed, 7 Feb
 2024 09:00:00 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::843f:50be:2b44:457]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::843f:50be:2b44:457%3]) with mapi id 15.20.7270.016; Wed, 7 Feb 2024
 09:00:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [PATCH v9 06/11] boot/zynqmp-firmware: new boot firmware
Thread-Index: AQHaVDf3iO37MvF83Eai9PgMImmRJrD+nZWA
Date: Wed, 7 Feb 2024 09:00:00 +0000
Message-ID: <CH2PR12MB5004CB6FA7EA005C4F36C796F0452@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-6-neal.frager@amd.com>
In-Reply-To: <20240131112223.2175855-6-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB5405:EE_
x-ms-office365-filtering-correlation-id: 8c60b5de-4016-47f0-f206-08dc27bb2a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ZSRS+/dwWjq7S0IaV8icTWcSvkiKoHy+w0Kv4Q1W9pCTArntg43QPthMmb/2YcZcGwOtT5KOyBFxZyU4vbebW8n7ik6hjh2rzuyDDAKOCCIn4eU81Qw3emcMdJeoS3t1XhNJJ5c4umRkhhnwoeR2kIyMRnqfJTqlnkh5ZIk9hw0lKFDtGoYrO4cNpe5htUT+9Fj3y8ztfmukRbO8sCXigFqpRtvoSR8bHeDHLSw6KTbHqpd/yM6nqDGUe9wc9CcrhJ7XeDHcpZ/uRVbymDzWqguVAyaX63yjEW1VjNNVtNI7S79fe8Ycb4dHW0g8PnYgR5od9qYWX09LeMulaDRfUB4MT0HIyKN70MB/k03ts4zsG5VUWQ0mKY8bMHPs8uVMhoTmaDUpOkuH3/thLCxqF0XhtaJOfo+FaXfENqz1AWCPhr1fIxoskl0Z7sl9CJEk2NVm4/xLfxeRVjcthQbxT8bdZDZevfGqJGDCMhf4gk4xQ4Pgx4NbQMCIM5l0bokXJwGdReZquhflJC0aVfMCZq0TXeRhTdZHSej9bUZdIEIdccf/ac9ag4qBBelEBfyoq+Rw7TgzUezfmGNihJsfi6CaA2G4DcUeqRFtJEswAEVJwFE7YfmijWcL9TZBuEm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(7696005)(6506007)(478600001)(66946007)(33656002)(76116006)(66446008)(8676002)(55016003)(52536014)(71200400001)(66556008)(86362001)(5660300002)(2906002)(4326008)(110136005)(54906003)(83380400001)(316002)(122000001)(9686003)(4744005)(64756008)(66476007)(38100700002)(38070700009)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kSGzfQeOou/djmdi/clIMaKJ2ZPrjl7UZiAFIltEnO3o3YHFaX/N8igkI0Er?=
 =?us-ascii?Q?D7ceCRJIdq2fu3CTBksJmo+ulguUIBhyYBmBvO0VlEFoxrxXpO7WjvMqJzdn?=
 =?us-ascii?Q?ODzrBKwmqlYjU/hnkaaTE09E0Z0aROlwEP1fNNzOoCLPX+NIMQVTBwUu+isw?=
 =?us-ascii?Q?VCna+trlyw2JrXMnJf6TAUbtDDZI09S8uo99DF7O+y8QohT9/LsesJgnmonB?=
 =?us-ascii?Q?82VDEvvRAq9Enk1cmX+neN+y8HSFHeb0Us7f9gtQ9CwTM9K9fmvhEK1cCObn?=
 =?us-ascii?Q?2h97o055LLeWuEc3BM5kiA0Wwjc42KD1Yaz8fqycGB7H9tP1x/n8FqgPitTK?=
 =?us-ascii?Q?QnwJ38fTqLxTCzLbWUX3C+fmFiwM/UT0mfNCDvVqeWnPwy2Z0bC9BdubZLWm?=
 =?us-ascii?Q?4QbVeEX3HmJ0D4EGGxMwZma0f9sZ5iRIAk4juuhIZS97l3V/jPNy3wbGwCoJ?=
 =?us-ascii?Q?L1p7jMxa5M7HO+jRLQJKhq8JNbHoUP26raryCEumu/ogOTF6HNxIa22/EUQw?=
 =?us-ascii?Q?+9GLBWPN453BQrB8RTwC65t5U8WQCdx/rHPVOxzbi5K/Zis3xFvBbtTy4vzf?=
 =?us-ascii?Q?e1CysjSv1ymnuyasYMBvsxbnne6c/ePypZ9ieH/w1yUOs0rhYzBkft+aUaJr?=
 =?us-ascii?Q?vWxw3gowXBr/5tIb8RBg3srh6Ka3+FihCiNVOTgiwTKYQhAUSppbfOF+loHM?=
 =?us-ascii?Q?BqU3AiG3cK8mE82A9wT+F2ANcbDnuSRoq3AiDVUI56WF0eCBeejuuWAHvQ3j?=
 =?us-ascii?Q?L8X5v2RChi60+Zsphi1YChBjQ0U5oh1Ksanc+a9GiNqTW6Ul4Ybj8ECabU1z?=
 =?us-ascii?Q?syOvlTvADy5mA19ktu0qM+JzL8IspwjmQNNa9ZCpqDCXESiA5cJyMv0BI/vy?=
 =?us-ascii?Q?v/FHlf3g09n8E9ubR4GqxHRcCjlSfRniz+gxHc9LcCu1g+sBEzqCKDGtsBXv?=
 =?us-ascii?Q?bC8P73sKdOpzaCMkHXSAXE44+Gl7tcUnJBt1V0mHFP3YUlvjNLvwBAuMov9t?=
 =?us-ascii?Q?dUKEi20CajRhOYKoP9AO0qD7d14HnPEmlzb5cR7mLeYqksZVHS0O6zANimJi?=
 =?us-ascii?Q?g5s8tPEgRPAUxoh6VeTnwIzP/N+J82YrT1Fldj+ARPBeRYoU6K4RtNJb7XSL?=
 =?us-ascii?Q?fbY4mm569PcmA94QjpEnHuNrbrxqnhBGY0g+Aazra+5QoonqMh7uPYjpZVwv?=
 =?us-ascii?Q?KNksocDIr2qtQXRJJXYgqFlESk/4ZQJW7JlIcN0wbOqGLORjCS6f24Zn+o1n?=
 =?us-ascii?Q?xO+DYFS7MB+8I99MODT8OT07oJWsFI5b8JavJQwNP9RKl7yPkWulMT1yAfLT?=
 =?us-ascii?Q?F/Bc/Lh31hDlDJDxrURbOeWZaJngdNFmfLSk8xn9+OxQEVf9X3tEq4qObncz?=
 =?us-ascii?Q?taV9gEzl33TYpYagk/rBa9DIBvliZD5dtcU19Y8VNv9EgHBM2tUNLpHFdvAd?=
 =?us-ascii?Q?okopOGZs4PlrTNMHII6VOE/p3G8N3wTkHZDq1qKCxoeH6iI8KIk1gAq0C8h1?=
 =?us-ascii?Q?LWMLe5qbvverUBZfW7D2r6Xr/zXn3LKr9oOqJ0St/J+s0JTMfXFunTOe7BDe?=
 =?us-ascii?Q?B/qrXi3CHC842cotD1KJW5CsGtGm9w1P9gOhPuEAQWejUrLYCVM+o9fXgIqq?=
 =?us-ascii?Q?M0Nx/J9QDELQ652NBn6IJRU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c60b5de-4016-47f0-f206-08dc27bb2a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 09:00:00.1719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO9VexGJQ7myE5nfAZJKYJu8T/Xq/4dTHG4R9KZqHFLjSri8HYjFL9q4y9ae5EZZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqWg2xgcsQIRM8NLJrSxbQHMtjjBsS3dF3HsSY/WCNs=;
 b=vuR+hy9MNP5FQvw1r6aQpRhZFp2+UDoF8hiKF4H8jGpG5O+UqtINvKMR3FOJORh+yB7Q7Q19nR+zQjQjPvBssyQBufgykdr28dMl8zjxp0KVtr9hsu/rQTYieZbA4sPHYGTi1y0e18Jw3U73J/erennbBJlR2uNT1b4hd6O5j8U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vuR+hy9M
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v9 06/11] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Now that the toolchain-bare-metal-buildroot has been applied, do you have any
feedback regarding the remainder of the patch set?

One open question I have is regarding the patches for zynqmp-firmware and
versal-firmware.  These patches are no longer neeeded since being applied to
release version xilinx_v2023.2.  I kept them with the idea that users may
still be using older versions of software, so the patches enable users to
work with versions as old as 2022.2 for zynqmp and 2023.1 for versal.

Do you agree with keeping the patches or do you think it is better not to
include them and to say that support begins starting with version
xilinx_v2023.2?

What are your thoughts?

> create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
> create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
