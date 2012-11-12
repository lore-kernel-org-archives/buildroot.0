From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 12 Nov 2012 12:39:16 +0100
Subject: [Buildroot] mesa3d:  "ImportError: No module named libxml2"
In-Reply-To: <509DB31C.90903@mind.be>
References: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
 <509DB31C.90903@mind.be>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6703AA459A@wetmex10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the DETAILED answer.

Maybe I do have to clarify what I'm trying to do.

First of all: I'm using an own-buldroot-branch for my projects (based on
an older buildroot version).

BUT: very often I do test-build (and run) the git-buildroot in order to
test a newer buildroot-version (just for test not for real-production).
{I build and test-run (at this time) for at91, imx53 and occasionally
for geode-pc}

I must say lot of things in buildroot, I'm familiar with, but some parts
are still "black-magic", and I do not always have the time/expertise to
investigate the real-problem in these 'test' git-buildroot-versions.

Further more, it is not that simple to keep up with all the "GOOD"
buildroot-work you guys are doing, and at on some
occasions/trouble-cases, I do "request" some help of the real-buildroot
experts, in order to understand/find-out where it goes wrong. 

>> The problem is that libxml2 python bindings are part of libxml2.  If
we want to build them, we would have to make host-libxml2 depend on 
>> host-python...
>> And that's certainly something we don't want.

NOTE: At this time I did experiment a little with the libxml-2/python
(in the latest-git-buildroot), in order to get mesa3d working, but I'm
not 100% happy with it (as Maxime and Thomas an now you told me, and yes
I do agree, it is not something that looks good, to make host-libxml2
depend on host-python.)


>>   BTW, Thomas already told you this on October 12 (though his
explanation was a bit shorter :-).

I do kind of agree, but often we as buildroot-users do not have the same
level of buildroot expertise/knowledge.

What I wonder is, how you guys are so fast in finding the
"real"-problem? 
I do understand that a lot of this comes from experience, but I also
understand that it is not that always simple, to find that "real" error.

But as we (developers) know, expertise/knowledge is not written down in
a COOK-BOOK, and the only way to get learn, such things, is to use it.

Or did I not find the magic button "Solve all" :-) ???


Anyway, keep up the good work and many thanks....

Regards,
Noel.








-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: 10Nov12 02:51
To: Vellemans, Noel
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] mesa3d: "ImportError: No module named libxml2"

On 11/05/12 10:18, Vellemans, Noel wrote:
> I do end up with this error while building mesa3d"  "ImportError: No 
> module named libxml2" (ONLY if I do build into a clean-output
> directory!)
>
> The strange thing is that when building for a second time it all 
> builds fine.

  The problem is that host-python is used, not native python, and
host-python doesn't have libxml2 bindings.  python is used to generate
api_exec_es1.c:
python -t -O -O main/es_generator.py -S main/APIspec.xml -V GLES1.1 >
main/api_exec_es1.c When you run it the second time, the file exists
(and is empty), so you won't get an error.  But as soon as you try to
use GLES, you'll notice that it doesn't work :-)

  The problem is that libxml2 python bindings are part of libxml2.  If
we want to build them, we would have to make host-libxml2 depend on
host-python...
And that's certainly something we don't want.

  A work-around is to set
MESA3D_CONF_ENV = PYTHON2=/usr/bin/python but that's not something we
want to do in buildroot either, because there is not guarantee that
native python has libxml2, or that the native python is python2, or that
it is in /usr/bin.

  The only realistic solution I can think of is to create a blind
BR2_NEED_HOST_LIBXML2_PYTHON_BINDINGS and select this from mesa3d.  Then
we can conditionally depend on host-python and build the bindings in
libxml2.mk.
But it is still fairly horrible.

  BTW, Thomas already told you this on October 12 (though his
explanation was a bit shorter :-).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
