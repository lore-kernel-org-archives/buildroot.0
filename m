From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jan 2019 10:51:10 +0100
Subject: [Buildroot] [PATCH] core/instrumentation: filter-out packages
 that install identical files
In-Reply-To: <20190104102457.5f0bb603@windsurf>
References: <20190103160431.13306-1-yann.morin.1998@free.fr>
 <20190103223752.5262bdac@windsurf> <20190103223832.GJ5991@scaer>
 <20190104102457.5f0bb603@windsurf>
Message-ID: <20190104095110.GK5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-04 10:24 +0100, Thomas Petazzoni spake thusly:
> On Thu, 3 Jan 2019 23:38:32 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > >  - Could we make a check-uniq-files error a hard build failure, as a
> > >    follow-up patch from yours ? So far, check-uniq-files errors have
> > >    been a bit useless, because they do not cause the build to fail, so
> > >    nobody really cared.  
> > 
> > That's fine, I already have the patch ready here: ;-)
> >     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/misc&id=2c1ba76ee86a8f6bd9b9d4a67fa1e9bf28e840da
> 
> I tried it on top of this patch, and after fixing the conflict, I get a
> weird exception:

Hmm, did you see the date the commit was made? 1 year ago now. I need to
refresh it (OK, I lied when I saud "ready", I meant "I already got
prepared for that").

That patch is meant to be applied to master as it is today.

Additionally, I wanted to add a --(no-)md5 option to check-uniq-file, to
ignore the md5 and bail out if files are only just barely touched by two
packages.

> # Check files that are touched by more than one package
> ./support/scripts/check-uniq-files --fail -t target /home/thomas/projets/buildroot/output/build/packages-file-list.txt
> Traceback (most recent call last):
>   File "./support/scripts/check-uniq-files", line 61, in <module>
>     sys.exit(main())
>   File "./support/scripts/check-uniq-files", line 17, in main
>     help='Fail if a file is touched by more than one package')
>   File "/usr/lib64/python2.7/argparse.py", line 1294, in add_argument
>     action = action_class(**kwargs)
> TypeError: __init__() got an unexpected keyword argument 'type'
> make[1]: *** [Makefile:725: target-finalize] Error 1
> make: *** [Makefile:84: _all] Error 2
> 
> Clearly weird, because .add_argument() definitely takes a type= keyword
> argument. I don't have the time to investigate right now.

I'll look at it before posting, of course.

> > -xtype is what we were using before 7fb6e78254:
> >     https://git.buildroot.org/buildroot/commit/package/pkg-generic.mk?id=7fb6e782542fc440c2da226ec4525236d0508b77
> 
> OK, but is this change to go back to -xtype related ?

I just mostly "reverted" to the previous find command we were using.

> > > One drawback is that it won't work with filenames that contain a comma.
> > > But in this case, we're forced to keep the filename field as the last
> > > one, and therefore break backward compatibility of the
> > > package-file-lists.txt format every time we want to add a new
> > > information to it.  
> > 
> > In any case, we have to break backward compatibility. I actually thought
> > about it, but forgot to say so in the commit message, my bad...
> 
> I don't have a good solution to offer right away, but breaking backward
> compatibility on a file like package-file-list.txt is problematic I
> believe. Indeed, we have several times recommended to people to do some
> post processing using this file. I am myself considering using it for
> the toolchains.bootlin.com stuff to remove from the toolchain tarballs
> the files that are not really needed (like files installed by
> host-automake, host-autoconf, etc.). This would be some external
> scripting that parses package-file-list.txt, and I would not be very
> happy to see this being broken once in a while. Especially since I tend
> to build using two different Buildroot versions (for stable and
> bleeding-edge), and I would even have an intermediate period where my
> bleeding-edge builds have the new package-file-list.txt format, and the
> stable builds have the old format. Not nice.
> 
> So I'm not again changing the format now, but I'm not happy with the
> idea that we might have to change it over and over and over again, due
> to the need for the file name field to be the last one.

OK, let me think of it...

Quick suggestion: let's break it now and never break it again. We could
use \0 as a field separator: \0 *is* guaranteed to never be part of a
filename. So, the new format would be:

    package-name\0file-name\0md5\n

So, a user would have to split on \0 and extract by field number rather
than until EOL. This will allow us to add new fields as need be.

Would that be OK?

Of course, splitting on \0 is a bit less easy to do in shell scripts,
but sed, grep, and awk all allow it pretty easily. It's less trivial in
bash to use it to split fields ?-la "${var#,*}", but heck, that's
already pretty unsafe.

Note that \n is allowed in a filename, so we'd need to be a bit smart
when reading this file. Or ignore the problem and blame whoever creates
a file with a \n in it (and detect it and bail out, too).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
