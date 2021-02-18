From: mattwood2000 at gmail.com <mattwood2000@gmail.com>
Date: Thu, 18 Feb 2021 10:23:27 -0500
Subject: [Buildroot] CMake package requires out of source build
In-Reply-To: <CAFSsvmrh6PAmi0xOq3bc0J=oOn1gmtSpDHvjfjz_xybrES3GYw@mail.gmail.com>
References: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
 <20210216000715.2d81f552@gmx.net>
 <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
 <20210217155233.3yf2tjemg3mygcm7@falbala.internal.home.lespocky.de>
 <CADjezmY7i+rYoKf2=zUQX2r0j14McNjbZba9D+-WOgRQhjYGxw@mail.gmail.com>
 <20210217181627.kba2lo2fskbvvx3l@falbala.internal.home.lespocky.de>
 <CAFSsvmrh6PAmi0xOq3bc0J=oOn1gmtSpDHvjfjz_xybrES3GYw@mail.gmail.com>
Message-ID: <CADjezmZsfY8=zQC-t2VXh825OvSKXzAzuqaFKpikeYfddo-xqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Thanks for this, sorry I somehow missed your email yesterday.

I'll take a look at what you did and compare it to my patches, but as of
now I have a working solution.

Thanks ,Matt.

On Wed, Feb 17, 2021, 3:58 PM Adam Duskett <aduskett@gmail.com> wrote:

> Hello;
>
> I have been porting several aws-iot packages to buildroot in an
> external tree found here:
> https://github.com/aduskett/buildroot-aws-iot/
>
> I added avs-device-sdk in the alexa-packages branch along with a small
> patch to allow for
> in-source builds.
>
> https://github.com/aduskett/buildroot-aws-iot/tree/alexa-packages
>
> Thanks!
>
> Adam
>
> On Wed, Feb 17, 2021 at 10:16 AM Alexander Dahl <post@lespocky.de> wrote:
> >
> > Hello Matt,
> >
> > On Wed, Feb 17, 2021 at 11:59:36AM -0500, mattwood2000 at gmail.com wrote:
> > > On Wed, Feb 17, 2021 at 10:52 AM Alexander Dahl <post@lespocky.de>
> wrote:
> > > > Just out of curiousity: why would you want to build in source
> anyways?
> > > > Why not build out of source as usually recommended and first class
> > > > supported by CMake?
> > >
> > > I would prefer to build the source like a normal cmake package,
> > > however Amazon disallows building their SDK anywhere within the
> > > original source directory.  Normally, there should not be any issue
> > > with:
> > >
> > > ./cmake_pkg_src
> > > ./cmake_pkg_src/buildroot-build // PKG_SUPPORTS_IN_SOURCE_BUILD = NO
> >
> > Oh, my bad. Of course building in a subfolder "build" (or with another
> name like above) is
> > quite common with CMake. I usually don't do this, but that's of course
> > only my personal preference.
> >
> > > But in this case there is a cmake rule that iterates over the entire
> > > source directory to check if the build directory is present:
> > >
> https://github.com/alexa/avs-device-sdk/blob/master/build/cmake/DisallowOutOfSourceBuilds.cmake
> >
> > That makes no sense to me. In that script they link to
> >
> https://gitlab.kitware.com/cmake/community/-/wikis/FAQ#cmake-does-not-generate-a-make-distclean-target-why
> > but that only covers in source builds.
> >
> > > Removing the rule from BuildDefaults.cmake gets around this issue.
> > > Also, the source builds perfectly fine this way.  I'm not sure why
> > > Amazon forces this.
> >
> > Agreed. So why not patch 'build/BuildDefaults.cmake' like that and add
> > the patch to the buildroot package for that avs-device-sdk instead of
> > changing buildroot core?
> >
> > Greets
> > Alex
> >
> > --
> > /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> > \ / CAMPAIGN     | speech censured, the first thought forbidden, the
> >  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> > / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210218/331d0a3b/attachment.html>
