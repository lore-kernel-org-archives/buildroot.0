From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 22:38:26 +0200
Subject: [Buildroot] [PATCH 2/3] disko: new package
In-Reply-To: <5c2f697e1fddaa6a53952331f7d873bcfd65ee01.1311138690.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 20 Jul 2011 07:11:53 +0200")
References: <cover.1311138690.git.thomas.petazzoni@free-electrons.com>
 <cover.1311138690.git.thomas.petazzoni@free-electrons.com>
 <5c2f697e1fddaa6a53952331f7d873bcfd65ee01.1311138690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aac3wh19.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, a few comments:


 Thomas> +++ b/package/multimedia/disko/Config.in
 Thomas> @@ -0,0 +1,41 @@
 Thomas> +config BR2_PACKAGE_DISKO
 Thomas> +	bool "disko"
 Thomas> +	select BR2_PACKAGE_LIBSIGC

libsigc++ is a C++ library, and disko seems to also be written in C++,
so you need the depends on BR2_INSTALL_LIBSTDCPP /
comment-when-no-available thing.

Doing a test build with a basic uClibc config (please test patches with
this) shows that it needs iconv.h, so you need

select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

and add it to _DEPENDENCIES.

Unfortunately the build still breaks:

src/mmstools/tools.cpp:37:21: error: wordexp.h: No such file or directory
src/mmstools/tools.cpp: In function 'std::string substituteEnvVars(std::string)':
src/mmstools/tools.cpp:64: error: 'wordexp_t' was not declared in this scope

Our default uClibc config (and upstream default) hasn't got
UCLIBC_HAS_WORDEXP enabled. Please take a look if we could remove that
dependency or alternatively adjust the defconfigs.

 Thomas> +++ b/package/multimedia/disko/disko-1.8.0-fixup-pkgconfig.patch
 Thomas> @@ -0,0 +1,22 @@
 Thomas> +Do not prepend pkg-config prefix variable with destdir
 Thomas> +
 Thomas> +The SConstruct script of Disko preprends the destdir to the prefix=
 Thomas> +variable in the .pc file. This is useless and also broken, as
 Thomas> +pkg-config already preprends the destdir to the prefix= variable
 Thomas> +thanks to the PKG_CONFIG_SYSROOT_DIR environment variable.
 Thomas> +
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Has this been sent upstream?

 Thomas> new file mode 100644
 Thomas> index 0000000..0d6d894
 Thomas> --- /dev/null
 Thomas> +++ b/package/multimedia/disko/disko.mk
 Thomas> @@ -0,0 +1,57 @@
 Thomas> +

Please drop this empty line.

-- 
Bye, Peter Korsgaard
