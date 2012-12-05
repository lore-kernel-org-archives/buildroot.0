From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 05 Dec 2012 10:28:07 +0100 (CET)
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <50BEF3CB.1050502@mind.be>
Message-ID: <d3136d0b-4214-4033-82fa-be8adffe1aa8@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V3 is on the way....

I skip items I agree with and applied

> 
> > +config BR2_TARGET_ROOTFS_LIVE_DEST
> > +	string "live image location"
> > +	depends on BR2_TARGET_ROOTFS_LIVE
> > +	default "$(BINARIES_DIR)/live"
> > +	help
> > +	  The directory where the image should be stored.
> > +	  this directory will be emptied and recreated, it is given
> 
>   this -> This
> 
> > +	  relative to the buildroot output/images directory
> 
>   The second part of this statement is redundant (it's true for all
> paths in the config and is not mentioned anywhere else)
> 

and the whole thing is false since that path is now absolute (which makes more sense for NFS deployement)

unless you want me to make it relative again... I believe absolute (whith the possibility to use env vars to find the buildroot location) makes most sense but that might be worth discussing


> 
> > +endef
> > +
> > +define ROOTFS_LIVE_INIT
> > +  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not be
> > installed on the host system" ; false ; fi ; \
> 
>   This really should be checked in
>   support/dependencies/dependencies.sh.
> 

I didn't know about that file, but it seems to be more about dependencies for buildroot core than dependencies for a particular config option...

otoh it's the only place where we check for stuff installed on the host (not compiled for host, natively installed on host)

maybe the cleanest way to do it would be to have a virtual target

ROOTFS_DEPENDS=native-xxx

that would just check that "which xxx" exists on the system...

that's a different patch I could have a look at if people think it's a good idea (I am not good at makefile so I have no idea if it's one line of code or if i'm going into makefile hell here...)


> > +  if [ ! -t 0 ] ; then echo "live filesystem must be generated
> > interactively" ; false ; fi ; \
> > +  if [ ! -t 2 ] ; then echo "live filesystem must be generated
> > interactively" ; false ; fi ;
> 
>   Don't concatenate commands with \ but just start each command on a
>   new
> line starting with a tab.  (Of course, when you split the condition
> over several lines, then you have to use \).
> 

ok

>   This test is not actually correct, because sudo will use the
> controlling terminal (/dev/tty) to ask a password, i.e. it still
> works when input and output are redirected. It will however not
> work when there is no controlling terminal, e.g. when it's invoked
> directly from a window manager menu.  In addition, if an askpass
> program is specified, sudo doesn't even need a controlling terminal.
> 
>   So maybe it's better to drop the check after all. The sudo command
> itself will just fail with 'sudo: no tty present and no askpass
> program specified', which is clear enough.
> 

i'll test that

>   (I realize I asked for this check in the first place - but only
> idiots never change their mind :-)


fair enough, nobody gets the first idea on the first try

I could also run sudo with "fail instead of asking for a password" option, and have people add the proper line in the sudo config file to allow untar without password, but i'm not sure if it's better or worse

i'll probably wait for your answer before sending V3

Thx for the proofreading

Regards
J?r?my Rosen
