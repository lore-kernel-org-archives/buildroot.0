From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 22:00:35 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: improve the missing perl
 modules detection
In-Reply-To: <56031124.50206@imgtec.com>
References: <1443015861-11295-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150923195051.GA2229@tarshish> <56031124.50206@imgtec.com>
Message-ID: <560312F3.1020108@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

I missed some things from your reply. Let me add more comments, please.

On 23/09/15 21:52, Vicente Olivert Riera wrote:
> Dear Baruch Siach,
>
> On 23/09/15 20:50, Baruch Siach wrote:
>> Hi Vincent,
>>
>> On Wed, Sep 23, 2015 at 02:44:21PM +0100, Vicente Olivert Riera wrote:
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>   support/dependencies/dependencies.sh |   26 +++++++++++++++++++++-----
>>>   1 files changed, 21 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/support/dependencies/dependencies.sh
>>> b/support/dependencies/dependencies.sh
>>> index 01ad828..af9aefe 100755
>>> --- a/support/dependencies/dependencies.sh
>>> +++ b/support/dependencies/dependencies.sh
>>> @@ -236,10 +236,26 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y
>>> $BR2_CONFIG ; then
>>>       fi
>>>   fi
>>>
>>> -# Check that the Perl installation is complete enough to build
>>> -# host-autoconf.
>>
>> The information that we need perl for host-autoconf should be
>> preserved, I
>> think.

This.

>>> -if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
>>> -    echo "Your Perl installation is not complete enough, at least
>>> Data::Dumper is missing."
>>> -    echo "On Debian/Ubuntu distributions, install the 'perl' package."
>>
>> You are also removing this bit of valuable information.
>>
>> Maybe we should split this into two checks, one for perl itself, and
>> then for
>> some required modules.

And this, make sense to me.

First check for perl itself, and if it's not present, say that we need 
it to build host-autoconf, among other packages.

And then do the checks for required modules.

Sorry, is late and I was a bit sleepy, so a missed some parts of your reply.

I will send an v2.

Thanks for your review!

Vincent.

  That would allow us to give the user a more
>> precise
>> diagnosis.
>
> I really thought about that before removing the advice about which
> package provides that missing perl module. But then I thought about it
> twice and I believe is not really so valuable. I think every Linux user
> should be able to know which package of the distribution that he is
> using provides those missing perl modules. We just say the missing
> modules and is up to the user to install the packages which provide
> those modules. Is not so hard, in my opinion. Also, in some distros the
> package has one name, and in other distros has a different name. We
> can't put all of them so having only the ones for Debian/Ubuntu only
> help part of the users, and not the other.
>
> For me the patch is good as is. If other developers think the same as
> you, I really don't have any problem that someone else overtake this
> patch and make the desired modifications. Absolutely no problem at all :-)
>
> Regards,
>
> Vincent.
>
>>
>>> +# Check that the Perl installation is complete enough for Buildroot.
>>> +# Here is the space-separated list of the required modules:
>>> +required_perl_modules="Data::Dumper Thread:Queue"
>>> +
>>> +# This variable will keep the modules that are missing in your system:
>>> +missing_perl_modules=""
>>> +
>>> +for pm in $required_perl_modules ; do
>>> +    if ! perl  -e "require $pm" > /dev/null 2>&1 ; then
>>> +        missing_perl_modules="$missing_perl_modules $pm"
>>> +    fi
>>> +done
>>> +
>>> +if [ -n "$missing_perl_modules" ] ; then
>>> +    echo "Your Perl installation is not complete enough; at least
>>> the following"
>>> +    echo "modules are missing:"
>>> +    echo ""
>>> +    for pm in $missing_perl_modules ; do
>>> +        echo -e "\t $pm"
>>> +    done
>>> +    echo ""
>>>       exit 1
>>>   fi
>>
>> baruch
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
