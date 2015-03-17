From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 15:30:28 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <5508382D.7080008@zacarias.com.ar>
References: <20150315221722.3645eb35@free-electrons.com>
 <20150315221813.173a36e2@free-electrons.com>
 <5508382D.7080008@zacarias.com.ar>
Message-ID: <20150317153028.66788805@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 11:20:29 -0300, Gustavo Zacarias wrote:

> This seems to be a problem with the internal toolchain since we don't
> enable tls for gcc, whereas ADIs toolchain does.

I think we should make the TLS option a blind option, and have it
unconditionally enabled, except if the architecture doesn't support it.

> Which may point to alsa-lib requiring toolchain tls support.

Indeed:

#ifndef DOC_HIDDEN
#ifdef HAVE___THREAD
#define TLS_PFX         __thread
#else
#define TLS_PFX         /* NOP */
#endif
#endif

static TLS_PFX snd_local_error_handler_t local_error = NULL;

So when thread support is available, alsa-lib assumes TLS support is there.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
