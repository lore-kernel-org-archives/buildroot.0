From: Bryce Schober <bryce.schober@gmail.com>
Date: Tue, 7 Jan 2014 15:00:45 -0800
Subject: [Buildroot] mesa3d autoreconfigure problem
In-Reply-To: <3kvtpaxsi3.ln2@ID-313208.user.individual.net>
References: <CAJpxd07aYbSX=Lxc48y+3=GvTp5rujcZNPfp+gOaX_6bf5Z-jA@mail.gmail.com>
 <CAJpxd07F14_pk7k+AEqaoUAjv_QgB1uaxnoHHtO5twd3nSKsRw@mail.gmail.com>
 <3kvtpaxsi3.ln2@ID-313208.user.individual.net>
Message-ID: <CAJpxd06nTVtqK2c1=yNBHjiWbdCu2HUuQEZ4G9sBjKhxNoAwiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 7, 2014 at 11:02 AM, Bernd Kuhls <berndkuhls@hotmail.com> wrote:
>
> Hi,
>
> efforts are currently underway to update mesa3d to 9.x and later 10.x, so it
> would be a good idea to just sit and wait ;)

Yeah, I noticed that... Do you have a guess for when that might land?

For the time being, the following patch seems to work for me now. Why
it does is a mystery to me, because if I replace MESA3D_VERSION with
FOO_BAR_BAZAAR, it "works" equally well.

--- a/configure.ac
+++ b/configure.ac
@@ -4,9 +4,9 @@

 dnl Versioning - scrape the version from configs/default
 m4_define([mesa_version],
-    [m4_esyscmd([${MAKE-make} -s -f bin/version.mk version | tr -d
'\n' | tr -d '\r'])])
+    [m4_default_nblank([MESA3D_VERSION],[m4_esyscmd([${MAKE-make} -s
-f bin/version.mk version | tr -d '\n' | tr -d '\r'])])])
 m4_ifval(mesa_version,,
-    [m4_fatal([Failed to get the Mesa version from `make -f
bin/version.mk version`])])
+    [m4_fatal([Failed to get the Mesa version from MESA3D_VERSION or
`make -f bin/version.mk version`])])

 dnl Tell the user about autoconf.html in the --help output
 m4_divert_once([HELP_END], [

<><  <><  <><
Bryce Schober
