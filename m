From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 07 Jul 2008 15:35:12 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707132334.GD15840@mx.loc>
References: <20080706073442.174E03C67A@busybox.net>	<20080707124143.GB15840@mx.loc>
	<4872169E.2010102@atmel.com> <20080707132334.GD15840@mx.loc>
Message-ID: <48721B90.5070905@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernhard Fischer skrev:
> On Mon, Jul 07, 2008 at 03:14:06PM +0200, Ulf Samuelsson wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Bernhard Fischer skrev:
>>> On Sun, Jul 06, 2008 at 12:34:41AM -0700, ulf at uclibc.org wrote:
>>>> Author: ulf
>>>> Date: 2008-07-06 00:34:41 -0700 (Sun, 06 Jul 2008)
>>>> New Revision: 22663
>>>>
>>>> Log:
>>>> Replace configuring GLIB with autodetect
>>>>
>>>> Modified:
>>>>   trunk/buildroot/Config.in
>>>>   trunk/buildroot/Makefile
>>>>
>>>>
>>>> Changeset:
>>>> Modified: trunk/buildroot/Config.in
>>>> ===================================================================
>>>> --- trunk/buildroot/Config.in	2008-07-06 07:00:11 UTC (rev 22662)
>>>> +++ trunk/buildroot/Config.in	2008-07-06 07:34:41 UTC (rev 22663)
>>>> @@ -78,17 +78,6 @@
>>>>
>>>> 	  The default is $(BASE_DIR)/dl
>>>>
>>>> -config BR2_HOST_GLIB
>>>> -	string "Location of host Gnome library"
>>>> -	default "/usr"
>>>> -	help
>>>> -	  Directory where Gnome is installed on the host
>>>> -	  Gnome applications is installed in $(BR2_HOST_LIB)/bin 
>>>> -	  This is needed to build libgtk etc.
>>>> -	  The default is /usr
>>>> -	  It can be overridden by the BUILDROOT_HOST_GLIB
>>>> -	  shell variable
>>>> -
>>>> source	"target/device/Config.in.mirrors"
>>>>
>>>> config BR2_STAGING_DIR
>>>>
>>>> Modified: trunk/buildroot/Makefile
>>>> ===================================================================
>>>> --- trunk/buildroot/Makefile	2008-07-06 07:00:11 UTC (rev 22662)
>>>> +++ trunk/buildroot/Makefile	2008-07-06 07:34:41 UTC (rev 22663)
>>>> @@ -57,12 +57,6 @@
>>>> endif
>>>> LOCAL:=$(BR2_LOCAL)
>>>>
>>>> -ifneq ($(BUILDROOT_HOST_GLIB),)
>>>> -HOST_GLIB:=$(BUILDROOT_HOST_GLIB)
>>>> -else
>>>> -HOST_GLIB:=$(BR2_HOST_GLIB)
>>>> -endif
>>>> -
>>>> # To put more focus on warnings, be less verbose as default
>>>> # Use 'make V=1' to see the full commands
>>>> ifdef V
>>>> @@ -128,6 +122,10 @@
>>>> HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
>>>> HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
>>>> HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
>>>> +HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
>>>> +HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)
>>> I don't see why
>>> 1) "/usr" is a valid fallback here?
>>     Gnome is installed in /usr and the Gnome binaries
>>     will then be looked for in /usr/bin
>>
>>> 2) this stuff is needed in the first place.
>>>
>> The configure statements of many packages seems to
>> hardwire the location of glib-genmarshal (and
>> other gnome packages) to /usr/bin
>>
>>> If glib-genmarshal is not in your PATH then it is perfectly fine to
>>> fail.
>> /opt/gnome/bin/glib-genmarshal *is* in my path.
>> /usr/bin/glib-genmarshal is NOT in my path.
>>
>>
>>> If it is in your PATH (which it should be, iff you have it
>>> installed), the it should be found by configure.
>>>
>> Yes, but it is not found which I think is a bug.
> 
> Agree, but a bug in pkgconfig resp. the configury of the respective
> packages.


I think PKGCONFIG does what it is told to do, but
the "configure" of Gnome should not separate
things that needs to run on the host from things
that runs on the target.

I can remove the HOST_GLIB and fix some of the other stuff
you guys have been complaining about, since most
(except logging) is not so important to me.
Logging, I think I would like to keep.
(But Autotools needs fixing)

Still, some targets are hardwiring glib-genmarshal
so we need to decide what to do here.

I see three alternatives:
* We remove the configure switches referring to
  "/usr/bin/glib-genmarshal" - now "$(HOST_GLIB)/bin/glib-genmarshal"?
  (They seems not to be used)
* We set them back to /usr/bin/<app> which I think is broken?
* We keep $(HOST_GLIB) and the "$(HOST_GLIB)/bin/glib-genmarshal


[snip]

>> Another question is if we should install Gnome in /opt/gnome
>> instead of in /usr/bin?
>> I think that will solve my problem.
>>
>> Do people see gnome normally beeing installed in /usr/bin.
> 
> Unfortunately this is distro-dependant.


Maybe it should be possible then in buildroot to
select where target Gnome is installed?




> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIchuQAyRRH5cXxqwRAkoDAJ4709IycAWZd7vSHD4pyk6utKYy1gCfQUlh
hwLlNxPnyDjhdjCuOD6230I=
=Sy6u
-----END PGP SIGNATURE-----
