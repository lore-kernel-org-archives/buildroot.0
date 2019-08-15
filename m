From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Aug 2019 15:03:31 +0200
Subject: [Buildroot] [PATCH 2/5] package/liblapack: add liblapack as
 virtual package with lapack and clapack as providers.
In-Reply-To: <CAC5PdM1XOOr0v6+BP=2ZtUE63QXN0VU6hbw_vknGE-O4dW19Sw@mail.gmail.com>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-2-romain.naour@smile.fr>
 <90898cde-8ddf-8b6a-196e-5e42f7f9fa55@mind.be>
 <CAAXf6LW9yFWy5em_NyP1mgWWBQdcWXs=LJsMhXD73=sZogEegQ@mail.gmail.com>
 <CAC5PdM3UfOYLiPQ=nF_8N_vp=oNdvsmhn=+mmXZAhTcCkShTug@mail.gmail.com>
 <CAC5PdM29hXU0s-XKYMA28Ez2jL=d2DdcCt=Q=4mQz6xNQv=FRg@mail.gmail.com>
 <CAC5PdM1XOOr0v6+BP=2ZtUE63QXN0VU6hbw_vknGE-O4dW19Sw@mail.gmail.com>
Message-ID: <819361a2-c99f-5971-02f9-6456c6926cac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alex,

 Thanks for continuing this investigation...

 Since I looked at the lapack/numpy hell during the hackaton, I'm kind of
