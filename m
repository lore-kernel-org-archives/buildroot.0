From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jan 2018 19:18:20 +0100
Subject: [Buildroot] [PATCH v2 01/13] pkg-{download,
 generic}: remove source-check
In-Reply-To: <CAAXf6LXwWBpJeosSW=B5J50f_aVO8OUvCD7E8F9M_GgSOcta-w@mail.gmail.com>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-2-ps.report@gmx.net>
 <20180108212827.4d876213@windsurf>
 <CAAXf6LXwWBpJeosSW=B5J50f_aVO8OUvCD7E8F9M_GgSOcta-w@mail.gmail.com>
Message-ID: <20180110181820.GB4296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2018-01-10 13:04 +0100, Thomas De Schampheleire spake thusly:
> 2018-01-08 21:28 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> >> ---
> >>  Makefile                |  7 +------
> >>  package/pkg-download.mk | 44 --------------------------------------------
> >>  package/pkg-generic.mk  | 14 +-------------
> >>  3 files changed, 2 insertions(+), 63 deletions(-)
> >
> > Applied to master, thanks.
> 
> I saw this on the agenda of the FOSDEM developer days, so thought it
> would be discussed there before going forward with applying this. I
> should have expressed my concerns on the patch immediately, sorry.
> 
> In fact, just recently I did start using 'make source-check' in our
> environment. There are two use cases:
> 1. Our Buildroot tree contains a few packages with in-house source
> code. They are typically Mercurial repositories. A developer changing
> code in such a repository is expected to push to that repository and
> then update the revision hash in the Buildroot .mk file (or if it
> concerns a Linux/Uboot tree in the defconfig file).
> Now, it sometimes happens that people update the hash but forget to
> push the corresponding changes to the package's repository. This is of
> course human error. In our delivery system (where people don't push
> directly to the main repo but rather to some staging area where
> changes are first automatically validated), it would be caught by
> making a build, but this takes quite some time, order of 1 hour (we
> have many defconfigs). Hence, we added an initial check to our
> delivery system that just performs 'make source-check' for all
> defconfigs. This only takes a few minutes. Deliveries that fail the
> check are thus rejected very quickly and no computing resources are
> lost.
> 
> 2. Besides the in-house repositories, there is a use case even for
> normal open-source packages. We have an internal BR2_PRIMARY_SITE set
> up, that avoids package downloads over the internet. As we need to
> guarantee reproducibility over a long time span, we cannot rely on
> external sources and we need to mirror all packages used to that
> primary site. Developers that enable new packages (or bump one) are
> expected to upload the new sources to the primary site, but again may
> forget to do so.
> Again, this would be caught by the build step that takes ~1 hour,
> while the source-check target would detect it in minutes.
> 
> Doing a 'make source' rather than 'make source-check' is an
> alternative, but it takes longer and consumes much more network
> bandwidth.
> 
> I would therefore like to find a way to reintroduce 'make
> source-check', but of course taking into account the reasons of
> removing it in the first place. Perhaps another implementation can be
> found using the dl-wrapper.
> 
> Thoughts?

The way I haved solved this issue (and is something I forgot to talk
about during my talk at ELCE) without source-check is that the automatic
build system (jenkins and gitlab-ci) have a job that does basically:

    for t in ${targets}; do
        make ${t}_defconfig
        sed -r -e 's:^BR2_WGET="(.+)"$:BR2_WGET="/path/to/dl-wrapper \1":'
        make source
    done

(ditto for svn, git, hg, scp...)

Then the /path/to/dl-wrapper basically does:

    #!/bin/bash
    "${@}"  # Do the actual download
    if [[ ${url} =~ ^http://internal-server/mirror/ ]]; then
        : ; # Already on server
    elif [[ ${url} =~ ^http://internal-server/repositories/ ]]; then
        # New revision, push to filer
        scp "${url##*/}" "user at internal-server:path/to/mirror/"
    elif [[ ${url} =~ ^http://backup-server/mirror/ ]]; then
        # From backup, ARG...
        send-email "ARG: mot on mirror, nor upstream, from backup ${pkg}"
        scp "${url##*/}" "user at internal-server:path/to/mirror/"
    else
        # From upstream
        send-email "WARN: new package from upstream: ${pkg}"
        scp "${url##*/}" "user at internal-server:path/to/mirror/"
    fi

Of course, this is extermely simplified, but you get the idea...

Then the real build jobs only have access to the internal mirror, and
never to upstream, whether it is internal or exgternal. So we can also
fill a directory for delivery and archiving when needed.

Even though we still have a Buildroot with source-check, we are not
using it because it is more powerfull to just wrap around the real
download.

Regards,
Yann E. MORIN.

> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
