From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
Date: Thu, 09 Oct 2014 01:01:25 +0200
Subject: [Buildroot] [PATCH 1/1] openocd bump to 0.8.0
In-Reply-To: <20141008231040.57406af4@free-electrons.com>
References: <1412801633-3394-1-git-send-email-claudio.laurita@integrazionetotale.it>
 <20141008231040.57406af4@free-electrons.com>
Message-ID: <5435C245.1090100@integrazionetotale.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is my first tentative of "real" collaboration, so thank you for the 
patience.

 > The patch is doing a lot more than just bumping the version, so it 
would be good to have some details about the changes that are made.

Ok, I thought it was not a lot ;-)
>> diff --git a/package/openocd/001-fix-gcc-warning-in-mini51.patch b/package/openocd/001-fix-gcc-warning-in-mini51.patch
>> new file mode 100644!
>> index 0000000..514d166
>> --- /dev/null
>> +++ b/package/openocd/001-fix-gcc-warning-in-mini51.patch
> Patches should have a description + Signed-off-by. See
> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.
Ok. I thought it was inherited from the main patch. Silly thought.
>> -HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
>> +HOST_OPENOCD_CONF_OPTS = $(OPENOCD_CONF_OPTS)
> Target options should normally not affect the build of host tools:
> remember that someone can enable the host OpenOCD without building the
> target OpenOCD.
You're perfectly right, obviously. I made an hard shortcut ;-)
I tried to find a way to avoid duplicating the logic of selecting 
options and finding related real dependencies. In current version it's 
not allowed any choice for the host and I think it's a limit. 
Duplicating everything is a bit redundant, but my idea was terribly 
based on my actual needs. I apologize.
>> +# force disabling shared libraries to let jimtcl build its static version
>> +SHARED_STATIC_LIBS_OPTS=
> This is clearly not a solution: the namespace of variables in Buildroot
> is global, so you are not allowed to modify such a global variable. You
> can always force --enable-static --disable-shared in OPENOCD_CONF_OPTS
> if needed.
>
This is a problem.
If I understand, changing this variable would affect every successive 
step of the global build. Is this the point? Not bad, as a mistake. I 
should have studied better the main makefile. Sorry.
Anyway, SHARED_STATIC_LIBS_OPT is added by default to the configure 
parameters. If your default is having shared preferred, It ends up in a 
first assignment to --enable-shared (the global) and a second one to 
--disable-shared (the local). Unfortunately, jimtcl ignores the second 
one and keeps building only the shared lib, making openocd build fail. 
The current BR implementation applies a patch to auto.def of jimtcl to 
force it ignore -enable-shared. I don't like much this approach and 
tried to find an alternative to avoid the patch. So, the only way is 
redefining OPENOCD_CONFIGURE_CMDS entirely?

Thank you very much for your attention.
Claudio
