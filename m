From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Nov 2020 22:16:43 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: fix generation of
 package list in reinstall
In-Reply-To: <CAJ4jsaftvtdepjTQG_ROvX3PAgRmzKqD60+Gf3rLHhZ3EFiQvQ@mail.gmail.com>
References: <20201105140401.1356161-1-unixmania@gmail.com>
 <20201105173349.76b4d206@windsurf.home>
 <CAJ4jsaftvtdepjTQG_ROvX3PAgRmzKqD60+Gf3rLHhZ3EFiQvQ@mail.gmail.com>
Message-ID: <20201105221643.707bba76@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 5 Nov 2020 14:21:21 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > I'll try to think about the issue you've reported and see if I can come
> > up with some useful suggestions.
> >
> I understand but wouldn't be a bug if a host package installed things
> on the target directory and vice-versa? Maybe the right thing to do is
> to ensure that this does not happen.

This can certainly be debated, and it would clearly be nicer if only
host packages installed stuff in HOST_DIR, only the staging
installation steps installed things in STAGING_DIR, and only target
installation steps installed things in TARGET_DIR. Unfortunately, we're
not there for a number of packages I'm afraid.

For example, qt5 is a target package, but it installs all its host
tools in HOST_DIR, and splitting up into a host-qt5 package is clearly
not trivial.

Another example: the external toolchain packages are all target
packages, as they install the libraries/headers in STAGING_DIR, the
libraries in TARGET_DIR... but they also install the cross-compiler and
other cross-tools in HOST_DIR.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
