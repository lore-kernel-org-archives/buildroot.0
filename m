Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A2C54791
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 22:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5148B60887;
	Sat,  9 Mar 2024 22:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pDObmofxutC; Sat,  9 Mar 2024 22:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 741E7608C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 741E7608C9;
	Sat,  9 Mar 2024 22:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1691BF3EB
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 22:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A6D04010C
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 22:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2PSbkYsQivM for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 22:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com;
 envelope-from=cenkandac@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EA8A400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA8A400D9
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EA8A400D9
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 22:31:23 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-690a60d396aso14424426d6.1
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 14:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710023483; x=1710628283;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6H/UIksneeXEXbYTyNI4x6nT/2QvOctmtviasVpvlRA=;
 b=tOCua8Sk3gY3dMG19HW/Vg06ugLQ75aRruD+4zZVPlDYjbX+m242hXi2SIOAwRgyTq
 xWg+WUToh4NIc/gmg4B08AmUaoUTjPbF8ZvEUw7yhwUzq7YnfJeVi+wDDboHwfeYpuNq
 8zGEnJKKujEw6GKV/1faf3CIZHuu38VyEhHLsVhQVWZS1goMrgjQkjakAjyS0W1oxAUw
 SAiJe0z7XizBgPF8Ylg3OUamYV5kNsLyRPiqoJ1k2A6bvV03uVKIAiXS7P9WTlkDPdIs
 +eXQgoBG4UNXULWADrx+j5eEoMLOoaGtQgg+cz8lW5sNergtc6sQCri/AjOJ7oX7+s0h
 QA+w==
X-Gm-Message-State: AOJu0Yz65pChMk33xO4dOGc0utXux1sHQvU8Jy+QpQC9biDurb5syp3x
 0U/FezleEn1T5ulFDQXbzknicxaAUx+qG6YQ6bcf3PRWDHV9oe9VuBGuW+vECG7xrv6uvcz7k5t
 38jZiyM4xr25rdQNuXEMzL63FzRjDvCCWnks=
X-Google-Smtp-Source: AGHT+IG7/T3J+WxVvtooB08G1nB2tEzSvGWyOLZT2YI/at7xd534Wi9Ja+KEh5aEu8YNmRyBEjO6sEKAEaBbu8vZszc=
X-Received: by 2002:a05:6214:bc8:b0:690:ba21:afe3 with SMTP id
 ff8-20020a0562140bc800b00690ba21afe3mr2949493qvb.31.1710023482236; Sat, 09
 Mar 2024 14:31:22 -0800 (PST)
MIME-Version: 1.0
From: Cenk Andac <cenkandac@gmail.com>
Date: Sun, 10 Mar 2024 01:31:10 +0300
Message-ID: <CAHO7KVcND0YgNHNHO=SSeAB=KtW7vea1LxaaMnVzVeuuHPknnw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710023483; x=1710628283; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6H/UIksneeXEXbYTyNI4x6nT/2QvOctmtviasVpvlRA=;
 b=mzv5OZkU6w4j9EpWl+2UAEuYrfU3KIDl9H+Z0Xod9pUdsdN4BUaDE1Jse7ZnE8n3a9
 y9DKH0nzMLlQ1WMRzSs+Og9hGvvJP7nS+QzNX5zRNTI5Q8q90rWig/eb2IAACNtrpHWD
 VGT2PXKEc5ERVE6+JPSdPLPG3VbV65fLlltgmCHsiY/ommQp6Iwc3gE670Q8kBYjrzY0
 J+IekN1mIN8ReRrpdC/WBuRfcu6ME44wSXH6m67XKUvr+UGS+zIAoueF73vzidhs0+Sl
 WpuP+hg7bMS8rqAfhVWHfw62w2JmJSn8UO7+f/YYPiF5UwMhZqzRJ/NcjjNvDAfVURXt
 thDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mzv5OZkU
Subject: [Buildroot] =?utf-8?q?Error_message_=22previous_declaration_of_?=
	=?utf-8?b?4oCYR0NfaXNfaGVhcF9wdHLigJkiIG9uIGluc3RhbGxhdGlvbiBvZiBn?=
	=?utf-8?q?uile-3=2E0=2E9?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7020082847173704117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7020082847173704117==
Content-Type: multipart/alternative; boundary="0000000000003768bf061341ded1"

--0000000000003768bf061341ded1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear All,

I have been trying to install guile-3.0.9 on our server.
Here are the libraries I used:

