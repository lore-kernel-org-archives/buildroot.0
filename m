From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 10 Jan 2019 10:47:48 -0600
Subject: [Buildroot] Building modules during kernel compilation
In-Reply-To: <CA+OsCCRA3tD-BkzWi28Ld5ERJkdfGr8gp7ixMg=n5mQLQdL0KQ@mail.gmail.com>
References: <CA+OsCCRA3tD-BkzWi28Ld5ERJkdfGr8gp7ixMg=n5mQLQdL0KQ@mail.gmail.com>
Message-ID: <CA+fik521Hs0Qu68viYF8kkFkOVR_h78PJizS7oU+DrPtsZbNLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lukasz,

That appears correct. i2c_register_board_info() isn't an exported
symbol (it lacks an EXPORT_SYMBOL)[1]. This makes sense, as that
function is only called at system boot to detect static I2C devices,
so can't be modprobed later. Maybe instead you can do manual probing
through sysfs[2]. And for a more permanent solution, you may want to
try using the devicetree[3].

There's some other useful documents in the kernel docs, so looking in
there may help you.
https://elixir.bootlin.com/linux/latest/source/Documentation/i2c/

For i2c driver questions you may want to try the i2c mailing list
linux-i2c at vger.kernel.org

[1] https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-boardinfo.c#L61
[2] https://elixir.bootlin.com/linux/latest/source/Documentation/i2c/instantiating-devices#L207
[3] https://elixir.bootlin.com/linux/latest/source/Documentation/i2c/instantiating-devices#L54

On Thu, Jan 10, 2019 at 5:02 AM ?ukasz Przenios?o <bremenpl@gmail.com> wrote:
>
> Hello there,
> I am new to buildroot. I am trying to develop a driver that will amke use of the I2C peripheral. So far I was compiling the module as an externally loadable one (after the buildroot was compiled already). When started to deal with I2C topics, I noticed that the i2c_register_board_info is undefined:
>
> WARNING: "i2c_register_board_info" [/home/lukasz/eclipse-workspace/PowerManagerDriver/PowerManagerDriver.ko] undefined!
>
> Asking around on stack overflow ( https://stackoverflow.com/questions/54092530/i2c-register-board-info-symbol-is-undefined ) I came to a conclusion (please correct me if wrong one) that this symbol will be visible only if I will compile my module during buildroot image compilation. This would be a bit problematic for further development, since each time I would have to reflash the image on my targets (Beaglebone black) SD card.
>
> If this is the case, could you please point me any easy to use resources on how to compile my module within buildroot compilation? The info I found was not understandable enough for me.
> I would appreciate all help.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
