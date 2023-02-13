Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB4CC636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D24CA81469;
	Mon, 13 Feb 2023 12:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24CA81469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWVJ6taIqZy2; Mon, 13 Feb 2023 12:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE1E81497;
	Mon, 13 Feb 2023 12:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE1E81497
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB861BF387
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4351B4027E
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 12:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4351B4027E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqENO_TvIcrK for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 12:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D2A40273
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::61b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24D2A40273
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 12:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSaFMyXGvJsiN3GnfyY0dDhYpH+ETnHZ+bpXTXMQcfbFh6Db2tW7hwF6/22ZMvsDPxk90V09qgAi8JcF09grINApMQvI/PD+X/1eM+hLL+GT1cyFOjkYUXLyNx8FqovIPHTID9wa3BWzuEGDsA4g9MT825BqzA3U3ODyarXSFXrFX1KZaQbA2ycHk5dHE7x5GrQeF//GqsOKMvFlAKoRG/mqIewBHz7jibGiDa54vtroIts1IdZZ+NQAzgigux9X39FuIFSWFC5r4+IhGfxcLC6FPX27/kHjLigb2O85xCjfCmb0lgwfUTYyVJf5IlPMF0QBsouJZl39i2XVKF//gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf14tbsrVkCZnnCJk9K1IQ/IVaMiUxHECldM7tq4kV0=;
 b=cRJNJHqD1jRAvp5dRccZcdf4yjen/+8dk8Zobzzbz85eEIHoIudVzUM+lrZL/+GGY2ANJtqzYXOtVfKFbXego9QjJw2lwmtVGQ4RJ9uia47uJIvQkud9uzBWUdAQA5g+RqaMMiPTEAcmHdFCzsU6Dj3fsEoSVkvlxir3CE+N2rzINjZMxPYzQrgsR//TVjhCR4C20Sav7ypDROzI7iCw30ahuqHBVG8cMXpOP+oRxyzUxMKnAK1xQeSFW0GtTjumGS8tO7ZbbCTaynIunqaS/vuGvzSgrK+T4s/JEZAenEW8vkyrFipSMpZgShcgR7FXJUHpm6wdvXQ86Ux5x3olGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0841.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:8f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 12:24:18 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6086.017; Mon, 13 Feb 2023
 12:24:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/libbpf: Don't remove bpf.h on host
Thread-Index: AQHZAzqHULagjxVHLU2Gb9vmtMeK/q7EWeQAgAFJFQCAAG4rAIAHMxCm
Date: Mon, 13 Feb 2023 12:24:18 +0000
Message-ID: <VI1P190MB0493D7E80E03DC76691F434A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB04936E3BDB708B8974C8287B9F139@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <12146851.O9o76ZdvQC@pwmachine>
 <17501a13-8018-656f-5f4d-b1cf6c1ecd5c@mind.be> <2667723.mvXUDI8C0e@pwmachine>