module load centos7.9/comp/gcc/7
export WORKDIR=3D/home/cenk
####  autoconf-2.72
export PATH=3D$PATH:$WORKDIR/requirements/autoconf-2.72/bin
####  automake-1.16.5
export PATH=3D$PATH:$WORKDIR/requirements/automake-1.16.5/bin
####  bdwgc
export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/bdwgc/lib
export CPATH=3D$CPATH:$WORKDIR/requirements/bdwgc/include
export PK####  autoconf-2.72
export PATH=3D$PATH:$WORKDIR/requirements/autoconf-2.72/bin
####  automake-1.16.5
export PATH=3D$PATH:$WORKDIR/requirements/automake-1.16.5/bin
####  bdwgc
export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/bdwgc/lib
export CPATH=3D$CPATH:$WORKDIR/requirements/bdwgc/include
export
PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$WORKDIR/requirements/bdwgc/lib/pkgconfi=
g
####  gettext-0.22.5
export PATH=3D$PATH:$WORKDIR/requirements/gettext-0.22.5/bin
export
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/gettext-0.22.5/lib
export CPATH=3D$CPATH:$WORKDIR/requirements/gettext-0.22.5/include
####  gmp-6.3.0
export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/gmp-6.3.0/l=
ib
export CPATH=3D$CPATH:$WORKDIR/requirements/gmp-6.3.0/include
####  libffi-3.4.5
export
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/libffi-3.4.5/lib
export CPATH=3D$CPATH:$WORKDIR/requirements/libffi-3.4.5/include
export
PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$WORKDIR/requirements/libffi-3.4.5/lib/p=
kgconfig
####  libiconv-1.17
export PATH=3D$PATH:$WORKDIR/requirements/libiconv-1.17/bin
export
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/libiconv-1.17/lib
export CPATH=3D$CPATH:$WORKDIR/requirements/libiconv-1.17/include
####  libtool-2.4.7
export PATH=3D$PATH:$WORKDIR/requirements/libtool-2.4.7/bin
export
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/libtool-2.4.7/lib
export CPATH=3D$CPATH:$WORKDIR/requirements/libtool-2.4.7/include
####  libunistring-1.2
export
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/libunistring-1.2/l=
ib
export CPATH=3D$CPATH:$WORKDIR/requirements/libunistring-1.2/include
####  m4-1.4.19
export PATH=3D$PATH:$WORKDIR/requirements/m4-1.4.19/bin
####  make-4.4.1
export PATH=3D$PATH:$WORKDIR/requirements/make-4.4.1/bin
export CPATH=3D$CPATH:$WORKDIR/requirements/make-4.4.1/include
####  texinfo-7.1
export PATH=3D$PATH:$WORKDIR/requirements/texinfo-7.1/bin
export
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/texinfo-7.1/lib
####  pkg-config-0.29.2
export PATH=3D$PATH:$WORKDIR/requirements/pkg-config-0.29.2/bin
####
export M4=3D$WORKDIR/requirements/m4-1.4.19/bin/m4
export MAKEINFO=3D$WORKDIR/requirements/texinfo-7.1/bin/makeinfo
export HELP2MAN=3D$WORKDIR/requirements/texinfo-7.1/bin/help2man
export MAKE=3D$WORKDIR/requirements/make-4.4.1/bin/make
export AUTOCONF=3D$WORKDIR/requirements/autoconf-2.72/bin/autoconf
export AUTOMAKE=3D$WORKDIR/requirements/automake-1.16.5/bin/automake
export GETTEXT=3D$WORKDIR/requirements/gettext-0.22.5/bin/gettext
export ICONV=3D$WORKDIR/requirements/libiconv-1.17/bin/iconv
export LIBTOOL=3D$WORKDIR/requirements/libtool-2.4.7/bin/libtool
export PKGCONFIG=3D$WORKDIR/requirements/pkg-config-0.29.2/bin/pkg-config

Here is the configuration command lines I used :

./configure --prefix=3D$WORKDIR/requirements/guile-3.0.8 --enable-shared
--disable-silent-rules --disable-static
PKG_CONFIG_PATH=3D"$WORKDIR/requirements/bdwgc/lib/pkgconfig:$WORKDIR/requi=
rements/libffi-3.4.5/lib/pkgconfig"
CPPFLAGS=3D"-I$WORKDIR/requirements/libtool-2.4.7/include
-I$WORKDIR/requirements/libunistring-1.2/include
-I$WORKDIR/requirements/libiconv-1.17/include
-I$WORKDIR/requirements/gmp-6.3.0/include
-I$WORKDIR/requirements/libunistring-1.2/include
-I$WORKDIR/requirements/gettext-0.22.5/include
-I$WORKDIR/requirements/libffi-3.4.5/include"
LDFLAGS=3D"-L$WORKDIR/requirements/libtool-2.4.7/lib
-L$WORKDIR/requirements/libunistring-1.2/lib
-L$WORKDIR/requirements/libiconv-1.17/lib
-L$WORKDIR/requirements/gmp-6.3.0/lib
-L$WORKDIR/requirements/libunistring-1.2/lib
-L$WORKDIR/requirements/gettext-0.22.5/lib
-L$WORKDIR/requirements/libffi-3.4.5/lib"
BDW_GC_CFLAGS=3D"-I$WORKDIR/requirements/gettext-0.22.5/include"
PKG_CONFIG_PATH=3D"$WORKDIR/requirements/bdwgc/lib/pkgconfig:$WORKDIR/requi=
rements/libffi-3.4.5/lib/pkgconfig"
BDW_GC_LIBS=3D"-L$WORKDIR/requirements/gettext-0.22.5/lib"
LIBFFI_CFLAGS=3D"-I$WORKDIR/requirements/libffi-3.4.5/include"
LIBFFI_LIBS=3D"-L$WORKDIR/requirements/libffi-3.4.5/lib"
--with-libintl-prefix=3D$WORKDIR/requirements/gettext-0.22.5
--with-libiconv-prefix=3D$WORKDIR/requirements/libiconv-1.17
--with-libgmp-prefix=3D$WORKDIR/requirements/gmp-6.3.0
--with-libunistring-prefix=3D$WORKDIR/requirements/libunistring-1.2 2>&1 |
tee configure.log

I also made the following editions  in files

libguile/bdw-gc.h    --->  #include </home/cenk/requirements/bdwgc/gc/gc.h>
libguile/gc-inline.h  --->  #include
</home/cenk/requirements/bdwgc/gc/gc_inline.h>
libguile/vm.c  --->        #include
</home/cenk/requirements/bdwgc/include/gc/gc_mark.h>

before make installation, I checked in libguile dir as follows
cd libguile

gcc -std=3Dgnu99 -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I.. -I.. -I../lib
-I../lib -L/usr/local/lib -pthread -Wall -Wmissing-prototypes
-Wdeclaration-after-statement -Wundef -Wswitch-enum -fvisibility=3Dhidden
-Wdeclaration-after-statement -Wundef -Wswitch-enum -fvisibility=3Dhidden
-I/usr/local/include -g -O2 -MT libguile_3.0_la-vm.lo -MD -MP -MF
.deps/libguile_3.0_la-vm.Tpo -c vm.c -o libguile_3.0_la-vm.o -Q -time
-save-temps; echo EXIT STATUS $?; ls -l vm.*



