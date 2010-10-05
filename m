From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  5 Oct 2010 06:07:53 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20101005060753.368218B891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759

--- Comment #7 from Lionel Landwerlin <llandwerlin@gmail.com>  ---
I'm still having this problem too.
To reproduce this bug you have to use an internal toolchain without locale
support. Sysstat always try to use intl symbols, but never adds -lintl link
flag.

So basicly sysstat's makefile/configure is broken. It should be able to detect
whether or not -lintl is required.


(In reply to comment #6)

> libsyscom.a -s
> sadc.o: In function `p_write_error':
> sadc.c:(.text+0x13c): undefined reference to `libintl_gettext'
> sadc.o: In function `usage':
> sadc.c:(.text+0x1dc): undefined reference to `libintl_gettext'
> sadc.c:(.text+0x218): undefined reference to `libintl_gettext'
> sadc.o: In function `setup_file_hdr':
> sadc.c:(.text+0x1184): undefined reference to `libintl_gettext'
> sadc.o: In function `create_sa_file':
> sadc.c:(.text+0x13f4): undefined reference to `libintl_gettext'
> sadc.o:sadc.c:(.text+0x17e8): more undefined references to `libintl_gettext'
> follow
> libsyscom.a(common.o): In function `init_nls':
> common.c:(.text+0xabc): undefined reference to `libintl_bindtextdomain'
> common.c:(.text+0xad8): undefined reference to `libintl_textdomain'
> libsyscom.a(common.o): In function `print_version':
> common.c:(.text+0x139c): undefined reference to `libintl_gettext'
> libsyscom.a(ioconf.o): In function `transform_devmapname':
> ioconf.c:(.text+0x214): undefined reference to `libintl_gettext'
> collect2: ld returned 1 exit status
> make[1]: *** [sadc] Error 1
> make[1]: *** Waiting for unfinished jobs....
> sar.o: In function `print_usage_title':
> sar.c:(.text+0xc8): undefined reference to `libintl_gettext'
> sar.o: In function `print_read_error':
> sar.c:(.text+0x124): undefined reference to `libintl_gettext'
> sar.o: In function `display_help':
> sar.c:(.text+0x19c): undefined reference to `libintl_gettext'
> sar.c:(.text+0x1cc): undefined reference to `libintl_gettext'
> sar.c:(.text+0x1fc): undefined reference to `libintl_gettext'
> sar.o:sar.c:(.text+0x22c): more undefined references to `libintl_gettext'
> follow
> libsyscom.a(common.o): In function `init_nls':
> common.c:(.text+0xabc): undefined reference to `libintl_bindtextdomain'
> common.c:(.text+0xad8): undefined reference to `libintl_textdomain'
> libsyscom.a(common.o): In function `print_version':
> common.c:(.text+0x139c): undefined reference to `libintl_gettext'
> libsyscom.a(ioconf.o): In function `transform_devmapname':
> ioconf.c:(.text+0x214): undefined reference to `libintl_gettext'
> collect2: ld returned 1 exit status
> make[1]: *** [sar] Error 1
> make[1]: Leaving directory
> `/home/sergio/hardware/moviecube/buildroot/output/build/sysstat-9.0.5'
> make: ***
> [/home/sergio/hardware/moviecube/buildroot/output/build/sysstat-9.0.5/.stamp_built]
> Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