In-Reply-To: <2667723.mvXUDI8C0e@pwmachine>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0841:EE_
x-ms-office365-filtering-correlation-id: 9c6ac1b7-9824-4ef7-e1b9-08db0dbd3a6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W+AwSXOuGOB2mSfZwRdDuusT+82SEwzCv700/N7ZWeGhsVPBDsODtLl1kF1S2gWlpbSZuDXsl8bG5jqFk7hSCORVsexVJ1ZOYyf0owduKsUxclD0+Qvj6bDqpKZP5CxsC4tNe22gvFr5uDeE3Mrb56Pd83acPp22ucDthvFLGTsdTevChWoG5Y3Zq2+Tky2bl+mv0rnxrDQJuWgDlxEZ0xwU9f15GnMXl4+MfyR2d/kmjZudRXwswHX4jPi4fJ+DrHsHp6k8+TTWsSFQNdH1bzoT16r65fe3Llpv6oIh2ZDCQafWxTIl/fEfJrk4boNd1ULbUMggas+DmO5K5SrHZeRq0AYVrT86TiCxo9LVOLhYYFr629MkOKu9i1K4Ez2WDHqV8/qZHRd3L4BMGHqgBVVHrg6ACMEtM4MK9PFzTHsE5JW22hLQ+uJEAFn2u/PL0o1g68j4Vm+ACRhsksZLrvPemPX5Hrjwi7QdsFKslUG4e2vAvQ7xw0UMqMz8SkcJufmD69P7twHCIrQizJSkNoueVjGeTA9zU3Phmu++rAEVMTSpmwKqbBZmXymt35BDoycYVAwCRmpbX6IhDt2ooPdxoMCzvFm0SdIddmBWuRYx9X29cmJw4Yl8VtxlStsbexN3GyRhTRO2sIBlrFf0JL65RUgTMg6W98pNNblE/zupgl06DY7/26Z8n6bppNkXhwenG1Fd025fJDYn/tEJlNyP6HbOGwFUmkj/v2hcA04=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(39840400004)(376002)(396003)(136003)(451199018)(8936002)(52536014)(66946007)(64756008)(66446008)(4326008)(66476007)(6916009)(66556008)(54906003)(316002)(41300700001)(8676002)(76116006)(71200400001)(7696005)(2906002)(9686003)(966005)(186003)(26005)(53546011)(478600001)(6506007)(83380400001)(66574015)(122000001)(5660300002)(38100700002)(33656002)(86362001)(55016003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JVYI+5KVneW5lyWRhoongoxTFTnTLQuVW4TkblCW309yMr0c35k9yjTFDl?=
 =?iso-8859-1?Q?Z9C4rfG2ZmGdHCZtWstlkx9fK0toyfROYv+xJ51hktoeYUHw1Ziw2L5Mqo?=
 =?iso-8859-1?Q?0Fh4p4TRkRSmcI4Gj5Lej2+2P5qqHIKyKvayT7iFgajQMVTxHZnE6ovBo7?=
 =?iso-8859-1?Q?R4G98jWMr0r3IdMPDU53KKAs5LqWRT/n1gEjGBjaLlvzxiaCTnIslyLk45?=
 =?iso-8859-1?Q?yuISuku7SjV3w/m0v2Kxq5qNsrMuZ1p7PRk4nLBnqkymRp8v1C+4KTmCFk?=
 =?iso-8859-1?Q?s7n+DCj0EnJ5PG0KE4df1vYWPl32VKfVTsqnpDw3+frV8UlW3baCOIyCpz?=
 =?iso-8859-1?Q?wHxVp5lbxAWUbFBzWaaztAT7ns1J5KdmjN6RwzM34jHirkCK1gEOeXh9eP?=
 =?iso-8859-1?Q?+zEKzMK6DHyEvEoHCAmqwWHuMO3NzeDSlKTszSbzDyNWpN5sPKpowiev3X?=
 =?iso-8859-1?Q?uEf3B7ALUNq+VTtvV069Fzq2Hce7kTjtJ/z788/qlb/Gb7qr5IVoNFKZ98?=
 =?iso-8859-1?Q?xpISMIZU8ZyLgVZ3VKS0zeEok2sAU56d9d22RTeOrjVRjyB4YQXXMgyP5T?=
 =?iso-8859-1?Q?YfgRWXWwpFFL9adTSMTbkAXgBOJ0hS4fVtJO1a1pZFHr4twa+EyksbRizU?=
 =?iso-8859-1?Q?aJIRs7gnN3sb/m8JadZnYKKcFO4Kkcbq5sWBtnK3PnbAYiA2d1Zchp/hw/?=
 =?iso-8859-1?Q?dqFWmmT/nkxS8/u0DXT2buMkzgmIvVt/C8UH5xyMLDe62VIfRuNJButEBd?=
 =?iso-8859-1?Q?xlXlqQDF7fgNIielry5C7lUhWhviGmX/MOkezSzdg/balXhEy4UewuzEL9?=
 =?iso-8859-1?Q?oJOQ8qnoAv2Ez2Z22KYZEj5A4XvRDevguIfKxlXSXJ+5Vsumz0jx2kkYWS?=
 =?iso-8859-1?Q?yQz/ulucY7HjG33s1hOkhb1gP67p4IXx36eIkfAsTtkK1L1YMDIj2WO6dC?=
 =?iso-8859-1?Q?KPUynvbFjb7dKwOk4lpkv9biLmg1Ke3MOBxU2bfAAjrGTtW8G/tGORp2Do?=
 =?iso-8859-1?Q?Ae4rAphmou/T7OuLPK+v4/47txzBQb8mNfOCEl2Z2DIqyjk12tRjMFs8tc?=
 =?iso-8859-1?Q?zeIc6ctQgOEFevJdQ5nAzMz2lf1bPVTr9rupbpKx+5BZ1q6gJ8ZEsTawbv?=
 =?iso-8859-1?Q?sMy5fmN9v/Shkv+P+Nu/Lt5cciY/8Wiay9ILSL7Z8xxfk+yB/jMBWgiZW9?=
 =?iso-8859-1?Q?gzu5SVPBwIwcJwpDV+B+l1pguXjE0n4KBRqX6uVSaao+15NgQWR17NnAhb?=
 =?iso-8859-1?Q?2D7dJAP3rY5SRqAyfWi/C29rT8NTemW1bO2z3TNo6nlqWvVffkuV5y6t7W?=
 =?iso-8859-1?Q?eUctjlRoCsWWwZo/fFHWZSuR4j1lLA7TECNCvWgfCmYbwee8+l75XSOP8z?=
 =?iso-8859-1?Q?vjlokOk8+AArDvAdthad/Q+LmhgYeXXSD1XS5MOI3bR9U4YXoAgbalLTFW?=
 =?iso-8859-1?Q?MD+rt8aeQl38ZKoQtnmsqzqtCoI3Xzmsn4KaLZW3ZTAkGN+tQ9P33DLwDA?=
 =?iso-8859-1?Q?InX+20KFnEDcg5/q2/hXAaNKv0ZxGTsNoz6KxOo82ZSAy8EXLURWueIxo6?=
 =?iso-8859-1?Q?45f1n+ekw08O+0Gg0GNQd5NfL8mFFx0Sl0rBt1i3SqnDnfyGIi73jcMTWV?=
 =?iso-8859-1?Q?ZFs7LvmY4wmjg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6ac1b7-9824-4ef7-e1b9-08db0dbd3a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 12:24:18.2717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8oEcC/Jbqwd4JGsS0+PUE+HE7rs1DiTt4AHdWed460q5OL6VfuuZRDw3C5eL2sJzS8alc1gSv9xx1MeY2seytg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0841
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf14tbsrVkCZnnCJk9K1IQ/IVaMiUxHECldM7tq4kV0=;
 b=WTBXHFisehxxH/u8BYNAy33RG47bTFHm2h75lWSe8dyHqpWKuLGBq1chJHigudcKDzfvDIB5NzWW7ByByEKgNiXJkVstu9OUrOYuhwx+0PkbB2+zVcZhz6h+epFwqfnY5b/tUKrIqncu3NV458I7H/iRhJzcoGC3Y29xLUGS9ZU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=WTBXHFis
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH] package/libbpf: Don't remove bpf.h on host
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Francis,

