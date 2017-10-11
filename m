From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:51:56 +0200
Subject: [Buildroot] [PATCHv3] flex: rework patches to avoid host/target
 difference
In-Reply-To: <20171008214423.11535-1-yann.morin.1998@free.fr>
References: <20171008214423.11535-1-yann.morin.1998@free.fr>
Message-ID: <20171011235156.5516323f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Oct 2017 23:44:23 +0200, Yann E. MORIN wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Currently, the target and host flex packages do not behave the same in
> terms of patching: the target variant has a patch hook that disables
> building the programs (because they are not needed, and do not build
> on no-MMU platforms). However, this hook is obviously not executed for
> host-flex, because we really want the host flex binary to be built.
> 
> In preparation for the introduction of out-of-tree package build, it
> is important that we don't do different things in the patch hooks for
> the target and host variant of a given package, because the source
> tree will be shared between the target and host builds.
> 
> To solve this, we introduce a --disable-program configure option,
> through a patch to the flex configure.ac and Makefile.am. This patch
> makes the current 0001-flex-disable-documentation.patch no longer
> needed.
> 
> Furthermore, building the documentation is a PITA: flex.1 depends on
> configure.ac and a few other files generated during the build. Touching
> flex.1 does not work, because automake will forcibly remove the files
> when its prerequisites are too old, so pre-requisites of flex.1 will
> always be more recent than flex.1. So, we add a patch that adds a
> --disable-doc configure option.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/f70/f70b39632535bb9692d0a032166b2f4104532967/
>     http://autobuild.buildroot.org/results/525/52567afdfe7992b3518de0e01227ba14aa300f21/
>     [...]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr:
>   - rebase on-top of master,
>   - add patch to not build the documentation, because simply touching
>     flex.1 is no longer enough.
>   - keep install in target/, for shared builds
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Adrian Perez de Castro <aperez@igalia.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v2 -> v3:
>   - keep install in target/, for shared builds

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
