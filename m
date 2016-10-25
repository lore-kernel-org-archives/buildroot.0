From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:04:34 +0200
Subject: [Buildroot] [PATCH] core/graph-depends: add option to graph
 reverse dependencies
In-Reply-To: <1477243184-32610-1-git-send-email-yann.morin.1998@free.fr>
References: <1477236531-16771-1-git-send-email-yann.morin.1998@free.fr>
 <1477243184-32610-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161025230434.2a2a69b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 19:19:44 +0200, Yann E. MORIN wrote:
> Now that we can dump the reverse dependencies of a package, add the
> ability to graph those.
> 
> It does not make sense to do a full reverse graph, as it would be
> semantically equivalent to the direct graph. So we only provide a
> per-package reverse graph.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile                      |  3 ++-
>  package/pkg-generic.mk        | 21 ++++++++++++++-------
>  support/scripts/graph-depends | 18 ++++++++++++++++--
>  3 files changed, 32 insertions(+), 10 deletions(-)

I've applied, thanks. However, our logic that gets rid of "redundant"
dependencies also has the consequence of creating some graphs that are
quite weird.

I tested a configuration where I enabled python and libglib2, both of
which depend on libffi. When you do:

$ make libffi-show-rdepends

You get as expected "libglib2 python"

However, when you do

$ make libffi-graph-rdepends

The resulting graph is a bit weird. You would expect something like
this:

           libffi
       ------/ \------
       |             |
    libglib2       python

But instead, what you get is:

  libffi
    /\
    ||
   python
    /\
    ||
 util-linux
    /\
    ||
  libglib2

Because indeed libglib2 depends on util-linux, and util-linux can
optionally build python bindings and therefore depend on python.

Not sure what we can do about this: keeping all dependencies was really
creating huge and unreadable graphs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
