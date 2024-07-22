Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125DCC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 17:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5424940194;
	Mon, 22 Jul 2024 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjpZEFLKOsAf; Mon, 22 Jul 2024 17:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B714029B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B714029B;
	Mon, 22 Jul 2024 17:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 971571BF2F7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8078E40261
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwRL6ZG02NWi for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 17:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CC824022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC824022A
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC824022A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 17:26:54 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46MGl95U027189; Mon, 22 Jul 2024 17:26:52 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40ht4y9jey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2024 17:26:52 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46MHQpDE019290
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2024 17:26:51 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46MHQoTw021140
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 22 Jul 2024 17:26:50 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 836371002775;
 Mon, 22 Jul 2024 12:26:50 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 22 Jul 2024 17:26:50 +0000
Message-Id: <D2W8SSFVLMFX.35Y5MZOPV7155@collins.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
 <20240722151154.0bb0fbf5@windsurf>
In-Reply-To: <20240722151154.0bb0fbf5@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_11,2024-07-22_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_11,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407220130
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407220131
X-Proofpoint-GUID: fPdHHANGdtoU7IgHSfKPqpIOvWcDtn6g
X-Proofpoint-ORIG-GUID: fPdHHANGdtoU7IgHSfKPqpIOvWcDtn6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_11,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407220131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=ULlle59ivKBekn+p6d4FoBVOgA0wXvMA1FO+kl44DG0=;
 b=CzcslETN7b+tFKh8UFAEsHgSMxq8t6Yyqj2UJ5Yv4KoWf4Iqx9VZtvl9eb2hLwFUYqTf
 9EyInBDKXyfzf91udtczEvIXk6ocgla2doVMD2FiHfxrU2DG9Ab787jdnCn7AK2llTBI
 4L3j2TLYS3WPhgS0lZdablRqLfaGcgSUytZDCOthczEt+TcvEYAZr8P7IyIEi2p723Lb
 v5jJbt2ifo/gx5FjhUUtlZq0osFg/dUEJw+VrRTzJrGa2If9rDNeBAUGGI4W0e5/tvtz
 3Sy2zv5s+YPrLG2O9Ak3YYOLZo+nGdjf4e2OS1PejNhQKa2jSqSMEbfyMxqVaTLGfPTK sA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=CzcslETN
Subject: Re: [Buildroot] [PATCH v2] support/testing/infra/emulator.py: fix
 qemu prompt detection
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon Jul 22, 2024 at 1:11 PM UTC, Thomas Petazzoni via buildroot wrote:
> On Fri, 12 Jul 2024 19:31:04 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
>
> > From: Brandon Maier via buildroot <buildroot@buildroot.org>
> > 
> > The qemu.run() method can break when a command happens to output the
> > string "# " to stdout. This is because qemu.run() detects when a command
> > has completed by searching for the shell prompt, which by default is
> > "# ". It then captures everything before the "# " as the commands
> > output, causing the rest of output to be lost.
> > 
> > Instead use the pexpect libraries REPLWrapper to handle running
> > commands. It has hooks to set a custom prompt and avoid some other
> > pitfalls of wrapping a shell.
> > 
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> > I tested this against a couple tests and test_bash.py which Yann noticed
> > is special in Julian patch series. I am running a full test run but
> > that will take awhile, so sending this in the meantime for review.
>
> It seems like this change has broken one test:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792869
>
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/init/test_none.py", line 26, in test_run
>     out, exit_code = self.emulator.run("sh -c 'echo $PPID'")
>   File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 153, in run
>     output = self.repl.run_command(cmd, timeout=timeout)
> AttributeError: 'NoneType' object has no attribute 'run_command'
>
> Could you have a look perhaps?

I already sent a fix for this ;)

https://patchwork.ozlabs.org/project/buildroot/patch/20240715-support-testing-fix-testinitsystemnone-v1-2-299145b2d342@collins.com/

Thanks,
Brandon

>
> Thanks a lot!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
