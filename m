From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 03 Dec 2012 14:42:03 +0100 (CET)
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <20121203140758.25732492@skate>
Message-ID: <70774b99-43cc-46e9-a3ad-f9f9addb06da@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > +
> > +define ROOTFS_LIVE_CMD
> > + sudo rsync -a --no-o --no-g --delete-during $(TARGET_DIR)/
> > $(BR2_TARGET_ROOTFS_LIVE_DEST)/
> > +endef
> 
> Do we really want to include sudo commands in Buildroot? I'm not sure
> we want.

that's the question I wanted answered by sending this patch early... I'm still quite new in this community and I am not sure how the buildroot philosophy is seen

note that I check for buildroot properly in the PRE_GEN_HOOKS and that I don't try to install host-sudo (which is not possible anyway)

I personally think that building target/ with sudo instead of fakeroot would be a stupid idea, but that's not what this patch does. This patch simply adds a new optional target to ease NFS deployment,

> 
> What about instead a post-image script hook, that users can use to
> extract automatically the tarball image somewhere?
> 

yes, that would work too, I can do that locally to solve my particular problem, but I don't think you would accept it upstream either. If you consider that deploying the live filesystem is not buildroot's job, fine I'll probably do it with post-build scripts instead, but I personally believe that NFS is the most common target and that doing it in buildroot-core is more convinient and makes more sense

pos-install scripts needs to be rewritten by each user, and doing it manually is a bit error prone (especially if you have lots of devs sharing a buildroot project through git, you can have weird side effects with people not cleaning before deplying the new FS) 


again, I personally think this use-case makes sense, especially in big teams where some members don't want to learn what NFS is (yeah, sounds stupid, but it does happen) and I don't think there are any major drawback (we test sudo properly, we only call it for a specific use-case where it is really needed) except the philosophical question of "should a build tool use a tool giving root-priv like sudo" which in the case of NFS doesn't change much since the user will have to use it himself (either directly or trough post-image script). 

I'd really think it makes sense in a "type make, reboot the target, test your change" philosophy which matches really well the idea behind NFS based developement, but it's your call as with any core change...

Regards
J?r?my


> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 
