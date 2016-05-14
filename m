From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 May 2016 01:48:29 +0200
Subject: [Buildroot] [PATCH 09/34] reproducibility/libglib2: allow
 removing codegen
In-Reply-To: <20160514133442.GE27354@hermes.click-hack.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
 <88864677-f612-bd6b-3158-5c2980bb9825@mind.be>
 <20160508202511.GT13285@hermes.click-hack.org>
 <00b9819d-dbe3-52ce-75f7-6d7a8217f47a@mind.be>
 <20160510194257.GE13285@hermes.click-hack.org>
 <a5ff4b5b-d255-17d5-1393-d16b72965482@mind.be>
 <20160514133442.GE27354@hermes.click-hack.org>
Message-ID: <95f1c231-275c-4fca-e6df-a138bd3d4c0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/16 15:34, Gilles Chanteperdrix wrote:
> On Thu, May 12, 2016 at 10:05:36PM +0200, Arnout Vandecappelle wrote:
>> On 05/10/16 21:42, Gilles Chanteperdrix wrote:
>>> On Tue, May 10, 2016 at 01:40:30AM +0200, Arnout Vandecappelle wrote:
[snip]
>>>>   I think it would make sense to run 'touch -d @$(SOURCE_DATE_EPOCH)' on all
>>>> files after patching to capture this aspect. This was also proposed for
>>>> Fedora[1] (though there it was only for the .py files). Not sure what happened
>>>> with that proposal in the end.
>>>
>>> I think I tried running "touch" before compiling, unfortunately
>>> playing with file dates before running "make" is a bit like playing
>>> with fire. For instance with autotools based projects for which
>>> autoreconf is not run, the project may use versions of the autotools
>>> not installed on the user machine, and because of file dates may
>>> want to rerun autoconf or autmake and whine because the right
>>> versions are not available. Doing this only for .py files is much
>>> more reasonable.
>>
>>   I tested this as well, with make-3.81 and make-4.04. Both of them do _not_
>> rebuild if the timestamps are identical. And since the idea is to use touch -d
>> @$(SOURCE_DATE_EPOCH), all timestamps will be identical.
>
> You checked both the pyo and the pyc?

  Yep.


>>   But it does indeed mean that if a package has a generated file with an earlier
>> date than the source files, it will now suddenly no longer be
>> rebuilt.
>
> Yes, that is another problem. But I tried it, and this is not the
> one I had, the one I had was the contrary: the dates made make want
> to rebuild some files (the autotools/automake files), whereas the
> right versions of autoconf and automake were not installed, this was
> a package that did not run autoreconf. The "make" tool is completely
> based on file dates, so again, I think messing with file dates
> before running make is a bad idea.

  Hm, I don't see how this could happen... My test showed that 'make' would not 
try to rebuild the autotools/automake files when they have the same timestamp as 
the corresponding source file. So what triggers the reconf then?

  I've tried with a random package (bash) and it's not reconfiguring after 
touching all sources. Do you remember for which package you saw this?


  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
