From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 22:15:01 +0100
Subject: [Buildroot] [PATCH v2] ola: bump to 0.9.3
In-Reply-To: <1417999179-29370-1-git-send-email-simon.marchi@polymtl.ca>
References: <1417999179-29370-1-git-send-email-simon.marchi@polymtl.ca>
Message-ID: <20141208221501.0556d8c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Marchi,

On Sun,  7 Dec 2014 19:39:39 -0500, Simon Marchi wrote:
> This update requires a few changes. First, good news, the patches that you
> guys have submitted to OLA have been merged, so we can drop those.
> 
> Less good news: OLA now builds a small protoc wrapper (ola_protoc) that is
> built and executed at compile-time on the host. If we don't change anything,
> ola_protoc is built with the target toolchain and therefore can't run on the
> host. Explanation for ola_protoc is here
> 
> To solve this, I created a package host-ola, which builds and provides an
> ola_protoc for the host. It tries to disable as much as possible of things
> that we won't need at configure time. Only ola_protoc is built and installed
> so it's not that long.
> 
> The change has been built-tested only.
> 
> [1] https://github.com/OpenLightingProject/ola/blob/master/protoc/ola-protoc.cpp#L20
> 
> Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>

Thanks applied. I made some small changes though:

    [Thomas:
     - add HOST_OLA_DEPENDENCIES variable, so that host-ola doesn't get
       all the dependencies of the target ola package: certain target
    ola dependencies do not have corresponding host packages (and it
       doesn't make sense to have them as dependencies just to build
       ola_protoc)
     - improve the commit log to mention which upstream commits
    correspond to our patches.]

Of course, the first change is the most important one: if you were
enabling all of the Ola sub-options, it would no longer build due to
host-ola depending on non-existing host packages (because when the
dependencies of a host package are not explicitly given, they are
inherited from  the dependencies of the corresponding target package).

See
http://git.buildroot.net/buildroot/commit/?id=66056a5179ef49f2ec10ba5d7fbd1a58863d1350

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