> Hi Daniel, Francis,
> =

> On 07/02/2023 21:10, Francis Laniel wrote:
>> Hi.
>> =

>> Le lundi 28 novembre 2022, 16:06:20 CET Lang Daniel a =E9crit :
>>> libbpf >1.0.0 defines libbpf_bpf_link_type_str(enum bpf_link_type) in
>>> src/libbpf.h, which is included by host-pahole.
>>> bpf_link_type is defined in linux/bpf.h, therefore the comment stating
>>> that pahole doesn't need bpf.h is no longer valid.
>>>
>>> Fixes:
>>> -
>>> http://autobuild.buildroot.net/results/d126a4b6eca786402dc362c86f8df3ad=
dec3
>>> d217/
>>>
>>> Signed-off-by: Daniel Lang <d.lang@abatec.at>
>>> ---
>>> I wasn't able to reproduce the mentioned compile error in the kernel.
>>> The mentioned file (tools/lib/bpf/strset.c) shouldn't be compiled when
>>> compiling the kernel as it would recompile libbpf.
>>> ---
>>>   package/libbpf/libbpf.mk | 17 +----------------
>>>   1 file changed, 1 insertion(+), 16 deletions(-)
>>>
>>> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
>>> index 820f1dc4bf..0381fd833a 100644
>>> --- a/package/libbpf/libbpf.mk
>>> +++ b/package/libbpf/libbpf.mk
>>> @@ -39,26 +39,11 @@ define LIBBPF_INSTALL_TARGET_CMDS
>>>   		-C $(@D)/src install DESTDIR=3D$(TARGET_DIR)
>>>   endef
>>>
>>> -# We need to install_uapi_headers so we have btf.h to compile
>>> -# host-pahole.
>>> -# Nonetheless, this target adds bpf.h which generates a conflict when
>>> -# building the kernel:
>>> -# In file included from libbpf_internal.h:17:0, from strset.c:9:
>>> -# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_=
kind'
>>> -# enum bpf_core_relo_kind {
>>> -# ^~~~~~~~~~~~~~~~~~
>>> -# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
>>> -# In file included from libbpf_legacy.h:13:0,
>>> -# 		from libbpf_internal.h:16,
>>> -# 		from strset.c:9:
>>> -# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note:
>>> originally defined here -# enum bpf_core_relo_kind {
>>> -# So, better to remove remove it now since we do not need it to build
>>> +# We need to install_uapi_headers so we have bpf.h and btf.h to compile
>>>   # host-pahole, the only user of host-libbpf.
>>>   define HOST_LIBBPF_INSTALL_CMDS
>>>   	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
>>>   		-C $(@D)/src install install_uapi_headers DESTDIR=3D$(HOST_DIR)
>>> -	rm $(HOST_DIR)/include/linux/bpf.h
>>>   endef
>>>
>>>   $(eval $(generic-package))
>> =

