From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 16 Apr 2012 18:00:36 +0200
Subject: [Buildroot] Problem with apply-patches.sh
In-Reply-To: <CAFbHwiQUUsb2XPY_+nw--m1KTutFY_zXVYHaFNAfac_ftg78fA@mail.gmail.com>
References: <CAFbHwiQUUsb2XPY_+nw--m1KTutFY_zXVYHaFNAfac_ftg78fA@mail.gmail.com>
Message-ID: <4F8C4224.6040500@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Le 04/16/2012 04:40 PM, Will Newton a ?crit :
> Hi all,
>
> I noticed that in some cases apply-patches.sh will misbehave if you
> have a file matching the glob '*.patch' in the top-level directory.
> For example the patching of binutils fails in this case. The problem
> is at the line:
>
>      support/scripts/apply-patches.sh $(@D)
> $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH)
> || exit 1;
>
> in package/Makefile.package.in. The glob gets expanded prematurely (to
> e.g. myfile.patch) and then the expanded glob is passed to
> apply-patches.sh which will fail to find any patches matching the
> glob. I've had a go at trying to stop this happening but with no
> success so far. Can anyone think of any creative ways to suppress this
> expansion?
>
> Thanks,

I see what you mean but I can't reproduce your issue:


diff --git a/support/scripts/apply-patches.sh 
b/support/scripts/apply-patches.sh
index e4b98bc..787a297 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -11,6 +11,10 @@ patchdir=${2-../kernel-patches}
  shift 2
  patchpattern=${@-*}

+echo "====================="
+echo "$patchpattern"
+
  if [ ! -d "${builddir}" ] ; then
      echo "Aborting.  '${builddir}' is not a directory."
      exit 1


 >>> binutils 2.21.1 Extracting
bzcat /home/ldesroches/workspace/buildroot/dl/binutils-2.21.1.tar.bz2 | 
tar --strip-components=1 -C 
/home/ldesroches/workspace/buildroot/output/build/binutils-2.21.1  -xf -
 >>> binutils 2.21.1 Patching package//binutils
=====================
binutils*.patch binutils*.patch.arm
=====================
*.patch *.patch.arm

On my side the expansion is done only into apply-patches.sh but you are 
right it is done too early


I am going to send a patch to correct this.


Thanks to report this bug.


Regards

Ludovic
