From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 22:19:29 +0200
Subject: [Buildroot] [PATCHv3] core: enhance printvars
In-Reply-To: <20170329094305.18098-1-yann.morin.1998@free.fr>
References: <20170329094305.18098-1-yann.morin.1998@free.fr>
Message-ID: <20170329221929.760ef16b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 11:43:05 +0200, Yann E. MORIN wrote:
> Currently, the output of printvars copntains the name of the variable,
> its expanded value and its un-expanded value.
> 
> However, most of the time, we need the actual, expanded value, so it can
> be re-used from a (non-Buildroot) infrastructure script, like a
> post-build script, or a build-farm driver (e.g. a Jenkins job...)
> 
> Add two options that a user may set to change the output of printvars:
>   - QUOTED_VARS, if set, will quote the value
>   - RAW_VARS, if set, will print the unexpanded value
> 
> The new output by default only prints the expanded value now.
> 
> So that it can be used as such:
> 
>     $ make -s printvars VARS=BUSYBOX_VERSION
>     BUSYBOX_VERSION=1.26.2
> 
>     $ make -s printvars VARS=BUSYBOX_RDEPENDENCIES QUOTED_VARS=YES
>     BUSYBOX_RDEPENDENCIES='ncurses util-linux'
> 
>     $ make -s printvars VARS=BUSYBOX_FINAL_PATCH_DEPENDENCIES RAW_VARS=YES
>     BUSYBOX_FINAL_PATCH_DEPENDENCIES=$(sort $(BUSYBOX_PATCH_DEPENDENCIES))
> 
> And it is even possible to directly evaluate it in a shell script:
> 
>     eval $(make -s printvars VARS=BUSYBOX_VERSION QUOTED_VARS=YES)
> 
> Backward compatibility of the output is not maintained. It is believed
> that scripts that depended on the previous output were very fragile to
> begin with, because they had to filter the non-formatted output
> (splitting on spaces or braces was not really possible, because values
> could contain either).
> 
> Document printvars and its options in the manual; list it in the output
> of 'make help'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v2 -> v3:
>   - properly quote values with quotes in them  (Arnout)
>   - typo in manual  (Arnout)
>   - fix shell-eval example
>   - reword output of 'make help'

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
