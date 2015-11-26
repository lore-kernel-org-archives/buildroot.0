From: Alexey Galakhov <agalakhov@gmail.com>
Date: Thu, 26 Nov 2015 21:43:14 +0100
Subject: [Buildroot] [PATCH 1/1] core: add option to force compiling C++
 as C++11
In-Reply-To: <20151126175115.58c84720@free-electrons.com>
References: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
 <20151126175115.58c84720@free-electrons.com>
Message-ID: <20151126214314.278f4531.agalakhov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

> I am not familiar with C++ issues, can you give some more details and
> specific examples here ?

This is more or less a toolchain issue. Consider we're building a C++
library with a class declaration in *.h and its implementation in
*.cpp. Compilation with a C++03 compiler results in the generation of
several functions corresponding to class methods. Compilation with a
C++11 compiler gives two additional functions, corresponding to the
move constructor and the move assignment operator (new features of
C++11).

If a C++ library is compiled with an C++03 compiler (that is the
default when using g++), its object files won't contain the
implementations of these new methods. The library is then unusable for
C++11 compiler. In the worst case we have to recompile all the
libraries in the system with a C++11 compiler.

Example linker error is:

In function log4cplus::detail::macros_get_logger(log4cplus::Logger&&)':
/usr/include/log4cplus/loggingmacros.h:106: undefined reference
tolog4cplus::Logger::Logger(log4cplus::Logger&&)'

This function is only generated when compiling in C++11 mode. It does
not exist in C++03 mode.

To clarify: This is NOT an error inside buildroot! This only happens if
compiling some 3rd-party or proprietary code against previously
compiled buildroot system. If I want to compile my program with
--std=c++11, I have to compile buildroot with --std=c++11 as well.


> I don't think it is appropriate for Buildroot to have an option to be
> enabled "if you encounter <foo> errors". If there is a problem, it
> should be fixed properly, without having to rely on the user enabling
> (or not enabling) a given option.

Unfortunately, there is no "proper" solution. An alternative solution
could be compiling most of the C++ libraries twice and thus providing
two versions of each *.so file, one for C++03 and C++11. We could also
try to make this option on per-package basis, but this should be then
done in every library package using C++ and would be confusing.

The proper help text would probably be something like this:
"""
? Enable this option if you need the move-semantics implementation in ?
? the shared C++ libraries of buildroot. I.e., if you want to link your
? own C++11 applications against them and the linker complains about
? non-existing move constructor.
"""

Regards,
Alexey
