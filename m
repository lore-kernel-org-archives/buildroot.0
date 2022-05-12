Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 15:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00CEC40C0B;
	Thu, 12 May 2022 15:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyo0uUjfKwsc; Thu, 12 May 2022 15:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC5F405CD;
	Thu, 12 May 2022 15:34:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9672A1BF336
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 845EA41994
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 15:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgDyJLmdBxiM for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 15:34:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7A0041909
 for <buildroot@buildroot.org>; Thu, 12 May 2022 15:34:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CD14E0007;
 Thu, 12 May 2022 15:34:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npApS-008K2w-K6; Thu, 12 May 2022 17:34:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
Date: Thu, 12 May 2022 17:34:14 +0200
In-Reply-To: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
 (yann morin's message of "Tue, 10 May 2022 14:34:20 +0200")
Message-ID: <878rr6ahop.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > The prompt and variable name for the OCI "entrypoint arguments" are
 > somewhat incorrect. Indeed, they are in fact use to set the image
 > "command". Yet, using "command" would be confusing too, because the
 > interplay between entrypoint and command is tricky [0].

 > TL-DR; when both entrrypoint and command are set, command acts as

s/entrrypoint/entrypoint/

> arguments passed to the entrypoint.

 > Additionally, we currently can only pass a single item as either
 > entrypoint or command. This precludes passing actual arguments to the
 > entrypoint, or passing multiple arguments as command.

 > For example:
 >     BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="/bin/tini -g -p SIGTERM --"
 >     BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="/usr/bin/env sh"

 > generates an images with (only relevant fileds are included below):

s/fileds/fields/

 >     {
 >         "config": {
 >             "Entrypoint": [ "/bin/tini -g -p SIGTERM --" ],
 >             "Cmd": [ "/usr/bin/env sh" ]
 >         }
 >     }

 > This is obviously incorrect, and not what one would expect:

 >     {
 >         "config": {
 >             "Entrypoint": [ "/bin/tini", "-g", "-p", "SIGTERM --" ],
 >             "Cmd": [ "/usr/bin/env", "sh" ]
 >         }
 >     }

 > Fix that by passing as-many --entrypoint or --cmd as there are
 > space-separated items in the corresponding lists.

 > [0] https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Sergio Prado <sergio.prado@e-labworks.com>
 > Cc: Matthew Weber <matthew.weber@collins.com>
 > ---
 >  fs/oci/oci.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
 > index aa81920d36..f98db0a8c8 100644
 > --- a/fs/oci/oci.mk
 > +++ b/fs/oci/oci.mk
 > @@ -15,13 +15,13 @@ OCI_SLOCI_IMAGE_OPTS += $(and $(GO_GOARM),--arch-variant v$(GO_GOARM))
 >  # entrypoint
 >  OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
 >  ifneq ($(OCI_ENTRYPOINT),)
 > -OCI_SLOCI_IMAGE_OPTS += --entrypoint "$(OCI_ENTRYPOINT)"
 > +OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--entrypoint %,$(OCI_ENTRYPOINT))
 >  endif
 
 >  # entrypoint arguments
 >  OCI_ENTRYPOINT_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS))
 >  ifneq ($(OCI_ENTRYPOINT_ARGS),)
 > -OCI_SLOCI_IMAGE_OPTS += --cmd "$(OCI_ENTRYPOINT_ARGS)"
 > +OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--cmd %,$(OCI_ENTRYPOINT_ARGS))

It indeed makes sense to split the entrypoint on white space, but for
the args (cmd) it exchanges one set of breakage for another -
E.G. sometimes people want to run sh -c "my shell logic goes here".

I'm not sure what to do about that though. As you are not quoting the
arguments you cannot even set it to stuff without white space but ith
shell characters, E.G. ENTRYPOINT="sh -c" ARGS="date;date" as the ; gets
enterpreted in the call to sloci-image.

In general I'm not sure how much value the oci support brings over just
doing:

docker import -c '<Dockerfile command>' output/images/rootfs.tar <name>:<tag>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
