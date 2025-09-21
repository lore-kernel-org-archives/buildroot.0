Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A332CAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9514A83BCB;
	Sun, 21 Sep 2025 19:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPAR62py6NOe; Sun, 21 Sep 2025 19:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9441483BE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9441483BE5;
	Sun, 21 Sep 2025 19:14:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD100E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABC33413E5
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_jI3MtNdnFB for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 19:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D0B941350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0B941350
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D0B941350
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:13:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F12F260129;
 Sun, 21 Sep 2025 21:13:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Sep 2025 21:13:53 +0200
MIME-Version: 1.0
Date: Sun, 21 Sep 2025 21:13:53 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250920145653.301691-1-romain.naour@smile.fr>
References: <20250920145653.301691-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <65483a789e18826051d73455a08384a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758482035;
 bh=zHAhn+K0Ki6tfAV67I99zyqDhY+VW2IIbYHG70g7s50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wu8uSaSwAqEiO2kbhuMXH66pjQj6ZYnoMTqdYt2mdihFOo8UtQd8JEob50hyRuKR5
 VOjZ4+uttdlcTaod7zwyNTbV9Ox2+wndnXGFXI68ENZxUGinjY9iMe0AvRZDhB5u0R
 r9LHG2w8Yi6u4zsiyASlSqq2crtbpFp8XbPrGPJwO76dQKNCGajXHXoCFOiPw8E02G
 rSNpiu3TRbezHu+c2QhNk6VXyggXof9sw9//jDWFSH6LKlJfk0/WrEwuEVdSFCtU7K
 K17iZdS+31Tp0fw11qQc3v7hACQIQH1WT+UTWZ1eajmZ58dhC7wmBNGTXFiJdMYfCi
 dV24539yIBF8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wu8uSaSw
Subject: Re: [Buildroot] [PATCH] support/testing: GitTestBase: remove git
 daemon due to Gitlab-CI security settings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/09/2025 16:56, Romain Naour via buildroot wrote:
> TestGitHash and TestGitRefs are failing on Gitlab-CI since 2025-08-18
> (first runtime-test failures report for master) [1] due a new Gitlab-CI
> security settings that prevents the any use of localhost (127.0.0.1) on
> the Gitlab-CI runner [2]:
> 
> "To prevent exploitation of insecure internal web services, all webhook
>  and integration requests to the following local network addresses are
>  not allowed:
> 
>  Private network addresses, including 127.0.0.1, ::1, 0.0.0.0,
>  10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, and IPv6 site-local
>  (ffc0::/10) addresses."
> 
> Gitlab suggest using a second container as a Services [3] since each
> containers have access to one another and can communicate when running
> the job. But this is really not practical to run git daemon since the
> service is started before the Buildroot git tree is fetched and git
> daemon needs git-remote directory content.
> 
> See [4]:
> "If you have your service that tries to write to CI_PROJECT_DIR
>  immediately after it's started - it will not work and fail with an
>  error like '/builds/nknapp/gitlab-ci-test/': No such file or directory
>  error. Because that directory is most probably not there yet, as the
>  job step that creates it is yet to be executed!"
> 
> Also, using Gitlab-CI services requires to handle GitTestBase setUp
> differently on Gitlab-CI than local use of run-tests.
> So Gitlab-CI services is not an option.
> 
> We could move support/testing/tests/download/git-remote to our Gitlab
> group (https://gitlab.com/buildroot.org) but since it's only intended
> for testing the git download backend, we don't really want to do that.
> 
> So the only remaining choice to clone the repository from the Buildroot
> git tree (local machine).
> 
> To do so, we have to do the following changes:
> 
> - Replace all "git://localhost:$(GITREMOTE_PORT_NUMBER)" by
>   "$(GITREMOTE_DIR)". GITREMOTE_DIR will contain the absolute path to
>   tests/download/git-remote directory.
> 
> - Force to use git download backend using "SITE_METHOD = git" otherwise
>   the download infra will fall back using wget download backend.
> 
> - Cloning a git repository with submodules using the "file://" protocol
>   needs to be allowed from git config. It's disabled by default:
>   "fatal: transport 'file' not allowed"
>   Use a local gitconfig file generated by GitTestBase before starting
>   TestGitHash and TestGitRefs with:
> 
>   [protocol "file"]
>     allow = always
> 
>   This is considered safe since we are using a git repository from the
>   Buildroot git tree.
> 
> - Running TestGitHash and TestGitRefs on Gitlab-CI requires additional
>   git config settings to disable ownership check of the git tree [5].
> 
> Thanks to Arnout for advices about GIT_CONFIG_GLOBAL.
> 
> Runtime tested:
> https://gitlab.com/kubu93/buildroot/-/jobs/11428504450 (TestGitHash)
> https://gitlab.com/kubu93/buildroot/-/jobs/11428490035 (TestGitRefs)
> 
> [1] 
> https://lore.kernel.org/buildroot/68a3ee65.500a0220.397724.30db@mx.google.com/
> [2] 
> https://docs.gitlab.com/security/webhooks/#allow-requests-to-the-local-network-from-webhooks-and-integrations
> [3] https://docs.gitlab.com/ci/services/
> [4] 
> https://gitlab.com/gitlab-org/gitlab-runner/-/issues/25982#note_2139685797
> [5] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/a016b693f7830f3c8ae815851d3204b8b6e99821
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124174 
> (TestGitHash)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124173 
> (TestGitRefs)
> 
> Cc: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
