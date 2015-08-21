From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 21 Aug 2015 10:23:29 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
Message-ID: <55D6E001.6010608@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Samuel

Thanks for your review. Here are my replies to some points (also inlined).

On 09/07/2015 23:56, Samuel Martin wrote:
> Hi Sylvain,
> 
> Here is a partial review (inlined).
> 
> But, overall, I feel like this implementation (essentially the
> *.mk file) does not match the Buildroot way of doing things... :-/ 
> Have you look at the virtual package infrastructure [1]?

Considering your remark and the discussion that took place last week,
I repackaged the whole thing in the same way as jpeg.

> 
> On Thu, Jul 9, 2015 at 6:22 PM, Sylvain Raybaud

>> diff --git
>> a/package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
>> b/package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
>>
>> 
new file mode 100644
>> index 0000000..83eac77 --- /dev/null +++
>> b/package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
>>
>> 
@@ -0,0 +1,27 @@
>> +Do not perform test if the build is not requested anyway. The
>> test may fail, +preventing building the whole package. +
> The comment does not really reflect what is done in the patch: -
> according to the comment: this change touch tests; - AFAICS, this
> change disable a plugin.

No, I just enclose some commands in:

IF(NOT WITHOUT_XTRADB)
[..]
ENDIF()

Meaning: "if building XtraDB plugin was not requested, do not care
about the result of the test". This patch does not disable XtraDB.
This is done via an option passed in mariadb-galera.mk

> [..]

>> ++IF(NOT WITHOUT_XTRADB)
> Does this boolean come from an option? it could.
> 

It does. There is the following line in mariadb-galera.mk:

MARIADB_GALERA_EXTRA_OPTS += "-DWITHOUT_XTRADB=1"


[..]

>> diff --git
>> a/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
>> b/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
>>
>> 
new file mode 100644
>> index 0000000..1ddec5d --- /dev/null +++
>> b/package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
>>
>> 
@@ -0,0 +1,251 @@
>> +Use CHECK_C_SOURCE_COMPILES instead of CHECK_C_SOURCE_RUNS in
>> order to be +cross-compile friendly. +In buildroot another
>> solution (maybe better, maybe not) could be to use 
>> +BR2_ARCH_HAS_ATOMICS in order to determine the value of
>> HAVE_IB_GCC_ATOMIC_BUILTINS_BYTE +and likes. +
> Missing SoB line [2].
> 
> It makes sense to submit this patch upstream as well.

Right. Does this mean we should wait for them to review this patch
before considering including it in buildroot?

> [..]
>> +config MYSQL_MARIADB_GALERA +       bool "mariadb-galera" +
>> select BR2_PACKAGE_NCURSES +       select BR2_PACKAGE_OPENSSL +
>> select BR2_PACKAGE_ZLIB +       select BR2_PACKAGE_LIBAIO +
>> select BR2_PACKAGE_LIBTOOL +       select BR2_PACKAGE_GALERA +
>> select BR2_PACKAGE_BASH # runtime dependency only +       select
>> BR2_PACKAGE_LSOF # runtime dependency only +       select
>> BR2_PACKAGE_PROCPS_NG # runtime dependency only +       select
>> BR2_PACKAGE_FINDUTILS # runtime dependency only +       select
>> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS +       depends on
>> BR2_TOOLCHAIN_BUILDROOT_GLIBC || BR2_PACKAGE_EGLIBC # spawn()
> Missing "depends on" for the selected packages [3].
> 
>> +       help +         MariaDB Galera Cluster. +
>> https://mariadb.com/kb/en/mariadb/what-is-mariadb-galera-cluster 
>> + +endchoice + +endif + +comment "MySQL needs a toolchain w/ C++,
>> threads" +depends on !BR2_INSTALL_LIBSTDCPP ||
>> !BR2_TOOLCHAIN_HAS_THREADS
> Indent is wrong. Missing: depends on BR2_USE_MMU Move this comment
> in the choice.

I don't understand how to properly move this in the choice section.
However I modified Config.in when I made mysql a virtual package. Does
this remark still apply?

> 
>> + +comment "MariaDB needs an (e)glibc toolchain" +depends on
>> !BR2_TOOLCHAIN_BUILDROOT_GLIBC && !BR2_PACKAGE_EGLIBC # spawn()
> Indent is wrong. Move this comment in the choice.

Same question about moving the comment.

Thanks again!

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1uABAAoJEEkkwl4JtJ9yNCIP/ic8RsfhCdG56I3fH55KFDqi
ABnVSsYB3HP9vczjCfFzLQq3YbbTX1HMhB72L83OdyBoBmoUmEedXO9cOCcZw75q
Fer4OBgGhrl11uy3KvwH2E/nfGgVtjdiGSW0o+7mB041E/ix2E+SnlKwIQu9mTFS
4UZq7m7UpeWBQeMwRE3VpNnNCimpW+pcIXIjzMdbDMNfH5xAy6Da3OtJPay4vRBk
99PZ4Ly6wOcytRnTvuDOz2u8OMbb6GOshSTFyqDucenculWPada+fVa0QKWJlDMo
wFpLPv5HlcVKXcFZO8T+USK3GFnWgdjeJget1r8vXUUDzh/rEFD6VDCaYIC86dQN
pWHpqosPCUcd/d4q6hI1rutCO4w9djKmDDC8AFB2iPnwK7EuPV8AnWXE0RLMA+Rf
+CKoNG9D/yny3po37SouxajkIkg/3FOK/3cPVlTCEnMUiQtHh7Alcd6ll7CvTMEk
0gNA8Sia1vQ6B72O7ASJOfMCLQsOIiqXsODZhI9pFv2K5xGvap6E7LBShSuADE8o
qb7ig6wsTJnvdOBlDTyva7KPVQ4V/4nBQGT7njvsAtcwe46dNbYhIT2wRv7i7btW
5tBBy9HDZ8ex6AcM7pDaraU5gu6edEowRSTdZWLoM7SOBgNT8/USeRofVHBd4tgv
NMtaizcTJNxxjmiQSpwB
=UmBa
-----END PGP SIGNATURE-----
