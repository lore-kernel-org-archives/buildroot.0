From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 May 2017 22:13:11 -0500
Subject: [Buildroot] libqmi and modem-manager
In-Reply-To: <CANQCQpbeJsrHxXLr00Do4WAYcD07mrKybo8BaDP53b_=As9K9g@mail.gmail.com>
References: <30a337fc-837b-624c-06f0-3a8252b5693e@imgtec.com>
 <CANQCQpbeJsrHxXLr00Do4WAYcD07mrKybo8BaDP53b_=As9K9g@mail.gmail.com>
Message-ID: <CANQCQpYiw=mN-9TfQrkWDCo1GyGEvN6x5HqSiG-PMNUKWM=ENw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Thu, May 11, 2017 at 8:03 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Vicente,
>
> On Thu, May 11, 2017 at 8:01 AM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
> > Hello Thomas and Matthew,
> >
> > this commit from Matthew broke libqmi compilation:
> >
> > https://git.busybox.net/buildroot/commit/?id=c78b65c4f161ec101ff02880788ef22eb7c87d76
> >
> > Then this commit from Thomas fixed the former bogus commit and libqmi
> > started to compile file again:
> >
> > https://git.busybox.net/buildroot/commit/?id=4d11848a21d4424a04e8428c4cd3bd5e972aacdf
> >
> > The problem is that now modem-manager with qmi support fails to compile
> > with an error like this one:
> >
> >   CC       mm-modem-helpers-qmi.lo
> > In file included from
> > /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/libqmi-glib/qmi-message.h:39:0,
> >                  from
> > /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/libqmi-glib/qmi-device.h:34,
> >                  from
> > /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/libqmi-glib/libqmi-glib.h:32,
> >                  from mm-modem-helpers-qmi.h:22,
> >                  from mm-modem-helpers-qmi.c:16:
> > /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/libqmi-glib/qmi-utils.h:37:15:
> > error: static declaration of ?canonicalize_file_name? follows non-static
> > declaration
> >  static char * canonicalize_file_name(const char *path)
> >
> > If I revert both commits modem-manager with qmi support compiles just fine.
> >
> > Could you please have a look to that issue?
> >
> > This is the defconfig I'm using:
> >
> > BR2_mipsel=y
> > BR2_mips_32r2=y
> > # BR2_MIPS_SOFT_FLOAT is not set
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > BR2_PACKAGE_MODEM_MANAGER=y
> > BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
> > # BR2_TARGET_ROOTFS_TAR is not set
> >
>
>

So the fix I'm currently testing removes the static inline from the
libqmi header and instead puts the function in the file where it's
used.  I didn't realize the header was a shared file for other
packages to use.  So far no build failures across both musl and glibc
test builds.

Matt
