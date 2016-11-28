From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 21:53:47 +0100
Subject: [Buildroot] [PATCH v2] jasper: bump version to 2.0.0 (security)
In-Reply-To: <20161128134134.18599-1-Vincent.Riera@imgtec.com>
References: <20161128134134.18599-1-Vincent.Riera@imgtec.com>
Message-ID: <20161128215347.0686379f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 13:41:34 +0000, Vicente Olivert Riera wrote:
> Fixed CVEs:
>  - CVE-2016-9387
>  - CVE-2016-9388
>  - CVE-2016-9389
>  - CVE-2016-9390
>  - CVE-2016-9391
>  - CVE-2016-9392
>  - CVE-2016-9393
>  - CVE-2016-9394
>  - CVE-2016-9395
>  - CVE-2016-9396
>  - CVE-2016-9397
>  - CVE-2016-9398
>  - CVE-2016-9399
>  - CVE-2016-9557
>  - CVE-2016-9560
> 
> Changes to jasper.mk:
>   - Switched to CMake package infrastructure.

Do we really need to bump to 2.0.0 to get those security fixes?
Changing the package to CMake is a big change, which I'm not sure I
want to merge that close to the final release.

I see we have 1.900.22 currently, while there is also a 1.900.29
version released upstream. Does this version also includes the security
fixes perhaps?


> +Subject: [PATCH] CMakeLists.txt: only change RPATH when building for shared
> +
> +When doing static-only builds (-DJAS_ENABLE_SHARED=OFF) the install
> +process fails due to an invalid RPATH:
> +
> +...............................................................
> +CMake Error at src/appl/cmake_install.cmake:45 (file):
> +  file RPATH_CHANGE could not write new RPATH:
> +
> +    /usr/lib
> +
> +  to the file:
> +
> +    /br/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/bin/jasper
> +
> +  No valid ELF RPATH or RUNPATH entry exists in the file;
> +Call Stack (most recent call first):
> +  cmake_install.cmake:42 (include)
> +...............................................................
> +
> +RPATH shouldn't be changed when doing static-only builds.
> +
> +Pull request: https://github.com/mdadams/jasper/pull/95
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I see this patch has been merged upstream. However, even for shared
builds, forcing a RPATH is really wrong, and shouldn't be done.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
>  endif

It is really sad to have invented a custom CMake variable for this,
while CMake already has a standard variable: BUILD_SHARED_LIBS={ON,OFF}.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
