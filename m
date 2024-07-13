Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21989C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D465C401B2;
	Sat, 13 Jul 2024 16:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLYhr_7X9xoG; Sat, 13 Jul 2024 16:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8312240396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8312240396;
	Sat, 13 Jul 2024 16:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 017F61BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1F54404EB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9U2KNE4FRXM for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC625404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC625404D7
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC625404D7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:24:55 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DBJeCt013486; Sat, 13 Jul 2024 16:24:54 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj6ets1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:24:54 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DGOrb8030226
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:24:53 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DGOqHg026920
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 16:24:53 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 5A3002005494;
 Sat, 13 Jul 2024 11:24:52 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 16:24:52 +0000
Message-Id: <D2OJUFSZ6Y3N.CIWMCVYF7ZFS@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713144316.403640-1-arnout@mind.be>
In-Reply-To: <20240713144316.403640-1-arnout@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130123
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130122
X-Proofpoint-GUID: M9tomjrD78SxIBWHKvNcWULCiSTroCE2
X-Proofpoint-ORIG-GUID: M9tomjrD78SxIBWHKvNcWULCiSTroCE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407130123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=IamfUdi57apRXxM0NRvWBUWoOL/Jx4Gf1+/xjpKgb6o=;
 b=IsdSg+Muv81DxGeJQr2+w/P5aTGVR6B5wG6A16eiCo5gh+tWu/pUsOZ8pmU6Y7LIZsZ/
 jYSEBrpSvjaDiKyHV3GkCQasKi+8PfX9bXY6y/JrqbCR92Lvb++5dc21wYrUGvnt9zzq
 GLePgMHrmPs5thlJ7p1i7Uz8HQ3SqSoQKJTiogFnhaUVl3Zciag1DVCEN5ypWjW/f/Sd
 rD4o05dNPmhcqgDyvFE1Kx0j4zBAj8z2fLZ2nxQOTu3xqZ0d/M4jcDPj2yVJEty7Jcw/
 YPGoibgStRY7jg/akj2D3+sQy7Jq4nIMqAtCgnHiCjtq3lTKlTSwID8Y9GiyZG5fltlf lQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=IsdSg+Mu
Subject: Re: [Buildroot] [PATCH 1/3] utils/docker-run: allow to specify
 extra mount points to propagate
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Sat Jul 13, 2024 at 2:43 PM UTC, Arnout Vandecappelle via buildroot wrote:
> Sometimes, the build needs access to directories which are outside of
> the current directory, e.g. for pre-downloaded toolchains, local kernel
> sources, OVERRIDE_SRCDIR, BR2_EXTERNALs, ... We need these to be mounted
> into the container to be able to perform the build.
>
> Since there is no generic way to find out all the directories that are
> needed, we need a manual mechanism. We choose the environment variable
> EXTRA_MOUNTPOINTS which contains a space-separated list of directories
> (or files) to mount.
>
> We choose an environment variable to avoid having to parse command-line
> arguments to docker-run.
>
> Update the terse documentation in utils/readme.txt with this
> information.
>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
>  utils/docker-run | 5 +++++
>  utils/readme.txt | 5 ++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..3bb7b6a41b 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,6 +90,11 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
>
> +if [ -n "${EXTRA_MOUNTPOINTS:-}" ]; then
> +    read -r -a extra_mountpoints <<<"${EXTRA_MOUNTPOINTS}"

I think it would be good to use `IFS=:` here and split EXTRA_MOUNTPOINTS
on ':'. That would make sure we don't split on other unexpected
characters like spaces, tabs, and newlines. And it would be consistent
with how BR2_EXTERNAL works.

Thanks,
Brandon

> +    mountpoints+=( "${extra_mountpoints[@]}" )
> +fi
> +
>  # shellcheck disable=SC2013 # can't use while-read because of the assignment
>  for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> diff --git a/utils/readme.txt b/utils/readme.txt
> index 6488d13c75..0cc665e478 100644
> --- a/utils/readme.txt
> +++ b/utils/readme.txt
> @@ -21,7 +21,10 @@ check-package
>  docker-run
>      a script that runs a command (like make check-package) inside the
>      buildroot CI docker container; pass no command to get an interactive
> -    shell.
> +    shell. If additional directories need to be accessible inside the
> +    container, specify them with the environment variable EXTRA_MOUNTPOINTS.
> +    The buildroot directory, the current directory, and the download
> +    directory are automatically propagated.
>
>  genrandconfig
>      a script that generates a random configuration, used by the autobuilders
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
