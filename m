From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 15 Oct 2012 11:39:21 +0200
Subject: [Buildroot] X11 issue
In-Reply-To: <507819AE.7030408@visionsystems.de>
References: <CADiAo4Jv5+seNc=3xBCXOL+xfnzX6vzaJD5eEmh5h2y5Cmsvnw@mail.gmail.com>
 <507819AE.7030408@visionsystems.de>
Message-ID: <507BD9C9.3070001@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12.10.2012 15:22, Yegor Yefremov wrote:
> Dmitry,
> 
>> You wrote to this list on Aug 30, 2012:
>>
>>> For some time I reported about x11 problems with my am3517 based
>>> board. Is anyone using xorg and can reproduce my issue? I'd like to
>>> know if it is OMAP related ot not.
>>
>>> This is the error: (EE) FBDEV(0): internal error: miCreateDefColormap
>>> failed in FBDevScreenInit()
>>
>> I am getting the same error on plain x86 hardware (bare or in KVM).
>>
>> In the file xserver_xorg-server-1.7.5/dix/colormap.c (relative to the
>> buildroot build area) the following code:
>>
>> ca.  line 395, function CreateColormap
>>
>>     /*
>>      * Security creation/labeling check
>>      */
>>     i = XaceHook(XACE_RESOURCE_ACCESS, clients[client], mid, RT_COLORMAP,
>>                  pmap, RT_NONE, NULL, DixCreateAccess);
>>     if (i != Success) {
>>       FreeResource(mid, RT_NONE);
>>       return i;
>>     }
>>
>> the value returned from XaceHook is not Success, so CreateColormap
>> fails here. It returns to the function miCreateDefColormap located in
>> xserver_xorg-server-1.7.5/mi/micmap.c, ca. line 314, and then the
>> caller of miCreateDefColormap (in the fbdev driver) prints the message
>> you saw.
>>
>> If I comment out the return after XaceHook, miCreateDefColormap seems
>> to proceed, but the X server crashes.
>>
>> I'll try to build gdb for the target and see where this takes me. If
>> anybody else saw this error and got any more results please share
>> here.
>>
>> Hope this helps.
> 
> I'm testing the latest BR i.e. xserver 1.9.4. Here you can see the full xdm output:
> 
> X.Org X Server 1.9.4
> Release Date: 2011-02-04
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 3.1.9-1.4-desktop x86_64
> Current Operating System: Linux buildroot 3.2.9+ #239 Thu Oct 11 15:08:16 CEST 2012 armv7l
> Kernel command line: console=ttyO3,115200n8 rootwait root=/dev/mmcblk0p2 rw nohlt
> Build Date: 12 October 2012  09:40:52AM
> 
> Current version of pixman: 0.25.2
>         Before reporting problems, check http://wiki.x.org
>         to make sure that you have the latest version.
> Markers: (--) probed, (**) from config file, (==) default setting,
>         (++) from command line, (!!) notice, (II) informational,
>         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (==) Log file: "/var/log/Xorg.0.log", Time: Wed Dec 31 17:00:25 1969
> (==) Using system config directory "/usr/share/X11/xorg.conf.d"
> Primary device is not PCI
> _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/misc/
> [dix] Could not init font path element ${prefix}/share/fonts/X11/misc/, removing from list!
> _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/TTF/
> [dix] Could not init font path element ${prefix}/share/fonts/X11/TTF/, removing from list!
> _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/OTF/
> [dix] Could not init font path element ${prefix}/share/fonts/X11/OTF/, removing from list!
> _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/Type1/
> [dix] Could not init font path element ${prefix}/share/fonts/X11/Type1/, removing from list!
> _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/100dpi/
> [dix] Could not init font path element ${prefix}/share/fonts/X11/100dpi/, removing from list!
> _FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/75dpi/
> [dix] Could not init font path element ${prefix}/share/fonts/X11/75dpi/, removing from list!
> /usr/bin/xrdb:  "xlogin*greetFont" on line 32 overrides entry on line 23
> /usr/bin/xrdb:  "xlogin*font" on line 33 overrides entry on line 24
> /usr/bin/xrdb:  "xlogin*promptFont" on line 34 overrides entry on line 25
> /usr/bin/xrdb:  "xlogin*failFont" on line 35 overrides entry on line 26
> /usr/bin/xrdb:  "xlogin*greetFace" on line 36 overrides entry on line 27
> /usr/bin/xrdb:  "xlogin*face" on line 37 overrides entry on line 28
> /usr/bin/xrdb:  "xlogin*promptFace" on line 38 overrides entry on line 29
> /usr/bin/xrdb:  "xlogin*failFace" on line 39 overrides entry on line 30
> /usr/bin/xrdb:  "xlogin*borderWidth" on line 55 overrides entry on line 43
> /usr/bin/xrdb:  "xlogin*frameWidth" on line 56 overrides entry on line 44
> /usr/bin/xrdb:  "xlogin*innerFramesWidth" on line 57 overrides entry on line 45
> /usr/bin/xrdb:  "xlogin*shdColor" on line 58 overrides entry on line 46
> /usr/bin/xrdb:  "xlogin*hiColor" on line 59 overrides entry on line 47
> /usr/bin/xrdb:  "xlogin*logoFileName" on line 65 overrides entry on line 63
> 
> -:0         : symbol 'XRenderParseColor': can't resolve symbol
> xdm error (pid 109): (null) while loading /usr/lib/X11/xdm/libXdmGreet.so
> xdm info (pid 98): Exiting
> 
> So far couldn't anything valuable in web.

Tried Sourcery CodeBench ARM 2011.09 and everything started without a problem, i.e. no resolve symbols problem, as with BR own toolchain. Sourcery CodeBench ARM 2012.03 had problems compiling xdm - after 20 minutes gcc was still 100% busy compiling/linking xdm.

Yegor
