From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 3 Mar 2016 08:01:24 -0300
Subject: [Buildroot] usb_modeswitch issues
In-Reply-To: <CAGm1_ktE6wRSd=g7DAtwN_S5+6kg64px0J62Sh3vPKiHxSngxg@mail.gmail.com>
References: <CAGm1_ktE6wRSd=g7DAtwN_S5+6kg64px0J62Sh3vPKiHxSngxg@mail.gmail.com>
Message-ID: <56D81984.6030300@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/16 06:49, Yegor Yefremov wrote:

> Hi Gustavo, all,
>
> I experience strange Segmentation faults with usb_modeswitch 2.3.0
> (didn't really used if earlier, so I know nothing about earlier
> versions):
>
> http://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?f=4&t=2489&p=16378#p16378
>
> Do you understand, what LOM means saying:
>
> "You have forgotten to build the wrapper (usb_modeswitch.tcl)"
>
> I've looked at usb_modeswitch Makefile and I cannot see
> usb_modeswitch.tcl in install target.
>
> Yegor

Hi Yegor.
There are a couple of usage forms for it, namely manual (you call 
usb_modeswitch with the appropiate parameters) or automatic (via udev 
provider).
Assuming you're using the second option, which is where the dispatcher 
is used, there's a rule installed in /lib/udev/usb_modeswitch that's in 
charge of calling the dispatcher (/usr/sbin/usb_modeswitch_dispatcher).
usb_modeswitch_dispatcher is built based on 
usb_modeswitch_dispatcher.tcl based on two options - if you've got tcl 
on your target it will be a tcl script with the appropiate shebang, or 
otherwise it will create a binary based on the bundled jimtcl if not.
So if you have /usr/sbin/usb_modeswitch_dispatcher (which should be) 
then things are failing for some other reason.
If you don't have tcl you can switch to it to see if jimtcl is breaking 
things.
I normally use this on armv5 without issues, however i don't have an 
mbim modem so YMMV.
Regards.
