From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:44:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/libabseil-cpp new package
In-Reply-To: <20200720192348.2126418-1-aduskett@gmail.com>
References: <20200720192348.2126418-1-aduskett@gmail.com>
Message-ID: <20200721094456.14f759de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 12:23:47 -0700
aduskett at gmail.com wrote:

> diff --git a/package/libabseil-cpp/0001-Add-fPIC-option.patch b/package/libabseil-cpp/0001-Add-fPIC-option.patch
> new file mode 100644
> index 0000000000..2bcab5dcb9
> --- /dev/null
> +++ b/package/libabseil-cpp/0001-Add-fPIC-option.patch
> @@ -0,0 +1,36 @@
> +From d7160d647c8f8847f3ea8d7b0eb222936962c1af Mon Sep 17 00:00:00 2001
> +From: Sinan Kaya <sinan.kaya@microsoft.com>
> +Date: Tue, 11 Feb 2020 11:58:02 -0500
> +Subject: [PATCH] Add fPIC option
> +
> +Without this option, programs building for arm64 or x86-64 will fail when
> +attempting to link to the built libraries with the following (abbreviated)
> +error:
> +
> +"relocation against `.rodata' can not be used when making a shared object;
> +recompile with -fPIC
> +
> +Force fPIC to resolve this issue.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>

Your SoB should go after the author's SoB. No need to resend just for
that though.

> ++add_compile_options(-fPIC)

This feels weird, CMake is supposed to add -fPIC by itself when
building shared libraries.

However, after looking briefly at the abseil CMake logic, it's not
obvious what they are doing. Are they building a single static library
? One static library per "module" of abseil ? There is an
ABSL_BUILD_DLL option, what does it do ?

Of course, if they build static libraries, and these static libraries
then end up being included into a shared library, you would get that
relocation failure.

If that's the case, it seems like the correct way to add -fPIC is not
to add -fPIC, but something like this:

set_property(TARGET cpp-netlib_pic PROPERTY POSITION_INDEPENDENT_CODE ON)

according to https://cmake.org/pipermail/cmake/2016-August/064161.html.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
