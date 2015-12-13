From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 Dec 2015 16:09:12 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
In-Reply-To: <CAAXf6LXYdZQAbeWUQhsPKG+pWBohgRx_+PiXuwhz0f8zXY5uUA@mail.gmail.com>
References: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
 <20151211162850.327b9e71@free-electrons.com>
 <CAAXf6LWo1kud7n4pxUcd+yuU7Pz-BpaDF+ipv3Mwh4dZmjgvEA@mail.gmail.com>
 <20151211165733.158cd59b@free-electrons.com> <20151211172843.GA7812@free.fr>
 <CAAXf6LXYdZQAbeWUQhsPKG+pWBohgRx_+PiXuwhz0f8zXY5uUA@mail.gmail.com>
Message-ID: <CAHXCMMJXAV8mf4+M=2n9iVnifyZ4ugbnMqk1y2NdCj+duzXxGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, Yann, all,

On Fri, Dec 11, 2015 at 9:25 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Thomas, Yann, Samuel, all,
>
> On Fri, Dec 11, 2015 at 6:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Thomas?, Samuel, All,
>>
>> On 2015-12-11 16:57 +0100, Thomas Petazzoni spake thusly:
>>> On Fri, 11 Dec 2015 16:55:09 +0100, Thomas De Schampheleire wrote:
>>>
>>> > Ah, clearly not! Thanks for the reference.
>>> > (I did search in my gmail, but had deleted old mails a while back)
>>> >
>>> > Are there blocking issues with these patches? There are still some
>>> > open comments on v5 but no objections in that iteration.
>>> > (I haven't reviewed the code myself yet).
>>> >
>>> > Samuel, could you also share your view on the status of these patches?
These patches are still "alive" ;-), you can find the latest version
(still wip) here:
https://github.com/tSed/buildroot/tree/sma/host-pkg-rpath/wip

Since the v5, this branch includes:
- rebasing on top of master;
- tooling to track host-sytem leak in the SDK and target filesystems;
- reorganization of the files;
- a couple of fixes...

It still a WIP, code should be clean or almost, but not the branch
that clearly needs to be rebased!

>>> > Are you planning a new iteration with Baruch's comments fixed?
I answered them I think.

>>>
>>> My objection is that the host rpath checks is done in shell scripts,
>>> and the target rpath mungling in python scripts. I'd like to use either
>>> one or the other language, but not both.
>>
>> I agree that we should not have two scripts for that. Either we have a
>> shell script (enhance and expand the existing one), or we replace it
>> (e.g. with a Python script).
I second.

>>
>>> I believe Samuel said he wanted to respin his series, to use python
>>> scripts to also do the host rpath checks that were added by Yann.
>>
>> What I do not like in the current Python script from Samuel, is that it
>> basically just calls subprocess() to run patchelf. If that's all a
>> python script does, I believe it is better done in a shell script.
I agree...

>>
>> However, if we want to do it in Python (meh...), we should do it
>> natively in Python. There are Python modules to deal with ELF files:
>>
>>    https://pypi.python.org/pypi/elflib/        (last uploaded 2009-04-13)
>>    https://github.com/tbursztyka/python-elf    (last changed 2013-10-17)
>>    https://github.com/eliben/pyelftools        (last changed 2015-12-11)
I have already played a bit with pyelftools packages, but one of its
limitation is it can only read ELF files, not update some of their
sections :-/

>>
> [..]
>>
>> Of course, it means we would need that as a host-package, because we
>> can't expect it to be installed on the user's system. However, that
>> would mean *always* building our host-python, which would be a shame...
>> :-(
Well...True and false:
False: because python is already a pre-requirement for Buildroot, so
technically we could just install just python module as a generic
host-package and invoke the host system python interpreter; but true
because doing like this means totally by-pass teh Buildroot philosophy
and our way of doing thing :-/

Also, I have concerns about Buildroot depending or carrying many
external python packages for jobs belonging to the its global infra...

>>
>> (Note: Python may be a very good programming language, but I would not
>> want we do a Python script just for the sake of doing a Python script.
>> Let's use the best tool for the task, which would be a shell script if
>> all we do is call other utilities.)
>
>
> I think Python is a great language for certain scripting tasks. It
> provides, among others, very easy list manipulation, things that can
> be pretty cumbersome in shell scripts.
> However, when the bulk of a script is to call another program, I too
> prefer shell scripts. Having read the proposed Python script, the main
> advantage of Python would be the manipulation of the (multiple)
> RPATHs, their filtering, and combination into one string with :
> delimiters. So, mainly this is the compute_rpath function. I'm pretty
> sure this can also be achieved, with reasonable readability and
> understandability, with a shell script and standard UNIX utilities.
That's exactly the reason why I choose to do it in python,
manipulating strings/paths is easier (at least for me) in python than
in shell script... I can certainly improve skill on this ;-)

I can try rewrite it in shell script... Be prepared to review some...
not so pretty things ;-)

>
>>
>> Alos note that I have a (slighty-related) pending series to do
>> ELF-related cleanups (and also non ELF-related cleanups) in the
>> target/ directory:
>>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/hooks
>>
>> It would do:
>>   - remove symlinks to shared libs
>>   - rename shared libs to their SONAME
>>   - look for, or remove RPATH in ELF files
>>   - deduplicate files into hard-links
>>   - turn symlinks to hard-links
>>
>> This series is quite old now, but I haven't yet had time to finalise it.
>> Maybe I can further work on it during the holidays season...
>
> Now, that is just /too/ much shell scripting ;-)
>
>
> /Thomas


Regards,

-- 
Samuel
