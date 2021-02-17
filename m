From: mattwood2000 at gmail.com <mattwood2000@gmail.com>
Date: Wed, 17 Feb 2021 11:59:36 -0500
Subject: [Buildroot] CMake package requires out of source build
In-Reply-To: <20210217155233.3yf2tjemg3mygcm7@falbala.internal.home.lespocky.de>
References: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
 <20210216000715.2d81f552@gmx.net>
 <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
 <20210217155233.3yf2tjemg3mygcm7@falbala.internal.home.lespocky.de>
Message-ID: <CADjezmY7i+rYoKf2=zUQX2r0j14McNjbZba9D+-WOgRQhjYGxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

On Wed, Feb 17, 2021 at 10:52 AM Alexander Dahl <post@lespocky.de> wrote:
> Just out of curiousity: why would you want to build in source anyways?
> Why not build out of source as usually recommended and first class
> supported by CMake?

I would prefer to build the source like a normal cmake package,
however Amazon disallows building their SDK anywhere within the
original source directory.  Normally, there should not be any issue
with:

./cmake_pkg_src
./cmake_pkg_src/buildroot-build // PKG_SUPPORTS_IN_SOURCE_BUILD = NO

But in this case there is a cmake rule that iterates over the entire
source directory to check if the build directory is present:
https://github.com/alexa/avs-device-sdk/blob/master/build/cmake/DisallowOutOfSourceBuilds.cmake

Removing the rule from BuildDefaults.cmake gets around this issue.
Also, the source builds perfectly fine this way.  I'm not sure why
Amazon forces this.

Thanks, Matt.
>
> Greets
> Alex
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