>> Thank you for this patch and sorry for my very late reply.
>> Sadly, I do not think the patch addresses the underlying issue.
>> Indeed, this is not pahole which does not need this file, as pahole reli=
es on
>> <linux/bpf.h> to be built.
>> So, the whole point of this comment and the rm is to avoid a problem when
>> building the kernel when pahole was built before.
> =

>   The current solution, however, also doesn't work, which is why Franci's=
 patch =

> [1] is needed to fix it again.
> =

>   However, we believe this is not the proper fix. The real issue is the f=
ollowing:
> =

> - libbpf installs headers which are possibly incompatible with the kernel=
's =

> headers. Normally this is not a problem, because you have either the kern=
el's or =

> libbpf's headers installed, not both.
> =

> - However, when we install libbpf headers in $(HOST_DIR)/include, the ker=
nel =

> build itself picks up those headers instead of its own internal headers. =
That is =

> why bpf.h is removed here to begin with. If bpf.h is not removed (and the=
 kernel =

> headers are indeed incompatible with the libbpf ones), then the kernel bu=
ild =

> will fail.
> =

> - There is however no reason why the kernel should pick up $(HOST_DIR)/in=
clude =

> instead of its own internal headers. Normally it doesn't do that, because=
 it =

> supplies -I options to its own headers, and these have precedence over th=
e =

> system included /usr/include etc. However, we force HOSTCC=3D"$(HOSTCC) =

> $(HOST_CFLAGS)" and HOST_CFLAGS has -I$(HOST_DIR)/include. This one will =
come =

> before all of the ones that the kernel adds and will have precedence.
> =

> Therefore, we believe that the solution is to use -isystem instead of -I =
in the =

> HOSTCC setting of the kernel. This is indeed what is already done for ubo=
ot:
> =

