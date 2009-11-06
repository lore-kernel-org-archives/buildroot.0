From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2009 10:42:49 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<1257497536.1962.15.camel@bender>
	<op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
Message-ID: <20091106104249.55983beb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 6 Nov 2009 09:59:28 +0100,
Joachim Pihl <jpihl@nevion.com> a ?crit :

> Thanks for clearing that up! I found glib_genmarshal in /usr/bin, but
> I have absolutely no idea of why it has been included. There is no
> package I can find that mentions it. Also, this does not explain the
> duplicate libstdc++ libraries.

Ok, here is the full list of packages you selected:

BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
BR2_PACKAGE_BUSYBOX=y
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="busybox.config"
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_GETTEXT_STATIC=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_PKG_CONFIG=y
BR2_PACKAGE_READLINE=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONFIG_THREADING=y
BR2_PACKAGE_BOOST_DATE_TIME=y
BR2_PACKAGE_BOOST_THREAD=y
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_LIBNW=y
BR2_PACKAGE_LIBSNMPPDU=y
BR2_PACKAGE_SPREAD=y
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_NETSNMP=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_THTTPD=y
BR2_PACKAGE_VSFTPD=y
BR2_PACKAGE_MTD=y
 [ Lots of MTD stuff ]
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_LIBGD=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_LZO=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_LIBXML2=y

I think you don't need pkg-config on the target, so disable
BR2_PACKAGE_PKG_CONFIG. This should allow you to disable libglib2
(BR2_PACKAGE_LIBGLIB2), which in turn will allow you to disable gettext
(BR2_PACKAGE_GETTEXT), libintl (BR2_PACKAGE_LIBINTL), libiconv
(BR2_PACKAGE_LIBICONV).

Of course, this makes the assumption that your own internal
applications do not use libglib2.

Then, for the Boost packages, then don't exist in Buildroot, so we
can't say what dependencies they pull. Could you submit a patch to add
the Boost libraries into Buildroot ?

Finally, for the duplicated C++ library thing, could you put online
your rootfs.tar (after removing your internal applications if they are
sensitive) ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
