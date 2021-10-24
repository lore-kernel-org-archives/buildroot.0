Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C2FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED4B60F45
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ED4B60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA93980F44;
	Sun, 24 Oct 2021 14:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pG78iT3Lh0F6; Sun, 24 Oct 2021 14:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0B580F41;
	Sun, 24 Oct 2021 14:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9C51BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E89E6066B
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NgJ2MWGHZYxu for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64A406081C
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:13:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 67EAD20007;
 Sun, 24 Oct 2021 14:13:03 +0000 (UTC)
Date: Sun, 24 Oct 2021 16:13:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211024161302.7d02a143@windsurf>
In-Reply-To: <20211020203816.128986-1-romain.naour@gmail.com>
References: <20211020203816.128986-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] gitlab-ci: use the Docker image from gitlab
 registry
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Oct 2021 22:38:16 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From [1]:
> "In November 2020, Docker introduced rate limits on pull requests from
> Docker Hub [2]. If your GitLab CI/CD configuration uses an image from
> Docker Hub, each time a job runs, it may count as a pull request."
> 
> Since then, some jobs in our gitlab-ci fail when this rate limits is
> reached [3].
> 
> To avoid this rate limit, move our Docker image from dockerhub to the
> registry provided by gitlab. Keeping the image from dockerhub would be
> possible by using dependency proxy [4] but the gitlab registry is good
> enough.
> 
> Tested on gitlab:
> https://gitlab.com/kubu93/buildroot/-/jobs/1694863584
> 
> [1] https://docs.gitlab.com/ee/user/packages/container_registry/index.html
> [2] https://docs.docker.com/docker-hub/download-rate-limit/
> [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590417
> [4] https://docs.gitlab.com/ee/user/packages/dependency_proxy
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
