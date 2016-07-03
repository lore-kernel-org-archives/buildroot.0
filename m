From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Jul 2016 10:33:30 +0200
Subject: [Buildroot] [PATCH 4/4 v3] kodi: allow enablement of libamcodec
 as codec if selected
In-Reply-To: <trinity-03edb1a5-1beb-41bf-9ff0-5e241acea84c-1467524433514@3capp-mailcom-bs04>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>
 <37g24dxqbs.ln2@ID-313208.user.individual.net>
 <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
 <trinity-90b29fc0-247c-47a2-9a96-f80d2a588ee3-1467482301230@3capp-mailcom-bs01>
 <f6f8aa1e-e673-4d86-a51a-807987b14209@mind.be>
 <trinity-03edb1a5-1beb-41bf-9ff0-5e241acea84c-1467524433514@3capp-mailcom-bs04>
Message-ID: <3ca27259-fade-eee6-f108-c5bb4a0b388f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-07-16 07:40, daggs wrote:
> Greetings,
> 
>> On 02-07-16 19:58, daggs wrote:
[snip]
>>> I've looked into this issue, the root of the issue can be found at output/build/kodi-16.1-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in
>>> where we see the following:
>>> ifeq (@USE_LIBAMCODEC@,1)
>>> SRCS += AMLCodec.cpp
>>> SRCS += DVDVideoCodecAmlogic.cpp
>>> INCLUDES += -I$(prefix)/include/amcodec
>>> INCLUDES += -I$(prefix)/include/amplayer
>>
>>  That is just wrong, the cpp file does #include <amcodec/codec.h> so there is no
>> need for this additional -I...
>>
>>  So IMHO the fix is to remove those INCLUDES lines.
>>
>>  Regards,
>>  Arnout
> 
> that was one of the first things I've tried, the problem is that that one of the headers under include/amcodec includes another header from the same folder in this format: #include <abc.h>
> I can change it to either #include "abc.h" is this preferable? also this will require a change in libamcodec it self, a change that I'm not sure that can be accepted by the maintainer.

 I think it's better to patch libamcodec itself. I you don't patch it, it means
any other user of libamcodec will be facing the same problem. Also using "" is
the proper thing to do, so upstream might accept it. Insofar as

 An alternative is to not install libamcodec in the amcodec directory, since the
package's Makefile doesn't do that anyway, it installs directly in /usr/include.
Ugly, but if that is what upstream does, it makes sense to stick to it. But that
would mean that kodi has to be patched to _remove_ the amcodec part from the
#include directives.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
