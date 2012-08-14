From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 14 Aug 2012 16:44:59 +0800
Subject: [Buildroot] [PATCH 2/5] linux: support unpacked kernel source
	tree
In-Reply-To: <20120813192739.0789b1e4@skate>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-2-git-send-email-sonic.adi@gmail.com>
 <20120811200654.35b80b74@skate>
 <CAJxxZ0NUYRsv3qsNY_pPPPSKsxHEt7-zQ2RkCUnwn+pmYu25Sg@mail.gmail.com>
 <20120813192739.0789b1e4@skate>
Message-ID: <CAJxxZ0NZzV9GFGpXnVdXY7SC_5hbrM48ox_eEcqnOPJfTzh4nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Aug 14, 2012 at 1:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Mon, 13 Aug 2012 18:12:07 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> > At the moment, what we have to offer is the local.mk mechanism: you can
>> > create a local.mk in which you write:
>>
>> Should I put this local.mk into buildroot/linux/ ?
>
> By default, Buildroot reads local.mk from the top source directory, but
> this is configurable through the BR2_PACKAGE_OVERRIDE_FILE
> configuration option.
>
>> > LINUX_OVERRIDE_SRCDIR = /path/to/linux/sources
>> >
>> > and then Buildroot will use the sources of Linux from this directory
>> > instead of doing the normal download/extract/patch strategy.
>>
>> The kernel configuration options in linux/Config.in don't allow me to
>> choose a local source. What should I do after seting local.mk up?
>
> Nothing, it will be picked automatically, because linux/ is handled by
> the common package infrastructure, which takes care of the
> <foo>_OVERRIDE_SRCDIR option you can set in local.mk.
>
> I admit this isn't completely nice to use, but this is so far the best
> solution we have found to implement this at the package infrastructure
> level. If you have better suggestions, we are definitely open to
> changing/improving this mechanism.
>

Current _OVERRIDE_SRCDIR method in local.mk doesn't help the
requirement to build developer's local SCM tree by buildroot without
copying the entire source code. This method asks for a complete copy
and rebuilding each time the developer changes anything in his local
SCM. It is inefficient and painful to develop large software packages
such as Linux kernel in this way.

To addresses this requirement, the generic package has to define its
source override path and forward the path flags to make command
explicitly. It is better to define _OVERRIDE_SRCDIR macro in the
generic package's makefile other than the local.mk.

I will revise my patch into common package infrastructure part and
Linux specific part for your comments.
Other generic packages can do similar change to support override
source without copying.

Regards,

Sonic Zhang
