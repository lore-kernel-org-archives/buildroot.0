From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Feb 2014 14:14:37 +0100
Subject: [Buildroot] [PATCH 2 of 4] alsa-lib: add a fake dlfcn.h header
 if dynamic load is not supported
In-Reply-To: <87a9dowtgi.fsf@dell.be.48ers.dk>
References: <patchbomb.1392224140@argentina>
 <2b373a4c038e8029fbfb.1392224142@argentina>
 <87a9dowtgi.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVCBqSQ=W6xgYUVFJvm6VE+c0GfvVXEv31Ts30m6g0vtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for reviewing...

On Tue, Feb 18, 2014 at 12:28 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > The FLAT GNU toolchain doesn't include the dlfcn.h header file.
>  > Provide a fake header file dlmisc.h with enough declarations to make
>  > alsa-lib happy.
>
>  > Fixes
>  > http://autobuild.buildroot.org/results/706/7069e1f43cbed745d65f7dd9904a3fff034530ac/build-end.log
>
>  > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>  > [Thomas: change sequence number from 003 to 0003, update commit message ]
>  > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>  > ---
>  >  package/alsa-lib/alsa-lib-0003-dlmisc.patch |  59 ++++++++++++++++++++++++
>  >  1 files changed, 59 insertions(+), 0 deletions(-)
>
>  > diff --git a/package/alsa-lib/alsa-lib-0003-dlmisc.patch b/package/alsa-lib/alsa-lib-0003-dlmisc.patch
>  > new file mode 100644
>  > --- /dev/null
>  > +++ b/package/alsa-lib/alsa-lib-0003-dlmisc.patch
>  > @@ -0,0 +1,59 @@
>  > +alsa-lib: dlmisc: Add a fake dl lib head file when dl lib is not supported by the toolchain.
>  > +
>  > +The FLAT GNU toolchain doesn't include the dlfcn.h header file.
>  > +
>  > +--- alsa-lib-1.0.26/src/mixer/simple_abst.c 2012-09-06 16:55:14.000000000 +0800
>  > ++++ alsa-lib-1.0.26.bak/src/mixer/simple_abst.c     2013-11-25 14:53:07.739275843 +0800
>  > +@@ -34,7 +34,11 @@
>  > + #include <fcntl.h>
>  > + #include <sys/ioctl.h>
>  > + #include <math.h>
>  > ++#ifdef HAVE_LIBDL
>  > + #include <dlfcn.h>
>  > ++#else
>  > ++#include <dlmisc.h>
>
> This is not a system header, so it should use #include "dlmisc.h".

Correct, will fix.

>
> What the the upstream status of this patch? We don't usually carry
> feature patches in buildroot (besides backports).

It was submitted by Sonic Zhang, but without response:
http://mailman.alsa-project.org/pipermail/alsa-devel/2013-November/069218.html
http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069587.html

I can try to resubmit it after the above change and see what happens...

>
> Are those two defines the only part of dlfcn.h used? If so, how about
> protection the pieces of code using them with #ifdef HAVE_LIBDL instead?

Typical usage is:
./src/mixer/simple_abst.c:82:   h = snd_dlopen(xlib, RTLD_NOW);
./src/mixer/simple_abst.c:129:  h = snd_dlopen(xlib, RTLD_NOW|RTLD_GLOBAL);

where snd_dlopen is a wrapper:

/**
 * \brief Opens a dynamic library - ALSA wrapper for \c dlopen.
 * \param name name of the library, similar to \c dlopen.
 * \param mode mode flags, similar to \c dlopen.
 * \return Library handle if successful, otherwise \c NULL.
 *
 * This function can emulate dynamic linking for the static build of
 * the alsa-lib library. In that case, \p name is set to \c NULL.
 */
void *snd_dlopen(const char *name, int mode)
{
#ifndef PIC
        if (name == NULL)
                return &snd_dlsym_start;
#else
#ifdef HAVE_LIBDL
        if (name == NULL) {
                static const char * self = NULL;
                if (self == NULL) {
                        Dl_info dlinfo;
                        if (dladdr(snd_dlopen, &dlinfo) > 0)
                                self = dlinfo.dli_fname;
                }
                name = self;
        }
#endif
#endif
#ifdef HAVE_LIBDL
        return dlopen(name, mode);
#else
        return NULL;
#endif
}

Due to the special PIC exception, I don't think we can remove the call
to snd_dlopen() entirely if !HAVE_LIBDL.

Best regards,
Thomas
