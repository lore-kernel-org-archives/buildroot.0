From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 30 Nov 2012 10:00:54 +0100 (CET)
Subject: [Buildroot] [PATCH][RFC] new target: live filesystem
In-Reply-To: <50B7F33D.7010309@mind.be>
Message-ID: <562cc553-df41-41c1-8eed-288cd2456605@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > * no dependency on host-sudo, i'm not sure how to add that
> 
>   That's impossible. The sudo executable must be setuid root, and to
>   make
> it setuid root you have to be root, so sudo must already exist...
> 
>   You could instead add a check in live.mk if sudo actually works.
>    But since
> sudo may ask for a password this can get tricky - you should e.g.
> probably check
> if stdin is a terminal as well.
> 

hmm, good point... I hadn't thought of that i'll add a check for that 

>   That said, I don't know if Peter will accept running sudo within
>   buildroot.
> 

:) yes, that's why I wanted some feedback early...

I think running sudo only for the deployment of the FS is isolated enough to be worth it (it's not like I'm getting rid of fakeroot or anything, it's just to ease the final step of NFS work)

but yes, if that patch is rejected because of philosophical reasons, it would be nice to know early

> 
> > * filesystem can only be under output/images at this point
> 
>   That's not good but easy to solve.
> 

yes that was one of the "first draft not ready for commit" aspect :)

you suggest in the commented patch below to use an absolute path...

I like the idea, if I add a line to the help text hinting that $(WHATEVER) can be used to point to output/image it's probably good enough


only answering the remarks which i'd like to discuss below, I agree with all the others

> > +	depends on BR2_TARGET_ROOTFS_LIVE
> > +	default "live"
> 
>   Use an empty default, and give an error in live.mk if it's
> empty.
> 

I don't like to provide a non-working default (esp since most/all other fs targets work out of the box) 

why not provide one (i'm perfectly fine with another name)

if this project is ok with non-working defaults i'll go that way, but it's simple enough to provide a default under output/images so i'm not sur why not do it...

> > +
> > +define ROOTFS_LIVE_CMD
> > + sudo cp -r $(TARGET_DIR)/*
> > $(BINARIES_DIR)/$(BR2_TARGET_ROOTFS_LIVE_DEST)/
> 
>   That won't work, because device nodes, symlinks etc. are not
> copied correctly.  Use cp -a.  Or even better, rsync -a
> --delete-during
> (then you don't need to remove it first).
> 
>   For the target, just use $(BR2_TARGET_ROOTFS_LIVE_DEST).
> 

ok, i'll check all those cp/rsync options I don't know...


V2 of the patch is under way and will be posted soon

Regards

J?r?my
