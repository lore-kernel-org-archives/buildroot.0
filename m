Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9368CC61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 02:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1056081CE3;
	Sun, 29 Jan 2023 02:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1056081CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEN4XpKYwCki; Sun, 29 Jan 2023 02:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4328981B9A;
	Sun, 29 Jan 2023 02:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4328981B9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6721BF3E3
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 02:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46EE7401C2
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 02:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EE7401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clqmynezUeSy for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 02:36:41 +0000 (UTC)
X-Greylist: delayed 00:15:14 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34318400D3
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0131.outbound.protection.office365.us [23.103.208.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34318400D3
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 02:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=iVSIY9EnmDIA+HxKYQTC+taLAYGIHNf1uKx2XVD/zYY2o2byT1hnUCbDTpNi8k9nrUVSVAwaiep+zQPVIF8ibEcuhT2FnuaGt/I2GXK1Kd/LGteLSJKRQkn5XIUHNVLl9JEmrkx/GlhdYck0VAbQotl7Iuie6rGj6hfFOQZcu9YrAEa9T/SfEpthGGC7dmt9DUaArof9CpV5q/QcZAmKBuAS3BYrIMFJvn5lMi6tnnqorLftXcQ7cRjxAKB1XvSIAi/u2BFh+hnN5AGrA12V+iAxDk05AhVNDdE5S2oevoPzHL+kszjZsB0dpJ6CQOQ70/oQ175iR/RmK9Nfr5NCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuC2U8N9twUG9Re8rKZeoPlxwfA2iqbtM58YaR0//dk=;
 b=TpUwpXjf/CUB2f2U7Hi53D+TEAmoyFEuYEBpaQ5ZsfgGd+QY2D4v7NzKpckpwGyF1zKeqTf5COnXdj+P/alo/XNVRMVgE9S03YL/bobUp1yXhMK0m2X0xvJ7qIsu3iqiz2DObA+PLYlhcgSLhQ3VlvNqyRADzg5v8TrvgDsd0Dh9j0G6SzCZI1B6onGpNtU79gnbXxKGOEKEaSDAuC/MHfT5II838BKkpceaqqNih09jem7cNtuAj3pLvGfWiePs1DKibFP4+C15OzCE5ZDi4gAhJoYnZJoOgOVtPVmXPTYLRnzs/W3tjJx6AiU2VY3BoP4S2COgDT8sL64sgvqGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sun, 29 Jan
 2023 02:21:18 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::772:4537:5767:b473]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::772:4537:5767:b473%7]) with mapi id 15.20.6043.031; Sun, 29 Jan 2023
 02:21:18 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - Re: [Buildroot] [PATCH v2 1/1] package/ethtool: fix
 builds for older toolchains
Thread-Index: AQHZMowHfQiP+GEIOk61JKSXU8xP2q60WrsAgAAAzoCAAE9sUA==
Date: Sun, 29 Jan 2023 02:21:18 +0000
Message-ID: <PH1P110MB1603A0189A55206D3BD374509FD29@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230126185049.3600233-1-vfazio@xes-inc.com>
 <20230127201446.1181422-1-vfazio@xes-inc.com>
 <20230128223142.1c292f98@windsurf> <20230128223435.2d708808@windsurf>
