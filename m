From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jun 2010 21:29:04 +0200
Subject: [Buildroot] libxml2 / gzopen64
In-Reply-To: <1275407041.2737.13.camel@HellDesk.zuhause.net>
References: <1275407041.2737.13.camel@HellDesk.zuhause.net>
Message-ID: <20100601212904.0f0ff917@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 01 Jun 2010 17:44:01 +0200
Holger <ltsp@webers-web.net> wrote:

> error: /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2:
> undefined symbol: gzopen64

Ok, thanks to the build log you sent to me (BTW, why didn't you send
the link to the list, so that others could have a look too), I could
understand a few things.

The thing is that host-libxml2 detects that zlib is available on your
host, even if we haven't built host-zlib yet. This is because zlib is
installed on your development system.

Something must be odd with the zlib library that you have installed on
your system. Which distribution/version are you using ? Which version
of zlib ? By any chance, don't you have two copies of zlib, one
in /usr/lib, one in /usr/local/lib ?

Anyway, Buildroot is supposed to be independent from the host system,
so it should rely on the host zlib to work. As I think we don't need
zlib support in the host libxml2 that we build, something like the
following patch should fix the problem. Can you test and report ?

Thanks!

Thomas

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 3a3e007..11b946e 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -26,7 +26,7 @@ HOST_LIBXML2_DEPENDENCIES = host-pkg-config
 
 HOST_LIBXML2_CONF_OPT = \
                --enable-shared --without-debugging --without-python \
-               --without-threads
+               --without-threads --without-zlib
 
 $(eval $(call AUTOTARGETS,package,libxml2))
 $(eval $(call AUTOTARGETS,package,libxml2,host))


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
nt-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: buildroot-bounces at uclibc.org
Errors-To: buildroot-bounces at uclibc.org

On Wed, Oct 08, 2008 at 02:52:20PM +0200, Daniel Nystr=F6m wrote:
> (Sorry if this has been a topic earlier, but it's really hard to search
> the mailing archive)
> =

> Is it possible in Buildroot to make both a read-only rootfs and a second
> writable filesystem?
> =

> A common setup is using cramfs for / and mounting a jffs2 on /mnt/flash,
> and then make a symlink of /etc to point at /mnt/flash/etc where all
> config files are writable.
> =

> Is this possible to achive with Buildroot?

No, there's no support for building two file systems with different
contents.

There might be better ways to handle this anyway, like copying /etc from
the cramfs to the rw jffs2 on the first bootup?

With regard to mounting /mnt/flash/etc onto /etc, I don't think a
symlink will work - you need to use/run stuff from /etc before the
second file system can be mounted. I suggest a minimal /etc in the root,
enough to get the other file system mounted, and then "mount --bind" the =

new /etc over the top.


Hamish
-- =

Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
