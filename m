From: Frederik Peter Aalund <fpa@sbtaqua.com>
Date: Tue, 20 Sep 2016 13:57:18 +0000
Subject: [Buildroot] [PATCH 3/3] python3: Compile host-python3 statically
In-Reply-To: <20160916190833.7c776697@free-electrons.com>
References: <1474032631-21311-1-git-send-email-fpa@sbtaqua.com>
 <20160916190833.7c776697@free-electrons.com>
Message-ID: <CAA=pTTSgNWY-orBD0ff1Y6U-p+ujXRyg+mtNvyb_UOivSqMqww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thanks again for reviewing. It appears that the host-python3 executable
doesn't have an rpath entry. This would indeed explain the weird behaviour.

I looked at the build log and found that "-Wl,-rpath" is indeed correctly
passed on:
-Wl,-rpath,/projects/RedPitaya/OS/buildroot/buildroot/output/host/usr/lib

This is reflected in the resulting Makefile:
CONFIGURE_LDFLAGS=
 -L/projects/RedPitaya/OS/buildroot/buildroot/output/host/lib
-L/projects/RedPitaya/OS/buildroot/buildroot/output/host/usr/lib
-Wl,-rpath,/projects/RedPitaya/OS/buildroot/buildroot/output/host/usr/lib
-Wl,--enable-new-dtags

So I don't know how it can be that the rpath is not set in the final
binary. Do you also see this problem?

Thanks again.

*Frederik Aalund*
Chief Information Officer, Co-owner

SBT Aqua
Copenhagen, Denmark
Mobile: +45 30340086
fpa at sbtaqua.com
sbtaqua.com

On Fri, 16 Sep 2016 at 19:08 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> Please wrap the text in your commit messages to a reasonable line width
> (72 characters).
>
> On Fri, 16 Sep 2016 15:30:31 +0200, Frederik Aalund wrote:
> > The previous behaviour was to compile host-python3 with
> `--enable-shared` as is done for the target python installation. The
> problem is that if the host *already* has a python installation, then
> host-python3 will be called with the system `libpython3.5.so`. So even
> though the $(HOST_DIR) python executable is called, the system .so is used.
>
> This should not be the case. All host binaries we build are built with
> -Wl,-rpath,$(HOST_DIR)/usr/lib, which means that they should look up
> libraries in $(HOST_DIR)/usr/lib *before* looking at /usr/lib.
>
> Can you double check what "readelf -a output/host/usr/bin/python" says
> about this? readelf should show you this rpath encoded into the Python
> binary. If that's not the case, then this is the problem.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160920/9859dd75/attachment.html>
