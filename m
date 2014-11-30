From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 12:35:57 +0100
Subject: [Buildroot] [PATCH] package/shairport-sync: fix static builds
In-Reply-To: <1417268097-29884-1-git-send-email-yann.morin.1998@free.fr>
References: <1417268097-29884-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141130113557.GB4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-11-29 14:34 +0100, Yann E. MORIN spake thusly:
> Because shairport-sync uses AC_CHECK_LIB to find some of the needed
> libraries (opensl, alsa, popt...), it fails to bring in the dependencies
> of those libraries; for example, -lssl requires -lz.
> 
> When doing a dynamically-linked build, those dependent libraries are
> pulled in thansk to the DT_NEEDED ELF tags, but those are not available
> in static libraries.
> 
> Use PKG_CHECK_MODULES instead of AC_CHECK_LIB, and emulate the results
> of AC_CJECK_LIB (i.e. set the HAVE_LIBxxx and the LIBS variable
> appropriately) to minimise the amount of code touched.
> 
> This should fix:
>     http://autobuild.buildroot.net/results/1a5/1a56dbff3583bed0d693508dfc16859086846ecd/
>     http://autobuild.buildroot.net/results/6d5/6d5a8157592f7a2c9469bf71b0453796ef982ab1/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?rg Krause <jkrause@posteo.de>
> 
> ---
> Note: I was not able to rproduce the build failures: the popt check was
> sucessfull for me, but failed in the following checks for ssl and alsa.
> The fix to popt is just a generalisation of the fix to the other two
> libraries.
> ---
>  .../0001-fix-static-link-openssl.patch             | 37 ++++++++++++++++++++++
>  .../shairport-sync/0002-fix-static-link-alsa.patch | 23 ++++++++++++++
>  .../shairport-sync/0003-fix-static-link-popt.patch | 21 ++++++++++++

All three patches applied upstream:
    https://github.com/mikebrady/shairport-sync/commit/2a430ec434674ed8c1959698c061662bb7abc1a1
    https://github.com/mikebrady/shairport-sync/commit/e5a74a3ff08134a2b11f07bd850659d7816fb03d
    https://github.com/mikebrady/shairport-sync/commit/1f759e57e8c0682613eaaf89a46fdf6db4c6b5cd

There is now a new release with those three patches, but that would make
us bump pass a few releases, from 2.1.8 to 2.1.13, with some new
features along the lines.

So, for the release, I suggest we just apply those three patches, and
I'll send a version bump after the release has been cut.

Is that OK?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
