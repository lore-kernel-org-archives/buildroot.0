From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 20:40:40 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <CA+h8R2od7W+QcUVLcdLFiKbaG8voDAbOBvEQDe3rnQF9uAtiyQ@mail.gmail.com>
References: <20200813213220.260112-1-christian@paral.in>
 <20200829145955.6aedeae6@windsurf.home>
 <CA+h8R2od7W+QcUVLcdLFiKbaG8voDAbOBvEQDe3rnQF9uAtiyQ@mail.gmail.com>
Message-ID: <20200829204040.11e80d7f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Sat, 29 Aug 2020 10:32:12 -0700
Christian Stewart <christian@paral.in> wrote:

> GOMOD was not required before. If the go.mod exists (which happens in
> many cases) then you can infer what GOMOD is from the first line of
> the file. So GOMOD absolutely can be empty and was in some of my
> buildroot_ext packages.

No, it cannot be empty, because pkg-golang.mk has something like this:

$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)

So, even if $$($(2)_SRC_DOMAIN), $$($(2)_SRC_VENDOR) and
$$($(2)_SRC_SOFTWARE) are empty, the GOMOD will be equal to //.
Obviously, that's a stupid and non-working GOMOD value, but it's still
non-empty.

> As you're now using it as part of the build targets, requiring it to
> be set is, I guess, fine.

It was already always set, as explained above.

> The mechanism to copy in a go.mod file and/or a go.sum file is used in
> some of my buildroot_ext packages. It's used in many Gentoo packages
> as well, iirc. However, as the Buildroot mainline currently does not
> use the Go compiler to download any dependencies (instead relying on a
> "vendor" dir to exist in the source repository), this doesn't make any
> difference yet in Buildroot.

Yes, in principle I don't see a problem with adding support for that,
but (1) it was not used anywhere and (2) it was not documented anywhere.

> Thank you for the work to review, split, & cleanup, the attention to
> detail in Buildroot is on the highest level.

By splitting things up, it also help understand better what was going
on.

> > Are you sure this GOPATH is needed ? We're supposed to move away from
> > GOPATH, but you're adding a new GOPATH location here, and in a build
> > that has all our Go packages enabled, this
> > $(HOST_DIR)/usr/share/go-path location doesn't even exist.
> >
> > Could you clarify ?  
> 
> Currently the Go compiler will use $GOPATH/pkg/{mod,sumdb} for the Go
> modules cache. It probably did not create any in the mainline
> Buildroot builds because there is no Go module activity in use yet
> (all vendor based). However, a valid GOPATH does need to be set so
> that the Go compiler can use it for the "pkg" cache dir if necessary.
> 
> So, GOPATH, while not used for lookups of packages under the "src" dir
> anymore, is still used for a few other directories for Go.
> 
> There is a new variable in newer versions of Go to control this
> separately from GOPATH, so we can add that and eventually fully remove
> GOPATH (but not yet).
> 
> GOMODCACHE="$GOPATH/pkg/mod"

OK, thanks for the additional explanations.

What are the next steps in terms of Go support ? Are there projects
where the "vendor" dependencies are not included as part of the
upstream project, and need to be downloaded by go at build time ? If
so, do we want to support that ? How ? Do you have examples of
prominent Go projects that are delivered like this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
