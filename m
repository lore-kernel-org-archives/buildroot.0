From: Michael Walle <michael@walle.cc>
Date: Tue, 14 Jan 2020 11:52:36 +0100
Subject: [Buildroot] [RFC PATCH] autotools: do not overwrite first
 include path
In-Reply-To: <53fbaa47-6e61-6be6-2aef-3daee6a698dc@mind.be>
References: <20191212085748.13802-1-michael@walle.cc>
 <53fbaa47-6e61-6be6-2aef-3daee6a698dc@mind.be>
Message-ID: <fd9bee30fa6a1d7851f243f10e66a355@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am 2020-01-14 00:37, schrieb Arnout Vandecappelle:
> On 12/12/2019 09:57, Michael Walle wrote:
>> The first include path is special in aclocal. For example it is the 
>> path
>> for the --install option. Also, the first include is treated in a
>> special way if it doesn't exists. This might be the case if there is 
>> the
>> following construct:
>> 
>>   configure.ac: AC_CONFIG_MACRO_DIR([m4])
>>   Makefile.am: ACLOCAL_AMFLAGS="-I m4"
>> 
>> If the package doesn't have local macros, the m4/ directory might not
>> exist. aclocal will then just issue a warning instead of aborting the
>> execution with a fatal error. See discussion here:
>>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565663
>> 
>> Don't use the "-I" option in aclocal. Instead use ACLOCAL_PATH to pass
>> the system-wide include dirs.
>> 
>> As a side effect this should fix the use of $(ACLOCAL) alone. Up until
>> now, $(ACLOCAL) didn't include the ACLOCAL_HOST_DIR system include 
>> path.
>> 
>> autoreconf will pass the "-I" options to every tool it runs. So move 
>> the
>> argument to each individual tool except aclocal.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ---
>>  package/autoconf/autoconf.mk | 6 +++---
>>  package/automake/automake.mk | 2 +-
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/package/autoconf/autoconf.mk 
>> b/package/autoconf/autoconf.mk
>> index e5f474c72d..336ac59b42 100644
>> --- a/package/autoconf/autoconf.mk
>> +++ b/package/autoconf/autoconf.mk
>> @@ -21,6 +21,6 @@ HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
>>  $(eval $(host-autotools-package))
>> 
>>  # variables used by other packages
>> -AUTOCONF = $(HOST_DIR)/bin/autoconf
>> -AUTOHEADER = $(HOST_DIR)/bin/autoheader
>> -AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" 
>> AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" 
>> AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf 
>> -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
>> +AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I 
>> "$(ACLOCAL_HOST_DIR)"
>> +AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I 
>> "$(ACLOCAL_HOST_DIR)"
>> +AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" 
>> AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" 
>> AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf 
>> -f -i
> 
>  This will expand to:
> 
> ... ACLOCAL="ACLOCAL_PATH="$(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)"
> $(HOST_DIR)/bin/aclocal" AUTOCONF=...
> 
> (I've only done one level of expansion, but is shows my point.) So the 
> quotation
> marks are screwed up a little.

nice catch.

>  It does work because the space is still quoted, and the quotes around 
> the
> ACLOCAL_PATH value are actually redundant (because spaces in 
> directories are not
> supported). But it looks a little weird.
> 
> 
>  That said, I wonder: why don't we simply export ACLOCAL_PATH? I think 
> with
> that, we don't need the -I options in autoheader and autoconf any more, 
> right?

You mean something like that:

ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)

AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL_PATH="$(ACLOCAL_PATH)" 
ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" 
AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f 
-i

That won't work if $(ACLOCAL) is used alone. But from what I see that 
isn't
used for now. So we could give that a try.

Or rather something like that:
ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
export ACLOCAL_PATH

AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" 
AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" 
AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i

But that would clutter the variable ACLOCAL_PATH and no other package 
exports variables.

-michael
