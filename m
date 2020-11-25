From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 12:51:14 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <20201125213704.569c52dc@windsurf.home>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
 <20201125213704.569c52dc@windsurf.home>
Message-ID: <CA+h8R2q203fPrP99BR-4ceYikcDvR3u7Z663=A2st3C3pkTdxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

There are a number of packages that don't have go.mod files yet, but
might have files from other package managers in the Go ecosystem.

On Wed, Nov 25, 2020 at 12:37 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Christian,
>
> Thanks for the feedback!
>
> On Wed, 25 Nov 2020 12:28:31 -0800
> Christian Stewart <christian@paral.in> wrote:
>
> > This looks good. There's only one problem - if the package does not
> > come with a go.mod file (which is the case with
> > nvidia-container-toolkit).
> >
> > In this case we need to run the $(2)_GEN_GOMOD script before running
> > the download post-process.
> >
> > Today, this is written as so and creates a go.mod if it doesn't already exist:
> >
> > # Generate a go.mod file if it doesn't exist. Note: Go is configured
> > # to use the "vendor" dir and not make network calls.
> > define $(2)_GEN_GOMOD
> > if [ ! -f $$(@D)/go.mod ]; then \
> >   printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
> > fi
> > endef
> > $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>
> Ah, good point. Do you have an example of such a package (publicly
> available)? That would help testing a solution.

Yes: https://github.com/NVIDIA/nvidia-container-runtime

Buildroot package:
https://github.com/skiffos/buildroot/commit/983f30d31c7fc8011fbfb57dd3abef1751c3e4d7

And some more like it in this tree:

https://github.com/skiffos/buildroot/tree/pkg-mgr

>
> I guess the best solution is to modify the POST_PATCH_HOOKS to be done
> by the download post-process script ?

The go module system will actually convert those other formats
faithfully into the go.mod and go.sum format.

If we add the patch that I sent in the previous email, which runs "go
mod init" just before "go mod vendor," it will read the legacy formats
in this step.

Alternatively we could do something which was rejected in one of my
original go.mod support revisions - adding the go.mod and go.sum files
into the Buildroot tree.

To generate these:

 1. Clone the repo
 2. "go mod init" and "go mod vendor"
 3. Copy go.mod and go.sum to buildroot tree
 4. These are copied (if exist) into the package just before running
"go mod vendor" in the post-process.

The reasoning behind this is to provide an exact version for all of
the dependencies locked in the Buildroot tree so that the output is
deterministic. We might get hash mismatches otherwise.

Best,
Christian


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
