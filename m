From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Aug 2014 12:17:06 +0200
Subject: [Buildroot] [PATCH 0 of 5 v4 for 2014.08] manual-text
	generation improvements
In-Reply-To: <CAHXCMMLDC9zSmo4wzZiFrwFGV805Yhdso7H2GNpFLqnBuptB_A@mail.gmail.com>
References: <patchbomb.1408110033@localhost>
 <20140816093547.666af315@free-electrons.com>
 <CAAXf6LWuy0jVvzNgq9YLvcOwNtWmiVLc6fxWfczBE-DHRBTXug@mail.gmail.com>
 <CAHXCMMJ1YTS7K7tP2aFcDgC8cTGM32C-n4P+jf0r=pVB5zGZ-A@mail.gmail.com>
 <CAHXCMMLMnxoRo4iXBME92kghZ1QDf0EcU7ZyPBUD38OLLkdNaQ@mail.gmail.com>
 <CAAXf6LXYpBxeYNkZd85jDn0ctNEWWo-qdzZHc8nhRPO4g8ws_g@mail.gmail.com>
 <CAHXCMMLDC9zSmo4wzZiFrwFGV805Yhdso7H2GNpFLqnBuptB_A@mail.gmail.com>
Message-ID: <CAAXf6LU6UBsCV+N7w4ofF0-reB6fpXZVTxnfp_EwCB3f470UNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sat, Aug 16, 2014 at 9:39 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Thomas,
> Ok, I'll try to be clearer.
>
>>
>> There are two observations:
>> 1. ThomasP and apparantly you too get an error on generating the pdf
>> manual using 'make manual-clean manual'. However, I don't see the same
>> thing, pdf builds fine for me.
>> Strangely enough, if I remove the '-$$(Q)rm -rf $$(@D)/.build' line
>> (to fix the second point), then I do get this error.
>>
>>
>> 2. None of the manuals except the html one (the first one) contain the
>> package lists. This is due to the removal of the .build directory
>> between each manual generation, which is the directory where the lists
>> are generated.
>> Removing the directory seems not really needed to me, so why not just
>> avoid that?
>
> First, there is this 2nd observation.
> I agree with your suggestion; however since the manual generation
> takes place in the output doc directory, we should clean the temporary
> $(O)/docs/manual/.build directory at the end of the manual generation.
> I propose to move this build directory under $(O)/build/manual/. I'm
> cooking a patch for this

If you do this, then another improvement is to extract the 'mkdir +
rsync' steps to a common target that is run only once. Currently, the
rsync is repeated for every format, while it is always the same
content.

>
> A consequence of this bug (to be confirmed) is that we have released a
> couple of version with some missing pieces in the pdf manual included
> in the tarball.
>
> Another consequence of this bug is that it maskes the observation #1
> when you build all the manual formats at the same time. That could
> explain why you did not see the error before removing the "rm" call.
> If you run 'make distclean && make manual-pdf' from a clean worktree,
> you will trigger the dblatex error.
>
> The error of the observation #1 is caused by xsltproc, which reaches
> some template recursion limits when processing the big target package
> table.
> This limit can be raised thanks to the xsltproc option: --maxvars, but
> the latest release of libxslt (1.1.28) is buggy and does not correctly
> handle this argument when it is passed through the command line.
> This xsltproc bug is fixed upstream on the libxslt master [1], but not
> yet in any of its release.
>
> So:
> - we have already released a couple of version with some missing
> pieces in manual.pdf;
> - if someone wants to successfully build the pdf manual, he/she has to
> make sure the xsltproc correctly support the --maxvars option (i.e. it
> has been built with the patch [1]).
> - if we want to make possible to anyone to build the pdf manual, then
> the should provide our own xsltproc program. This introduces a
> host-package dependency on the manual target, (so a .config dependency
> and so on, and so forth).
>
> As Yann (on IRC) and Thomas P. noticed, we have not received any
> complaint about the missing part in the pdf manual, probably because
> people mainly uses the online html doc and very few people needs to
> build the manual.
>
> So:
> - we can certainly live with a broken pdf manual generation;
> - the person doing the release (Peter) just has to make sure his
> xsltproc is not buggy to properly generate the official manual (both
> the online one and the one included in the release tarball).
>
>
> Hope this is clearer.

Yes, this is clearer, thanks.

Best regards,
Thomas
