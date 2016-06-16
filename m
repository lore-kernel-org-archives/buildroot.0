From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:37:10 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
Message-ID: <20160616153710.12ef9233@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 15:12:06 +0200 (CEST), Eric Le Bihan wrote:

> Since commit 9c40723, handling of ldconfig in the main Makefile as been dropped,
> and if /etc/ld.so.conf is found in the target root filesystem, the build fails.
> 
> Not being able to run ldconfig and generate the ld.so cache has two drawbacks:
> 
>  - it prevents the user from installing some libraries in other locations than
>    /lib and /usr/lib (e.g. /opt/foo/lib). This can be solved with symlinks,
>    though.

Does the dynamic linker uses /etc/ld.so.conf at runtime to find other
libraries, even if there is no /etc/ld.so.cache? If that's the case,
then our check for ld.so.conf being absent is somewhat wrong, as it
would be valid to have, independently of whether ldconfig has created
ld.so.cache or not.

>  - when running a program, ld.so has to explore all the library paths to find
>    the correct location of the required libraries. This results in zillions of
>    failed calls to open(), i.e. wasted time.

Right.

> So, it would be better to add an entry in the system configuration menu so that
> the user can explicitly disable the sanity check introduced by 9c40723. Hence
> he/she will be able to run the cross-compiled version of ldconfig (found in
> ${STAGING_DIR}/sbin/ldconfig) via the version of QEMU matching the target.
> 
> Attached are:
> 
>  - a patch to add the aforementioned configuration entry, named
>    BR2_TARGET_LDCONFIG.
>  - an example of post-build script to run ldconfig via QEMU.
> 
> However, instead of using a post-build script, the operations could be performed
> in a Buildroot Makefile. Which one should be updated? The main Makefile or the
> Makefile of the skeleton package? In any cases, a dependency to host-qemu will
> be introduced.

With the proposal from Yann to have different skeletons for systemd and
traditional init, I am not sure having this logic in the skeleton
package is the most appropriate. Indeed, this logic is useful
regardless of the init system being used.

However, in order to merge something like this, I'd like to have a
solution that covers glibc, uClibc and musl, or at least takes those
different cases into account by making it available only for the C
libraries that support it (but that mean investigating how uClibc and
musl support ld.so.conf/ld.so.cache).

Another thing that bothers me is why it is not possible to have a
cross-compilation aware ldconfig. This would really be much, much nicer
than running ldconfig under qemu.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
