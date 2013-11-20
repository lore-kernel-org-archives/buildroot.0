From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 20 Nov 2013 11:03:59 +0100
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
In-Reply-To: <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
References: <20131006185441.0d5c2397@skate>
 <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
Message-ID: <CAM+bi4t7Z4RWQ=6r=qOUOXKpqV76hRSogU0iBp12FKvN+fGviA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

Sorry for the big delay on this issue.

Now that I've spent a few hours looking at the code, I can firmly say this
is a compiler bug.

I've studied beecrypt's sha384.c code (openssl and others implement exactly
the same code from a common source) and I've managed to reduce the code to
what I think is a minimal example of bug triggering code.

After requesting gcc to preprocess the source, the same error still
happens. Almost any minimal change I've tried to the preprocessed source
makes the error go away (indexes or values seem to be irrelevant, I've just
mantained the numbers the code came from). An optimization flag is required
to trigger the bug (-Os, -O1,2,3). I haven't been successful trying to find
which specific optimization flag is the one that causes the error.

I've manually merged both (original and preprocessed files) to ease the
analysis of the original source code and the resulting code. I'm sorry I
can't provide any more information, I really don't have any grasp of gcc's
internals.

Best regards


~buildroot/output/build/beecrypt-4.2.1 (bug-microblaze)$ cat
minimal-preprocessed.c
# 1 "minimal.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "minimal.c"
typedef unsigned long long int uint64_t;
# 3 "minimal.c"
/*
#define ROTR64(x, s) (((x) >> (s)) | ((x) << (64 - (s))))

#define S(x,s) ROTR64(x, s)
#define CH(x,y,z) ((x&(y^z))^z)
#define MAJ(x,y,z) (((x|y)&z)|(x&y))
#define SIG0(x) (S(x,28) ^ S(x,34) ^ S(x,39))
#define SIG1(x) (S(x,14) ^ S(x,18) ^ S(x,41))

#define ROUND(a,b,c,d,e,f,g,h,w,k)    \
    temp = h + SIG1(e) + CH(e,f,g) + k + w;    \
    h = temp + SIG0(a) + MAJ(a,b,c);    \
    d += temp
*/
# 16 "minimal.c"
void sha384Process(uint64_t *hh)
{
 uint64_t a, b, c, d, e, f, g, h, temp;
 uint64_t *w;
 const uint64_t *k;
 unsigned char t;

 /* Expansion of ROUND(f,g,h,a,b,c,d,e,w[75],k[75]); */
 temp = e + ((((b) >> (14)) | ((b) << (64 - (14)))) ^ (((b) >> (18)) | ((b)
<< (64 - (18)))) ^ (((b) >> (41)) | ((b) << (64 - (41))))) + ((b&(c^d))^d)
+ k[75] + w[75];
 e = temp + ((((f) >> (28)) | ((f) << (64 - (28)))) ^ (((f) >> (34)) | ((f)
<< (64 - (34)))) ^ (((f) >> (39)) | ((f) << (64 - (39))))) +
(((f|g)&h)|(f&g));
 a += temp;

 /* Expansion of ROUND(e,f,g,h,a,b,c,d,w[76],k[76]); */
 temp = d + ((((a) >> (14)) | ((a) << (64 - (14)))) ^ (((a) >> (18)) | ((a)
<< (64 - (18)))) ^ (((a) >> (41)) | ((a) << (64 - (41))))) + ((a&(b^c))^c)
+ k[76] + w[76];
 d = temp + ((((e) >> (28)) | ((e) << (64 - (28)))) ^ (((e) >> (34)) | ((e)
<< (64 - (34)))) ^ (((e) >> (39)) | ((e) << (64 - (39))))) +
(((e|f)&g)|(e&f));
 h += temp;

 /* Expansion of ROUND(d,e,f,g,h,a,b,c,w[77],k[77]); */
 temp = c + ((((h) >> (14)) | ((h) << (64 - (14)))) ^ (((h) >> (18)) | ((h)
<< (64 - (18)))) ^ (((h) >> (41)) | ((h) << (64 - (41))))) + ((h&(a^b))^b)
+ k[77] + w[77];
 c = temp + ((((d) >> (28)) | ((d) << (64 - (28)))) ^ (((d) >> (34)) | ((d)
<< (64 - (34)))) ^ (((d) >> (39)) | ((d) << (64 - (39))))) +
(((d|e)&f)|(d&e));
 g += temp;

 /* Expansion of ROUND(c,d,e,f,g,h,a,b,w[78],k[78]); */
 temp = b + ((((g) >> (14)) | ((g) << (64 - (14)))) ^ (((g) >> (18)) | ((g)
<< (64 - (18)))) ^ (((g) >> (41)) | ((g) << (64 - (41))))) + ((g&(h^a))^a)
+ k[78] + w[78];
 b = temp + ((((c) >> (28)) | ((c) << (64 - (28)))) ^ (((c) >> (34)) | ((c)
<< (64 - (34)))) ^ (((c) >> (39)) | ((c) << (64 - (39))))) +
(((c|d)&e)|(c&d));
 f += temp;

 hh[0] += a;
 hh[1] += b;
 hh[2] += c;
 hh[3] += d;
 hh[4] += e;
 hh[5] += f;
 hh[6] += g;
 hh[7] += h;
}


