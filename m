From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 09:33:31 +0200
Subject: [Buildroot] [PATCH 2/4] package/localedef: use upstream glibc
 version
In-Reply-To: <f89c4907-6d65-44a7-d6d1-b412b06d87a0@gmail.com>
References: <20200720164723.359198-1-romain.naour@gmail.com>
 <20200720164723.359198-2-romain.naour@gmail.com>
 <20200721212729.41a9374e@windsurf.home>
 <f89c4907-6d65-44a7-d6d1-b412b06d87a0@gmail.com>
Message-ID: <20200723093331.479682e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Thu, 23 Jul 2020 00:05:32 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> > Another concern with localedef, though not related to this series, is
> > that with external toolchains, you don't know which glibc version is
> > used in the toolchain. We may need a post-2.27 localedef, or a pre-2.27
> > localedef. I'm not sure how to solve that though. Random thought: for
> > the internal toolchains, have a host-glibc package that builds
> > localedef for the host, so that its version is naturally in sync with
> > the target glibc. For external toolchains, have the host-localedef
> > package with a version choice between different upstream glibc
> > versions, and it's up to the user to select the right thing ?  
> 
> I'm not sure how we can check if the localedef version is compatible with the
> external toolchain glibc version (add a check in toolchain/helpers.mk?). We only
> have BR2_TOOLCHAIN_USES_GLIBC to know it's a glibc toolchain.
> 
> I'm not sure we want to introduce BR2_TOOLCHAIN_GLIBC_AT_LEAST_x_xx just to
> build the right localedef version.

My idea was to leave that up to the user, i.e when
BR2_GENERATE_LOCALE=y && BR2_TOOLCHAIN_USES_GLIBC=y, we ask the user to
select which version of localedef should be used. It's not the nicest
from a user experience point of view, but it's probably the simplest
solution for us.

> > Overall, this is quite complicated, and it's annoying to keep glibc
> > 2.31 unsupported because of this. To me, it feels like glibc 2.31 has
> > been around for quite a while now. Why not just make the jump, keep a
> > single glibc version that we bump to 2.31 ?  
> 
> This was the initial question:
> http://lists.busybox.net/pipermail/buildroot/2020-April/279015.html
> 
> Initially I didn't take into acount the host-localedef problem, In previous
> series version host-localedef was at the same version as the latest upstream glibc.
> 
> My concern is about having only one glibc version choice (the latest) to build
> the internal toolchain. It's pity to block on host-localedef problem not related
> to the glibc version choice.
> 
> Note, glibc 2.32 will be released next week (2020-08-01). Maybe we should merge
> the glibc version bump without introducing the version choice now and wait for
> glibc 2.32 version bump series.

Yes, glibc 2.31 has been around for a while, let's switch to it as our
default glibc version, so that in Buildroot 2020.08, we use glibc 2.31.
And in parallel, we can continue to work on this glibc/localedef issue.

The localedef version issue exists regardless of whether we support two
glibc versions in the internal toolchain backend: right now if someone
uses an external toolchain with a pre-2.27 glibc, the host-localedef we
provide will be too recent and not compatible...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
