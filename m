From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Sep 2013 09:38:43 +0200
Subject: [Buildroot] [PATCH] Add pyside + shiboken packages
In-Reply-To: <523D3196.9090702@wanadoo.fr>
References: <523ACBFA.2070401@wanadoo.fr> <20130919173426.47c2bba8@skate>
 <523C5EFC.5040204@wanadoo.fr> <20130920175457.65a4d63c@skate>
 <523D3196.9090702@wanadoo.fr>
Message-ID: <20130921093843.7fe3ea0e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

(Thanks for resending the message to the list! As a further improvement
next time, it'd be great if you could avoid top-posting.)

On Sat, 21 Sep 2013 07:41:42 +0200, Thierry Bultel wrote:

> I will pay more attention to my patch formatting in the future,
> the lesson from that is that I cannot trust thunderbird for doing the
> things right.

I believe Thunderbird can be taught to do the right thing, but it's
quite certainly far more convenient to configure 'git send-email' once
for all, and enjoy scripted sending of patches. For example, since
you'll have to split this patch in at least 3 patches, you'd have to
manually send 3 e-mails with Thunderbird. git send-email would them all
of them automatically for you.

> My first approach was to use Cmake infrastructure indeed.
> The most annoying thing with shiboken and pyside CMakefiles is that
> it seems really a pain in the neck to have proper paths set,
> my fault here is to have not put enough comments around the
> various hacks I had to do to cope with it.

If they are CMake based packages, then they should use the
cmake-package infrastructure. Of course, if they have some tricky
aspects, we might need to adapt/improve the cmake-package
infrastructure if needed.

> I will start from scratch and try to possibly better fit in the model,
> and keep you in touch of what I see, if you don't mind.
> 
> About the BR2_PACKAGE_PYTHON_PY_PYC:
> 
> There are 2 issues when not having it
> 
> 1)
> host/usr/arm-buildroot-linux-gnueabi/sysroot/lib/python2.7/site-packages/PySide/__init__.py
> gets removed.
> I agree that setting the option for just one file if a shame but ...

Hum, I guess the problem is that the .py files installed by PySide
don't get compiled into the pyc bytecode? It'd be great to investigate
why, but as a temporary solution, we can disable the PySide package
when only .pyc files are kept (i.e do the opposite of what you did:
instead of preventing the .pyc only option to be enabled when pyside is
enabled, you prevent pyside from being enabled when the .pyc only
option is enabled. The reasoning is that the user certainly select
python before choosing the specific Python modules he wants to install).

> 2) The aim of pyside is to run python code (compiled or not, and that 
> may call libraries in pyc).
> So if the user python application is part of buildroot it would be
> removed from the target as well.

A Python application is usually made of two parts: one Python script
installed in /usr/bin, without any .py extension, so that it appears
like a normal executable. Regardless of the Python .py only / .pyc only
configuration, this file will be kept. The second part is a Python
module, which normally should get byte-compiled, and therefore
have corresponding .pyc files.

> About your comment on "HOST_PYSIDE_BUILD_CMDS or HOST_PYSIDE_CONFIGURE_CMDS"

When you make a comment, what about replying by quoting the relevant
part of the e-mail? :-) It would make things easier to follow. See
http://en.wikipedia.org/wiki/Posting_style#Bottom-posting.

> I think you made a confusion, and this is likely because my patch is too 
> big.
> The host variant is needed for pyside-tools, not for pyside.

Ah, yes, I referred to the wrong package. What I should have said is
that: package/pyside-tools/pyside-tools.mk contains a $(eval
$(host-generic-package)) to declare a host variant, but there is no
HOST_PYSIDE_TOOLS_BUILD_CMDS or HOST_PYSIDE_TOOLS_INSTALL_CMDS or
HOST_PYSIDE_TOOLS_CONFIGURE_CMDS, so essentially, the host-pyside-tools
package cannot work (if ever needed).

> As I said in my (too short) comment, the host variant is needed for
> shiboken, in order to get the generator that is used by the build.

The host variant of pyside-tools?

> After that, a target shiboken library is needed as well, that leads to
> building it twice ...
> 
> I think that the shiboken Cmake is not completely "cross-build" proof,
> and that is the main difficulty to deal with.
> The fact that it calls the target  'shiboken' binary for itself
> illustrates that.
> (but for that point it was "easy" to workaround with 
> SHIBOKEN_PRE_CONFIGURE_GENERATOR_PATH)

It happens for quite a few packages that the package needs a part of
itself to build the rest, which causes problems in cross-compilation
mode. In that kind of cases, we usually have two possible solutions:

 (*) If what is needed during the build is also needed in the final
     result on the target, then the best option is to build a host
     variant of the package, and tweak the build system to be able to
     point to this host variant while building the target variant (which
     is what you've done, and I think is fine).

 (*) If what is needed is just a tool used at build time, then
     sometimes we just build this tool manually prior to starting the
     build.

Best regards,
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
