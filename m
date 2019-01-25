From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Jan 2019 23:59:55 +0100
Subject: [Buildroot] Fwd: Unsafe Headers
In-Reply-To: <CAAOxJQQYvcTFHoXTosuDqFB_XuLejNPe-4My1YkPMJj0-cS9vw@mail.gmail.com>
References: <CAAOxJQT0dUAvax=feyRUmEM7kFyd5ftSgX_8nfn1P_8NoH+Gkg@mail.gmail.com>
 <CAAOxJQQYvcTFHoXTosuDqFB_XuLejNPe-4My1YkPMJj0-cS9vw@mail.gmail.com>
Message-ID: <a2faa708-60de-2a0a-6603-e4fe1a73812f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Igor,

 Please avoid sending HTML mails.

On 24/01/2019 14:06, Igor Miranda wrote:
> 
> ---------- Forwarded message ---------
> From: *Igor Miranda* <igorcmiranda3110@gmail.com
> <mailto:igorcmiranda3110@gmail.com>>
> Date: qui, 24 de jan de 2019 08:05
> Subject: Unsafe Headers
> To: <aduskett at gmail.com <mailto:aduskett@gmail.com>>
> 
> 
> *Dear Adam,*
> *
> *
> *I'm writing this email because I did a recipe for the GST-SHARK and I got this
> error:*
[snip]
> libtool: install: (cd
> /home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/plugins/tracers;
> /bin/bash "/home/igor/buildroot/buildroot/output/build/gst-shark-0.5.5/libtool"?
> --silent --tag CC --tag disable-static --mode=relink
> /home/igor/buildroot/buildroot/output/host/bin/arm-buildroot-linux-gnueabi-gcc
[snip compilation options]
> -L/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib
> -lgobject-2.0 -lgmodule-2.0 -pthread -lglib-2.0
> -L/home/igor/buildroot/buildroot/output/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib
> -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0?libgstshark.la
> <http://libgstshark.la/>?-inst-prefix-dir
> /home/igor/buildroot/buildroot/output/target)
> libtool: warning: remember to run 'libtool --finish /usr/lib'
> arm-buildroot-linux-gnueabi-gcc: ERROR: unsafe header/library path used in
> cross-compilation: '-L/usr/lib'

 As you can see, no -L/usr/lib is given on the command line, but still it
reaches the compiler. That's because libtool wasn't patched, and that is because
you used libtoolize/autogen.sh which overwrites the patched libtool files.

 The solution is not to use autogen.sh. Instead, set GST_SHARK_AUTORECONF = YES
in the .mk file. Buildroot's autoreconf will take care of patching the libtool
files.

 You may have a problem because the downloaded tarball doesn't contain the
common/ submodule. The best solution for that is to not use the tarball
download, but instead use the git download method:

GST_SHARK_SITE = https://github.com/RidgeRun/gst-shark
GST_SHARK_SITE_METHOD = git
GST_SHARK_GIT_SUBMODULES = YES
# Downloaded from git, no configure script
GST_SHARK_AUTORECONF = YES


 Regards,
 Arnout
