From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 21:29:57 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
 dependencies first
In-Reply-To: <20130919205718.45d3c7cc@skate>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
 <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
 <20130919173926.0bf04d9a@skate>
 <CAAXf6LWpjXetyUo4QHbc3FFi4qP2qmeSsJbuwwP9+3_vnuabyQ@mail.gmail.com>
 <20130919205718.45d3c7cc@skate>
Message-ID: <523B50B5.2080903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 20:57, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 19 Sep 2013 18:27:34 +0200, Thomas De Schampheleire wrote:
>
>> I was thinking it could become a separate build target. But at that
>> time I didn't fully realize (and didn't check) that these lists are
>> actually included in the manual. So, that question is void now.
>
> No problem :)
>
>> Remains: how should we check for python argparse? Module argparse is
>> included from python-2.7 and python-3.2 onwards. It seems that Ubuntu
>> has been providing python-argparse for older python versions as well,
>> but IMO it is not needed to check for this explicitly. If you ask me,
>> I would simply check for python 2.7+ and 3.2+, but I'm open for
>> discussion.
>
> if ! python -c "import argparse" >/dev/null 2>&1 ; then
> 	echo "No Python, or argparse not available"
> 	exit 1
> fi
>
> something like that, no? It would cover both cases were argparse is
> part of the default Python installation and the cases were argparse was
> installed separately.

  You could also download https://argparse.googlecode.com/hg/argparse.py 
if needed, or include it in buildroot and at the following to the python 
script:

try:
	import argparse
except:
	import compat_argparse as argparse

  Unfortunately that only works down to python 2.5 - argparse.py is not 
compatible with 2.4 or earlier.


  Or, you could convert the script to optparse :-)


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
