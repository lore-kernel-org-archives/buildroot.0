From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 00:45:20 +0200
Subject: [Buildroot] [PATCH 1/2 v8] core: don't build host-cmake if it
 is available on the build host
In-Reply-To: <20160913213457.GB6175@free.fr>
References: <cover.1473717489.git.yann.morin.1998@free.fr>
 <3ce0d5355eee13e5667c5ef3233514e2308044d8.1473717489.git.yann.morin.1998@free.fr>
 <73437706-39d8-50af-7a08-df3ec45deaa1@lucaceresoli.net>
 <20160913213457.GB6175@free.fr>
Message-ID: <968743de-1d56-53cd-c707-3ac7f923dcb7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 23:34, Yann E. MORIN wrote:
> Luca, All,
> 
> On 2016-09-13 23:05 +0200, Luca Ceresoli spake thusly:
>> On 12/09/2016 23:59, Yann E. MORIN wrote:
>>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>> Currently all cmake packages depend on host-cmake. Unfortunately
>>> host-cmake takes a long time to configure and build: almost 7 minutes
>>> on a dual-core i5 with SSD. The time does not change even with ccache
>>> enabled.
> [--SNIP--]
>>> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
>>> new file mode 100755
>>> index 0000000..9b63b06
>>> --- /dev/null
>>> +++ b/support/dependencies/check-host-cmake.sh
>>> @@ -0,0 +1,39 @@
>>> +#!/bin/sh
>>> +
>>> +candidate="${1}"
>>> +version_min="${2}"
>>> +
>>> +major_min="${version_min%.*}"
>>> +minor_min="${version_min#*.}"
>>> +
>>> +cmake=`which ${candidate}`
>>> +if [ ! -x "${cmake}" ]; then
>>> +    # echo nothing: no suitable cmake found
>>> +    exit 1
>>> +fi
>>> +
>>> +# Extract version X.Y from versions in the form X.Y or X.Y.Z
>>> +# with X, Y and Z numbers with one or more digits each, e.g.
>>> +#   3.2     -> 3.2
>>> +#   3.2.3   -> 3.2
>>> +#   3.2.42  -> 3.2
>>> +#   3.10    -> 3.10
>>> +#   3.10.4  -> 3.10
>>> +#   3.10.42 -> 3.10
>>> +version="$(${cmake} --version \
>>> +           |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
>>> +                   -e 's//\1/'
>>> +          )"
>>> +major="${version%.*}"
>>> +minor="${version#*.}"
>>
>> You removed the 'head -n1' in the pipe.
> 
> Indeed, but look at the sed script (which is not that complicated): all
> lines that do not match the pattern are ignored.
> 
>         |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
>                                                Here ----^
> 
> "!d" means "if no match, delete line".
> 
> Then the next expression is only aplied on matching lines, and "\1"
> refers to the ()-match, which is the version string.

 You snipped away Luca's example: if there are two lines that contain something
that looks like a version number, then you get two versions out of this script.
So repeating Luca's example:

  cmake version 3.5.1

  Linked against libfoobar 7.6.5

will give you

version="3.5
7.6"


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
