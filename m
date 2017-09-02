From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 3 Sep 2017 00:23:40 +0200
Subject: [Buildroot] [PATCH v2 07/11] package/flex: disable reallocarray
In-Reply-To: <20170902231252.44d10e64@windsurf.lan>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-8-romain.naour@gmail.com>
 <20170902231252.44d10e64@windsurf.lan>
Message-ID: <0425231e-af49-5b27-f5c1-bc6c91308839@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 02/09/2017 ? 23:12, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat,  2 Sep 2017 22:54:19 +0200, Romain Naour wrote:
>> This doesn't compile with glibc 2.26 where reallocarray() as been introduced.
>>
>> Fixes:
>> stage1flex-misc.o: In function `allocate_array':
>> misc.c:(.text+0x38f): undefined reference to `reallocarray'
>> stage1flex-misc.o: In function `reallocate_array':
>> misc.c:(.text+0xc8a): undefined reference to `reallocarray'
>> collect2: error: ld returned 1 exit status
> 
> This commit log is a bit mysterious: if reallocarray() has been
> introduced in glibc 2.26, why isn't flex able to use it ?

It's a nasty issue, when reallocarray() is available for the target, flex will
build a small tool called stage1flex for the host (using _FOR_BUILD) but with
the config.h generated for the target.

My host doesn't have glibc 2.26, so reallocarray() is never defined while
building stage1flex:

misc.c:147:8: warning : implicit declaration of function ? reallocarray ?
[-Wimplicit-function-declaration]
  mem = reallocarray(NULL, (size_t) size, element_size);
        ^~~~~~~~~~~~
misc.c:147:6: warning : assignment makes pointer from integer without a cast
[-Wint-conversion]
  mem = reallocarray(NULL, (size_t) size, element_size);
      ^

I don't know how to fix this, except by disabling reallocarray() for the target...

Best regards,
Romain

> 
> Thomas
> 
