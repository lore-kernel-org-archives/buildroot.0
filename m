From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:08:00 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/ngircd: fix static build with openssl and atomic
In-Reply-To: <20190415221011.55b0ea91@windsurf>
References: <20190414155153.4317-1-fontaine.fabrice@gmail.com>
 <20190415221011.55b0ea91@windsurf>
Message-ID: <25c2ed7a-d9b3-8066-6cfc-e26c84713dec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 22:10, Thomas Petazzoni wrote:
> On Sun, 14 Apr 2019 17:51:53 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Fixes:
>>  - http://autobuild.buildroot.org/results/72345ebd144bed824329618e66721a98eba3be22
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> This was still causing the AC_CHECK_LIB error here, which was in fact
> due to the use of PKG_CHECK_MODULES without having host-pkgconf in the
> dependencies. With this, ngircd built fine, but unfortunately, there is
> still an issue.
> 
>> +# We're patching configure.ng, but package cannot autoreconf with
>> +# automake >= 1.12 because de-ANSI-fication has been removed so apply the same
>> +# tweaks that are done by upstream in autogen.sh
>> +define NGIRCD_REMOVE_DE_ANSI_FICATION
>> +	sed -e "s|^__ng_PROTOTYPES__|AC_C_PROTOTYPES|g" \

 Pretty please, be consistent with sed delimiters:

$ git grep -h '\(SED\|sed\|-e\).*\bs[@!|,#+%^:]' -- \*.mk | \
  grep -o '\bs[@!|,#+%^:]' | sort | uniq -c
     23 s#
     56 s%
     60 s,
     50 s:
      2 s@
      3 s^
     11 s|

 So comma or percent please.


>> +		$(@D)/configure.ng > $(@D)/configure.ac
>> +
>> +	sed -e "s|^__ng_Makefile_am_template__|AUTOMAKE_OPTIONS = ${SERIAL_TESTS} #ansi2knr|g" \
> 
> This ${SERIAL_TESTS}
> 
>> +		$(@D)/src/portab/Makefile.ng > $(@D)/src/portab/Makefile.am
>> +	for i in ipaddr/Makefile ngircd/Makefile testsuite/Makefile tool/Makefile; do \
>> +		sed -e "s|^__ng_Makefile_am_template__|AUTOMAKE_OPTIONS = ${SERIAL_TESTS} #../portab/ansi2knr|g" \
> 
> and here, cause check-package to complain:
> 
> package/ngircd/ngircd.mk:23: use $() to delimit variables, not ${}
> package/ngircd/ngircd.mk:26: use $() to delimit variables, not ${}

 Huh? How could this ever have worked? make will replace the ${SERIAL_TESTS}
with the empty string, since the SERIAL_TESTS variable is not defined. Fabrice,
did you actually test this? Or maybe the SERIAL_TESTS is empty anyway?

 Anyway: $$ will fix the issue, both for make and for check-package.

 Regards,
 Arnout

> 
> so we need to find a way to either silence those warnings, or work
> around them. Perhaps we could simply include a patch ?
> 
> The tarball already has the configure.ac and Makefile.am generated,
> they only need to be tweaked for de-ansi-fication, and a patch may be a
> good alternative.
> 
> What do you think ?
> 
> Best regards,
> 
> Thomas
> 
