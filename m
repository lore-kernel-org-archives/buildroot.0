From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 00:34:54 +0200
Subject: [Buildroot] [RFC v1] Rework of RPC support to handle glibc >=
 2.14 and libtirpc
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <503D478E.4030400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/11/12 19:40, Thomas Petazzoni wrote:
> Hello,
>
> This set of patches reworks the RPC support to take into account newer
> glibc versions that do not provide RPC support. This is still a work
> in progress and this version is a RFC only.

  It looks pretty good though.

[snip]
>   * Patch 3 makes a naive rename BR2_INET_RPC to
>     BR2_TOOLCHAIN_HAS_NATIVE_RPC. This name better describes what it
>     means: whether the toolchain has or does not have RPC support (the
>     RPC support will later have the capability of being provided by
>     libtirpc, outside of the toolchain).

  This is probably done with an automatically with a script, right?  Then
I think you should include the script in the commit message.  That way,
it can easily be reproduced even if some new package started using
BR2_INET_RPC.


[snip]
>   * Patch 5 adds a package for libtirpc, with a bunch of patches to
>     make its compilation work properly on top of uClibc.

  Anything upstreamable?


>   * Patch 12 makes it possible to link nfs-utils against libtirpc. The
>     only thing worth mentionning is that I removed the select on
>     BR2_PACKAGE_PORTMAP. This select was not a build-time dependency,
>     but a run-time dependency, and nowadays, nfs-utils can work
>     together with rpcbind rather than portmap (which is deprecated).

  Maybe keep the select if LIBTIRPC is not selected, and select rpcbind
if it is.


>   * Patch 13 adds a package for rpcbind, the modern replacement for
>     portmap. This package directly selects libtirpc. Question: how
>     should it behave with toolchains having internal RPC support?

  Is it possible to compile rpcbind with internal RPC support?  In that case
I definitely think that case should be supported (and then portmap can be
deprecated).  I think you can use
	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

  Maybe the same pattern can be applied to the other RPC users (excluding
busybox, of course).  And in that case the BR2_RPC_SUPPORT_AVAILABLE
symbol isn't needed...

[snip]
>   * Patch 14 adds a small comment in portmap saying that rpcbind is the
>     newer replacement. Portmap doesn't link properly against libtirpc,
>     and it probably isn't worth fixing it. Question: should I mark
>     portmap as deprecated?

  Unless rpcbind works for native rpc, it shouldn't be deprecated.

[snip]
>   * Patches 18-20 add the latest Sourcery CodeBench toolchain for ARM,
>     x86 and SH4. Those glibc toolchains use glibc 2.15 and therefore do
>     not have RPC support.

  The help text about RPC should be the same for all three.  Actually there's
probably no need to mention RPC, the comments in the packages requiring RPC
are sufficient.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
