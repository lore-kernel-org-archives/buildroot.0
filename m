From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jul 2019 22:46:06 +0200
Subject: [Buildroot] [PATCH] [PATCHv3] package/python-numpy: fix
 occasional build failure with lapack
In-Reply-To: <CAC5PdM0+b2j0oarA0WEZuyp0DScco4pLN7nvJep5+g0qHFUYzw@mail.gmail.com>
References: <20190710141940.13504-1-alexandre.payen@smile.fr>
 <b1bf4a91-4612-e3a7-b033-c2ff549694ed@mind.be>
 <CAC5PdM0+b2j0oarA0WEZuyp0DScco4pLN7nvJep5+g0qHFUYzw@mail.gmail.com>
Message-ID: <4ced309f-43bd-f04a-7bad-610dde3d9f12@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alex,

On 12/07/2019 11:44, Alexandre PAYEN wrote:
[snip]
>     > Also, clapack is a C implementation of FORTRAN lapack. At build time, they
>     both
>     > generate the same liblapack.so file. But because lapack is written in FORTRAN
>     > then, it can be difficult to build. Both package are kept behind a virtual
>     > package named vlapack. They are mutually exclusive.
> 
>     ?This is pretty much independent of the numpy fix, so should be a separate
>     patch.
> 
>     ?Note, however, there are three ways to make them mutually exclusive.
> 
>     1. Making it a virtual package - which is what you did. However, the main
>     purpose of a virtual package is to make it possible to use it in select/depend
>     without caring about which implementation is chosen. That might apply for
>     lapack, I'm not sure.
> 
>     2. Adding an explicit dependency from one on the other in Config.in. E.g.
>     clapack could depend on !lapack.
> 
> It has already been discussed. That is why I choose the virtual package solution.

 I know My point was, however...

> 
> 
>     3. Adding a dependency on something else which is mutually exclusive. lapack
>     depends on BR2_TOOLCHAIN_HAS_FORTRAN, so you could just add a dependency on
>     !BR2_TOOLCHAIN_HAS_FORTRAN to clapack. This makes sense, since the Fortran
>     implementation is supposed to be the real source, and clapack is more or less
>     automatically generated from it. Supposedly, lapack should optimise better than
>     clapack.
> 
> 
>     ?The commit log should explain that these three options exist, and why you
>     choose that particular one.

 ... this ^^^^. The rest was a reminder that those are the options.


[snip]
>     ?Also, it is not possible to convert existing Config.in symbols into choice
>     options, because that breaks existing configurations.
> 
> Which configuration does it break except armadillo ?
> In `git grep LAPACK` only python-numpy and armadillo use lapack or clapack.

 I mean the following:

*Before* your patch. select BR2_PACKAGE_LAPACK. Now, apply your patch. Do 'make
menuconfig', and you'll see that BR2_PACKAGE_LAPACK is no longer selected.
That's a problem.


>     Anyway, there is no real need for a choice. The normal use of a virtual package
>     is to select the virtual package from the providers. But then, typically, the
>     user of the virtual package would depend on it, rather than select it.
> 
> lapack is selected by default if there is a FORTRAN compiler (as you said, I
> guess that
> lapack is more efficient than clapack).
> If there is no FORTRAN compiler, clapack is selected by default. The user should
> only select one
> if he need special option like the path of header file `arith.h`.

 If there would be a package that needs clapack specifically, it is not possible
for that package to select clapack (because it's now part of a choice). That's a
bit annoying. But since no such package exists, probably not important.


 Regards,
 Arnout

[snip]
