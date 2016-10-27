From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Oct 2016 16:34:31 +0100
Subject: [Buildroot] [git commit] core/pkg-generic: check proper package
 installation
In-Reply-To: <aff3ba7e-ee68-81da-0d42-8a85fee5159f@imgtec.com>
References: <20161026203713.9732A7FD9B@busybox.osuosl.org>
 <878ttajief.fsf@dell.be.48ers.dk>
 <20161027104658.6edfaae3@free-electrons.com>
 <87mvhqi30h.fsf@dell.be.48ers.dk>
 <20161027110452.6f60fcc0@free-electrons.com>
 <aff3ba7e-ee68-81da-0d42-8a85fee5159f@imgtec.com>
Message-ID: <aa1cd438-c2cf-e80a-7db5-43ad0d6a0302@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the problem:

http://patchwork.ozlabs.org/patch/687750/

Vincent

On 27/10/16 10:39, Vicente Olivert Riera wrote:
> Hello,
> 
> this patch has broken MIPS Codescape toolchains. It fails like this:
> 
>>>> toolchain-external  Extracting
> gzip -d -c
> /br/dl/Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
> | tar --strip-components=2 -C /br/output/build/toolchain-external
> --exclude='usr/lib/locale/*'   -xf -
> rm -rf /br/output/host/opt/ext-toolchain
> mkdir -p /br/output/host/opt/ext-toolchain
> mv /br/output/build/toolchain-external/* /br/output/host/opt/ext-toolchain/
>>>> toolchain-external  Patching
>>>> toolchain-external  Configuring
> Warning: Reading file '<stdin>' as free form
>>>> toolchain-external  Building
> /usr/bin/gcc -O2 -I/br/output/host/usr/include
> -DBR_CROSS_PATH_SUFFIX='""'
> -DBR_CROSS_PATH_REL='"opt/ext-toolchain/bin"' -DBR_ARCH='"mips64r6"'
> -DBR_ABI='"64"' -DBR_MIPS_TARGET_LITTLE_ENDIAN
> -DBR_SYSROOT='"usr/mips64el-buildroot-linux-gnu/sysroot"'
> -DBR_ADDITIONAL_CFLAGS='' -s -Wl,--hash-style=both
> toolchain/toolchain-wrapper.c -o
> /br/output/build/toolchain-external/toolchain-wrapper
>>>> toolchain-external  Installing to staging directory
> /usr/bin/install -D -m 0755
> /br/output/build/toolchain-external/toolchain-wrapper
> /br/output/host/usr/bin/toolchain-wrapper
>>>> toolchain-external  Copying external toolchain sysroot to staging...
> ln: target
> ?/br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot//br/output/host/opt/ext-toolchain/sysroot/mipsel-r6-hard/?
> is not a directory: No such file or directory
> Symlinking
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot//br/output/host/opt/ext-toolchain/sysroot/mipsel-r6-hard/
> -> ./../../../../../../../../../../../../
>>>> toolchain-external  Installing gdbinit
> rmdir /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/bin
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/sbin
> ln -sf bin-n64
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/bin
> ln -sf sbin-n64
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/sbin
>>>> toolchain-external  Fixing libtool files
> toolchain-external: installs files in
> /br/output/host/usr/mips64el-buildroot-linux-gnu/sysroot//br/output
> package/pkg-generic.mk:255: recipe for target
> '/br/output/build/toolchain-external/.stamp_staging_installed' failed
> make: *** [/br/output/build/toolchain-external/.stamp_staging_installed]
> Error 1
> 
> I have done a git bisect and I've found that this is the first bad
> commit. If I checkout to the previous commit it works fine as before.
> 
> I haven't done an in-depth investigation about why is actually
> happening, but my knowledge on pkg-generic.mk (the file patched by this
> commit) is not very advanced to be honest.
> 
> Could you please have a look as well?
> 
> Thanks in advance,
> 
> Vincent
> 
> On 27/10/16 10:04, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 27 Oct 2016 10:56:30 +0200, Peter Korsgaard wrote:
>>
>>>  > And Yann's patch has already uncovered an issue with the Bellagio
>>>  > package.  
>>>
>>> Ok, fine by me. I just wondered as the patch had comments and you afaik
>>> applied it without any notification.
>>
>> Yes, I should have replied to your comments after applying the patch,
>> sorry about that. To me, it felt like Yann's patch was useful today,
>> and was ready to be merged. It doesn't prevent from doing something
>> more general/better a later on, but when that "later" on is potentially
>> quite far in the future (Samuel's series on rpath has been around for a
>> very very long time), Yann's patch was a good thing to have right now.
>>
>> Thomas
>>