In-Reply-To: <20230128223435.2d708808@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1068:EE_
x-ms-office365-filtering-correlation-id: e97338e7-54a4-4fb8-e424-08db019f8131
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rYuG89H1vYnAnP0h0JZtCY402yNc6F9dhGdMfVvSWFkw1RDmSgSlOcUbAUWM9cbbcMURMlO/ys3ra8dyPVWhYkROw1bxK9FFj/6pmrZ5owxKVHFVisdRDh7TiWLyU4YnfXLyIgVBcLLAQYd9M8UrVNVhmT421L11hRNrQuROTbbUbeMGU+PmAinR1RCTKCeLUAIkhMSIPXJy1PcVEu+uOYuOSbxTrTLZ9MoTcgdx8r2cDhrYfr7DVfOgp/BPdQi0GWMJZEl1/hoNI9GRXWHKoao5d3BBp+Y8iENGj4kyUAOt28ZiL2Tn35EGc/JAW/f5YWU5IzPFXaztnLKy4DB0IBottUEPuwQGPsKIeD2RJfhKwOc7isCg3SkBOPZ8r+u0qK4TruvxKwydhGZ0A+/aMn9udVKxVwvZzEz+bNoqtPax7W2137t8YKH9W/i46pK1+doGhaTaZ0NY0+szrsoBxqwEy6iSVSQJsQUDUVOactP6OWG9+nOzSCfm1iyB1AnxjGt00LjOD3uOUlL4pT//aL/hhMMwmFSWJFAUH8cSOTm6k3hPpjpSwaKp6EhrMtUidzt4sv6DqE51ksCtbWhtY9RcpT6tTYr36KuRYr5J8n6My63LAx32Du2T0A4L04ClWddpDXwL8nexkorgqDJqGPv0ssJM27L8/nYo9nbaz9idEH2nBBU2houW3cwcs7s+OQaCL/5HLupHG7qPJ9JS6QV1xWjDUlNj4h3vc11Syr4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39830400003)(136003)(451199018)(508600001)(966005)(71200400001)(7696005)(26005)(83380400001)(38070700005)(86362001)(41320700001)(122000001)(33656002)(55016003)(38100700002)(186003)(9686003)(53546011)(6506007)(4326008)(6916009)(52536014)(8676002)(66476007)(76116006)(64756008)(66946007)(66556008)(66446008)(54906003)(5660300002)(8936002)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vhdIQ8maAgivWk/OffPpV3OAbBc+wSCXwxymSmX4f7sdbhTGIYJObQeEMKay?=
 =?us-ascii?Q?L/2tEgCqPL2V2SXSmUKdYZu378oKkNSDZbYPH7HR6ri7kha0/PLyZWgX7CVN?=
 =?us-ascii?Q?0dWqEqgOUhtqR6H0kYRqENKw8JTGNgSckHCH88lmPacqgoZ7HfNWNjWqf7nj?=
 =?us-ascii?Q?r4mDX+1VAvdUZvYQZlYTAgLlGXJIrNb2WXg+tcSD6+deZ3gNLW4aLi8FSsGM?=
 =?us-ascii?Q?H7srmWhBhwinqMb5NSJw5Q/5lokzIXqhp8h0/a7C5Z+LgYZpkAhF6ihxGt2n?=
 =?us-ascii?Q?MUNmZ5R+bu5qPG8OO4NJtkrqxFRVQOuCXtNN6acZ2ALTaWy5elE74uKQIdcO?=
 =?us-ascii?Q?FBdudgP1TCnn8DQUuYe0WpwGoU7KiyOfiu32wW39DSbsPs3fGYR9y0LXaJFN?=
 =?us-ascii?Q?uv4IDryW8HXC7F6P4EpExiLS0/KfzcJ+mPQlAb/XRalXbndc3DzmpgfK5Yat?=
 =?us-ascii?Q?lI094n0Qn7I/sgxmbfAyFBxWnSBi5NYQ8//UGXoIwDjatRmFe5cddlBu8Oo+?=
 =?us-ascii?Q?Qn8jE/PkWxQ3QbPqs+Tk23xvetEK8uTMz3XvXDuUlEvuL/i9u2GD7z32WQau?=
 =?us-ascii?Q?L1N4SYnJnt+/POReH7/zwryHhKd++Sjck/WE3aa9XbvxT5DnoHNLQDFN/rrO?=
 =?us-ascii?Q?AZlEfTyB6dqqyq0dBcSfsz9WJhUpnqFekXhHblA8LTeTPd953qcrthHlZ+n1?=
 =?us-ascii?Q?oCdINR823/jk8qDaxQ1ySeRFRcxAsQ0pjOZrm7L0lUmVtP+gvcVjD96Q5Ppw?=
 =?us-ascii?Q?Wpv7d/IRuMVNNOUjwb9iYl7jksnKOleEHWuKw3ZMsVw6QPAAhVtkZeIJhkdU?=
 =?us-ascii?Q?L7/jHdF4DmWADlDeS/KLQh43EdGvJ735OsuhGWWUILJqawrboi92FtBBSUsQ?=
 =?us-ascii?Q?5U86UB+X66H097Icju4AuQw14rKDNiEixlwbhr/0GHi6jFleVkZ+HciYFcKA?=
 =?us-ascii?Q?wsAhco6dYWCx7+oTsjCJaUE/lsR/p6jR5NJ8i4QFTJQB1YJnI+LMsj61Y2io?=
 =?us-ascii?Q?8cYJyuJTnVAzZAnYt+bSdXjnXa3dFmttWHK+O0YOEefs769S7Bmk0v3Qu22x?=
 =?us-ascii?Q?HHneHfWLvALaIusr/o0R8tANWLzBg2GD1PTf5Gc8ZZfthp97JhJJAijhLQ1U?=
 =?us-ascii?Q?L0W6bpdfJOR4NVm3qUQlu9ZQx+bJnGrRYR4L014kPMsHt1QwrO24Q8pdJ8U1?=
 =?us-ascii?Q?OAD5yyyyA5d71YiKDiUisfzDHSNVNEtejMg+1anRHkHMegjMYbFeQSOEnOaL?=
 =?us-ascii?Q?Ul/ChwHxWzCeZl5xOxGRKNjQHau4/6fc4lCG9NbqYjKjwB6AMzjJCSdMNWiU?=
 =?us-ascii?Q?Glu38R/dVaEFRKJAlFbTX/3WMT+gHMfNrYh/GYb4rkf91u/CUddDRYJrhn99?=
 =?us-ascii?Q?1diAgTQuyg/1PaJ/7lVmM2F0zdh8vEHytAmjWRn/GaCgt0TuOxKQukwnj6bN?=
 =?us-ascii?Q?4pZZuNrpl3nlRQ9sNf8tYNlQ+lADdq2mZljkfIE97JMvdpIQ+ymFBNGmRJA4?=
 =?us-ascii?Q?FttZ1nBik2AuG5A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e97338e7-54a4-4fb8-e424-08db019f8131
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2023 02:21:18.1457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1068
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuC2U8N9twUG9Re8rKZeoPlxwfA2iqbtM58YaR0//dk=;
 b=rCQ4bJHCpUnDOoWRrHq/0KYNNfEKJnch79IlHfqKFv4sTTTUX6//KUGFwwpCwrNqGY4kloSzusgiG82x6deTa1uS0PT0UOOVtqLpM/G7+aIsEk3U0Sq90sOOluqJPHj1Sr/7/lU/OQddCxa5uMKUp8uK0yke1g17+uQ6WKMA2dTUlY624qAzWnocnfy1JD/4+TtFXycSjR+Uaef0tuPlW6ssKr/xSrIKQYXaMdkEbU3X5PA1Hd4BlTabu1gYI/O53Tc3h9qRFIEIQZEBs4whx7BnlFl7Q5E7DWofByuL8oUChbXyo/nlFKOvlT7euT585Xjp0M6KU0ptdHy8MCtH/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=rCQ4bJHC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH v2 1/1] package/ethtool:
 fix builds for older toolchains
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Vincent Fazio <vfazio@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Saturday, January 28, 2023 3:35 PM
> To: Vincent Fazio <vfazio@xes-inc.com>
> Cc: buildroot@buildroot.org; Florian Fainelli <f.fainelli@gmail.com>; Matt
> Weber <matthew.weber@collins.com>; Vincent Fazio <vfazio@gmail.com>
> Subject: [External] - Re: [Buildroot] [PATCH v2 1/1] package/ethtool: fix
> builds for older toolchains
> 
> On Sat, 28 Jan 2023 22:31:42 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > >  package/ethtool/0001-uapi-Bring-in-if.h.patch | 483
> > > ++++++++++++++++++  ...2-marvell.c-Fix-build-with-musl-libc.patch |
> > > 71 +++
> > >  2 files changed, 554 insertions(+)
> > >  create mode 100644 package/ethtool/0001-uapi-Bring-in-if.h.patch
> > >  create mode 100644
> > > package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch
> >
> > Applied to master, thanks.
> 
> Sorry, I messed up, I applied the v1 of the patch, which only added the 0001-
> uapi-Bring-in-if.h.patch patch and not the musl fix.
> 
> Could you resubmit the musl fix separately?

Done
https://patchwork.ozlabs.org/project/buildroot/patch/20230129021756.2845959-1-vfazio@xes-inc.com/

> 
> In any case, having the musl fix in the patch titled "fix builds for older
> toolchains" was not really correct, as the musl fix has nothing to do with
> "older toolchains".
> 

Totally fair, it was a quick change I made at the request of the original author. I should have reworded the commit and made sure I marked the previous patch as superseded (odd that it wasn't automatically marked though).

> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training https://bootlin.com
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
