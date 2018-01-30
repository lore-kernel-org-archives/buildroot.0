From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@gmail.com>
Date: Tue, 30 Jan 2018 09:45:27 +0100
Subject: [Buildroot] Questions on package makefile variables overriding
In-Reply-To: <20180130083544.reboj7axclmykxby@sapphire.tkos.co.il>
References: <CALmdmcCD_yjO7YG2S-dNtFoMudtO6RNy5aHStDEjJ+ZEeo1cMg@mail.gmail.com>
 <20180130083544.reboj7axclmykxby@sapphire.tkos.co.il>
Message-ID: <CALmdmcAMbCy4ThRqML07thYJjopSVjt=GsZk9YUdVPeZ3w20pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch, Yegor,
thank you both for you quick answers !
indeed, a colleague of mine has sent patches upstream to get this
dependency added. I will get to him to follow the patches status. And as
you have both suggested, our current solution to override janus
configuration is to import it as an external package in our BR2_EXTERNAL
I will take a look at opencv3 package, thanks for the hint
Regards,

2018-01-30 9:35 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Alexis,
>
> On Tue, Jan 30, 2018 at 08:56:00AM +0100, Alexis Lothor? wrote:
> > I am currently trying to adapt some buildroot packages behavior without
> > hardcoding my changes into the buildroot directory (using a buildroot
> > external), but I am encountering a few issues doint it. Here are my two
> > cases :
>
> As far as I know there is no support for overriding existing packages with
> the
> BR2_EXTERNAL mechanism. I'll let core developers confirm that.
>
> > * I am trying build the janus-gateway package in buildroot 2017-08. I
> have
> > to add libcurl as a dependency (needed in my case for the streaming
> > module). In janus-gateway.mk in corresponding buildroot package, the
> > dependency variable looks like the following :
> JANUS_GATEWAY_DEPENDENCIES =
>
> In this case libcurl should be added as an optional dependency of
> janus-gateway. Please post a patch doing that, so that you don't need to
> carry
> your own local changes.
>
> > host-pkgconf jansson libnice \
> >         libsrtp host-gengetopt libglib2 openssl
> > I have added an external.mk file in my BR2_EXTERNAL directory with the
> > following line : JANUS_GATEWAY_DEPENDENCIES += libcurl. It seems to be
> > taken in account by buildroot, as seen when printing the proper
> variables :
> > #~ : make -C buildroot BR2_EXTERNAL=../buildroot_external O=output-dev
> -s
> > printvars VARS=JANUS_GATEWAY_%DEPENDENCIES
> > JANUS_GATEWAY_DEPENDENCIES=host-pkgconf jansson libnice libsrtp
> > host-gengetopt libglib2 openssl host-automake host-autoconf host-libtool
> > skeleton toolchain libcurl
> > JANUS_GATEWAY_FINAL_ALL_DEPENDENCIES=host-autoconf host-automake
> > host-gengetopt host-libtool host-pkgconf jansson libcurl libglib2 libnice
> > libsrtp openssl skeleton toolchain
> > JANUS_GATEWAY_FINAL_DEPENDENCIES=host-autoconf host-automake
> host-gengetopt
> > host-libtool host-pkgconf jansson libcurl libglib2 libnice libsrtp
> openssl
> > skeleton toolchain
> > JANUS_GATEWAY_FINAL_PATCH_DEPENDENCIES=
> >
> > However, even after completely deleting janus-gateway in my builddir and
> in
> > the target dir, libcurl is not automatically built before janus. Am I
> > missing a configuration step ?
> >
> > * I need a more recent version of OpenCV than the current one 2.4.13.
> Using
> > the same mechanism, I update OPENCV_VERSION in my external.mk. This time
> > the new version is correctly detected and the package is downloaded in
> the
> > new version. But I encounter a hash mismatch (which seems normal since
> hash
> > is fixed in the package directory). Is there a way to override the hash
> > file too ?
>
> There is also the opencv3 package which is currently at 3.3.0. A patch
> bumping
> the version to the latest 3.4.0 would be welcome.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>



-- 
Alexis Lothor?
06.51.59.81.45
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180130/242f26ab/attachment.html>
