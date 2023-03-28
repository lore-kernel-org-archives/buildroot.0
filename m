Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB3DC76195
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 11:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AD181F73;
	Tue, 28 Mar 2023 11:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51AD181F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWRpgEZaVHJO; Tue, 28 Mar 2023 11:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6436281FD5;
	Tue, 28 Mar 2023 11:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6436281FD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6A4F1BF616
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 11:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD2A381FD5
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 11:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2A381FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41Hv1_SuRjAo for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 11:47:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385F681F73
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on072b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::72b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 385F681F73
 for <buildroot@busybox.net>; Tue, 28 Mar 2023 11:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=WdYM6wpRf4eueOmA/N7FMlUMuXq7pN/g4uIbblUMyUtGq/wBDWd7Tn4DskMZSDU1sbtY9sxTuzVXf5LmTXJjXzRjmUEzyukTLcKaICjhWVALTttr2wl3mueRRtVSCy8ngRazYCLJy72495oJy+EiiVeIikYUi7dgJ6MHAVVFLwMsrQCRJMgZgZZF9N53/CRXPXXQVk+ePytBxnS8LesIrzazPoIp53bd0zmhSo672TQU0EN2Ui0HEF5dtb4Lr1FOADiENDgkQupk4gNGaA81VDR/68NoMjgAicTAYhfXb7/kjhOM3wuNScldRKZxcoXZg+6LHjb3UbqYCTIUcabjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eqrJ0LvJl4nenCLkuyNoYfQgf5IgLoEPbXn0mz8Q00=;
 b=K/Qy5ZqAEHdJa9tYZSywM/aN0nrQ+18nJRIf8MwV4Wj0xoBRsc0NEO5vuAs5vQAYTYH4c15oZInQisR6KJQPHuIzE5XUcpIwNLrHLnUg7TJAJscs3YXcT3+eqQIkIMy9Gwub38s9+yH6Dn2BPbkrVx9OG4SSBSgOlzGE8n/NIpJk6/w89eLSqftu73wTM9t0j+Rry12QYzJqnnMm02YQS449ecLrjZUQwwLDbCLV7fvA+Qm39Yk8DaWAwSMQN7/YqNSd1kgcg78Rwv55PAyWs4CbpixFCaUsaTqdxyXtQe3RNwKPk47xjTBnQK2n4iu+Uk3URfcZg0eXvmqnd1OU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1569.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 28 Mar
 2023 11:47:22 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::412c:892:b0ce:d392]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::412c:892:b0ce:d392%4]) with mapi id 15.20.6178.043; Tue, 28 Mar 2023
 11:47:22 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Francois Perrad <fperrad@gmail.com>, "buildroot@busybox.net"
 <buildroot@busybox.net>
Thread-Topic: [External] - [Buildroot] [PATCH] package/xz: bump to version
 5.4.2
