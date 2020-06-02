From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:12:39 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lcms2: bump to version 2.10
In-Reply-To: <20200601200141.1127530-1-fontaine.fabrice@gmail.com>
References: <20200601200141.1127530-1-fontaine.fabrice@gmail.com>
Message-ID: <20200602231239.279bd4a3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Jun 2020 22:01:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -LCMS2_VERSION = 2.9
> +LCMS2_VERSION = 2.10
>  LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
> -LCMS2_LICENSE = MIT
> -LCMS2_LICENSE_FILES = COPYING
> +LCMS2_LICENSE = MIT (core), GPL-3.0+ (fast_float plugin)

It is always a bit annoying to add some GPL-3.0+ code unconditionally
into a package.

But I did a test build of lcms2, and here this plugin is not built:

make[3]: Entering directory '/home/thomas/projets/buildroot/output/build/lcms2-2.10/plugins/fast_float'
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/lcms2-2.10/plugins/fast_float'

Indeed, the top level Makefile.am only recurses into
plugins/fast_float/, which contains a Makefile that does nothing.
plugins/fast_float/src/Makefile.am really does something, but I don't
see it invoked from the top-level build system.

Am I missing something ? Is this fast_float plugin really
built/installed ? If it is, we should make it conditional to not have
GPL-3.0 code added unconditionally along with a MIT-licensed library.

Could you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
