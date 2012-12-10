From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Dec 2012 11:57:22 +0100
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
In-Reply-To: <50C54E15.1030008@zacarias.com.ar>
References: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7>
 <50C54E15.1030008@zacarias.com.ar>
Message-ID: <97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I am using buildroot's internal toolchain gcc 4.6.3 and uClibc 0.9.33.3
and I the pthreads library.

-----Oorspronkelijk bericht-----
Van: Gustavo Zacarias [mailto:gustavo at zacarias.com.ar] 
Verzonden: maandag 10 december 2012 3:51
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault

On 12/09/2012 08:06 PM, Sagaert Johan wrote:

> Hi
>  
> I am using the latest git pull of buildroot.
>  
> Both usb_modeswitch and lsusb fail on execute.
>  
> # lsusb
> Segmentation fault
> # usb_modeswitch
> Segmentation fault
>  
> Can sombody verify this on a real target ?
>  
> (i am using a karo tx53 module running kernel 3.4.21)
>  
> I suspect it has something to do with libusb.

Hi.
I recall a similar problem with earlier (0.9.32ish or less) versions of uClibc with NPTL, which toolchain are you using?

> Looking at the makefile of usb_modeswitch, it seems to link against 
> libusb.so It looks this is pointing to libusb-compat-0.1.4
>  
> In the source code of usb_modeswitch there is a line (1896)  saying : 
> ....based on libusb0 (0.1.12 and above ...)
>  
> So something seems to be wrong (libusb-compat-0.1.4 is the latest
> version) , should usb_modeswitch be linked to libusb-1.0.9 instead. ?
>  
> I will try to link against to the other usblib, as soon as my current 
> build finishes ...
>  
> I suspect the lsusb problem is similar

There was an older API libusb (libusb-0*) which usb_modeswitch uses, and there is a newer API libusb (libusb-1*) now.
libusb-compat is a compatibility layer to use the new one (libusb-1*) with applications that expect the old API without the need for
both.
I haven't seen any issues with it rather than the old misbehaving NPTL threading from older uClibc versions.
And you won't be able to link against libusb-1* without some source code tweaking.
Regards.
