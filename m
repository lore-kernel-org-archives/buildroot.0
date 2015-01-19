From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 19 Jan 2015 23:47:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/libftdi: fix libftdi.pc
In-Reply-To: <20150113141549.4737488b@free-electrons.com>
References: <1421097965-15600-1-git-send-email-s.martin49@gmail.com>
 <1421097965-15600-2-git-send-email-s.martin49@gmail.com>
 <20150113141549.4737488b@free-electrons.com>
Message-ID: <CAHXCMMJHH-v+sxv+P62hT4Us8DSXha7Q40Lp32QVGjhWfTi8UQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Tue, Jan 13, 2015 at 2:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Mon, 12 Jan 2015 22:26:05 +0100, Samuel Martin wrote:
>
>> +diff --git a/libftdi.pc.in b/libftdi.pc.in
>> +index 2061b91..95eb491 100644
>> +--- a/libftdi.pc.in
>> ++++ b/libftdi.pc.in
>> +@@ -6,6 +6,7 @@ includedir=@includedir@
>> + Name: libftdi
>> + Description: Library to program and control the FTDI USB controller
>> + Requires:
>> ++Requires.private: libusb
>> + Version: @VERSION@
>> + Libs: -L${libdir} -lftdi -lusb
>> + Cflags: -I${includedir}
>
> Are you sure this is the right fix? I believe the right fix is rather:
>
> -Requires:
> +Requires: libusb
> ...
> -Libs: -L${libdir} -lftdi -lusb
> +Libs: -L${libdir} -lftdi
>
> This properly declares the fact that libftdi requires libusb. And
> libusb.pc already has the appropriate Requires.private field on
> libusb-1.0. With this change, you get what I believe is the correct
> behavior:
>
> When linking dynamically, we're only linked against -lusb (i.e the
> libusb-compat library) :
>
> $ ./output/host/usr/bin/pkg-config --libs libftdi
> -lftdi -L/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lusb
>
> When linking statically, we correct get both -lusb and -lusb-1.0:
>
> $ ./output/host/usr/bin/pkg-config --static --libs libftdi
> -lftdi -lusb -L/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lusb-1.0 -pthread
>
> This is more or less what was done upstream at
> http://developer.intra2net.com/git/?p=libftdi;a=commitdiff;h=ac5790a7af9ffb45c00bde056b308643cd52537e,
> though this commit was after they switched to libusb instead of
> libusb-compat.

Right, it is a much better fix. I'll respin shortly.

Regards,

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
