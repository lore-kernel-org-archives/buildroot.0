From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Mon, 28 May 2018 14:20:44 +0200
Subject: [Buildroot] [PATCH 1/1] ti-sgx-*: bump from SDK 02.00 to SDK
 04.00
In-Reply-To: <5cc76bb8-f92b-ab5d-71bf-c41c0e96930c@gmail.com>
References: <1527175458-16091-1-git-send-email-tolvupostur@gmail.com>
 <CABhNV23aBnMSVT5a41eopYk6H0ek7-==NF0EuN_QUc_71vDbvw@mail.gmail.com>
 <5cc76bb8-f92b-ab5d-71bf-c41c0e96930c@gmail.com>
Message-ID: <CABhNV22Fv+QjYta+XhH5mixGPK5R0sOnMv=R3+4qpV+iqGegzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
See inline.

I?m on holidays until Wednesday with only mobile devices, so if someone
else wants to step in, please do.

On Sunday, 27 May 2018, Romain Naour <romain.naour@gmail.com> wrote:

> Hi Einar,
>
> Le 24/05/2018 ? 17:38, Einar J?n a ?crit :
> > Hi,
> >
> > Just to explain this one. The ti-sgx-* drivers are very old, but
> > nothing is using them except beaglebone_qt5_defconfig.
> > I bumped beaglebone_qt5_defconfig to the same level as
> > beaglebone_defconfig (the SDK 4.00 version in
> > http://www.ti.com/tool/PROCESSOR-SDK-AM335X)
> >
> > The ti-sdx-* drivers have been bumped to the same SDK 4.00 version.
> > The  ti-sdx-um has a dependency on a new package ti-sdx-libgdm, which
> > in turn depends on wayland.
> >
> > This again gives QT a valid EGL backend for beaglebone_qt5.
> >
> > Let me know if this should be done differently.
>
> Thanks for this patch. We will need it soon in order to remove the gcc 5
> dependency in beaglebone_qt5 defconfig.
>
> I'm not sure if we must bump all packages related to the TI SDK or bump all
> packages one by one to ease the review.


I did this in a single commit since any split (except a standalone
ti-sgx-libgbm) would be a commit with a broken build. The places I?ve
worked for for the last 5 years hate those.


>
> This patch add a new ti-sgx-libgbm package, it should be added in a
> separate patch.


Sounds reasonable.


>
> Also, BR2_PACKAGE_TI_SGX_KM_AM4430 and BR2_PACKAGE_TI_SGX_KM_AM5430
> symbols are
> removed. It must be handled in Config.in.legacy.


True. I didn?t think of that since none of the defconfigs use it. I can see
that now there is a legacy patch for the _KM addition.
Also, the new _KM addition to these keywords makes these parameters a bit
weird, because it is used in both ti-sgx-km and ti-sgx-um.
Maybe 3 _UM bools should be made that are just set to the same value as the
_KM ones.
Like
bool BR2_PACKAGE_TI_SGX_UM_AM3350
   default BR2_PACKAGE_TI_SGX_KM_AM3350



> Why S80ti-sgx is removed ?
>

Because it is both unneeded and obsolete.
The current repo of ti-sgx-um has 3 subfolders, one for each
BR2_PACKAGE_TI_SGX_KM_AMxxx option. Each one has a sysV init file (called
rc-???) that is very different from the one I deleted.
Now I simply rename rc-??? to S80ti-sgx in the post-hook that previously
copied it from package/ti-sgx-um.
It actually is a very ugly $(INSTALL) && $(RM), since it seems weird to
?mv? files on target/. And I copy it from staging instead of target to be
sure that it always exists - but now I realize that I did that because I
was running the hook twice (as post_install and sysv_init).

Best regards,
> Romain
>
> >
> > Best regards,
> > Einar J?n
> >
> > On 24 May 2018 at 17:24, Einar Jon Gunnarsson <tolvupostur@gmail.com>
> wrote:
> >> Added new package ti-sgx-libgbm
> >> Fixed build and added license file hashes.
> >>
> >> Bumped beaglebone_qt5 to same level as beaglebone
> >>
> >> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> >> ---
> >>  ...nux-4.1-sgx.fragment => linux-4.9-sgx.fragment} |  0
> >>  configs/beaglebone_qt5_defconfig                   | 14 +++++------
> >>  package/Config.in                                  |  1 +
> >>  package/ti-sgx-demos/ti-sgx-demos.hash             |  3 ++-
> >>  package/ti-sgx-demos/ti-sgx-demos.mk               | 20
> ++++++++++++---
> >>  package/ti-sgx-km/Config.in                        | 17 +++++--------
> >>  package/ti-sgx-km/ti-sgx-km.hash                   |  3 ++-
> >>  package/ti-sgx-km/ti-sgx-km.mk                     | 22
> ++++++++--------
> >>  package/ti-sgx-libgbm/Config.in                    |  9 +++++++
> >>  package/ti-sgx-libgbm/ti-sgx-libgbm.hash           |  3 +++
> >>  package/ti-sgx-libgbm/ti-sgx-libgbm.mk             | 17 +++++++++++++
> >>  package/ti-sgx-um/Config.in                        |  3 ++-
> >>  package/ti-sgx-um/S80ti-sgx                        | 14 -----------
> >>  package/ti-sgx-um/powervr.ini                      |  4 +--
> >>  package/ti-sgx-um/ti-sgx-um.hash                   |  3 ++-
> >>  package/ti-sgx-um/ti-sgx-um.mk                     | 29
> ++++++++++++++++------
>


-- 
Regards
Einar J?n
+31 610 957234
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180528/0435d1fb/attachment.html>
