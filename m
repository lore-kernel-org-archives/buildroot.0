From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 23:19:31 +0100
Subject: [Buildroot] [PATCH] makefile: remove LD_LIBRARY_PATH from the
 environment
In-Reply-To: <2575CFBB-8407-4C1A-8DF7-CD555F677EC9@free.fr>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
 <5645853A.3040002@mind.be>
 <2575CFBB-8407-4C1A-8DF7-CD555F677EC9@free.fr>
Message-ID: <20151113221931.GA3700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, Arnout, Peter, All,

+Peter on this, because it is important he reads Arnout's comments and
my reply about it (for once, I agree with Arnout! ;-] ).

On 2015-11-13 10:00 +0100, Yann E. MORIN spake thusly:
> On November 13, 2015 7:37:46 AM GMT+01:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>  On 29-10-15 03:48, Ben Boeckel wrote:
>   If system tools are selected, the host's lib/ directory may shadow
>   libraries from the system which are configured differently and do not
>   have all of the symbols required by the system tool.
>  
>   Since buildroot uses rpath everywhere, LD_LIBRARY_PATH should not be
>   necessary anyways.
>  
>   Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> 
>  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I've marked your patch as superseded in Pathwork, since I have now
included it in my series:
    http://lists.busybox.net/pipermail/buildroot/2015-November/144362.html

Thanks! :-)

>   As I mentioned in a discussion with Yann (don't remember if it was on IRC or on
>  the list), I think we should apply this now no master to see what the
>  autobuilders say. We currently break the build on Fedora 23 for any
>  configuration including libattr, which IMHO is worse than the (probably small)
>  number of host-tools that are missing rpath.

And we should normally no longer have any host tool missing an RPATH.
I have built all of them now, and the one that was broken wrt. rpath,
I fixed.

>   If we apply this patch _now_, we still have a few weeks to look at autobuild
>  results and handle the fallout.

And at worst, we can simply revert it. Even if the patch touches a
critical aspect of the build system, it is very well contained, so will
be very easy to revert at the last minute if need be.

>   Note that all the host tools that are mentioned in Config.in.host will have to
>  be tested manually. Anybody up for that? Also the boot loaders will have to be
>  tested manually since they're not handled by the autobuilders.

Ah, I forgot about the bootloaders... ;-/

However, for the host tools, here's what I did;

    $ git grep -l -E '^\$\(eval \$\(host-'    \
    |sed 'magic-to-extract-pkg-name'        \
    >host-pkg-list

    $ vi host-pkg-list  # remove gcc, binutils, gdb

    $ make $(cat host-pkg-list)

And after ~73min, all the host packages in the lit have been built, and
none were installing executables missing an RPATH when they are using
our host libs.

Note: openssl install libraries that are missing an RPATH: libssl.so and
all the engines libraries. But that's in practice not an issue, since
the executables that uses those libraries do have an RPATH (as they were
able to find those libs in the first place!) so they will also find the
dependencies of those libs.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
