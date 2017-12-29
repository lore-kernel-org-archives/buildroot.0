From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 21:20:34 +0100
Subject: [Buildroot] [RFCv3 13/15] core: change host RPATH handling
In-Reply-To: <20171229173118.GP3176@scaer>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-14-thomas.petazzoni@free-electrons.com>
 <20171229173118.GP3176@scaer>
Message-ID: <20171229212034.416e8b23@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 18:31:18 +0100, Yann E. MORIN wrote:

> > In order to achieve this, the following changes are made:
> > 
> >  - HOST_LDFLAGS no longer contains -Wl,-rpath,$(HOST_DIR)
> > 
> >  - The hook that ran at the end of every package installation
> >    (check_host_rpath) to verify that our hardcoded RPATH is indeed
> >    present in all binaries is removed, as it is no longer needed: we
> >    will force $ORIGIN/../LIB as an RPATH in all binaries.  
> 
> Then you can just get rid of support/scripts/check-host-rpath that is
> now no longer used.

True.

> 
> >  - host-patchelf is added as a dependency of all packages, except
> >    itself. This is necessary as all packages now need to run patchelf
> >    at the end of their installation process.
> > 
> >    TODO: things like host-tar, host-lzip and host-ccache will have to
> >    be handled properly.  

In fact, this TODO was no longer accurate: I did take care of host-tar,
host-lzip and host-ccache as part of this RFCv3. However...

> Indeed, because the very moment that patchelf is available, the next
> package will trigger patchelf on all executables, which means that
> package will be responsible for touching files from previous packages,
> and thus will trigger the no-two-packages-should-touch-the-same-file
> check.

... I indeed didn't think of this problem. I see two possibilities to
address this:

 1. Have host-patchelf built earlier. I.e have only host-tar be a
    dependency of host-patchelf and nothing else (in my current patch
    series, host-patchelf is built after host-tar, host-xz, host-lzip,
    host-ccache). This requires using HOSTCC_NOCCACHE to build host-tar
    and host-patchelf, but I don't think it's a big deal. And then do a
    special case in fix-rpath to not fix the rpath of the tar program,
    since it should not have dependencies on libraries in HOST_DIR/lib

 2. Make the RPATH fixing logic smarter, and don't set a RPATH to
    $ORIGIN/../lib if the program doesn't use a library that is in
    HOST_DIR/lib. This is perhaps the most pretty solution.

> > This change is independent from the per-package SDK functionality, and
> > could be applied separately.  
> 
> Except it requires the host-tar et al. stuff to be handled first.

Which is why the host-tar and al. stuff is earlier. What I meant with
this sentence is that reworking the host RPATH handling can be applied
*before* we switch to per-package SDK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
