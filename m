From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 13:57:14 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
Message-ID: <20200903135714.68ed2e22@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Sep 2020 05:52:56 -0500
Sam Voss <sam.voss@gmail.com> wrote:

> > My proposal was that we introduce per-package managers download
> > backends, which would typically do something like the following
> > (pseudo-code):
> >
> >     #!/usr/bin/env bash
> >     # This file is support/fownload/go
> >
> >     # Parse options:
> >     actual_site_method="$(get_option '--actual-site-method')"
> >
> >     # Call actual download helper:
> >     "${0%/*}/${actual_site_method}" "${@}" -o "${temp_tarball}"
> >
> >     # Populate the vendor:
> >     tar xf "${temp_tarball}" -C "${temp_directory}"
> >     cd "${temp_directory}/${package_name_version}"
> >     go mod vendor
> >     cd ..
> >     tar czf "${final_tarball}" "${package_name_version}"
> >
> > (of course, the details would be a bit more complex, and would require
> > that we pass the actual site method vi the download infra, but the idea
> > is there)
> >
> > What's your opinion on this?  
> 
> As we spoke about plenty on the IRC, I'm sure you know my opinion on
> this but I figure I mention it anyway: I believe we should split these
> recursive-requirements from the base tar. This should allow
> Proprietary applications and TPIP requirements to be captured while
> maintaining separation between them.

For those tuning in: TPIP stands for (I believe) "Third Party
Intellectual Property".

I think I agree with the idea of splitting into two tarballs the
package source code itself from the source code of all its dependencies.

> Now, to your point about "well, what if the repository has proprietary
> dependencies?".

That was indeed my question as well.

> I think this is still a valid point, especially when
> looking at the case you mentioned of "proprietary app with commingled
> TPIP+proprietary requirements", but I believe we should be able to
> handle this at a buildroot level fairly reasonably.
> 
> I took a look at `go mod`, it seems to share a similar mechanism with
> cargo which allows us to pass local paths for dependencies. My
> proposition is to put the responsibility of whomever is adding a
> proprietary application, which has mixed dependencies, to instead
> split any proprietary modules into selectable options in buildroot,
> and use the standard depends mechanism. To enforce this, we could
> investigate using license-coalescing options of the package managers
> to find any proprietary dependencies and fail if they're found to be
> pointing to upstream URLs (and would be captured) with an error
> message clearly describing our intentions.

This feels like a reasonable approach to me.

Question: for the dependencies, instead of having a single tarball for
all of them, would there be a way of having separate tarballs for each
dependency that gets pulled by "go mod" or "cargo" ? If so, then we
could perhaps be able to teach the package which parts of the package
are proprietary (including the proprietary dependencies) and which
parts are open-source and under which license.

Note that as a first step, I am personally perfectly fine with what you
are proposing. The above question is really just a question, not a
request to implement something like that.

> In my (so far unshared) patchset, my solution to do this agrees with
> your suggestion above, by adding download-backend support for these
> package managers. I leveraged the implementation suggested previously
> by patrick[1] to use the cargo-dl step to then create two tarballs:
> 
> <package>-<ver>.tar.gz   <- we're all familiar with
> <package>-<ver>-vendor.tar.gz <- the TPIP portion
> 
> The reasons for splitting are shared above. I believe that patchset is
> a good initial direction, and I think those interested in this
> patchset who are unfamiliar with that one should give it a review.

Could you submit your patch series ? Did you fix the issues that we
pointed out in the review of Patrick's series ?

I think we have a good opportunity to try to solve this problem for
both Cargo and Go at the same time, so that we at least see if there's
a reasonably similar solution that can be used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
