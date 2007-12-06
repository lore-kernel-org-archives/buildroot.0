From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 6 Dec 2007 01:59:31 +0100
Subject: [Buildroot] Fw: Placement of custom module-building
	inbuildrootprocedure
Message-ID: <06b301c837a3$4e2391d0$6e03420a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Ulf - 
> 
>  Thanks so much for your reply.
> 
>  It's difficult moving from the application-development
> world
> to the embedded world where kernel issues become prevalant
> - 
> please bear with my ignorance...
> 

You are barking up the wrong mailing list.
You need to send these emails to something related to the linux kernel
and not to the buildroot mailing list.
Which mailing list, I do not know, since you are using a MIPS core.

If you were a well brought up boy, you would be using an ARM processor
(or AVR32 :-) and I could direct you to the correct list.
Suggest you ask your MIPS vendor for advice on mailing list, - or switch CPU ;-)

Best Regards
Ulf Samuelsson


>> You should develop your linux driver separate from
>>  buildroot, and then generate a patch.
> 
> I've started by moving my code to the linux tree, say
> under:
> 
> $(KDIR)/drivers/mymod
>   |
>   + mymod.c
>   |
>   + Makefile <-  includes obj-m+=mymod.o
> 
> Of course then I do have to edit $(KDIR)/drivers/Makefile 
> to include "mymod/" as a subdir
> 
>> By using the advanced linux configuration you can supply
>> a path to the patch, and when linux is decompressed,
>> your patch will be applied to the linux source tree.
> 
> How do I make a patch to the linux kernel? (I thought the
> patch
> process needed some reference tree in order to know "what's
> different")
> 
> However, I do see how a patch is the best solution to 
> leaving the distro-linux package untouched. At what point
> in the
> buildroot process/structure do I indicate I have a patch?
> I do have other application code I'm including in my
> project
> as a separate package to the buildroot structure - can I
> put the 
> patch reference in my <my_proj>.mk file? (the one placed
> under
> buildroot/packages/<my_proj>)
> 
>> By giving the command:
>>
>>$ make configured
>>
>> you will stop the build before anything is compiled.
>> Go into the linux source directory in
> $(PROJECT_BUILD_DIR)
>> and do 
>>
>> $ make ARCH=mips xconfig.
>>
>>Save the configuration and ensure that the .config is
>> available somewhere in the buildroot tree and that 
>> LINUX26_KCONFIG is the path to the file.
> 
> I'm just leaving $(KDIR)/.config alone for now - if I make 
> mymod "always" I shouldn't need to mees with this should I?
> 
> Otherwise, I'm saving the various buildroot/busybox config
> files
> off in my own location, and overwriting the vendor versions
> when I do a clean build, that way I preserve my own copies
> while
> being able to reinstall the vender version cleanly also
> (without the
> extra make menuconfig step every time). 
> 
>> One way of doing this automatically is to do
>>   make saveconfig
>>
>> This will store your configuration files under
> "local/<project>".
>>
> 
> How does it know, unless I tell it to save it somewhere
> else? It sounds like
> you're saying it'll know about my project just by doing the
> 
> make xconfig, but I don't understand how it gets in there
> without
> me editing a config file otherwise...
> 
> <snip my stuff>
> 
>> Best Regards
>> Ulf Samuelsson
> 
> I guess the main confusion here [with me] is the
> distinction between 
> "kernel-" vs. "external-" modules, and the orthogonal ideas
> of
> "cross-compiling" and "adding modules to a local running
> kernel."
> 
>  for example:
> 
>            X-compile             pre-built
>                                   kernel
>         -----------------------------------------
>         |                     |
> kernel  |  use obj-y          | compile a module
>  mod    |  in kbuild file     | and re-make linux 
>         |  within buildroot   | kernel
>         |  context            |
>         |                     |
>         -----------------------------------------
>         |                     |
> external|  as buildroot pkg   |
>  mod    |  refer to code      |
>         |  outside of context | compile a module and
>         |  of linux tree ??? -| do insmod straight-away
>         |  or do a patch to   | to load it for this 
>         |  hack it in         | session only
>         |                     |
>         -----------------------------------------
> 
> Does this make sense? Please correct my understanding...
> 
> The documentation I suppose takes for granted that these
> are clearly
> defined contexts in anyone's discussion of the issues - and
> thus the need
> for newbies to constantly ask the same questions - i.e.
> "how do I add a module?"
> 
> Thanks for your time and effort
>   Sean Parker
> 
> 
> 
> 
> 
> God Bless 
>    Sean Parker 
> 
> 
> 
> 
> 
>      ____________________________________________________________________________________
> Looking for last minute shopping deals?  
> Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
