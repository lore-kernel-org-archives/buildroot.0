From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:07:00 +0200
Subject: [Buildroot] [PATCH 1/2] build: add support for as-needed linking
In-Reply-To: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160920200700.1096bb21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:05:57 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> This option tells the linker to only link to the libraries containing
> symbols that are actually used.
> 
> It requires libtool patches to fully clean the needed chain, these are
> used by major distributions such as Debian and Gentoo.
> https://wiki.debian.org/ToolChain/DSOLinking
> https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed
> 
> Introduce a BR2_AS_NEEDED global enable option (default=no, marked as
> experimental) that generally disables the libtool patching and avoids
> the extra LDFLAGS (-Wl,--as-needed).
> 
> Also add a per-package PACKAGE_AS_NEEDED (default=yes) option to work
> around problematic packages that might not behave too well with
> as-needed linking.
> 
> For the libtool patching use a guess (automatic) method since
> version-matching doesn't work accurately with some packages that ship
> patched/modified ltmain.sh scripts, normally based on 2.4. In some of
> these cases the as-needed-v2.2.6.patch works, and in other cases the
> as-needed-v2.4.2.patch is necessary and the exact condition can't be
> found in a deterministic way. If for some reason none of the patches
> applies to a particular package this will only affect said package and
> shouldn't have any consequence even if passing -Wl,--as-needed LDFLAGS.

Just like Yann, I don't understand the usefulness of --as-needed
support. If a library A is not using symbols from a library B it is
linked against, why is library A linked against library B in the first
place ?

The way you present it makes me understand that --as-needed is a
workaround for broken package build systems, which end up producing
binaries (programs or libraries) incorrect linked to too many
libraries, that are in fact not all needed.

In addition to this, it is not really clear what are the benefits of
having less NEEDED entries (i.e practical number of performance
improvements). Since the complexity is quite huge for something that 1/
looks like a workaround and 2/ isn't associated to concrete performance
improvements, I don't think we want to merge this at this point.

Of course, feel free to come back with some more details on why
--as-needed is useful (why it's not a workaround, and prove it's really
useful in practice).

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
