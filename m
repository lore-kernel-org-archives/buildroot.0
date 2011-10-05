From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 5 Oct 2011 08:20:15 +0200
Subject: [Buildroot] [PATCH 2/9] toolchain-external: allow specifying
 extra external libraries
In-Reply-To: <201110042336.44134.yann.morin.1998@anciens.enib.fr>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <201110022345.08800.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LXA6zU1Y7vXEwh1_h=x_jRz1q0f_nA+21u6H9JcVWhJoQ@mail.gmail.com>
 <201110042336.44134.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAXf6LUNU-py6LTR+XT56if46km_cOb6Vm_1Mg5P_O6HhpyVrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tue, Oct 4, 2011 at 11:36 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas?, All,
>
> On Monday 03 October 2011 09:21:59 Thomas De Schampheleire wrote:
>> On Sun, Oct 2, 2011 at 11:45 PM, Yann E. MORIN
>> <yann.morin.1998@anciens.enib.fr> wrote:
>> > On Sunday 02 October 2011 21:20:10 Thomas Petazzoni wrote:
>> >> From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
>> >>
>> >> Custom toolchains may provide extra libraries that need to be copied to the
>> >> target. This patch adds a configuration option for this.
>> >
>> > What kind of libraries are we talking about here? Things such as libz.so,
>> > or like libnss_*.so ?
> [--SNIP--]
>> > So, I'm not really sure we should allow that without further explanations.
>> > (and there was no more in Thomas' original post on the suject...)
>
>> uClibc supports the 'backtrace' functionality. I'm not sure whether it
>> already is in 0.9.32,
>
> Yes, it is.
>
>> but it certainly is in the repository. When you
>> enable the functionality in the uClibc configuration, a library
>> libubacktrace.so is generated. Application code that uses the
>> backtrace() or backtrace_symbols() functions, need to link with this
>> library and thus it needs to be copied from the toolchain.
>
> If an application is linked against libubactrace, then it should have a
> NEEDED entry for it, no? Or is it dlopen-ed on-demand?

I can confirm that there is an appropriate NEEDED entry in the application.

>
> That's what I find odd with how buildroot populates the rootfs. It has
> a somewhat-hard-coded list of libraries to copy. That list is lamost
> unconditionally constructed.
>
> The proper way to handle this would be to scan all the executables aferward,
> looking at the DT_NEEDED flag in the ELF header, and copying the missing
> libraries.
>
> Of course, this is tricky, because of the way buildroot handles the sysroot.
> Every time the compiler is called, the sysroot is overloaded to point to the
> staging area. This totaly highjacks the purpose of the sysroot.
>
> In that case, there is no need to pre-populate the rootfs with the libraries
> from the sysroot, it should be done only at the end.

Note that this step would need to be done at each 'make' execution, to
cater for external applications that were copied to the rootfs
manually (which is precisely my case).

>
> For example., that's what the 'populate' script in crosstool-NG is for:
> create a copy of the rootfs, and scan the sysroot for missing libraries.
>
>> The appropriate header is located next to the other toolchain headers,
>> which are already copied by default:
>> usr/powerpc-linux/sysroot/usr/include/execinfo.h
>
> Yes, because it is a system library, so it is copied as part of the initial
> staging filling.
>
>> Depending on the uClibc configuration, less or more libraries may need
>> to be copied. I can imagine that a similar thing is needed for other C
>> libraries. Hence this generic option I added.
>>
>> Given this background information, how do you feel about this patch?
>
> Sadly, this has to go in for now. I'll be creating a new thread with an
> alternate proposal, but it will require a bit more work, so I'll Ack
> this for now.

Ok. Thanks for your ack.

> Currently, this hack applies only to custom external toolchain, because
> none of the "automatic" external toolchain currently bundles uClibc-0.9.32.

I think this would be stated more correctly as:
"... because none of the automatic external toolchains currently add
libraries that are not present in the explicit LIB_EXTERNAL_LIB /
USR_LIB_EXTERNAL_LIB variables."


Best regards,
Thomas
