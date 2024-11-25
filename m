Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF89D59D7F
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 22:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06BC949E9A;
	Mon, 25 Nov 2024 22:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcIMGLN8MbQa; Mon, 25 Nov 2024 22:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9785149DE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9785149DE5;
	Mon, 25 Nov 2024 22:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A0A6280B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2476784FB0
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HebbZJ29coI for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 22:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61b;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=ibai.erkiaga-elorza@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE2A984FAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2A984FAC
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE2A984FAC
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 22:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMagbNQn9TlqiF1NuNa7VaqRfJqiMPqHXbYRVWHJWUvKUss90JuxtFzf/wPHthYE5O1lHYrbrJCvldAFqE5PAl1Flj79gm7dCN/awJhqqrHKtT8fR3hFqPcKzB85zFLwzqvZkA70IkBY8vnOTR1AreuhP8wgAWxxyVSWMjBX2bi7G7mpxCwbn7rRUJ/VXFX/xF6DQZQZRnu9B/y8LKj0u/oLxRNhuOgkno/h4z7kYfwz8epmwPst08mMBV8t3cA2Uv990hotM4kv88qrahVA/1ZZV2wZsNS5bZj/3rIgw4WW4vkX575DSxEbi6N9Awh09beo4sbjDM8HEc8IKMC54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLO44jYRgCjYzliz/IhEmTp1pV13zBpQMP2+IWArs9M=;
 b=xvlsDlmdzoEV4TI3gzURSuQoph34tWn6bWasfdhsR1I6uSUH0KKxUk8YF+FqULjNILzIIEQIARv/Y2/FzGqtcJzGp/rGEMFWRv2dlVkJKBDlJI/34H+tQPQoZvNQz2J9mQGZToiZE2S57RgHnJHGg3Lvu3ccDjd5OC+cSS2WbF9FG4Jb5IKREC2Z8UTxzElm0LAKhCr8d3kacVMTuZWHEDbszS+20pfS8n1S/xN0Ob0UsGtKlaSdA7q2OpuxvHrWP0ZZXH4z6E3OojpgfWhOzvlJV6aDJqmaP2l6cAbbuoEToqiIlJ8TJnmIKhdrJHBZLvW3q6dHDQeO2okVGMAVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 22:52:47 +0000
