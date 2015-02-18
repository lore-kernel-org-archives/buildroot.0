From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Feb 2015 17:01:44 +0100
Subject: [Buildroot] How to avoid rebuilding host-cmake
In-Reply-To: <54E4AFB4.1000705@utexas.edu>
References: <BC1FDBEC-8B34-41CB-8335-9FC413467FAC@utexas.edu>
 <CAMQcK5+EMynEMspbf6N8VAbHeJksnZg4fP5NSqRDz2smdTK4yA@mail.gmail.com>
 <54E4AFB4.1000705@utexas.edu>
Message-ID: <20150218170144.1ae8a5b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Kessler,

On Wed, 18 Feb 2015 09:28:52 -0600, David Kessler wrote:

> Thanks for the reply. Before posting, I looked over the documentation 
> that discusses when a full rebuild is required.  Your assumption is 
> mostly correct, I have been doing some light kernel development. And I 
> have been utilizing buildroot's <pkg>_OVERRIDE_SRCDIR option. However, I 
> have also been experimenting with many different configuration options, 
> options provided by buildroot and by the linux kernel.  According to the 
> buildroot documentation, a full rebuild is required when removing a 
> package,

It is only necessary when you want the package removal to take effect
immediately. Generally, what I end up doing for such things is that I
do the configuration changes, and then only restart a full build to
make things everything is OK when leaving in the evening, or during
lunch time.

Basically, try to avoid the situation where you do one change in the
config, one full rebuild. Try to batch the configuration changes. You
rarely need to remove a package immediately.

> and I haven't had much success with adding packages without 
> doing a full rebuild.

This however works just fine, as long of course as this package is not
used as an optional dependency of other packages that you have
selected. For example, if you build "bind" initially with the OpenSSL
package disabled, bind will have OpenSSL support disabled. Then if you
enable OpenSSL in the configuration and do just "make", it will build
OpenSSL, but will not automatically rebuild "bind" to make it gain
OpenSSL support. This will only happen either if you do a full rebuild,
or if you rebuild bind explicitly ("make bind-dirclean bind").

> So, I ask about rebuilding host-cmake because it takes quite a long 
> time, and it doesn't seem like it needs to be rebuilt when I'm merely 
> adding or removing a package.  I suppose that is a bit of an assumption 
> on my part.... maybe host-cmake does indeed need to be rebuilt, 
> depending on the package I've added or removed?

Rebuilding host-cmake is indeed not needed, the way it is built doesn't
change depending on packages you've added or removed. However, as Ryan
explained, Buildroot has no concept of keeping a cache of previous
build results in order to re-use them for later builds. Doing so is
very complicated, as we need to be able to capture the entire
configuration with which a certain package has been built, in order to
find out whether a cached pre-built version still matches the current
configuration. This is quite complicated to do in a reliable manner,
and Buildroot simplicity principle tells us to not do so.

Regarding host-cmake specifically, you may be interested in testing
http://patchwork.ozlabs.org/patch/432613/, which reduces the host-cmake
build time by 25%.

Unfortunately, ccache does not speed up the build of host-cmake today,
because the host-cmake build system does not support a compiler with
spaces in it such as "output/host/usr/bin/ccache /usr/bin/gcc".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
