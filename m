Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B35C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 13:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E17861155
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 13:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E17861155
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D1F82C3C;
	Thu,  5 Aug 2021 13:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQSQ6mDlvA8y; Thu,  5 Aug 2021 13:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 765FD8275C;
	Thu,  5 Aug 2021 13:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77C0E1BF471
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 13:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6647D606B4
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 13:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="Vel3feOh";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="ine0AmzH"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wJkRlLfdVCL for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 13:34:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 490C9605D8
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 13:34:24 +0000 (UTC)
Received: from pps.filterd (m0266029.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175DXoZT006539; Thu, 5 Aug 2021 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=CWjhLKVTSBU8NoE+WHbuWppXjyR/mcUqG38WCUiYzFY=;
 b=Vel3feOhHlesfzP9P4zWozi5HIscJqBJQNlOrHJN+pxusefzrG5GGsJ9LzPWEnHhxv9c
 JQPuTR4SiiJamkRrngGXoTKpRhiAW4V5al9lhaJIb2nn6y68AIthslAI4RvQT1Z30V7F
 Y5sLBgNi2XVEDlzZS0wwjpZqkMBsI5bfHSCADu+kEZ0NCWPgEVbaIBMmwLGmHgHC5oOo
 eP/33+Zo1t3HBw6W65sgXCQstWnOs1OB2UnFXhyv3jS7dN3kOfZGY4HFkLTVAh/hJaPF
 o60HT/7NMpvi88YbgNFS9lOxfLoH0OXNOIqC503uEmdAe0KRJmrYeXUlo1u3CnuEH8AK 8Q== 
Received: from xmnpv36.utc.com ([167.17.255.16])
 by mx0a-00105401.pphosted.com with ESMTP id 3a839qc2yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 13:34:17 +0000
Received: from qusmna5l.utcapp.com (qusmna5l.utcapp.com [10.161.160.134])
 by xmnpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 175DYGQv138808
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 5 Aug 2021 13:34:16 GMT
Received: from UUSALE0G.utcmail.com (UUSALE0G.utcmail.com [10.220.35.26])
 by qusmna5l.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 175DYFoQ016842
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 5 Aug 2021 13:34:16 GMT
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE0G.utcmail.com
 (10.220.35.26) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 5 Aug
 2021 09:34:15 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 5 Aug
 2021 09:34:15 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 5 Aug 2021 09:34:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=LsVr78Gv/1N9Lwdy4XpABiqC2SZkrBVfRbbNiNho7S1R5BTBold3Dl4HXyggGdWRXhVjTRpA4vGY2Q+o8WP7rOp9YyvCjln1ZEga+u8FgtiEGscW19nuriovup9Yg9TC0vS8hrw+4q/vYkoYek851d6AIjEqkyEphYUPa3+r5RTKshcvn0wi7CV904QO9tk7lj0LiVf1fRNpapeITf0yhb16aRItnt2yTXlXknaaKIb38qSiTATF+JxDiKJE6NUzdM9CB4ctak0U9ywE88sTgHCNnkjYyIt+TNMwJRo+NYYZapiVTdVlSI3IZRs4PgoJ+pWAbD1RI+j+i7u6+HK0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWjhLKVTSBU8NoE+WHbuWppXjyR/mcUqG38WCUiYzFY=;
 b=QuaXIJ2jvOfdT6Dour2SWDdECZFqYmZ/hbiuy6lb9sRyQdcO+t1jGwLiQKYAgXCeXVo0BvlADd0s+z7yQHIpTbg5diRWHmDR9t4CwRbetOrTfStOfCY9SWO3T7aqfxqCrYr8KX2eRUiF9Pb6i4kM/8TSfO0428XrwFjipu8wG09ZeusXxIkNUzgjBzDTDLPmGDignbTJ03Qux07suhg7Oyg7VkcAd7T4LrB3DFS7lV88+27PFjLgGYv5jcdM6J4VT3RJr6S17tWMg3pt4NTE9LCnBrvioNGQjVH8O4dz35qJmEM+8JumiOVK6YLvJYNUhXDwrQLmTY9ZwB/wxWPhpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWjhLKVTSBU8NoE+WHbuWppXjyR/mcUqG38WCUiYzFY=;
 b=ine0AmzHo24bYCck+fNBbFmh0WaNUfjXrSV96l4lrUrxmR5fD+pdKEVMutUgGPtQuyp4e0VzZjxNeBaJu87aIrNElWrq1DbJ8CmTVB376rSHe7G7iRn71o0eNte6Y5BX5hEwaQnWjaTMxDDYZUrfGokrSh0LrgCXXyFZa+IGJOg=
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM (23.103.22.148) by
 DM2P110MB0092.NAMP110.PROD.OUTLOOK.COM (23.103.15.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20; Thu, 5 Aug 2021 13:34:14 +0000
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) by
 DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) with mapi id
 15.20.4373.027; Thu, 5 Aug 2021 13:34:14 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Arnout Vandecappelle <arnout@mind.be>,
 "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/drbd-utils: add SELinux module
