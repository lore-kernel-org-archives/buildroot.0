From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 5 Nov 2019 09:03:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <20191104223848.5e67d301@windsurf.home>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191104223848.5e67d301@windsurf.home>
Message-ID: <CAEyMn7bdb24JJnVQMa+Tr_uBQU3vHEdcnj6vxEMewr3oADXfrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Mo., 4. Nov. 2019 um 22:38 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sun,  3 Nov 2019 07:01:14 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > From: Heiko Thiery <heiko.thiery@kontron.com>
> >
> > The sysrepoctl and sysrepocfg executables are used in install steps
> > of the package. Since there are hard-coded install pathes,
> > this leeds to wrong installation directories in host and staging
> > install steps.
> >
> > Only sysrepoctl and sysrepocfg executables are needed from host build.
> > So build and install only the executables in this step.
>
> So far, ok.
>
> > The staging step only needs to install the library with the
> > corresponding files like the headers and the pkg-config.
>
> I don't understand this however. Is there a problem with keeping a
> simple "make install" for the staging installation ? After all, for
> TARGET_DIR, you've kept the default "make install" behavior, so it
> should be fine for staging as well. Could you comment on this ?

The problem comes from the hardcoded TARGET_DIR that is compiled-in the
needed host tools (sysrepocfg, sysrepoctl) in the build host step.
This value is used
as target for this tools as well as search path for other dependencies.
With this all install steps tries to install parts into that
TARGET_DIR. I think it is not
really clean that this happens. When I just do the part hat only the
tools are build in
the host step. Then the staging will fail because there are missing
files that are
expected to be located in the TARGET_DIR. The tools have the hardcoded search
path set to the TARGET_DIR.

I know this is tricky and it took some time for me to understand this.

> Also does this commit fix any autobuilder failure ? If it does, then
> please add a reference to it, like this:

No.


--
Heiko
