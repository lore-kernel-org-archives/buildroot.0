From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 11:59:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080708071224.GA23887@cloud.net.au>
References: <20080706073442.174E03C67A@busybox.net>	<20080707124143.GB15840@mx.loc>
	<4872169E.2010102@atmel.com>	<20080707132334.GD15840@mx.loc>
	<48721B90.5070905@atmel.com>	<87mykt4v47.fsf@macbook.be.48ers.dk>	<AAFCB58EA8634B0CADEDE37957685CEC@aeglos>	<877ibxzfh4.fsf@macbook.be.48ers.dk>
	<48729A8C.4070303@atmel.com>	<87prppue6v.fsf@macbook.be.48ers.dk>
	<20080708071224.GA23887@cloud.net.au>
Message-ID: <48733A9D.8090302@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hamish Moffatt skrev:
> On Tue, Jul 08, 2008 at 07:39:52AM +0200, Peter Korsgaard wrote:
>>  Ulf> Did not check.
>>
>> I think they only support distributions with gnome in /usr.
> 
> Why do we need to determine the full path anyway rather than using
> $(PATH)? Or always build our own glib-genmarshal rather than trying to
> determine if there's a host one available, or just require that a host
> one is installed in the path.
> 
> Hamish

The gnome configuration does not use $(PATH) to determine
where glib-genmarshal is located.
It also ignores totally the GLIB_GENMARSHAL environment variable.

It queries "$(PKG_CONFIG_PATH)/glib-2.0.pc" using pkg-config
PKG_CONFIG_PATH is set to $(STAGING_DIR)/usr/lib/pkgconfig
The query returns the path to target glib-genmarhal = /usr/lib.

If you set PKG_CONFIG_PATH to "/usr/lib/pkgconfig", then
the build of libgtk2 will fail.

Building your own glib-genmarshal will not do you any good,
unless you can install it in /usr/bin which requires super-user privileges.

I managed to successfully build libgtk2 for the ARM architecture
right now, by symlinking some gnome applications to /usr/bin
and a patch to libgtk2-2.12.6'configure.

I saved all symlink definitions in a script, which I am
considering checking in.

The configure script will not recognize arm-unknown-linux-gnu
as a host, and "sys_lib_search_path_spec" seems to be hardwired
to "/usr/lib /lib /usr/local/lib" so the ARM applications
are linked with host libraries.

Will add this patch right now.

BR
Ulf Samuelsson
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIczqdAyRRH5cXxqwRAknTAJ91z6Mc3orgO2LTnQsu3xu76q5hQgCfXqd6
UyGgxdzHmux9fHB+qEecrrA=
=vZTY
-----END PGP SIGNATURE-----
