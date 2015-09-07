From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 22:40:47 +0200
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
Message-ID: <55EDF64F.7020707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 19:49, Alex Potapenko wrote:
> Sorry, top posting was an accident: I first pressed 'Reply' instead of 'Reply to
> all', then typed the message, and then noticed it. Thought if I only change the
> recipients, not the topic, it'll be OK.

 Well, you're still top-posting... [1]

> Anyway, /system/lib appears in strace output only because of LD_LIBRARY_PATH env
> variable, which is populated by android as '/system/lib' and is respected by
> uclibc. If I empty this variable, those entries go away.

 Ah OK.

> Optware-ng is designed to reside in /opt, be firmware-independed and run fine as
> long as the arch is right.

 And the kernel ABI is compatible of course.

 Hm, you're running 2.6.36 headers against a 3.0 kernel... Normally that
shouldn't be an issue, but maybe there are some LARGEFILE related changes that
are not entirely ABI-compatible - or perhaps it's a uClibc bug to not do this in
an ABI-compatible way. I see in fs/compat.c that cp_compat_stat() can return
-EOVERFLOW if the inode is 64 bit while the syscall is 32 bit. But since the
toolchain is LFS I don't see how this could happen...


> At least if it doesn't pick up wrong libs first
> because of LD_LIBRARY_PATH containing conflicting libs. That is why I expected
> it to work with my phone, arch seems right... But it doesn't! And that's the
> mystery, the strace EOVERFLOW error tells me nothing, and I don't even know
> where to look, what to try, etc.

 It would help if you would have your phone's kernel config. Do you have it?


 Regards,
 Arnout


[1] https://en.wikipedia.org/wiki/Posting_style#Top-posting

> 
> Thanks
> 
> 7 ???. 2015 18:17 "Arnout Vandecappelle" <arnout@mind.be
> <mailto:arnout@mind.be>> ????:
> 
>     On 07-09-15 16:53, Alex Potapenko wrote:
>     > Thank you for your response, Arnout!
>     > Unfortunately, that is not the reason here. I use Buildroot to build the
>     > toolchain only. And then use modified Optware build system to
>     cross-compile the
>     > packages. armeabi feed is built with '
>     > -Wl,--dynamic-linker=/opt/lib/ld-uClibc.so.0' ld flag, so they know where the
>     > linker resides.
> 
>      Weird, since strace shows that it is looking inside /system and lc-uClibc.so
>     would never do that...
> 
>      Your kernel does have CONFIG_AEABI I hope?
> 
> 
>      Could you try to build without the --dynamic-linker and install in / ? Just to
>     exclude that potential issue.
> 
> 
>      Regards,
>      Arnout
> 
>      PS Please don't top-post.
> 
>     [snip]
> 
>     --
>     Arnout Vandecappelle                          arnout at mind be
>     Senior Embedded Software Architect            +32-16-286500
>     <tel:%2B32-16-286500>
>     Essensium/Mind                                http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>     GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