responsible to follow up on this :-(


On 09/08/2019 18:03, Alexandre PAYEN wrote:
> Hi all,
> 
> I realise many thinks in this lapack/clapack problem.
> First of all, clapack is completly out dated ...
> The last release is version 3.2.1 when lapack is at version 3.8.0
> Also, since ten years, no one touch it ...
> I really suggest to drop this package from buildroot ...

 I expect that ThomasDS wouldn't like that :-)

 It is pretty darn annoying though that we're stuck with this old clapack,
because it is not 100% identical any more - cfr. the missing function you
identified.


> OpenBLAS is an implementation of BLAS. It can also generate a lapack
> implementation if needed. This implementation is lapack from netlib
> (lapack already present in buildroot). So, we should remove this from
> OpenBLAS and use the already present lapack in the build system.

 +1 to that, it really is the 3.8.0 version that is bundled in openblas.

 However, openblas appears to also have a C implementation of lapack. It doesn't
appear to be built with our .mk file for some reason though.


> Also, lapack from netlib advise to use another BLAS implementation
> than netlib BLAS. Perfect, we can use OpenBLAS implementation.
> 
> I suggest to make a virtual package libblas with OpenBLAS as provider
> ATLAS could be added later. And depending from this virtual package,
> a liblapack virtual package with lapack, clapack more could be added.
> This is the easiest way. But be carefull because lapack generate a
> libblas.so file so, just the liblapack.so should be built.

 It's a little more complicated I'm afraid... Based on what I've seen in numpy,
I think there are in fact 4 different interfaces:

lapack  (= fortran ABI)-> provided by lapack, clapack
lapacke (= C ABI) -> provided by lapack
blas (= fortran ABI) -> provided by lapack, clapack
cblas (= C ABI) -> provided by lapack

 I don't really understand which of these openblas provides.

 As far as I understand, the preferred combination is cblas + lapack. If I
remember correctly from our (= Romain and me) analysis two weeks ago, numpy will
try to use lapack+cblas and fall back to blas if it can't find cblas.


> The second solution is to keep the same package architecture as now
> but linking OpenBLAS and lapack. So if they are both selected,
> OpenBLAS should be built with lapack, and lapack should not build
> libblas.so. Else, only lapack should build normaly or only libblas.so
> from OpenBLAS.

 So you're saying:

* openblas only -> only libblas.so
* lapack only -> libblas.so, libcblas.so, liblapack.so
* both -> libblas.so from openblas, libcblas.o and liblapack.so from lapack

Is that correct?


 The ideal would be if it turns out that openblas can build everything without
Fortran compiler, and if the packages that can use lapack (armadillo and numpy)
work with either lapack or openblas. Then we could just get rid of clapack and
make a single virtual package. Or even better, we could remove both clapack and
lapack and use openblas's bundled lapack-netlib if there is a Fortran, and
openblas's C implementation of lapack if there is no Fortran.

 But I don't know if that is even possible...

 Regards,
 Arnout


> 
> I think the maintain cost for the second solution is higher.
> Also, it is simplier to build the first solution.
> 
> Tell me what you think of that and I will work on a patch.
> 
> Regards,
> Alexandre
> 
> Le?mar. 6 ao?t 2019 ??17:57, Alexandre PAYEN <alexandre.payen@smile.fr
> <mailto:alexandre.payen@smile.fr>> a ?crit?:
> 
>     Hi all.
> 
>     Well, after digging lapack(with and without complex),clapack and openblas I got
>     some new insight.
> 
>     Here is what I did :
>     I gather the different libraries (lapack without complex, lapack with complex,
>     clapack and openblas) and gather from LAPACK[1] and BLAS[2] documentation the
>     function list.
>     Then, for each function, I ran nm command on the library with a simple shell
>     script. nm command can output symbols from the symtable of an ELF binary thanks
>     to -D option.
> 
>     Here is the correct line option from `man nm`
>     ```
>     nm -D OBJFILE
>     ? ?Display the dynamic symbols rather than the normal symbols. This is only
>     ? ?meaningful for dynamic objects, such as certain types of shared libraries.
>     ```
> 
>     Here is the script
>     ```
>     #!/bin/sh
> 
>     nm -D $library_file > /tmp/tmp_nm
>     for line in `cat $function_file` # for each line in the file
>     do
>     ? ? grep -i $line /tmp/tmp_nm # check if the function is in the nm dump
>     ? ? if [[ $? -ne 0 ]]
>     ? ? then
>     ? ? ? ? echo $line >> $library_file.not_found # add to the not found file
>     ? ? else
>     ? ? ? ? echo $line >> $library_file.found # add to the found file
>     ? ? fi
>     done
>     ```
> 
>     After running this script on every library with the good function set, I could
>     determine what is missing or not.
>     I will use the function set I link to perform my analysis.
>     So, first of all, clapack have complex support. This mean :
>     (clapack-)libblas.so and (lapack-complex-)libblas.so have the same functions and
>     (clapack-)liblapack.so and (lapack-complex-)liblapack.so have the same functions
>     except one symbol which differs : `geqpfp` in not in clapack implementation.
> 
>     In theory, we could use clapack or lapack with complex support, it will change
>     (almost) annything.
> 
>     Openblas[3] now,
>     openblas.so and (lapack-complex-)liblapack.so have the same functions
>     openblas.so and (lapack-complex-)libblas.so have the same functions.
> 
>     Theoretically, we could make two symbolic link on openblas.so named:
>     - liblapack.so
>     - libblas.so
>     and use it as lapack and blas implementation.
> 
>     I dig deeper into openblas and I realise that openblas does not provide a fresh
>     lapack implementation. Openblas just compile lapack from netlib and link it to
>     provide it own library openblas.lib.
>     So, what about blas implementation. I'm not sure if openblas provide its own or
>     not ...
>     There is this wierd rule in openblas Makefile ...
>     ```
>     blas-test:
>     ?(cd $(NETLIB_LAPACK_DIR)/BLAS/TESTING && rm -f x* *.out)
>     ?$(MAKE) -j 1 -C $(NETLIB_LAPACK_DIR) blas_testing
>     ?(cd $(NETLIB_LAPACK_DIR)/BLAS/TESTING && cat *.out)
>     ```
>     It clearly use the test from the netlib implementation of BLAS ...
> 
>     Well ... I think, we could use those three packages as providers for
>     - liblapack.so
>     - libblas.so
>     (by doing symlinks on Openblas).
> 
>     I still have to:
>     - dig into cblas and check if openblas, lapack(complex) and clapack are
>     compatible,
>     - perform the tests with the symlinks on openblas
>     - replace the files from clapack with the one from lapack.
> 
>     What do you think of this idee on virtual packages with those three providers ?
> 
>     Something else about Openblas. It use netlib lapack, and doing so, need a
>     fortran compiler, so Thomas, you cannot use Openblas for lapack implementation
>     on your fortran-less project ...
> 
>     Regards,
>     Aalx.
> 
>     [1]: http://www.netlib.org/lapack/lapacke.html#_real_functions
>     [2]: http://www.netlib.org/blas/#_blas_routines
>     [3]: https://github.com/xianyi/OpenBLAS
> 
> 
>     Le?lun. 5 ao?t 2019 ??14:49, Alexandre PAYEN <alexandre.payen@smile.fr
>     <mailto:alexandre.payen@smile.fr>> a ?crit?:
> 
>         Hi Thomas, all.
> 
>         Le?lun. 5 ao?t 2019 ??14:27, Thomas De Schampheleire
>         <patrickdepinguin at gmail.com <mailto:patrickdepinguin@gmail.com>> a ?crit?:
> 
>             El s?b., 3 ago. 2019 a las 12:23, Arnout Vandecappelle
>             (<arnout at mind.be <mailto:arnout@mind.be>>) escribi?:
>             >
>             >? Hi Alex, Romain,
>             >
>             > On 01/08/2019 23:09, Romain Naour wrote:
>             > > lapack and clapack are both generating the same liblapack.so but
>             does not have
>             > > the same symbols. So the run-time is broke. They have to exclude
>             each other.
>             >
>             >? We discussed this at the hackaton and reviewed all the options
>             that were
>             > discussed before on the mailing list, and we concluded that the
>             simplest
>             > solution is to remove clapack entirely. Everything that uses
>             clapack (i.e.,
>             > armadillo and numpy) can use lapack as well, as you mention, so
>             the only reason
>             > to keep clapack would be to support toolchains without Fortran
>             compiler. Most of
>             > our external toolchains do have Fortran support, and I expect that
>             anybody who
>             > cares about maths wouldn't mind enabling Fortran in their toolchains.
>             >
>             >? If anybody disagrees with that, now is the time to speak up :-)
>             >
> 
>             There may be cases where a toolchain is provided by a third-party,
>             e.g. a silicon vendor like Marvell.
>             In this case, Fortran is not necessarily provided. Depending on that
>             third-party, it may or may not be easy to get this fixed.
> 
>             In our case, we have some boards with a toolchain from Marvell (no
>             Fortran) and others where we build the toolchains ourselves. In both
>             cases we have armadillo with clapack. Recently, we wanted to use
>             openblas, and getting clapack to work as lapack backend for openblas
>             did not seem to work. So for those boards were it mattered, we enabled
>             fortran and let openblas use its own lapack implementation. For the
>             boards with Marvell toolchain, we planned to keep the existing
>             armadillo+clapack situation.
> 
>             So removing clapack altogether would not be desirable for that case.
> 
>             Note also that openblas also has lapack inside its sources. So it
>             could also a provider for liblapack in the case of a virtual-package
>             situation.
> 
>         Okay, good to know, I will check in this way also. I will check which
>         package use
>         libopenblas.so and how it use it.
> 
> 
>             I searched but could not find extensive discussion on the mailing list
>             regarding this topic.
>             What is the actual problem with introducing a virtual-package?
> 
>         So, for want I know and understand :
>         - lapack and clapack generate the same library files : liblapack.so and
>         libblas.so.
>         - lapack generate libcblas.so and clapack does not.
>         - lapack can be built with complex support. It double the size of the
>         library so it
>         should add a lot of symbols. I guess clapack is already built with complex
>         support but I'm not sure ...
> 
>         A new idee is to introduce virtual package to generate :
>         - liblapack.so
>         - libblas.so
>         - libcblas.so
>         with lapack and clapack as providers.
>         As you said Thomas, openblas has it own lapack implementation so,
>         we could add openblas as a provider and create a symbolic link to
>         liblapack.so.
>         I will inspect those implementations using readefl or a similar tool and
>         try to
>         assert that we can use this solution.
> 
>         Regards,
>         Aalx.
> 
> 
>             Thanks,
>             Thomas
> 
