From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Tue, 5 Feb 2019 18:23:21 +0100
Subject: [Buildroot] [Question] Glibc 2.27+ build and localedef
Message-ID: <CABhNV20+Gv6n0hbNK81fNjOcOv3MOTOu_=SOVnZ3ikERo84nmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys

I just upgraded my buildroot from 2017.02 (glibc 2.23) to master
(glibc 2.28), and I'm having trouble with setlocale.
$ export LC_ALL=en_US.UTF-8
-bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)

I think this commit is causing some issues with our old localedef:
https://github.com/bminor/glibc/commit/58b1a7eaf9099f7db793ecf6718c43ff7f4ec0d4#diff-4ef3edca6b1476bee09d60d0af7e4d1b
, and some missing fields in en_US locale are also triggering more
warnings.So the file /usr/lib/locale/locale-archive isn't working as
it should.

The host localedef version we are using in buildroot is pretty old
(eglibc 2.14.1, never bumped since 2012-05-09), but glibc is now at
2.28-69.

I tried to bypass the issue by building host-glibc (which needs
host-linux-headers) instead of host-localedef, but that's opening a
whole other can of worms.
I can copy $(STAGING_DIR)/usr/bin/localedef and
$(STAGING_DIR)/usr/share/i18n to the target and build a valid
locale-archive there, but I'd like this to work on the host too.

Is this a known issue, or is it just me?
--
Relevant stuff:
BR2_GCC_TARGET_MODE="arm"
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GLIBC=y
BR2_GCC_VERSION="7.3.0"
BR2_ENDIAN="LITTLE"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_ENABLE_LOCALE=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US"
BR2_GENERATE_LOCALE="en_US.UTF-8 en_US.ISO-8859-1"
$ ./locale -a   # with  $(STAGING_DIR)/usr/bin/locale
C
en_US.iso88591
en_US.utf8
POSIX
$ file /usr/lib/locale/locale-archive
/usr/lib/locale/locale-archive: locale archive 26 strings

--
Regards
Einar J?n
