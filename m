From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 09:00:36 +0200
Subject: [Buildroot] Using buildroot generated toolchain as external
 toolchain issues
In-Reply-To: <1526636.mbSdBIvjiD@sagittea>
References: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local>
 <1526636.mbSdBIvjiD@sagittea>
Message-ID: <20150729090036.65757161@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, Matthew,

On Wed, 29 Jul 2015 08:22:04 +0200, J?r?me Pouiller wrote:

> > I then take the contents of the output/host/usr directory and put it in
> > a tar
> > file that is then used as the external toolchain in the other buildroot
> > instances.  
> Your problem come from this step. Buildroot toolchains are not "relocatable". 
> It means they don't work if move them away from their original location 
> (Samuel Martin sent a patch to fix this behavior).

Correct.

> 
> Therefore, once you compiled your toolchain, use "Pre-installed toolchain" 
> option in order to use it.

This will not change anything: the toolchain must still be installed in
the location for which it was compiled, but as you can explain below,
this location can be customized.

> Note: while you compile you toolchain, you can change BR2_HOST_DIR in order to 
> build it directly in directory of you choice (/opt/arm-buildroot-linux-
> gnueabihf for example).

Matthew, there are two options currently available to fix this problem:

 * Use Samuel Martin's patches that adjust the RPATH of host binaries
   automatically at the end of the build:

   http://lists.busybox.net/pipermail/buildroot/2015-July/132483.html
   and following patches.

 * Use a quick hack that consists in building the libraries needed by
   gcc as static libraries. This is the trick I'm currently using to
   build the Buildroot external toolchains used in the autobuilders
   (http://autobuild.buildroot.org). I can provide the patch if you
   want.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
