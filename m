From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 17 Mar 2012 08:18:51 +0100
Subject: [Buildroot] [PATCH 2/2] vsftpd: fix SSL dependency
In-Reply-To: <87r4wsp7dl.fsf@macbook.be.48ers.dk>
References: <1331906095-18056-1-git-send-email-yegorslists@googlemail.com>
 <1331906095-18056-2-git-send-email-yegorslists@googlemail.com>
 <87r4wsp7dl.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_kv4_CfMehyG4Y65A+YGxeVg8w7mcrGaf9jwRybrqEBAfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 16, 2012 at 10:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "yegorslists" == yegorslists ?<yegorslists@googlemail.com> writes:
>
> ?yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
> ?yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Can you be a bit more specific about what this fixes? I just did a test
> with the default BR (arm926t) toolchain and it works here without it:
>
> /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -o vsftpd
> main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o tunables.o
> ftpdataio.o secbuf.o ls.o postprivparent.o logging.o str.o netstr.o
> sysstr.o strlist.o banner.o filestr.o parseconf.o secutil.o ascii.o
> oneprocess.o twoprocess.o privops.o standalone.o hash.o tcpwrap.o
> ipaddrparse.o access.o features.o readwrite.o opts.o ssl.o sslslave.o
> ptracesandbox.o ftppolicy.o sysutil.o sysdeputil.o -Wl,-s -lcrypt -lssl
>
> ..
>
> ./output/host/usr/bin/arm-linux-readelf -a output/build/vsftpd-2.3.5/vsftpd |grep NEEDED
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libcrypt.so.0]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libssl.so.1.0.0]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libc.so.0]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libcrypto.so.1.0.0]
>
> So it end up with the libcrypto reference without explicitly linking
> with it.

This is output from pkg-config:

pkg-config --libs openssl
-lssl -lcrypto

I don't know what is going on exactly, but could it be that other
toolchains bring valid lcrypto with them?
But vsftpd has it's own library finder script and it also defines both libs.

Yegor
