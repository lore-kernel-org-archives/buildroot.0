From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 2 Aug 2019 20:59:34 +0000
Subject: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <20190801210920.31338-4-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-4-romain.naour@smile.fr>
Message-ID: <CY4PR1201MB0120802523E19F77E8C00864A1D90@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, all,

> -----Original Message-----
> From: Romain Naour <romain.naour@smile.fr>
> Sent: Friday, August 2, 2019 12:09 AM
> To: buildroot at buildroot.org
> Cc: Damien DUVAL <damien.duval@smile.fr>; Alexandre PAYEN <alexandre.payen@smile.fr>; Alexey Brodkin
> <abrodkin@synopsys.com>; Romain Naour <romain.naour@smile.fr>; Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>; Alexey Brodkin <abrodkin@synopsys.com>; Fabrice Fontaine
> <fontaine.fabrice@gmail.com>; Evgeniy Didin <didin@synopsys.com>
> Subject: [PATCH 4/5] package/python-numpy: disable numpy if fenv.h is not provided by libc
> 
> From: Damien DUVAL <damien.duval@smile.fr>
> 
> With a c library which does not provide fenv.h, it won't work at runtime:
> Crash after an "import numpy" on python.
> 
> Since numpy v1.16.0:
> "Alpine Linux (and other musl c library distros) support
> We now default to use fenv.h for floating point status error reporting.
> Previously we had a broken default that sometimes would not report
> underflow, overflow, and invalid floating point operations. Now we can
> support non-glibc distrubutions like Alpine Linux as long as they ship
> fenv.h."
> Also there is a lack of define in glibc for ARC architecture and python
> numpy cannot build.
> The removed patches were just fixes for the build for uclibc and glibc
> for ARC

Well we used to lack fenv.h in ARC's port back in the day but not any longer,
check [1] as what we have in arc-2019.03 release so I guess since [2]
commit be0aaaaecda5 ("toolchain: bump ARC tools to arc-2019.03 release") numpy
should build and work for ARC with glibc as good as for other arches.

> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index 6d0b373413..bcd51e6000 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -16,6 +16,10 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  config BR2_PACKAGE_PYTHON_NUMPY
>  	bool "python-numpy"
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	# python-numpy needs fenv.h which is not provided by uclibc
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	# python-numpy is not compatible with glibc for ARC architecture.
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_arc)
>  	select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK

Given my comment above can we try it on ARC?
I.e. what exactly is a test-case so that we may try it and confirm?

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/blob/arc-2019.03-release/sysdeps/arc/bits/fenv.h
[2] https://git.buildroot.org/buildroot/commit/?id=be0aaaaecda56d16acf99a38319293913fd1e0b5

-Alexey