And, here is the Error message I get:

In file included from vm.c:21:0:
../config.h:3169:34: warning: "__cplusplus" is not defined, evaluates to 0
[-Wundef]
 #if !defined HAVE_C_ALIGNASOF && __cplusplus < 201103 && !defined alignof
                                  ^~~~~~~~~~~
../config.h:3170:6: warning: "HAVE_STDALIGN_H" is not defined, evaluates to
0 [-Wundef]
 # if HAVE_STDALIGN_H
      ^~~~~~~~~~~~~~~

Execution times (seconds)
 phase setup             :   0.26 (100%) usr   0.14 (93%) sys   1.74 (98%)
wall    5978 kB (100%) ggc
 TOTAL                 :   0.26             0.15             1.78
    5987 kB
Extra diagnostic checks enabled; compiler may run slowly.
Configure with --enable-checking=3Drelease to disable checks.
# cc1 0.26 0.23
 __signbitf __signbit __signbitl vprintf getchar fgetc_unlocked
getc_unlocked getchar_unlocked putchar fputc_unlocked putc_unlocked
putchar_unlocked getline feof_unlocked ferror_unlocked __bswap_32
__bswap_64 gnu_dev_major gnu_dev_minor gnu_dev_makedev atoi atol atoll atof
__strcspn_c1 __strcspn_c2 __strcspn_c3 __strspn_c1 __strspn_c2 __strspn_c3
__strpbrk_c2 __strpbrk_c3 __strtok_r_1c __strsep_1c __strsep_2c __strsep_3c
pthread_equal __sigismember __sigaddset __sigdelset scm_cell
scm_double_cell scm_words scm_cons scm_is_pair scm_car scm_cdr
GC_is_heap_ptr
In file included from alist.h:26:0,
                 from vm.c:38:
../libguile/pairs.h:205:1: error: conflicting types for =E2=80=98GC_is_heap=
_ptr=E2=80=99
 GC_is_heap_ptr (void *ptr)
 ^~~~~~~~~~~~~~
In file included from ../libguile/bdw-gc.h:48:0,
                 from ../libguile/gc.h:142,
                 from ../libguile/pairs.h:26,
                 from alist.h:26,
                 from vm.c:38:
/home/cenk/requirements/bdwgc/include/gc/gc.h:598:12: note: previous
declaration of =E2=80=98GC_is_heap_ptr=E2=80=99 was here
 GC_API int GC_CALL GC_is_heap_ptr(const void *);
            ^~~~~~~~~~~~~~
 scm_is_mutable_pair scm_c_make_char scm_new_smob scm_new_double_smob
scm_i_make_program scm_is_atomic_box scm_atomic_box_loc
scm_atomic_subtract_uint32 scm_atomic_compare_and_swap_uint32
scm_atomic_set_pointer scm_atomic_ref_pointer scm_atomic_set_scm
scm_atomic_ref_scm scm_atomic_swap_scm scm_atomic_compare_and_swap_scm
scm_make_cache scm_cache_full_p scm_cache_evict_1 scm_cache_lookup
scm_cache_insert scm_inline_gc_bytes_to_freelist_index
scm_inline_gc_freelist_object_size scm_inline_gc_alloc
scm_inline_gc_malloc_pointerless scm_inline_gc_malloc
scm_inline_gc_malloc_words scm_inline_gc_malloc_pointerless_words
scm_inline_cell scm_inline_double_cell scm_inline_words scm_inline_cons {GC
5325k -> 4368k} __gmpz_abs __gmpz_fits_uint_p __gmpz_fits_ulong_p
__gmpz_fits_ushort_p __gmpz_get_ui __gmpz_getlimbn __gmpz_neg
__gmpz_perfect_square_p __gmpz_popcount __gmpz_set_q __gmpz_size __gmpq_abs
__gmpq_neg __gmpn_add __gmpn_add_1 __gmpn_cmp __gmpn_sub __gmpn_sub_1
__gmpn_neg scm_is_string scm_is_values scm_i_nvalues scm_i_value_ref
scm_i_raw_array scm_array_handle_ref scm_array_handle_set vm_increase_sp
vm_push_sp vm_restore_sp scm_i_vm_cont_print scm_i_vm_cont_to_frame
capture_stack scm_i_capture_current_stack vm_hook_compute_enabled
vm_recompute_disable_mcode set_vm_trace_level invoke_hook invoke_apply_hook
invoke_return_hook invoke_next_hook invoke_abort_hook
vm_error_bad_instruction scm_i_vm_is_boot_continuation_code
scm_vm_builtin_ref scm_vm_builtin_name_to_index
scm_vm_builtin_index_to_name scm_init_vm_builtins instrumented_code
define_vm_builtins scm_i_call_with_current_continuation vm_regular_engine
In file included from vm.c:506:0:
vm-engine.c: In function =E2=80=98vm_regular_engine=E2=80=99:
vm-engine.c:777:11: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
           SCM rest =3D CALL_INTRINSIC (cons_rest, (thread, dst));
           ^~~
In file included from vm.c:506:0:
vm-engine.c:3397:7: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
       uint64_t i =3D SP_REF_U64 (idx);
       ^~~~~~~~
vm-engine.c:3399:7: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
       int32_t offset =3D offsets[i < len ? i : len - 1];
       ^~~~~~~
In file included from vm.c:506:0:
vm-engine.c:3474:7: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
       SCM res =3D intrinsic (a, b);
       ^~~
 {GC 6748k -> 6196k} vm_debug_engine
In file included from vm.c:514:0:
vm-engine.c: In function =E2=80=98vm_debug_engine=E2=80=99:
vm-engine.c:777:11: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
           SCM rest =3D CALL_INTRINSIC (cons_rest, (thread, dst));
           ^~~
