From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 18:44:50 +0200
Subject: [Buildroot] auto.conf versus autoconf.h versus .config
In-Reply-To: <alpine.LFD.2.11.1504191223050.3495@localhost>
References: <alpine.LFD.2.11.1504191223050.3495@localhost>
Message-ID: <20150419164450.GJ4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2015-04-19 12:32 -0400, Robert P. J. Day spake thusly:
> 
>   just want to clarify the generated config artifacts and their
> ordering if i may ... i'm looking at the output objects under
> output/build/buildroot-config, especially these:
> 
> * auto.conf
> * autoconf.h
> 
> and if memory serves, auto.conf represents the *set* config variables
> that result from my configuration (which, for my BBB, is 187 lines
> long), while the top-level .config file represents exactly the same
> information, but padded out with many hundreds of lines of "is not
> set" lines, hence its much longer length of well over 2500 lines for
> me. do i understand that correctly?
> 
>   finally, there's autoconf.h, which is just the transformed version
> of auto.conf suitable for inclusion in source and header files.
> 
>   do i have that about right? there are also the numerous header files
> and subdirs under .../br2 in that location, but in my case, every
> single *.h file in that br2/ directory is empty. what is the purpose
> of all those empty header files? just placeholders of some kind?
> (there are lots of subdirs there as well, but i'm just curious about
> the empty header files *immediately* under br2/ there.)

The .config file is the direct output of menuconfig (and other
configurators). That's what we use to decide whether a package (or any
other option) is enabled/disabled. That's also what the Kconfig parser
uses as input and serves two purposes: 1) show you the currently
selected/deselected options, 2) show which it does not know about (i.e.
those that are marked (NEW), e.g. when you're using a .config from an
old version and are updating).

All the rest are atrifacts of 'make silentoldconfig' which we use to
eventually enforce the Kconfig set of options into the .config (i.e.
silentoldconfig, like oldconfig, is supposed to ask if there are
options it does not know the status of, but only show those options, not
the full set).

silentoldconfig also generates that autoconf.h and that myriad of empty
.h files. In buildroot, we do not use those, but since we're trying to
be as close as upstream Kconfig (from the kernel), we get them too.

For info: the kernel uses that myriad of empty .h files for its
dependency tracking in Kbuild. They are never ever included in any .c
file, but just in dependency rules in the Makefiles. Kconfig is smart
enough to not touch such a file is the corresponding option was
previously set, but removes thos no longer set, and touches those that
are set but were previously not.

TL;DR: do not care about anything in output/build/buildroot.config, it's
just a side-effect of using a kconfig parser that is close to the one in
the Linux kernel.

> p.s. if all this is explained somewhere, pointing me at it will be
> just ducky.

Docuemntation/kbuild/ in your kernel tree. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
