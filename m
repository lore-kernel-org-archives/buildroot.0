From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 14 May 2014 15:00:14 +0200
Subject: [Buildroot] [PATCH 1/1] google-breakpad: added package to
	buildroot
In-Reply-To: <1400070034.11832.15.camel@mbpro.localhost>
References: <1399631550-4058-1-git-send-email-pascal.huerst@gmail.com>
 <CAGduivwKX-9r5HOm9X5Y_fkU+_YEf4rE43O=GG3HYi5m_2RxzQ@mail.gmail.com>
 <1400070034.11832.15.camel@mbpro.localhost>
Message-ID: <CAGduivzxRypGOypWRyvN8b1r9VCCDXaWrzwVU8qb3D-OZVawLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pascal, all

[...]
>> > diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
>> > new file mode 100644
>> > index 0000000..fc68e6a
>> > --- /dev/null
>> > +++ b/package/google-breakpad/Config.in
>> > @@ -0,0 +1,12 @@
>> > +config BR2_PACKAGE_GOOGLE_BREAKPAD
>> > +       bool "google-breakpad"
>> > +       depends on BR2_INSTALL_LIBSTDCPP
>> > +       depends on BR2_TOOLCHAIN_USES_GLIBC
>> > +       help
>> > +         An open-source multi-platform crash reporting system
>> > +
>> > +         http://code.google.com/p/google-breakpad/
>> > +
>> > +comment "google-breakpad requires an (e)glibc toolchain with C++"
>> > +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC)
I missed on my first review, but maybe breakpad should depends on
BR2_ENABLE_DEBUG, if the package are built without debug symbols, it
doesn't make a lot of sense to create symbols from them ?

>> > +
>> > diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
>> > new file mode 100644
>> > index 0000000..a1c4224
>> > --- /dev/null
>> > +++ b/package/google-breakpad/google-breakpad.mk
>> > @@ -0,0 +1,21 @@
>> > +#############################################################
>> > +#
>> > +# google-breakpad
>> > +#
>> > +#############################################################
>> > +GOOGLE_BREAKPAD_VERSION = 1320
>> > +GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
>> > +GOOGLE_BREAKPAD_SITE_METHOD = svn
>> > +GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
>> > +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
>> > +HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-python
>> > +GOOGLE_BREAKPAD_INSTALL_STAGING = YES
>> You need to specify a LICENSE and the LICENSE_FILES, have a look at
>> http://buildroot.org/downloads/manual/manual.html#generic-package-reference
>> for more information about theses variables.
>> > +
>> > +define HOST_GOOGLE_INSTALL_MOZILLA_SYMBOLSTORE
>> > +       wget -O $(HOST_DIR)/usr/bin/symbolstore.py "http://mxr.mozilla.org/mozilla-central/source/toolkit/crashreporter/tools/symbolstore.py?raw=1" && chmod +x $(HOST_DIR)/usr/bin/symbolstore.py
>> > +endef
>> Here you are downloading a specific python scripts for a URL, why ? It
>> is not included in the main sources ? Could it be a patch that goes
>> along the package instead of downloading this like that ?
>
> It is *not* included in the main sources. It could be a patch, but if
> the folks at mozilla fix something in the script, we would have to
> provide a new patch, right? What the script does is explained here:
> http://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide#Producing_symbols_for_your_application
> I think this could be done within the makefile itself (not using the
> script at all), but I was not able to do it. What do you think?

Yes, it can't be a patch, it was a bad idea.
I am looking at it, and from what I see the Mozilla folks did this
mostly to have a portable tool, which we don't need here since we only
care about Linux.

Really roughly, you would need to do something like:

mkdir -p $(TMP_PATH)
for bin in $(shell $(BREAKPAD_SEARCH_CMD));
do
$(HOST_DIR)/usr/bin/dump_syms $(bin) > $(TMP_PATH)/$(bin)
bin_id=$(shell head -n1 $(TMP_PATH)/$(bin))
mkdir -p $(BINARIES_DIR)/google_breakpad_symbols/$(bin_id)
mv $(bin) $(BINARIES_DIR)/google_breakpad_symbols/$(bin_id)
done

Note that I haven't tested this code, I don't even know if it's up to
Buildroot standards, I'm not a really good Makefile hacker :).
I am pretty sure you could also do that with find and xargs, I don't
know what would be preferred, I find a loop to be more readable here.

That should give you an idea though and should be able to replace the
python scripts.