Thread-Index: AQHXg+k/INUQhd3Ha02zxbXNcFqWE6tk67Aa
Date: Thu, 5 Aug 2021 13:34:13 +0000
Message-ID: <DM2P110MB0105A06F54D131C059F60B9CF2F29@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210726082131.1705945-1-fontaine.fabrice@gmail.com>
 <20210726141522.38012b89@windsurf>,<20210728194546.GF3189549@scaer>
In-Reply-To: <20210728194546.GF3189549@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: free.fr; dkim=none (message not signed)
 header.d=none;free.fr; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.80.23.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd859f34-f21d-492e-998a-08d95815b72b
x-ms-traffictypediagnostic: DM2P110MB0092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM2P110MB0092BDC76C6BDEF6AEDE2469F2F29@DM2P110MB0092.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 37jSJKdcCp4ArmluA5odK1fsY1fWdb4jxgAC5GqeF90s7H6W0F/cA3Gqswf0s83KzFbq7PsjmfK5M7kEpudMjaMf11cBuDMgJCbhG6ZMiEeUilEU0Qfx0JF5or/+baOFcHrEbQQlBHTk9qatV0N7NQoTrtMDDOM4miXh+P0P2f4qLNN28dTR8sNSySSMhYBWD3532b/u49pSBb8tT8SarXb/jrTt1k+7NhVb9Q1jpA41wcTR3IYdoOkoj+h6Fr0fRuHtWVDPsGwai/mQR1GM1RUNeeZ/KrleyYqB9K0VU2BvCQ3ujUJ13tn+AO21LSBDaaK+I5XcyTWmFTowzU922cp7lPzwYGetnAWLZBlsgOAF+54yzqlfWbThqipLbEBWpaM4quf9N6RqKPxkfqGw23GnxehtdpziKW94YDpTmlJ09Jen6fLrWIw4nRIoDnqbKRo4AOxUNEoxnu+oU0aH6iqtb31bvpaPaBiFyCKPwUGR6wfqct/mmF9daff//ujXIFQhSsBZ2z7xAZm/edlqEdkj9cPuCvlTgQvsT20ismQM33Z7uXH8PFzvr9yCzcuv1dLqjOYSBdEGIdycFrBi/bC5rR6Q4KGbMspWM3Tsn/AwyTN075YxGJe1wdALLK8cpkJrhG4KIaVc1vz90C6cvpOq/mSpV2TClvEGpVX02zE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(122000001)(53546011)(7696005)(8676002)(64756008)(6506007)(76116006)(38100700002)(2906002)(66476007)(66946007)(8936002)(83380400001)(5660300002)(26005)(33656002)(55016002)(9686003)(66446008)(66556008)(107886003)(38070700005)(52536014)(71200400001)(110136005)(4326008)(186003)(316002)(86362001)(478600001)(956004)(54906003)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: AO6ZF7F3cDMbRxdWQcMugFv39+Z9ndAbQsjuPLnPm5b3ha9iuKgQo8E16j18f7SCBU0Qxdep5Y4zLoW8WAVyDQxDXwf38L29l7qM9IOHy1PC0pErZjv9tKwHdBC0gVxbokTGoIql+g5oj5N6JPu4WTm42WpIT7DtwwgkC6kjzAEhGz23TU6PqdEzgHHxsJXjqGo65j/dosU3e/yfdz6KCWmJdHAtR81PRx0JJFc568/vlJFgRdFnrWNobktvl5/HzwBM+PN68hApPCK8m3UT9zIluTj0jL4uQNym3v1U+LKKR3l1wURBqjz999hWFHzB2GjzjSDVBXuhviJW8uMmOYLYAydKdgNdn+F9LJ0ZL6QWaxcvYA9NVAptGXOBBHI6I0GdXBreF/ebM8cMrnTADK540GNsBsaG1/1A0dQQgR1z1aH21X5kaL1tQ3ZHnUNGbU4E8KPMm/K9gz48yxUGbPHB6jDWGQwcT3zuTdK8OuR1mjLPL+lk4JBmBTfP0v+Hg/DQKijjBIyt7l3mZVuSQrppWuGtFqBSBbPPgCfYxTi01mB0WnGRIHXpEEZq1RrJRbJuqddLO2bkfSwLa3RsfmQM77+fPdawBUeiiyCuc4tJMLR0gafTk/mPk7+8Q3pj2K+u9adQuUMTrrwttZYeBBlYJAVhyjYZF6hg4g/T8HKKnlgI35lmcvPCJU+H0mjIDECALQgRmdF2JleueB6pog==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd859f34-f21d-492e-998a-08d95815b72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 13:34:13.9421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2P110MB0092
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: lQiCeestRdUfD2vXgwFxkn79nJ9fk1R_
X-Proofpoint-GUID: lQiCeestRdUfD2vXgwFxkn79nJ9fk1R_
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050082
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Weber, Matthew L Collins via buildroot" <buildroot@busybox.net>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>, "Shotwell, Clayton L
 Collins" <Clayton.Shotwell@collins.com>, "Graziano,
 David D                            Collins" <david.graziano@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

