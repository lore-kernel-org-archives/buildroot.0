From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Dec 2015 18:28:43 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
In-Reply-To: <20151211165733.158cd59b@free-electrons.com>
References: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
 <20151211162850.327b9e71@free-electrons.com>
 <CAAXf6LWo1kud7n4pxUcd+yuU7Pz-BpaDF+ipv3Mwh4dZmjgvEA@mail.gmail.com>
 <20151211165733.158cd59b@free-electrons.com>
Message-ID: <20151211172843.GA7812@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, Samuel, All,

On 2015-12-11 16:57 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Dec 2015 16:55:09 +0100, Thomas De Schampheleire wrote:
> 
> > Ah, clearly not! Thanks for the reference.
> > (I did search in my gmail, but had deleted old mails a while back)
> > 
> > Are there blocking issues with these patches? There are still some
> > open comments on v5 but no objections in that iteration.
> > (I haven't reviewed the code myself yet).
> > 
> > Samuel, could you also share your view on the status of these patches?
> > Are you planning a new iteration with Baruch's comments fixed?
> 
> My objection is that the host rpath checks is done in shell scripts,
> and the target rpath mungling in python scripts. I'd like to use either
> one or the other language, but not both.

I agree that we should not have two scripts for that. Either we have a
shell script (enhance and expand the existing one), or we replace it
(e.g. with a Python script).

> I believe Samuel said he wanted to respin his series, to use python
> scripts to also do the host rpath checks that were added by Yann.

What I do not like in the current Python script from Samuel, is that it
basically just calls subprocess() to run patchelf. If that's all a
python script does, I believe it is better done in a shell script.

However, if we want to do it in Python (meh...), we should do it
natively in Python. There are Python modules to deal with ELF files:

    https://pypi.python.org/pypi/elflib/        (last uploaded 2009-04-13)
    https://github.com/tbursztyka/python-elf    (last changed 2013-10-17)
    https://github.com/eliben/pyelftools        (last changed 2015-12-11)

The first two are rather old, but the last has had recent activity
(today). There are probably tons of others.

If we can do somethhing like:

    for f in scan_dir(HOST_DIR):
        if not libelf.is_ELF(f):
            continue
        elf = libelf.open(f)
        if elf.has_rpath():
            elf.delete_rpath()
        elf.set_rpath("$ORIGIN/../lib)
        elf.save()
        elf.close()

Then I would be very happy! ;-)

Of course, maybe there is a better pythonic way to do that, and it
depends on the ELF python module API and what it can do. But you get the
idea...

Of course, it means we would need that as a host-package, because we
can't expect it to be installed on the user's system. However, that
would mean *always* building our host-python, which would be a shame...
:-(

(Note: Python may be a very good programming language, but I would not
want we do a Python script just for the sake of doing a Python script.
Let's use the best tool for the task, which would be a shell script if
all we do is call other utilities.)

Alos note that I have a (slighty-related) pending series to do
ELF-related cleanups (and also non ELF-related cleanups) in the
target/ directory:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/hooks

It would do:
  - remove symlinks to shared libs
  - rename shared libs to their SONAME
  - look for, or remove RPATH in ELF files
  - deduplicate files into hard-links
  - turn symlinks to hard-links

This series is quite old now, but I haven't yet had time to finalise it.
Maybe I can further work on it during the holidays season...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
