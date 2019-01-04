From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Jan 2019 11:03:50 +0100
Subject: [Buildroot] [PATCH] core/instrumentation: filter-out packages
 that install identical files
In-Reply-To: <20190104095110.GK5991@scaer>
References: <20190103160431.13306-1-yann.morin.1998@free.fr>
 <20190103223752.5262bdac@windsurf> <20190103223832.GJ5991@scaer>
 <20190104102457.5f0bb603@windsurf> <20190104095110.GK5991@scaer>
Message-ID: <20190104110350.4dee71ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Jan 2019 10:51:10 +0100, Yann E. MORIN wrote:

> > I tried it on top of this patch, and after fixing the conflict, I get a
> > weird exception:  
> 
> Hmm, did you see the date the commit was made? 1 year ago now. I need to
> refresh it (OK, I lied when I saud "ready", I meant "I already got
> prepared for that").

I know, but the commit was pretty trivial, and I wanted to do some
testing.

> That patch is meant to be applied to master as it is today.

I guess you wanted to say "NOT meant".

> Additionally, I wanted to add a --(no-)md5 option to check-uniq-file, to
> ignore the md5 and bail out if files are only just barely touched by two
> packages.

I'm not sure how much useful that is going to be.

> > Clearly weird, because .add_argument() definitely takes a type= keyword
> > argument. I don't have the time to investigate right now.  
> 
> I'll look at it before posting, of course.

OK.

> > > -xtype is what we were using before 7fb6e78254:
> > >     https://git.buildroot.org/buildroot/commit/package/pkg-generic.mk?id=7fb6e782542fc440c2da226ec4525236d0508b77  
> > 
> > OK, but is this change to go back to -xtype related ?  
> 
> I just mostly "reverted" to the previous find command we were using.

But is there a reason ?

> > So I'm not again changing the format now, but I'm not happy with the
> > idea that we might have to change it over and over and over again, due
> > to the need for the file name field to be the last one.  
> 
> OK, let me think of it...
> 
> Quick suggestion: let's break it now and never break it again. We could
> use \0 as a field separator: \0 *is* guaranteed to never be part of a
> filename. So, the new format would be:
> 
>     package-name\0file-name\0md5\n
> 
> So, a user would have to split on \0 and extract by field number rather
> than until EOL. This will allow us to add new fields as need be.
> 
> Would that be OK?
> 
> Of course, splitting on \0 is a bit less easy to do in shell scripts,
> but sed, grep, and awk all allow it pretty easily. It's less trivial in
> bash to use it to split fields ?-la "${var#,*}", but heck, that's
> already pretty unsafe.
> 
> Note that \n is allowed in a filename, so we'd need to be a bit smart
> when reading this file. Or ignore the problem and blame whoever creates
> a file with a \n in it (and detect it and bail out, too).

\0 would indeed work, but as you said it's not the most practical
separator. Let's see if Arnout or Peter have some additional feedback
on this. Another option is to use a more "structured" format.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
