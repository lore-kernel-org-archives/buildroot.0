From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Feb 2014 15:19:18 +0100
Subject: [Buildroot] [PATCH 2 of 4] alsa-lib: add a fake dlfcn.h header
 if dynamic load is not supported
In-Reply-To: <87wqgsv76u.fsf@dell.be.48ers.dk>
References: <patchbomb.1392224140@argentina>
 <2b373a4c038e8029fbfb.1392224142@argentina>
 <87a9dowtgi.fsf@dell.be.48ers.dk>
 <CAAXf6LVCBqSQ=W6xgYUVFJvm6VE+c0GfvVXEv31Ts30m6g0vtg@mail.gmail.com>
 <87wqgsv76u.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWW=ZgkHZ4--ToOf_=GPycP=rRG8LjqDFQq_mFOV04u0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 18, 2014 at 3:14 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  >> What the the upstream status of this patch? We don't usually carry
>  >> feature patches in buildroot (besides backports).
>
>  > It was submitted by Sonic Zhang, but without response:
>  > http://mailman.alsa-project.org/pipermail/alsa-devel/2013-November/069218.html
>  > http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069587.html
>
> Ok :/
>
>  > I can try to resubmit it after the above change and see what happens...
>
>  >>
>  >> Are those two defines the only part of dlfcn.h used? If so, how about
>  >> protection the pieces of code using them with #ifdef HAVE_LIBDL instead?
>
>  > Typical usage is:
>  > ./src/mixer/simple_abst.c:82:   h = snd_dlopen(xlib, RTLD_NOW);
>  > ./src/mixer/simple_abst.c:129:  h = snd_dlopen(xlib, RTLD_NOW|RTLD_GLOBAL);
>
>  > where snd_dlopen is a wrapper:
>
> Ok, why don't we then just stick:
>
> #ifndef RTLD_NOW
> #define RTLD_NOW 0
> #endif
>
> #ifndef RTLD_GLOBAL
> #define RTLD_GLOBAL 0
> #endif
>
> To the header where snd_dlopen is defined?

That could be done, but we still need something like:
#ifdef HAVE_LIBDL
#include <dlfcn.h>
#endif

right?

Best regards,
Thomas
