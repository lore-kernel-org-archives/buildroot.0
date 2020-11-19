From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2020 23:25:41 +0100
Subject: [Buildroot] [PATCH 0/7] support/download: reproducible archives
 whatever tar version (branch yem/dl-git-tar-pax)
In-Reply-To: <20201119225327.48a2a6d2@windsurf.home>
References: <cover.1605821010.git.yann.morin.1998@free.fr>
 <20201119225327.48a2a6d2@windsurf.home>
Message-ID: <20201119222541.GN771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-11-19 22:53 +0100, Thomas Petazzoni spake thusly:
> On Thu, 19 Nov 2020 22:23:47 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Yann E. MORIN (7):
> >       core/pkg-infra: prepare for alternate default source archives
> >       WIP: support/download: change format of archives generated from git
> >       WIP: boot+packages: update hash to new git-tarballs format
> >       WIP: support/testing: update git-hash checks with new archive format
> >       support/download: change format of archives generated from svn
> >       support/dependencies: drop check for maximal tar version
> >       package/tar: drop specific version for host variant
> 
> I reviewed the series, and overall it looks good to me. Of course, I
> haven't actually tested/verified that the new magic set of tar options
> makes things reproducible, but it seems like the amount of research on
> this has been significant.

There is a Makefile as a post-commit note in patch 2, that can be used to
reproduce the experiment.

I highly suggest anyone to test that in their own setup as well, to
gather more data points on reproducibility.

> The only thing that bothers me a bit is that this series uses the
> one-time bullet of switching from .tar.gz to .tar.xz, and I'm wondering
> if we will not have other situations like this, and we won't have much
> solution as we would already be using .tar.xz.

We could still switch to lzo, lz4, lz, bz2, tbz2, and closing the loop
with tgz, giving us 6 more extensions, and thus openning 6 more
switching opportunities!

(Just kidding.)

> Just in my Go/Cargo vendoring, I'm encountering a similar problem: due
> to the vendoring, the tarballs are changing and so are their hashes.
> Since only two packages are impacted, I'm using the trick of bumping
> them at the same time as I enable vendoring for them. But perhaps it
> would be better to have a mechanism to support having different
> tarballs for the same package ? I'm not sure how that would work
> really, I don't have any clear idea.

I am not so sure we would have such a big breakage in the near future.
Near, as in the next twwo to three years, that is (but heck, with those
package managers and the new cool kidz on the block, who knows what's
coming next month, even less soo next year...)

Alternatively, if we want to envision this, then we will have no
alternative than to add a post-version string, like most distribution
do, to add after the version and before the extension.

    foo-1.2.3.tar.gz                        # Current state

    foo-1.2.3_br-vendored.tar.gz            # Cargo vendored

    foo-1.2.3_br-vendored-fixed.tar.gz      # We fixed a corner case in our cargo infra

    foo-1.2.3_br-vendored-fixed-recursive.tar.gz    # We extend our Cargo infra to recurse
                                                    # into vendored sub-modules located on
                                                    # the HTTP4 remote server over TOR with
                                                    # the distributed DOHoTOR name resolver

    foo-1.2.3_4.tar.gz      # We got lazy when further extending the infra.

You get the idea. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
