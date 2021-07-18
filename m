From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 14:25:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: fix build with
 libmaxminddb
In-Reply-To: <20210718140606.1ba06d6b@windsurf>
References: <20210716172016.207663-1-fontaine.fabrice@gmail.com>
 <20210717091140.GI12203@scaer>
 <CAPi7W80_mm5p24UOGj9mhZYYU7eHtadzsVGrrBVScCWoehTAeQ@mail.gmail.com>
 <20210717203343.GX12203@scaer> <20210718140606.1ba06d6b@windsurf>
Message-ID: <20210718122555.GF12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thomas, All,

On 2021-07-18 14:06 +0200, Thomas Petazzoni spake thusly:
> On Sat, 17 Jul 2021 22:33:43 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >     +# configure.ac will call git to get various version strings, from
> >     +# libmodsecurity itself, but also from bundled dependencies, just
> >     +# for the sake of siplaying them at the end of configure.
> >     +# Fake a git that returns the version for libmodescurity, to quiesce
> >     +# warnings...
[--SNIP--]
> Shouldn't we "simply" teach to libmodsecurity configure.ac that it may
> be autoreconf'ed outside of a Git repository ?

Easier said than done... That was my initial thought, but given how
configure.ac is written, this will have to be quite some intrusive
changes. The most problematic being test/test-cases/secrules-language-tests
and others/libinjection, which are both managed via git submodules.

And no, switching over to downloading via git, will not help: we still
do not have a .git/ directory in the archives we generate, and from
which we do the build.

But really, sice these version strings are only ever used as informative
text at the end of configure, I don't think we should care much what
they get set to:

    configure.ac:
    414 # Print a fancy summary
    415 echo " "
    416 echo " "
    417 echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
    418 echo " "
    419 echo " Mandatory dependencies"
    420 echo -n "   + libInjection                                  ...."
    421 echo LIBINJECTION_VERSION
    422 echo -n "   + SecLang tests                                 ...."
    423 echo SECLANG_TEST_VERSION
    424
    425 echo " "
    426 echo " Optional dependencies"

    configure:
    24978 # Print a fancy summary
    24979 echo " "
    24980 echo " "
    24981 echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
    24982 echo " "
    24983 echo " Mandatory dependencies"
    24984 echo -n "   + libInjection                                  ...."
    24985 echo v3.9.2-46-gbfba51f
    24986 echo -n "   + SecLang tests                                 ...."
    24987 echo a3d4405
    24988
    24989 echo " "
    24990 echo " Optional dependencies"

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
