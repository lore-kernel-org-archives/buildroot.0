From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Feb 2013 10:15:35 +0100
Subject: [Buildroot] crda and m2crypto
In-Reply-To: <5114BF4B.7080007@siganos.org>
References: <5114BF4B.7080007@siganos.org>
Message-ID: <20130208101535.0daeb46d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dimitrios Siganos,

On Fri, 08 Feb 2013 09:03:07 +0000, Dimitrios Siganos wrote:

> I am integrating crda with buildroot and I have run into a problem that
> I'd like some feedback on.
> 
> The crda makefile depends on python-m2crypto to translate a key to a C
> file representation.

Argh.

> However, when I run the crda makefile using
> TARGET_CONFIGURE_OPTS like this:
> 
> $(TARGET_CONFIGURE_OPTS) $(MAKE) all_noverify -C $(@D)
> 
> It fails.
> 
> It fails because TARGET_CONFIGURE_OPTS places the HOST_BIN directory in
> the PATH and the python installed there doesn't have the m2crypto
> library, which is needed during compilation.
> 
> I can workaround the problem by not using TARGET_CONFIGURE_OPTS and
> hence not using the python interpreter in HOST_DIR. Instead the
> workaround can use the python installed on the host computer where it is
> easy to install the m2python library (apt-get install pyhton-m2crypto).
> For example:
> 
> CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
> CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" \
> LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) all_noverify -C $(@D)
> 
> Is such a solution acceptable?
> 
> In general what is the buildroot approach to such problems? Should all
> the resources needed to build a package exist in the HOST_DIR?

Yes. Generally, we don't like to depend on specific things installed on
the build machine. The only thing that we expect to be installed are
checked by the support/dependencies/dependencies.sh script, and should
be only "global" stuff: wget, rsync, etc. We don't really like to add a
dependency on something like python-m2crypto that is used by only one
package.

Normally, we solve this problem by creating a Buildroot package for a
host variant of python-m2crypto, package that would depend on
host-python. This python-m2crypto package would install this Python
module in $(HOST_DIR), so that the host-python finds it. And finally
your crda package depends on it.

That's one approach.

The other approach that we sometimes look at is to see if the
dependency can be avoided in one way or another, or replaced by a
simpler dependency. Is this key -> C tool replaceable by something
else?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