In file included from vm.c:514:0:
vm-engine.c:3397:7: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
       uint64_t i =3D SP_REF_U64 (idx);
       ^~~~~~~~
vm-engine.c:3399:7: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
       int32_t offset =3D offsets[i < len ? i : len - 1];
       ^~~~~~~
In file included from vm.c:514:0:
vm-engine.c:3474:7: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
       SCM res =3D intrinsic (a, b);
       ^~~
 allocate_stack free_stack expand_stack scm_i_vm_prepare_stack
return_unused_stack_to_os find_slot_map scm_i_vm_mark_stack
scm_i_vm_free_stack vm_expand_stack_inner current_overflow_size
should_handle_stack_overflow reset_stack_limit wind_overflow_handler
unwind_overflow_handler vm_expand_stack frame_locals_count
thread_expand_stack alloc_frame compute_kwargs_npositional bind_kwargs
cons_rest push_interrupt_frame vm_return_to_continuation_inner
reinstate_continuation_x capture_continuation
vm.c: In function =E2=80=98capture_continuation=E2=80=99:
vm.c:1159:3: warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
   SCM vm_cont =3D capture_stack (vp->stack_top,
   ^~~
 compose_continuation_inner compose_continuation expand_apply_argument
unpack_values_object foreign_call capture_delimited_continuation
scm_i_vm_abort scm_i_vm_emergency_abort abort_to_prompt get_callee_vcode
scm_call_n scm_vm_add_apply_hook_x scm_vm_remove_apply_hook_x
scm_vm_add_return_hook_x scm_vm_remove_return_hook_x scm_vm_add_next_hook_x
scm_vm_remove_next_hook_x scm_vm_add_abort_hook_x
scm_vm_remove_abort_hook_x scm_vm_trace_level scm_set_vm_trace_level_x
symbol_to_vm_engine vm_engine_to_symbol scm_vm_engine scm_c_set_vm_engine_x
scm_set_vm_engine_x scm_c_set_default_vm_engine_x
scm_set_default_vm_engine_x scm_call_with_vm {GC 8056k -> 7699k}
scm_call_with_stack_overflow_handler scm_load_compiled_with_vm
scm_init_vm_builtin_properties scm_bootstrap_vm scm_init_vm
Analyzing compilation unit
 {GC 10560k -> 8594k}
Execution times (seconds)
 phase setup             :   0.01 ( 4%) usr   0.02 (12%) sys   0.04 (10%)
wall    1195 kB ( 7%) ggc
 phase parsing           :   0.18 (78%) usr   0.14 (88%) sys   0.34 (81%)
wall   10765 kB (67%) ggc
 phase opt and generate  :   0.03 (13%) usr   0.00 ( 0%) sys   0.03 ( 7%)
wall    4084 kB (25%) ggc
 phase finalize          :   0.01 ( 4%) usr   0.00 ( 0%) sys   0.01 ( 2%)
wall       0 kB ( 0%) ggc
 garbage collection      :   0.04 (17%) usr   0.00 ( 0%) sys   0.03 ( 7%)
wall       0 kB ( 0%) ggc
 callgraph construction  :   0.01 ( 4%) usr   0.00 ( 0%) sys   0.01 ( 2%)
wall     234 kB ( 1%) ggc
 preprocessing           :   0.03 (13%) usr   0.04 (25%) sys   0.10 (24%)
wall    1081 kB ( 7%) ggc
 lexical analysis        :   0.01 ( 4%) usr   0.02 (13%) sys   0.05 (12%)
wall       0 kB ( 0%) ggc
 parser (global)         :   0.04 (17%) usr   0.02 (13%) sys   0.08 (19%)
wall    4190 kB (26%) ggc
 parser function body    :   0.04 (17%) usr   0.05 (31%) sys   0.08 (19%)
wall    4092 kB (25%) ggc
 parser inl. func. body  :   0.02 ( 9%) usr   0.01 ( 6%) sys   0.01 ( 2%)
wall     473 kB ( 3%) ggc
 tree gimplify           :   0.01 ( 4%) usr   0.00 ( 0%) sys   0.01 ( 2%)
wall    3160 kB (20%) ggc
 symout                  :   0.01 ( 4%) usr   0.00 ( 0%) sys   0.00 ( 0%)
wall     568 kB ( 4%) ggc
 TOTAL                 :   0.23             0.16             0.42
   16058 kB
Extra diagnostic checks enabled; compiler may run slowly.
Configure with --enable-checking=3Drelease to disable checks.
# cc1 0.23 0.17
EXIT STATUS 1
-rw-r--r-- 1 cenk cenk  56207 Mar  9 11:21 vm.c
-rw-r--r-- 1 cenk cenk   5655 Ara 14  2019 vm.h
-rw-rw-r-- 1 cenk cenk 698832 Mar  9 18:02 vm.i
-rw-rw-r-- 1 cenk cenk     14 Mar  9 18:02 vm.s
-rw-rw-r-- 1 cenk cenk   2225 Mar  9 00:48 vm.x

Based on the error message I read, the main problem appears to be
" ../libguile/pairs.h:205:1: error: conflicting types for =E2=80=98GC_is_he=
ap_ptr=E2=80=99 "

Any help to work around this will be greatly appreciated.

Thanks in advance,

Jenk Andac

--0000000000003768bf061341ded1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear All,</div><div><br></div><div>I have been trying=
 to install guile-3.0.9 on our server. <br></div><div>Here are the librarie=
s I used:</div><div><br></div><div><span style=3D"font-family:monospace"><s=
pan style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">module loa=
d centos7.9/comp/gcc/</span><span style=3D"color:rgb(178,24,24);background-=
color:rgb(255,255,255)">7</span><br></span></div><div>export WORKDIR=3D/hom=
e/cenk<br></div><div>#### =C2=A0autoconf-2.72<br>export PATH=3D$PATH:$WORKD=
IR/requirements/autoconf-2.72/bin<br>#### =C2=A0automake-1.16.5<br>export P=
ATH=3D$PATH:$WORKDIR/requirements/automake-1.16.5/bin<br>#### =C2=A0bdwgc<b=
r>export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/bdwgc/lib=
<br>export CPATH=3D$CPATH:$WORKDIR/requirements/bdwgc/include<br>export PK#=
### =C2=A0autoconf-2.72<br>export PATH=3D$PATH:$WORKDIR/requirements/autoco=
nf-2.72/bin<br>#### =C2=A0automake-1.16.5<br>export PATH=3D$PATH:$WORKDIR/r=
equirements/automake-1.16.5/bin<br>#### =C2=A0bdwgc<br>export LD_LIBRARY_PA=
TH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/bdwgc/lib<br>export CPATH=3D$CP=
ATH:$WORKDIR/requirements/bdwgc/include<br>export PKG_CONFIG_PATH=3D$PKG_CO=
NFIG_PATH:$WORKDIR/requirements/bdwgc/lib/pkgconfig<br>#### =C2=A0gettext-0=
.22.5<br>export PATH=3D$PATH:$WORKDIR/requirements/gettext-0.22.5/bin<br>ex=
port LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/gettext-0.22.=
5/lib<br>export CPATH=3D$CPATH:$WORKDIR/requirements/gettext-0.22.5/include=
<br>#### =C2=A0gmp-6.3.0<br>export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORK=
DIR/requirements/gmp-6.3.0/lib<br>export CPATH=3D$CPATH:$WORKDIR/requiremen=
ts/gmp-6.3.0/include <br>#### =C2=A0libffi-3.4.5<br>export LD_LIBRARY_PATH=
=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/libffi-3.4.5/lib<br>export CPATH=
=3D$CPATH:$WORKDIR/requirements/libffi-3.4.5/include <br>export PKG_CONFIG_=
PATH=3D$PKG_CONFIG_PATH:$WORKDIR/requirements/libffi-3.4.5/lib/pkgconfig<br=
>#### =C2=A0libiconv-1.17<br>export PATH=3D$PATH:$WORKDIR/requirements/libi=
conv-1.17/bin<br>export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/require=
ments/libiconv-1.17/lib<br>export CPATH=3D$CPATH:$WORKDIR/requirements/libi=
conv-1.17/include<br>#### =C2=A0libtool-2.4.7<br>export PATH=3D$PATH:$WORKD=
IR/requirements/libtool-2.4.7/bin<br>export LD_LIBRARY_PATH=3D$LD_LIBRARY_P=
ATH:$WORKDIR/requirements/libtool-2.4.7/lib<br>export CPATH=3D$CPATH:$WORKD=
IR/requirements/libtool-2.4.7/include<br>#### =C2=A0libunistring-1.2<br>exp=
ort LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WORKDIR/requirements/libunistring-1=
.2/lib<br>export CPATH=3D$CPATH:$WORKDIR/requirements/libunistring-1.2/incl=
ude<br>#### =C2=A0m4-1.4.19 <br>export PATH=3D$PATH:$WORKDIR/requirements/m=
4-1.4.19/bin<br>#### =C2=A0make-4.4.1<br>export PATH=3D$PATH:$WORKDIR/requi=
rements/make-4.4.1/bin<br>export CPATH=3D$CPATH:$WORKDIR/requirements/make-=
4.4.1/include<br>#### =C2=A0texinfo-7.1<br>export PATH=3D$PATH:$WORKDIR/req=
uirements/texinfo-7.1/bin<br>export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:$WOR=
KDIR/requirements/texinfo-7.1/lib<br>#### =C2=A0pkg-config-0.29.2<br>export=
 PATH=3D$PATH:$WORKDIR/requirements/pkg-config-0.29.2/bin<br>####<br>export=
 M4=3D$WORKDIR/requirements/m4-1.4.19/bin/m4<br>export MAKEINFO=3D$WORKDIR/=
requirements/texinfo-7.1/bin/makeinfo <br>export HELP2MAN=3D$WORKDIR/requir=
ements/texinfo-7.1/bin/help2man<br>export MAKE=3D$WORKDIR/requirements/make=
-4.4.1/bin/make<br>export AUTOCONF=3D$WORKDIR/requirements/autoconf-2.72/bi=
n/autoconf<br>export AUTOMAKE=3D$WORKDIR/requirements/automake-1.16.5/bin/a=
utomake<br>export GETTEXT=3D$WORKDIR/requirements/gettext-0.22.5/bin/gettex=
t<br>export ICONV=3D$WORKDIR/requirements/libiconv-1.17/bin/iconv<br>export=
 LIBTOOL=3D$WORKDIR/requirements/libtool-2.4.7/bin/libtool<br>export PKGCON=
FIG=3D$WORKDIR/requirements/pkg-config-0.29.2/bin/pkg-config</div><div><br>=
</div><div>Here is the configuration command lines I used :</div><div><br><=
/div><div>./configure --prefix=3D$WORKDIR/requirements/guile-3.0.8 --enable=
-shared --disable-silent-rules --disable-static PKG_CONFIG_PATH=3D&quot;$WO=
RKDIR/requirements/bdwgc/lib/pkgconfig:$WORKDIR/requirements/libffi-3.4.5/l=
ib/pkgconfig&quot; CPPFLAGS=3D&quot;-I$WORKDIR/requirements/libtool-2.4.7/i=
nclude -I$WORKDIR/requirements/libunistring-1.2/include -I$WORKDIR/requirem=
ents/libiconv-1.17/include -I$WORKDIR/requirements/gmp-6.3.0/include -I$WOR=
KDIR/requirements/libunistring-1.2/include -I$WORKDIR/requirements/gettext-=
0.22.5/include -I$WORKDIR/requirements/libffi-3.4.5/include&quot; LDFLAGS=
=3D&quot;-L$WORKDIR/requirements/libtool-2.4.7/lib -L$WORKDIR/requirements/=
libunistring-1.2/lib -L$WORKDIR/requirements/libiconv-1.17/lib -L$WORKDIR/r=
equirements/gmp-6.3.0/lib -L$WORKDIR/requirements/libunistring-1.2/lib -L$W=
ORKDIR/requirements/gettext-0.22.5/lib -L$WORKDIR/requirements/libffi-3.4.5=
/lib&quot; BDW_GC_CFLAGS=3D&quot;-I$WORKDIR/requirements/gettext-0.22.5/inc=
lude&quot; PKG_CONFIG_PATH=3D&quot;$WORKDIR/requirements/bdwgc/lib/pkgconfi=
g:$WORKDIR/requirements/libffi-3.4.5/lib/pkgconfig&quot; BDW_GC_LIBS=3D&quo=
t;-L$WORKDIR/requirements/gettext-0.22.5/lib&quot; LIBFFI_CFLAGS=3D&quot;-I=
$WORKDIR/requirements/libffi-3.4.5/include&quot; LIBFFI_LIBS=3D&quot;-L$WOR=
KDIR/requirements/libffi-3.4.5/lib&quot; --with-libintl-prefix=3D$WORKDIR/r=
equirements/gettext-0.22.5 --with-libiconv-prefix=3D$WORKDIR/requirements/l=
ibiconv-1.17 --with-libgmp-prefix=3D$WORKDIR/requirements/gmp-6.3.0 --with-=
libunistring-prefix=3D$WORKDIR/requirements/libunistring-1.2 2&gt;&amp;1 | =
tee configure.log</div><div><br></div><div>I also made the following editio=
ns=C2=A0 in files</div><div><br></div><div>libguile/bdw-gc.h =C2=A0=C2=A0 -=
--&gt;=C2=A0 #include &lt;/home/cenk/requirements/bdwgc/gc/gc.h&gt;<br>libg=
uile/gc-inline.h=C2=A0 ---&gt;=C2=A0 #include &lt;/home/cenk/requirements/b=
dwgc/gc/gc_inline.h&gt;<br>libguile/vm.c=C2=A0 ---&gt; =C2=A0 =C2=A0 =C2=A0=
=C2=A0 #include &lt;/home/cenk/requirements/bdwgc/include/gc/gc_mark.h&gt;<=
/div><div><br></div><div>before make installation, I checked in libguile di=
r as follows=C2=A0</div><div>cd libguile=C2=A0</div><div><br></div><div></d=
iv>gcc -std=3Dgnu99 -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I.. -I.. -I../=
lib -I../lib -L/usr/local/lib -pthread -Wall -Wmissing-prototypes -Wdeclara=
tion-after-statement -Wundef -Wswitch-enum -fvisibility=3Dhidden -Wdeclarat=
ion-after-statement -Wundef -Wswitch-enum -fvisibility=3Dhidden -I/usr/loca=
l/include -g -O2 -MT libguile_3.0_la-vm.lo -MD -MP -MF .deps/libguile_3.0_l=
a-vm.Tpo -c vm.c -o libguile_3.0_la-vm.o -Q -time -save-temps; echo EXIT ST=
ATUS $?; ls -l vm.*<br><div><br></div><div><br></div><div><br></div><div>An=
d, here is the Error message I get:</div><div><br></div>In file included fr=
om vm.c:21:0:<br>../config.h:3169:34: warning: &quot;__cplusplus&quot; is n=
ot defined, evaluates to 0 [-Wundef]<br>=C2=A0#if !defined HAVE_C_ALIGNASOF=
 &amp;&amp; __cplusplus &lt; 201103 &amp;&amp; !defined alignof<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>../config.h:3170:6: w=
arning: &quot;HAVE_STDALIGN_H&quot; is not defined, evaluates to 0 [-Wundef=
]<br>=C2=A0# if HAVE_STDALIGN_H<br>=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~<br>=
<br>Execution times (seconds)<br>=C2=A0phase setup =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 : =C2=A0 0.26 (100%) usr =C2=A0 0.14 (93%) sys =C2=A0 1.7=
4 (98%) wall =C2=A0 =C2=A05978 kB (100%) ggc<br>=C2=A0TOTAL =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 0.26 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0.15 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.7=
8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5987 kB<br>Extra diagnos=
tic checks enabled; compiler may run slowly.<br>Configure with --enable-che=
cking=3Drelease to disable checks.<br># cc1 0.26 0.23<br>=C2=A0__signbitf _=
_signbit __signbitl vprintf getchar fgetc_unlocked getc_unlocked getchar_un=
locked putchar fputc_unlocked putc_unlocked putchar_unlocked getline feof_u=
nlocked ferror_unlocked __bswap_32 __bswap_64 gnu_dev_major gnu_dev_minor g=
nu_dev_makedev atoi atol atoll atof __strcspn_c1 __strcspn_c2 __strcspn_c3 =
__strspn_c1 __strspn_c2 __strspn_c3 __strpbrk_c2 __strpbrk_c3 __strtok_r_1c=
 __strsep_1c __strsep_2c __strsep_3c pthread_equal __sigismember __sigaddse=
t __sigdelset scm_cell scm_double_cell scm_words scm_cons scm_is_pair scm_c=
ar scm_cdr GC_is_heap_ptr<br>In file included from alist.h:26:0,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from vm.c:38:<br>../=
libguile/pairs.h:205:1: error: conflicting types for =E2=80=98GC_is_heap_pt=
r=E2=80=99<br>=C2=A0GC_is_heap_ptr (void *ptr)<br>=C2=A0^~~~~~~~~~~~~~<br>I=
n file included from ../libguile/bdw-gc.h:48:0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libguile/gc.h:142,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libguile/pai=
rs.h:26,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom alist.h:26,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from vm.c:38:<br>/home/cenk/requirements/bdwgc/include/gc/gc.h:598:12=
: note: previous declaration of =E2=80=98GC_is_heap_ptr=E2=80=99 was here<b=
r>=C2=A0GC_API int GC_CALL GC_is_heap_ptr(const void *);<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~<br>=C2=A0scm_is_mutable_pair scm=
_c_make_char scm_new_smob scm_new_double_smob scm_i_make_program scm_is_ato=
mic_box scm_atomic_box_loc scm_atomic_subtract_uint32 scm_atomic_compare_an=
d_swap_uint32 scm_atomic_set_pointer scm_atomic_ref_pointer scm_atomic_set_=
scm scm_atomic_ref_scm scm_atomic_swap_scm scm_atomic_compare_and_swap_scm =
scm_make_cache scm_cache_full_p scm_cache_evict_1 scm_cache_lookup scm_cach=
e_insert scm_inline_gc_bytes_to_freelist_index scm_inline_gc_freelist_objec=
t_size scm_inline_gc_alloc scm_inline_gc_malloc_pointerless scm_inline_gc_m=
alloc scm_inline_gc_malloc_words scm_inline_gc_malloc_pointerless_words scm=
_inline_cell scm_inline_double_cell scm_inline_words scm_inline_cons {GC 53=
25k -&gt; 4368k} __gmpz_abs __gmpz_fits_uint_p __gmpz_fits_ulong_p __gmpz_f=
its_ushort_p __gmpz_get_ui __gmpz_getlimbn __gmpz_neg __gmpz_perfect_square=
_p __gmpz_popcount __gmpz_set_q __gmpz_size __gmpq_abs __gmpq_neg __gmpn_ad=
d __gmpn_add_1 __gmpn_cmp __gmpn_sub __gmpn_sub_1 __gmpn_neg scm_is_string =
scm_is_values scm_i_nvalues scm_i_value_ref scm_i_raw_array scm_array_handl=
e_ref scm_array_handle_set vm_increase_sp vm_push_sp vm_restore_sp scm_i_vm=
_cont_print scm_i_vm_cont_to_frame capture_stack scm_i_capture_current_stac=
k vm_hook_compute_enabled vm_recompute_disable_mcode set_vm_trace_level inv=
oke_hook invoke_apply_hook invoke_return_hook invoke_next_hook invoke_abort=
_hook vm_error_bad_instruction scm_i_vm_is_boot_continuation_code scm_vm_bu=
iltin_ref scm_vm_builtin_name_to_index scm_vm_builtin_index_to_name scm_ini=
t_vm_builtins instrumented_code define_vm_builtins scm_i_call_with_current_=
continuation vm_regular_engine<br>In file included from vm.c:506:0:<br>vm-e=
ngine.c: In function =E2=80=98vm_regular_engine=E2=80=99:<br>vm-engine.c:77=
7:11: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-a=
fter-statement]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCM rest =3D CA=
LL_INTRINSIC (cons_rest, (thread, dst));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~<br>In file included from vm.c:506:0:<br>vm-engine.c:3397:7: w=
arning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-st=
atement]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t i =3D SP_REF_U64 (idx);<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>vm-engine.c:3399:7: warning: ISO C90=
 forbids mixed declarations and code [-Wdeclaration-after-statement]<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0int32_t offset =3D offsets[i &lt; len ? i : len - 1=
];<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br>In file included from vm.c:506:=
0:<br>vm-engine.c:3474:7: warning: ISO C90 forbids mixed declarations and c=
ode [-Wdeclaration-after-statement]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0SCM res =
=3D intrinsic (a, b);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>=C2=A0{GC 6748k =
-&gt; 6196k} vm_debug_engine<br>In file included from vm.c:514:0:<br>vm-eng=
ine.c: In function =E2=80=98vm_debug_engine=E2=80=99:<br>vm-engine.c:777:11=
: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after=
-statement]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCM rest =3D CALL_I=
NTRINSIC (cons_rest, (thread, dst));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~<br>In file included from vm.c:514:0:<br>vm-engine.c:3397:7: warni=
ng: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statem=
ent]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t i =3D SP_REF_U64 (idx);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>vm-engine.c:3399:7: warning: ISO C90 fo=
rbids mixed declarations and code [-Wdeclaration-after-statement]<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0int32_t offset =3D offsets[i &lt; len ? i : len - 1];<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br>In file included from vm.c:514:0:<=
br>vm-engine.c:3474:7: warning: ISO C90 forbids mixed declarations and code=
 [-Wdeclaration-after-statement]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0SCM res =3D =
