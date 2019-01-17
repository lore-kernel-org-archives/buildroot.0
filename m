From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 20:01:21 +0100
Subject: [Buildroot] [PATCH v2 6/7] tpm2-tools: do not enforce
 dependency on tpm2-abrmd
In-Reply-To: <20190117155827.GD2556@scaer> (Yann E. MORIN's message of "Thu,
 17 Jan 2019 16:58:27 +0100")
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-6-peter@korsgaard.com>
 <20190115204308.GB2556@scaer> <875zuog74i.fsf@dell.be.48ers.dk>
 <20190117155827.GD2556@scaer>
Message-ID: <874la785xa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> ** (process:8628): WARNING **: 11:38:39.606: Failed to create
 >> connection with service:
 >> GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name
 >> com.intel.tss2.Tabrmd was not provided by any .service files
 >> ERROR: Failed to initialize TABRMD TCTI context: 0xa0008
 >> 
 >> The solution is to set the TCTI name to device, either through the
 >> TPM2TOOLS_TCTI_NAME environment variable or the --tcti option.

 > Well, this is very clearly explained in the man page for tpm2_pcrlist. ;-)

Correct, but it is still not obvious.


 > And it turns out that the use of tpm2-abrmd is in fact totally unneeded,
 > even to get proper concurrent access, when using the in-kernel manager
 > exposed as /dev/tmprmN (so says the man page). So, in this case, a
 > userland daemon is not even needed to begin with.

Correct, but the in-kernel manager is relatively new (4.12). There is
various tradeoffs between the in-kernel and user space managers. There
was a presentation about it at Plumbers 2017:

https://blog.linuxplumbersconf.org/2017/ocw//system/presentations/4818/original/TPM2-kernel-evnet-app_tricca-sakkinen.pdf


 > But since any person not completely insane would still want it, then it
 > should stay a select. The very minor minority who really, like
 > really-really, do not want tpm2-abrmd can still remove it with a
 > post-build script.

Sorry, why do you think I am insane for not wanting tpm2-abrmd?

Cleaning up with a post-build script is pretty horrible, especially as
tpm2-abrmd pulls in dbus.


 >> This is imho exactly the kind of use cases imply has been made for.

 > I still think its semantics are much more fuzzy than select or depends-on,
 > and it can cause confusion.

Yes, that is the entire point, E.G. a "weak" select. It behaves the same
as 'default y if foo'.

 >> Is that any different than changing toolchain options or toggling
 >> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

 > Sorry, I don't follow you. When you toggle those options, they always do
 > the same thing.

 > But with imply, if you do something like:

 >     make distclean
 >     make menuconfig
 > --> enable tpm2-tools

 > Then tpm2-abrmd is enabled.

 > But if you now go with:

 >     make distclean
 >     make defconfig
 >     make menuconfig
 > --> enable tpm2-tools

 > Then tpm2-abrmd is not enabled, because it was already disabled in the
 > .config.

 > So, this is more confusing than anything else to me, because "sometimes
 > it works, sometimes it does not".

 > Whereas, the toolchain options or the busybox-show-others will always do
 > the same thing.

The point is that they influence other "unrelated" options. Another
example is the places where we have multiple backends where we do
'select foo if !bar'. Here as well behaviour when you then go an enable
bar depends on if you have already exited menuconfig or not (E.G. foo
will stay enabled or not).


 >> Sure, but we can atleast ensure that the tpm2-tools utilites do not fail
 >> out of the box because of a missing obscure dependency and that fairly
 >> common use cases are possible.

 > If you go that route, then you must ensure that the kernel has TPM
 > support configured in. That is, for the kernel we build; we're leaving
 > out in the cold those who build their kernel out of Buildroot...

And that we indeed do when it is possible / the needed kernel options
aren't obvious.

In this case the kernel has several different tpm drivers, so we cannot
really do it.

-- 
Bye, Peter Korsgaard
