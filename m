From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 07 Jul 2008 15:14:06 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707124143.GB15840@mx.loc>
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc>
Message-ID: <4872169E.2010102@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernhard Fischer skrev:
> On Sun, Jul 06, 2008 at 12:34:41AM -0700, ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2008-07-06 00:34:41 -0700 (Sun, 06 Jul 2008)
>> New Revision: 22663
>>
>> Log:
>> Replace configuring GLIB with autodetect
>>
>> Modified:
>>   trunk/buildroot/Config.in
>>   trunk/buildroot/Makefile
>>
>>
>> Changeset:
>> Modified: trunk/buildroot/Config.in
>> ===================================================================
>> --- trunk/buildroot/Config.in	2008-07-06 07:00:11 UTC (rev 22662)
>> +++ trunk/buildroot/Config.in	2008-07-06 07:34:41 UTC (rev 22663)
>> @@ -78,17 +78,6 @@
>>
>> 	  The default is $(BASE_DIR)/dl
>>
>> -config BR2_HOST_GLIB
>> -	string "Location of host Gnome library"
>> -	default "/usr"
>> -	help
>> -	  Directory where Gnome is installed on the host
>> -	  Gnome applications is installed in $(BR2_HOST_LIB)/bin 
>> -	  This is needed to build libgtk etc.
>> -	  The default is /usr
>> -	  It can be overridden by the BUILDROOT_HOST_GLIB
>> -	  shell variable
>> -
>> source	"target/device/Config.in.mirrors"
>>
>> config BR2_STAGING_DIR
>>
>> Modified: trunk/buildroot/Makefile
>> ===================================================================
>> --- trunk/buildroot/Makefile	2008-07-06 07:00:11 UTC (rev 22662)
>> +++ trunk/buildroot/Makefile	2008-07-06 07:34:41 UTC (rev 22663)
>> @@ -57,12 +57,6 @@
>> endif
>> LOCAL:=$(BR2_LOCAL)
>>
>> -ifneq ($(BUILDROOT_HOST_GLIB),)
>> -HOST_GLIB:=$(BUILDROOT_HOST_GLIB)
>> -else
>> -HOST_GLIB:=$(BR2_HOST_GLIB)
>> -endif
>> -
>> # To put more focus on warnings, be less verbose as default
>> # Use 'make V=1' to see the full commands
>> ifdef V
>> @@ -128,6 +122,10 @@
>> HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
>> HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
>> HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
>> +HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
>> +HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)
> 
> I don't see why
> 1) "/usr" is a valid fallback here?
     Gnome is installed in /usr and the Gnome binaries
     will then be looked for in /usr/bin

> 2) this stuff is needed in the first place.
> 

The configure statements of many packages seems to
hardwire the location of glib-genmarshal (and
other gnome packages) to /usr/bin

> If glib-genmarshal is not in your PATH then it is perfectly fine to
> fail.

/opt/gnome/bin/glib-genmarshal *is* in my path.
/usr/bin/glib-genmarshal is NOT in my path.


> If it is in your PATH (which it should be, iff you have it
> installed), the it should be found by configure.
> 

Yes, but it is not found which I think is a bug.

Gnome seems to use

GLIB_GENMARSHAL= $PKGCONFIG --variable glib-genmarshal glib-2.0

to detect where glib-genmarshal is.

pkg-config is using the *target* installation of gnome which
is located in /usr with glib-genmarshal in /usr/bin/
PKGCONFIG reads from $(PKG_CONFIG_PATH)/glib-2.0.pc

Even if you explicitly set
GLIB_GENMARSHAL=/opt/gnome/bin/glib-genmarshal
in the configure to libgtk2, this is ignored.

If you change $(PKG_CONFIG_PATH)/glib-2.0.pc to
supply /opt/gnome/bin/glib-genmarshal then the build will fail.


> Put short, this change should be dropped in my POV.

It is not working to my satsifaction, so I currently
provide softlinks to /usr/bin.
What do we then do with the <packages>.mk that supply
an absolute path to glib-genmarshal etc.?

Another question is if we should install Gnome in /opt/gnome
instead of in /usr/bin?
I think that will solve my problem.

Do people see gnome normally beeing installed in /usr/bin.

BR
Ulf Samuelsson

> 
>> +
>> +
>> ifndef CFLAGS_FOR_BUILD
>> CFLAGS_FOR_BUILD:=-g -O2
>> endif
>> @@ -522,3 +520,4 @@
>> 	@echo LOCAL=$(LOCAL)
>> 	@echo BR2_DL_DIR=$(BR2_DL_DIR)
>> 	@echo HOST_GLIB=$(HOST_GLIB)
>> +	@echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)
> 
> As already said, you're leaking your local debug stuff into the tree,
> please don't do that.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIchaeAyRRH5cXxqwRAjMvAJ0YQnUz3j+hbVYT/dERY+f76NkyVwCcCtS/
KBeK7o0ujVGeb7kLj3wnk6U=
=ZlXK
-----END PGP SIGNATURE-----
