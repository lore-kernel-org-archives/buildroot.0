From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 10:33:05 +0100
Subject: [Buildroot] Newbie: configure: error: cannot run test program
 while cross compiling
In-Reply-To: <54A6268B.5050603@slac.stanford.edu>
References: <54A6268B.5050603@slac.stanford.edu>
Message-ID: <20150102093305.GA4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ernest, All,

On 2015-01-01 21:03 -0800, Ernest L Williams spake thusly:
> Hi
> I am working with the hdf5 package and having trouble getting past the
> configuration stage :(
> hdf5 builds fine for my host machine but fails configuration when i try to
> build for
> "x86_64-buildroot-linux-uclibc"
> 
> 
> Oops,
> package/pkg-generic.mk:172: recipe for target '/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/.stamp_configured'
> failed
> 
> The hdf5 package uses autotools
> 
> Any ideas on what I should pursue?
> 
> By the way,  why does "package/pkg-generic.mk" show up in the output below?
> I am using auto-tools.
> 
> 
> checking if libtool needs -no-undefined flag to build shared libraries... no
> checking if configure should try to set up large file support... yes
> checking for special C compiler options needed for large files... no
> checking for _FILE_OFFSET_BITS value needed for large files... no
> checking if large (64-bit) files are supported on this system.... configure:
> error: in `/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14':
> configure: error: cannot run test program while cross compiling

Damn, those pesky packagers that do not like cross-compilation! ;-)

What you can do is force the result of the test, by passing the
appropriate value on the command line when calling configure, something
like the following:

    HDF5_CONF_ENV = hdf5_cv_have_lfs=$(if $(BR2_LARGEFILE),yes,no)

This will tell configure not to run the test, and assume the result we
do provide.

Note-1: you can see what variable to preset by looking at configure.ac,
line 1455:

    1452   ## Now actually test to see if we can create large files after we've
    1453   ## checked for any needed defines.
    1454   AC_MSG_CHECKING([if large (64-bit) files are supported on this system.])
    1455   AC_CACHE_VAL([hdf5_cv_have_lfs],
    1456     [AC_TRY_RUN([
    [...]

Note-2: I used 'HDF5' as a prefix, assuming the package is named 'hdf5'
in Buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
