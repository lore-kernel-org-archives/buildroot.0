From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:26:07 +0100
Subject: [Buildroot] [PATCH 1/1] mpv: disable static build with qt-zlib
In-Reply-To: <20181102182416.27015-1-fontaine.fabrice@gmail.com>
References: <20181102182416.27015-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103142607.59465b91@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri,  2 Nov 2018 19:24:16 +0100, Fabrice Fontaine wrote:
> Static build of mpv with qt-zlib will fail because zlib and qt-zlib
> defines the same functions (inflateReset, inflatePrime ...)
> 
> So add a dependency on !(BR2_STATIC_LIBS && BR2_PACKAGE_QT_QTZLIB)
> 
> Theoretically, this dependency should be put on zlib package on all its
> reverse dependencies but this make a lot of packages

Why? zlib doesn't have any problem at all.

I don't think this patch is the right solution. First, because the
problem is in Qt, not in MPV. Fixing it at the MPV level means that all
other packages that use Qt may still be affected by the same issue.

I believe the problem comes the fact that Qt can use Zlib in two modes:
with a built-in zlib copy (BR2_PACKAGE_QT_QTZLIB) and with the system
zlib (BR2_PACKAGE_QT_SYSTEMZLIB). Because those options are part of a
choice, and choices are not randomized by the autobuilder
infrastructure, only BR2_PACKAGE_QT_QTZLIB gets tested and
BR2_PACKAGE_QT_SYSTEMZLIB is never tested.

I believe that with BR2_PACKAGE_QT_SYSTEMZLIB, the static build should
work, because there is only one copy of the zlib functions, in libz.a.
The problem with BR2_PACKAGE_QT_QTZLIB is that you end up with two
copies of all zlib functions: one in libz.a and one in libQtCore.a.

It would be great if you could confirm that the same configuration
builds properly when BR2_PACKAGE_QT_SYSTEMZLIB is used instead of
BR2_PACKAGE_QT_QTZLIB. If that is the case, then I believe the right
fix is to add a depends on !BR2_STATIC_LIBS to the
BR2_PACKAGE_QT_QTZLIB option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
