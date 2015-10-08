From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 8 Oct 2015 17:15:17 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
Message-ID: <56168885.3090309@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Samuel

On 09/07/2015 23:56, Samuel Martin wrote:
>>> +--- a/storage/xtradb/CMakeLists.txt    2014-10-30
>>> 16:24:33.160188627 +0100 ++++ b/storage/xtradb/CMakeLists.txt
>>> 2014-10-30 16:25:09.060188829 +0100 +@@ -470,12 +470,13 @@ +
>>> SET(WITH_INNOBASE_STORAGE_ENGINE TRUE) + ENDIF() + 
>>> +-IF(XTRADB_OK) +-  MYSQL_ADD_PLUGIN(xtradb ${INNOBASE_SOURCES}
>>> STORAGE_ENGINE +-    DEFAULT +-    RECOMPILE_FOR_EMBEDDED +-
>>> LINK_LIBRARIES ${ZLIB_LIBRARY} ${LINKER_SCRIPT}) +-ELSE() +-
>>> MESSAGE(FATAL_ERROR "Percona XtraDB is not supported on this
>>> platform") ++IF(NOT WITHOUT_XTRADB)
> Does this boolean come from an option? it could.

It does. I've sent this patch upstream. MariaDB people acknowledged
the bug. I think they'll fix it but I don't know when.

> 
>>> ++  IF(XTRADB_OK) ++    MYSQL_ADD_PLUGIN(xtradb
>>> ${INNOBASE_SOURCES} STORAGE_ENGINE ++      DEFAULT ++
>>> RECOMPILE_FOR_EMBEDDED ++      LINK_LIBRARIES ${ZLIB_LIBRARY}
>>> ${LINKER_SCRIPT}) ++  ELSE() ++    MESSAGE(FATAL_ERROR "Percona
>>> XtraDB is not supported on this platform") ++  ENDIF() +
>>> ENDIF() +- diff --git
>>> a/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
>>> b/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
>>
>>> 
> new file mode 100644
>>> index 0000000..1ddec5d --- /dev/null +++
>>> b/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
>>
>>> 
> @@ -0,0 +1,251 @@
>>> +Use CHECK_C_SOURCE_COMPILES instead of CHECK_C_SOURCE_RUNS in
>>> order to be +cross-compile friendly. +In buildroot another
>>> solution (maybe better, maybe not) could be to use 
>>> +BR2_ARCH_HAS_ATOMICS in order to determine the value of
>>> HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE +and likes. +
> Missing SoB line [2].
> 
> It makes sense to submit this patch upstream as well.
> 

I've sent this upstream. I've been told that CHECK_C_SOURCE_COMPILES
was used before but was not enough in some corner cases. They propose
to use it when cross-compiling and stick with SOURCE_RUN otherwise. It
means that "corner cases" won't be covered in cross-compilation but
this solution is no worse than my patch. However, this script checks
the availability and usability of:
__sync_bool_compare_and_swap
__sync_add_and_fetch
__sync_lock_test_and_set
__sync_sub_and_fetch
__sync_add_and_fetch
__atomic_thread_fence
__sync_bool_compare_and_swap
__sync_synchronize
maybe I could use BR2_ARCH_HAS_ATOMICS and/or other buildroot
variables to determine the value of HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE,
HAVE_IB_ATOMIC_PTHREAD_T_GCC and HAVE_IB_ATOMIC_PTHREAD_T_GCC?

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWFoiFAAoJEEkkwl4JtJ9ys6oQAKqi6EMMLc7THs6WotDuNF72
Lcg+2ZHlaWdICu58ELSEJD8eqPQeHpKV+UFV+Zm02PT1UZ/nqnSCM59lTjsmzHOo
D+XJz9w/otGTYjYhKRYuz4f8CyX7VAd6snNxw2TeesRQgShsU8h/A2LE74BPN3nn
k5f6DZhmDd0ZDBxHFYhOVxQXLK7i8u0zSDemwrLQbdj4ngh7d9P+5LbXNYVKNZiU
6lNJwNR7xwvEB2ZFtpRkqC2gTjIxD2n71ultwbRoFybnG/drt8dfLWoAg3ZoxrAQ
sGcbHY0gqhch7ioF/nwdtPqO648jQwY5WGbpLv5FP8GA2XxyWz7JYhyxwIZtyroO
6dDUJEvpYbVGHYGeR0B/sFJYNtW4gaM4zsoi7NVA740hvX56vhIOQflF+DxxU6ae
Ma0y1If14U/d5KG8cb4RkC6BSBNRLZAuRAibUIvlQ4pHj6Zw2O3nLJ8o+/hzDEDi
y2HlCtq1OS2kxsRj81DgmCQMHswO2lLITYmrH3W25dh8guF1cfE9t+a79ZmjeaQA
im7m6tAhokkTN4m8XcPyaHfBuWBVViZrPmGJLFlLeqGTjJB3+Xm5/48lvhg96L/3
54dZ9kNJeyIcmXgkJv1tEKtfHyy33NZPYnyRbMBzP+Jk+n/S288WSfkxpBn9j9ur
YmoAYbVCYiQlaJWydCQp
=CJ/5
-----END PGP SIGNATURE-----