~buildroot/output/build/beecrypt-4.2.1 (bug-microblaze)$
../../host/usr/bin/microblazeel-unknown-linux-gnu-gcc  -Os -c
minimal-preprocessed.c
minimal.c: In function 'sha384Process':
minimal.c:51:1: internal compiler error: in reload,@reload1.c:1059
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.







2013/10/6 Alvaro Gamez <alvaro.gamez@hazent.com>

> Hi Thomas, hi all!
>
> The last three errors seem to be the same. It's apparently triggered by a
> loop in which several macros are called one after the other, repeatedly.
>
> Although I don't know much (nothing, really) about gcc, I also think it's
> a compiler bug, so maybe the best way of action is, as you said, supporting
> Microblaze directly on the internal toolchain, without relaying on Xilinx's.
>
> Looking a bit on files reload1.c and emit-rtl.c, I can only tell it's got
> something to do with pseudo registers, which I don't know what they are,
> but maybe that gives someone an idea of what the problem is.
>
> Anyway, I'll try to replicate the issue on the next few days and will try
> to at least make a minimal (and preprocessed) code example, just in case we
> want to continue using Xilinx's toolchain and we can patch some code to
> workaround that or provide a more extensive bug report to Xilinx.
>
> Regards
>
>
> 2013/10/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>> Jan, Chris, Alvaro, Spenser,
>>
>> You are amongst the four persons who contributed Microblaze related
>> changes to Buildroot. We are currently having various build problems in
>> our autobuilders caused by the Microblaze support, and it would be nice
>> if you could help us fixing those issues and generally maintain the
>> Microblaze support in a good shape in Buildroot.
>>
>> At the moment, here are the latest autobuilder issues we have on
>> Microblaze:
>>
>>  * libglib2 fails to build
>>
>> http://autobuild.buildroot.org/results/32f/32fca009984ca0de4b4026ff6b4029104d0396c5/build-end.log
>>
>>    undefined reference to `__sync_fetch_and_or_4'
>>
>>    probably caused by the compiler not providing the right intrinsics,
>>    or libglib2 not falling back to other solutions when  the intrinsics
>>    are not available.
>>
>>  * nettle fails to build
>>
>> http://autobuild.buildroot.org/results/20b/20b2e2573985a687be29220a7df3b11a32894ba2/build-end.log
>>
>>    sha512-compress.c: In function '_nettle_sha512_compress':
>>    sha512-compress.c:180:1: internal compiler error: in reload, at
>> reload1.c:1059
>>    Please submit a full bug report,
>>
>>    compiler bug, apparently.
>>
>>  * openssl fails to build
>>
>> http://autobuild.buildroot.org/results/a050faaabbf89f9d3f324b821da84f8991a5aebb/build-end.log
>>
>>    sha512.c: In function 'sha512_block_data_order':
>>    sha512.c:585:2: internal compiler error: in reload, at reload1.c:1059
>>    Please submit a full bug report,
>>    with preprocessed source if appropriate.
>>
>>    looks pretty much the same compiler bug as the one triggered by the
>>    nettle build.
>>
>>  * cairo fails to build
>>
>> http://autobuild.buildroot.org/results/7054d168729c4e257000db93ab5137af1e1583cc/build-end.log
>>
>>    dragon.c: In function 'do_dragon':
>>    dragon.c:162:1: internal compiler error: in gen_reg_rtx, at
>> emit-rtl.c:862
>>    Please submit a full bug report,
>>    with preprocessed source if appropriate.
>>
>>    another compiler error.
>>
>> Maybe those problems can be solved by using another Microblaze external
>> toolchain, but I couldn't find any other available on the Web. Or maybe
>> we should remove the external Microblaze toolchains and instead support
>> Microblaze in the internal Buildroot toolchain backend?
>>
>> Thanks for your help,
>>
>> Thomas
>>
>> For reference, the last 30 Microblaze build failures were:
>>
>>
>> +---------------------+----------------------------------------------------------------------------------+-----------------+
>> | 2013-10-06 05:31:03 |
>> http://autobuild.buildroot.org/results/e570445aafab51ce497da9e0d864157f50ff75d7/| libglib2-2.36.3 |
>> | 2013-10-05 22:37:36 |
>> http://autobuild.buildroot.org/results/20b2e2573985a687be29220a7df3b11a32894ba2/| nettle-2.7.1    |
>> | 2013-10-05 21:59:39 |
>> http://autobuild.buildroot.org/results/32fca009984ca0de4b4026ff6b4029104d0396c5/| libglib2-2.36.3 |
>> | 2013-10-05 19:32:44 |
>> http://autobuild.buildroot.org/results/166ab2a8c2efffa0b518f07d7f1dcdfe8c85614f/| nettle-2.7.1    |
>> | 2013-10-05 17:39:45 |
>> http://autobuild.buildroot.org/results/4ec0f495f4ff77bb35e7b1ab8446671c8d260cd6/| libglib2-2.36.3 |
>> | 2013-10-05 09:44:38 |
>> http://autobuild.buildroot.org/results/ce1c9a2ca389c2fb1c8955c75212737c7d57a803/| cairo-1.12.10   |
>> | 2013-10-05 07:21:48 |
>> http://autobuild.buildroot.org/results/b1d6d56d2c8bcd3df47e2685ed8e7de8742a7c73/| nettle-2.7.1    |
>> | 2013-10-05 01:45:57 |
>> http://autobuild.buildroot.org/results/a050faaabbf89f9d3f324b821da84f8991a5aebb/| openssl-1.0.1e  |
>> | 2013-10-04 23:20:14 |
>> http://autobuild.buildroot.org/results/ac8992a75b97f0baab55fe6e93ed0a8eeca08bcf/| openssl-1.0.1e  |
>> | 2013-10-04 18:15:46 |
>> http://autobuild.buildroot.org/results/80a0d575d2afac933c8cb2fb596a0347c50e4912/| libglib2-2.36.3 |
>> | 2013-10-04 15:36:19 |
>> http://autobuild.buildroot.org/results/9a3027a69dac63b4e621529eff18035530796e7e/| nettle-2.7.1    |
>> | 2013-10-04 12:14:21 |
>> http://autobuild.buildroot.org/results/4611c835d904fb5728ae5531bcc41ed33e1f5de6/| nettle-2.7.1    |
>> | 2013-10-04 10:34:37 |
>> http://autobuild.buildroot.org/results/c1332dd02817e25ab8ecd0ceab8c4953b65c9f50/| pcsc-lite-1.8.6 |
>> | 2013-10-04 09:39:00 |
>> http://autobuild.buildroot.org/results/517e2754256d39864d38befeeccd54c153e28971/| libglib2-2.36.3 |
>> | 2013-10-03 14:04:25 |
>> http://autobuild.buildroot.org/results/7054d168729c4e257000db93ab5137af1e1583cc/| cairo-1.12.10   |
>> | 2013-10-02 05:50:46 |
>> http://autobuild.buildroot.org/results/0a26b484f1cc01d6c150f6f855b2b8c7b03d585b/| libglib2-2.36.3 |
>> | 2013-10-02 00:53:35 |
>> http://autobuild.buildroot.org/results/2b10358b3540f9a12fc777bc37afbfb6072d2a47/| binutils-2.21   |
>> | 2013-10-01 22:25:57 |
>> http://autobuild.buildroot.org/results/5f691a60ffed41f0f4099179a07d7fc6c0251823/| openssl-1.0.1e  |
>> | 2013-10-01 19:14:35 |
>> http://autobuild.buildroot.org/results/d9115507421d121b0c317a2d1b52ef33199e913f/| libglib2-2.36.3 |
>> | 2013-10-01 11:35:25 |
>> http://autobuild.buildroot.org/results/0ad3e345fe1a9666bc18562549621aa28987b846/| libglib2-2.36.3 |
>> | 2013-10-01 06:48:37 |
>> http://autobuild.buildroot.org/results/1a373593d5f9d55f2e7e9113ecdb4adb8e6baaa7/| libglib2-2.36.3 |
>> | 2013-09-30 18:09:09 |
>> http://autobuild.buildroot.org/results/a44af8dee49fea322824f99da31b82c828728476/| libglib2-2.36.3 |
>> | 2013-09-30 11:54:37 |
>> http://autobuild.buildroot.org/results/74284d1087fc5677787882681c7f38a8f19e4402/| openssl-1.0.1e  |
>> | 2013-09-29 14:55:24 |
>> http://autobuild.buildroot.org/results/af53648189dd9ea40ea20d3e173e6ff391d73279/| nettle-2.7.1    |
>> | 2013-09-29 13:47:53 |
>> http://autobuild.buildroot.org/results/7cb55407f7f3e156cc04fd66da284a6c4178c776/| libglib2-2.36.3 |
>> | 2013-09-29 12:54:59 |
>> http://autobuild.buildroot.org/results/5031115f6e2c8e6c32309bab3d982b9e55e69fc3/| libglib2-2.36.3 |
>> | 2013-09-29 10:57:54 |
>> http://autobuild.buildroot.org/results/f12f692a4cf24e93d71f511362704e57766e2127/| libglib2-2.36.3 |
>> | 2013-09-29 07:56:39 |
>> http://autobuild.buildroot.org/results/c486ba7eebd2bbbef69b3a68323e0329cc65f79d/| openssl-1.0.1e  |
>> | 2013-09-29 07:31:02 |
>> http://autobuild.buildroot.org/results/f0dd5afd1e49e967d60c7ec7e62a924942e9a3ea/| libglib2-2.36.3 |
>> | 2013-09-29 00:39:25 |
>> http://autobuild.buildroot.org/results/767177028f4d0b53a3b9898f293526b234394463/| libglib2-2.36.3 |
>>
>> +---------------------+----------------------------------------------------------------------------------+-----------------+
>>
>> --
>> Thomas Petazzoni, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
>
> --
> ?lvaro G?mez Machado
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131120/2c6a76f8/attachment-0001.html>