Received: from MN0PR12MB6004.namprd12.prod.outlook.com
 ([fe80::8146:4908:c42d:7eb5]) by MN0PR12MB6004.namprd12.prod.outlook.com
 ([fe80::8146:4908:c42d:7eb5%7]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 22:52:44 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Issues reproducing autobuild error 
Thread-Index: AQHbP4yyVJbkyYM9U06ZMVgcVFRRQQ==
Date: Mon, 25 Nov 2024 22:52:44 +0000
Message-ID: <MN0PR12MB600414FC4F51FC14FAA8BCDCA02E2@MN0PR12MB6004.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US, en-IE
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-25T22:52:44.332Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6004:EE_|SA1PR12MB6847:EE_
x-ms-office365-filtering-correlation-id: 65040c55-ab49-48b2-a8d2-08dd0da3dfe5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?eriBqjmCrSpAeanLLWxsQmHFSFHpdCgE707Ewr8dglYjYVSPTuiEMFvNyE?=
 =?iso-8859-1?Q?de9d1d1asSw7hCQ4OO2dMsRZ0HVBkNL370rA+zA318p7ZkTxTAcNveOv5v?=
 =?iso-8859-1?Q?dGhC6RkQYl+MESqrr50fhz/IX4cghhjy/GVY2neTu3FYyGQGOko8mS7dr5?=
 =?iso-8859-1?Q?hnxPwBFekvbcqtQUGxjuGKX9S4E0Kbnum7ZMNBk690iYaTMqOKaKdsZkMq?=
 =?iso-8859-1?Q?8dhM52mwd7acKZROfTUAX6Y3oQF7dtR7uh+piFvQGF8kXqjPakWLM1CF8t?=
 =?iso-8859-1?Q?suXVWA+gjCOazrd2rV+dN1IyCm5vo7dbQf3H3av/ceh/uV7/Z3u8Xv/hBO?=
 =?iso-8859-1?Q?zIx0g1y2/OpzsyY2TxDBtX3ScwQVbDW/NLw7G7IzCf9z7uojH/U679CT9l?=
 =?iso-8859-1?Q?JMD9DcOsyDfF8wSNOdwlHZJDwuARCHT6tNJ0F5aQSjH0VANHB1H9WfykBs?=
 =?iso-8859-1?Q?o+X9+/9vFTtuX9xUF791BpszqUiMi/meBlfccuVd7hyV+8+RBvJV3Mb3h+?=
 =?iso-8859-1?Q?06GpcrpAxOmdHk/1qrNoVUI7/fQiQlpMyU2UMdxNLj+8/iQj0+EAKOd3Tn?=
 =?iso-8859-1?Q?ijmeEcbnMYY44ydR69EXU3lVtJV6lTmHANIXYR+X9JexojoOEUY7HsGA7B?=
 =?iso-8859-1?Q?DXdvWi6qmve49vBmhRjscdIye4jrdyvMcUfLbuUzYqEOSrA7iOvnzlbMAb?=
 =?iso-8859-1?Q?oMuHAtMyA+9bVUB3deZwqd3jFxnNlzgV4KUcYfg/0KQXsiqZtFJ5w/taCV?=
 =?iso-8859-1?Q?JvriOC+D2xQAolEfGkcn25/gAIlFZnHlzj0Ohgl0NU7BNVYlBkZwzqyC1p?=
 =?iso-8859-1?Q?syMtlbBb8vWs/h+Zx7iG+QIg8P/4JudLa+eOdSz5ND1zrmVBhWFwCzQo8Y?=
 =?iso-8859-1?Q?Zb2wPqyuvZ3urXNfWLlQW1+RvUEyNyOVtEK3bS+4VUOPnIpTf8UNjFPwWV?=
 =?iso-8859-1?Q?7lz0XEmHL/5FeA5Y3ng2dn7JjeaHDqZqaeFQynWq3yeAXnARfaSLeO+IN5?=
 =?iso-8859-1?Q?+s2119GKHsCH2CU+95Wyf/E+WNSLQ+6lFfuJjzL1JWQY7e8M2d+AeFlWcN?=
 =?iso-8859-1?Q?5kNinEfFzCnPeuyS4QtgaKACXjgiPkYoStYQ92kn309d/127QfbKqiM9Vn?=
 =?iso-8859-1?Q?5IQ1VHgJMrLXUW/gDZJhFligOhGeCppDWAwdqTplaMSpP6svAlZEBfvK3e?=
 =?iso-8859-1?Q?CG4nj/7NbOZJcEFX/Gz3nUditcM3vBI9AkAvYEd3tv9zB7wYBFaJ1cPgKC?=
 =?iso-8859-1?Q?Bji6yaq44MMTTMp8omCas7BxIjZICTqwkNB6ocDMy1sN7Avrto19GRgO0o?=
 =?iso-8859-1?Q?JVDne870WIfAvYSzHtmyo4vFJRlbmGyrrAYZs5qJw/vPijtI+szrWHNk6E?=
 =?iso-8859-1?Q?1oSWrOtbNpFqirXg7fZ6wVbPwlGVUUrE8NXPtSTwsVduefsJ0krp8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UDqNZVwFpLxI5tdrh8igtMmAORrKSytYJBGrpiz984zDl7R2eD8JnlvCbl?=
 =?iso-8859-1?Q?Pq4Ad5mE7FAX9vnss+v9Z+IrVowPvcTx2OkggOIf1k7xAfaaeX0PVKIxaP?=
 =?iso-8859-1?Q?9KX7ZKWP0IijY2kLxgSRIMHuuK13wYCqxruw+dKQbANznGVk31HAwX3d+b?=
 =?iso-8859-1?Q?Fv53c3ASxK66K7hchvbukjnB20BYUnwxPQIWQ1YuFjyYOHhWkykrTBExR6?=
 =?iso-8859-1?Q?vsq+5HLXwPKJxU3Mct1/nqOkMkWSKiuYNfE41lTJGhD0U/zVziW2PdwEMe?=
 =?iso-8859-1?Q?2+RYQmv3JQjQJdzi3Ueb8jHxLjmgS+ZTryojTJ2ZZcwVZC3bxkY3LAWGgl?=
 =?iso-8859-1?Q?tV7TabDTrA/7HP+kruD2lkCvmKgAy0vOVPetq3r4vrNz4l8YmbD4u2Mp1Z?=
 =?iso-8859-1?Q?+1DRBv4j/s7hvxXi0K8Pm6eOWAdey+BMmt9g4RMfN+NcBnpbTmpSfPW6SW?=
 =?iso-8859-1?Q?fHUSWBFstQtsNozwYtQJwQvFL+kvIA27rJ4xuD8xyNuACcqgs+f9AknwDC?=
 =?iso-8859-1?Q?fNAEqUiuH3vnLaGnLRgv8zUJnSqba2HizwWkwAAKWDcP37oMo258H528uD?=
 =?iso-8859-1?Q?LeTJ9CV/4mb7xDxnJEPcDxbgOp54K+oWdSMUfJHwn5ABbZfK5r3QH94GgD?=
 =?iso-8859-1?Q?ZGGQDOf5fqwuxrcmGTaFzubVpL6Oswgk0t8mH8mZRCey4UsmZewSzS/Ntr?=
 =?iso-8859-1?Q?aLFmpS4ywqDMhFo8Kuqz7YZq+90bcpqQWf7diRg3fKMQ9rjlsGJdWYH3/a?=
 =?iso-8859-1?Q?h614HA4ZWDz0sXWwzZFnIqo09TLY1FN9kDjTnGd6Xsf3yT+xkiwRK8s3Wb?=
 =?iso-8859-1?Q?XlRZjUDDWPCposhtidOyOFwCHUfy71l5ah7xWMlEfz1GdQsQdFiEy3wnO6?=
 =?iso-8859-1?Q?ja9HwyBLAaCdFFHo7sbqR/4/ro68ZFIS/YmSRWNz3w+YDyea/5HyDU0lgL?=
 =?iso-8859-1?Q?Hz8s4C9wP03YZTzinla3KUjUksR2AePpe0ENE0NEkcc6WJCqXlLIN6XdbP?=
 =?iso-8859-1?Q?Iqkn7JO/O2EvHXIm2fxztVUUmQWYYx0EiW61cRF21qZqZ1mYlGHjQpGI/o?=
 =?iso-8859-1?Q?tcHFcSyEEw/8eQN9D3KgWCMjHagnAGZct2ycYibMD5YL+7aiQ91gyngmDu?=
 =?iso-8859-1?Q?eR6ZEKhLshXMQxPaqBB/gESFCH/Jbt3AyoRQqJIic4NWHicgcneSLHPHSz?=
 =?iso-8859-1?Q?9yFgqrkJwNpywtAfVhP983KIoAtcVPLZsBp6ckic/Q7eWBl7sOFX/EphsC?=
 =?iso-8859-1?Q?lwLgKBSQu4m/xIvbetzUv99qG5TFaGLuDwO+YVrYTCy2FVQAySCO1dcBDX?=
 =?iso-8859-1?Q?sKLQKsYOjjmiZBvR6f3BG9wtvhNF/PRc+qp54Y9dhhgjI074fsAbr/iB3D?=
 =?iso-8859-1?Q?LeYTAHfnqBTRr5lQcViGSdGM/SCGdb9VkJHWZQn80RbiVIfRk3dO3fxKNd?=
 =?iso-8859-1?Q?/9t6+L4JaSnJ04+32mPn9gwWRfALtzUdXetKak8nKU5V6fn0ng4vznoDiG?=
 =?iso-8859-1?Q?1lJjcIRPm2WGBm2fcSh9P/vBKcS3mBKdE9sL9KaklCJ/11bMWN4nkJ/Qf2?=
 =?iso-8859-1?Q?ET63bl8fMhp15e5AeN5+reDgEK9YxEweeY8CPWgs6X0YqjgiPbBKr8sSEh?=
 =?iso-8859-1?Q?37GujusHRGln0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65040c55-ab49-48b2-a8d2-08dd0da3dfe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 22:52:44.3404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idz/FLvN1bhi6XRFzAX9AI27CcDCSnggTt9o3wvfOdPNF9Bo/6aSVQtBgmHHc90r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLO44jYRgCjYzliz/IhEmTp1pV13zBpQMP2+IWArs9M=;
 b=yFESA/zJw+iYMY/1Ofgj07WQDZdghbOvzqJhm6wJ40HVzFGFGDQILj5efAnQx2W6o59tPbkIDOnTklINIo8Xb4IVZ37cJuX+NbyU6BD67EwjGpEnmP2jmp17PrEueIk34jFHpmoG92jF018+rux7LXA+7E+RLgM7XzB3os3KWmc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yFESA/zJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: [Buildroot] Issues reproducing autobuild error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Erkiaga Elorza, Ibai via buildroot" <buildroot@buildroot.org>
Reply-To: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: multipart/mixed; boundary="===============3558176196818526022=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3558176196818526022==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MN0PR12MB600414FC4F51FC14FAA8BCDCA02E2MN0PR12MB6004namp_"

--_000_MN0PR12MB600414FC4F51FC14FAA8BCDCA02E2MN0PR12MB6004namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi all,

I've been trying to reproduce an issue with host-binutils-bare-metal packag=
e that has been reported by autobuild without success. I might be doing som=
ething wrong so just sharing the steps I'm following to check whether anyon=
e can guide me on the best process to target this issues.

I.e. error:
https://autobuild.buildroot.org/results/214/21497e5a6f7b6717b061f74c7debd83=
f3bdb3a6e//

Steps used to test on my host:

make distclean
make defconfig
wget <autobuild config URL> -O .config
make oldconfig
make host-binutils-bare-metal

The build output is fine and cannot see the linkage issue that is reported =
on the autobuild log files. Am I missing something? Might be the issue rela=
ted to just the host machine settings/configuration?

Regards
Ibai




--_000_MN0PR12MB600414FC4F51FC14FAA8BCDCA02E2MN0PR12MB6004namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
Hi all,</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
I've been trying to reproduce an issue with host-binutils-bare-metal packag=
e that has been reported by autobuild without success. I might be doing som=
ething wrong so just sharing the steps I'm following to check whether anyon=
e can guide me on the best process
 to target this issues.</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
I.e. error:</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<a href=3D"https://autobuild.buildroot.org/results/214/21497e5a6f7b6717b061=
f74c7debd83f3bdb3a6e//" target=3D"_blank" id=3D"OWA62aa0e9d-7252-fb63-fa48-=
fde55bf2f451" class=3D"OWAAutoLink" title=3D"https://autobuild.buildroot.or=
g/results/214/21497e5a6f7b6717b061f74c7debd83f3bdb3a6e//" rel=3D"noopener n=
oreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0" data-ogsc=3D"" =
style=3D"margin: 0px;">https://autobuild.buildroot.org/results/214/21497e5a=
6f7b6717b061f74c7debd83f3bdb3a6e//</a></div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
Steps used to test on my host:</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
make distclean</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
make defconfig</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
wget &lt;autobuild config URL&gt; -O .config</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
make oldconfig</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
make host-binutils-bare-metal</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
The build output is fine and cannot see the linkage issue that is reported =
on the autobuild log files. Am I missing something? Might be the issue rela=
ted to just the host machine settings/configuration?</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
Regards</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
Ibai</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
</body>
</html>

--_000_MN0PR12MB600414FC4F51FC14FAA8BCDCA02E2MN0PR12MB6004namp_--

--===============3558176196818526022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3558176196818526022==--
