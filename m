From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 30 Jan 2018 09:33:36 +0100
Subject: [Buildroot] Questions on package makefile variables overriding
In-Reply-To: <CALmdmcCD_yjO7YG2S-dNtFoMudtO6RNy5aHStDEjJ+ZEeo1cMg@mail.gmail.com>
References: <CALmdmcCD_yjO7YG2S-dNtFoMudtO6RNy5aHStDEjJ+ZEeo1cMg@mail.gmail.com>
Message-ID: <CAGm1_kvg=gU+JUJsuJtTZWSUdSR6734tHBjuKk98RTBb7Y7hQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexis,

On Tue, Jan 30, 2018 at 8:56 AM, Alexis Lothor?
<alexis.lothore@gmail.com> wrote:
> Hello,
> I am currently trying to adapt some buildroot packages behavior without
> hardcoding my changes into the buildroot directory (using a buildroot
> external), but I am encountering a few issues doint it. Here are my two
> cases :
> * I am trying build the janus-gateway package in buildroot 2017-08. I have
> to add libcurl as a dependency (needed in my case for the streaming module).
> In janus-gateway.mk in corresponding buildroot package, the dependency
> variable looks like the following : JANUS_GATEWAY_DEPENDENCIES =
> host-pkgconf jansson libnice \
>         libsrtp host-gengetopt libglib2 openssl
> I have added an external.mk file in my BR2_EXTERNAL directory with the
> following line : JANUS_GATEWAY_DEPENDENCIES += libcurl. It seems to be taken
> in account by buildroot, as seen when printing the proper variables :
> #~ : make -C buildroot BR2_EXTERNAL=../buildroot_external O=output-dev -s
> printvars VARS=JANUS_GATEWAY_%DEPENDENCIES
> JANUS_GATEWAY_DEPENDENCIES=host-pkgconf jansson libnice libsrtp
> host-gengetopt libglib2 openssl host-automake host-autoconf host-libtool
> skeleton toolchain libcurl
> JANUS_GATEWAY_FINAL_ALL_DEPENDENCIES=host-autoconf host-automake
> host-gengetopt host-libtool host-pkgconf jansson libcurl libglib2 libnice
> libsrtp openssl skeleton toolchain
> JANUS_GATEWAY_FINAL_DEPENDENCIES=host-autoconf host-automake host-gengetopt
> host-libtool host-pkgconf jansson libcurl libglib2 libnice libsrtp openssl
> skeleton toolchain
> JANUS_GATEWAY_FINAL_PATCH_DEPENDENCIES=
>
> However, even after completely deleting janus-gateway in my builddir and in
> the target dir, libcurl is not automatically built before janus. Am I
> missing a configuration step ?

If you want to play with janus-gateway in BR2_EXTERNAL, you'll have to
create your own package called for example my-janus-gateway, i.e.just
copy the original package with new name to your BR_EXTERNAL package
directory. You'll also have to rename the whole variables in Config.in
and *.mk file to match new package's name.

I'll suggest, that you use upstream BR and create a patch adding
libcurl, i.e. turn-rest-api option and submit it via this mailing
list.

> * I need a more recent version of OpenCV than the current one 2.4.13. Using
> the same mechanism, I update OPENCV_VERSION in my external.mk. This time the
> new version is correctly detected and the package is downloaded in the new
> version. But I encounter a hash mismatch (which seems normal since hash is
> fixed in the package directory). Is there a way to override the hash file
> too ?

You can rename *.hash file as if it doesn't exist, then BR won't
perform checksum check. But here I would also suggest the you create a
OpenCV  version bump patch and submit it.

Regards,
Yegor
