From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:47:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix static build with
 tremor and vorbis
In-Reply-To: <CAPi7W83AJMojdj1cmYrSij88Uotzfvvue4hAjCfCRr7du=-gGw@mail.gmail.com>
References: <20190601124231.25075-1-fontaine.fabrice@gmail.com>
 <20190601150329.0147d083@windsurf>
 <CAPi7W83AJMojdj1cmYrSij88Uotzfvvue4hAjCfCRr7du=-gGw@mail.gmail.com>
Message-ID: <20190601154738.37ce7f71@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jun 2019 15:40:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > > -     select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)  
> >
> > Why was this select here in the first place ? Does it build fine with
> > no sub-option enabled ?  
> It builds fine without it. I don't know why this select was added.

Should be mentioned in the commit log, and or perhaps even be part of a
separate preparation patch.

The reason why this select was added is explained in commit
d428dddf680b067c13ba9a08bfd502c7286cffe7:

commit d428dddf680b067c13ba9a08bfd502c7286cffe7
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Fri Feb 25 17:10:05 2011 -0300

    mpd: default to tremor input plugin
    
    MPD requires at least one input plugin to build.
    If there's none selected default to tremor (vorbis).
    
    Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Perhaps this is no longer true today.

> > Also, I am not sure why you are not just adding a depends on
> > BR2_SOFT_FLOAT in one case, and a "depends on !BR2_SOFT_FLOAT" in the
> > other case.  
> OK, I'll just add a depends on. I'll change the current behavior but I
> think this is acceptable.

Your idea was to try to remain backward compatible with
existing .config ? I'm not sure it's easy to achieve: we would want
tremor to be enabled if vorbis was enabled but we're on a soft-float
target. Except that you need to make vorbis depends on !BR2_SOFT_FLOAT,
so it will become disabled anyway.

I'd say, let's keep things simple, and use simple dependencies. BTW,
I'm not sure we should use BR2_SOFT_FLOAT. Perhaps, we should make the
MPD_TREMOR and MPD_VORBIS options mutually exclusive ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
