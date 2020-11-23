From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Mon, 23 Nov 2020 08:48:48 -0600
Subject: [Buildroot] [PATCH next 06/12] package/tinifier: new package
In-Reply-To: <20201121180418.GP771438@scaer>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-7-thomas.petazzoni@bootlin.com>
 <CALq67GDBMGctf5xsftX+nWfn8e7arP_1XN5S2Amt9h9nE-H2pQ@mail.gmail.com>
 <20201121180418.GP771438@scaer>
Message-ID: <CALq67GCZrFRic-fh_F3B7kpttUHGwM2Lb7+QW8_j9DbzZ5VQxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sat, Nov 21, 2020 at 12:04 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Ryan, All,
>
> On 2020-11-21 10:37 -0600, Ryan Barnett spake thusly:
> > On Thu, Nov 19, 2020 at 3:37 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > > This is a Go package that needs vendor modules to be downloaded at
> > > build time.
> [--SNIP--]
> > > diff --git a/package/tinifier/tinifier.mk b/package/tinifier/tinifier.mk
> > > new file mode 100644
> > > index 0000000000..b47d265a8e
> > > --- /dev/null
> > > +++ b/package/tinifier/tinifier.mk
> > > @@ -0,0 +1,13 @@
> > > +################################################################################
> > > +#
> > > +# tinifier
> > > +#
> > > +################################################################################
> > > +
> > > +TINIFIER_VERSION = 2.1.0
> > > +TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))
> > > +TINIFIER_LICENSE = MIT
> > > +TINIFIER_LICENSE_FILES = LICENSE
> >
> > I took a look at the legal-info side in regards to downloading
> > packages with the post-processing support. This has been discussed
> > previously on the patch "[v3,09/10] package/ripgrep: add legal-info
> > for dependencies":
> >
> > https://patchwork.ozlabs.org/project/buildroot/patch/20200220160119.3407-9-patrick.havelange at essensium.com/
>
> legal-info is also something Thomas and I discussed and IRC when he
> posted his series.
>
> We know it is not perfect, but this can be extended in a followup
> series.
>
> > When I ran 'make legal-info' for the tinifier package all that is
> > mentioned in the 'manifest.csv' file for the package is:
> >
> >    "tinifier","2.1.0","MIT","LICENSE","tinifier-2.1.0.tar.gz","https://github.com/tarampampam/tinifier/archive/v2.1.0","skeleton-init-common
> > [unknown] skeleton-init-none [unknown] toolchain-external-bootlin
> > [unknown]"
> >
> > This doesn't give any indication or warnings that dependencies were
> > downloaded or that other open source license could be needed by
> > including this package.
>
> To simplify the series, my position as a first step would be to extend
> the FOO_LICENSE list in the infra, with just a very short notice,
> something like:
>
>     FOO_LICENSE += , vendored licenses not listed

Adding this within the go/cargo infrastructure works for since it
informs a user that the package has licenses not listed.

Would a note in the buildroot manual be useful under the legal-info
section mention the go/cargo license limitations be useful as well?

> > As user of buildroot who may not have any
> > knowledge in regards to 'go' or 'cargo'. When they see tinifier row in
> > the manifest.csv file, they could just think that the tinifier package
> > would only have/introduce the MIT license to their product. Which is
> > not the case because it downloads the following vendor packages:
> >
> >   bou.ke/monkey v1.0.2
> >   github.com/dustin/go-humanize v1.0.0
> >   github.com/jessevdk/go-flags v1.4.1-0.20181221193153-c0795c8afcf4
> >   github.com/json-iterator/go v1.1.10
> >   github.com/kami-zh/go-capturer v0.0.0-20171211120116-e492ea43421d
> >   github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
> >   github.com/modern-go/reflect2 v1.0.1 // indirect
> >   github.com/olekukonko/tablewriter v0.0.4
> >   github.com/schollz/progressbar/v3 v3.3.3
> >   github.com/stretchr/testify v1.6.1
> >
> > I understand add/showing these license and how to exactly handle this
> > are future additions.
>
> My idea is that the go/cargo/... infras would be responsible for
> providing "some kind of" post-legal-info hooks, so they can extend the
> licenses list and license files list as well.
>
> But really, I would like to make that a next step, so that the technical
> side of the support for package managers can get in sooner rather than
> later.
>
> If we can not in the end come up woth a satifying licensing report for
> those (or for some of those) package managers, we would at least have
> support for building them.
>
> FTR, Thomas and I already adressed that issue quite a while ago, and we
> concluded that it was not so obvious as one may initially think (I'd
> have to dig my IRC logs to find the explanations...)

The patchworks link I provided in my original feedback email contains
the IRC convo between you and Thomas.

> >  However, I re-read the section in regards to
> > the "legal-info" in the buildroot manual I came across this:
> >
> >   Moreover, due to technical limitations, Buildroot does not produce some
> >   material that you will or may need, such as the toolchain source code for
> >   some of the external toolchains and the Buildroot source code itself.
> >   When you run +make legal-info+, Buildroot produces warnings in the +README+
> >   file to inform you of relevant material that could not be saved.
> >
> > So would it be possible to put a warning into the 'legal-info/README'
> > file that not all the dependency licenses could be downloaded/added to
> > manifest.csv file?
>
> With the added blurb I suggest above, I think we would be pretty much
> covered, no?

Yes the suggested blurb in the go/cargo infrastructure is good with me.

Thanks,
-Ryan
