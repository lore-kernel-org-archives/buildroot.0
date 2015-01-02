From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 18:26:12 +0100
Subject: [Buildroot] Newbie: configure: error: cannot run test program
 while cross compiling
In-Reply-To: <e8de2f026ebd443ebace163bec19f7ca@exch13-mail06.win.slac.stanford.edu>
References: <54A6268B.5050603@slac.stanford.edu>
 <20150102093305.GA4392@free.fr>
 <e8de2f026ebd443ebace163bec19f7ca@exch13-mail06.win.slac.stanford.edu>
Message-ID: <20150102172612.GH4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ernesto, All,

[Note: it was hard to find your reply, since you used '>>>' to prefix
your reply; '>' is usually used to quote the original message you are
replying to, so it appears to me like this was quotation from a former
message, not your actual reply. Just write your reply without prefixing
it with anything, please ;-) ]

On 2015-01-02 16:25 +0000, Williams Jr., Ernest L. spake thusly:
[--SNIP--]
> What you can do is force the result of the test, by passing the
> appropriate value on the command line when calling configure, something
> like the following:
> 
>     HDF5_CONF_ENV = hdf5_cv_have_lfs=$(if $(BR2_LARGEFILE),yes,no)
[--SNIP--]
> >>>  This actually worked great :)
> >>>  Can I continue with this technique?

Yes, setting ac_cv_XXX is the way to go when the package wants to do
run-time testing, because there is no other way this can be solved for
cross-compilation.

(Well, there is another way, but it involves rewriting that dmn
configure.ac)

> >>> Next error is the following:
> 
> >>> checking for struct tm.tm_zone... yes
> >>> checking for struct timezone... yes
> >>> checking whether gettimeofday() gives timezone... configure: 
> >>> error: in `/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14':
> >>> configure: error: cannot run test program while cross compiling
> >>> See `config.log' for more details
> 
> >>> config.log does indeed reveal the variable name  "ac_cv_func_gettimeofday"
> >>> But what buildroot string must I use  "HDF5_CONF_ENV = hdf5_cv_have_lfs=$(if $(BR2_XXXX),yes,no) ?
> >>> Looks like I may bump into more of this ?

Yup, and you can find before hand without running, by looking for all
instances of the AC_TRY_RUN macro, and see the conrresponding ac_cv_XXX
variable.

As for how to set ip, it really depends. Some you can always set to
'tes', some you can always set to 'no', some you must define depending
on Builroot's configuration, and finally there might be some that you
can't guess (e.g. if it has to deal with the kernel, for example), in
which case you should be conservative, and assume the worst.

As for gettimeofday returning timezone, I don't know what it means.
Let's see at the code...

    [...]
    2180                 /* Check whether the function returned any value at all */
    2181              if(tz.tz_minuteswest == 7777 && tz.tz_dsttime == 7)
    2182                 exit(1);
    2183              else exit (0);
    [...]

On glibc, the answer if 'yes' (I just tested natively).

On uClibc and musl, gettimeofday is just a wtrapper aound the real syscall,
so it returns whatever the kernel provides it... I'd say 'yes' too, but
am not 100% sure...

So, you'd write:

    HDF5_CONF_ENV = hdf5_cv_have_lfs=yes \
        hdf5_cv_gettimeofday_tz=yes \
        hdf5_cv_szlib_can_encode=yes \                  [0]
        hdf5_cv_vsnprintf_works=yes \
        hdf5_cv_printf_ll=ll \
        hdf5_cv_system_scope_threads=yes \              [1]
        hdf5_cv_direct_io=yes \                         [2]
        hdf5_cv_ldouble_to_integer_works=yes \          [3]
        hdf5_cv_ulong_to_float_accurate=yes \
        hdf5_cv_ulong_to_fp_bottom_bit_accurate=yes \
        hdf5_cv_fp_to_ullong_accurate=yes \
        hdf5_cv_fp_to_ullong_right_maximum=yes \
        hdf5_cv_ldouble_to_uint_accurate=yes \
        hdf5_cv_ullong_to_ldouble_precision=yes \
        hdf5_cv_fp_to_integer_overflow_works=yes \
        hdf5_cv_ldouble_to_long_special=no \
        hdf5_cv_long_to_ldouble_special=no \
        hdf5_cv_ldouble_to_llong_accurate=yes \
        hdf5_cv_llong_to_ldouble_correct=yes


[0] depends on what your recent szip package does, of course...
[1] LT and NPTL have it
[2] a proper answer would need a more thorough test, because
    posix_memalign can be configured-out in uClibc. glibc and musl have
    it, though...
[3] that one and all the following are just insane test-cases for exotic
    machines, the yes/no are just what the comments state ("should be yes
    for all machines but XXX", or "should not be set except for YYY"...)

Note: there are AC_TRY_RUN calls that test compiler behaviour, just
forget about those, I had a cursory look, and it tseems we don't care
those failing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
