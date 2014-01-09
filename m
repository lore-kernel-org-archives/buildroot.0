From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Thu, 9 Jan 2014 22:37:40 +0000
Subject: [Buildroot] ParaGUI package?
In-Reply-To: <52CED5E4.90603@mind.be>
References: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
 <20140108113404.413a4685@skate> <52CED5E4.90603@mind.be>
Message-ID: <DC148C5AA1CEBA4E87973D432B1C2D8817E6C50F@P3PWEX4MB008.ex4.secureserver.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, January 09, 2014 10:01 AM, Arnout Vandecappelle wrote:
> On 08/01/14 04:34, Thomas Petazzoni wrote:
>> On Wed, 8 Jan 2014 00:10:29 +0000, Hartley Sweeten wrote:
>>> I'm trying to find a simple GUI library that can be used with SDL and this one appears
>>> to cover my needs. Unfortunately the ParaGUI library appears to be a bit dead. The
>>> latest release at http://download.savannah.gnu.org/releases/paragui/ is
>>>
>>> paragui-1.1.8.tar.gz	19-Oct-2004
>>>
>>> I found a newer branch on https://github.com/pipelka/paragui that appears to be
>>> version 1.1.11.
>>
>> My first reaction is: do you really want to start using something that
>> appears to be dead/deprecated?
>>
>>> Makefile.am: error: required file './NEWS' not found
>>> Makefile.am: error: required file './ChangeLog' not found
>>
>> These seems to be the real problems. Easiest solution is to add a post
>> patch hook with "touch $(@D)/NEWS $(@D)/ChangeLog"
>
>  Actually, perhaps we should always to this when PKG_AUTORECONF is YES? 
> There are quite a lot of packages that have this touch trick.

I was finally able to get paragui to compile with Buildroot using a POST_PATCH_HOOKS
like was just done for the sdl package:

define PARAGUI_RUN_AUTOGEN
	cd $(@D) && ./autogen.sh
endef

PARAGUI_POST_PATCH_HOOKS += PARAGUI_RUN_AUTOGEN

Doing this I only needed 2 patches.
1) to use the correct sdl-config
2) to include <ostream> in a source file (I think this is needed because of a gcc 4.3.3 bug)

I was also able to get the package to compile using AUTORECONF = YES but that
needed a lot more patches.

I can post the patch to add the paragui package but there is one issue. ParaGUI requires
libsigc++ 1.2 (>= 1.2.5) but the current libsigc package in Buildroot is for libsigc++ 2.2 (2.2.11).
The API is quite different between the 1.2 and 2.2 versions. So to get paragui to compile I
had to also add a libsigc1 package (leaving the current libsigc as-is).

Is this acceptable? If so I can post 2 patches:

1) add package libsigc1
2) add package paragui

Thanks,
Hartley
