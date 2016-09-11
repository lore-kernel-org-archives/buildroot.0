From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 22:37:13 +0200
Subject: [Buildroot] [PATCHv6] core: don't build host-cmake if it is
 available on the build host
In-Reply-To: <20160911133523.GK5740@free.fr>
References: <1473201140-28745-1-git-send-email-yann.morin.1998@free.fr>
 <5d7b90ec-5dcf-f61b-166d-7dddc2436c79@mind.be>
 <20160911133523.GK5740@free.fr>
Message-ID: <4b06c3ed-a67c-0de7-b8a1-a5d08894c379@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 15:35, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-09-10 00:26 +0200, Arnout Vandecappelle spake thusly:
>> On 07-09-16 00:32, Yann E. MORIN wrote:
[snip]
>>> +		|sort -t. -k 1,1nr -k2,2nr \
>>
>>  Since you're anyway doing the version sort here already, you could just add
>> $(BR2_CMAKE_MIN_VERSION_MAJOR).$(BR2_CMAKE_MIN_VERSION_MINOR) into the mix and
>> verify that the first line is equal to
>> $(BR2_CMAKE_MIN_VERSION_MAJOR).$(BR2_CMAKE_MIN_VERSION_MINOR)
> 
> orry, I'm not sure I understand what you meant. Something like:
> 
>     (echo 3.1; grep blabla) |blabla
> 
> and then check that we get 3.1, right?

 Yep.

> 
>> We already use that trick for checking the make version, for instance.
> 
> I've looked at support/dependencies/dependencies.sh and we're not using
> that "trick" to check the make version;
> 
>    85 MAKE_MAJOR=$(echo $MAKE_VERSION | sed -e "s/\..*//g")
>    86 MAKE_MINOR=$(echo $MAKE_VERSION | sed -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
>    87 if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
>    88 ?   echo
>    89 ?   echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required"
>    90 ?   exit 1;
>    91 fi;

 Ha, so we check for the make version twice then...

Top-level Makefile, line 51-59:
# Save running make version since it's clobbered by the make package
RUNNING_MAKE_VERSION := $(MAKE_VERSION)

# Check for minimal make version (note: this check will break at make 10.x)
MIN_MAKE_VERSION = 3.81
ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION)
$(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >=
$(MIN_MAKE_VERSION) is required)
endif


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
