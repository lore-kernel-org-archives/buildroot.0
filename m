From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 20:00:08 +0100
Subject: [Buildroot] [PATCHv2] support/dependencies: detect and bailout
 when PATH contains spaces/TABs
In-Reply-To: <20210306091930.2186970-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 6 Mar 2021 10:19:30 +0100")
References: <20210306091930.2186970-1-yann.morin.1998@free.fr>
Message-ID: <87y2egpc1z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In Makefiles, variables are split, filtered, and otherwise mangled on a
 > space as a separator. In a shell, they will also be split on TABs.

 > We split and filter and iterate of variables in a lot of places, and
 > most importantly, spaces in PATH is very seldom tested, if at all, so a
 > lot of packages will not be working properly in such a situation.

 > For example, the config.guess contains constructs that are not resilient
 > to a space in PATH:

 >     PATH=$PATH:/.attbin ; export PATH

 > Also, our fakedate will iterate over PATH:

 >     for P in `echo $PATH | tr ':' ' '`; do

 > Those are only two cases, but the first means basically all
 > autotools-based packages are susceptible to subtle breakage.

 > Furthermore, Buildroot itself does not support that the top-level or
 > output directories are in a path with spaces anyway.

 > So, instead of chasing all cases that might be potentially broken,
 > let's just detect the case and bail out, like we already do when PATH
 > contains a \n, or when it contains the current working directory.

 > Reported-by: Dan Raymond <draymond@foxvalley.net>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - fix the newline case

 > ---
 > Notes: Dan had provided a patch [0] that would fix their own specific
 > issue when runing linux-menuconfig, but I believe this is by far
 > insufficient to properly solve the issues with spaces in PATH, and I
 > believe it can't be reliably fixed (at least not in the foreseeable
 > future with our available manpower), so I prefer that we detect the
 > situation and bail out.

 > [0] https://patchwork.ozlabs.org/project/buildroot/patch/16100eb6-bac8-2e4d-65f2-26333179f3b8 at foxvalley.net/

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
