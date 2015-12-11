From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Dec 2015 21:25:07 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
In-Reply-To: <20151211172843.GA7812@free.fr>
References: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
 <20151211162850.327b9e71@free-electrons.com>
 <CAAXf6LWo1kud7n4pxUcd+yuU7Pz-BpaDF+ipv3Mwh4dZmjgvEA@mail.gmail.com>
 <20151211165733.158cd59b@free-electrons.com> <20151211172843.GA7812@free.fr>
Message-ID: <CAAXf6LXYdZQAbeWUQhsPKG+pWBohgRx_+PiXuwhz0f8zXY5uUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann, Samuel, all,

On Fri, Dec 11, 2015 at 6:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas?, Samuel, All,
>
> On 2015-12-11 16:57 +0100, Thomas Petazzoni spake thusly:
>> On Fri, 11 Dec 2015 16:55:09 +0100, Thomas De Schampheleire wrote:
>>
>> > Ah, clearly not! Thanks for the reference.
>> > (I did search in my gmail, but had deleted old mails a while back)
>> >
>> > Are there blocking issues with these patches? There are still some
>> > open comments on v5 but no objections in that iteration.
>> > (I haven't reviewed the code myself yet).
>> >
>> > Samuel, could you also share your view on the status of these patches?
>> > Are you planning a new iteration with Baruch's comments fixed?
>>
>> My objection is that the host rpath checks is done in shell scripts,
>> and the target rpath mungling in python scripts. I'd like to use either
>> one or the other language, but not both.
>
> I agree that we should not have two scripts for that. Either we have a
> shell script (enhance and expand the existing one), or we replace it
> (e.g. with a Python script).
>
>> I believe Samuel said he wanted to respin his series, to use python
>> scripts to also do the host rpath checks that were added by Yann.
>
> What I do not like in the current Python script from Samuel, is that it
> basically just calls subprocess() to run patchelf. If that's all a
> python script does, I believe it is better done in a shell script.
>
> However, if we want to do it in Python (meh...), we should do it
> natively in Python. There are Python modules to deal with ELF files:
>
[..]
>
> Of course, it means we would need that as a host-package, because we
> can't expect it to be installed on the user's system. However, that
> would mean *always* building our host-python, which would be a shame...
> :-(
>
> (Note: Python may be a very good programming language, but I would not
> want we do a Python script just for the sake of doing a Python script.
> Let's use the best tool for the task, which would be a shell script if
> all we do is call other utilities.)


I think Python is a great language for certain scripting tasks. It
provides, among others, very easy list manipulation, things that can
be pretty cumbersome in shell scripts.
However, when the bulk of a script is to call another program, I too
prefer shell scripts. Having read the proposed Python script, the main
advantage of Python would be the manipulation of the (multiple)
RPATHs, their filtering, and combination into one string with :
delimiters. So, mainly this is the compute_rpath function. I'm pretty
sure this can also be achieved, with reasonable readability and
understandability, with a shell script and standard UNIX utilities.

>
> Alos note that I have a (slighty-related) pending series to do
> ELF-related cleanups (and also non ELF-related cleanups) in the
> target/ directory:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/hooks
>
> It would do:
>   - remove symlinks to shared libs
>   - rename shared libs to their SONAME
>   - look for, or remove RPATH in ELF files
>   - deduplicate files into hard-links
>   - turn symlinks to hard-links
>
> This series is quite old now, but I haven't yet had time to finalise it.
> Maybe I can further work on it during the holidays season...

Now, that is just /too/ much shell scripting ;-)


/Thomas
