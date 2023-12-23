Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC8BC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 16:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B81E340111;
	Sat, 23 Dec 2023 16:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B81E340111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAjNhUcX0OJy; Sat, 23 Dec 2023 16:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB72E4018F;
	Sat, 23 Dec 2023 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB72E4018F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E72B01BF354
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 16:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B760360E65
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 16:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B760360E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqVK32cjFcmz for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 16:12:16 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::712])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B342D60D5F
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 16:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B342D60D5F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WArkHmZDrBGhuzmOUhLMSJF6pu/k2XOG0BIdowli9F5y0oej0wkMFFmKNqyNuC+aajxfHidiZ/CAnxbYazqjhSwshapS6jiL2rQWNjOj60qtu+74o+R1infoiHaGI4CnvGUmbO/a5/NPVLSIP3B3Q9g7WdDlJdduV+5y2jUIWjogdCi8Dv7bafrrbchzxAfSUZEqaFVB05YsXbl6k1hLLuM3ogls08u57FZZXr1g8NO5I3GOMAKgIbquv6tNIesaYNa5PEi+q8at0/U4Rktxm8BtX9OHq+Xt1nhdWOywaEesIfOSS46OY37g3qrZR5v0pK61RMmQPKyJnPungoLNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayJ+T+JBlULGn8pZxfgRZdMIs6tfidKfAYTCB+YwuK8=;
 b=myG72cfQUrAv6L8YRZtby/fL6Y9d33edc6HZ7TsLrEMEFyv9YNpNI/Kr7+bapliJjGTv2dcqTx7GJJPNBOcpX3tiWCp3+z8iYcJAMav+6Je9RM+zAP964Bkla0IVsJcFrquDEecamcYmYihC+ocWHYF7Wru890gj3kRHCVBuPyRwr3R2qmp79/v4moWyScBjKiwSUhzB5uVQsumSvUxkSSvON5OfBaL2I4a1+vhZbE26LvXNogrSMnfNOrk60jTcOvSisFTBJI5wgtPwKQA51jQ98aCNAsYDUp1ygKR9GVaMlRM4b2pHNFmywytT8ghu90POIcygBtzXs2bJNqRzxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from SA3PR10MB6970.namprd10.prod.outlook.com (2603:10b6:806:315::17)
 by DS7PR10MB5264.namprd10.prod.outlook.com (2603:10b6:5:3a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.24; Sat, 23 Dec
 2023 16:12:12 +0000
Received: from SA3PR10MB6970.namprd10.prod.outlook.com
 ([fe80::d77f:7dda:3293:e778]) by SA3PR10MB6970.namprd10.prod.outlook.com
 ([fe80::d77f:7dda:3293:e778%4]) with mapi id 15.20.7113.023; Sat, 23 Dec 2023
 16:12:11 +0000
Date: Sat, 23 Dec 2023 10:12:08 -0600
From: Colin Foster <colin.foster@in-advantage.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYcG2CzLes4sE8os@colin-ia-desktop>
References: <20231222232251.12786-1-colin.foster@in-advantage.com>
 <20231222232251.12786-2-colin.foster@in-advantage.com>
 <20231223144018.5dff2c0c@windsurf>
Content-Disposition: inline
In-Reply-To: <20231223144018.5dff2c0c@windsurf>
X-ClientProxiedBy: CH0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:610:b1::17) To SA3PR10MB6970.namprd10.prod.outlook.com
 (2603:10b6:806:315::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR10MB6970:EE_|DS7PR10MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: b8628c08-62ac-4e6a-2445-08dc03d1eb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wviGgzoK12sHybV5RTQWblMkt92suJ0yMlmbvZHSccwiPujBxhfYZdOz/PTedn5RLJxvjwlrWZJvSj8Ft/BLRng4qwRf/hVkFLq6zZuCv6xuZEluiFg3BN3kNkYFy/FLFMzIO8hvyIL0jxsb/8PXbGWr7FAWPz7h27lPBYWRHq/zW+A0+Jyk3C9OTRlKBhM4RCqv+9OvQs7BHbRhhBMTEPJk2d5yERhvyUk0GXgp0FEheoHHhEW/BDA+v6KDfhu3yAXsvJ0BYW75jWAr/BiH7ICUi4+KhYbBkQU8oZ64Ernf/I/XEShzZX956XHubOsdoJakuMoEbpviRVvhVq3LA+mWpTlo5uNc+dGUernigrFOrr23xa1qFWw+7fsGXRhdVd72s+CQQHD4SSC3GsXyqrZS7qPExwaEiljXDasJGaT4lvqnwS0uPI967/a00Eeq7t1c8aH7Aw7wFKGE54G7Npqhx22EzjI8a+kv8Gc4yapack6F8WMeMdafUwIzK1I2E9Np+DgJUOkr904EM29fSgTZd/RJLf+LJJSdcKIsYSAcH16iAGrwVBqq5rpeRI/LyOmf4sZe1gNdaWMdSDZUljORO0SNhKIFkrdsXcDgboc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR10MB6970.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(39830400003)(366004)(376002)(136003)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(4326008)(41300700001)(86362001)(316002)(8936002)(8676002)(33716001)(5660300002)(2906002)(4744005)(26005)(44832011)(6506007)(966005)(478600001)(6486002)(6666004)(38100700002)(66476007)(66556008)(6512007)(9686003)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BjCrDr430TwRn0XvYXG6Sw4s9bolPYcgXwNRLh7E7+dkC3ify36/efjQa7kS?=
 =?us-ascii?Q?p8nc1xSbl916phCgmESWYyCiEaz8WndQHd0P25TcErZznR+I26tx5DSqM9WF?=
 =?us-ascii?Q?3rOcaAGIYAbcBPqQnGs4sn1+9N2c4bQyVLOsbT5mzAKEJJWc0B7qZQw5mkMR?=
 =?us-ascii?Q?Gqc+VArJilY5W5ZYcnLC40rkyr60c+CPWA4novL5Ix+ylUjOJlgrAAbpnW8f?=
 =?us-ascii?Q?vIaV2Wg+zUpd3mpBC8emz5A5YvghYB5ckFq0dkDbmbSpPL3rqlJ1nwJ44lRX?=
 =?us-ascii?Q?NBDlO5mxyeY7txuIU0xNCeYybE+MzX2aEZaJFR4ZTDJ9vJwRUSoqa32OmbkQ?=
 =?us-ascii?Q?Hi/tblSjDR/pu7wDaCBYQ2Fl6YHGyFLrdNFHWYocqSOY/7XEYb+BoyjMjpGl?=
 =?us-ascii?Q?67YrE2czeiTEk9E2gX52Udgzye5ZH3us2Iopb8s+r/nT8232wAIjLIIdtW4p?=
 =?us-ascii?Q?2M07lwTB4RkBMUQ3OWHIiVSWzzt/Rr2Z0Jl3exb0JhDSWMn9tLfC3/byLuBk?=
 =?us-ascii?Q?2+5fYIMM1zh9EMzbK3m3oJyHCRR7mDBZMHuhQ6I9MaddSZTQ1JWlWQl8de1i?=
 =?us-ascii?Q?PCv0BSRo9Vax38g9lx508/tEadvURaPRp8qbX7kx9MGmaSQU8Hecxbt7QjGG?=
 =?us-ascii?Q?In0VGlfyYzzvwwTsvN/Ifb48+1/n9n7DDdrGdL+faUgyE1zZN2oAGG7AQJMr?=
 =?us-ascii?Q?jd2zdMjG1KS5iMqemxIEpDo/g0O8tKqdSI/s+Exr1rbIqZAL9t+5QCxTmef3?=
 =?us-ascii?Q?g66fBlma9mOI1iqBEkNFHHfeu7cRQm8Tzl3LHF4AS9nCi1QZemM+ZubeB83l?=
 =?us-ascii?Q?VcTEl/i/Qft+eokITeR8d2dt7ujNXaJMNT75qzfDphOK0sfPD3QWqSWLJNWg?=
 =?us-ascii?Q?NkxZB9vE9KDBIL1j3YF+98MCnWwRADHJR72QRFHkQQ8gJ8TjDiJfYMC1CN3e?=
 =?us-ascii?Q?zA+iBoSdGFbCin0bJ6FPPM5YlKfMij7sC4CSuPrj9x680+dHd5uidbSAodRa?=
 =?us-ascii?Q?Hun9VENkBqHj3VoyfZqZ3f5/xHOKkHQKRzvbrP5ud15oSPbIC6qeHZUIfkki?=
 =?us-ascii?Q?AZkxHo0m3QaOn2Nsqnc5ZNzjJrDRNl3jTjNGaQ7DhU/V0c6ddswTeuZy++rB?=
 =?us-ascii?Q?PVi2Rv09COkZ623oiiLSL/ssv0VQLlVqR04tsbLuNf/hEgs4/6zOqRHOn6NA?=
 =?us-ascii?Q?U4tthFwSLzb4HLQX/6Ip57C2JnzpRXpNBuPNoMd9bvssmXUf7bRkvMnmmpS9?=
 =?us-ascii?Q?Dibotrwp5aogovvooamhe7QDgM6IBd3o/UPrWEfd7Nl9r9nImYkxYN8Va6az?=
 =?us-ascii?Q?t0P5ZU2YLoFhOzo9KnSYH21Z55kDCaAzCuEKLqMfOs0N9Ih1AL8Frw/JO7SE?=
 =?us-ascii?Q?RaI6VMKyWwOF6OEcn0l74WT9VoUjXRgR16EvwnQUCbfWsJ+/dsxDOHDDxlmU?=
 =?us-ascii?Q?JYPIB1i0igkbzi7F7zmo/9Zm35x0mBq7/o6my16MpwbVDtVeNmE60uMVlOc+?=
 =?us-ascii?Q?OnMSnTPobjvGPVnuGaJbdgcNJznQu5lhsVnpb5WO7DYU2UFAGfUouhr5YQRu?=
 =?us-ascii?Q?mlxcbp5jA/TFIk9geyn9A0gW+c7Amn42BO4LoMEHFQoUS9cDWr2kru8C5I2G?=
 =?us-ascii?Q?nhIZVIuazlHf+LX9nhYN+88=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8628c08-62ac-4e6a-2445-08dc03d1eb58
X-MS-Exchange-CrossTenant-AuthSource: SA3PR10MB6970.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2023 16:12:11.2641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xG99qgXEYwFJRiEZRlFYio6IIbheGQyn1BlwUmqgDQLXCskQmushtWTYv27Xp2iP9AA/6TpV7g7Fa2C3BJTPFE6plxF5+V9Gvhv7PRqnlwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayJ+T+JBlULGn8pZxfgRZdMIs6tfidKfAYTCB+YwuK8=;
 b=j1S7ITrApwO1LWrRaiH6VwmHWwAYDcIsdD+4ftrdg0qXynPVq6nFAt71uf5Zg0YQ4ySemde8XslMX0iE2jdZEDEup748u71W1KQ4h57X5XZw4+WcEqajdk4eTq/gX+snJJHRuCqslXpiLy5dy+t9x6+W/Pdzck+kJGcQu3zfKPY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=j1S7ITrA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [RFC v1 1/1] support/testing/run-tests: add ability
 to run tests from external
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat, Dec 23, 2023 at 02:40:18PM +0100, Thomas Petazzoni wrote:
> Hello Colin,
> 
> On Fri, 22 Dec 2023 17:22:51 -0600
> Colin Foster <colin.foster@in-advantage.com> wrote:
> 
> > +    overlay_path = os.getenv("BR2_EXTERNAL")
> > +    if overlay_path:
> > +        temp_dir = tempfile.TemporaryDirectory()
> > +        shutil.copytree(script_dir, temp_dir.name, dirs_exist_ok=True)
> > +        shutil.copytree(overlay_path + "/support/testing",
> > +                        temp_dir.name,
> > +                        dirs_exist_ok=True)
> 
> Is there a better solution than copying all tests into a temporary
> directory?

I hope so. Yann has suggestions for using symlinks that would probably
be better if it works.

> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
