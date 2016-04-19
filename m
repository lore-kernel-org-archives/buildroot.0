From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 19 Apr 2016 14:15:10 -0400
Subject: [Buildroot] Lightweight method for handling external power-down
	request
Message-ID: <CAF_dkJCO5r0Se08Pr6pAv=u-esPSFMR68V01=DHLSeHn0q2oTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I found this discussion:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-April/339919.html

on the Linux Arm Kernel mailing list archive.  It is from April of
2015.  Sannon Zhao started a discussion regarding how to implement
external power down for ARM.  The consensus seemed to be to use ACPI.
I am wondering if there is a lighter weight (smaller code and
mindshare footprint) method for handling this.

I would like to initiate an orderly shutdown of my buildroot based
system when a GPIO signal is toggled high.  I think could add
something like the following to my device tree:

    gpio-keys {
        compatible = "gpio-keys";
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_gpio_poweroff>;
        power {
                label = "Power-Key";
            gpios = <&pioA 103 GPIO_ACTIVE_HIGH>;
            linux,code = <KEY_POWER>;
            debounce-interval = <10>;
        };
    };

and I believe that would result in a KEY_POWER event(?)/input key(?)
getting delivered to user-land.  But I am not sure how to handle that
in user-land.  So it seems that I could install acpid to handle that
somehow, but I feel this is getting more complicated than it should
be.

Alternatively, I could code up a shell script that polls my GPIO pin
and shuts down the processor when that signal goes high, but I hate
the idea of polling; I'm not thrilled about the lack of debounce
support; and I would much rather respond to the event immediately,
than have to wait the 500 to 1000ms I might have to wait for my
polling process to notice the signal.

So, how do ARM folks in Buildroot-land handle this?

--wpd
