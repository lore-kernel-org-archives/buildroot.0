From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 10:02:22 -0300
Subject: [Buildroot] [PATCH] linux: don't add to toolchain dependency
In-Reply-To: <56CCF17D.2030508@mind.be>
References: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
 <20160222131901.3baa956e@free-electrons.com> <56CCF17D.2030508@mind.be>
Message-ID: <56CDA9DE.4000900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/16 20:55, Arnout Vandecappelle wrote:

>   Well, _PATCH_DEPENDENCIES already does that:
>
> # Order-only dependency
> $$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))
>
>
>   The problem identified by Gustavo doesn't happen in a normal build, it's only
> when you do make source. That's because for source we use:
>
> $(1)-all-source:        $(1)-source
> $(1)-all-source:        $$(foreach
> p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
>
>
>   I have to think a bit more about possible solutions. But the good thing is that
> it's less important: a normal build will still work without warning, and make
> source will also still work and have all the packages, it just has a warning
> that is not so nice. So if it doesn't get fixed for 2016.02 it's no disaster.

It's not only -source, any dependency-using routines are affected, 
legal-info, graph-depends as well as long as you build a kernel.
In fact graph-depends is broken:

$ make graph-depends
Getting targets
Getting dependencies for ['toolchain-buildroot', 'toolchain', 'busybox', 
'glibc', 'initscripts', 'linux-headers', 'skeleton', 'linux', 
'host-fakeroot', 'host-makedevs', 'rootfs-cpio', 'rootfs-initramfs']
Getting dependencies for ['host-kmod', 'host-gcc-final', 
'host-gcc-initial', 'host-gawk']
Getting dependencies for ['host-gmp', 'host-binutils', 'host-pkgconf', 
'host-mpfr', 'host-mpc']
Getting dependencies for ['host-m4']

Recursion detected for  : toolchain
which is a dependency of: linux
which is a dependency of: linux-headers
which is a dependency of: glibc
which is a dependency of: host-gcc-final
which is a dependency of: toolchain-buildroot
which is a dependency of: toolchain
Makefile:721: recipe for target 'graph-depends' failed
make: *** [graph-depends] Error 1

So it's not as innocent as you think.
Regards.
