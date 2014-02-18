From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 15:14:49 +0100
Subject: [Buildroot] [PATCH 2 of 4] alsa-lib: add a fake dlfcn.h header
	if dynamic load is not supported
In-Reply-To: <CAAXf6LVCBqSQ=W6xgYUVFJvm6VE+c0GfvVXEv31Ts30m6g0vtg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 18 Feb 2014 14:14:37
 +0100")
References: <patchbomb.1392224140@argentina>
 <2b373a4c038e8029fbfb.1392224142@argentina>
 <87a9dowtgi.fsf@dell.be.48ers.dk>
 <CAAXf6LVCBqSQ=W6xgYUVFJvm6VE+c0GfvVXEv31Ts30m6g0vtg@mail.gmail.com>
Message-ID: <87wqgsv76u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> What the the upstream status of this patch? We don't usually carry
 >> feature patches in buildroot (besides backports).

 > It was submitted by Sonic Zhang, but without response:
 > http://mailman.alsa-project.org/pipermail/alsa-devel/2013-November/069218.html
 > http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069587.html

Ok :/

 > I can try to resubmit it after the above change and see what happens...

 >> 
 >> Are those two defines the only part of dlfcn.h used? If so, how about
 >> protection the pieces of code using them with #ifdef HAVE_LIBDL instead?

 > Typical usage is:
 > ./src/mixer/simple_abst.c:82:   h = snd_dlopen(xlib, RTLD_NOW);
 > ./src/mixer/simple_abst.c:129:  h = snd_dlopen(xlib, RTLD_NOW|RTLD_GLOBAL);

 > where snd_dlopen is a wrapper:

Ok, why don't we then just stick:

#ifndef RTLD_NOW
#define RTLD_NOW 0
#endif

#ifndef RTLD_GLOBAL
#define RTLD_GLOBAL 0
#endif

To the header where snd_dlopen is defined?

-- 
Bye, Peter Korsgaard
