From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 17 Aug 2013 21:56:30 +0200
Subject: [Buildroot] Managing circular dependencies
In-Reply-To: <520e26aa.84ff440a.1af4.4538SMTPIN_ADDED_BROKEN@mx.google.com>
References: <520e26aa.84ff440a.1af4.4538SMTPIN_ADDED_BROKEN@mx.google.com>
Message-ID: <CAAXf6LVo3biV7k0QEUXHjLnhSHs5J7NDA-PUzje=EtcGZrrhFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

On Fri, Aug 16, 2013 at 3:12 PM, John OSullivan
<john.osullivan@cloudiumsystems.com> wrote:
>
> I have some code which I have inherited and I am in the process of
> integrating into a buildroot-2012.05 based build system. The problem is that
> package (A) creates a static library, in creating this it references headers
> in package (B). Package (B) has a dependency on the static library built by
> package (A).
>
> The code I have is a bit of a mess but at the moment I just need to get it
> building within buildroot. I can think of a number of ugly hacks but I was
> wondering what approach I should take to this in buildroot. I had thought
> that the staging area in output/staging might help but I am not sure what
> its intended purpose is.

The staging area is where headers and libraries of packages are
placed, so other packages can use them. This copying is done when
FOO_INSTALL_STAGING is set to YES.

>
> In terms of the package files.
>
> I set packageA.mk to have a dependency with PACKAGEA_DEPENDENCIES =
> host-cmake packageB
>
> And also
>
> I set packageB.mk to have a dependency with PACKAGEB_DEPENDENCIES =
> host-cmake packageA
>
>
>
> As it build package (A) I see a message Package (B) dependency dropped.
>
> I had tried a line like:
>
> #define PACKAGEA_INSTALL_STAGING_CMDS
>
>                $(INSTALL) ?D ?m 0755 $(@)/packagealib.a
> $(STAGING_DIR)/usr/lib/packagealib.a
>
>
>
> But this just deposits the file in output/host/usr

Can you be a bit more specific?
Note that 'output/staging' is actually a symbolic link to a path in
output/host. Maybe this confused you?

>
> I had thought that if I got the necessary header files into
> output/usr/include or some such location then it might be the basis of a
> solution.
>
> Is there a particular approach I need to take here?
>

When there is no circular dependency, and package A depends on B, then
B would set B_INSTALL_STAGING to YES, and its headers and/or libraries
would be put in output/staging.
Package A would be built after B, and the compiler/linker will
automatically find the required headers and libraries.

Due to the circular dependency you are having, this approach won't
work (needless to say, the presence of this circular dependency
indicates a problem with the code, but you are already aware of that).

Should these packages really be separate? Are they actually separate
entities, separate code bases etc.? If not really necessary, you could
solve your problems by making it one package in buildroot. Then all
header and library finding can be solved within the commands of that
package.

Here is another suggestion: from the package A build commands, you
have access to the build directory of package B and vice-versa,
through the variables A_DIR and B_DIR, which are resolved when the
configure/build/install commands are executed. You could thus
explicitly reference the include directory of package B from A through
variable B_DIR. Similarly for the library.
You still need to set the right FOO_DEPENDENCIES. Assuming that the
headers are not generated but readily available in package B, then
package A can depend on the target B-extract. B can depend on A:
B_DEPENDENCIES = A
A_DEPENDENCIES = B-extract

This way, A will have access to the headers of B, and after it's
built, B can have access to the A library.

I hope this helps you in the right direction...

Best regards,
Thomas
