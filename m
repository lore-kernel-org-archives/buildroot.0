From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Feb 2018 15:45:21 +0100
Subject: [Buildroot] [RFCv3 15/15] core: implement per-package SDK and
 target
In-Reply-To: <20171201205352.24287-16-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-16-thomas.petazzoni@free-electrons.com>
Message-ID: <CANQCQpb780bRRaSkUnV2aTFg=1LjZ9f3tD-YYCOTN4au2F965A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Dec 1, 2017 at 9:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit implemnts the core of the move to per-package SDK and
> target directories. The main idea is that instead of having a global
> output/host and output/target in which all packages install files, we
> switch to per-package host and target folders, that only contain their
> explicit dependencies.
>
> There are two main benefits:
>
>  - Packages will no longer discover dependencies that they do not
>    explicitly indicate in their <pkg>_DEPENDENCIES variable.
>
>  - We can support top-level parallel build properly, because a package
>    only "sees" its own host directory and target directory, isolated
>    from the build of other packages that can happen in parallel.
>
> It works as follows:
>
>  - A new output/per-package/ folder is created, which will contain one
>    sub-folder per package, and inside it, a "host" folder and a
>    "target" folder:
>
>    output/per-package/busybox/target
>    output/per-package/busybox/host
>    output/per-package/host-fakeroot/target
>    output/per-package/host-fakeroot/host
>
>    This output/per-package/ folder is PER_PACKAGE_DIR.
>
>  - The global TARGET_DIR and HOST_DIR variable now automatically point
>    to the per-package directory when PKG is defined. So whenever a
>    package references $(HOST_DIR) or $(TARGET_DIR) in its build
>    process, it effectively references the per-package host/target
>    directories. Note that STAGING_DIR is a sub-dir of HOST_DIR, so it
>    is handled as well.
>

Using this patchset without any -j.  I found a case with host-setools
where it uses the python-package framework to build and using
setuptools puts a default -I<abs
path>/per-package/host-python/host/include.  Previously this would
have pointed at the full sysroot so now there is a missing include.
I've added it for setools and continued on testing at this point.  I'm
unsure if we would consider this a pkg-python.mk update or each
package.....

Matt
