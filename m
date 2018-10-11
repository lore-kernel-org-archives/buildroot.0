From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 16:12:31 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <87efcwstjt.fsf@dell.be.48ers.dk>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf> <87y3b5ks97.fsf@tkos.co.il>
 <20181011085357.191cfccb@windsurf>
 <87efcwstjt.fsf@dell.be.48ers.dk>
Message-ID: <20181011161231.5d4bf9cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Romain Naour in Cc, since he added host-make to fix the glibc build.

On Thu, 11 Oct 2018 11:48:22 +0200, Peter Korsgaard wrote:

>  > Yes, I figured that out after sending my summary. I reproduced the
>  > issue on my build server, which has an old make installed system-wide,
>  > and this issue seems to appear only when host-make is built prior to
>  > boa. There's a mixup of make being used, with a new "make" used at the
>  > top-level, passing options unknown to the old "make" used at the
>  > lower-level.  
> 
> Ahh, yes. It looks to be the other way around though:

Yeah, maybe, I didn't look closely, and I assumed the old version of
make is the one that didn't support the --jobserver-fds option.
Apparently, it's the opposite.

> usr/bin/make -j6  -C /home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21/
> make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21'
> (cd src && make -w --jobserver-fds=5,6 -j)
> make: unrecognized option '--jobserver-fds=5,6'
> 
> So the issue is that we expand the path to make on the host in
> package/Makefile.in:HOSTMAKE but then host-make installs make into the
> path and build systems just calling make instead of looking at the MAKE
> variable (which boa does because of its gnumake check) ends up with
> host-make rather than the system one.
> 
> A quick fix would be to set BOA_MAKE to $(BR2_MAKE), but that is a bit
> of a hack.

Perhaps we need to think about a more global solution. How do we want
to use host-make ? If it's compiled, should it be used to build all
packages ? Should it only be used for glibc ? In the latter case, how
do we "hide" it from all packages, and make it used only by glibc ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
