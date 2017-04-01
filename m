From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 23:32:31 +0200
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: new package
In-Reply-To: <1486931216-34024-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1486931216-34024-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170401233231.28cfbe9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 21:26:56 +0100, Fabrice Fontaine wrote:
> From: Fabrice Fontaine <fabrice.fontaine@orange.com>
> 
> C library for the MaxMind DB file format
> 
> The libmaxminddb library provides a C library for reading
> MaxMind DB files, including the GeoIP2 databases from MaxMind.
> This is a custom binary format designed to facilitate fast
> lookups of IP addresses while allowing for great flexibility
> in the type of data associated with an address.
> 
> The MaxMind DB format is an open format. The spec is available
> at http://maxmind.github.io/MaxMind-DB/. This spec is licensed
> under the Creative Commons Attribution-ShareAlike 3.0 Unported
> License.
> 
> http://maxmind.github.io/libmaxminddb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, I've applied your patch, after adding an entry to the
DEVELOPERS file. However, I have some suggestions on your configure.ac
patch:

> +diff --git a/configure.ac b/configure.ac
> +index 7916212..fc53ffd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -119,6 +119,16 @@ AC_ARG_ENABLE(
> +         esac],[debug=false])
> + AM_CONDITIONAL([DEBUG], [test x$debug = xtrue])
> + 
> ++AC_ARG_ENABLE(
> ++        [tests],
> ++        [  --enable-tests    Compilation of tests code],

This should use AS_HELP_STRING(), see
https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Pretty-Help-Strings.html.

> ++        [case "${enableval}" in
> ++          yes) tests=true ;;
> ++          no)  tests=false ;;
> ++          *) AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
> ++        esac],[tests=false])

This is very convoluted, and in addition, you default to not building
the tests, which causes a change in behavior compared to when the
option did not exist. I would suggest:

AC_ARG_ENABLE([tests],
	AS_HELP_STRING([--enable-tests], [Compilation of tests code],
	[enable_tests=${enableval}],
	[enable_tests=yes])

AM_CONDITIONAL([TESTS], [test "${enable_tests}" = "yes"])

This is much more "classical" autoconf code I believe.

I've anyway applied your patch because for the purpose of Buildroot it
works, but you might want to submit upstream an improved version. Of
course, we can also take an improved version in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
