From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 1 Oct 2014 16:18:07 +0200
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <1280276802.26043432.1412172512257.JavaMail.root@openwide.fr>
References: <1723661717.26039623.1412168336757.JavaMail.root@openwide.fr>
 <1280276802.26043432.1412172512257.JavaMail.root@openwide.fr>
Message-ID: <CAM+bi4up=zDCRhJ-+LnVMWpALVoeaK4=V_pM=1ted1vkkRMhqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Jeremy

Well, maybe I went all crazy splitting everything for each project,
but there's some reason behind it.

My main project is destined to run in a very specific hardware, with
external devices that pass information to the system. A real example
is a GPS device.

On the other hand, I have a x86 machine which I use as a demo-machine
with no external hardware attached (no GPS, for example). This
requires that the information that is typically received from these
external devices must be emulated by some piece of software.

So, in my case, of course dl/ directoy is common, Config.in and
external.mk are shared. I believe local.mk can also be shared,
although in my current layout it is not. It seems possible that some
patches could be different, but I guess they could also be shared.

I need, however, to have different overlays, such as, for example, a
'gpsd' emulator can run instead of the real gpsd. I manage this with a
different inittab file and different configuration files that I place
on each project's overlay. Alongside this trivial differences, I must
load into the demo-machine some big files (a couple of GB) that
emulate the data that, in the real machine, is received from external
sources. These files would not even fit on the storage of the real
machine.

Well, all in all, I think only the overlays may need to be different,
so there's that.

Regards


2014-10-01 16:08 GMT+02:00 Jeremy Rosen <jeremy.rosen@openwide.fr>:
>
>
> Looking into it a bit deeper, I have a couple of questions for you..
>
> in your current layout
>
> * BR2_EXTERNAL is shared, so Config.in is shared and external.mk
> is shared
> * each project has its own overlay
> * each project has its own local.mk
> * each project has its own patch subdirectory...
> * dl is shared
>
> so I need to understand your use-case a little more.
> As I said my use case is "same project, but different hardware" so
> my favorite layout would be
>
> * shared BR2_EXTERNAL
> * shared overlay
> * shared patches
> * different config files
> * don't care about local.mk, might as well make it different
>
> This layout makes more sense to me (shared overlay and shared patches)
> but I want to make sure it fits your use-case before I do the change
>
> It makes little sense to me to have completely different projects
> which are just sharing dl/ since dl is not saved in git and it's
> more handy to have completely separate git repo in this case...
>
>
> If you can tell me a little more, I'll see how I adapt this...



-- 
?lvaro G?mez Machado
