From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Apr 2015 09:35:17 -0300
Subject: [Buildroot] [RFC PATCH v2 2/5] aarch64: ilp32: handle special
	file name
In-Reply-To: <1426672192-21041-3-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1426672192-21041-3-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <5527C385.1060204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2015 06:49 AM, Zhang Jian(Bamvor) wrote:

> In aarch64 ilp32, the directory of library is libilp32 and the linker is
> ld-linux-aarch64_ilp32.so.1 or ld-linux-aarch64_be_ilp32.so.1.

There's a couple of issues here, let's see...

> +ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
> +# Leave extension for x32 on x86_64 which is libx32 instead of libx32
> +ifeq ($(BR2_aarch64), y)
> +LIB_SYMLINK = libilp32
> +endif
> +ifeq ($(BR2_aarch64_be), y)
> +LIB_SYMLINK = libilp32
> +endif
> +endif

You can simplify this:

ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
LIB_SYMLINK = libilp32
endif
endif

aarch64 & aarch64_be won't be defined at the same time so you can
condense it in a single ifeq.
Also the comment doesn't apply IMHO, there's nothing related to x86_64
here yet.
Additionally it has to be aarch64 before it can be ilp32 right? And is
"ilp32" used for any other architecture? If not you could remove the
whole aarch64 clause.

> +ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
> +LIB_EXTERNAL_LIBS += ld*.so
> +endif

Can we focus this a little bit more like it's done for ARM EABIhf
instead of just copying ld* blindly?
Otherwise the rest looks ok from a quick look/without having a toolchain
to test things.
Regards.
