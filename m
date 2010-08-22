From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Aug 2010 08:27:50 +0000 (UTC)
Subject: [Buildroot] [Bug 2353] [lua] fix build with 2010.08-rc1
In-Reply-To: <bug-2353-163@https.bugs.busybox.net/>
References: <bug-2353-163@https.bugs.busybox.net/>
Message-ID: <20100822082750.2CBD088CA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2353

--- Comment #4 from Fran?ois Perrad <francois.perrad@gadz.org>  ---
(In reply to comment #2)
> Thanks Fran?ois for this patch. Your patch contained three things :
> 
>  *) Remove -DLUA_USE_DLOPEN from LUA_MYCFLAGS when LUA_SHARED_LIBRARY is
> enabled, and add -DLUA_USE_DLOPEN to LUA_MYCFLAGS when readline support is
> requested. Could you explain the rationale for this change ?
> 

This part avoids some warnings about the redefinition of LUA_USE_DLOPEN, when
BR2_PACKAGE_LUA_INTERPRETER_READLINE is set.

See in src/luaconf.h lines 36-40 :
#if defined(LUA_USE_LINUX)
#define LUA_USE_POSIX
#define LUA_USE_DLOPEN        /* needs an extra library: -ldl */
#define LUA_USE_READLINE    /* needs some extra libraries */
#endif


>  *) A fix to make sure that the value of MYCFLAGS actually gets passed to Lua.
> This is correct, and I've committed it, in a slightly different form, see
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?id=8199f9f94bab74e27b0eed1a52ed1125e3af62e8
> 
>  *) A fix to make the clean in the src/ subdirectory. But I've just tested, the
> main Lua Makefile already goes into the src/ subdirectory when doing "make
> clean" at the root directory of Lua sources. So "make lua-clean" in Buildroot
> already works fine. Which problem are you fixing here ?

There are 2 Makefiles in the Lua distribution :
Makefile which deals with different platforms : linux, mingw, ...
src/Makefile which does the real job, and is used by LUA_BUILD_CMDS

For symmetry, I want use src/Makefile in LUA_CLEAN_CMDS.

The next step is to remove a part of lua-shared-libs.patch which alters
Makefile.

> 
> Again, thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
