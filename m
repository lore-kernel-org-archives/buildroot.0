From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 12 Jun 2014 08:53:25 +0200
Subject: [Buildroot] [PATCH 09/12] pkg-infra: don't use DL_DIR as
 scratchpad for temporary downloads
In-Reply-To: <3684c692131eefc3fac8c9168e1b1216ffe45654.1402260012.git.yann.morin.1998@free.fr>
References: <cover.1402260012.git.yann.morin.1998@free.fr>
 <3684c692131eefc3fac8c9168e1b1216ffe45654.1402260012.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LV-pDVO02P-G5M7GCc8EY61+T+xTO0XEU9j2_trwt7ToA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 8, 2014 at 10:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> DL_DIR can be a very precious place for some users: they use it to store
> all the downloaded archives to share across all their Buildroot (and
> maybe non-Buildroot) builds.
>
> We do not want to trash this location with our temporary downloads (e.g.
> git, Hg, svn, cvs repository clones/checkouts, or wget, bzr tep tarballs).
>
> Turns out that we already have some kind of scratchpad, the BUILD_DIR.
> Although it is not really a disposable location, that's the best we have
> so far.
>
> Also, we create the temporary tarballs with mktemp using the final tarrball,
> as template, since we want the temporary to be on the same filesystem as
> the final location, so the 'mv' is just a plain, atomic rename(2), and we
> are not left with a half-copied file as the final location.
>
> Using mktemp ensures all temp file names are unique, so it allows for
> parallel downloads from different build dirs at the same time, without
> cloberring each downloads.
>
> Note: we're using neither ${TMP} nor ${TMPDIR} since they are shared
> locations, sometime with little place (eg. tmpfs), and some of the
> repositories we clone/checkout can be very big.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[tested a particular scenario that used to fail: two separate builds
using a shared DL_DIR, ccache enabled, so that they run almost
synchronously. These would download the same file at the same time,
corrupting each other. With the patches in this series, all works
fine.]
