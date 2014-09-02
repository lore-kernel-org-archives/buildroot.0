From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 02 Sep 2014 13:51:56 -0300
Subject: [Buildroot] [PATCH] libphidget: needs dynamic library support
In-Reply-To: <alpine.DEB.2.02.1409021930440.5899@tavas.tkos.co.il>
References: <1409617011-24433-1-git-send-email-gustavo@zacarias.com.ar>
 <alpine.DEB.2.02.1409021930440.5899@tavas.tkos.co.il>
Message-ID: <5405F5AC.7030208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/2014 01:32 PM, Jonathan Ben Avraham wrote:

> Hi Gustavo,
> Thanks for the fix.
> What should I have known or tested to find this myself at the time that
> I added the package?
> 
>  - yba

Hi Jonathan.
Usually when i add a new package i have a couple of prebuilt external
toolchains to test against with just the basic toolchain options:
* Lowest possible version of linux headers for latest git buildroot, to
find minimal requirements (rarely needed).
* Static & Dynamic
* Uclibc barebones (no rpc/wchar/lfs/ipv6)
* C++ and not.

There's no bulletproof formula to get all the options right, rather a
set of hints to look at.
For example extensive use of mbstowcs/mblen/wctomb functions in the
source usually indicates it needs wchar support (unless it's conditional).
Non-conditional usage of in6* / IN6* for IPv6.
RPC functions (pmap_* xdr_*) for RPC.
Mandatory usage of dlopen, creation of shared libraries (plugins) or
linking to libdl is usually a good hint that static-only isn't an option.
And so on.

In the end the autobuilders were doing their job, there are many
combinations that can slip under the radar: missing X syscall in some
architecture, some assembly optimization that doesn't consider
architecture variants which needs disabling and so on (example: can't
handle ARM thumb-only mode).
Regards.