Thread-Index: AQHZYWbf1uLfvMe2b0WY6NmYLHhf9K8QEBfA
Date: Tue, 28 Mar 2023 11:47:21 +0000
Message-ID: <PH1P110MB16031AB28A9E56C10984C8F89F889@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230328111440.1496294-1-francois.perrad@gadz.org>
In-Reply-To: <20230328111440.1496294-1-francois.perrad@gadz.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1569:EE_
x-ms-office365-filtering-correlation-id: 154a01d9-a013-46c8-1943-08db2f823133
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e7mFZ6AlihqQGSppSjUBZla/niwwlitQPu6MYbpzgSdWgCUZeOjNjdOfmvLyLx0YjlqZKBsfUk3SLvcG4VMhFFSHwDDeyZ3jMLpslcursQA0/y6m4d1tf059QSwQe7DlSDS9x0Ox0raESG6UBNosCejneprJQeMm/Lnn2SGF1c9vOwtEMosz63t+w8/rlici4ptWoUzkzPTLGW6vOZAAaUSuEv5IpFbMo+4H93lI4uonYqxWztvKwFR/HblGJ2wHGuFvMVKeTdwLzSNuXQiiiIISGiYRVVgUXyY/fLx2WKsCfCCpiw59hbR7J0IHLtoZlYBbyaTI0B434hdi7bG8m0K8e/Ad3rNKTnAJtbRuja9Ccj7FX+tZchQpPojwHMdzhAEVS1JQdeSGWzkICVqw8P/y21wXNjfrChE6A/hatoENYRrdZov/5GoUNRIwrmrFHmUqrkFuYFMdhgAt4BElPxRGRiNDu7pF5jzrxt/nVIC4MItG8mXDp/a3gRlbwNFzydNPY9e1O4seoi/xnb/QBhyMCsReT6aJZvHxg5RyGa4VNOJTp20TPSJ0NHkHYSLIfBl/FoH9+KeJ3IXtQuWpcOcsP2DLETJNC4s0LC6NttU6y2pEIthE4awd+3AqDxFXMGhgEb58C6TNH9zLqhZ2d6y3ErFRJ9PK0O8xrGEhUUM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39830400003)(366004)(396003)(451199021)(7696005)(33656002)(66946007)(66446008)(6506007)(8936002)(83380400001)(8676002)(38070700005)(66476007)(2906002)(122000001)(186003)(26005)(71200400001)(86362001)(41320700001)(110136005)(38100700002)(55016003)(508600001)(64756008)(76116006)(41300700001)(53546011)(966005)(66556008)(5660300002)(9686003)(52536014)(2004002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: QesBF1Jw/Oc7afyygxz1xKmQ0luR3sD4AWpcq5TabeCI1BamlL1wYhDLhHrbQXQXWLxB+W45n9W1xY9/+t+q1UHeaOiGpZRtDP4/3x2u6EiazhRXjNf+ObjDfaly3k6j3KRc9/uHADZMzJkxi2zsxiTqMKX/RkxMbx/ElkbDT3/6JdLeajEEn5sqjd959h0w1/76c8WUo/nrfqNjF1Fc77G3B0ZFuNbEYc8zhFc3ji9NwXxHLIBIxSGXzVV+WlLt1gUiC+qYt1BFffwtJ2EPsCVsej9Ym8oElmj2oDv0TdR13TVfj0o4eNR5SwGFAyAa4X7UIZywniTXmgclWacOZVBY8ih0DICcOWXqJAwXjJz0Qua563F+KjYlA3tfPUpT82gJJH8ZWlGUt568Lf01f3uN5k/0sQvoXiVP3QNChKI=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 154a01d9-a013-46c8-1943-08db2f823133
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 11:47:22.0274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1569
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eqrJ0LvJl4nenCLkuyNoYfQgf5IgLoEPbXn0mz8Q00=;
 b=7LhQcJrPO1z5EsjTwig30SoJjX8vpfCiGZsNMne8Dcd5QBIMRRHvcTQi/cf8dns44l53yd7KYPzRFEBax86xMQ82WCSoWO/TGTyvuhaw7TYQtBEqcmWIwrleRIOa1zncYNML/COAtJ/cIYTN9Dfcesk9t2KCVviBTmvsbVrkFLyFllcpK1DDsLxNXRnLCRMb7JwLx5MN8icYF2HpbOU7vAValEZzLzYhKDMMmlNRqvxDJmMYDj1U0n13M5XqT6bibu5ef3Q775AuxfFpDYwmVyGNo3E9m33PdhKL06p1UjCKiFAeMfw48PG2ZXnhpQfqIpdtrsVHualEEiUW56JjVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=7LhQcJrP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/xz: bump to version
 5.4.2
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

Francois

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Francois
> Perrad
> Sent: Tuesday, March 28, 2023 6:15 AM
> To: buildroot@busybox.net
> Subject: [External] - [Buildroot] [PATCH] package/xz: bump to version 5.4.2
> 
> diff COPING:
> +        Note: The JavaScript files (under the MIT license) have
> +        been removed from the Doxygen-generated HTML version of the
> +        liblzma API documentation. Doxygen itself is under the GNU GPL
> +        but the remaining files generated by Doxygen are not affected
> +        by the licenses used in Doxygen because Doxygen licensing has
> +        the following exception:
> +
> +            "Documents produced by doxygen are derivative works
> +            derived from the input used in their production;
> +            they are not affected by this license."
> 
> diff COPYING.GPLv3: http --> https
> - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
> + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
> -    along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
> -<http://www.gnu.org/licenses/>.
> +<https://www.gnu.org/licenses/>.
> -<http://www.gnu.org/philosophy/why-not-lgpl.html>.
> +<https://www.gnu.org/licenses/why-not-lgpl.html>.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/xz/0001-Detect-symver-attribute-support.patch | 2 +-

I think we should be able to drop this patch now due to the following upstream commit:
https://git.tukaani.org/?p=xz.git;a=commit;h=076e911ba25cadf2cbdfbd0f65991a002e210c0b

If you have a chance, can you test building with the config from:
http://autobuild.buildroot.org/results/4dc/4dc0c88c1ed250dd5e1be492138bd6e1781128b4/

If I get free time this week I can try to test it.

>  package/xz/xz.hash                                    | 8 ++++----
>  package/xz/xz.mk                                      | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/xz/0001-Detect-symver-attribute-support.patch
> b/package/xz/0001-Detect-symver-attribute-support.patch
> index 462fa9d86..348b2d4c6 100644
> --- a/package/xz/0001-Detect-symver-attribute-support.patch
> +++ b/package/xz/0001-Detect-symver-attribute-support.patch
> @@ -43,7 +43,7 @@ diff --git a/configure b/configure  index
> ff0eed5..e685b30 100755
>  --- a/configure
>  +++ b/configure
> -@@ -16687,6 +16687,21 @@ printf "%s\n" "" >&6; }
> +@@ -16832,6 +16832,21 @@ printf "%s\n" "" >&6; }
> 
>   printf "%s\n" "#define HAVE_SYMBOL_VERSIONS_LINUX
> $have_symbol_versions_linux" >>confdefs.h
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash index
> 1153e02b4..55a22b84a 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,9 +1,9 @@
>  # Locally calculated after checking pgp signature -#
> https://tukaani.org/xz/xz-5.2.10.tar.bz2.sig
> -sha256
> 01b71df61521d9da698ce3c33148bff06a131628ff037398c09482f3a26e5408  xz-
> 5.2.10.tar.bz2
> +# https://tukaani.org/xz/xz-5.4.2.tar.bz2.sig
> +sha256
> +aa49909cbd9028c4666a35fa4975f9a6203ed98154fbb8223ee43ef9ceee97c3
> +xz-5.4.2.tar.bz2
> 
>  # Hash for license files
> -sha256
> bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c
> COPYING
> +sha256
> +72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e
> +COPYING
>  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> COPYING.GPLv2
> -sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> COPYING.GPLv3
> +sha256
> +3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986
> +COPYING.GPLv3
>  sha256
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> COPYING.LGPLv2.1 diff --git a/package/xz/xz.mk b/package/xz/xz.mk index
> 0120d23b8..961059e6b 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ##########################################################
> ######################
> 
> -XZ_VERSION = 5.2.10
> +XZ_VERSION = 5.4.2
>  XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>  XZ_SITE = https://tukaani.org/xz

We've seen the backing sourceforge site flake out in the past, I wonder if we should pivot to using a git clone

>  XZ_INSTALL_STAGING = YES
> --
> 2.37.2
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
