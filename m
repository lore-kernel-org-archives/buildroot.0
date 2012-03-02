From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Mar 2012 10:37:47 +0100
Subject: [Buildroot] DL_TOOLS_DEPENDENCIES and PRIMARY_SITE
In-Reply-To: <CAAXf6LXfd_w5muFabHEFxYKgCFSsrsCCX0Cqibpfz0o7NZt1wQ@mail.gmail.com>
References: <CAAXf6LXfd_w5muFabHEFxYKgCFSsrsCCX0Cqibpfz0o7NZt1wQ@mail.gmail.com>
Message-ID: <20120302103747.7f8ef528@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 2 Mar 2012 10:16:53 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Suppose you have a PRIMARY_SITE set for direct retrieval of source
> tarballs instead of fetching them from the web, for example because
> you want a self-contained buildroot distribution to give to others.
> 
> If you select a package that has git/svn/bzr/... as site method, then
> the dependencies system will check for the availability of the
> git/svn/bzr tools.
> In case all tarballs are present on the PRIMARY_SITE, this check is
> actually not needed and annoying, because you would have to e.g.
> install 'git' even though it will never be used.

Hum, right.

> Some suggested solutions:
> 1. change support/dependencies/dependencies.sh to output a warning
> instead of an error for the DL_TOOLS. If the tool cannot be found when
> used, the shell will throw an error.
> 
> 2. when PRIMARY_SITE is set, don't fill DL_TOOLS at all (so don't
> check in support/dependencies), and let the shell handle a missing
> tool.
> 
> 3. Don't check the DL_TOOLS in support/dependencies upfront, but
> rather in the DOWNLOAD function when you actually need a certain tool.

The problem with (2) is that PRIMARY_SITE is only a *preferred*
location for download. If that location does not contain the requested
tarball, then we fall back to the normal download method, and in that
case we would need git/bzr/svn/etc. Or we would need to change the
semantic of PRIMARY_SITE so that we *only* look at PRIMARY_SITE and do
not fall back on the normal download method (and therefore abort the
build if PRIMARY_SITE does not contain all the desired tarballs).

As per (1) and (3), for sure it would work, but I think having all the
dependencies errors upfront is really nice, because you can fix all of
them at the beginning of the build, and then you know that the build
will go on. There's nothing more annoying than starting a long build,
going away for a coffee/tea/orange-juice (because I don't drink
coffee/tea), then coming back to discover that the build has stopped 30
seconds after we left just because of a missing dependency.

Another option on your build servers is:

echo "#!/bin/sh" > /usr/bin/git && chmod +x /usr/bin/git
echo "#!/bin/sh" > /usr/bin/svn && chmod +x /usr/bin/svn

And go ? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
