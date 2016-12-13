From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Tue, 13 Dec 2016 15:08:38 -0300
Subject: [Buildroot] ADP5588 - Platform data
Message-ID: <CAFMv-czcQedXA8nPsJgrEaZYJYg8UqW8ePO4NWB64=1BGwC=7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My board has and ADP5588 IC (it is an I2C matrix keyboard scanner).
I enabled the ADP5588 at kernel configuration.
Then I added the following section to i2c at dts file:

adp5588: keyboard at 1b {
compatible = "adp5588-keys";
reg = <0x1b>;
interrupt-parent = <&pioC>;
interrupts = <1 0x0>;
pinctrl-names = "default";
pinctrl-0 = <&pinctrl_adp5588_irq>;
wakeup-source;
};

However, at adp5588_probe() function (drivers/input/keyboard/adp5588.c), it
fails when trying to get platform data:

const struct adp5588_kpad_platform_data *pdata =
 dev_get_platdata(&client->dev);

pdata points to null.

I made a workaround by defining platform_data right there, but I don't want
to modify a driver file because of this.
I could not find a way of defining the platform data on the initialisation
board file, or better in the dts.

I see the driver is not a platform driver, so not sure
if platform_device_register() will work or not.


Any tips?
BR,
Leonardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161213/a6f2350e/attachment.html>
