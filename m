Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CED6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 08:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2244B813F1;
	Tue, 15 Feb 2022 08:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zmbXOrCk3qm; Tue, 15 Feb 2022 08:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A009813E0;
	Tue, 15 Feb 2022 08:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE131BF292
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 08:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ED816005E
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 08:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNbG9hcrNYky for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 08:48:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB31E606B0
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 08:48:43 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:56398
 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nJtVp-0004Wb-Oi; Tue, 15 Feb 2022 09:48:41 +0100
Message-ID: <a4b608ec-83df-55a1-19cf-370ff5bf8b5b@lucaceresoli.net>
Date: Tue, 15 Feb 2022 09:48:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220214203909.251924-1-yann.morin.1998@free.fr>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220214203909.251924-1-yann.morin.1998@free.fr>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH] utils/docker-run: improve user experience
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 14/02/22 21:39, Yann E. MORIN wrote:
> Currently, the docker-run script starts a container based on the
> reference image, in which the user has UID:GID set to 1000:1000,
> which may or may not be the same as local user uses, which may
> prevent the commands in the container from creating files, which
> foils the plan of using the container to run a build...
> 
> Additionally, the paths in the container differ from the paths
> the user expects, as the current Buildroot tree is mounted over
> the in-container user home directory. This is a bit confusing...
> 
> Finally, the container is left hanging around after the command
> finishes, and thus there are as many lingering containers as the
> user runs docker-run. This is not very nice...
> 
> We fix all of that (yeah, should be different patches, but meh):
> 
>   - we use --mount instead of -v, which allows us to bind-mount
>     the Buildroot tree at the same place in the container, as
>     Docker will create the destination if it does not exist, while
>     -v seems to expect it to exist [0].
> 
>   - as a consequence, we can also set the working directory as the
>     Buildroot top-directory;
> 
>   - use --user to force the same UID:GID in the container as the
>     local user, so that files created in the container belong to
>     the local user, and so that files from the local user are
>     accessible from the container;
> 
>   - use --rm do remove the container once it terminates; starting
>     a new container is very quick anyway, so it is as good as
>     re-using a previous container.
> 
> [0] the documentation is not clear about that. It clearly states
> that the host directory (i.e. the origin, the source) is created
> if missing, but it says nothing of the destination:
>     https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
