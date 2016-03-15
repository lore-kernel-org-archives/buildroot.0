From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 16 Mar 2016 09:39:53 +1100
Subject: [Buildroot] [PATCH v2] linux: Build and install kernel selftests
In-Reply-To: <20160315222151.GM5053@free.fr>
References: <1451869172-16621-1-git-send-email-cyrilbur@gmail.com>
 <20160315092413.GA7196@free.fr> <20160316090932.1f2681b1@camb691>
 <20160315222151.GM5053@free.fr>
Message-ID: <20160316093953.6fbfb09f@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Mar 2016 23:21:51 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Cyril, All,
> 
> On 2016-03-16 09:09 +1100, Cyril Bur spake thusly:
> > On Tue, 15 Mar 2016 10:24:13 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:  
> > > On 2016-01-04 11:59 +1100, Cyril Bur spake thusly:  
> > > > This patch simply adds the ability to compile and install the kernel
> > > > selftests into the target at /usr/lib/kselftests.  
> [--SNIP--]
> > > > diff --git a/linux/linux-tool-selftests.mk b/linux/linux-tool-selftests.mk
> > > > new file mode 100644
> > > > index 0000000..b610599
> > > > --- /dev/null
> > > > +++ b/linux/linux-tool-selftests.mk
> > > > @@ -0,0 +1,42 @@
> > > > +################################################################################
> > > > +#
> > > > +# selftests
> > > > +#
> > > > +################################################################################
> > > > +
> > > > +LINUX_TOOLS += selftests
> > > > +
> > > > +ifeq ($(KERNEL_ARCH),x86_64)    
> > > 
> > > For i386, Buildroot sets KERNEL_ARCH=i386, so we may also want to handle
> > > that case, no?  
> > 
> > I think you're right but not super sure... I'll leave it up to an x86 boffin to
> > confirm that it's the correct thing to do :)  
> 
> Well, I guess you don't need a i386 guru to just add it, as that's what
> we already do for the kernel (see linux/linux.mk at 157).
> 
> [--SNIP--]
> > > > +SELFTESTS_DEPENDENCIES = bash    
> > > 
> > > It can also use libcap-ng, so you probably want to depend on it, too:
> > > 
> > >     /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-gcc -O2 -g
> > >       -std=gnu99 -Wall    validate_cap.c  -lcap-ng -lrt -ldl -o validate_cap
> > >     validate_cap.c:1:20: fatal error: cap-ng.h: No such file or directory
> > > 
> > > Ditto popt:
> > > 
> > >     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/
> > >     i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld: cannot
> > >     find -lpopt
> > >     collect2: error: ld returned 1 exit status  
> > 
> > I could add those dependencies I suppose, it would be nicer for everyone.  
> 
> Yes, please do.
> 
> > > However, as you said in the commit log, those are not fatal errors
> > > (although reported as such) and the build goes on successfully for the
> > > rest of the tests:
> > > 
> > > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>  
> > 
> > Are you happy for me to do a v3 based on your comments and leave both the
> > Reviewed-by and Tested-by tags?  
> 
> If all you do is:
>   - add the i386 case,
>   - add libcap-ng and popt dependencies,
> then yes, those tags of mine still stand.
> 

Ok, in doing it I had a thought, would it not just be best to add a "select"
line in the Config.tools.in line for libcap-ng and popt? That way people don't
HAVE to have it if they don't care about those tests.

I'm not sure as to the mapping between adding a select in a Config.in and using
"*_DEPENDENCIES =" in the .mk

> Don;t rename selftests into linux-selftests, though. It should be a
> separate patch that renames all the tools. For now, stay consistent with
> the existing tools, that is: do not prefix.

Yeah good point.

> 
> > Also, for what its worth, I've built and used it a lot for powerpc.  
> 
> Great! :-)
> 
> > Thanks again,  
> 
> My pleasure! :-)
> 
> Regards,
> Yann E. MORIN.
> 
