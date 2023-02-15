Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE76C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7EA81E00;
	Wed, 15 Feb 2023 09:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7EA81E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bd05pK6TBZki; Wed, 15 Feb 2023 09:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF21D81773;
	Wed, 15 Feb 2023 09:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF21D81773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 473E41BF255
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E12340119
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E12340119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lKoNQEk6vOP for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:58:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3AB6400B8
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3AB6400B8
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj9fe22xPSKGMx7enerUwb2DTDt9UdY3DNFRb+A1gPPJ5i9JJFBG14DlCnencSslr7LM1DjwzODAf89BWv2z4bukK+A+LreqTx+YT/k0N+774+O8fBMqEUXhMAsfKn4/czEC+3JUOc5FPk0mGIlDuZX+6JKtpsfNruj8Hx6n6d6yLtyNbbud0KLov2COpqS1xGrGPdXvDyVJemvMKnKYAShvMBKm3OnQCb0imnZjl6cvPaJ+/1JL64wT5fHhuSC/4nDFKbwlsVH8YX8I4LrEMlGCR39fNBHVLojCKyqDSyzIciZv613fOuAjTVaKJSAipgmoU44qf7JrfeycLwyVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ1WXTuy5B8ziSrIEgJGBHNgrpHCkxKe9ZnqhbQMm/Q=;
 b=HHRjCxMCyRaSKKCI0wgq21yFxeM90vkJ7prJZ7m72LhR9nW/Cp1/uRqnY6blYJDwfgI7VQB6zZ/cfJ2GLSXzblQcbfU9JL0cMhs+eQ8UkF4J2ThC69mEC0Xg6SYzK3WBnr2KLTNoSJIDwmBXhrIYRFh/4aQ3NYRRm3kqInw/6BoVKJTRiGf5H+H4WAp0qjLQTceiXtUUnVsvirn+6922xLGD1ZPTFemHkY9JZbqauRzJc/Kf3XGvBQzU8ZOEoV2043owjMilee6+iH2sUdM5tWa57Z7AkVtEY3BFrVKwqUxlL7oV9n71q0rJtmvqw6rev1/FwANgAwwrPvkziQKoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0702.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 09:58:51 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6086.017; Wed, 15 Feb 2023
 09:58:51 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 2/2] linux: use -isystem instead of -I in HOSTCC
