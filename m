From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 20:07:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-08-02
In-Reply-To: <a8c9e92b-38f9-88c2-c423-99f946fa5571@microchip.com>
References: <20170803063049.45E0621EC8@mail.free-electrons.com>
 <a8c9e92b-38f9-88c2-c423-99f946fa5571@microchip.com>
Message-ID: <20170803200741.245f3b6f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Aug 2017 10:30:59 -0700, Joshua Henderson wrote:

> For reference, I opened an upstream Qt bug [1] about this.  This build log is
> not strictly identical, but looks to be the same problem.  I believe the
> issue is gtk3 is properly auto detected by Qt build in order to build an
> optional Qt gtk3 plugin, but what it really needs is gtk3 compiled with X11.
> So, when gtk3 is built without X11 in buildroot, the Qt build fails.
> 
> Any direction on whether this should be solved:
> 1) in buildroot as config/build dependency (seems odd to make a dependency on
>    X11 for qt5base if gtk3 is enabled),
> 2) patch Qt,
> 3) by explicitly disabling building gtk3 theme support in qt5base (instead of
>    being automatic),
> 4) with some combination of the above.

I would say a combination of (1) and (3).

We want to:

 * Enable the gtk3 theme support only when the necessary dependencies
   are met. In this case, it would be BR2_PACKAGE_LIBGTK3_X11, which
   indicates that gtk3 is enabled with its X11 backend.

 * Be explicit about enabling and disabling the gtk3 theme. I.e
   explicitly enable it when BR2_PACKAGE_LIBGTK3_X11=y, explicitly
   disable it otherwise.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
