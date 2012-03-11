From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Mar 2012 15:28:41 +0100
Subject: [Buildroot] New package minicom
In-Reply-To: <CAHt8ZCNu6JL+dO4YzucYVtFAoH7rEFu8YRJ08PQ5yTH2HDUU7w@mail.gmail.com>
 (Simon Dawson's message of "Fri, 9 Mar 2012 13:18:03 +0000")
References: <CAHt8ZCNu6JL+dO4YzucYVtFAoH7rEFu8YRJ08PQ5yTH2HDUU7w@mail.gmail.com>
Message-ID: <87r4wz2ova.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 Simon> Signed-off-by: Simon Dawson<spdawson@gmail.com>
 Simon> ---
 Simon>  package/Config.in          |    1 +
 Simon>  package/minicom/Config.in  |    9 +++++++++
 Simon>  package/minicom/minicom.mk |   12 ++++++++++++
 Simon>  3 files changed, 22 insertions(+), 0 deletions(-)
 Simon>  create mode 100644 package/minicom/Config.in
 Simon>  create mode 100644 package/minicom/minicom.mk

 Simon> diff --git a/package/Config.in b/package/Config.in
 Simon> index 41cbb8c..c582f8a 100644
 Simon> --- a/package/Config.in
 Simon> +++ b/package/Config.in
 Simon> @@ -197,6 +197,7 @@ source "package/lvm2/Config.in"
 Simon>  source "package/makedevs/Config.in"
 Simon>  source "package/mdadm/Config.in"
 Simon>  source "package/memtester/Config.in"
 Simon> +source "package/minicom/Config.in"
 Simon>  source "package/mtd/Config.in"
 Simon>  source "package/ntfs-3g/Config.in"
 Simon>  source "package/ntfsprogs/Config.in"
 Simon> diff --git a/package/minicom/Config.in b/package/minicom/Config.in
 Simon> new file mode 100644
 Simon> index 0000000..9a69eb1
 Simon> --- /dev/null
 Simon> +++ b/package/minicom/Config.in
 Simon> @@ -0,0 +1,9 @@
 Simon> +config BR2_PACKAGE_MINICOM
 Simon> +       bool "minicom"

These lines should be idented with a <tab> instead of spaces.

 Simon> +       select BR2_PACKAGE_LIBICONV

libiconv is only needed if the toolchain doesn't have locale (E.G. has
iconv support), so this should be

select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

It also needs WCHAR support in the toolchain, and uses ncurses, so those
needs to be depended on / selected as well.

 Simon> +       help
 Simon> +         Minicom is a menu driven communications program.
 Simon> +         It emulates ANSI and VT102 terminals. It has a
 Simon> +         dialing directory and auto zmodem download.

And help lines with <tab><space><space>.

 Simon> +
 Simon> +         http://alioth.debian.org/projects/minicom
 Simon> diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
 Simon> new file mode 100644
 Simon> index 0000000..f6bcd6c
 Simon> --- /dev/null
 Simon> +++ b/package/minicom/minicom.mk
 Simon> @@ -0,0 +1,12 @@
 Simon> +#############################################################
 Simon> +#
 Simon> +# minicom
 Simon> +#
 Simon> +#############################################################
 Simon> +MINICOM_VERSION = 2.6
 Simon> +MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
 Simon> +MINICOM_SITE = http://alioth.debian.org/frs/download.php/3689/
 Simon> +

The configure script uses pkg-config to detect if liblockdev is
available, so normally you need to depend on host-pkg-config. We don't
have liblockdev in BR (yet?), so I instead set PKG_CONFIG to /bin/false
as it takes a while to build pkg-config.

 Simon> +MINICOM_DEPENDENCIES = libiconv

libiconv should only be added for !BR2_ENABLE_LOCALE, and ncurses should
be added as well.

I've committed it with those fixes, thanks.

-- 
Bye, Peter Korsgaard
