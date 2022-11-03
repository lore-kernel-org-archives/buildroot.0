Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD828C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 09:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051AC41756;
	Thu,  3 Nov 2022 09:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051AC41756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCWB8C8uwgMb; Thu,  3 Nov 2022 09:08:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2EC84174E;
	Thu,  3 Nov 2022 09:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2EC84174E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 034A21BF83C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C04E84174E
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04E84174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9y_3L2s0hPYt for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 09:08:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20E44174C
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B20E44174C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 09:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atXCJwVV0d/4tOJwObom5ZQ+9ypUqy0otw9LSwVgUX69Gc8lOZW2FFg/t/fzE3PornmyqW9sPj56rHbH4JOsRGsR9yb/g4H9dR0UCkVVvr7UfNTvaYDnBqHhZWqS6EWMNEJA4uKgdBfBtYu6pSAWfSPHCJC/BToSxE0onshMH2Ra/tdyYCM9uRH17Ha7KwkUJzBF73xyyOUmrglWksbjLEs7RgILxFk5ul4ojbRJky9luLfHr/dE1SeXebKlS51NJkKkq0fax4832eSgK3WkaZBUh7qYldZL90od+4K2NY4hLC1I/divizJAq4LVtUI8Nd1oNWcjeLAEtF4szjfOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI+QicaCRYJo+iK6n9UI2aQVhP3kK46r9cgUvixeJLY=;
 b=TKsCOZyISRniZr8a3M7DUEf65sTWMCqFubJoUOhBG0vDmx4PNMP/W0Lp4XjMjWByGylLRc36fIYivzEIDuzprkpE7QqmseKTXliUwYSO/qeI3smLIiZa8Ufq6dO5/rpfIrd8eTxbXjyY4mpcgSRilzngj+CZo0QgsZETsuynQTaimunFc1ff5xSq3kXJHr02eJtQijFAFbpT/y1W/AVLd56svI0Wsp5qEOTJseMmfs5ieh1Coutzar5qtpdIrrrbC6NBQ7LkWsVlbLjYrTLa/qmKMIAaYAcLKIZv/0f1twYgKI1gu1inE0e/44dYNv32b6sBE5/mItsOGiWCbZzzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA0PR12MB7004.namprd12.prod.outlook.com (2603:10b6:806:2c0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 09:08:40 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 09:08:40 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHY57QIHKFrcdzw5k+BQFfLZ6/jW64s4VEAgAAWoRA=
Date: Thu, 3 Nov 2022 09:08:40 +0000
Message-ID: <CH2PR12MB5004A4D2088C03D08ED2F7A8F0389@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
 <20221103084620.60165a0a@booty>
In-Reply-To: <20221103084620.60165a0a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA0PR12MB7004:EE_
x-ms-office365-filtering-correlation-id: a88a91c0-1d85-4c29-0901-08dabd7b0000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ZUOh6JyXroryVQG5/8zeqpz915iUvclb8fes4EGWimJ/Us5+cITetvn0/6x7rMjDaNo3EbBwDd/OTffP3dat2ygXiAr774bXiYHzz5+6K+hZztUJPuyxZCINchBM3O2kb2OZQMJLug+3g/oKvChGDUsMmsRkxNuasOLLAtCiLJiUJh0BpYNkcKUhdmx+0sceYaO3AuKeijH/FkU5j53aEALjsXOClze9uhpIto1zs3DcZLyHvwfMP1p5HZxx2L1e19zJIx2Do4TmHoUzMUq7Zwz0I5JPqn7+lQuosDCRomdothKETnMbiT80XX4VGLBxRnupRY5zTCtfJsvw1CaDqxc7E4lPtbIM0MmAv3+Fbk/VhObXl0PYgq1xCACxMPhaOjytUjCjAkywc7eCSlJYwxCmKv2WPOZBAfElxKFSSBmBHYXwwzgR+eEjOFmocsKaX2uMg50W+qQotxqvdRmqeRX142RfyBdRk+Hxp4/dSoxWXATRLustGeL5LQmFHNEuE7R28aIiUWMw/GAK/VDH99RqRY3P9+R6QbgZf7yOfaTlnjRjWgBCxe44lAAoYuy3CTf7urw8cbhuUsa9md+fitZt2skb34au+lcav6A3LFEOYZY+5i7VtCwMMa4GrMe9LF8RTLDDtYCFPuASTle8zsT3R1V+zJcKSY71iUUa3dYGsWk65TASDQNpP6Ynl0GW7p7g71C6RG4Ok0YguOhBaLYYIna7J788Igg6chn3hvViR1vnhauuWV+M9Lm1zpMDe/NZ0ybFZLZpZEvDFD6xMmSoaFSPFJMLIJhOCKjSbg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199015)(478600001)(33656002)(9686003)(41300700001)(2906002)(52536014)(4744005)(8936002)(55016003)(86362001)(186003)(122000001)(38070700005)(38100700002)(54906003)(316002)(5660300002)(6916009)(4326008)(966005)(71200400001)(66446008)(66556008)(76116006)(6506007)(8676002)(66946007)(64756008)(66476007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8L0EqgHb8h2qIfSBNwt20ei+18EL4gGsqWkRsDs9Y7MEk2XILdLUePnJfmhz?=
 =?us-ascii?Q?pahOboNPZoIlsVLZLwhM8r1IpjkTlDwvx2UQHae0tVFfGX4wrQiQH9ClsQdG?=
 =?us-ascii?Q?RRhlrHOM+N5J8lBVuTqQga0zqLeKW/6++vmVi30FgxYHntoLiFGLLpRLDZzh?=
 =?us-ascii?Q?Kv3xICrjFFX8Jol6i2CfpQeGyzzSoyW/vJK3ZO9ngzgdN+jFczHrumjfkunT?=
 =?us-ascii?Q?8H3UavbLo4aed1HnyRkcfIhm1r2xkUSImCIIH9cOp0HX287ar6f6MyXZnCHW?=
 =?us-ascii?Q?vQUcIMno4ta2YXB4/31JURvSU5+RNaOVyJzKEcRwe0bzGgiy/mS8r5cdXLhE?=
 =?us-ascii?Q?ZxbZ7CdAnv3pp1CUSywGlR72NbCpRbX6IlaU1FLngWECgjQCypgfSpZ08/GV?=
 =?us-ascii?Q?rUifbnwTHlXCDXaCDz9bvV1p8jSwKt9dSXcPYWOB+e3dD9dv3RCJAuYUs4WE?=
 =?us-ascii?Q?YKc8ncMUF9yzJ8LSfo6ob2Q50b6j79dtMUBmqsqMVIVXxxC02FfjistBGXNq?=
 =?us-ascii?Q?c4pX4r2wYdIB440lPc2DgpjhL3VSSKR2DPVKMsgDZthKKkRYnG9bVLdgIgQL?=
 =?us-ascii?Q?1ZHLq7FCRHHwDyqvZSbj7p+k2Vy4WFqmfI2msud0Wn5hV9IEA/+pA+cSK4rl?=
 =?us-ascii?Q?3Wm75n5zP9pIKEHtk2aX0BTNLfcgndVkF2IvainvPdeboPtiv1zn19SBwLuV?=
 =?us-ascii?Q?EBOCIw7/aomvkL/Q4KGu8z3GfQS4/sKN5uwwsh8sQL5eiY041RaI/jV9Hx7+?=
 =?us-ascii?Q?1jTUeGTqoVtVCnE4spGalX747x0IjssyFwiL8m9GHq+tyXGTdhmjU85liSXj?=
 =?us-ascii?Q?3lblOaiNfDBJtIF1Xm9U5aLPVYtoOrCwXjVv0kqa/hZZuOn1c4uwVk3QQA1k?=
 =?us-ascii?Q?lIbwTH1vRr5SOn8Exlb4aSxFmLWpZsXGsn9+ZTRi2IqNP+gDHw3M3gz0RohI?=
 =?us-ascii?Q?6H2lckuRMEIDUqUGNshTy+Dd1EP07rvZP7/Clg1KTEJHeQRWZifOuNla7Ctc?=
 =?us-ascii?Q?d69meRg7eOPsKp2UOkoFVyubYcDkZ1ZQxjr6COPEuOYutVf5H/1e1lc5nrx0?=
 =?us-ascii?Q?9Ijxk8YUgPKAVcW3lnQOIC38DqN11RE/McDBovEX+Yzo3u5c1hlgPhAUw7Ym?=
 =?us-ascii?Q?yEyZcCwfY/zRVMpBDXamihEXywNzIyat6W1CCUsHFRmyuZL/Fh5K8dOmSxl6?=
 =?us-ascii?Q?lwlMH2J5VEhgi3SXFy0mgiMUDRKNWEoCS9GH+bsVKpTtX9lPLGPZyMgzNsM4?=
 =?us-ascii?Q?5eoqHCZiDJp33V1lO6RbTCSEwW70dE5fIUuEJthSqYSrCxQLv9sKUfGUNXNl?=
 =?us-ascii?Q?zHb7X7PWmiJx8XA+dUJG08klCCzPnA83hjW9gbGVk3GV0LMZ6rhnpRlix7KI?=
 =?us-ascii?Q?xHLcSr53dIXGihKHp2GoPbxnC8vJZGz6/UIu7LDu0yoqVg3iVRccgC8xKTy8?=
 =?us-ascii?Q?9uCrrpC4lc1AidGJxZ4PJzuyGfk3TdMemHZm9rJKvSvd0fExlJpPOXFJQDsn?=
 =?us-ascii?Q?etVvVLIrRCkS9yhBpYQTA8uy6nuRWTYoR83XtcJhM4+1wF8a/9k9YxtRrJ1o?=
 =?us-ascii?Q?Fu/gwO6AloIF/N8X0GA1cS7y28RV72jhoNX77d3cR4pb/zCehrUNhM5Pll0O?=
 =?us-ascii?Q?tKUp+J6gxzVMitLDPVi+1sg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88a91c0-1d85-4c29-0901-08dabd7b0000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 09:08:40.4820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qC0q4RTFIlPuu/4DIzR6HjAlJ5WTC4jFCF0dVO4zM9UcECOCp3HZYTo5+3raYeMF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7004
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI+QicaCRYJo+iK6n9UI2aQVhP3kK46r9cgUvixeJLY=;
 b=QORsOZMJIx6wauhsXKz9S3UDaq2qFnVBRDXYNqasjSy3EqtJVMUiwo1R4hfJ5i9lmTox3joqIPjoYh8voWnngbD1mBrJ2JCjrwMLhkiM2AhFOImACM8GrwK+hiOcsECRIrvdAQ935u7vthaP6CDkloKHIPF992tczjE/gAUq3hs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QORsOZMJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: "O'Neal,
 Terry" <terry.oneal@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,24 @@
> +#####################################################################
> +###########
> +#
> +# versal-firmware
> +#
> +#####################################################################
> +###########
> +
> +VERSAL_FIRMWARE_VERSION = $(call 
> +qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(call 
> +github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VE
> +RSION)) VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only 
> +VERSAL_FIRMWARE_LICENSE_FILES = LICENSE

> The LICENSE file appears like a "Xilinx-Binary-Only or
> GPL-2.0-or-later": https://github.com/nealfrager/buildroot-firmware/blob/main/LICENSE

Yes, you are right.  I will change it to the following:

VERSAL_FIRMWARE_LICENSE = "Xilinx-Binary-Only or GPL-2.0-or-later"

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
