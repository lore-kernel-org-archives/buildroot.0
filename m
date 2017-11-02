From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 2 Nov 2017 18:27:16 +0100
Subject: [Buildroot] [PATCH] autoconf: use host-gettext's autopoint if
 available in autoreconf
In-Reply-To: <e3d4f8af-e660-ff80-7157-5b897b8e47c4@mind.be>
References: <20170827110920.15579-1-aleksander@aleksander.es>
 <e3d4f8af-e660-ff80-7157-5b897b8e47c4@mind.be>
Message-ID: <CAAP7ucJmmHCD+ceC7_w+zR8-Pdy3UexKMBhoC4bYQTvZwKBm3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> On 27-08-17 13:09, Aleksander Morgado wrote:
>> Commit 7ee8ebbd813ad0a6d2392ef628c17241 explicitly disabled autopoint
>> calls during autoreconf, to avoid having the host autopoint called, as
>> there was no host-gettext package.
>>
>> Commit 3a188b578e490f2a8b5922329b7abfae introduced the host-gettext
>> package support.
>>
>> This commit recovers the support for automatically calling autopoint
>> during autoreconf.
>>
>> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
>> ---
>>
>> Hey,
>>
>> I see this is a recurring issue when a package that builds from git (bootstrapping using autoreconf before configure) requires gettext processing. automake would fail as autopoint wasn't being run (disabled in buildroot's autoconf package) and therefore not creating config.rpath and ABOUT-NLS (among other things, although these are the ones automake complains about). Specifying $(PKG)_GETTEXTIZE isn't an option as that may actually update the gnulib-imported files in a non-expected way, and "touch"-ing the missing files just seems a bit of a hack...
>>
>> Calling autopoint from autoreconf was disabled back in 2011 because no host-gettext package was available, but this package was added in 2013, so how about removing that limitation?
>
>  We tried to understand what was going on (at the BR developer meeting) but we
> failed :-(. Based on this patch and on the discussion in [1] and [2]
> (unfortunately pipermail splits threads when they straddle a month), we
> concluded that:
> - the current patch doesn't work (at least not for gst1-plugins-bad)
> - if running autopoint is in fact the right thing to do, then probably it is
> better to replace <PKG>_GETTEXTIZE with <PKG>_AUTOPOINT.
>

Or, at least initially, have both available?. My custom ModemManager
builds from git master only succeed when autopoint is run by
autoreconf; gettextize actually broke the build.

>  Indeed, as we understand from your mails and from the autopoint info page:
> - autopoint installs the autoconf/automake support files for translations;
> - gettextize prepares a package for translation by extracting the strings from
> the source code, and additionally does the same as autopoint.
>

That is my understanding as well, yes.

>  If that is true, calling gettextize from Buildroot can never be correct,
> because the extracted strings would anyway still have to be translated before
> they're any use. And with autopoint there shouldn't be an issue of gettexttize
> versions because it will look for the required version declared in configure.ac.
> That makes us think that perhaps we should run autopoint instead of gettextize
> in the places where we currently run gettextize.
>

Yes, I believe that most packages that have translations would you be
fine with autopoint and not gettexttize. From my understanding from a
recent issue, gettextize may still be needed if the gettext version
used by the maintainer of the package differs a lot from the gettext
version in use by buildroot. But that has the side effect of having
gettext touching "too much" as in my use case with ModemManager.

>  What we certainly don't want is that whether autopoint gets run depends on
> whether host-gettext was previously built or not. We want builds to be
> reproducible so we want to avoid building something subtly different just
> because of the presence of some package which has no explicit dependency in the
> .mk file.
>
>  What we also would like to avoid is that host-gettextize becomes a dependency
> of every package that needs AUTORECONF = YES. So always running autopoint is not
> so interesting.
>

Fair enough, yes.

>
>>
>> Cheers!
>>
>> ---
>>  package/autoconf/autoconf.mk | 2 +-
>>  package/gettext/gettext.mk   | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
>> index e5f474c72..f1c60224f 100644
>> --- a/package/autoconf/autoconf.mk
>> +++ b/package/autoconf/autoconf.mk
>> @@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
>>  # variables used by other packages
>>  AUTOCONF = $(HOST_DIR)/bin/autoconf
>>  AUTOHEADER = $(HOST_DIR)/bin/autoheader
>> -AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
>> +AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT="$(AUTOPOINT)" $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)" --verbose
>
>  If you're going to change this long line, please split it first (in a separate
> patch) so we can actually see what changed.
>

Aha, ok.

>> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
>> index ec9588f8a..08afc8fc3 100644
>> --- a/package/gettext/gettext.mk
>> +++ b/package/gettext/gettext.mk
>> @@ -95,6 +95,7 @@ endef
>>  HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_ADD_ABOUT_NLS
>>
>>  GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
>> +AUTOPOINT = $(HOST_DIR)/bin/autopoint
>
>  This is not correct, AUTOPOINT should be defined together with the rest in
> autoconf.mk. You seem to think that by putting it here, it will only be defined
> if host-gettext is built, but that's not at all true: it is globally set.
>

Oh, yes, I was understanding it wrong indeed.

>  So I think we need something like this in autoconf.mk:
>
> AUTOPOINT = $(if $(filter
> YES,$($(PKG)_GETTEXTIZE)),$(HOST_DIR)/bin/autopoint,/bin/true)
>

That makes sense yes.

> (and remove the GETTEXTIZE support from pkg-autotools). In a later step we can
> rename <PKG>_GETTEXTIZE to <PKG>_AUTOPOINT.
>

How about having both available for now? i.e. letting packages select
<PKG>_GETTEXTIZE or <PKG>_AUTOPOINT.

-- 
Aleksander
https://aleksander.es
