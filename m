From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Jan 2019 10:24:57 +0100
Subject: [Buildroot] [PATCH] core/instrumentation: filter-out packages
 that install identical files
In-Reply-To: <20190103223832.GJ5991@scaer>
References: <20190103160431.13306-1-yann.morin.1998@free.fr>
 <20190103223752.5262bdac@windsurf> <20190103223832.GJ5991@scaer>
Message-ID: <20190104102457.5f0bb603@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Jan 2019 23:38:32 +0100, Yann E. MORIN wrote:

> > A couple of comments/questions (here and below):
> > 
> >  - I believe we should still fix the fact that the .la file timestamp
> >    is changed everytime we $(SED) the .la files, even if they are not
> >    changed. This will also help reduce the number of files to check
> >    using md5sum: a .la file should be fixed only once, and its
> >    timestamp never touched again.  
> 
> That is a different change, indeed, that should be done in the staging
> install commands. I can tackle that.

It is a different change, but a change we can easily forget once this
md5 logic is in place, as we will no longer notice that those files are
rewritten over and over again.

> >  - Could we make a check-uniq-files error a hard build failure, as a
> >    follow-up patch from yours ? So far, check-uniq-files errors have
> >    been a bit useless, because they do not cause the build to fail, so
> >    nobody really cared.  
> 
> That's fine, I already have the patch ready here: ;-)
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/misc&id=2c1ba76ee86a8f6bd9b9d4a67fa1e9bf28e840da

I tried it on top of this patch, and after fixing the conflict, I get a
weird exception:

# Check files that are touched by more than one package
./support/scripts/check-uniq-files --fail -t target /home/thomas/projets/buildroot/output/build/packages-file-list.txt
Traceback (most recent call last):
  File "./support/scripts/check-uniq-files", line 61, in <module>
    sys.exit(main())
  File "./support/scripts/check-uniq-files", line 17, in main
    help='Fail if a file is touched by more than one package')
  File "/usr/lib64/python2.7/argparse.py", line 1294, in add_argument
    action = action_class(**kwargs)
TypeError: __init__() got an unexpected keyword argument 'type'
make[1]: *** [Makefile:725: target-finalize] Error 1
make: *** [Makefile:84: _all] Error 2

Clearly weird, because .add_argument() definitely takes a type= keyword
argument. I don't have the time to investigate right now.

> -xtype is what we were using before 7fb6e78254:
>     https://git.buildroot.org/buildroot/commit/package/pkg-generic.mk?id=7fb6e782542fc440c2da226ec4525236d0508b77

OK, but is this change to go back to -xtype related ?

> > One drawback is that it won't work with filenames that contain a comma.
> > But in this case, we're forced to keep the filename field as the last
> > one, and therefore break backward compatibility of the
> > package-file-lists.txt format every time we want to add a new
> > information to it.  
> 
> In any case, we have to break backward compatibility. I actually thought
> about it, but forgot to say so in the commit message, my bad...

I don't have a good solution to offer right away, but breaking backward
compatibility on a file like package-file-list.txt is problematic I
believe. Indeed, we have several times recommended to people to do some
post processing using this file. I am myself considering using it for
the toolchains.bootlin.com stuff to remove from the toolchain tarballs
the files that are not really needed (like files installed by
host-automake, host-autoconf, etc.). This would be some external
scripting that parses package-file-list.txt, and I would not be very
happy to see this being broken once in a while. Especially since I tend
to build using two different Buildroot versions (for stable and
bleeding-edge), and I would even have an intermediate period where my
bleeding-edge builds have the new package-file-list.txt format, and the
stable builds have the old format. Not nice.

So I'm not again changing the format now, but I'm not happy with the
idea that we might have to change it over and over and over again, due
to the need for the file name field to be the last one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
