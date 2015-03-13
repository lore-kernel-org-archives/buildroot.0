From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 21:47:51 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix use of extensions
In-Reply-To: <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
 <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
Message-ID: <20150313214751.2df5307c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 13 Mar 2015 19:57:29 +0100, Yann E. MORIN wrote:
> Currently, using externsaions is flawed and does not work in a very

extensions

> reproducible way, starting from a _clean_ tree:
> 
>     make menuconfig
>         -> enable a kernel and any externsion (fbtft is nice, since
>            it works for recent kernels)
> 
>     make linux-menuconfig
> 
> Observe how it is not patching the kernel tree with the extensions prior
> to running the linux configuratin UI?

configuration

> This is because dependencies are only acted on at configure time, which
> is a step further after the kconfig stage. This probably was not an
> issue before we switched to the kconfig infra for the kernel, but that
> use-case was completely missed at the time (blame me!).

Hum, I am not sure to see why the switch to the kconfig-package
infrastructure would have modified this behavior. So I'd like to
understand how it used to work, if it ever worked (but I believe it
did, no?).

> Fix that:
> 
>   - first, the dependency on extensions is moved to a dependency of the
>     patch step;

This is a bit problematic because then the dependency is unknown to the
package infrastructure. Which means that things like 'make
graph-depends' will no longer display this dependency.

To solve this, we would have to add a <pkg>_PATCH_DEPENDENCIES variable
in pkg-generic, or something like that.

But again, I'd like to understand why we didn't need that until now.

> 
>   - then, to avoid circular dependencies (e.g. linux->rtai->linux), do
>     not add extensions to LINUX_DEPENDENCIES, instead, add them to a
>     special variable, from which we derive both the list of dependencies
>     and the list of post-patch hooks.
> 
> This makes it slightly easier to write linux extensions: no need to
> delve in the .stamp_patched internals for each extension, just a
> function to (conditionally) define and a variable to assign.

I'm not sure to understand how the linux extensions had to delve into
the .stamp_patched internals. They were just registering a
POST_PATCH hook, no?

> (Note: this should go into a section of the manual...)

Yes, indeed, once we settle on a solution :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