All, =


> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Wednesday, July 28, 2021 2:45 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>; Christophe Vu-Brugier =
<cvubrugier@fastmail.fm>; buildroot@buildroot.org <buildroot@buildroot.org>=
; Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: add SELinux modu=
le =

> =A0

[snip]

> > =

> > I have a question: are you testing/using all these packages in an
> > SELinux context ?
> =

> That is eaxctly what I was pointing out with our addition of the
> handling of the SELinux refpolicy in our package infrastructure.
> =

> On one side, either we consider that the refpolicy is authoritative and
> represents the state of the art of the SELinux policy for packages, in
> which case we can "blindly" add SELinux metadata to our packages, or...
> =

> on the other side, I fail to see how a generic policy can be applied to
> a specialised product, where constraints vary wildly from the "server
> world" where refpolicy and SELinux originate from, and even vary wildly
> between different specialised products, in which case basing out SELinux
> handling in our infra on refpolicy does not make much sense.
> =

> So, it is my understanding that we decided that the refpolicy was to be
> seen as the gold-standard of a policy, from which customised, local
> policies would be derived, and as such we could safely use the refpolicy
> modules on the assumption that a local policy would also have them...
> =


Correct, "refpolicy" can be used as the "common" gold-standard collection o=
f what use to be considered "contrib" policy.  Refpolicy previously was the=
 main repository of distro customizations and common items.  Then a second =
"refpolicy-contrib" repository contained the common package policies (ntp, =
util-linux, etc).  Today the repositories have been consolidated and the fo=
cus is on the common parts, not customizations specific to a product/distro=
.  Most distros today have a fork/patchset that contains the customizations=
 (Fedora, Redhat, Yocto, probably others).  This was the direction Antoine =
Tenart headed with the Buildroot per package support.  The goal was to dyna=
mically build a policy based on enabled packages and then allow a user to s=
upplement customizations that make it completely work for their target.  Mo=
st Buildroot build failures we'll find in the refpolicy modules will be rel=
ated to dependencies that larger distros don't encounter with filesystems i=
ncluding fully-featured packages.

The Buildroot SELinux refpolicy support breaks down into the following.
- Builds a smaller refpolicy, not selecting all the modules by default.  Di=
sables all non-base modules by default and only re-enables core ones that w=
ould be needed for all builds.
- Allows packages to select extra SELinux modules within the refpolicy to b=
e built in the policy. This allows applications and libraries already suppo=
rted in the refpolicy to be supported when selected in the Buildroot config=
uration. This is done thanks to a per-package variable,  <pkg>_SELINUX_MODU=
LES. This better supports Systemd.
- Allows users to provide their own SELinux modules, and to select extra de=
pendencies that would be available in the upstream refpolicy.  This is done=
 thanks to two Kconfig options, one pointing to a  directory containing SEL=
inux modules sources and one listing extra modules to enable in the refpoli=
cy.
- Allows users to provide a fully custom refpolicy, overriding all the logi=
c described above. This is done by providing a Git repository in  Kconfig p=
ointing to a fork of the refpolicy, provided by the user.
- Allows packages to provide their own SELinux modules, by having an 'selin=
ux' subfolder (package/<name>/selinux/). Those SELinux modules are copied t=
o be part of the generated policy when their Buildroot packages are selecte=
d.
- Handles the creation of filesystems that have extended attributes setup t=
o match the refpolicy's filecontext definition at build time.  (No runtime =
R/W activity on first boot with restorecon)
- Provides runtime tests for a base systemd target with ext2/squashfs (exte=
nded attribute enabled filesystems) .  Good examples if someone is looking =
at how to build a basic SELinux enabled system.  This route was suggested v=
s adding a "qemu board defconfig example" for upkeep reasons.

Regards,
Matt



_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
