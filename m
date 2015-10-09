From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Oct 2015 01:28:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-08
In-Reply-To: <20151010000212.22f6b063@gmx.net>
References: <20151009063017.B1789101629@stock.ovh.net>
 <20151010000212.22f6b063@gmx.net>
Message-ID: <20151010012811.7fb06ec4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Oct 2015 00:02:12 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello,
> 
> On Fri,  9 Oct 2015 08:30:17 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> >       x86_64 |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/ba2f067734ce5da4f9198ceeb8647af4312e17fc/
> 
> Could not reproduce this one, but the failing build-end.log states:
> 
>   GEN      moc_qv4l2.cpp
> /bin/bash: /ssd1/thomas/autobuild/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/ssd1/thomas/autobuild/instance-3/output/host/usr/bin/moc: No such file or directory
> 
> 
> Would have expected something like
> 
> 	/ssd1/thomas/autobuild/instance-3/output/host/usr/bin/moc
> 
> as moc path, MOC is calculated as (see configure.ac)
> 
> 	MOC=`$PKG_CONFIG --variable=moc_location QtCore`
> 
> Any hints?

Problem reproducible with the following defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/x86_64-ctng_locales-linux-gnu.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="x86_64-ctng_locales-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_QT=y
BR2_PACKAGE_QT_LICENSE_APPROVED=y
# BR2_PACKAGE_QT_XML is not set
# BR2_PACKAGE_QT_SCRIPT is not set
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y

with buildroot up to commit 912538634a778452196c49726bb0770885280adc, but only
if libv4l is build after qt (something like
    ifeq ($(BR2_PACKAGE_QT),y)
    LIBV4L_DEPENDENCIES += qt
    endif
is missing from libv4l.mk).

Reverting commit d7f6d320b64ae582d17362dae971288c993736dc 'pkgconf: bump to version 0.9.12' fixes the problem...

Regards,
Peter