> 	HOSTCC=3D"$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem =

> /,$(HOST_CFLAGS)))" \
> =

> Note that there is a risk that this by itself goes wrong as well. We trie=
d at =

> some point to use -isystem instead of -I in HOST_CFLAGS:
> =

> commit 6f8162cf8c1abef7e0a4771fe0d6b26a28f5c2b6
> Author: David Raeman <draeman@bbn.com>
> Date:   Mon Jul 25 21:52:26 2016
> =

>      package/Makefile.in should grab HOST_DIR headers using -isystem inst=
ead of -I.
> =

> =

> but this was reverted a copule of days later:
> =

> commit 255b6f80d395ef048f46cfcf75dba690c56af657
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Sat Jul 30 18:10:18 2016
> =

>      Revert "package/Makefile.in should grab HOST_DIR headers using -isys=
tem =

> instead of -I."
> =

> (Unfortunately, the commit has no further explanation of what went wrong).
> =

>   So, could you (Daniel and Francis) try to apply this patch and replace =
-I with =

> -isystem like is done for U-Boot, and do a bunch of kernel builds to see =
if it =

> breaks anything?

I didn't apply the patch for package/Makefile.in as that would change the b=
ehavour
for all packages. I did however copy the logic used in the U-Boot.

-HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+HOSTCC=3D"$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_=
CFLAGS))) $(HOST_LDFLAGS)" \

And applied this patch to keep bpf.h

I tested the following config:

BR2_aarch64=3Dy
BR2_TOOLCHAIN_EXTERNAL=3Dy
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=3Dy
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=3Dy
BR2_LINUX_KERNEL=3Dy
BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"{VERSION}"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"pahole-kernel.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE=3Dy

and with a fragment for linux:

CONFIG_BPF_SYSCALL=3Dy
CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
CONFIG_DEBUG_INFO_REDUCED=3Dn
CONFIG_DEBUG_INFO_COMPRESSED=3Dn
CONFIG_DEBUG_INFO_BTF=3Dy
CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy

where VERSION is one of:
5.2.21 5.3.18 5.4.231 5.5.19 5.6.19 5.7.19 5.8.18 5.9.16 5.10.167 5.11.22
5.12.19 5.13.19 5.14.21 5.15.93 5.16.20 5.17.15 5.18.19 5.19.17 6.0.19 6.1.=
11

Version 5.2, as far as I could work it out, is the version that introduced
the pahole dependency when CONFIG_DEBUG_INFO_BTF is set.

None-LTS versions after 5.10 and before 6.0 fail with:

  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.btf
  BTF     .btf.vmlinux.bin.o
  LD      .tmp_vmlinux.kallsyms1
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux
  BTFIDS  vmlinux
FAILED: load BTF from vmlinux: Invalid argument
make[2]: *** [Makefile:1177: vmlinux] Error 255
make[1]: *** [package/pkg-generic.mk:293: /home/d.lang/ws/other/buildroot/o=
utput/build/linux-5.11.22/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

But that should be unrelated to the change in package/libbpf and HOSTCC.
I will try to work out the reason behind that error.

Should I create a patch to change HOSTCC or is additional testing required?

> =

>   For now, I've marked this patch as Changes Requested (it can only be ap=
plied =

> if the bpf.h problem is solved in some other way), and marked Francis's p=
atch =

> [1] as Superseded.
> =

>   Regards,
>   Arnout
> =

> =

> [1] =

> https://patchwork.ozlabs.org/project/buildroot/patch/20220610165441.84812=
-2-flaniel@linux.microsoft.com/
> =

> =

>> =

>> Sadly, I tested your patch and I hit the problem described in the comment
>> regarding redefinition of bpf_core_relo_kind.
>> =

>> Did you also hit it or you were able to build the kernel with
>> BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE?

It seems like I was tested with a too recent kernel and originally preparing
this patch and therefore didn't hit this error.

>> =

>> =

>> Best regards and thank you in advance.
>> =

>> =

>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
