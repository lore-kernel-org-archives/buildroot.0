From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 25 Nov 2016 11:22:48 +1100
Subject: [Buildroot] Analysis of build results for 2016-11-23
In-Reply-To: <20161124094429.4152c19b@free-electrons.com>
References: <20161124073011.C2C1620BD5@mail.free-electrons.com>
 <20161124094429.4152c19b@free-electrons.com>
Message-ID: <20161125002248.GA3200@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 24, 2016 at 09:44:29AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Christian, Waldemar, Sam, Bernd, Alexey, Vlad, Vicente, J?rg, Fran?ois,
> please see below, there are some questions for you.
> 
> Summary of the build failures:
> 
>  - musl related:		8
>  - misc:			7
>  - static linking:		4
>  - PowerPC64le libtool:		2
>  - ARC related:			2
>  - uClibc-ng related:		1
>  - unknown:			1
> 
> So musl continues to be a pain to support, causing the biggest number
> of build failures...
> 
> On Thu, 24 Nov 2016 08:30:11 +0100 (CET), Thomas Petazzoni wrote:
> 
> >      powerpc |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973
> 
> unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
> 
> Waldemar, this is with uClibc-ng, and it seems like a relatively recent
> problem. Any idea?
> 
> >  powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/e14320a728975f2411451324739c8f30855d56b5
> 
> The usual PowerPC64le issue with libtool.

Yep.

> >         i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/57446ad0e01a77710d2f986272b178de4f5dea51
> 
> The usual musl/i586/SSP issue.
> 
> >       x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/42037d00edf075117f31d5199c77577eb31bc783
> 
> I don't see what the error is. Christian, could you try to reproduce
> and investigate?
> 
> >  powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ba9a69e70127ae22be02561b1bf600b101fef541
> 
> Sam, is this also the libtool issue, or something else?

I think so. It builds fine for me using the generic fix.

> >          arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/3e0f5d0b5f6241ca2dc0627e2566d9cd7c9f5658
> 
> Checking for 'gbm'                       : not found 
> The configuration failed
> 
> Bernd, could you have a look at this?
> 
> >          arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e8593a8ebf2f05cc93235a8129a2ba8b839d6d90
> >          arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/ff766f4f514c9cb4891873167f4e9b7870051883
> 
> error: 'memory_order_seq_cst' was not declared in this scope
> 
> Alexey, Vlad, could you have a look?
> 
> >    powerpc64 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f58ec73d906a5da49a88ed78492e3b5bf8cecdd4
> 
> Sam, maybe this indicates I should have applied your qemu patch on
> master and not next?

Yes, it would fix this failure.

> >          arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/cfde9ffd87d95e956b3359d1ad7522366c9336de
> 
> Seems to be a real timeout, so nothing to worry about.
> 
> >          arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/7f9f1143cbd8700c8d5a3360373bd11fcf3d3821
> 
> Usual musl issue. Vicente, you already looked at net-tools recently,
> could you look into this?
> 
> >         i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/750c9bcc753e2c1b7b05d6c43fabf4c405e15f04
> 
> checking for python module: numpy... no
> configure: error: failed to find required module numpy
> make: *** [/home/peko/autobuild/instance-2/output/build/ola-0.10.2/.stamp_configured] Error 1
> 
> J?rg, you have updated the ola package recently, could you have a look?
> Also, if you're interested in ola, could you add yourself in the
> DEVELOPERS file for it? The original submitter, who is mentioned in the
> DEVELOPERS file, doesn't seem to be responsive.
> 
> >         i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/83f389d6ace773f4d9b1f7db236f6dbeebee911b
> >         i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/0a9c3b18d01f5c5cad34b86888557cbcf91672c7
> >         i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/c3c96788d37fa14e0ccf034f85771d6ad2692f56
> 
> The musl/i586/musl issue.
> 
> >    powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/314446eb6824277187ce3e2a7285226d67f731f5
> 
> checking for perfmon/pfmlib.h... no
> configure: error: pfmlib.h not found; may be provided by libpfm devel or papi devel package
> 
> Sam: we currently have:
> 
> 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
>         # libpfm4 is needed on PowerPC, and requires thread support
>         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
> 
> Perhaps we need to also select libpfm4 on powerpc64 (and le) ?

It looks like we do. I tried a build of oprofile on powerpc64le and it fails as above unless pfmlib is present. It will almost certainly be the same on powerpc64. Would you like me to send a patch?

> >          arc |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/34d8fd6f3e137bdfbe7c4ccc9061059282773df6
> 
> /home/peko/autobuild/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libgdbm.a(gdbmerrno.o): In function `gdbm_strerror':
> /home/peko/autobuild/instance-2/output/build/gdbm-1.12/src/gdbmerrno.c:71: undefined reference to `libintl_dgettext'
> 
> That's a static linking issue. Fran?ois, could you have a look?
> 
> >       x86_64 |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/3aa3edd71c0a0c879939191b750d07bd9e868797
> 
> Static linking issue in polarssl, but Gustavo wants to remove polarssl,
> so I guess he won't be very interested in fixing build issues with it.
> 
> >       xtensa | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/818b564a6e23bcecf4afc7e53811227b08e5f4eb
> >          arc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/0b6c2d7c63329f5e790f02ccd29f14a317eadc71
> >         mips | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/ac552b63c6fb099a136066cda421f68e639808fa
> 
> Arnout, those issues are introduced by your recent changes to the
> qextserialport package. Could you have a look?
> 
> >          arm |                       tar-1.29 | NOK | http://autobuild.buildroot.net/results/6c06943f6e08ad3d910206abf9b9ec96d67afc3e
> 
> quotearg.c:(.text+0x12cc): multiple definition of `quote'
> /home/peko/autobuild/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libacl.a(quote.o):/home/peko/autobuild/instance-2/output/build/acl-2.2.52/libmisc/quote.c:27: first defined here
> collect2: error: ld returned 1 exit status
> 
> Requires a symbol renaming.
> 
> >       x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/5aa6df0d88b55e44175cb28a96925b7b094284e3
> 
> sendpacket.c:152:13: error: conflicting types for 'socklen_t'
>  typedef int socklen_t;
> 
> Usual musl related issue...
> 
> >          arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/18ae43d13038f74a39cb1da10a3e54e7e9c204f9
> 
> Another static linking issue:
> 
> /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgpg-error.a(libgpg_error_la-init.o): In function `_gpg_err_init':
> init.c:(.text+0xc): undefined reference to `libintl_bindtextdomain'
> 
> >         i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/372ca24077b17ba1a9829e817dd73e852b12fb05
> 
> Musl issue.
> 
> >          arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/baea66ac57aa34c7d7bdc993544c0f010fee4a9b
> 
> Musl issue.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
