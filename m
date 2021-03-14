From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:30:15 +0100
Subject: [Buildroot] [PATCHv2] support/dependencies: detect and bailout
 when PATH contains spaces/TABs
In-Reply-To: <20210306091930.2186970-1-yann.morin.1998@free.fr>
References: <20210306091930.2186970-1-yann.morin.1998@free.fr>
Message-ID: <20210314233015.1ef778f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Mar 2021 10:19:30 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> In Makefiles, variables are split, filtered, and otherwise mangled on a
> space as a separator. In a shell, they will also be split on TABs.
> 
> We split and filter and iterate of variables in a lot of places, and
> most importantly, spaces in PATH is very seldom tested, if at all, so a
> lot of packages will not be working properly in such a situation.
> 
> For example, the config.guess contains constructs that are not resilient
> to a space in PATH:
> 
>     PATH=$PATH:/.attbin ; export PATH
> 
> Also, our fakedate will iterate over PATH:
> 
>     for P in `echo $PATH | tr ':' ' '`; do
> 
> Those are only two cases, but the first means basically all
> autotools-based packages are susceptible to subtle breakage.
> 
> Furthermore, Buildroot itself does not support that the top-level or
> output directories are in a path with spaces anyway.
> 
> So, instead of chasing all cases that might be potentially broken,
> let's just detect the case and bail out, like we already do when PATH
> contains a \n, or when it contains the current working directory.
> 
> Reported-by: Dan Raymond <draymond@foxvalley.net>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - fix the newline case

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
