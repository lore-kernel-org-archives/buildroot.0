From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 23:05:46 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/qt5webengine: needs
 libxkbcommon
In-Reply-To: <20200915180004.2335-2-ps.report@gmx.net>
References: <20200915180004.2335-1-ps.report@gmx.net>
 <20200915180004.2335-2-ps.report@gmx.net>
Message-ID: <20200917230546.1beaf61f@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 20:00:03 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
>   subprocess.CalledProcessError: Command '['/home/seiderer/Work/Buildroot/build_rpi4_qt5_update_001/build/qt5webengine-5.15.1/src/core/pkg-config_wrapper.sh', '--variable=prefix', 'xkbcommon']' returned non-zero exit status 1
> 
>   See //ui/events/keycodes/BUILD.gn:12:3: whence it was called.
>     pkg_config("xkbcommon") {
>     ^------------------------
>   See //ui/events/ozone/layout/BUILD.gn:42:15: which caused the file to be included.
>       deps += [ "//ui/events/keycodes:xkb" ]
>                 ^-------------------------
>   Project ERROR: GN run error!
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>  - send as extra patch as I am not sure if the failure is caused by
>    the version bump and/or by a combination from my buildroot config

Unfortunately, I think we really need to understand if this is a change
needed in relation to the bump or not, so that we know if it needs to
go in a stable branch.

At least in a simple build of qt5webengine in v5.15.0 I have not
encountered this particular build failure. But perhaps it occurs only
when you have a bunch of other dependencies enabled.

The BUILD.gn file contains:

if (use_xkbcommon) {
  pkg_config("xkbcommon") {
    packages = [ "xkbcommon" ]
  }
}

And src/buildtools/config/linux.pri seems to be defining the value of
use_xkbcommon:

    qtConfig(build-qtwebengine-core):qtConfig(webengine-system-xkbcommon) {
        gn_args += use_xkbcommon=true
    } else {
        gn_args += use_xkbcommon=false
    }

I've never been familiar enough with the .pri syntax though to
understand what this is doing.

Could you try to see if the problem really comes from the 5.15.1 bump ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