Thread-Index: AQHZQSPiIuPbbZISck2dqsrhb2IlEQ==
Date: Wed, 15 Feb 2023 09:58:51 +0000
Message-ID: <VI1P190MB04930BE811E350544617950D9FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0702:EE_
x-ms-office365-filtering-correlation-id: 5ca2c319-9c90-4596-9bcf-08db0f3b3dc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fRxYbBk9OtEhbJIGT8rlluJV4PWy4KRNgVUBDzkXkPfH1/Z9p9pTpXFMErPvoDrepXis8X9VIZ0D8ndCN+6tdFoXNn8PjasGy5JYAyCqarLFpD0FY7pwF0LAoKqAxVVgFg5Xe5XRpQheJEFA09mVHzQp1R9GXYUCQDFQXPEixklJbaEw17nqV04xvw/ZdedXBRdiX0a8hCQo//vcl8VbKPIMzmkVfk61w4I/RGmiT1azj87DBwfM9PowA0JIYRHGoH9RvY9TLs1JUFMzVKxNe+yNuLww41D7TP0HJ8Nteub9LaQspoLYNCMe5kkXRU9f3NNn9SEnTFiMkGCjG3pjevcfY1sCWYh3mTUn+KfGILDix+DAQXvI2BymKuHm7wLPccPkVQTHfq01TSBdjCO+1xfCoTMUTeAZTwdEilMSGJp0XEbd8A3HxjfcB+O54Ej2FBAaU2vDucvgHAIFU8X54lFQC9DdTEdHfuookPB0Vpe4RWG+nbGh8oSpYz6GxjOrHND3gm4CfC+rx23OsgqBIFbMci43r289JPhYzcpzIZwRKF0Mwxs4v+QwpkgNywdsbOM9QbnRQNSBGyHTuzTMxKUMUoxH+S2KPGG17ZVXu/LiVINhyS2zDg54cYDduyzobf/5auzeCs8oz04OL23M+FON495awPQMhd1mRZbBUqMZ66IN+F8LBP9KGCNwKNR4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(346002)(39840400004)(451199018)(2906002)(966005)(478600001)(6916009)(52536014)(26005)(9686003)(5660300002)(7696005)(186003)(33656002)(83380400001)(71200400001)(55016003)(6506007)(41300700001)(8936002)(86362001)(64756008)(66556008)(66446008)(8676002)(38100700002)(122000001)(76116006)(66476007)(66946007)(4326008)(38070700005)(316002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KH2HVMC0hVvvHhWHGQS/FJl68k7UZfN09wiugJf/uPWPzkvihbrWq4qLYm?=
 =?iso-8859-1?Q?/vggs0dbU/k5WthPY8DSDJMH6hK8UfH61uLNaqNgxJWnfqVyUO7rWb+r14?=
 =?iso-8859-1?Q?B5WzzCOX9+6m161DF+/IHiG5HvJ5qy2ZS1zCWd+UhMJKprH/MwunkFLj7E?=
 =?iso-8859-1?Q?vl8+qdEmfqMBB3P4qmPMONkACda4ql9VIQP0OWVv9vxZH8MZRJHbgnqIWx?=
 =?iso-8859-1?Q?cEEseayP9XfQAz7IrOlUzIcHpsNXpUz79qYkRE1jvyrdKNXgYqVxc/n0Vv?=
 =?iso-8859-1?Q?jAINcIxXwAAm4RRw8J0yTRixjVhlMkHoDxPmFKiP4QxWq3V6B1Tcl2iJGr?=
 =?iso-8859-1?Q?rv95EBm+733W3Wkmu7z+MEy1kN4XxaDQasikfpKKj8bXu35HWYoRWMZqhU?=
 =?iso-8859-1?Q?oX78swrxpTY03mU+zQT8tUfIzRZtFP0bvQpTaOXNevdloE5+UwGQmewpwV?=
 =?iso-8859-1?Q?QmL89uI1/0MoZ960gHGdkFsAR3yuvihAhUWYfPsLk0wOaut4KvaOD5iRZl?=
 =?iso-8859-1?Q?+fRUfgGp/Rh2o0dji2xjAUoUKfSTG+g01Eo5KQZTLf+rVcz6XdT4x760/M?=
 =?iso-8859-1?Q?Kco4A43VLYbi2KAqksD7ek15mhwwslIFqii4fNr7hbix4AuT5ayLYk0GDZ?=
 =?iso-8859-1?Q?MmLosHwTPu5uvTmAP2amwUFtG5uccSNR56rp/Q0un259jPgOwt/FFRCt8u?=
 =?iso-8859-1?Q?nO2GzpFcOoUOmYe3Xw1fKl9eTo3MRAwcu1Ji5rwM9uDYEyxPhQ2ZH9vsQG?=
 =?iso-8859-1?Q?vif6N/ojdjpCGskUgZJfKI5szQYIftS3VLCnYbhJ3rK20ab96pTaO6H93U?=
 =?iso-8859-1?Q?WQEtalpR5VM7rgAT9q5sJH1jFk4DjkuML9GFd3H+0IHRWl7a9HFUUj3r2b?=
 =?iso-8859-1?Q?8dNPt6s1fDz6Upm7VRdsZsesp4rnUdewR4EbZ8e+VZpnlIoK1/45JZ7Ola?=
 =?iso-8859-1?Q?ecoofrEa2qdswO6q7VRMUOSy9HepECPZ7InAkOlcBbtSJR6zGkcTFRrN+V?=
 =?iso-8859-1?Q?3CDuaPfs2eOLMvOjQ8vZkuweV7t37sqLNEK5A9dge8AeVbhAJ7zUM6+cOo?=
 =?iso-8859-1?Q?BEWDm0prRUmrCRjoR0v8z9X5mjDATWgUl6ojPXzXkRt+QM7ltNwG3FfIVM?=
 =?iso-8859-1?Q?92flKpTxZFRNQPXacJs7mD/hf9VV47gW/F4p/JqYzAxYVyxEZryId2570e?=
 =?iso-8859-1?Q?YHUkse2YKeQbBQvT39+NLECsQ2EdB9OVQJePs5F9phGTFStP7vg0FSRuLc?=
 =?iso-8859-1?Q?3O7QsHRYriiCpJYxs5PvxjjnXt32dSd635cPNHtMQHXYcZYMtb+y/Pc7uP?=
 =?iso-8859-1?Q?dGSEQucWFLESdtZfDJGE4YvUu7l3KjZYsCgLkJNsmX1EFocPiFGt9IrULs?=
 =?iso-8859-1?Q?LbBMvQ8YRHGAYhcxL7rO/Ufzsr80RwBKgocZec/WJUNCLIL+Mgs9VP5T8K?=
 =?iso-8859-1?Q?MFblFOp0xxUiqm1knwiEi2mTNOW3L9AcIA5/4ml6qJD791z8QOLPB4B0ae?=
 =?iso-8859-1?Q?NSOLESj+Q6lYgDw3SEUTtb5HIRpAxdBtFINcwSWLHvcoqsxi1VWGKG111X?=
 =?iso-8859-1?Q?GSgi03yh4CnH7KEB7w2fscKOqKc6Wtj3pAsAPs3PvFjOXV/iX3v0MSSH1S?=
 =?iso-8859-1?Q?swEjf5y2EzYAA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca2c319-9c90-4596-9bcf-08db0f3b3dc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 09:58:51.7010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmVpuH1ycmPnsYCqNsxfDmQ/Faq7Wy4JWBhUm7TePGkgMEEWAsyfZJjGCDsvezQLieZB0CBsU2E88Wa+uuWbhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0702
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ1WXTuy5B8ziSrIEgJGBHNgrpHCkxKe9ZnqhbQMm/Q=;
 b=G+pgUo70Der480BHDTCKi8euypRWLmnHgAePhxmFTQ5gXAG66IsDNBKEVCZPmP4f8+KnlBwyvGMeqCid+4Ks0DXF3+7FzfJBzI7JHKhxQpJ9fD37ljAxmlgcPFHzxRwpwilcKutzBe+EW4Z9t5ZM/WLjI/Vo11h3HcxkFphLtdM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=G+pgUo70
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 2/2] linux: use -isystem instead of -I in
 HOSTCC
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A package might install headers that are incompatible with the kernel's
header. One example is the most recent version of pahole (1.24).
HOST_CC includes -I$(HOST_DIR)/include which comes before any include
logic the kernel might have thus forcing the kernel to prefer headers in
HOST_DIR.

