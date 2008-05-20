From: Arun Reddy <reddyac@gmail.com>
Date: Mon, 19 May 2008 17:42:25 -0700
Subject: [Buildroot] Nonrepresentable section on output?
In-Reply-To: <326f33790805182352y30741a34m6acf04ab1f434823@mail.gmail.com>
References: <326f33790805182352y30741a34m6acf04ab1f434823@mail.gmail.com>
Message-ID: <326f33790805191742l67f61c76j61aef5e81a20bec5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I believe the problem lies in the source directory for bash:
"buildroot/build_arm/bash-3.2/". In this directory we have a Configure file
and Makefile. The Makefile contains a variable called LDFLAGS which makes
use of LOCAL_LDFLAGS. In LOCAL_LDFLAGS, I see that it has the option
-rdynamic passed to it. After a bit more digging, I saw that If you add
-Wl,-z,defs to LDFLAGS it will detect unresolved symbols.

Does anyone know what these options do? I can't seem to put in a proper
search querie to find out what -z or -Wi does. Is adding them to LDFLAGS the
correct step? I did find out what -rdynamic does and I left that alone. Why
am I experiencing this problem with my ARM build and not my x86 build for
bash? (I got bash compiled fine on the x86 build).

Thank you for your help.

On Sun, May 18, 2008 at 11:52 PM, Arun Reddy <reddyac@gmail.com> wrote:

> Hi everyone,
>
> I am continuing with my ARM build and I have encountered a
> "nonrepresentable section on output" regarding ld as follows:
>
> /root/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/../../../../arm-linux-uclibc/bin/ld:
> bash: hidden symbol `__udivsi3' in
> /root/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/libgcc.a(_udivsi3.o)
> is referenced by DSO
> /root/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/../../../../arm-linux-uclibc/bin/ld:
> final link failed: Nonrepresentable section on output
> collect2: ld returned 1 exit status
> make[1]: *** [bash] Error 1
> make: *** [/root/buildroot/build_arm/bash-3.2/bash] Error 2
>
> I looked online and found that this error is fairly common. It looks like
> the "ld" loader is invoked explicitly instead of being frontended with gcc.
> I read that if you replace ld with gcc -shared, then links against that
> library will not get the "Nonrepresentable section on output"
>
> My question is, is this a problem that anyone on the list has encountered?
> If replacing ld with gcc -shared is the solution, do you know which Makefile
> will I need to modify to do this? Thank you for your help!
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080519/ce03e4ed/attachment.htm 
