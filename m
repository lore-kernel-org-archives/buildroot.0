Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFAC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25D741826;
	Tue,  7 Feb 2023 14:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B25D741826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ow-qbCaOPPJt; Tue,  7 Feb 2023 14:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822614181C;
	Tue,  7 Feb 2023 14:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822614181C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B53E1BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B38381E1E
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B38381E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qy-LyvhE0EUe for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:15:28 +0000 (UTC)
X-Greylist: delayed 23:05:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C843A81E1C
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0706.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::706])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C843A81E1C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=FV3iPiR39eSQEzPNL7hA4om7aCvd+WnRk7mMkiKSBO9MMZIe2WrLwdNH8x2I3qF1mpzfoAUI5VUqljw2eqEgd15ilzdxWf5e8LHUE2/2PUaaVZkHBvVHtKZfB08m46uFZumnQ7CouRRmw/HBQKPpvWKabU2uWCTUOvxXO+Ev+suxeiVIaP0SLD05Ozpn0lXBjnnkqVhZsR5saXFbNIXRLvSngNywEtXLGEnBzFwB3QJ3qGWpQ+z60TGG/EhpRJAdWRHyaqJXWGd6Ln8+PnqDqGJWPioNKCDF/pp4HDV+tLIb3g5gXEGadDcgk+3ZA/Pffr8dxZLdK80J+suyvYWd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr8GyJT0NbkW6zu+4xHlAia60eQ4WaAj9Ivdl6heWmc=;
 b=vhlj/hWzySYMwqifnKYJThdM2k1FEuRjz8mf5k5Z6tVftmuOIC/UT3FJdtBCJ2yi613xis5TydWD9Ocvdsh5vnWEBxwmRXHUSTKZLnCR88ddW/a2Svy1V4/0SDq3W8sDPKJCWwZKuH33Bn7Vt5DpzBuyuoBw2pih0tPNdObaMXifgsW8O9G3J1o59o+0HmLSlBn66gycxThzzpbxDzrw4zLY03OR95XXmOaFR0uSIP6VJs3r9N8vLMeRKEWOYTMsSvWD8NnkWlySb9LxvGXFYdvxbtkcjX5AhQEAKfMu1DPex3JoWjwnits2NsKtb3L4ORs1tufod1UVsTcc2HZV4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1146.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:176::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 14:01:12 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c536:901c:6fc3:b3f8]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c536:901c:6fc3:b3f8%6]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 14:01:12 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH 1/1] linux: fix
 LINUX_VERSION_PROBED content
Thread-Index: AQHZH+Ins3AIuKbl9USufGEMkvxWGa7DuVUQ
Date: Tue, 7 Feb 2023 14:01:12 +0000
Message-ID: <PH1P110MB16035647FA17F3AF6A03B57F9FDB9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230104020558.1436469-1-giulio.benetti@benettiengineering.com>
 <20230104020558.1436469-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230104020558.1436469-2-giulio.benetti@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1146:EE_