The logic to substituting -I with -isystem is taken from
boot/uboot/uboot.mk.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v1 -> v2:
 - Patch was added to the series

Tested with:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="{VERSION}"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="pahole-kernel.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE=y

and with a fragment for linux:

CONFIG_BPF_SYSCALL=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=n
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
CONFIG_DEBUG_INFO_REDUCED=n
CONFIG_DEBUG_INFO_COMPRESSED=n
CONFIG_DEBUG_INFO_BTF=y
CONFIG_SYSTEM_TRUSTED_KEYRING=y

where VERSION is one of:
5.2.21 5.3.18 5.4.231 5.5.19 5.6.19 5.7.19 5.8.18 5.9.16 5.10.167 5.11.22
5.12.19 5.13.19 5.14.21 5.15.93 5.16.20 5.17.15 5.18.19 5.19.17 6.0.19 6.1.11

Version 5.2, as far as I could work it out, is the version that introduced
the pahole dependency when CONFIG_DEBUG_INFO_BTF is set.

None-LTS versions after 5.10 and before 5.19 fail with:

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
make[1]: *** [package/pkg-generic.mk:293: /home/d.lang/ws/other/buildroot/output/build/linux-5.11.22/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

These version miss BTF_KIND_ENUM64 support and require a patch [0] that has
been added to LTS versions.

[0]: https://lore.kernel.org/bpf/20221019085604.1017583-6-jolsa@kernel.org/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..03d89cd204 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -150,7 +150,7 @@ endif
 # Disable building host tools with -Werror: newer gcc versions can be
 # extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
 LINUX_MAKE_FLAGS = \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