intrinsic (a, b);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>=C2=A0allocate_stack=
 free_stack expand_stack scm_i_vm_prepare_stack return_unused_stack_to_os f=
ind_slot_map scm_i_vm_mark_stack scm_i_vm_free_stack vm_expand_stack_inner =
current_overflow_size should_handle_stack_overflow reset_stack_limit wind_o=
verflow_handler unwind_overflow_handler vm_expand_stack frame_locals_count =
thread_expand_stack alloc_frame compute_kwargs_npositional bind_kwargs cons=
_rest push_interrupt_frame vm_return_to_continuation_inner reinstate_contin=
uation_x capture_continuation<br>vm.c: In function =E2=80=98capture_continu=
ation=E2=80=99:<br>vm.c:1159:3: warning: ISO C90 forbids mixed declarations=
 and code [-Wdeclaration-after-statement]<br>=C2=A0 =C2=A0SCM vm_cont =3D c=
apture_stack (vp-&gt;stack_top,<br>=C2=A0 =C2=A0^~~<br>=C2=A0compose_contin=
uation_inner compose_continuation expand_apply_argument unpack_values_objec=
t foreign_call capture_delimited_continuation scm_i_vm_abort scm_i_vm_emerg=
ency_abort abort_to_prompt get_callee_vcode scm_call_n scm_vm_add_apply_hoo=
k_x scm_vm_remove_apply_hook_x scm_vm_add_return_hook_x scm_vm_remove_retur=
n_hook_x scm_vm_add_next_hook_x scm_vm_remove_next_hook_x scm_vm_add_abort_=
hook_x scm_vm_remove_abort_hook_x scm_vm_trace_level scm_set_vm_trace_level=
_x symbol_to_vm_engine vm_engine_to_symbol scm_vm_engine scm_c_set_vm_engin=
e_x scm_set_vm_engine_x scm_c_set_default_vm_engine_x scm_set_default_vm_en=
gine_x scm_call_with_vm {GC 8056k -&gt; 7699k} scm_call_with_stack_overflow=
_handler scm_load_compiled_with_vm scm_init_vm_builtin_properties scm_boots=
trap_vm scm_init_vm<br>Analyzing compilation unit<br>=C2=A0{GC 10560k -&gt;=
 8594k}<br>Execution times (seconds)<br>=C2=A0phase setup =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 0.01 ( 4%) usr =C2=A0 0.02 (12%) sys =C2=
=A0 0.04 (10%) wall =C2=A0 =C2=A01195 kB ( 7%) ggc<br>=C2=A0phase parsing =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 0.18 (78%) usr =C2=A0 0.14 (88%=
) sys =C2=A0 0.34 (81%) wall =C2=A0 10765 kB (67%) ggc<br>=C2=A0phase opt a=
nd generate =C2=A0: =C2=A0 0.03 (13%) usr =C2=A0 0.00 ( 0%) sys =C2=A0 0.03=
 ( 7%) wall =C2=A0 =C2=A04084 kB (25%) ggc<br>=C2=A0phase finalize =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=A0 0.01 ( 4%) usr =C2=A0 0.00 ( 0%) sys =
=C2=A0 0.01 ( 2%) wall =C2=A0 =C2=A0 =C2=A0 0 kB ( 0%) ggc<br>=C2=A0garbage=
 collection =C2=A0 =C2=A0 =C2=A0: =C2=A0 0.04 (17%) usr =C2=A0 0.00 ( 0%) s=
ys =C2=A0 0.03 ( 7%) wall =C2=A0 =C2=A0 =C2=A0 0 kB ( 0%) ggc<br>=C2=A0call=
graph construction =C2=A0: =C2=A0 0.01 ( 4%) usr =C2=A0 0.00 ( 0%) sys =C2=
=A0 0.01 ( 2%) wall =C2=A0 =C2=A0 234 kB ( 1%) ggc<br>=C2=A0preprocessing =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 0.03 (13%) usr =C2=A0 0.04 (25%=
) sys =C2=A0 0.10 (24%) wall =C2=A0 =C2=A01081 kB ( 7%) ggc<br>=C2=A0lexica=
l analysis =C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=A0 0.01 ( 4%) usr =C2=A0 0.02 (=
13%) sys =C2=A0 0.05 (12%) wall =C2=A0 =C2=A0 =C2=A0 0 kB ( 0%) ggc<br>=C2=
=A0parser (global) =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 0.04 (17%) usr =C2=
=A0 0.02 (13%) sys =C2=A0 0.08 (19%) wall =C2=A0 =C2=A04190 kB (26%) ggc<br=
>=C2=A0parser function body =C2=A0 =C2=A0: =C2=A0 0.04 (17%) usr =C2=A0 0.0=
5 (31%) sys =C2=A0 0.08 (19%) wall =C2=A0 =C2=A04092 kB (25%) ggc<br>=C2=A0=
parser inl. func. body =C2=A0: =C2=A0 0.02 ( 9%) usr =C2=A0 0.01 ( 6%) sys =
=C2=A0 0.01 ( 2%) wall =C2=A0 =C2=A0 473 kB ( 3%) ggc<br>=C2=A0tree gimplif=
y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A0 0.01 ( 4%) usr =C2=A0 0.00 ( =
0%) sys =C2=A0 0.01 ( 2%) wall =C2=A0 =C2=A03160 kB (20%) ggc<br>=C2=A0symo=
ut =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=A0 0=
.01 ( 4%) usr =C2=A0 0.00 ( 0%) sys =C2=A0 0.00 ( 0%) wall =C2=A0 =C2=A0 56=
8 kB ( 4%) ggc<br>=C2=A0TOTAL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : =C2=A0 0.23 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.16 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.42 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A016058 kB<br>Extra diagnostic checks enabled; compiler may =
run slowly.<br>Configure with --enable-checking=3Drelease to disable checks=
.<br># cc1 0.23 0.17<br>EXIT STATUS 1<br>-rw-r--r-- 1 cenk cenk =C2=A056207=
 Mar =C2=A09 11:21 vm.c<br>-rw-r--r-- 1 cenk cenk =C2=A0 5655 Ara 14 =C2=A0=
2019 vm.h<br>-rw-rw-r-- 1 cenk cenk 698832 Mar =C2=A09 18:02 vm.i<br>-rw-rw=
-r-- 1 cenk cenk =C2=A0 =C2=A0 14 Mar =C2=A09 18:02 vm.s<br><div>-rw-rw-r--=
 1 cenk cenk =C2=A0 2225 Mar =C2=A09 00:48 vm.x <br></div><div><br></div><d=
iv>Based on the error message I read, the main problem appears to be <br></=
div><div>&quot; ../libguile/pairs.h:205:1: error: conflicting types for =E2=
=80=98GC_is_heap_ptr=E2=80=99 &quot;</div><div><br></div><div>Any help to w=
ork around this will be greatly appreciated. <br></div><div><br></div><div>=
Thanks in advance,</div><div><br></div><div>Jenk Andac <br></div><div><br><=
/div></div>

--0000000000003768bf061341ded1--

--===============7020082847173704117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7020082847173704117==--