x-ms-office365-filtering-correlation-id: a6a7836a-ade6-4d4d-dc1c-08db0913c58c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ypQ9B+3t6GhA5LogmS+GZID3xVShwGrw27ZH9mJfVgtru0mqh7rIja5eoMVANU+kyWuBQMqNTh5QC8k1J6Ar+BjIzIM7S8EYRYwBKpnpEDzTgTAaej6DozZ9dVlDI1SdWzdRuDcshPO7YZiiYuDBsVHMF87MBvgj+dM4lRTbag/k4SS8mnpk3W5hS2nFVrXkCW6dX63uvtmRe/D/j66cP+qlsUm8uquKTdSyxjxMP5VyiUIoW+zsyW91s2fIpC0c5InFL1zm5MuylG36i3oPkJAXdVDfbhkRTn12OcxUJ1cvLGIoX5+4ZrTPROrZwZ4r9BOX2SCc9kP2OJ4W7w7vPTDVj6Vnvqo0QWQL3j7lbmJwS6aK0W7zwG+yrNKKs/quGSOql+DYUDJtARUAx98eIYXg8/VBR118abBWQPR9iLo3xmiXWm1IFD7+4O90BxvZs8+ntAM+WqgcVPCUR7uHLXfEcc52AE2lpauJJc1GUi6JzebFxGuandGVC5OOfyw1LR1IgcNU2RevjWuI4VWnx2EsQwcb8Ieeqn/RfTPvwmI7jTEaCJynTq6XptodxBnpxR3SVZv93gY0dqzbTY0gJ6+URtmwayLE/1C1kDkStpUcNO+uf2srszbbCIOLwm8vN3PxRlZwBQGXiRf+azwT/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(136003)(39830400003)(451199018)(2906002)(86362001)(38100700002)(122000001)(71200400001)(966005)(7696005)(186003)(26005)(6506007)(9686003)(53546011)(41320700001)(33656002)(55016003)(38070700005)(66476007)(66556008)(66946007)(76116006)(83380400001)(66446008)(8676002)(41300700001)(508600001)(52536014)(64756008)(110136005)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: OtVZ25Lq/rj7r3uG/4ymJD9L7t8l+bRJGYQvFhab4ek5Ct4SkR+x0U6SMwQ7clvkCg5nQ1MoCe7stoOo2x65/oHHCJ3cyRGM3duo4+PnBcRTLSye4ZfLfH5KqF8KtGvu1yLcjb6yHhUBcXl276bem+bTVNmaIFuBnuYWcf78yGIKAer481K9XswLykyqKdyv/rXs2Ge8Zeo52tf+QG6tuig2TvpRZO6trZzqKLyJ1WYq+5Zkt5Ui08hZu6TE+F2vdGKvUfDNx3FfZisQPW3OLWE2F70wBD9e0RL3cpVz0yIa6f4j6P76BUE6G6Zg7dbJ/pC3mvfhCY0kidAK5MdBodp64Bi0KOqdV51WbcMVXk1+Iq8EuX0HUzQDEMkT/NdvluPymLJccFbL4F4B5LZvyJOrumnFEIPLoBRc/BHNHhE=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a7836a-ade6-4d4d-dc1c-08db0913c58c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 14:01:12.5803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1146
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr8GyJT0NbkW6zu+4xHlAia60eQ4WaAj9Ivdl6heWmc=;
 b=RTaA78CObGIfWCzHklI04vbtuh25xI+DA1vOsQ5v61KplJaKffytF+YOkLbqk9GSBPsKxc4OQSjamarvd8N0NE+YjJYAL6Noz8aMPNEPWxBHRwyXe/BeJSs5rQD5VWyX35dK7JVrqR+yVqKNES34wywjSllnomNEHTmZfiEnHM72a+zDxc4c0dAZw+28cA0q5BedUPalJY/vVEVdyrDjYXGUVNrp3k236HpviCNx98IidlQqpo6LXWWe87rT8feaTEFma25vaghdnfqaxv6UHHaeqeqUn6vLZbS/qxDx7lvjsWrL+/uAuFNxAIkrwtkiT3iOS5ckuTdzQu0A/HL1WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=RTaA78CO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH 1/1] linux: fix
 LINUX_VERSION_PROBED content
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Giulio
> Benetti
> Sent: Tuesday, January 3, 2023 8:06 PM
> To: buildroot@buildroot.org
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Subject: [External] - [Buildroot] [PATCH 1/1] linux: fix
> LINUX_VERSION_PROBED content
> 
> Actually LINUX_VERSION_PROBED is set with the string sorrounded by the
> backquotes including them. So when we evaluate
> $(LINUX_VERSION_PROBED) we end up having the command itself and
> instead we only need the Linux version probed in the style x.y.z.
> 
> Verifying it turns out that:
> 1) --no-print-directory and -s make flags must be passed before -C flag, The
> error was not visible because errors were suppressed with '2>/dev/null'
> 2) backquotes don't evaluate the expression they sorround but become part
> of the string they sorround and get assigned to the variable
> 
> To fix this let's move --no-print-directory right after $(MAKE) and use $(shell )
> instead of backquotes.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk index 7645b5f507..23c169995a
> 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -183,7 +183,7 @@ endif
>  # Get the real Linux version, which tells us where kernel modules are  #
> going to be installed in the target filesystem.
>  # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
> -LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))'
> $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s
> kernelrelease 2>/dev/null`
> +LINUX_VERSION_PROBED = $(shell MAKEFLAGS='$(filter-out
> w,$(MAKEFLAGS))'
> +$(MAKE) --no-print-directory -s $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR)
> +kernelrelease 2>/dev/null)
> 
>  LINUX_DTS_NAME += $(call
> qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
> 
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
