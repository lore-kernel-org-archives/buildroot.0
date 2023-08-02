Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD4C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 04:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47EC181341;
	Wed,  2 Aug 2023 04:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47EC181341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8j0vbFB5QuS; Wed,  2 Aug 2023 04:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C17E80F24;
	Wed,  2 Aug 2023 04:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C17E80F24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37CF41BF98E
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 04:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 008EA80F24
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 04:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008EA80F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KF1ClXx7tHVn for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 04:04:07 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CA5080C1F
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 04:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA5080C1F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpBsvRo+X08YqWCmuDXcyX7m3dpoTGnQ38tt9g6dvpMiPWfxHHhBt/5ORF6DpVQJcLZv+LQ0JwescAIc//OsIkqAheqXv7JJ8ioLiGVE/DiseyGM/cplbbnUON1BC0rPOqZs1mUqmkMI7eHxdW9tKWTUh0ijH/n7IHTu2QCg8ovPr8CfMu/MBZdyHPjUX109ENPlX2IkbFtSzm/2ymODdNkH6h2P4ZzBApmK/Q0IhVaz4Vgrinix5QQEFbkN+w4l9Ekoz89ofxH8dIYyHxZZof+UpnBOZjXVAAjF5gU7QpkW2XoxMR5IB71SLB5PkmyAJEwgB2AiWbeHrmYaxGZ4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEhFEm5VhG6nd06zrfSJRq8eLS9ZK1HgXY+J7ozEuIU=;
 b=feO9rsgptFk5t9UsbXfAHd9XtVuC7DF250hcS/IMf0XXFjIOJJw7Q3alR2DPvd+CDbPyFXBuubUboBE01IShsaCHAFLHFaqasniE1GBYXfX+oqZNd13Ta2g1U2OcSqBJmWgRfro3A1WmBD31x33shMS8RB9K5gkwVBmZZhlUo5gPy6/iXhcSBXYe4akka+YEET+JF8RfQUk/guEe6J1x/CxhI6knAVwDUDFD+ODoRZM68tO+AlXn8kFDIrMn51knLriW3huN87kb581yrMkYc9wc3LsrDVmBZU+q/cdpmgE7/17w9NMZd35UWGSTkQ6ud3CvQQcbXZgYNUi5pYsrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 2 Aug
 2023 04:04:00 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 04:04:00 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] board/versal: clean shellcheck issues
Thread-Index: AQHZxF89wfi0VsUh8k6CyiaQTnSmgK/V8ziAgABwJYA=
Date: Wed, 2 Aug 2023 04:04:00 +0000
Message-ID: <CH2PR12MB5004AC021488E07F9CDEE860F00BA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230801100204.3111852-1-neal.frager@amd.com>
 <20230801232023.50086a5f@windsurf>
