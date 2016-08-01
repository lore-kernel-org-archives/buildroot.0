From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Aug 2016 00:19:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160801215909.GA5990@free.fr>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160801215909.GA5990@free.fr>
Message-ID: <20160801221917.GB5990@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2016-08-01 23:59 +0200, Yann E. MORIN spake thusly:
> On 2016-07-25 15:52 -0400, David Raeman spake thusly:
> > HOST_CFLAGS includes a search path for HOST_DIR/usr/include using -I.  When
> > HOST_CFLAGS is used by a package, these flags are passed to the compiler ahead
> > of flags passed by the package's internal make system.  If a package has a
> > header file with the same name as a header file in HOST_DIR, this causes the
> > toolchain to prefer the file from the system include directory because its -I
> > appears first on the command line.  I believe conflicts should prefer the file
> > provided by the package.  This can be accomplished by using -isystem, which is
> > more appropriate then -I for system-level include paths.
> [--SNIP--]
> 
> In fact, this does not work, and the patch was reverted (for background).
> 
> What we need is that gcc follows the following sequence when looking for
> headers:
> 
>  1- search paths specified with -I by the package
> 
>  2- search our $(HOST_DIR)/usr/include
> 
>  3- search the host system /usr/include
> 
> However, I can't find anything in the gcc manpage that allows to add the
> search path we need in (2).
> 
> All I can see is -idirafter, to add search paths after all other
> non-system and system paths.
> 
> So, probably the following would not be very far from what we'd have to
> do:
> 
>     -nostdinc -idirafter $(HOST_DIR)/usr/include -idirafter /usr/include
> 
> This tells gcc to not look at the system include path, so it is left
> with only the paths specified by the package, and then as a fallback,
> out $(HOST_DIR)/usr/include, and then as a last resort, the host-system
> /usr/include dirs, since the last two are -idirafter:
> 
>     -idirafter dir
>         Search dir for header files, but do it after all directories
>         specified with -I and the standard system directories have
>         been exhausted. dir is  treated as a system include directory.
> 
> Thoughts?
> 
> David, would you care to see if:
> 
>  1- it fixes your own problem?

No, it does not work as-is, because there is more that just /usr/include
as the standard headers search path. On my machine, gcc looks for:

    $ printf "" |`gcc -print-prog-name=cc1` -v -o /dev/null >/dev/null
    #include "..." search starts here:
    #include <...> search starts here:
     /usr/lib/gcc/x86_64-linux-gnu/5/include
     /usr/local/include
     /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
     /usr/include
    End of search list.
    [--SNIP--]

Adding those four makes the build suceeds, though...

But there is no simple way to get that list of search path either, so
that's a no-no for now... :-/

Furthermore, the C++ search dirs are even different:

    $ printf "" |`gcc -print-prog-name=cc1` -v -o /dev/null >/dev/null
    #include "..." search starts here:
    #include <...> search starts here:
     /usr/include/c++/5
     /usr/include/x86_64-linux-gnu/c++/5
     /usr/include/c++/5/backward
     /usr/lib/gcc/x86_64-linux-gnu/5/include
     /usr/local/include
     /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
     /usr/include
    End of search list.

Gah... :-(

Forget it, that was not a good idea... :-(

Regards,
Yann E. MORIN.

>  2- it fixes the python issues we've had with -isystem?
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
