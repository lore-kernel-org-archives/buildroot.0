From: Dan Raymond <draymond@foxvalley.net>
Date: Tue, 9 Mar 2021 19:16:09 -0700
Subject: [Buildroot] [PATCH 1/1] fix failure during 'make
 linux-menuconfig' when PATH env var has spaces
In-Reply-To: <a47fae4f-80f2-343b-72d7-39c245bfd753@foxvalley.net>
References: <16100eb6-bac8-2e4d-65f2-26333179f3b8@foxvalley.net>
 <9469affa-d61e-347a-ef52-1ce6b1a11a23@mind.be>
 <8d34f040-ac81-f000-895b-2607b5c0a018@foxvalley.net>
 <a47fae4f-80f2-343b-72d7-39c245bfd753@foxvalley.net>
Message-ID: <a6697561-0d08-5707-ab16-a380e6495464@foxvalley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/3/2021 11:18 AM, Dan Raymond wrote:
> OK, I see why we can't just set an empty path (none of the build tools 
> will be found).? I got the following to work.? You can't quote 
> $(BR_PATH) because it is already quoted and you only need one $.
>
> $(2)_CONFIGURATOR_MAKE_ENV = \
> ??? $$($(2)_MAKE_ENV) \
> ??? PATH=$(BR_PATH) \
> ??? PKG_CONFIG= \
> ??? PKG_CONFIG_SYSROOT_DIR= \
> ??? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS= \
> ??? PKG_CONFIG_ALLOW_SYSTEM_LIBS= \
> ??? PKG_CONFIG_LIBDIR= \
> ??? PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
>
> However the result is equivalent to leaving the PATH alone:
>
> $(2)_CONFIGURATOR_MAKE_ENV = \
> ??? $$($(2)_MAKE_ENV) \
> ??? PKG_CONFIG= \
> ??? PKG_CONFIG_SYSROOT_DIR= \
> ??? PKG_CONFIG_ALLOW_SYSTEM_CFLAGS= \
> ??? PKG_CONFIG_ALLOW_SYSTEM_LIBS= \
> ??? PKG_CONFIG_LIBDIR= \
> ??? PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"

My testing would imply that we don't need to strip the PATH at all 
here.? Is there someone more familiar with this area that can clarify?
