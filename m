From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Mar 2017 18:00:31 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
 platform description
In-Reply-To: <618fb94d-0c2a-c634-3529-5a9ad5737e03@mind.be>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <e36f8ee2-22d1-318b-178a-9ce84f31a03a@mind.be>
 <20170301091731.5102e061@free-electrons.com>
 <19fbcec2-68a4-a287-a20f-522c94ede5e7@mind.be>
 <20170301184343.GB3578@free.fr>
 <618fb94d-0c2a-c634-3529-5a9ad5737e03@mind.be>
Message-ID: <20170306170031.GA3976@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-03-06 00:27 +0100, Arnout Vandecappelle spake thusly:
> On 01-03-17 19:43, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2017-03-01 09:35 +0100, Arnout Vandecappelle spake thusly:
> >> On 01-03-17 09:17, Thomas Petazzoni wrote:
> >>> Hello,
> >>>
> >>> On Wed, 1 Mar 2017 08:58:31 +0100, Arnout Vandecappelle wrote:
> >>>
> >>>>  Since you don't do any processing on the file, you could just use
> >>>>
> >>>> 		-DCMAKE_MODULE_PATH="$$(TOPDIR)/support/misc" \
> >>>
> >>> I think the idea is that since the Buildroot.cmake platform files gets
> >>> referenced by the toolchainfile.cmake, then Buildroot.cmake anyway
> >>> needs to be installed in $(HOST_DIR)/usr/share/buildroot, so we can
> >>> just as well point CMake to this place.
> >>>
> >>>> and avoid copying the file around. Of course, in that case, support/cmake is
> >>>> probably a better place to put the file :-)
> >>>
> >>> No: copying the file is needed, otherwise our toolchainfile.cmake file
> >>> no longer works for people using it outside of Buildroot.
> >>
> >>  Good point. I still think it should be in staging rather than host, but for
> >> sure it's more important to keep them together.
> > 
> > Why would you want it in staging? When we build our own internal cmake,
> > the moduels it installs are so installed in host, not staging. They are
> > build-description files, not target files.
> > 
> > Ergo, they should be in host, not staging.
> 
>  I was looking at it like the .pc files, which are in staging because they talk
> about the target.

But it is not like a .pc file.  It does not describe libs to link with
(-l), or where to lok for headers and libs (-I and -L).

It is more like the toolchain file itself; but see below...

>  About the modules: in fact, packages that install .cmake files will do that in
> staging, not in host. So I do hope that cmake looks for them in staging as
> well... That's what CMAKE_FIND_ROOT_PATH is for, isn't it?
> 
>  In fact, the only .cmake files I see installed in the host dir are:
> 
> - the Modules from CMake itself, but these are more related to the CMake
> language, e.g. CheckIncludeFiles.cmake;

And what about all the modules describing platforms:

    host/usr/share/cmake-3.7/Modules/Platform/

and the file that actually sources the platform description:

    host/usr/share/cmake-3.7/Modules/CMakeSystemSpecificInformation.cmake

> - the CMake files added by *host* packages;
> 
> - the CMake files added by buildroot which talk about *target* packages.
> 
>  So I stand by my original statement: I think the cmake files should move from
> HOST/usr/share/buildroot to STAGING/usr/lib/cmake.

Still not convinced... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