In-Reply-To: <20230801232023.50086a5f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB8800:EE_
x-ms-office365-filtering-correlation-id: 3a5468a1-d4c5-45fe-5a50-08db930d80c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jqBlf43LczKKnsSQ7TUBNyAAWCqSGCbX8adyiRz6e0pYmK9r5lrvBIfzfKLQr9YEjlwXYQFo/W5z9izfwZGBfsuEj+RmoBUiZ4dZIACH9xdFR1FdqkBwT4zjdEQr0+m3RH/GhtweJ1rOlEUGZe4Qt5Z27pU5HTCDaaDHVS5yk3P0cozASJYGmSNp7rtsrUIR0vlE9X/oANZQSXp+eyPklHpmCjivyfaUcQu07C66OauINjfvUA5fAYDZ4+7XTUqdPy2TmcTC2tfixa9VmRJhZ32nuZHr25Tgmmaq9Qpk9apKuD2AMKMnyjaOmtkt3FJvUMlAWq0elxinUQUGrF8hrza9rrmOWI1QAyRtpJpNDyeeFD1xhRD5CsU5XnNUVkoIT7KJrVJpm1t8TQhwlqH26H+w+v3Hxg+FIfbsFXdytYAzmIn/2GpQLqVPnAq/60FehZbyEDgrn5+9ojUImEQyk+FIZ8yrT1YCUDmWOcomRPjgjdnvRWZKIxO5N+O/EvM3mHQOc1bZAxDxFJyTN0sqD3Xai6SM15cimOEc91yYl5Pc0Y2JIdbo7mCd73dS2RTOgEp1fX8daq4chdVpVqKx6xO+iVTH8pXwwESTB5OWqqs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(2906002)(6506007)(71200400001)(4744005)(186003)(38100700002)(316002)(122000001)(55016003)(64756008)(66446008)(5660300002)(66946007)(33656002)(76116006)(8676002)(110136005)(478600001)(8936002)(54906003)(41300700001)(9686003)(4326008)(52536014)(66556008)(66476007)(86362001)(7696005)(966005)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xdrvKAraPRwO67DTLJG1uSJonIALkZCldpekscyadvEtCw/F27+1LqK92sla?=
 =?us-ascii?Q?zLbRI6NqOCUnI7bsus2bu/PQ3GdCekHqWk/2HYxT+Yh3fUk8yt+fO3j/ohUS?=
 =?us-ascii?Q?kziJwkBUql9qUndyrMHDVPJLOfGNuUmlLMG44xKTvliEUPOLGEEn8wB2RuaX?=
 =?us-ascii?Q?qnhYA23dFOL7XybDpX23CsC3i1LpqVdbAXwyLx5YAngR/7PwXdML2EMsYxQf?=
 =?us-ascii?Q?wdn7HppoFxedPktlZsxl5+q5E+8lRvKjtRHFonk5tEFzJwBgkvL0KdeaW4Vz?=
 =?us-ascii?Q?i+feF0/rB9wRodiu/B3QUhk09LPd0e/wxCARIvBkj9ZgITLr0n5NELpwkh+H?=
 =?us-ascii?Q?8zlkD9oEvEv3LSXkdsMHuwj0PYpFAZtga2pXQEdktgQc8oFR+uVX6koxgOZT?=
 =?us-ascii?Q?D6cxQJTFpbpUZDsG3M0jy+b6dXGWOUcs2BzjPjMewN091HnWetX1NjPA0qsZ?=
 =?us-ascii?Q?2ic2LRDM+sdegvIb4DOL6B7fgsa7hev9atzXVLo0p6D0htrdik9RD3ikrY4H?=
 =?us-ascii?Q?a01OMvOvlDLZROMIpnwM7x4sjT+LiatEY7RS+g9pB6Hile5gL75BuH1cfpF6?=
 =?us-ascii?Q?GEvNwDTppSXFiWkEBfPzohgfkSrItF24lIruFnSnxQHgeeLbwvZF4Xpxv5zr?=
 =?us-ascii?Q?5zV4AxXLL4WZbbin1ZJunDyCfxnOsS1K1qVl77oSLkFy9zb8I2e5AVmS6h2a?=
 =?us-ascii?Q?LCnpy7B440UiNb/Z/RYEs7rprNg7escyeNhn4YSJLdWhott+y3mSaZotDWEk?=
 =?us-ascii?Q?B0q7qaN2283M9jSPTnOZA/u4dEJOza+Up+E4XRy4vNlr/DU5vls9eQPawfoW?=
 =?us-ascii?Q?GjHuridga9v5EPs4mAIT35fwY2KD7Y/2OQWR3nwielDWQAWz+Zz5JKiOD+qv?=
 =?us-ascii?Q?JBSFSudCw4Xlq5pCwV76DdQaKYk+KTC8VlQkTp58a7k65JwygzMu9yS3KbCZ?=
 =?us-ascii?Q?dyR7lAYswDT1A5h+MCMOzwywde8xjYf9f+3u3fD9vahyYd1uZI5JZ8b9uHxi?=
 =?us-ascii?Q?EJ20Ca9xiaDmnFiYUpU2SzBqhuE8K6c5dRFBlNKhoE1sTphBV41fhA1VeYxi?=
 =?us-ascii?Q?U/6OPLEMJzWZlMRDan4s87volHARPvD36aL20XDccUZXlLg/RaiIVY3oz7Fe?=
 =?us-ascii?Q?PFMjKDHaQh5Kk1DRyUKoT2GxLx1PFGbvZjyGg9kmtrwqBWXxzL3M2DZfJi7z?=
 =?us-ascii?Q?RSVonvCbeO/8Tah8KaB12iouC0ZTcFr8XMJIza8WTxiOC15hW06YreXasVcY?=
 =?us-ascii?Q?X9p5jxPE+Iq6p1x+lrNQ/Q4VL1gO+oPrzlYSES9kPSLdZTllgcCYKB21CtTw?=
 =?us-ascii?Q?MowsVY/F1qpoVAMJ8YNfQ0cwEQkDyyrU0X+0EpvQE0hH9/1vFlyPf4dverGw?=
 =?us-ascii?Q?W35DitZqxZ1YHZoZ/eEIYRDa7Vuhq4udrglR2CXHnwvQZRB3jwa0vXWxWBQZ?=
 =?us-ascii?Q?C5N/el5E8ccM189BOufBbPi7JZPY+ES0KYI+aT+ESSITrletSQfDBC3Ix3rD?=
 =?us-ascii?Q?90BlcYzf+T2w2/f0SDYHQ2hPaij+8ZjCsb2pOZs5/IthEfJXuZdUUDW3AvfU?=
 =?us-ascii?Q?O+tggAy59l2ZnGZvxgnLAGO8R77bmAKz5oEzWHOkFPFRUI+0TkvARiYPm2EG?=
 =?us-ascii?Q?CLUFnWJbs4/m5lYmCrb7esA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5468a1-d4c5-45fe-5a50-08db930d80c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 04:04:00.6835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIkRra+2XZFNp+Etzhm3rFMMcg5RjWSVNUhhfjeEkxWkdPLl4lB35UHTqTsVX+/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEhFEm5VhG6nd06zrfSJRq8eLS9ZK1HgXY+J7ozEuIU=;
 b=XpsxvsJ+Cx9qjdQ7ZNp6VxHGnjuaGtdvRiPhX1jrQ2eyRK0Ajr6b4LhfC7JmQs799MgN3nRVYVs5vXGT2KMA/zOq+XNZ+/W1Q+poBMJVLk2v9uEOcVoqbZQXAa+CEYf4DtwWOJBF1AiV5Vr+noZHvAPEw9oIo1INGrXFUVPoFvI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XpsxvsJ+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal: clean shellcheck issues
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

>  mkdir -p "${BINARIES_DIR}"
>  cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
>  	the_ROM_image:
>  	{
>  	  image {
> -	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
> -	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
> -	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
> +	    { type=bootimage, file="${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi" }
> +	    { type=bootloader, file="${BINARIES_DIR}/${BOARD_NAME}_plm.elf" }
> +	    { core=psm, file="${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf" }

> Is it OK for bootgen.bif to contain double quotes around the file paths?

Yes, when you run make, bootgen processes the files just fine, and the resulting boot.bin boots on my vck190 board.

The double quotes do not change anything except clear the shellcheck complaints.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
