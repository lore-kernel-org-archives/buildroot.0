From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Oct 2018 08:36:41 -0500
Subject: [Buildroot] [PATCH v3 1/1] Python3: Bump to 3.7.0
In-Reply-To: <20180818112041.0f8e7f7d@windsurf>
References: <20180817184607.27639-1-aduskett@gmail.com>
 <20180818112041.0f8e7f7d@windsurf>
Message-ID: <CANQCQpZLfq+oNe503ShA+E9yG-2iG7WC4rk-Riwdwqd7TrnPfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas / Adam,


On Sat, Aug 18, 2018 at 4:20 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 17 Aug 2018 11:46:07 -0700, Adam Duskett wrote:
> > From: Adam Duskett <aduskett@greenlots.com>
> >
> >   Other changes include:
> >
> >   - Refreshing all necessary patches for 3.7.0
> >
> >   - Add a hash for the license file.
> >
> >   - Python no longer has it's own internal libffi, as such, host-libffi is now
> >     required to build host-python3, and is added as a dependency.
> >
> >   - A new core module "uuid" is now is added in the Config.in file, and relies
> >     on util-linux's uuid library.
> >
> >   - Also, a new patch: 0030-Fix-cross-compiling-the-uuid-module.patch is
> >     required to fix compiling the uuid module, because the include directory
> >     search path for uuid.h is hardcoded to /usr/include/uuid, which causes an
> >     "unsafe for cross-compilation" error during compiling if the host pc has
> >     uuid headers installed.
> >
> >     To fix this error, a new variable called uuid_inc_dirs with the original
> >     path of "/usr/include/uuid" is added to setup.py, then if the environment
> >     variable STAGING_DIR exists, the STAGING_DIR path is added to the
> >     beginning of the uuid_inc_dirs variable.
> >
> >   - Add a new patch: 0031-fix-building-on-older-distributions.patch
> >     This patch changes os.replace to os.rename in the update_file.py
> >     script to fix building on older Linux distributions that have
> >     older versions of python that don't include os.replace.
> >
> >     os.rename acts in the same way as os.replace, but is cross-platform
> >     compatible. Because Buildroot is guaranteed to be built in a POSIX
> >     environment, it is safe to change replace to rename.
> >
> > Tested on CentOS7 and Fedora28, All test results passed:
> >              br-arm-full [1/6]: OK
> >   br-arm-cortex-a9-glibc [2/6]: OK
> >    br-arm-cortex-m4-full [3/6]: SKIPPED
> >           br-x86-64-musl [4/6]: OK
> >       br-arm-full-static [5/6]: SKIPPED
> > armv5-ctng-linux-gnueabi [6/6]: OK
> > 6 builds, 2 skipped, 0 build failed, 0 legal-info failed
> >
> > Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> > ---
> > Changes v1 -> v2:
> >   - Fixed patch name.
> >   - Removed unnecessary SOB lines in some of the updated patches.
>
> So, I have applied to next (in fact your v2, to which I have re-added
> the 0031-fix-building-on-older-distributions.patch patch. However, I
> did a number of additional changes:
>
>  - I dropped PYTHON3_LIBTOOL_PATCH = NO. This was only needed due to
>    the bundled libffi code, and since there is no more bundled libffi,
>    disabling the libtool patching is no longer needed.
>
>  - I changed your patch fixing the cross-compilation of the uuid
>    module. STAGING_DIR is a Buildroot specific environment variable, we
>    prefer to not reference it in the build system of package. Instead,
>    I've used the same solution as the one that was used by setup.py for
>    the NIS detection. Check the patch for details.
>
>  - For the UUID module, there was still a problem: even if
>    BR2_PACKAGE_PYTHON3_UUID was disabled, if the UUID library was
>    available in STAGING_DIR, Python would build the UUID module. This
>    is not expected as BR2_PACKAGE_PYTHON3_UUID is disabled. I have
>    added a patch that adds a --enable/--disable option for UUID, like
>    we do for many other Python modules.
>

Related to the current util-linux dependency issue, would there be any
reason to not let UUID support always be enabled? Since the standard
library is providing the implementation as a fall back.

I tested the following after removing the UUID kconfig and makefile conditions.
- with util-linux and python defaulting to uuid enabled (no build
failure and python uuid1() stilll works)
- without util-linux and python defaulting to uuid enabled (no build
failure and python uuid1() stilll works)

In both cases, I've verified the ctypes check is loading libc.

Should it be one patch to remove the kconfig option,
0031-Add-an-option-to-disable-uuid-module.patch and .mk updates?

Matt
