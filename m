From: daggs <daggs@gmx.com>
Date: Wed, 6 Jul 2016 07:02:18 +0200
Subject: [Buildroot] [PATCH 4/4 v3] kodi: allow enablement of libamcodec
 as codec if selected
In-Reply-To: <3ca27259-fade-eee6-f108-c5bb4a0b388f@mind.be>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>
 <37g24dxqbs.ln2@ID-313208.user.individual.net>
 <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
 <trinity-90b29fc0-247c-47a2-9a96-f80d2a588ee3-1467482301230@3capp-mailcom-bs01>
 <f6f8aa1e-e673-4d86-a51a-807987b14209@mind.be>
 <trinity-03edb1a5-1beb-41bf-9ff0-5e241acea84c-1467524433514@3capp-mailcom-bs04>,
 <3ca27259-fade-eee6-f108-c5bb4a0b388f@mind.be>
Message-ID: <trinity-77079792-dc2e-4173-83ba-0862e1bde734-1467781338276@3capp-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> > Greetings,
> > 
> >> On 02-07-16 19:58, daggs wrote:
> [snip]
> >>> I've looked into this issue, the root of the issue can be found at output/build/kodi-16.1-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
> >>> where we see the following:
> >>> ifeq (@USE_LIBAMCODEC@,1)
> >>> SRCS += AMLCodec.cpp
> >>> SRCS += DVDVideoCodecAmlogic.cpp
> >>> INCLUDES += -I$(prefix)/include/amcodec
> >>> INCLUDES += -I$(prefix)/include/amplayer
> >>
> >>  That is just wrong, the cpp file does #include <amcodec/codec.h> so there is no
> >> need for this additional -I...
> >>
> >>  So IMHO the fix is to remove those INCLUDES lines.
> >>
> >>  Regards,
> >>  Arnout
> > 
> > that was one of the first things I've tried, the problem is that that one of the headers under include/amcodec includes another header from the same folder in this format: #include <abc.h>
> > I can change it to either #include "abc.h" is this preferable? also this will require a change in libamcodec it self, a change that I'm not sure that can be accepted by the maintainer.
> 
>  I think it's better to patch libamcodec itself. I you don't patch it, it means
> any other user of libamcodec will be facing the same problem. Also using "" is
> the proper thing to do, so upstream might accept it. Insofar as
> 
>  An alternative is to not install libamcodec in the amcodec directory, since the
> package's Makefile doesn't do that anyway, it installs directly in /usr/include.
> Ugly, but if that is what upstream does, it makes sense to stick to it. But that
> would mean that kodi has to be patched to _remove_ the amcodec part from the
> #include directives.
> 
>  Regards,
>  Arnout

ok, so I've fixed the includes in libamcodec and removed the include part from kodi, it still failes on another file but with the same issue.
this got me thinking so I've extracted the full compile commnad of the relevant file, here is it:
/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -MF AMLCodec.d -MD -c -O2 -g -D_DEBUG -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/libdrm -L/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lEGL -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu++11 -mno-apcs-stack-check -mfpu=neon -mvectorize-with-neon-quad -DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS '-DBIN_INSTALL_PATH="/usr/lib/kodi"' '-DINSTALL_PATH="/usr/share/kodi"' '-DGIT_REV="Unknown"' -DNPT_CONFIG_ENABLE_LOGGING '-DPLT_HTTP_DEFAULT_USER_AGENT="UPnP/1.0 DLNADOC/1.50 Kodi"' '-DPLT_HTTP_DEFAULT_SERVER="UPnP/1.0 DLNADOC/1.50 Kodi"' -DHAVE_CONFIG_H -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/xbmc/cores/dvdplayer -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/lib -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/xbmc -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/xbmc/addons/include -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/addons/library.kodi.guilib -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/addons/library.xbmc.addon -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/addons/library.kodi.adsp -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/addons/library.kodi.audioengine -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/addons/library.xbmc.pvr -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/addons/library.xbmc.codec -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/freetype2 -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/fribidi -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/libpng16 -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/libxml2 -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/taglib -I/home/dagg/workspace/buildroots/buildroot-master/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/yajl -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/xbmc/linux -I/home/dagg/workspace/buildroots/buildroot-master/output/build/kodi-16.1-Jarvis/xbmc/cores/dvdplayer AMLCodec.cpp -o AMLCodec.o

looking at the line above reveals something intresting, when enabling the enable-codec=amcodec switch, as amcodec is a lib, someone might expect to find a -i$(SYSROOT)/usr/include/amcodec in the command. there isn't one.

as I agree the is a bug in the amcodec lib when it comes to the includes, there is a bug in kodi too, probably because laziness of the devs.
I couldn't find any place in the code that checks if libamcodec is installed as it is a prerequisits. it is done for taglib or fribidi for example. but not for libamcodec.

imho that is wrong, supporting cross compilation on most of the pkgs and ignoring another is not the way to do that.
I know my suggestion before was ugly (using --print-sysroot), but as I see it, it is the only simple way to do so.

Dagg.
