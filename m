From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Nov 2018 14:44:03 +0100
Subject: [Buildroot] [PATCH 4/4 v2] support/dependencies: add a check
 for a suitable gzip
In-Reply-To: <CANQCQpY9KckNd=VjAu7AHuUeURoCRhY=5gP-wfOf_-Kog0e-sg@mail.gmail.com>
References: <cover.1542474939.git.yann.morin.1998@free.fr>
 <ba548d03f79279b7f02605006a709ffc630e8639.1542474939.git.yann.morin.1998@free.fr>
 <CANQCQpY9KckNd=VjAu7AHuUeURoCRhY=5gP-wfOf_-Kog0e-sg@mail.gmail.com>
Message-ID: <20181118134403.GB2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2018-11-17 11:23 -0600, Matthew Weber spake thusly:
> On Sat, Nov 17, 2018 at 11:16 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Add a dependency check that ensures that gzip is not pigz. If that is
> > the case, define a conditional dependency to host-gzip, that is used as
> > a download dependency for packages that will generate compressed files,
> > i.e. cvs, git, and svn.
[--SNIP--]
> (Not wanting to hijack the intent of this patch :-) )
> As part of a reproducible build, why should we conditionally build
> these dependencies and not instead always build them.  Then builds
> start become reproducible with the same cached dl folder of material
> across a series of distro releases?  Best example I have is a product
> that is under development for 2-3years and we may have a spread of
> build machine distros (ie Ubuntu 14 -> 18 LTS).  We've recently
> started to run into this as products stabilize with the Buildroot
> concept of having these conditional host dependencies building.  Where
> depending on the machine, we may miss a source archive in our
> collection of dl material at release time.  Thoughts?

So, two things, that are contradictory one to the other:

 1- we want reproducible builds,
 2- we want fast builds

For 1, it would mean that we should build as much tools as possible.
However, the more we build, the slower the build is.

For 2, we should rely as much as possible on distro-provided tools,
However, the more we rely on the host, the less reproducible we get.

gzip has been rock stable over the years. IIRC, I took one of the first
releases from way back 1993-or-so, and the latest one, 1.9; they were
generating the exact same output, 25 years apart! That, is stability.

Given the goals of the gzip authors and maintainers, I don't expect they
change anything to it anytime.

So, we really don't want to build it if the host provides it.

Now, we can't know what the future will be, and we can't predict what
other tool is gonna change its behaviour, that we have to build our
own. So, when you update to a newer host, you'll also have to adapt,
even if that means adding a few new archives to your BR2_DL_DIR, yes.

If you want to be sure that, in the future, you'll be as reproducible as
possible, then do a chroot. Even now, having a chroot ensures that all
users/developpers of your project have a known and reproducible devel
environment (no more "it builds for me" arguments!) You may even go
further, and mandate a VM, and even go as far as having HW spares for
the project lifetime (to run the VM on!).

As for Buildroot, I guess we're going to continue relying on the host
tools when they meet our expectations.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
