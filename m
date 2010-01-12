From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2010 11:52:28 +0100
Subject: [Buildroot] Issue for the integration of Codesourcery external
 toolchains
In-Reply-To: <1262647415.23193.99.camel@coalu.atr>
References: <20100104162422.5b7e7bf6@surf>
	<1262647415.23193.99.camel@coalu.atr>
Message-ID: <20100112115228.6f81f471@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your input!

On Tue, 05 Jan 2010 00:23:35 +0100
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> To me, probably the best solution...
> But why would it require a custom spec file ? --sysroot doesn't change
> the headers and librairies' default path in that case ?

--sysroot changes it, but the toolchain continues to append /armv4t at
the end:

$ /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc --sysroot=/foo/bar -print-sysroot
/foo/bar

$ /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -march=armv4t --sysroot=/foo/bar -print-sysroot
/foo/bar/armv4t

See ?

Which is why I was talking about hacking the specs file. But I'm still
not there.

With the original spec file:

$ /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -specs=spec.orig -march=armv4t -print-multi-directory
armv4t

With a modified spec file:

$ /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -specs=spec -march=armv4t -print-multi-directory
.

Which looks good. But then:

$ /usr/local/xtools/arm-2009q1/bin/arm-none-linux-gnueabi-gcc -specs=spec -march=armv4t --sysroot=/foo/bar -print-sysroot
/foo/bar/armv4t

Still not working. So even by hacking the spec file I'm not able to get
the proper behaviour.

So maybe our solution of using --sysroot is ugly and we should fall
back to the solution where the toolchain sysroot is kept in its
original location and we just use -L/-I to indicate where our staging
directory is (solution which has proved in the past to be fairly
difficult to stabilize).

I really don't know how we should move forward.

> > Thanks for reading such a long mail, and thanks in advance for your
> > ideas!
> 
> I never worked with codesourcery's toolchains (as not working with ARM
> chips).
> Is the set of toolchain you're using available somewhere ?

Yes, you can go to http://www.codesourcery.com/sgpp_eval.html and
register for a free evaluation.

> <Not_so_related>
> 
> By the way, we still have some problem with the current scripts
> setting up the staging/target directories. Maybe I'm the only one who
> noticed/has_a_strange_setup...
> 
> Just like every other linker script :
> 
> 	$(STAGING_DIR)/usr/lib/libpthread.so
> 	$(STAGING_DIR)/usr/lib/libc.so
> 
> might be processed to replace the default path, usually /lib/libc.so,
> by $(STAGING_DIR)/lib/libc.so.

Isn't this the "rpath" problem ?

> We also need to copy thoses linker scripts to the target directory.

I'm not sure which linker scripts you're talking about.

> Otherwise you generate some kind of fucked up binaries when installing
> librairies in target using libtool. In particular with the pthread_*
> symbols, because some of them are defined in libc.so as weak symbols.
> So you end up having librairies calling libc's weak symbols which
> volontary crash because they might be replaced by the pthread's ones
> when pthread.so is loaded.

I'm sorry, but I didn't understand what the problem is, under which
conditions it appears, and what the fix for it is (even if it's a quick
and hacky fix).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
