From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sun, 29 Oct 2017 10:26:28 -0700
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <20171029101249.19a91e32@windsurf>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
 <20171029072649.GA2899@scaer> <20171029101249.19a91e32@windsurf>
Message-ID: <6ad5572c-a3a8-2164-9086-ebd3691541a5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 10/29/2017 02:12 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 29 Oct 2017 08:26:49 +0100, Yann E. MORIN wrote:
> 
>> On 2017-10-28 19:06 -0700, Florian Fainelli spake thusly:
>>> Add the ability to specify a path to a custom directory where kernel sources
>>> may be contained. This is useful when doing kernel development in an existing
>>> git tree.  
>>
>> This case is covered by the override-sourcedir mechanism.
>>
>> Create a file (by default, local.mk) in your config directory (the one
>> with the Buildroot .config file), and edit this file with:
>>
>>     LINUX_OVERRIDE_SRCDIR = /path/to/your/linux
>>
>> and Buildroot will use that as a rsync source, instead of downloading
>> the kernel sources.
>>
>> See also e782cd5b1bc (Revert "Added local directory as source of kernel
>> code") for more in-depth explanations. ;-)
> 
> Fully agreed with Yann here: there is no point in adding a
> Linux-specific solution for this use case, as we already have a much
> more general solution that works for all packages, including the
> 'linux' package.

That seems fine in premise, but there are still a few angles that just
don't feel right or I am most certainly just misusing this:

- we still need to specify a "custom" kernel version, and apparently it
cannot be empty and just mean "does not matter", that's extremely
impractical, if the workflow involves a bisection over several kernel
versions, there is no way I am specifying the kernel version every time
I run git bisect

- how about kernel-headers? My local.mk now has this:

LINUX_OVERRIDE_SRCDIR = /home/florian/dev/linux
LINUX_HEADERS_OVERRIDE_SRCDIR = /home/florian/dev/linux

but it still won't let me build with "Same as kernel being built", see
below [1]

- if someone is seeing any issues with Buildroot using this (or anything
for that matter), it would a lot easier for you to just tell them to
send their .config file, now you also need to ask them whether they are
using local.mk, and send it too, that assumes people read "how to submit
bugs" documentation anyway

[1]:
package/linux-headers/linux-headers.mk:134: *** LINUX_HEADERS_SITE
cannot be empty when LINUX_HEADERS_SOURCE is not.  Stop.
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2
zsh: exit 2     make

-- 
Florian
