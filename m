From: Christian Stewart <christian@paral.in>
Date: Thu, 3 Sep 2020 11:51:57 -0700
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200903135714.68ed2e22@windsurf.home>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903135714.68ed2e22@windsurf.home>
Message-ID: <CA+h8R2pRmhGSc3LsqLNVsYG=rLcD000g7FPtJiZ9_tVTvjrCJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Sam,

Thanks much for looking into this, and I'm excited at the idea of
splitting vendor into a separate tarball.

In my mind the optimal approach would be to leverage the Go module
system to produce a tarball with associated hash for every Go module
that's imported by any of the selected Build targets, and vendor
specifically those, excluding all else.

I can write the Go code to do this & prototype a proof of concept if
this is the way we are interested in going. It would be IMO
appropriate because every Go module is checksummed, will produce a
guaranteed identical output tarball that we can add to the hash file,
and the vendor tree would only contain the necessary packages for the
build targets flagged by the buildroot config.

On Thu, Sep 3, 2020 at 4:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> > I took a look at `go mod`, it seems to share a similar mechanism with
> > cargo which allows us to pass local paths for dependencies. My
> > proposition is to put the responsibility of whomever is adding a
> > proprietary application, which has mixed dependencies, to instead
> > split any proprietary modules into selectable options in buildroot,
> > and use the standard depends mechanism. To enforce this, we could
> > investigate using license-coalescing options of the package managers
> > to find any proprietary dependencies and fail if they're found to be
> > pointing to upstream URLs (and would be captured) with an error
> > message clearly describing our intentions.

This fits well with what I'm describing above. The Go code to produce
/ extract the tarballs for the dependency modules and the module
metadata could also be used to produce the license check and legal
output. In fact, we could even generate the upstream URLs from this,
and all other metadata desired (even authors information and a
dependency chart).

> Question: for the dependencies, instead of having a single tarball for
> all of them, would there be a way of having separate tarballs for each
> dependency that gets pulled by "go mod" or "cargo" ? If so, then we
> could perhaps be able to teach the package which parts of the package
> are proprietary (including the proprietary dependencies) and which
> parts are open-source and under which license.

See above.

> Note that as a first step, I am personally perfectly fine with what you
> are proposing. The above question is really just a question, not a
> request to implement something like that.

To me those two are the same, heh.

> I think we have a good opportunity to try to solve this problem for
> both Cargo and Go at the same time, so that we at least see if there's
> a reasonably similar solution that can be used.

Since our host-go infrastructure is now up to par, we can integrate
the tool I'm describing above as a host-go package with no external
dependencies since it would only use the Go stdlib.

Best regards,
Christian Stewart
