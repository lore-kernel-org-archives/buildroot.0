From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:58:44 +0100
Subject: [Buildroot] [PATCH/next 2/2] squid: needs atomic
In-Reply-To: <20181124145450.5623-2-fontaine.fabrice@gmail.com>
References: <20181124145450.5623-1-fontaine.fabrice@gmail.com>
 <20181124145450.5623-2-fontaine.fabrice@gmail.com>
Message-ID: <20181129225844.2e72e404@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 15:54:50 +0100, Fabrice Fontaine wrote:
> Since https://github.com/squid-cache/squid/commit/4b0f89121135aae68fbaf2aa33b5fb2e0da66d3e
> squid tries to find if latomic is needed through:
> AC_SEARCH_LIBS([__atomic_load_8],[atomic],[ATOMICLIB="-latomic"],[])
> 
> However, this can fails on:
> configure:21147: /home/fabrice/buildroot/output/host/bin/arc-buildroot-linux-gnu-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g conftest.cpp -latomic   >&5
> conftest.cpp:55:6: error: new declaration 'char __atomic_load_8()' ambiguates built-in declaration 'long long unsigned int __atomic_load_8(const volatile void*, int)' [-fpermissive]
>  char __atomic_load_8 ();
>       ^~~~~~~~~~~~~~~
> conftest.cpp: In function 'int main()':
> conftest.cpp:59:25: error: too few arguments to function 'long long unsigned int __atomic_load_8(const volatile void*, int)'
>  return __atomic_load_8 ();

I've applied to next, but could you fix the upstream code so that the
-latomic detection works correctly, and we can drop the workaround in
Buildroot at some point in the future ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
