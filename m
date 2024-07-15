Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F73C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCFD405F9;
	Mon, 15 Jul 2024 12:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WABLfXkI9NPk; Mon, 15 Jul 2024 12:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058224047E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 058224047E;
	Mon, 15 Jul 2024 12:42:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 431D11BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F908100C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59Io_ytPVEMT for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 044F081076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 044F081076
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 044F081076
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:42:00 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46FC79Eu007459; Mon, 15 Jul 2024 12:41:59 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bgryvtac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 12:41:59 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FCfwGB023894
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 12:41:58 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46FCfwoK007707
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Jul 2024 12:41:58 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 6AC7FA6E9;
 Mon, 15 Jul 2024 07:41:58 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 15 Jul 2024 12:41:58 +0000
Message-Id: <D2Q4CV5BYS4G.1IUZ2L9P4J0GO@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240709-support-b4-v1-1-ef971fe9a893@collins.com>
 <c322f791-e070-45f2-8399-5dbdda3688ca@mind.be>
In-Reply-To: <c322f791-e070-45f2-8399-5dbdda3688ca@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150100
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407150100
X-Proofpoint-ORIG-GUID: sq17gIcf05mJH2zBdlSCR-PSZ5mjgAYu
X-Proofpoint-GUID: sq17gIcf05mJH2zBdlSCR-PSZ5mjgAYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407150100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=vBCrFGU32Vbww58LxOjQEH6ObJoUntDECz2qptpR8EU=;
 b=HkozObAPWyqY7Yf9qoHOZKYW7eKKuBzQk79yfLk26U0TKC9wcK5I4b3L+pjHNMvNVE5U
 UgDDhtPj5XqJhp5wYQ1LyMhjYku4jSt3fm9W2ZxfvGhF2geCVReitjuc45HdiOkeAKXv
 DljoWVehkzNDyhaSdJnec489CcBBI5GEXTM+HbCwS4FntxrR3zufgFKrBGdC3+WGAp3x
 wXfrl31t7bLi487ryZw10x6LOQfYamHY/u1JR0xtHKSGlcaptJ/OOYhSOuxrfFDX9BLC
 Mp3dpavt1oBLY1NliNQYL48SEIwmkZ6JlhmZ50n16Sg6dTub1C8yHmtVVB6YRzbfxVXv ZA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=HkozObAP
Subject: Re: [Buildroot] [PATCH] .b4-config: configure `b4` for Buildroot
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Sun Jul 14, 2024 at 8:35 PM UTC, Arnout Vandecappelle via buildroot wrote:
>
>
> On 09/07/2024 16:16, Brandon Maier via buildroot wrote:
> > `b4` is a commandline tool to make patch-based development easier[1]. It
> > is primarily used for Linux kernel development, but can be configured to
> > support any project that has a public-inbox endpoint. Buildroot has a
> > public-inbox mirror at "https://lore.kernel.org/buildroot/".
> >
> > We configure some basic settings that tell `b4` where to send patches
> > and how to use get-developers.
> >
> > [1] https://b4.docs.kernel.org/en/latest/
> >
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>
>   Applied to master, thanks.
>
> > ---
> > I am planning to send a future patch to hook `./utils/check-package`
> > into `b4`. This reminds users to run check-package with `b4 prep
> > --check` before sending a patch series. But support for custom check
> > commands is broken in the latest version of `b4` and I am waiting on a
> > fix I submitted upstream[1].
>
>   In addition, check-package doesn't accept patches as its input at the moment.
> IIUC that's what the check hook is supposed to receive.
>
>   I have the following in a post-commit hook:
>
> git diff HEAD^- --name-only --diff-filter=ACM | \
>          xargs -r ./utils/check-package
>
> but I don't think that "git diff" command can be reused for handling the check
> command.

I modified check-package to accept patch files directly. I made
check-package scan through patch files for lines matching "+++
a/file/that/is/patched" and run on those files directly. Which is
effectively the same thing as your post-commit hook.

Thanks for applying!
Brandon

>
>   Regards,
>   Arnout
>
> >
> > [1] https://lore.kernel.org/tools/20240626-b4-config-check-cmd-v1-1-83fc971196f9@collins.com/T/#u
> > ---
> >   .b4-config | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/.b4-config b/.b4-config
> > new file mode 100644
> > index 0000000000..1943458f2f
> > --- /dev/null
> > +++ b/.b4-config
> > @@ -0,0 +1,7 @@
> > +# Configuration for the `b4` tool
> > +# See https://b4.docs.kernel.org/en/latest/config.html
> > +[b4]
> > +    send-series-to = buildroot@buildroot.org
> > +    send-auto-cc-cmd = "./utils/get-developers -e -"
> > +
> > +# vim: set filetype=gitconfig:
> >
> > ---
> > base-commit: 3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55
> > change-id: 20240626-support-b4-41d61b8e4d60
> >
> > Best regards,
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
