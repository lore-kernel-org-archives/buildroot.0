From: Andreas Naumann <dev@andin.de>
Date: Thu, 14 Mar 2019 14:35:39 +0100
Subject: [Buildroot] [PATCH v2 02/13] qt5: Convert to generic target
 install command
In-Reply-To: <b04bf76c-a3c4-1601-10c0-78ad61dffdc7@mind.be>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
 <20190314094024.1961-3-anaumann@ultratronik.de>
 <20190314111311.48cda006@windsurf>
 <580bc2fc-615a-f200-0428-1096d2dcdf63@mind.be>
 <20190314120610.4ee82dd9@windsurf>
 <b04bf76c-a3c4-1601-10c0-78ad61dffdc7@mind.be>
Message-ID: <269608ba-7e70-ca69-b0c8-52fb70dfae26@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 14.03.19 um 12:20 schrieb Arnout Vandecappelle:
> 
> 
> On 14/03/2019 12:06, Thomas Petazzoni wrote:
>> On Thu, 14 Mar 2019 12:01:16 +0100 Arnout Vandecappelle 
>> <arnout@mind.be> wrote:
>> 
>>>> One issue with this approach is that if you do a complete 
>>>> build, and then do "make qt5base-reinstall", then the date of 
>>>> the .stamp_built file of qt5base has not changed, and will be 
>>>> older than the one of all other packages that have been built 
>>>> after qt5base. Therefore, the rsync that you do will copy again
>>>> not only the files from qt5base, but also the ones from all
>>>> other packages that have been built after qt5base.
>>> 
>>> I agree that this is a problem.

Ok, I oversaw this because I was focused on ppsh, where it is much less
of a problem. It still is because the various la/prl fixups do touch the
hardlinked files in other packages staging area. But this would have to
be fixed anyway to avoid race conditions when compiling packages in
parallel.

However, the issue should be solved if another file than .stamp_built is
touched at the beginning of staging and its timestamp is then used as
reference. After all -reinstall runs both staging and target installs.

>>> 
>>> But I think it can be easily solved by using the pkg-file-list 
>>> instead of find. Since we already have a dependency of target on
>>>  staging, we know that the pkg-file-list is up-to-date.>>
>> True.

True, pkg-file-list is another implementation trying to do the same
thing: identify which files were copied/created. However, it is
currently broken for parallel builds.
I submitted a patch a few weeks ago, but its not be perfect yet and Yann 
had some objections.

>> 
>>>> I continue to believe we want to find a solution where "make 
>>>> INSTALL_ROOT=$(TARGET_DIR) install" and "make 
>>>> INSTALL_ROOT=$(STAGING_DIR) install" works properly.

After my original post, I tried very hard to tweak qt.conf to help us
here without the need for patching the generated Makefiles. First it
looked promising but unfortunately it seem that it's not possible to
install into a temporary sysroot because it automoatically is used to
pull -I includes from.

>>> 
>>> I disagree. I think the pattern of installing to staging and then
>>> copying to target is a good pattern.

I only started going into this direction after Yann pointed out that
this might be a longterm goal.

>> 
>> We basically don't use this pattern anywhere.
> 
> A quick grep gives me alsa-utils, dmalloc, libfuse, liblockfile, 
> qt5*. So it is rare, but "don't use it anywhere" is an 
> overstatement.
> 
>> I would agree with the general direction of killing the staging vs.
>> target difference, and simply produce "target" out of "staging" at
>> the very end of the build, but that's a huge undertaking.
> 
> So my point is: using this pattern for a few packages is a good step
>  in that direction, because it teaches us something about the 
> implications.

My personal impression is, that it might be less "huge" after having 
converted to per-package staging.


best regards,
Andreas



> 
> Regards, Arnout
> 
>> 
>> Best regards,
>> 
>> Thomas
>> 
> 
