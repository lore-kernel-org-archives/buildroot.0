From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 Sep 2015 12:48:52 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-06
In-Reply-To: <55ED592E.60802@imgtec.com>
References: <20150907063016.E32C8100E4D@stock.ovh.net>
 <55ED592E.60802@imgtec.com>
Message-ID: <20150907094852.GG2213@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Mon, Sep 07, 2015 at 10:30:22AM +0100, Vicente Olivert Riera wrote:
> On 09/07/2015 07:30 AM, Thomas Petazzoni wrote:
> > Build statistics for 2015-09-06
> > ===============================
> 
> >     mips64el | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/0c469ad4f94c2834cae0e615395a82bc3d2d0946/
> 
> I have investigated that and I have found the problem.
> 
> The package xproto_glproto installs the needed headers to $(STAGING_DIR):
> 
> [snip]
> make[2]: Entering directory `/br/output/build/xproto_glproto-1.4.17'
> make[2]: Nothing to be done for `install-exec-am'.
>  /bin/mkdir -p
> '/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/GL'
>  /bin/mkdir -p
> '/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/GL/internal'
>  /bin/mkdir -p
> '/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig'
>  /usr/bin/install -c -m 644 glcore.h
> '/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/GL/internal'
>  /usr/bin/install -c -m 644 glxint.h glxmd.h glxproto.h glxtokens.h
> '/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/GL'
>  /usr/bin/install -c -m 644 glproto.pc
> '/home/ldap/vriera/git-clones/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig'
> make[2]: Leaving directory `/br/output/build/xproto_glproto-1.4.17'
> [snip]
> 
> But later, the package mesa3d deletes that directory at the end of its
> 'install_to_staging' phase:
> 
> [snip]
> make[1]: Leaving directory `/br/output/build/mesa3d-10.6.6'
> rm -f
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/dri.pc
> rm -f
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gl.pc
> rm -rf
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/GL/
> >>> mesa3d 10.6.6 Fixing libtool files
> >>> mesa3d 10.6.6 Installing to target
> [snip]
> 
> And then the package xdriver_xf86-video-r128 can't find the headers that
> it needs:
> 
> [snip]
> r128_dri.c:61:26: fatal error: GL/glxtokens.h: No such file or directory
>  #include "GL/glxtokens.h"
> [snip]
> 
> I'm not sure how to fix this, though. Ideas welcome.

Maybe make mesa3d an optional dependency of xproto_glproto? The would ensure 
that xproto_glproto builds after mesa3d.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
