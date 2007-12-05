From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 5 Dec 2007 17:51:48 +0100
Subject: [Buildroot] Placement of custom module-building in
	buildrootprocedure
References: <996871.76104.qm@web51907.mail.re2.yahoo.com>
Message-ID: <000201c83769$2c903080$6e03420a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hello -
> 
>  I've searched the archives for this last year and
> couldn't find an answer so I appeal to your good humor in
> guiding me... I'm using buildroot/busybox 1.01/linux 2.6.18
> ported for MIPS provided by PMC-Sierra.
> 
>  I'm trying to add another module (dev driver
> specifically) to the build. Do I need to specifically add
> my module into a config file under the linux tree, or is it
> good enough to call the "make M=$(MYSRCDIR) -C $(KERNELDIR)
> modules" on my own, within my own Makefile, (i.e. along
> with the build of my applications/libraries) that is
> included as a separate package in the buildroot process?
> 
You should develop your linux driver separate from buildroot,
and then generate a patch.
By using the advanced linux configuration you can supply
a path to the patch, and when linux is decompressed,
your patch will be applied to the linux source tree.

By giving the command:

$ make configured

you will stop the build before anything is compiled.
Go into the linux source directory in $(PROJECT_BUILD_DIR) and do 

$ make ARCH=mips xconfig.

Save the configuration and ensure that the .config is available
somewhere in the buildroot tree and that LINUX26_KCONFIG 
is the path to the file.

One way of doing this automatically is to do

make saveconfig

This will store your configuration files under "local/<project>".

>  I presume perhaps I can't call 'modules' on my own
> [during the kernel build] since it needs to be called
> following all the other modules being built in the linux
> kernel build - is this correct? If this is true, what't the
> authoratative buildroot file I add reference to my module
> so it gets built as the last module?
> 
>  My module need not start-up at boot, I was going to
> insmod-it in the rc.local script - is this conventional?
> 
>  Thanks
>    Sean Parker
> 
> P.S. Does anyone know of a resource I could look at to
> learn the fundamentals of how the Linux build runs,
> especially the use of the "obj-y obj-m" stuff? I'm a
> relative Make novice, and would like to understand that
> better.
> 
> 
> 
> 
> 
> God Bless 
>    Sean Parker 
> 


Best Regards
Ulf Samuelsson
