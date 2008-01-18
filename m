From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 18 Jan 2008 16:18:36 +0200
Subject: [Buildroot] Building without multibute is pain
In-Reply-To: <47905627.8060400@pxe.ru>
References: <47905627.8060400@pxe.ru>
Message-ID: <4790B53C.5020403@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,


The similar problem was discussed here http://busybox.net/bugs/view.php?id=1546

Regards,
Ivan


Andrey Kovalev wrote:
> Hi all,
> 
> I use snapshot buildroot-20080117.tar.bz2. I've made only two changes to
> default configuration:
> - check "Target options / Generic development system"
> - set "Kernel type" to (none).
> 
> 
> 1. Then I run make, and it stopped with folowing messages:
> 
> ===
> make[3]: Entering directory
> `/uc3/26v2/buildroot/build_i386/coreutils-6.9/lib'
> 
> /uc3/26v2/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
> -Os -pipe  -I/uc3/26v2/buildroot/build_i386/staging_dir/usr/include
> -I/uc3/26v2/buildroot/build_i386/staging_dir/include
> --sysroot=/uc3/26v2/buildroot/build_i386/staging_dir/ -isysroot
> /uc3/26v2/buildroot/build_i386/staging_dir -mtune=i386 -march=i386  -I.
>      -g -O2 -c mbchar.c
> In file included from mbchar.h:157,
> 
>                   from mbchar.c:22:
> 
> ./wchar.h:41:12: error: empty filename in #include
> 
> In file included from mbchar.c:22:
> 
> mbchar.h:242: error: expected ')' before 'wc'
> 
> make[3]: *** [mbchar.o] Error 1
> 
> make[3]: Leaving directory
> `/uc3/26v2/buildroot/build_i386/coreutils-6.9/lib'
> 
> ===
> 
> Really, lines 40-41 in file build_i386/coreutils-6.9/lib/wchar.h are:
> /* Include the original <wchar.h>.  */
> #include ""
> The same error apears in findutils-4.2.31.
> 
> 
> 2. After removing line 41, next error appears:
> 
> ===
> In file included from mbchar.c:23:
> mbchar.h:242: error: expected ')' before 'wc'
> ===
> 
> Workaround: file build_i386/coreutils-6.9/lib/mbchar.h line 242
> -mb_width_aux (wint_t wc)
> +mb_width_aux (int wc)
> 
> The same error apears in findutils-4.2.31 and tar-1.18.
> 
> 
> 3. Next error:
> 
> ===
> In file included from regex.c:62:
> regcomp.c: In function 'init_dfa':
> regcomp.c:867: error: 'MB_CUR_MAX' undeclared (first use in this function)
> regcomp.c:867: error: (Each undeclared identifier is reported only once
> regcomp.c:867: error: for each function it appears in.)
> make[3]: *** [regex.o] Error 1
> ===
> 
> Workaround: file build_i386/coreutils-6.9/lib/regcomp.c line 867
> -dfa->mb_cur_max = MB_CUR_MAX;
> +dfa->mb_cur_max = 1;
> The same error apears in tar-1.18.
> 
> 
> 4. Next:
> 
> ===
> if
> /uc3/26v2/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
> -DDEFPATH="\".:/usr/share/awk\"" -DHAVE_CON FIG_H -DGAWK
> -DLOCALEDIR="\"/usr/share/locale\"" -I. -I. -I.     -g -O2 -MT regex.o
> -MD -MP -MF ".deps/regex.Tpo" -c -o
>   regex.o regex.c; \
> 
>          then mv -f ".deps/regex.Tpo" ".deps/regex.Po"; else rm -f
> ".deps/regex.Tpo"; exit 1; fi
> In file included from regex.c:67:
> 
> regex_internal.h:744: error: expected specifier-qualifier-list before
> 'wchar_t'
> ===
> 
> Workaround: file build_i386/gawk-3.1.5/regex_internal.h line 744
> -wchar_t wch;
> +unsigned int wch;
> 
> 
> 5. Next:
> 
> ===
> /uc3/26v2/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
> -Os -pipe  -I/uc3/26v2/buildroot/build_i386/staging_dir/usr/include
> -I/uc3/26v2/buildroot/build_i386/staging_dir/include
> --sysroot=/uc3/26v2/buildroot/build_i386/staging_dir/ -isysroot
> /uc3/26v2/buildroot/build_i386/staging_dir -mtune=i386 -march=i386  -g
> -O2   -o grep  grep.o dfa.o
> kwset.o search.o grepmat.o ../lib/libgreputils.a
> 
> dfa.o: In function `xmalloc':
> 
> /uc3/26v2/buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
> reference to `libintl_gettext'
> ===
> 
> Workaround: file build_i386/grep-2.5.1/config.h line 116:
> -#define HAVE_LIBINTL_H 1
> 
> 
> 6. Next:
> 
> ===
> /uc3/26v2/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
> -Os -pipe  -I/uc3/26v2/buildroot/build_i386/staging_dir/usr/include
> -I/uc3/26v2/buildroot/build_i386/staging_dir/include
> --sysroot=/uc3/26v2/buildroot/build_i386/staging_dir/ -isysroot
> /uc3/26v2/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 -c
> -D_GNU_SOURCE -I proc -fno-common -ffast-math -W -Wall -Wshadow
> -Wcast-align -Wredundant-decls -Wbad-function-cast -Wcast-qual
> -Wwrite-strings -Waggregate-return -Wstrict-prototypes
> -Wmissing-prototypes   -Wdeclaration-after-statement -Wpadded
> -Wstrict-aliasing -fweb -frename-registers -fomit-frame-pointer
> -fno-inline-functions -DSHARED=1 -fpic proc/escape.c -o proc/escape.o
> 
> proc/escape.c:19:20: error: wchar.h: No such file or directory
> 
> proc/escape.c:20:21: error: wctype.h: No such file or directory
> 
> proc/escape.c: In function 'escape_str_utf8':
> 
> proc/escape.c:30: error: 'mbstate_t' undeclared (first use in this
> function)
> ...more errors...
> ===
> 
> Workaround: file build_i386/procps-3.2.5/proc/escape.c line 18
> +#undef __GNU_LIBRARY__
> +#define __GNU_LIBRARY__ 1
> 
> 
> 7. Next:
> 
> ===
> if
> /uc3/26v2/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
> -DHAVE_CONFIG_H -I. -I. -I..  -I../lib -I../intl -I.. -I../lib -I../intl
> -g -O2 -MT regex.o -MD -MP -MF ".deps/regex.Tpo" -c -o regex.o regex.c;
> \
>          then mv -f ".deps/regex.Tpo" ".deps/regex.Po"; else rm -f
> ".deps/regex.Tpo"; exit 1; fi
> In file included from regex.c:62:
> 
> regex_internal.h:677: error: expected specifier-qualifier-list before
> 'wchar_t'
> In file included from regex.c:65:
> 
> regcomp.c: In function 'init_dfa':
> 
> regcomp.c:836: error: 'MB_CUR_MAX' undeclared (first use in this
> function)
> ===
> 
> Workaround1: file build_i386/sed-4.1.5/lib/regex_internal.h line 677
> -wchar_t wch;
> +unsigned int wch;
> 
> Workaround2: file build_i386/sed-4.1.5/lib/regcomp.c line 836
> -dfa->mb_cur_max = MB_CUR_MAX;
> +dfa->mb_cur_max = 1;
> 
> 
> 
> 
> 
> YEAH! Finished. Then I try to enter into buildroot and to build uclibc
> again (it's just simple test to see the problem):
> 
> cp dl/uClibc-0.9.29.tar.bz2 project_build_i386/uclibc/root/tmp
> chroot project_build_i386/uclibc/root /bin/su -
> cd /tmp
> tar -xjf uClibc-0.9.29.tar.bz2 (this tar is running inside buildroot)
> cd uClibc-0.9.29
> make clean
> 
> And I receive:
> 
> ===
> [root at compiler uClibc-0.9.29]# make clean
> grep: memory exhausted
> 
> grep: memory exhausted
> 
> rm -f lib*/*.a ldso/*/*.a libpthread/*/*.a
> 
> rm -f include/fpu_control.h include/dl-osinfo.h include/hp-timing.h
> 
> make -C extra/locale locale_clean
> 
> grep: memory exhausted
> 
> grep: memory exhausted
> 
> rm -f ../../extra/locale/gen_collate ../../extra/locale/gen_wc8bit
> ../../extra/locale/gen_wctype ../../extra/locale/loc
> ale_data.c ../../extra/locale/{*.{o,os,txt},gen_locale,gen_ldc}
> 
> rm -f
> ../../extra/locale/{uClibc_locale_data,lt_defines,c8tables,wctables,locale_tables,locale_collate}.h 
> 
> 
> rm -f ../../extra/locale/{lmmtolso,gen_mmap,locale.mmap}
> 
> make[1]: *** [locale_clean] Segmentation fault
> 
> make: *** [clean] Error 2
> ===
> 
> 
> Please, help me.
> 
> 
> 
