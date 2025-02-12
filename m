Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE71EC02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 12:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30F53405E6;
	Wed, 12 Feb 2025 12:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yb7fHf7vxQGW; Wed, 12 Feb 2025 12:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B5340591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B5340591;
	Wed, 12 Feb 2025 12:32:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87792C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 12:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 831E884700
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 12:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5lwbK-4lX9Y for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 12:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 275A8846F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275A8846F8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 275A8846F8
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 12:32:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22D684333B;
 Wed, 12 Feb 2025 12:32:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tiBuk-00AbFp-1h;
 Wed, 12 Feb 2025 13:32:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250210205716.599848-1-romain.naour@smile.fr>
Date: Wed, 12 Feb 2025 13:32:26 +0100
In-Reply-To: <20250210205716.599848-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Mon, 10 Feb 2025 21:57:16 +0100")
Message-ID: <875xlf1gyt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeevjeeuheevheefgeeviefhjeeujeejgeehheejiedvgeegiefgueevjefhudduleenucffohhmrghinhepughotghkvghrrdgtohhmpdhgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/docker: prepare for Aarch64 Docker
 images
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > With the new 'buildx' command using 'BuildKit' since Docker 23.0 [1],
 > it become easy to build the same image for several architectures [2].
 > The only requirement is to use a Dockerfile without any architecture
 > specific definition.

 > Since our current Dockefile contains already some i386 specific
 > packages (g++-multilib,libc6:i386) to provide x86 32bits support,
 > we have to install them conditionally.

 > Update the build process described in the Dockerfile accordingly.

 > For now, Aarch64 hosts can't be used by the Buildroot testsuite (yet)
 > since the Bootlin external toolchain (used by default) currently only
 > support x86_64 hosts.

 > [1] https://docs.docker.com/engine/release-notes/23.0/
 > [2] https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/
 > [3] https://www.docker.com/blog/multi-arch-build-what-about-gitlab-ci/

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > Tested on my Buildroot personal fork using the buildroot/base:20250209.1423:
 > https://gitlab.com/kubu93/buildroot/container_registry/2394843

 > I used my new BeaglePlay board (aarch64 based SoC) with the pre-installed
 > Debian image (with Docker installed) to fetch the arm64 image using
 > utils/docker-run. But due to the eMMC size, I was not able to perform any
 > complete build.

 > Now that the arm64 image is working, I tested it with Gitlab-CI to build
 > one of qemu defconfig (qemu_riscv64_virt_defconfig):

 > To build with an arm64 host, a job needs contain a 'tags' property using
 > the label defined by the arm64 runner. Otherwise an x86_64 runner is
 > used by default.

 > Likely gitlab provide several runners (even for the free Tier)
 > - saas-linux-small-amd64
 > - saas-linux-small-arm64

 > Here a pipeline example where the qemu_riscv64_virt_defconfig was build
 > twice in parallel on amd64 and arm64 host:
 > https://gitlab.com/kubu93/buildroot/-/pipelines/1662949264

 > qemu_riscv64_virt_defconfig: [saas-linux-small-arm64]
 >   Duration: 78 minutes 39 seconds

 > qemu_riscv64_virt_defconfig: [saas-linux-small-amd64]
 >   Duration: 94 minutes 29 seconds

Committed, thanks - And container image rebuilt, repushed and verified
on a Hetzner instance:

./utils/docker-run uname -a
Linux arm 6.1.0-31-arm64 #1 SMP Debian 6.1.128-1 (2025-02-07) aarch64 GNU/Linux

And on my laptop:

./utils/docker-run uname -a
Linux dell 6.1.0-28-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.119-1 (2024-11-22) x86_64 GNU/Linux


> ---
 >  support/docker/Dockerfile | 26 +++++++++++++++++++-------
 >  1 file changed, 19 insertions(+), 7 deletions(-)

 > diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
 > index 8b8a478f66..93044eb7fd 100644
 > --- a/support/docker/Dockerfile
 > +++ b/support/docker/Dockerfile
 > @@ -1,7 +1,9 @@
 >  # This Dockerfile generates the docker image that gets used by Gitlab CI
 > -# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
 > -#   docker build -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM support/docker
 > -#   docker push registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
 > +# To build it for arm64 and amd64 (YYYYMMDD.HHMM is the current date and time in UTC):
 > +#   docker buildx create --use
 > +#   docker buildx build --platform linux/amd64,linux/arm64/v8 \
 > +#       -t registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM \
 > +#       --push support/docker
 
 >  # We use a specific tag for the base image *and* the corresponding date
 >  # for the repository., so do not forget to update the apt-sources.list
 > @@ -21,9 +23,20 @@ ENV DEBIAN_FRONTEND noninteractive
 >  # This repository can be a bit slow at times. Don't panic...
 >  COPY apt-sources.list /etc/apt/sources.list
 
 > +# Install 32bit variant on x86_64 image.
 > +RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
 > +    dpkg --add-architecture i386; \
 > +fi
 > +
 >  # The container has no package lists, so need to update first
 > -RUN dpkg --add-architecture i386 && \
 > -    apt-get -o APT::Retries=3 update -y
 > +RUN apt-get -o APT::Retries=3 update -y
 > +
 > +RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
 > +    apt-get -o APT::Retries=3 install -y --no-install-recommends \
 > +        g++-multilib \
 > +        libc6:i386; \
 > +fi
 > +
 >  RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
 >          bc \
 >          build-essential \
 > @@ -35,9 +48,8 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
 >          cvs \
 >          file \
 >          flake8 \
 > -        g++-multilib \
 > +        g++ \
 >          git \
 > -        libc6:i386 \
 >          libncurses5-dev \
 >          locales \
 >          mercurial \
 > -- 

 > 2.48.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
