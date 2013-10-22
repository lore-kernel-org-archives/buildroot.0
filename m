From: Anirudha Bose <ani07nov@gmail.com>
Date: Tue, 22 Oct 2013 06:56:02 +0530
Subject: [Buildroot] Reproducing Autobuild errors
In-Reply-To: <d7ea8853-2bca-4781-9bd7-055cbbd87696@email.android.com>
References: <CA+XvPyxsJ==djC78T2VeP=eFPHSLLfoXxbNerAYSj2i0SPaaKg@mail.gmail.com>
 <CAAXf6LX=3wjYrQvYuCNX4m7hkkR2-bQPO-bThMLRGDyRE8gJ9g@mail.gmail.com>
 <CA+XvPyyZkmrbXLW_nAn+0zw9g+oNfPg8ewoqGvf=HZ-uxX2Z2Q@mail.gmail.com>
 <d7ea8853-2bca-4781-9bd7-055cbbd87696@email.android.com>
Message-ID: <CA+XvPyxPpKp5-hOZ-aObsVvn6XD6nJhsdBQXkAXweNw4Ftu7Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 21, 2013 at 11:03 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Anirudha Bose <ani07nov@gmail.com> wrote:
> >On Mon, Oct 21, 2013 at 7:16 PM, Thomas De Schampheleire <
> >patrickdepinguin at gmail.com> wrote:
> snip
> >
> >Thanks a lot for the detailed explanation.
> >
> >I am however facing some problems getting the right toolchain. Here is
> what
> >I did:
> >
> >1. Downloaded the toolchain from
> >http://autobuild.buildroot.net/toolchains/tarballs/
> >2. Extracted it to the location
> >/home/ani/Downloads/br-powerpc-603e-basic-cpp-2013.05-1/
> >3. In the .config file I edited this:
>
> >BR2_TOOLCHAIN_EXTERNAL_PATH="/home/ani/Downloads/br-powerpc-603e-basic-cpp-2013.05-1"
> >4. make toolchain trace-cmd
> >
> >After this I get the following error:
> >
> >>>> toolchain-external undefined Configuring
> >Cannot execute cross-compiler
>
> >'/home/ani/Downloads/br-powerpc-603e-basic-cpp-2013.05-1/bin/powerpc-linux-gcc'
> >
> >I think I am using the wrong toolchain. Can you tell me what is the
> problem?
>
> Can you check whether that file is present? Can you execute it manually
> (without options)?
> One possible cause of this problem is that the toolchain is built on a
> 64bit machine and your machine is only 32 bit. In this case it is
> impossible to run the toolchain, and you'll have to rebuild it yourself (if
> you have the configuration) or try to use another toolchain (like the
> CodeSourcery ones, that are selectable in menuconfig) and hope that the
> problem is not toolchain dependent.
>

You are right. The toolchain was built on a 64-bit machine and my OS was
32-bit. Anyway, I was able to use the toolchain by switching to a 64-bit OS.
When I executed this
    ./br-powerpc-603e-basic-cpp-2013.05-1/bin/powerpc-linux-gcc -dumpmachine
I got the following output which shows that the toolchain is now usable:
    powerpc-buildroot-linux-uclibc

I run make and was presented with errors instructing me to disable the
BR2_LARGEFILE, BR2_INET_IPV6, BR2_USE_WCHAR, and
BR2_TOOLCHAIN_HAS_NATIVE_RPC since these features "do not work with the C
compiler" (why?).

After making the necessary changes in the .config file, I run make and
Buildroot produced a successful build without any issues. I suppose the
following error in trace-cmd didn't show up for me since I had some of the
options disabled. Any thoughts?
   #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
config

>
> Best regards,
> Thomas
>
>
- Anirudha
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131022/0cf86fa9/attachment.html>
