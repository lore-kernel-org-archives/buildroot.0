From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 11 Jun 2020 00:48:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: fix pkg-config --static
In-Reply-To: <20200412211446.1789f4f0@windsurf.home>
References: <20200215152620.3553021-1-fontaine.fabrice@gmail.com>
 <20200412211446.1789f4f0@windsurf.home>
Message-ID: <d7250596-6394-ddc2-eddf-7e0d14b6cdd0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Fabrice,

Le 12/04/2020 ? 21:14, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sat, 15 Feb 2020 16:26:20 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> pkg-config wrapper is not used since commit
>> 4e0bc29993376613d200e892d491e31ea5a49622, this raise static build
>> failures with libglib2 because --static is not passed anymore to
>> pkg-config so add a patch to get back the old behaviour.
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/0d36952def63cb69628697fa6408aeb6ce10cb5b
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  ...dencies-base.py-add-pkg_config_stati.patch | 38 +++++++++++++++++++
>>  package/meson/cross-compilation.conf.in       |  1 +
>>  package/pkg-meson.mk                          |  1 +
>>  3 files changed, 40 insertions(+)
>>  create mode 100644 package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
> 
> So, the feedback from upstream at
> https://github.com/mesonbuild/meson/pull/6629 was not very positive,
> and they suggested how it should be implemented.
> 
> However, in the mean time, we are a bit screwed, and libglib2 has
> continued to fail building consistently in our autobuilders since then.
> 
> Since your solution Fabrice is simple enough and straightforward, I
> decided to apply it nevertheless. I just made sure setting the STATIC
> property is done in both the per-package cross-compilation.conf and the
> global cross-compilation.conf.
> 
> It would however be nice to keep working on the issue with upstream, so
> that we get a proper solution at some point in the future.

It seems this patch introduced a build issue with libgbm mesa3d:

http://autobuild.buildroot.net/results/1b5/1b58d73ecbbe1af2c3e140563d696cf32d1c4a5a/build-end.log

See initial discussions:
http://lists.busybox.net/pipermail/buildroot/2020-June/284543.html

By reverting this patch allow to build the following defconfig:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_VALGRIND=y
BR2_PACKAGE_VALGRIND_SGCHECK=y
BR2_PACKAGE_VALGRIND_BBV=y
BR2_PACKAGE_VALGRIND_LACKEY=y
BR2_PACKAGE_VALGRIND_NULGRIND=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y

That's because --static is always used while calling pkg-config.
Doing so in mesa build add valgrind static libraries while building shared
library libgbm.so.

Best regards,
Romain


> 
> Thanks,
> 
> Thomas
> 
