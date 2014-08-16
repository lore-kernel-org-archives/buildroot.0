From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 16 Aug 2014 21:39:14 +0200
Subject: [Buildroot] [PATCH 0 of 5 v4 for 2014.08] manual-text
	generation improvements
In-Reply-To: <CAAXf6LXYpBxeYNkZd85jDn0ctNEWWo-qdzZHc8nhRPO4g8ws_g@mail.gmail.com>
References: <patchbomb.1408110033@localhost>
 <20140816093547.666af315@free-electrons.com>
 <CAAXf6LWuy0jVvzNgq9YLvcOwNtWmiVLc6fxWfczBE-DHRBTXug@mail.gmail.com>
 <CAHXCMMJ1YTS7K7tP2aFcDgC8cTGM32C-n4P+jf0r=pVB5zGZ-A@mail.gmail.com>
 <CAHXCMMLMnxoRo4iXBME92kghZ1QDf0EcU7ZyPBUD38OLLkdNaQ@mail.gmail.com>
 <CAAXf6LXYpBxeYNkZd85jDn0ctNEWWo-qdzZHc8nhRPO4g8ws_g@mail.gmail.com>
Message-ID: <CAHXCMMLDC9zSmo4wzZiFrwFGV805Yhdso7H2GNpFLqnBuptB_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Aug 16, 2014 at 8:35 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Samuel,
>
> On Sat, Aug 16, 2014 at 7:24 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> On Sat, Aug 16, 2014 at 1:00 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>>> On Sat, Aug 16, 2014 at 12:15 PM, Thomas De Schampheleire
>>> <patrickdepinguin@gmail.com> wrote:
>>>> On Sat, Aug 16, 2014 at 9:35 AM, Thomas Petazzoni
>> [...]
>>>>>  * When building the PDF and txt versions of the manual, I get one
>>>>>    warning:
>>>>>
>>>>>    a2x: WARNING: --destination-dir option is only applicable to HTML based outputs
>>>>>
>>>>>    It seems to be harmless as the result is really located in the right
>>>>>    place (output/docs), but I found it worth mentioning.
>>>>
>>>> Yes, I see the same. We could pass format specific options to avoid
>>>> passing -D for non-html formats. Not sure whether it's worth the
>>>> effort, I will have a look.
>>>
>>> I've noticed this too, but have not found a proper way to suppress it.
>>
>> I have not looked into this.
>>
>>>>
>>>>>
>>>>>  * Also, here the PDF version of the manual doesn't build:
>>>>>
>>>>>    a2x: ERROR: "dblatex" -t pdf -p "/etc/asciidoc/dblatex/asciidoc-dblatex.xsl" -s "/etc/asciidoc/dblatex/asciidoc-dblatex.sty" -P latex.output.revhistory=0  "/home/thomas/projets/buildroot/output/docs/manual/manual.xml" returned non-zero exit status 1
>>>
>>> Few shortcomings:
>>> - the generated appendix tables are only included in the html manual
>>> (when running: make manual-clean manual). It seems these files are not
>>> regenerated after the 'rm -rf $$(@D)/.build' :-/
>>> - the above error seems related to these generated appendix tables,
>>> because when they don't exits, the pdf manual generation succeeds.
>>>
>>> This makes me think about refactoring the manual.mk to be closer to
>>> the package ones, i.e. having it build directory under $(0)/build,
>>> maybe inheriting from generic-package...
>>> Anyway, this is just wild ideas; for the upcoming release there is
>>> this pdf issue to fix.
>>>
>>
>> Well, after diving into asciidoc/dblatex/xslt, I eventually found the
>> problem and the the fix!
>>
>> Short-long story:
>>
>> When generating the pdf manual, a2x calls dblatex, which calls xsltproc.
>> Here is a verbose log [1].
>> During its execution, xsltproc checks for template recursion and
>> reaches its limit set to 15000 when processing the target
>> package-list.txt file (empirically, this limit allows a 1147-entry
>> table).
>> To raise this limit, a --maxvars option exists in xsltproc program but
>> the latest release of libxslt is buggy and this option is not honored.
>> :-(
>> Hopefully the fix is already merged upstream [2].
>> Backporting this patch is enough to get a working xsltproc, but it
>> also means that we now need to build host-libxslt (and a .config) to
>> build the manual.
>> So, to build the manual we have to run:
>> $ make defconfig && make host-libxslt manual
>>
>> The main drawback of this fix is that building the manual could now
>> require building some host-package.
>>
>> This also makes echo to the include statement of the *.mk files
>> without having a .config file discussion.
>>
>> Anyway, I will prepare a series fixing this, though it is not a
>> mandatory for the release
>>
>> Note that we have already released a couple of Buildroot versions
>> without recieving any complaint about this.
>>
>>
>> [1] http://code.bulix.org/1905fo-86779
>> [2] https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
>
> I must say I don't fully understand this.

Ok, I'll try to be clearer.

>
> There are two observations:
> 1. ThomasP and apparantly you too get an error on generating the pdf
> manual using 'make manual-clean manual'. However, I don't see the same
> thing, pdf builds fine for me.
> Strangely enough, if I remove the '-$$(Q)rm -rf $$(@D)/.build' line
> (to fix the second point), then I do get this error.
>
>
> 2. None of the manuals except the html one (the first one) contain the
> package lists. This is due to the removal of the .build directory
> between each manual generation, which is the directory where the lists
> are generated.
> Removing the directory seems not really needed to me, so why not just
> avoid that?

First, there is this 2nd observation.
I agree with your suggestion; however since the manual generation
takes place in the output doc directory, we should clean the temporary
$(O)/docs/manual/.build directory at the end of the manual generation.
I propose to move this build directory under $(O)/build/manual/. I'm
cooking a patch for this

A consequence of this bug (to be confirmed) is that we have released a
couple of version with some missing pieces in the pdf manual included
in the tarball.

Another consequence of this bug is that it maskes the observation #1
when you build all the manual formats at the same time. That could
explain why you did not see the error before removing the "rm" call.
If you run 'make distclean && make manual-pdf' from a clean worktree,
you will trigger the dblatex error.

The error of the observation #1 is caused by xsltproc, which reaches
some template recursion limits when processing the big target package
table.
This limit can be raised thanks to the xsltproc option: --maxvars, but
the latest release of libxslt (1.1.28) is buggy and does not correctly
handle this argument when it is passed through the command line.
This xsltproc bug is fixed upstream on the libxslt master [1], but not
yet in any of its release.

So:
- we have already released a couple of version with some missing
pieces in manual.pdf;
- if someone wants to successfully build the pdf manual, he/she has to
make sure the xsltproc correctly support the --maxvars option (i.e. it
has been built with the patch [1]).
- if we want to make possible to anyone to build the pdf manual, then
the should provide our own xsltproc program. This introduces a
host-package dependency on the manual target, (so a .config dependency
and so on, and so forth).


As Yann (on IRC) and Thomas P. noticed, we have not received any
complaint about the missing part in the pdf manual, probably because
people mainly uses the online html doc and very few people needs to
build the manual.

So:
- we can certainly live with a broken pdf manual generation;
- the person doing the release (Peter) just has to make sure his
xsltproc is not buggy to properly generate the official manual (both
the online one and the one included in the release tarball).


Hope this is clearer.


[1] https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c

>
> Thanks,
> Thomas

Regards,

-- 
Samuel
