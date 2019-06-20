From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 20 Jun 2019 15:40:33 +0200
Subject: [Buildroot] [PATCH 11/27] package/prboom: avoid using hardcoded
 optimization flags
In-Reply-To: <20190619213707.68d086b3@windsurf>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-12-giulio.benetti@micronovasrl.com>
 <20190619213707.68d086b3@windsurf>
Message-ID: <f710440d-3816-d979-b16b-c9dd77a085ae@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 19/06/2019 21:37, Thomas Petazzoni ha scritto:
> Hello Giulio,
> 
> On Fri, 14 Jun 2019 23:03:30 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Package prboom builds using -O2 flag ignoring Buildroot settings, this
>> is due to the fact that -O2 is appended at the end of CFLAGS.
>>
>> Remove -O2 from 'configure' file, this way CFLAGS will contain Buildroot
>> CFLAGS.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/prboom/prboom.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
>> index d370ae3fa5..6d9b55e9f6 100644
>> --- a/package/prboom/prboom.mk
>> +++ b/package/prboom/prboom.mk
>> @@ -11,6 +11,13 @@ PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
>>   PRBOOM_LICENSE = GPL-2.0+
>>   PRBOOM_LICENSE_FILES = COPYING
>>   
>> +# Remove imposed -O2 CFLAG to use TARGET_CFLAGS
>> +define PRBOOM_FIXUP_CONFIGURE
>> +	sed -i 's:-O2::g' $(@D)/configure
>> +endef
>> +
>> +PRBOOM_PRE_CONFIGURE_HOOKS += PRBOOM_FIXUP_CONFIGURE
> 
> I am not a big fan of this "blind" sed that replaces every -O2 in the
> configure script with nothing.
> 
> Patching configure.ac + autoreconf would be nicer, especially since
> anyway prboom depends on sdl, and sdl already depends on the autotools
> machinery.

Yes, it's really cleaner.

> However, ideally the configure.ac script should be fixed to *not* add
> flags to CFLAGS. CFLAGS is a user variable, the configure script is not
> supposed to use it. See
> https://www.gnu.org/software/automake/manual/html_node/Flag-Variables-Ordering.html.

Interesting document.

> But well, fixing the prboom configure.ac is probably too much effort
> comparing to the benefits.

I agree.

> So just do a patch that gets rid of the -O2 in the configure.ac, and
> that will be good enough.

Ok

Thank you
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
