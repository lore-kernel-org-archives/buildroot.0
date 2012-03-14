From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 20:30:58 +0100
Subject: [Buildroot] [PATCH] linux.mk: check for y explicitly
In-Reply-To: <20120314202128.5bf5ded7@skate>
References: <189747daec208a7d29d7.1331743009@beantl019720>
 <20120314202128.5bf5ded7@skate>
Message-ID: <CAAXf6LVXUJ9yLu7p6bP7J-geqF-WFQ2fjpShmLELY=L5280Vbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Wed, Mar 14, 2012 at 8:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 14 Mar 2012 17:36:49 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> LINUX_CONFIGURE_CMDS uses the construct
>> $(if $(BR2_x), ...
>> which don't work as expected when BR2_x=n.
>
> This is an invalid construct in my opinion. Unset options should look
> like:
>
> # BR2_SOMETHING is not set
>
> in the .config file.
>
> There are many other places in Buildroot which assumes that an
> unselected option has an empty value:
>
> xenomai/xenomai.mk:ifeq ($(XENOMAI_VERSION),)
> xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_SMP),y)
> xenomai/xenomai.mk:ifeq ($(BR2_HAVE_DEVFILES),)
> xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
> xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_RTCAN),)
> xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_ANALOGY),)
>
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads) ? ? ? ? \
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) ? ? ? ? ? ? ? \
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) ? ? ?\
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) ? ? ? ? ? ? ? ? ?\
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) ? \
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) ? ? ?\
> connman/connman.mk: ? ? $(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)
>
> And many, many, many more. Just grep for '(if' in the Buildroot code.
> So definitely not my Ack on this patch.

I was giving this on the command-line, but as Arnout hinted I could
give BR2_x= instead.

Although I find this behavior counter-intuitive (if you can give =y
you should be able to give =n as well) I can understand that you don't
like such changes...

Best regards,
Thomas
