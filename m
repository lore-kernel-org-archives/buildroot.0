From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Sep 2015 09:28:58 +0100
Subject: [Buildroot] [PATCH v6] dependencies.sh: improve the missing
 perl modules detection
In-Reply-To: <20150928225612.2a12b1c9@free-electrons.com>
References: <1443175585-27077-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150928225612.2a12b1c9@free-electrons.com>
Message-ID: <560A4BCA.20906@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks a lot for your review. See comments below, please.

On 09/28/2015 09:56 PM, Thomas Petazzoni wrote:
> Vicente,
> 
> I think the patch is great, but there are some implementation issues,
> see below.
> 
> On Fri, 25 Sep 2015 11:06:25 +0100, Vicente Olivert Riera wrote:
> 
>> -# Check that the Perl installation is complete enough to build
>> -# host-autoconf.
>> -if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
>> -	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
>> -	echo "On Debian/Ubuntu distributions, install the 'perl' package."
>> +# Check that the Perl installation is complete enough for Buildroot.
>> +# Here is the space-separated list of the required modules.
> 
> The space-separated comment doesn't make much sense IMO.

Uhm..., ok. I think having two examples (Data::Dumper and Thread:Queue)
is enough to understand how to add more modules to the list. I will
remove the comment.

>> +required_perl_modules="Data::Dumper" # Needed to build host-autoconf
>> +required_perl_modules+=" Thread:Queue" # Used by host-automake
> 
> The += operator is bash specific, and not POSIX compliant. Since this
> dependencies.sh script specifies #!/bin/sh, you're not guaranteed to be
> executed with bash.

Totally true, I will fix that. Thanks!

>> +
>> +# This variable will keep the modules that are missing in your system.
>> +missing_perl_modules=""
>> +
>> +for pm in $required_perl_modules ; do
>> +	if ! perl  -e "require $pm" > /dev/null 2>&1 ; then
>> +		missing_perl_modules+=" $pm"
> 
> Ditto.

Noted.

>> +	fi
>> +done
>> +
>> +if [ -n "$missing_perl_modules" ] ; then
>> +	echo "Your Perl installation is not complete enough; at least the following"
>> +	echo "modules are missing:"
>> +	echo ""
> 
> Quotes not needed here, just "echo" is sufficient.

Yeah, that's right.

>> +	for pm in $missing_perl_modules ; do
>> +		echo -e "\t $pm"
>> +	done
>> +	echo ""
> 
> Ditto.

Noted.

I will send a new version today.

Regards,

Vincent.


> Thomas
> 
