From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 May 2016 23:14:32 +0200
Subject: [Buildroot] [PATCH 2/2] python3: bump to 3.5.1
In-Reply-To: <20160428235822.62dafb17@free-electrons.com>
References: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1451931809-24511-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <568AF3C0.2070602@mind.be> <20160428235822.62dafb17@free-electrons.com>
Message-ID: <5665d9af-c284-832c-086e-13214c145edf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/28/16 23:58, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 4 Jan 2016 23:35:44 +0100, Arnout Vandecappelle wrote:
>
>>  You forgot to remove the --disable-pyo-build from python3.mk.
>
> Will be in v2.
>
>>  However, I don't understand why it is necessary to do this. It is still
>> relevant to disable at least some of the compiled versions, otherwise you end up
>> with three copies on the target... We currently always disable the pyo files so
>> we should preserve that behaviour (could be improved in a later patch). IMHO of
>> course :-)
>
> I'm not sure what you mean here. Python 3.5 no longer has the concept
> of .pyc vs .pyo. It only builds .pyc files, in three variants:
>
>  foo.pyc
>  foo.opt-1.pyc
>  foo.opt-2.pyc
>
> If you have only foo.pyc on your target, everything works fine.
> However, if you have only foo.opt-1.pyc or foo.opt-2.pyc without the
> corresponding foo.pyc, then it simply doesn't work.

  That's ... weird.

  If I read PEP3147 correctly, it should be possible (in the PYC_ONLY case) to 
just replace all .py with the corresponding .pyc from the __pycache__ directory.


> Since keeping both foo.pyc and foo.opt-<X>.pyc means doubling the
> filesystem size, in the v2 of my patch, I've decided to unconditionally
> remove the foo.opt-<X>.pyc files. This way, we preserve the existing
> behavior:
>
>  PY_ONLY : only the .py files
>  PYC_ONLY : only the non-optimized .pyc files
>  PY_PYC : both of them

  Completely agree with that.


>
>>>  - The PEP3147 disabling patch had to be significantly reworked due to
>>>    the code having changed heavily. The code was moved into a
>>>    _bootstrap_external.py, which is a "frozen" Python module, i.e a
>>>    module generated into a .h file at compile time using the
>>>    _freeze_importlib program.
>>
>>  Ideally, we should work with upstream to try and find a better solution for
>> this. The PEP3147 handling is really hacky.

  As I wrote above, an alternative would be to replace the .py by the .pyc from 
the __pycache__ directory. When we have our own implemenation of compileall it 
could be done in there.

  But all that are just ideas of course :-)


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
