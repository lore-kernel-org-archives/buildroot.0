From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 03 Apr 2014 12:50:24 -0300
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <130678126.102439.1396539806273.JavaMail.root@mail>
References: <130678126.102439.1396539806273.JavaMail.root@mail>
Message-ID: <533D8340.8060400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/2014 12:43 PM, ?meric Vigier wrote:

>> Why is AR prefix not passed to make here? Is this related to the
>> generic-package?
> 
> I believe I found part of my answer on gnu.org libc manual:
>   You may need to set AR to cross-compiling versions of ar if the native tools
>   are not configured to work with object files for the target you configured for.
> 
> $ ar --help
> [...]
> ar: supported targets: elf64-x86-64 elf32-i386 elf32-x86-64 a.out-i386-linux pei-i386 pei-x86-64 elf64-l1om elf64-k1om elf64-little elf64-big elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex
> 
> So I guess buildroot makes such a sanity check, right?

You just need to use $(TARGET_AR) the same way you're using $(TARGET_CC)
and others.
Snip:

define LIBFPGA_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
        AR="$(TARGET_AR)" -C $(@D) all
endef

Or better still what usually works...
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

Regards.
