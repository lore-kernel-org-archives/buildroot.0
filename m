Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA18C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 06:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32CD60C04;
	Fri, 13 May 2022 06:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxFxcKbUpxYM; Fri, 13 May 2022 06:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF10660736;
	Fri, 13 May 2022 06:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 663821BF577
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 06:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52C52402B1
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 06:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbnPVdPbyose for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 06:06:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 205F740141
 for <buildroot@buildroot.org>; Fri, 13 May 2022 06:06:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 39081100002;
 Fri, 13 May 2022 06:06:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npORc-0096Vt-6l; Fri, 13 May 2022 08:06:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
 <878rr6ahop.fsf@dell.be.48ers.dk>
 <d7ce3402-a37a-ca9b-52c5-1f85eeb79a7d@mind.be>
Date: Fri, 13 May 2022 08:06:32 +0200
In-Reply-To: <d7ce3402-a37a-ca9b-52c5-1f85eeb79a7d@mind.be> (Arnout
 Vandecappelle's message of "Fri, 13 May 2022 00:31:54 +0200")
Message-ID: <87wneq7yqf.fsf@dell.be.48ers.dk>
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
Cc: yann.morin@orange.com, Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> It indeed makes sense to split the entrypoint on white space, but
 >> for
 >> the args (cmd) it exchanges one set of breakage for another -
 >> E.G. sometimes people want to run sh -c "my shell logic goes here".
 >> I'm not sure what to do about that though. As you are not quoting
 >> the
 >> arguments you cannot even set it to stuff without white space but ith
 >> shell characters, E.G. ENTRYPOINT="sh -c" ARGS="date;date" as the ; gets
 >> enterpreted in the call to sloci-image.

 >  Do you mean

 > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="sh -c"
 > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="'date; date'"

Yes, exactly.


 > ? Yeah, we'd need a full quoting/splitting parse to support that. In
 > this particular case

 > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="date\;date"

 > would work, but it's kludgy.

 >  I do think it would help to put quotes around the options:

 > OCI_SLOCI_IMAGE_OPTS += $(patsubst %,--cmd '%',$(OCI_ENTRYPOINT_ARGS))

Yes, agreed. That atleast fixes the special shell characters (except for
' itself).


 >  That way, the usual cases (which Yann put in the commit message) are
 >  covered, but weird stuff is still possible as long as you pay
 > attention to spaces.

 >  If you really need spaces, you can still use $(space). So, after
 >  adding single quotes, the following should work:

 > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="date;$(space)date"

Nice and easy for newcomers :P


 >> In general I'm not sure how much value the oci support brings over just
 >> doing:
 >> docker import -c '<Dockerfile command>' output/images/rootfs.tar
 >> <name>:<tag>

 >  That requires a docker daemon installed on the host, while
 >  sloci-image can be run as normal user without any host support
 > required.

s/docker import/podman import/. With that said, wanting to build an OCI
image and not having access docker/podman is quite unlikely I think.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
